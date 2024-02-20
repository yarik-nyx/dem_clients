PGDMP                      |            dem    16.1    16.1 V    -           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            .           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            /           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            0           1262    66006    dem    DATABASE     w   CREATE DATABASE dem WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE dem;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            1           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    66214    attachedproduct    TABLE     t   CREATE TABLE public.attachedproduct (
    mainproductid integer NOT NULL,
    attachedproductid integer NOT NULL
);
 #   DROP TABLE public.attachedproduct;
       public         heap    postgres    false    4            �            1259    66079    client    TABLE     �  CREATE TABLE public.client (
    id integer NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    patronymic character varying(50),
    birthday date,
    registrationdate timestamp(6) without time zone NOT NULL,
    email character varying(255),
    phone character varying(20) NOT NULL,
    gendercode character(1) NOT NULL,
    photopath character varying(1000)
);
    DROP TABLE public.client;
       public         heap    postgres    false    4            �            1259    66078    client_id_seq    SEQUENCE     �   ALTER TABLE public.client ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    221    4            �            1259    66155    clientservice    TABLE     �   CREATE TABLE public.clientservice (
    id integer NOT NULL,
    clientid integer NOT NULL,
    serviceid integer NOT NULL,
    starttime timestamp(6) without time zone NOT NULL,
    comment text
);
 !   DROP TABLE public.clientservice;
       public         heap    postgres    false    4            �            1259    66154    clientservice_id_seq    SEQUENCE     �   ALTER TABLE public.clientservice ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.clientservice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    230    4            �            1259    66202    documentbyservice    TABLE     �   CREATE TABLE public.documentbyservice (
    id integer NOT NULL,
    clientserviceid integer NOT NULL,
    documentpath character varying(1000) NOT NULL
);
 %   DROP TABLE public.documentbyservice;
       public         heap    postgres    false    4            �            1259    66201    documentbyservice_id_seq    SEQUENCE     �   ALTER TABLE public.documentbyservice ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.documentbyservice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    236    4            �            1259    66073    gender    TABLE     _   CREATE TABLE public.gender (
    code character(1) NOT NULL,
    name character varying(10)
);
    DROP TABLE public.gender;
       public         heap    postgres    false    4            �            1259    74432    lastseen    TABLE     �   CREATE TABLE public.lastseen (
    id integer NOT NULL,
    clientid integer NOT NULL,
    datetime timestamp without time zone NOT NULL
);
    DROP TABLE public.lastseen;
       public         heap    postgres    false    4            �            1259    74431    lastseen_id_seq    SEQUENCE     �   CREATE SEQUENCE public.lastseen_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.lastseen_id_seq;
       public          postgres    false    4    239            2           0    0    lastseen_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.lastseen_id_seq OWNED BY public.lastseen.id;
          public          postgres    false    238            �            1259    66055    manufacturer    TABLE     |   CREATE TABLE public.manufacturer (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    startdate date
);
     DROP TABLE public.manufacturer;
       public         heap    postgres    false    4            �            1259    66054    manufacturer_id_seq    SEQUENCE     �   ALTER TABLE public.manufacturer ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.manufacturer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216    4            �            1259    66061    product    TABLE       CREATE TABLE public.product (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    cost numeric(19,4) NOT NULL,
    description text,
    mainimagepath character varying(1000),
    isactive smallint NOT NULL,
    manufacturerid integer
);
    DROP TABLE public.product;
       public         heap    postgres    false    4            �            1259    66060    product_id_seq    SEQUENCE     �   ALTER TABLE public.product ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    4    218            �            1259    66189    productphoto    TABLE     �   CREATE TABLE public.productphoto (
    id integer NOT NULL,
    productid integer NOT NULL,
    photopath character varying(1000) NOT NULL
);
     DROP TABLE public.productphoto;
       public         heap    postgres    false    4            �            1259    66188    productphoto_id_seq    SEQUENCE     �   ALTER TABLE public.productphoto ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.productphoto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    234    4            �            1259    66173    productsale    TABLE     �   CREATE TABLE public.productsale (
    id integer NOT NULL,
    saledate timestamp(6) without time zone NOT NULL,
    productid integer NOT NULL,
    quantity integer NOT NULL,
    clientserviceid integer
);
    DROP TABLE public.productsale;
       public         heap    postgres    false    4            �            1259    66172    productsale_id_seq    SEQUENCE     �   ALTER TABLE public.productsale ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.productsale_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    4    232            �            1259    66123    service    TABLE       CREATE TABLE public.service (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    cost numeric(19,4) NOT NULL,
    durationinseconds integer NOT NULL,
    description text,
    discount double precision,
    mainimagepath character varying(1000)
);
    DROP TABLE public.service;
       public         heap    postgres    false    4            �            1259    66122    service_id_seq    SEQUENCE     �   ALTER TABLE public.service ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    226    4            �            1259    66131    servicephoto    TABLE     �   CREATE TABLE public.servicephoto (
    id integer NOT NULL,
    serviceid integer NOT NULL,
    photopath character varying(1000) NOT NULL
);
     DROP TABLE public.servicephoto;
       public         heap    postgres    false    4            �            1259    66130    servicephoto_id_seq    SEQUENCE     �   ALTER TABLE public.servicephoto ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.servicephoto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    4    228            �            1259    66102    tag    TABLE     �   CREATE TABLE public.tag (
    id integer NOT NULL,
    title character varying(30) NOT NULL,
    color character(6) NOT NULL
);
    DROP TABLE public.tag;
       public         heap    postgres    false    4            �            1259    66101 
   tag_id_seq    SEQUENCE     �   ALTER TABLE public.tag ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    4    223            �            1259    66107    tagofclient    TABLE     _   CREATE TABLE public.tagofclient (
    clientid integer NOT NULL,
    tagid integer NOT NULL
);
    DROP TABLE public.tagofclient;
       public         heap    postgres    false    4            X           2604    74435    lastseen id    DEFAULT     j   ALTER TABLE ONLY public.lastseen ALTER COLUMN id SET DEFAULT nextval('public.lastseen_id_seq'::regclass);
 :   ALTER TABLE public.lastseen ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    238    239    239            (          0    66214    attachedproduct 
   TABLE DATA           K   COPY public.attachedproduct (mainproductid, attachedproductid) FROM stdin;
    public          postgres    false    237   f                 0    66079    client 
   TABLE DATA           �   COPY public.client (id, firstname, lastname, patronymic, birthday, registrationdate, email, phone, gendercode, photopath) FROM stdin;
    public          postgres    false    221   f       !          0    66155    clientservice 
   TABLE DATA           T   COPY public.clientservice (id, clientid, serviceid, starttime, comment) FROM stdin;
    public          postgres    false    230   �y       '          0    66202    documentbyservice 
   TABLE DATA           N   COPY public.documentbyservice (id, clientserviceid, documentpath) FROM stdin;
    public          postgres    false    236   �}                 0    66073    gender 
   TABLE DATA           ,   COPY public.gender (code, name) FROM stdin;
    public          postgres    false    219   �}       *          0    74432    lastseen 
   TABLE DATA           :   COPY public.lastseen (id, clientid, datetime) FROM stdin;
    public          postgres    false    239   �}                 0    66055    manufacturer 
   TABLE DATA           ;   COPY public.manufacturer (id, name, startdate) FROM stdin;
    public          postgres    false    216   �                 0    66061    product 
   TABLE DATA           h   COPY public.product (id, title, cost, description, mainimagepath, isactive, manufacturerid) FROM stdin;
    public          postgres    false    218   )�       %          0    66189    productphoto 
   TABLE DATA           @   COPY public.productphoto (id, productid, photopath) FROM stdin;
    public          postgres    false    234   F�       #          0    66173    productsale 
   TABLE DATA           Y   COPY public.productsale (id, saledate, productid, quantity, clientserviceid) FROM stdin;
    public          postgres    false    232   c�                 0    66123    service 
   TABLE DATA           k   COPY public.service (id, title, cost, durationinseconds, description, discount, mainimagepath) FROM stdin;
    public          postgres    false    226   ��                 0    66131    servicephoto 
   TABLE DATA           @   COPY public.servicephoto (id, serviceid, photopath) FROM stdin;
    public          postgres    false    228   ?�                 0    66102    tag 
   TABLE DATA           /   COPY public.tag (id, title, color) FROM stdin;
    public          postgres    false    223   \�                 0    66107    tagofclient 
   TABLE DATA           6   COPY public.tagofclient (clientid, tagid) FROM stdin;
    public          postgres    false    224   ��       3           0    0    client_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.client_id_seq', 103, true);
          public          postgres    false    220            4           0    0    clientservice_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.clientservice_id_seq', 100, true);
          public          postgres    false    229            5           0    0    documentbyservice_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.documentbyservice_id_seq', 1, false);
          public          postgres    false    235            6           0    0    lastseen_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.lastseen_id_seq', 109, true);
          public          postgres    false    238            7           0    0    manufacturer_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.manufacturer_id_seq', 1, false);
          public          postgres    false    215            8           0    0    product_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_id_seq', 1, false);
          public          postgres    false    217            9           0    0    productphoto_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.productphoto_id_seq', 1, false);
          public          postgres    false    233            :           0    0    productsale_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.productsale_id_seq', 1, false);
          public          postgres    false    231            ;           0    0    service_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.service_id_seq', 50, true);
          public          postgres    false    225            <           0    0    servicephoto_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.servicephoto_id_seq', 1, false);
          public          postgres    false    227            =           0    0 
   tag_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('public.tag_id_seq', 3, true);
          public          postgres    false    222            r           2606    66218 $   attachedproduct attachedproduct_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.attachedproduct
    ADD CONSTRAINT attachedproduct_pkey PRIMARY KEY (mainproductid, attachedproductid);
 N   ALTER TABLE ONLY public.attachedproduct DROP CONSTRAINT attachedproduct_pkey;
       public            postgres    false    237    237            `           2606    66085    client client_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.client DROP CONSTRAINT client_pkey;
       public            postgres    false    221            j           2606    66161     clientservice clientservice_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.clientservice
    ADD CONSTRAINT clientservice_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.clientservice DROP CONSTRAINT clientservice_pkey;
       public            postgres    false    230            p           2606    66208 (   documentbyservice documentbyservice_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.documentbyservice
    ADD CONSTRAINT documentbyservice_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.documentbyservice DROP CONSTRAINT documentbyservice_pkey;
       public            postgres    false    236            ^           2606    66077    gender gender_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.gender
    ADD CONSTRAINT gender_pkey PRIMARY KEY (code);
 <   ALTER TABLE ONLY public.gender DROP CONSTRAINT gender_pkey;
       public            postgres    false    219            t           2606    74437    lastseen lastseen_pk 
   CONSTRAINT     R   ALTER TABLE ONLY public.lastseen
    ADD CONSTRAINT lastseen_pk PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.lastseen DROP CONSTRAINT lastseen_pk;
       public            postgres    false    239            Z           2606    66059    manufacturer manufacturer_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.manufacturer
    ADD CONSTRAINT manufacturer_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.manufacturer DROP CONSTRAINT manufacturer_pkey;
       public            postgres    false    216            \           2606    66067    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    218            n           2606    66195    productphoto productphoto_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.productphoto
    ADD CONSTRAINT productphoto_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.productphoto DROP CONSTRAINT productphoto_pkey;
       public            postgres    false    234            l           2606    66177    productsale productsale_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.productsale
    ADD CONSTRAINT productsale_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.productsale DROP CONSTRAINT productsale_pkey;
       public            postgres    false    232            f           2606    66129    service service_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.service DROP CONSTRAINT service_pkey;
       public            postgres    false    226            h           2606    66137    servicephoto servicephoto_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.servicephoto
    ADD CONSTRAINT servicephoto_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.servicephoto DROP CONSTRAINT servicephoto_pkey;
       public            postgres    false    228            b           2606    66106    tag tag_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.tag DROP CONSTRAINT tag_pkey;
       public            postgres    false    223            d           2606    66111    tagofclient tagofclient_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.tagofclient
    ADD CONSTRAINT tagofclient_pkey PRIMARY KEY (clientid, tagid);
 F   ALTER TABLE ONLY public.tagofclient DROP CONSTRAINT tagofclient_pkey;
       public            postgres    false    224    224            �           2606    66224 *   attachedproduct fk_attachedproduct_product    FK CONSTRAINT     �   ALTER TABLE ONLY public.attachedproduct
    ADD CONSTRAINT fk_attachedproduct_product FOREIGN KEY (mainproductid) REFERENCES public.product(id);
 T   ALTER TABLE ONLY public.attachedproduct DROP CONSTRAINT fk_attachedproduct_product;
       public          postgres    false    237    218    4700            �           2606    66219 +   attachedproduct fk_attachedproduct_product1    FK CONSTRAINT     �   ALTER TABLE ONLY public.attachedproduct
    ADD CONSTRAINT fk_attachedproduct_product1 FOREIGN KEY (attachedproductid) REFERENCES public.product(id);
 U   ALTER TABLE ONLY public.attachedproduct DROP CONSTRAINT fk_attachedproduct_product1;
       public          postgres    false    237    4700    218            v           2606    66086    client fk_client_gender    FK CONSTRAINT     |   ALTER TABLE ONLY public.client
    ADD CONSTRAINT fk_client_gender FOREIGN KEY (gendercode) REFERENCES public.gender(code);
 A   ALTER TABLE ONLY public.client DROP CONSTRAINT fk_client_gender;
       public          postgres    false    221    4702    219            z           2606    66162 %   clientservice fk_clientservice_client    FK CONSTRAINT     �   ALTER TABLE ONLY public.clientservice
    ADD CONSTRAINT fk_clientservice_client FOREIGN KEY (clientid) REFERENCES public.client(id);
 O   ALTER TABLE ONLY public.clientservice DROP CONSTRAINT fk_clientservice_client;
       public          postgres    false    4704    230    221            {           2606    66167 &   clientservice fk_clientservice_service    FK CONSTRAINT     �   ALTER TABLE ONLY public.clientservice
    ADD CONSTRAINT fk_clientservice_service FOREIGN KEY (serviceid) REFERENCES public.service(id);
 P   ALTER TABLE ONLY public.clientservice DROP CONSTRAINT fk_clientservice_service;
       public          postgres    false    230    4710    226                       2606    66209 4   documentbyservice fk_documentbyservice_clientservice    FK CONSTRAINT     �   ALTER TABLE ONLY public.documentbyservice
    ADD CONSTRAINT fk_documentbyservice_clientservice FOREIGN KEY (clientserviceid) REFERENCES public.clientservice(id);
 ^   ALTER TABLE ONLY public.documentbyservice DROP CONSTRAINT fk_documentbyservice_clientservice;
       public          postgres    false    4714    236    230            u           2606    66068    product fk_product_manufacturer    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk_product_manufacturer FOREIGN KEY (manufacturerid) REFERENCES public.manufacturer(id);
 I   ALTER TABLE ONLY public.product DROP CONSTRAINT fk_product_manufacturer;
       public          postgres    false    216    218    4698            ~           2606    66196 $   productphoto fk_productphoto_product    FK CONSTRAINT     �   ALTER TABLE ONLY public.productphoto
    ADD CONSTRAINT fk_productphoto_product FOREIGN KEY (productid) REFERENCES public.product(id);
 N   ALTER TABLE ONLY public.productphoto DROP CONSTRAINT fk_productphoto_product;
       public          postgres    false    4700    234    218            |           2606    66183 (   productsale fk_productsale_clientservice    FK CONSTRAINT     �   ALTER TABLE ONLY public.productsale
    ADD CONSTRAINT fk_productsale_clientservice FOREIGN KEY (clientserviceid) REFERENCES public.clientservice(id);
 R   ALTER TABLE ONLY public.productsale DROP CONSTRAINT fk_productsale_clientservice;
       public          postgres    false    230    4714    232            }           2606    66178 "   productsale fk_productsale_product    FK CONSTRAINT     �   ALTER TABLE ONLY public.productsale
    ADD CONSTRAINT fk_productsale_product FOREIGN KEY (productid) REFERENCES public.product(id);
 L   ALTER TABLE ONLY public.productsale DROP CONSTRAINT fk_productsale_product;
       public          postgres    false    232    4700    218            y           2606    66138 $   servicephoto fk_servicephoto_service    FK CONSTRAINT     �   ALTER TABLE ONLY public.servicephoto
    ADD CONSTRAINT fk_servicephoto_service FOREIGN KEY (serviceid) REFERENCES public.service(id);
 N   ALTER TABLE ONLY public.servicephoto DROP CONSTRAINT fk_servicephoto_service;
       public          postgres    false    228    226    4710            w           2606    66112 !   tagofclient fk_tagofclient_client    FK CONSTRAINT     �   ALTER TABLE ONLY public.tagofclient
    ADD CONSTRAINT fk_tagofclient_client FOREIGN KEY (clientid) REFERENCES public.client(id);
 K   ALTER TABLE ONLY public.tagofclient DROP CONSTRAINT fk_tagofclient_client;
       public          postgres    false    4704    221    224            x           2606    66117    tagofclient fk_tagofclient_tag    FK CONSTRAINT     y   ALTER TABLE ONLY public.tagofclient
    ADD CONSTRAINT fk_tagofclient_tag FOREIGN KEY (tagid) REFERENCES public.tag(id);
 H   ALTER TABLE ONLY public.tagofclient DROP CONSTRAINT fk_tagofclient_tag;
       public          postgres    false    224    223    4706            �           2606    74438    lastseen lastseen_client_fk    FK CONSTRAINT     |   ALTER TABLE ONLY public.lastseen
    ADD CONSTRAINT lastseen_client_fk FOREIGN KEY (clientid) REFERENCES public.client(id);
 E   ALTER TABLE ONLY public.lastseen DROP CONSTRAINT lastseen_client_fk;
       public          postgres    false    239    4704    221            (      x������ � �            x��[�r�F�]�_�ec5��D�J�ހU�"Ȫ���-�cO�ݶ�v��vۖ{zb6�.�Z�(��U4�� 2�'B��H)��}�{�w��������
~�ܽ޽�]����?�]���~z�{��~�dw���@XS��L�� �|��B�ʲ�_����x��3j�j�����n��Y��D�"Uej���� ?��Y=Y�W�;/o��M�)v� ���>����'��w_��~>�}���Td���T�i^�@7�z1�,�̫�m s`~�創2�"���}I���>��z>����x�X�9������-�̤���2���0��GG�r|ҽF��(�Lɴ���lA(������h�"y��������B��GcB�;4��Ь����dvxgu8���Q��ɤ+�ejb��nt�� ��?x�������X? ���Jћ�;�������UU3kM%�D*���y+'X�"+m}8�/���~⾁+��D��Е�= g��f��ؽ;Y��7��FeVI�t
�Jt��Ѱ��[l����z��t�?���Z&�r�	�}黭�5�fq�ZwyTh�)X����2�M#2����0|v��� �G��^_t?��~q{�%��1&I<e�f�wO�ޞ�>[L�1TF���S�Ǿ���á�×`p����:O�C�Q�x��5�?����܏[�2�Z� �CHC��ޢ�və��l�pc���eXH�������UU���ڌ�7�yUw�L�%2/R��⼶�΢�109�dl�K
���Re��,��������yU-�~�)�D��b���j��`�<��p�c��ݣ۾ҶМ�
�F�;P22�c��f1y��Eu�4�G��EbMNF��������o���D؀~��rS��ɬ�Is����hYݙ�w'�U ���v1D��@�	�|A�q0C�Ť��yȍ�q E��nE@�Zѭy5���8l���P���(WY$>x	�rWz��v�������쩾�6���iN� �YbK�Z��f0��.��5<Ea��o|E?���;ˠ����=� '���d�p�\eI�R�TG����/�G�<��ÉF%��sWi)��s�H���㺚�7��8(@r\�j�7��GL �g��?o#��ŮK9����S�=��Vg����7�.�DKA��22����\�&�����f���8�D.�1j|>���M��8�m�HU�H\�@Y�y�e��9�e���?���[;{�0|��{G��x�Y�s(�"-sh�Q��Q�,�R�����|�]�:�Kw�H�il�����3����6���M��[5[̽����}�Z1}
Fy������6�?֛Ѫ��EgyM�,��������R��\j�a�g���*wd����P�u$<����!�,F�I�
q�"��U��d����}�ƱB�u-�"V�ƍ���!ϱA�A��˭2G��$^�����~_^�|�njLn0�	�oL���8�R�5wК�<�����oB�s @�S��P��a��0�p0�\�UϚn.",J�DĂ2��.�*�2Wl�O��҅�g�TXm�٤2�k��u��ՋI�>B&?��T�����Q�eqy����9�Fp��R9� ��z�\B��& ]꤄��c�-\&����S��:��,6<���9y���i�\���]+�)��Ǭ���ҏ,�1��+�Po(f�>�������nZ�E��~���贞�O&�b8J
�()S�x��i'����_a�l�<D���p7�g�`��3����K�n�)7a��X �s��X�7H��~����誜���hQ�s�)��b�a��!s.�.���1D��\�	HWi���!�2�<��������(�L
H=��*F!�1���=����@��Z�뀲����9��s\/���i�C�*1@�
����9s(�p`�j�t��#�O�R1Ѿ9<����g:H�\I� @�Z,-.�R�|�=f�@��\=]�@�4�ˮ�}pzX�0��~��J
dM��-��_���'����Y縁�t����:]O�c`)�h�l�=398F�����4�`�Ay;ٷ�7���r}�-��2�
����T$�8%���(��ϖe������I���H��Y�:n.��T��+��F���G���6$[7��X����m�Ld�;��t��ac	�������*#���� ~3���� ��'y?T��ͪ��<�-�yN:a,�p+(rqhlc�ة^��*�]���� RLis�*��M�����U� |E��ɷ0H�W�v,4q�w#м#3�y�H1�b7������(Ԏ�ҳt��|)g�rUϛ�Ű�B�$���d1g�%�u/q|�2rOg�"��r�K�4s�-���r��d�*?�I
H��J�#/�ڢ4��Wm�y����\ztŅmAz\ޅJ0����Յ�B@��H�"���Ns0A��Z���cN�B-��FB�Iu���΋�Lr[���@�v0�zQ����o��^C�����K�y=[��'w�c�6�
m3��	��UIN��{L��=��SK����ϒ8���g���f���J�����.fd�A��!� �?�؉�~0�H^:U�P��Q,��rR/+/Wm^��OT�l$�9f������A`�y����P���
�������j�
R+��
�˱��s�j���s��>�g��\�B�X�'c���7�����鲺{�G�L&�嬈�p���_� �� o�J���;�_�j��Y֣��j=`g��I��RA���	TԿ ����~qsݮUZ��@;^$B�o2�bV���k�����u(T��^�$���ˑ���)]�(�UBu�>����p�IQ���$��c�kh��j��?;���	��2(����n��P&�ʤʰJ�f&i�@�?G�� x�y}S�������%�!�Z��a?&"6���6F�1X=�PW�֮P�%%�[�E��嵼����Y5?,![$0֜�P�-����筢�����s�����gA��+�~�.O��$p*���+F���^�ٷ�L��߅�̓w尰��g�����b�GP���;5���8L���v���h�S�
�0�����%:�D��X�J� �a8T
�����6B���+��(J��X�}5kU/N����%%��`uw��G��[&`��5��ڴϊ�}#��I���R�'&q1X8	gI��/�kF�+�����G�e��G�Տ�Ѳ9����U��X�>���x�)�ppM����cĶߏ�&CM���@�$0̢ZC��I�p��ޔ�Ь�=����jlof���co�ʭi�7���Y\�
%lb5�o1X:)�/�Y�U�o�%V�+�aPq����A�it4k޻���{4L%s���l6��/q�C
7M�`���e 52M)�m{�K0�D�ea0(�da'�e��"��Ȧ�O������K T"�_��n�lOg����GH�.���Fr^�l$��\'ha�c��#�~K����a�jќBq����9!�����!���.�kOX
�+	�Cu�+�լ�̊��Lx����`������?���Q�x�~!a����l&C}Q����JxF-J��h�$/�����ݿu`��~�
:�̶FyV����r28"�rY�S9�b����dx�����/�M��փ�aY�?}�f�&ؑ7d��@г�J����l�k�'��0o�Y���nV
D��x��d�S�.�Y e,�T���A�����k�!,��B�v�
�gy��&1��e�Y������҇�?��s��n�;Lͳ�^.� π��Ƒ���8N��d���4	�������с���J�V����@��0f'��C�����)������/�=��%�9�wn��^U�/���ip������E9/���?���$�}BD.�31�Nl̀���x3��1�A3�5Qz���幒.��DI���h�ӿ������r� �  ��aA�G3���������1D��i�vG�KR�,8���
�%U�ߜ �s"_�G�ΨZ�6����"IU�R�$U����-��]�Ԁ��d�}[$��d��UD�I3����u����=�;L>&|�rQ�I_F�� j�*����rD�^��%����CK�H_c'9�@�;!r��������(������&�����j}��;�I;CU'�j�ƥ���G�q�a�Ź:�X�S���SС�ѫ�#d���3d�TK��^z���G�$��o�����(�3Z0���m��оQ�?cW�}����扥e�:tR��QPZ��+i3Q��T��hX���"<��D�BD?9��j<��/ٷ��,��T\}%�V����y;�>��̯�=�[�^����mԲ��h@�E�

���aE���͘@��6�/�;O�x��QR;����Ϋ���i�ᝍIJ �S:�2�8V�6�?&|������V��=А|�(����'�A�.'�@u�
ԐJ��2��j������_��4�I�Wo��p×�k���b\d%n�q�Lm\���dx5w�`��,��?�G��}z��3����̠ k��xT�<ޡ8�*$q��)���؍	�Mz��Ɏ�[�����(�*)Y�N+3A�q1��&�r�k�ƺ׮.�Rj��4��>\N&�hE�m�����@�q���i�6Ħ�~~�]v8�hj�.���/r6Y,� �) �rL��O�6����X ?��O�pi���%�x"h���4�Ұ������P��m�V�����L�[���Uo�ܛ$�n*��ͼ�vV&ZP{y�00�Y�v��C��������m̻Q)��c�T��n��j��(�
�3��H0h�㊗�SB�e
]hU�L�r?L����^6��gV�P i@/�k޽��;�����      !   �  x�]V۱c9��F��%���1L�q,�} Mթ�G�Gw#��ē��y������;�ok��ϏС�����N���}+b�_<~�����s{�x����T�F��ȋ��?�q(��3x��`�ّ�FI���M_��l6���,_���x���+5fZ��I}ه�$.����-�y~�ՈO�Ͳo��p\�:V��+m�<˳�X�o�kt��1^d�Ӟ��ү��yh�̿#���F�������φ�|���2�	��48���5�A��\�K'�X�K��*��'���3?���d{�n��xG8o�'�_����V��tV\M�ENBU˳���7T��e+�D[۹gysJ�$5ȋ�"Z�d!��`������54p>^�g�#�۝�y�Dm�I�v��]������Ӻ���\~�����h�+k�N�Qp��c2��Ko�����z��,1k���uZ����ng���cM�.R�<�'�8�;�����5e��>�v���-&�J��K���"�W�mG���[�Eu�F������c���W�h�t�6/f��ޢ,�����������Njʹ�o�X�z���Y��p��^�����,]��<���ڊ��vv�Og���L����^v��~��n�����`�
�}<?���Y�M�9Mե��Ң��ܒ���ާscr#�!�҅]|r�|�Y���9�%����6���vĵ�������p_=jk�#fJH������][���/��ϲ�U5U������}=�������2]nH���?p3kK�d��{{�!������j�[���F�{�{��=sV�]�%���K��i�q�t���͹q{��0T+��Krv���ݳ��_qy>��	j��ѹ��w�a�qy�aI�d��X�ɟ�-���3|@��c�/�v�wi��.��@��+=��g�ͬإ�6zs��IO��;��M�GV���`��.���������?��7�      '      x������ � �            x�3估�ˈ���=... '�D      *      x�mV۱�8���$�-⵱l�q�|-K�̩�X�i����j|�i����G �>����~�c�|��؛\\���~_l����|�1���m��p�n;5��A�F��!���K�0�T-G��# ����B\3'�F��d���`�z�8�'/��;(�=$(g>|D㛀}&�g�rЏLy��s;�g 3���A��`���(t�ӏz� ��'�3� _��fx+�h���z�zm��U8��ʔ�=���VQː��3�7�����ʴ2*y��T�8�W>���Xծ
���:�A]�͆��¸� �N���;����;]�e�s�3��ˁ�랪�n��Powt�-�_�vO�������m[����]T�Q�ԩ&PY���M;��@l:F�.l��jP�g��ԡ�5ShᠢN�������Tv�`4;xԧt�1�7��>&0Yz;���AQ�)��s��xl+�bs����k�ԙh	+�P�y��5akg9�'�[U�9�ߙxbs��f�F���V;��+�q��m�2u&�x�^8;���A��L��EC�yP=����"����OBvMk��(oc�h(BW>�ra������]8��� �vj�D����ِm3Z����h�B2r����욖*dG���Y*������!�<�ئґ��VU���U���+R�h�͢v/I���^ps��s����#y<������ǖ�{&��L�[M��M��|�����͢�O�瞺q5[�ع�|�y��������?���N            x������ � �            x������ � �      %      x������ � �      #      x������ � �         �  x��W�n�F}^}�ۇ��o?�/��Xq�pR�h�A��C_)Y�.��_�����]R�4P��˜�˙3#)�'{ro�ήle��v7����`O�r˹m�
7+��������h�tcw�o��dW	���?B����G��s����P�wr���j}{�B��l͵	�)�ka�`�qT��2�ݽ{�ƞ����ި����a��Ec�̞��i8H&��Af�n<���p�Z���2�0F:�q���Xqc'��b��eS���R� ��a������/U�88�E�'Q�r��2GNR�T����b���׏8�Da=����C��������d��\ۗ��␏h��/���b샐����#8K���\���Jf�y�22Ep��S��z%��k���-Ud~D�,�뗳�у���z�x�_\qC��� ��x�"�_�c���t�>�πq�塀�����0m���E�����e��,ȡ�[��QY6������_�/x��|�Te��%csc���?_hw	�D=r��P<w/d��T���E>��)��l>���*��e"�j�����SO�b�K�EEm� G����u=V�M�i�3S|��X��u�! ��J��eK�t'�<V�`u�Poz�]���F���H��$�LԦ^kT!�5���7vNF
<�� ��m~�P*=U�FS��̔���QY\[��2F��Ni�Ό��d��®hPN�Mr0�<\Lޟx���ٵHu��D��KQ�W��b�������@�X�ɀ�<����v��3aK}����+@��K��	̽�N!h(Ã=|kg��QB�>��������~Bݻ���S����-Kp؝|W6?&Uہer](��oK���㝬�^ϸ�w�mtt����Nl��¯�W����W�o���W���~�Ds��]�����@��+r`�x3j0�}��2�X�~!�X��b�&�L2Id���ޒ:{b�*�(�a��醧�cK325���^]��lw~�]�#F�e|G���G�����)pؗ���"Ά1��5M��g*�q��O�=gj�Cf^��'����~���m%'+�G�����iU�C-���CӐw��x��r~��$(I�-{b=�}0����~�:]U���|٥�c�(��_��<�����]JK!�U�RŐ�ٛ׳��?|�V�            x������ � �         1   x�3�,IL7�JMQPP�2�8�rJS�<cϘӽ(55O�+F��� �1         -   x�3�4�2�4bc.# ��6�M��)�o
�̀�9P,F��� ���     