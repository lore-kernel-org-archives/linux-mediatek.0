Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A350AEB64DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 06:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vRHxrSwmCC8G4RFY5x8bbxxLlHwOWuClH6Dxd7BpHLU=; b=T9ZcYbtUFEb58woXLpS+AuAbai
	46KeVOjMEKS0yCSZR9GBHv6EUVOQpf6V88slwLm6n3k4T91aHCZaGl5FG44z9R8MF3+OsImVn60Gs
	gqU89H1jWL/aVpS6kXUJ5idacO7iEvcMD7WlQIWydvN175DANfYdHMsOC7OMH5rDWkUo8LAAhHqSP
	D30AkROgdXueKZyoZ2DoinwzG+W4n8Tm6gMLS3Gys90ZPobz8qiOGv3wefwGvvApdfAhU3W84Lqus
	uFx+uGcjvd9PYYrroR33amTO9PZZmVhdZvsa/dNirvpEIHH9O4PDSsYPpkeilju2DOI35bkLup1VT
	ArCrMIvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMN4T-009vVp-1h;
	Thu, 20 Jul 2023 06:23:29 +0000
Received: from mail-sgaapc01on2070c.outbound.protection.outlook.com ([2a01:111:f400:feab::70c] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMN4Q-009vUt-0N;
	Thu, 20 Jul 2023 06:23:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TsfMEfZ6UiJ+w21uhSZ/jNk/cCMxcqAnMg63OPkTBjKoseMtpuHOol8fx4nOr8DVABr6s2QcGuLEPWQKWxqRRHQrKaWgrSp3oG/pG7f6PwtxwHfSM7uPOPhMF8T2yKTUnkV2JEyHXEYfIeU/YpcyYlaKwW4r7ikQTh3mdCqhV4AsaxnudWmU3mEOfK2ktK6EEXEIxs3IOY5Ql5QLEbV/hBCJAeqlrKCgF+uQxuLVO81LPkcmTwxS+QI+KZoGZKPkVqwMSVDqd7GvEZXZZOyLIuu3iwva27j33LZnVys3zBal4MOagQRAEu1943flFqS9s+SeocR8pSMmom2R7uWOUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRHxrSwmCC8G4RFY5x8bbxxLlHwOWuClH6Dxd7BpHLU=;
 b=Kbdi0bAZTMz5Qh1flAdJGDk/XXbM28ug/uyEqQo6SxvAq50C5JA/G2+ZdR0nM/aWndH4oVEggBU0o6UNV97jvqeW4IhixXPvu1EJZPCv2e5eRzfqpyBHnywYaqDTjSPNLmt14E2wMua+9QUqn2dXPzvlZh6DauQMGvyoBGPkGm2XFF4+8X/4ARuS594OPRBk9QRkJ8UInebQmr+x/+gcMlGgM5vHGhLHo0wlLMN72rCoF33i1jXILtOiHcJEosYfotu9g56KvndeJr+5bHaEvpHjpxSNYVFdOF8l3nb3TSQwplxAheed/ftsAkrGssTVro8PHwSxl3puIgI7cLJQNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRHxrSwmCC8G4RFY5x8bbxxLlHwOWuClH6Dxd7BpHLU=;
 b=mPH3ewuNyXcrAHv4YEvPCcjBAmdk4aJfBTROLXIMe0Px+qkHm864KaMj92OC2uG+nh1wJl1GIP9fYVtYXVR9yTTIW9id18vgH0Qi4m5u9+pTMVh/u1lNLjUiJvGogsijXbf4h5UM2bYDhkoHlQYlCeUpPkuTxkSMMvsID79btICHMdd51UCSgDcxi6kcBExpP+rrAKD9pJ6DXEDYWcxNt2WK8cdmlNDicgKDID6+2hg3qfVPSkdiJZxTpaZzG+ab2n3ZYupQVuphBmr9HqL1TaPyDSwk2X3SCh9qzLXvZrkgjuhxNUP433m0Luko5/DzZNq98t5DyddpZHjXSwtQbg==
Received: from TYZPR06MB6697.apcprd06.prod.outlook.com (2603:1096:400:451::6)
 by SEYPR06MB6183.apcprd06.prod.outlook.com (2603:1096:101:c4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 06:23:05 +0000
Received: from TYZPR06MB6697.apcprd06.prod.outlook.com
 ([fe80::30f7:d30:53e3:ce86]) by TYZPR06MB6697.apcprd06.prod.outlook.com
 ([fe80::30f7:d30:53e3:ce86%4]) with mapi id 15.20.6609.022; Thu, 20 Jul 2023
 06:23:05 +0000
From: Lu Hongfei <luhongfei@vivo.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, Moudy Ho <moudy.ho@mediatek.com>, Arnd Bergmann
	<arnd@arndb.de>, Sun Ke <sunke32@huawei.com>, Deepak R Varma <drv@mailo.com>,
	Lu Hongfei <luhongfei@vivo.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
CC: opensource.kernel <opensource.kernel@vivo.com>
Subject: [PATCH v2] media: mdp3: Fix resource leak in a
 for_each_child_of_node() loop
Thread-Topic: [PATCH v2] media: mdp3: Fix resource leak in a
 for_each_child_of_node() loop
Thread-Index: Adm60qSCfOHMt+9kEkOuheb3VyVO4g==
Date: Thu, 20 Jul 2023 06:23:05 +0000
Message-ID: <20230720062248.37906-1-luhongfei@vivo.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SG2PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:3:18::33) To TYZPR06MB6697.apcprd06.prod.outlook.com
 (2603:1096:400:451::6)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6697:EE_|SEYPR06MB6183:EE_
x-ms-office365-filtering-correlation-id: 11adb2b5-15d7-4297-df5a-08db88e9c703
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ox0LXkXyyvxPKeEdzn1uvYGNuuUmclEyH3CT4eTOriH8CUBo4jvDLoy7DX18Sx+QnmnLE+1uVOzySvwL+CoHqi1q2K7k8yzFz/Z1duHATDvGJAYZ+bFutaa0/JHf/L/oLLW0c6XF8wMN3+5p/prMAVO6QdBjR0ej8RkgdKNhh8OLGf0GyEIa768cXcu4G2R+j/URvvwEsqpr4WkT9BBi1hphd6vqY5Ikia/x8Y3XcCfRIUZVOT2YT+g+ohJHMGsMe79m1bG7FjUFVLsIVAVcgIW+0/iPZeKrxvIUmSHJYwQleKMjHl2DSYdOjZ6XeMHwLa7kzjxbSR/yriYISRHhKudgofOIr5++4Wez3mmH612rUtRb9i4G1a2m/UvyT8sN0/seChZEAHQ6veOIKZvA6JWpbAFqMONst35yeczGwqjwWRIG3/iIdam6xdCTm8AuvnWaK8e0XVUbWeIWz2p7vdbG8p9VsfCVOPH+FSjtbH5UlrUVmWNU+oAoMOI2QIiUCQhsYzQ6aXkyB4gBvW0VSNFhK4CMwcaXDt5ODik305wZgn2NU9Xppw1dWmXzBGOtTDNb8dqkysncKajjSRAaDzAjcXWsUmcFA1YX8dsveCMUyyRtzKn5Uxi69zI259bh
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6697.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(451199021)(2616005)(2906002)(4744005)(122000001)(38100700002)(38350700002)(921005)(71200400001)(66556008)(107886003)(66946007)(316002)(66476007)(4326008)(64756008)(66446008)(41300700001)(6506007)(26005)(186003)(1076003)(478600001)(6486002)(52116002)(6512007)(110136005)(36756003)(5660300002)(8936002)(8676002)(86362001)(7416002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?uAhbjvcp7Ste8sfplJieq4vPvtUdBmke8CltStdO1/M4P2J/WFDWFgrGGs?=
 =?iso-8859-1?Q?SveUBXb+5wfS5PAKaKFhDZYL+9WkLSKgrLHzU1+TgYjo4qBB+vHDevoJHq?=
 =?iso-8859-1?Q?RF5RMWGX8gt01SfKeSnJcNowU2oQSovVwmEIFxOZVdH5HeeX4Ved/kVlLT?=
 =?iso-8859-1?Q?af6TmpEL/Fo7w1vEvnJY/HmnV9HGA343+xkQlyN5A76mdjaQmJsyOFy7CU?=
 =?iso-8859-1?Q?xD/29Q3HaL2SlfgYvGGlnE8Ya9Oj+vcib3TtHOm9tis6RhevlWrgUFchZw?=
 =?iso-8859-1?Q?MeV0En2UpyCTFIFtmGge72QT4hRHEuY6aj27hijpGwhQfNehNRay44qYLS?=
 =?iso-8859-1?Q?7bx9x9SD+rkdFkskXRy2OcmXQtB1tVyEbGfgmsWN4CZofczNqzgFlr/jBT?=
 =?iso-8859-1?Q?5YLeoaR9WodVkEkYy2UP/IimxjgKsp/VQPyzkzg6InrlfG3iFmXQH+kLS6?=
 =?iso-8859-1?Q?gt2jGYdvSTCziOWEflkV+tSZdiI1g+zjyvRKPpzyfx6tFr+V2Dq9PyMhTE?=
 =?iso-8859-1?Q?w78WkG+9JXBLVOoMVMuFLJOJlO4SsQArxE7jLQyFXW/17wVN+bRQHeG6zA?=
 =?iso-8859-1?Q?b29uqa1INKLC0iiCyze5S4tCsioiGqVn4SzBKoU94y1018gsnek1Obx8/x?=
 =?iso-8859-1?Q?f8wjrp98+xDG24i8Byt25gCMJR7GFSk8detVpB3rfzKo7fG/xE6g1IhnrD?=
 =?iso-8859-1?Q?62kI0aBfn9Xc8HjL7mxhWG5rfVv1k0ltrIDuvAVp/sTjgsgBkbBfOkyaQp?=
 =?iso-8859-1?Q?FcjhNqw2n/XORdBpsM9iewrLgEjdoUe/ok/Fj0ahcNhTze4EEKQ2o6t7K7?=
 =?iso-8859-1?Q?DqR2wHxMgFgFedMJCMPTOuHdkUDd/BczJiMFS5zWElhDTsO42Goxa0dt+w?=
 =?iso-8859-1?Q?2+t1nxQT5uiATaUc7PvKuGdD/klYXq96p2X+v3IcFxHVxATODiRkLIzg7D?=
 =?iso-8859-1?Q?q48hqke/ZeqpcQ5hJ6vaaLPMKflHnmxgMLJV6m1JUaVAXlDXArGSUm+cM+?=
 =?iso-8859-1?Q?PxFrFpyqBz0/hGl4/Cm59WkKzBELHNrU8l/JzEiP4Rhle/zbANwzQ6fa31?=
 =?iso-8859-1?Q?BPkbrmf6RnQm1ZoFqtaGIbqMVAZPbt5Rs5UU2T8xLE68mPDYOTsXHZTTPM?=
 =?iso-8859-1?Q?7nKIzklCxaMUnaNCnCLyT91+Tl+PwAnbqxPWswargNrGRj+lFPV7yYw9cS?=
 =?iso-8859-1?Q?pqSRs2JvT1E+9epkCxmnfg5Wrx2l26YYjmm9vIKu2B8rWEVRsQTt5ORnQG?=
 =?iso-8859-1?Q?s/7iIFE1xmyIqjmDrv/GJflLTQjfTlVPQB2FyGxOJouufNZt85LcxjQIUK?=
 =?iso-8859-1?Q?Xv/vNlU3XhE19AB3RCCLPZCrGUXl5p7R/LMXdpZDn/5449pL9dBB0mECT/?=
 =?iso-8859-1?Q?lvBaWw/Bb3azyTWlUOCZCi1liXOdYt25S5+OhEprMnShB457royjMJj439?=
 =?iso-8859-1?Q?fb/tCRhvu7ZhwOrc2OG9EL/UjcLurEAATYh21YAT5nbdua2+yt1EJejaG8?=
 =?iso-8859-1?Q?CnShtSgQxCl/8xYIIzBdwZTHcv2MLhIdl1E4U7fthrZujXSpRNwQYj4I8U?=
 =?iso-8859-1?Q?q4PAIexiGV1vfmXJfLmmRYwHosAnoYc7VY4QuqIbxVWxmcJEvXoaSlA5+h?=
 =?iso-8859-1?Q?5F/oHxrlI7ZtK3MrfD6WPbVcDfkhzEa+lN?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6697.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11adb2b5-15d7-4297-df5a-08db88e9c703
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 06:23:05.0289
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1T9kEf8y6rGOlAJetDRJCI9Gz5+mekCDrgqeWA/jV6DMxtd12yTZTHiAxQWlOk76Jk4FOGH/tiHhwOY12j1nJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_232326_162498_548244A1 
X-CRM114-Status: GOOD (  10.24  )
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

for_each_child_of_node should have of_node_put()
in error path avoid resource leaks.

Signed-off-by: Lu Hongfei <luhongfei@vivo.com>
---
Changelog:
v1->v2:
1. Change the subject line of this patch to include driver name.
2. Remove the unneeded of_node_put.

 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drivers=
/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
index a605e80c7dc3..40c4b79a5090 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
@@ -1135,6 +1135,7 @@ int mdp_comp_config(struct mdp_dev *mdp)
 		comp =3D mdp_comp_create(mdp, node, id);
 		if (IS_ERR(comp)) {
 			ret =3D PTR_ERR(comp);
+			of_node_put(node);
 			goto err_init_comps;
 		}
=20
--=20
2.39.0


