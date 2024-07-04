Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E37C30653
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 17:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kwtbvqBATPkfC3LN2Cd5baBxjOBJ9G7HT0Q+oeeJlvA=; b=bKJuy+WH/E8E/ua4jww9IHbo8C
	e5NEKIzHRWivd18KK02FRi0VCeacF5jyKosG7IT1BriC9ARSlVydpcqcXsLUA9yPf38yAjpUgzyGP
	4PZZC+vK5y470RQAQ1EZLpimdfsa4LY9xQamJcE2Ml7o8yKcUOMeMVLS/PpUYNGWAMSUtRMNjrR3h
	MmHb2RuB4ZPzQXQCnadQkTkAaGI22XblhfeRzYSGrAf9ew+LLzkMO89E3e3keBLy8Dgom+g/e+fK/
	CAOssLNf+HMHXhyUL/gPi+e7lVzUe/VCscAtHxoL7NlLut9OkJlmhUbjzNK4QovkbkAi0sCWI03N9
	90l6aHrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPQG5-0000000E0l4-02bv;
	Thu, 04 Jul 2024 17:28:37 +0000
Received: from mail-japaneastazolkn190110001.outbound.protection.outlook.com ([2a01:111:f403:d405::1] helo=TYVP286CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPQF5-0000000E0G6-2p0o;
	Thu, 04 Jul 2024 17:27:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=flot+wDE5IwvzgaDcXRJLULxI0+qonSpZ4Hg4AtvQ8lgxVG4B7Szb6gF291SDH0i4iWWFaJd+fVQPqn3OViqpkKcCle4MN2Sjp9Nmq7RlBfKjc2CX/koN4I4ymMk2ZqcsgZ2v+d+c+kBohd8s7NA6t3wl63ukivJ7Q9uzVZvE420SPp6UClMZm10FS40y/MjmtX/MCfUkdN+zYBvlRJTUhwCfkn0TBhYdYpJLn+n4sLlHr2JBqZ6j6M9cCeu38WCMBAyjrS0BYfOPx9coYERxWxVf8Js6TcTy+kp+oJLwpAFGAbS6Uq4iNh7oMNqEnDuY5J8r32WHQEj92ZKR0GiEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kwtbvqBATPkfC3LN2Cd5baBxjOBJ9G7HT0Q+oeeJlvA=;
 b=dxggL/nTKiLWmbqGPvPMCzqIDvRWcH7irNKZnJ/b1upP4HnK1+XhUJMx19gl/MwPDBjCBtDn3oTVrB7+8fxLktRLqunou0FSyn3XIr6OfLZG35yJDKWDjB3FwBHWbA0WPcvfr6mxOJOTMq7vMRWmgkujJT6F7TSqpw9v2LL20phQm7cE4nLiL5qncumNuN2wHWKp0Pa+EHwZrMa4gkxR/1lrumwXTl0Ysn1JMIjfp6J02aG+aBUKr0XoTUj3ZtCAppU+lFKXwTV8yBJ0UIunlLoBt6awQE9oKAlgYAJoMcnRlCCa9nKz2w0u8XYUHgemOOQWHdX8Df9O8YwVByOBIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kwtbvqBATPkfC3LN2Cd5baBxjOBJ9G7HT0Q+oeeJlvA=;
 b=AtCfyTbx9jQ1EEDtbESQ6awuuLKrqhRJjpkxuWQo2bhGqQ0Lv9PpxM3mmdhdDoWfNhH7N0eBoS0fwYxAICfvzmU+7AW4X1prf35P9/zYIVnTWV37gdgdnAqPVEt/K4jTVcTZ0jzkEP3lDGUtifOHkuPvUxTN8gCpBeX7xQESczXWmFvUM/QgsBqupSeSnhPCOSg4HcEgBFNy3TE1XZvV4Du+2anG70f2T+o3f0BIxa/w/IKzA9VPbAQaWEb4RJFdVpH0LUV8FlWV9Q2x3d4ExrtHti5nevY3ToViZXz9tsXb7gGCNUW+9xrAgycV8vIAkxVKiD6pHqvPrWKyxLcJ6A==
Received: from TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:23e::10)
 by TYWP286MB3666.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3f6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.30; Thu, 4 Jul
 2024 17:27:14 +0000
Received: from TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
 ([fe80::85b8:3d49:3d3e:2b3]) by TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
 ([fe80::85b8:3d49:3d3e:2b3%5]) with mapi id 15.20.7719.029; Thu, 4 Jul 2024
 17:27:14 +0000
From: Shengyu Qu <wiagn233@outlook.com>
To: nbd@nbd.name,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	lorenzo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Shengyu Qu <wiagn233@outlook.com>,
	Elad Yifee <eladwf@gmail.com>
Subject: [PATCH v3] net: ethernet: mtk_ppe: Change PPE entries number to 16K
Date: Fri,  5 Jul 2024 01:26:26 +0800
Message-ID: <TY3P286MB261103F937DE4EEB0F88437D98DE2@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [94TgD1qXQdtUVP5ZiV+qK02L3VN9AH/U]
X-ClientProxiedBy: SG2PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:3:17::18) To TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:23e::10)
X-Microsoft-Original-Message-ID: <20240704172626.73719-1-wiagn233@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3P286MB2611:EE_|TYWP286MB3666:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e20f607-5cf6-4a01-9154-08dc9c4e8b4b
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|8060799006|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: 8a48axsqjnDYRXv3Shfh+xVB89zkIsP5XG4K8+TbiRV5ouqgc9sfBdN3VE8IBQQsHGDYazTFSd6NPxq7gk5ulME5c7Zd6t8Z7xs4Mmmb2k/jyLyYcP5tVqJOtpzw48v5fLQxkm2RLjoOu7jawSVDQhTRaRuTRKLHy1I7sZXj6h4EiKPNIdy3ro5eQVxTRtvscv462cRZfmomZ6SLtk1G0yqJ1g1xjwuIiqVe+JScnpKn/5Mt76t4LkAtEmpDc0d+WoTFNxzg7AiLphrp8uoBrRxWGSlwZoe3vuXG70wAJA+zO+3+HGFf698B0k+uqtDNTMtUkoXbuGllxDZkzW/ehl5dgAllDI7sovcAKgq5D3lWBJYawj084UGXcvzRWQ3Jnygp3+AE4xtvpGTSlL+xhBR4mXjpmCXEWZYx417VgYHrMoTETKc8KAjVShTXeIhpzt88Rf7J8lN6hlR9xecK8XNIoAPVA1asp3JuRh67xFrvhRJv1QIOlXpk643ySsQLmJId7sC2jJ2hKH1IupQEdDF9f1b2E9fyu1R3Gg59q3Y8Ibjt4ztpfPE5o7qZnR+sn6pORFknbxldgbX3/JBolUvAhsw/PM3dYmHf50klrvNGAuRzMZQ2t28nJxWgp2E9WGoFjPap0Dl25QU0TeqkSw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3JMX0oqDHZn7nBE3/lhvK71D7LV4766n4WFjaHrdZ4yemTGhoE6RjSFhaaeN?=
 =?us-ascii?Q?L8+JtDLtpXhg3iW96R4L3o5l5eX7Enk4cHMGi65LOMidzypRSCcr9pg5nKQB?=
 =?us-ascii?Q?KrEd5hRl5PviE0kF9YKJhY6WVDmvazRgsxz8JTSaICNt3kfRWf5hARgRnFXs?=
 =?us-ascii?Q?Knmpdz6nkh3VSsoY7pPjMrABW5BjRD8F7lo5tv0EocWVdpnAfyZtcSoXAOVH?=
 =?us-ascii?Q?1+lGZViDKabPqmm3OwGmZ9147jI/zXpXvUNm1sPQ/cJWh8rzdFwcXeisEqiM?=
 =?us-ascii?Q?aCJOb6/PErlZEqTLqMHdu6WVV6pXEvHRbV2TDO7I2TubnOzeTg8S6jzrhRQB?=
 =?us-ascii?Q?RQmd52I9NkXWwKgfUO9ewIJWFrs/bVO1Ut8qeMm7lnjblb+uNFr6Jb6lnxIa?=
 =?us-ascii?Q?fXOCQfr9SbefIQM9rT7WiYRfFZZcRwyO8mOJGgUSCaowbjVQwLEWt7HWWRwp?=
 =?us-ascii?Q?yyY7YYRidJn+q49SKH394tonEUID/DuEwiMRyd4ph9+wdwSN/bTf0Sbh4EjC?=
 =?us-ascii?Q?YGAMEMlCBdZWZq5UNSJ1QgFBNbSWJrPot18vlI8FEcqes1IhyUg/mjBjWD2D?=
 =?us-ascii?Q?f/Bcshg5qIjK/R1jhu+S5wgyX6MeRFSqIAOtYtG70I4mltUGMQt72YmbJuE4?=
 =?us-ascii?Q?stuH4KUICYGWYa+aAXbmOCe2eieILScScOVrmoyTG8Ct5BgU3pcPlsN1AxQX?=
 =?us-ascii?Q?BrrfG8nbvqzBA6ON3UCU/nRjpaaEHmUx329xX0/t8tboCF05IO578hWHz0Ep?=
 =?us-ascii?Q?PuscNRFZWi/I7ZF/iAB5nDImqbYIzlk/btvGZXC8yCZeNS2yvZqacAqDQ+hM?=
 =?us-ascii?Q?uFfrta1AKeEzCof2369O1eMUPDlnjQhbP3epKjiwVvOACiGW2hhEg2cfmbze?=
 =?us-ascii?Q?8Z7ZNVF8alzSnJoBzKoL0cLkQbry+nrg/baWkt7Wr0cAWt/ARnee8e9JzaZe?=
 =?us-ascii?Q?eFeGHaelKzMat6PITcSh00XNrv7zkjUVpCMjPCkPwHw+cL4DgK9NOBxXCxLe?=
 =?us-ascii?Q?MW23BBmcGQZEe12ZLSiZ3+SgLuMnWNt02uz3B1Zj5CIENu3MDPvcoRR0yTBf?=
 =?us-ascii?Q?4ek5YuXpcWozXiOgvlrSdzKU1tw4tH/G4plH/H01koaRfYaqOqcJxdkwG56y?=
 =?us-ascii?Q?F0uVW577igqHOqb1gOK5zUgl1V5WLSTjg2n65ljals0lWQRCVhU3WJjTmeWS?=
 =?us-ascii?Q?P114b0Ssi2qIrLHT/D6oWIpWVlK7OgbGslkIcqOcskXhky1b7RFK7BDd2Ck?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e20f607-5cf6-4a01-9154-08dc9c4e8b4b
X-MS-Exchange-CrossTenant-AuthSource: TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 17:27:14.0953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB3666
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_102735_746458_B3C9B5BE 
X-CRM114-Status: GOOD (  10.54  )
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

MT7981,7986 and 7988 all supports 32768 PPE entries, and MT7621/MT7620
supports 16384 PPE entries, but only set to 8192 entries in driver. So
incrase max entries to 16384 instead.

Signed-off-by: Elad Yifee <eladwf@gmail.com>
Signed-off-by: Shengyu Qu <wiagn233@outlook.com>
---
Changes since V1:
 - Reduced max entries from 32768 to 16384 to keep compatible with MT7620/21 devices.
 - Add fixes tag

Changes since V2:
 - Remove fixes tag (Thanks to Jakub)
---
 drivers/net/ethernet/mediatek/mtk_ppe.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.h b/drivers/net/ethernet/mediatek/mtk_ppe.h
index 691806bca372..223f709e2704 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.h
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.h
@@ -8,7 +8,7 @@
 #include <linux/bitfield.h>
 #include <linux/rhashtable.h>
 
-#define MTK_PPE_ENTRIES_SHIFT		3
+#define MTK_PPE_ENTRIES_SHIFT		4
 #define MTK_PPE_ENTRIES			(1024 << MTK_PPE_ENTRIES_SHIFT)
 #define MTK_PPE_HASH_MASK		(MTK_PPE_ENTRIES - 1)
 #define MTK_PPE_WAIT_TIMEOUT_US		1000000
-- 
2.34.1


