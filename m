Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B682FC3DA5D
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jul 2024 20:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qi7C3B5QNlqNKB0Ffk+iV6UdT1R4F/g0ZZUbmQEcZUM=; b=Q59FOgjqIqalfXNnZ74/qO/pTi
	x6CzCoNepuW9IQO73bg0xaUI2jJG86J194vgYQ+1RgS5NSLYkK7kujWkparqRDWwMFbn0e79givib
	PJZcg36h+0ggstEbelGz7y9Rx9KveTNU6hNpLK8kdrS9wK+sDMcWvDOxoxRdwuAQaXIfQygbgvvyQ
	Jav+DkZWTKmCm8YZaYMpiBzPkntN1wyVGc7fa38s5xKd1Lsb9AWWt/ciGej8SN7K0RFy/Bysjkv/u
	YVGCnq6AUdElYpf8y2ipNai9SKtMDigaXGNQy4qXTsCbKkFPvFAX3FHPT+MiGIMGs89LNo6vHwe+l
	DwrBjU6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUuOe-00000003lat-0wiO;
	Fri, 19 Jul 2024 20:40:08 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUuOb-00000003laK-1vGe
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Jul 2024 20:40:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 27301CE1C26;
	Fri, 19 Jul 2024 20:40:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D389C32782;
	Fri, 19 Jul 2024 20:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721421602;
	bh=QDENLDTXpwvawrix7G7bkW73ja1cWQA27bKFoe1kOJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wpdmu6kK5JfAzNiFwkvwXSyLB63z3NjB2Fd56CHVeXRIMbaG6Y2IdNwv3owGDhZaU
	 /eOFxjV2eqF2hY+2NxuGFl2wo8oPcyYA7gefcYQfkdoMOM2cauyyG13QEp98zYK4zm
	 fjYFUvdnDyDoOMzV6ikzf7azW86lWS8RfCQZ6S0YaDLPiMnUqr4H5pkUG03lIcTi1P
	 NKPfVlPJLDonjVVKcr5YP5Qx+FqEjts+GtsIIGOEj6hDbhlxaPz2rgiF/wlGy54rIz
	 N0/9+gca/Qt1v/PnDicPbVVajFXMf+Xj4QpLasynOwxb4vz2LXwoVw0cAiv5UCsTAQ
	 +648akjmqZyxg==
Date: Fri, 19 Jul 2024 22:39:58 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-mediatek@lists.infradead.org
Subject: Re: [bug report] net: airoha: Introduce ethernet support for EN7581
 SoC
Message-ID: <ZprPHlFgp1G2iTkM@lore-desk>
References: <395b364b-8a37-40ce-ac24-4f0bd7eb0e2a@stanley.mountain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w3MCbIotanJ1tKKG"
Content-Disposition: inline
In-Reply-To: <395b364b-8a37-40ce-ac24-4f0bd7eb0e2a@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_134005_878023_A20E2EE5 
X-CRM114-Status: GOOD (  12.20  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--w3MCbIotanJ1tKKG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[...]
> drivers/net/ethernet/mediatek/airoha_eth.c
>     1134 static void airoha_fe_pse_ports_init(struct airoha_eth *eth)
>     1135 {
>     1136         const u32 pse_port_num_queues[] =3D {
>     1137                 [FE_PSE_PORT_CDM1] =3D 6,
>     1138                 [FE_PSE_PORT_GDM1] =3D 6,
>     1139                 [FE_PSE_PORT_GDM2] =3D 32,
>     1140                 [FE_PSE_PORT_GDM3] =3D 6,
>     1141                 [FE_PSE_PORT_PPE1] =3D 4,
>     1142                 [FE_PSE_PORT_CDM2] =3D 6,
>     1143                 [FE_PSE_PORT_CDM3] =3D 8,
>                          ^^^^^^^^^^^^^^^^^^^^^^^
>=20
>     1144                 [FE_PSE_PORT_CDM4] =3D 10,
>     1145                 [FE_PSE_PORT_PPE2] =3D 4,
>     1146                 [FE_PSE_PORT_GDM4] =3D 2,
>     1147                 [FE_PSE_PORT_CDM5] =3D 2,
>     1148         };
>     1149         int q;
>     1150=20
>     1151         /* hw misses PPE2 oq rsv */
>     1152         airoha_fe_set(eth, REG_FE_PSE_BUF_SET,
>     1153                       PSE_RSV_PAGES * pse_port_num_queues[FE_PSE=
_PORT_PPE2]);
>     1154=20
>     1155         /* CMD1 */
>     1156         for (q =3D 0; q < pse_port_num_queues[FE_PSE_PORT_CDM1];=
 q++)
>     1157                 airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_CDM1, =
q,
>     1158                                          PSE_QUEUE_RSV_PAGES);
>     1159         /* GMD1 */
>     1160         for (q =3D 0; q < pse_port_num_queues[FE_PSE_PORT_GDM1];=
 q++)
>     1161                 airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_GDM1, =
q,
>     1162                                          PSE_QUEUE_RSV_PAGES);
>     1163         /* GMD2 */
>     1164         for (q =3D 6; q < pse_port_num_queues[FE_PSE_PORT_GDM2];=
 q++)
>     1165                 airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_GDM2, =
q, 0);
>     1166         /* GMD3 */
>     1167         for (q =3D 0; q < pse_port_num_queues[FE_PSE_PORT_GDM3];=
 q++)
>     1168                 airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_GDM3, =
q,
>     1169                                          PSE_QUEUE_RSV_PAGES);
>     1170         /* PPE1 */
>     1171         for (q =3D 0; q < pse_port_num_queues[FE_PSE_PORT_PPE1];=
 q++) {
>     1172                 if (q < pse_port_num_queues[FE_PSE_PORT_PPE1])
>     1173                         airoha_fe_set_pse_oq_rsv(eth, FE_PSE_POR=
T_PPE1, q,
>     1174                                                  PSE_QUEUE_RSV_P=
AGES);
>     1175                 else
>     1176                         airoha_fe_set_pse_oq_rsv(eth, FE_PSE_POR=
T_PPE1, q, 0);
>     1177         }
>     1178         /* CDM2 */
>     1179         for (q =3D 0; q < pse_port_num_queues[FE_PSE_PORT_CDM2];=
 q++)
>     1180                 airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_CDM2, =
q,
>     1181                                          PSE_QUEUE_RSV_PAGES);
>     1182         /* CDM3 */
> --> 1183         for (q =3D 0; q < pse_port_num_queues[FE_PSE_PORT_CDM3] =
- 1; q++)
>                                                                       ^^^^
> This - 1 doesn't look intentional.  It's the only time this value is used.

I checked the vendor sdk and this is fine.

>=20
>     1184                 airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_CDM3, =
q, 0);
>     1185         /* CDM4 */
>     1186         for (q =3D 4; q < pse_port_num_queues[FE_PSE_PORT_CDM4];=
 q++)
>     1187                 airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_CDM4, =
q,
>     1188                                          PSE_QUEUE_RSV_PAGES);
>     1189         /* PPE2 */
>     1190         for (q =3D 0; q < pse_port_num_queues[FE_PSE_PORT_PPE2];=
 q++) {
>     1191                 if (q < pse_port_num_queues[FE_PSE_PORT_PPE2] / =
2)
>     1192                         airoha_fe_set_pse_oq_rsv(eth, FE_PSE_POR=
T_PPE2, q,
>     1193                                                  PSE_QUEUE_RSV_P=
AGES);
>     1194                 else
>     1195                         airoha_fe_set_pse_oq_rsv(eth, FE_PSE_POR=
T_PPE2, q, 0);
>     1196         }
>     1197         /* GMD4 */
>     1198         for (q =3D 0; q < pse_port_num_queues[FE_PSE_PORT_GDM4];=
 q++)
>     1199                 airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_GDM4, =
q,
>     1200                                          PSE_QUEUE_RSV_PAGES);
>     1201         /* CDM5 */
>     1202         for (q =3D 0; q < pse_port_num_queues[FE_PSE_PORT_CDM5];=
 q++)
>     1203                 airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_CDM5, =
q,
>     1204                                          PSE_QUEUE_RSV_PAGES);
>     1205 }
>=20
> drivers/net/ethernet/mediatek/airoha_eth.c
>   1366          airoha_fe_set(eth, REG_FE_CPORT_CFG, FE_CPORT_PORT_XFC_MA=
SK);
>   1367 =20
>   1368          /* default aging mode for mbi unlock issue */
>   1369          airoha_fe_rmw(eth, REG_GDM2_CHN_RLS,
>   1370                        MBI_RX_AGE_SEL_MASK | MBI_TX_AGE_SEL_MASK,
>=20
> The RX and TX masks are identical.  Possibly correct but #Suspicious.
>=20
>   1371                        FIELD_PREP(MBI_RX_AGE_SEL_MASK, 3) |
>   1372                        FIELD_PREP(MBI_TX_AGE_SEL_MASK, 3));

I posted a fix for it.

Regards,
Lorenzo

>   1373 =20
>   1374          /* disable IFC by default */
>=20
>=20
> regards,
> dan carpenter

--w3MCbIotanJ1tKKG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZprPHgAKCRA6cBh0uS2t
rGU4AQDL6f1zPbnuUFds6JhoYbyuG6q7DQDMMuxzKsX2ALheuwEA5xMiYSxaqoeM
Glh5vq6/vg/pMLJwjL/dNvrwqIequg0=
=VqTC
-----END PGP SIGNATURE-----

--w3MCbIotanJ1tKKG--

