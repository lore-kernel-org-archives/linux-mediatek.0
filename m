Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88640C55822
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2026 16:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y8WM4489ZxUoA58n5FSRElPnVk1Rtke2MsT8nMSq2E4=; b=wf6zTzyBmMtj55ogK5ZsKAXp1o
	5Ttqo0cNNz/FltvcELMqOClRDzQXemC71pNSbkEvP3VtWKf+GaF0dNMPiIvTJsNuIeTe0pJyBGsRS
	IRK2BkXTs3Q4YWXPiwIWLjzZeWY3ws5JwywpC+Me5EC9jg8ZCdNRsiQ7VUhInVW4Nuy6n3QGZF8O7
	Jnj3xKnjboDrEpDDrtl3dWGNbqPfVwqqv2pQ3/aD8kSd46jLvAORs1CYAFoARwVAeUNDwDFUqqMS/
	lh+BNlnbo6VRIZjh5rHXZpTwaNTBsblznLg4fdBa50tcfEyeN4jpGTvq8u2Sju1h5NU+ASGpwua7M
	UUTLN/QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHdD-00000002G80-1gQ6;
	Tue, 04 Aug 2026 16:04:43 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHdB-00000002G5k-1jQ1
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Aug 2026 16:04:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b1PFvozAlidTuCuHQtbRhF3SaNd5V875/YgRjECumHtzqitvvttvmI0XsWzzcvk+3JLIU/+/GhPjo0gjRrK5QmGaUaPJ/fgYq9Yo6A8e2zJLHSgfJwCBeA199eEMpc2xq1T2I9Btr+JFnaKUSsXUh+6EIR/0+yrG9edmn/+vahGyRlqR+M42aMSBK3WMWAknbyOOg6qR1SG9tt0hqEFDt8Bl2208L88SHH+AdnRzreBds5r1+gdJgTLhdv8PwY1zPNNuQ1Lyf2YrrFm+Zk6TijUjUkQuY7X9efPIOkvBDMWJG/l2iaLqrPHzitG1qMdvI4JyZ3NbUp/hA0NtxLZhNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8WM4489ZxUoA58n5FSRElPnVk1Rtke2MsT8nMSq2E4=;
 b=pcKSvtLFffwLCdZP5kpzHUA2yCfYis/v/SavmW3JlQS1kQkKL//lmo0Iylabbg+yOeVxtAxxdK1hL2REoYi9XbAiP+S2FA/iJV+RskCevnmuPbrXaJiUjIny4nlQroLBRM1gNo4IAW9lR1RuJAG46wbo5MjFacdo2VMpOuI7/8TtZviaFycpb3H7jp1VXYQTX7mJRWKYlvkwkerFJ+yVwSlHQsFg79HoCdf6rhtzC8kV4zCRSKHH0JSN4B3x15r3QtjDVJQTaXQpKUxtNqGtqLretAdxjFNIUBnFN6eZGGtKT5NucRLSkyP0PrJ34qD8T/UIPGwK9iCqrfq3PKm4jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8WM4489ZxUoA58n5FSRElPnVk1Rtke2MsT8nMSq2E4=;
 b=ssEsIzD+PUNtNhVcwG7iKR8RYSCwhUmYdastfFqaBLEHBbYMtEB3tcB9rSxSgAj/Uk/GdHSsW2c7LUcWTUCbZ6n/h8Y3Vzm+wFHQk8cC61y8zIMNyXgBQ1KuHwjMqBqrEsar/XTp1DWSN46vHFUHs0EvZB/tA9E7BNrKylKBJsVw3cPV1DSz0IOVAS5LrwtTXbGL2U4NIQ+saqPdl1mTjWFwLR21GxIhGjTLpGv4yOiPk0GJhOpAQ8dpwjA5quyzqYgWyOGLNP/x1J5SBRaQebsF0WY1LFWLMYnlnzCRXfchwQrh4FNXMltr1nh2nm+ATViYm4vT5AizQUjiUBkDFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM8PR08MB5761.eurprd08.prod.outlook.com (2603:10a6:20b:1d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 16:04:34 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 16:04:34 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>,
	Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v9 03/36] pinctrl: airoha: fix mdio bitfield names
Date: Tue,  4 Aug 2026 19:03:46 +0300
Message-ID: <20260804160419.3592327-4-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0237.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::12) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AM8PR08MB5761:EE_
X-MS-Office365-Filtering-Correlation-Id: 688218b2-a1ea-463f-087e-08def242134f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|23010399003|921020|38350700014|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: P2d9HijKyCU/McYL9SyX469quvv9n+LH9eBLpuYHl5t1h6+YNWZDcsDsdIEtTfnxNen6LceIjbZkeUm0zQZudYOAYUl7rfGfpZn67FCAUA8wS9ZSaJREHMUvE2XBM0+KlSAtUQXZ7k8BJ5FLoBiBLPPk8gZqSdxoi887AokvXkNrJX5WxL/GJU3mjq78cXP0XSCXM7oSs+o5v4zVW81eikbA670mBL1YhIU1aouoEORmegO+njsF0YeXDWbCHWubV4/s61jTNsntF6m/vhs8zjNub526Ho/uCAf9K3ZCkXTZFnI4EhmxfHYtbrqmEbAMoTmO3QD3WIlIROgbrHQZ5dSM13C/BX/SGgdzqY6Aibx9rXh4mrfE8PW6v5sGN4oU7+RHzIt7Vr8lYv1FUv40b5EBV/NpR9nkEoHqODLrXrXu+TK6MO1arivzivEV+1aeEpVNtpo7t04LGS8Y+jIhSF1wFLS4YfW4247tv/6wONFBQ5Fb2xWO1esgwkerRYfeXcFkcV78GXorVf6K86oc7Vtp5CLtB+ZlzDgAyrqbNacB4A28f5o5BijA/N7NYUTH4rGUG0pBUmYerkeFDiveYa3Cj0FdhvWZRP0E3hjroUabdkBHW0L+k8xQ9rMxWEh/UffO8ezbSpR4kINSId+z3jhmWZN+wFXwEix3iz8bTi805fkEA8gyeJhtXLS4gAPurReoxIWKq9sfZ4pZrEb6CZ/IrCmtoxKd/6kXvYddQt0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(23010399003)(921020)(38350700014)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tQXAYnxZEIkeJTLLYmmyqJ/hUkleqJaTk0dA9zgl1UY9xcwmS9K1ov9DoqaL?=
 =?us-ascii?Q?gfeJVtpZ21ipySCF/3Vd9Jn6ikum/FajobbA5KrfS2gzKbmLbR2z2B14NM1v?=
 =?us-ascii?Q?tsRf//lRdkErvneG7m0zNDVFar/cFxrTqp4m5E/G9V9b9apmN+Ts6zOsglPr?=
 =?us-ascii?Q?KqOHrChCQucjm1zoD/GKHSu+wQm5yr7bYHMKQ+oi+5ivDBlsDoo3YaFIOKtY?=
 =?us-ascii?Q?29Gi5ktu4gi2KOa+IZzCjSD6yT/yHopx/D+W9OdnRCDIj89zmHKWk/hCYZ+4?=
 =?us-ascii?Q?zLogutFUaMjF7U/lMMi/8po5LPU0EjiyU1aaDglGB/1pzWAbLGKrNaRiJTlO?=
 =?us-ascii?Q?D/WsiXPxtpPnk73E3C1oOPX/izAA8PaDQr8AJ0IpztN+VPGlOHCaBvi2pZt1?=
 =?us-ascii?Q?XcsRh7vxJn39jVpOyLZpzSVgeBBHIRTG/HdBbS9Clc1DVUwg6WLWDYcYrLYW?=
 =?us-ascii?Q?HipTlXKNnEZCP9y66/UsRA5iZE9eYHuLRUrUSd4KgINnSVobCPDK6p2AdsRE?=
 =?us-ascii?Q?kAJiLgkCLMEpt97WC4AvWow4S3ZQfQIavjZxT+b+ZsJ7WvS0NrT2co8GKCrU?=
 =?us-ascii?Q?bIiUG9dBSEJCN4KTeXRN6GJCNUNQ1QhweGmg/oBfLkhXS4PvXbeuDsYKIqcY?=
 =?us-ascii?Q?2x5hBQ4MkSXkV3bpI6OjcSWfHI5Tr4BdM5jWLK9dr/8NxsE4ZDlHe6pvRR64?=
 =?us-ascii?Q?czOxZWNCZfcgUmeou/xyyixDu9P/HtHoZBPyHsjRf9dT3oYsmzshhDLnp8tH?=
 =?us-ascii?Q?44jI5raMDSYVFCHflIlhNAoXmHInMbjNxlKPvMTA0dCiy6ud8Q/gOSvLuDOm?=
 =?us-ascii?Q?tWCyOXZaLrVzHctPp0xf7A04XkmOI0Gym5mbMAo3/+pDUmnsZzmJVvtvaD73?=
 =?us-ascii?Q?fKKL7KOx6+HX5G/q8nFEn69nz4Iq7tlqb6aafrGWJxI659CrasNHYoy1B3oR?=
 =?us-ascii?Q?H5hD9Y17e4RGAsGCHwylwtDu6uStOrkkYQ6s6PtyaF0FM1zrz/uNtIP0QnUA?=
 =?us-ascii?Q?lPW+f5u3lsk/XbAaJEZccnFEClUnhX76EpaSbGRjC3NxPtmezvci6rX6c8XT?=
 =?us-ascii?Q?jIanZH+9wpnAjYTnnqUMFKPCk7KLPPBy8gakvACCcjp5yxEbaaQ8/HdZWk+J?=
 =?us-ascii?Q?qDrKpco6ZoJCdoV2sTiChHt9L6EiRZjLwTxXBHLmcflY6S9GcpNgmZTSVSuC?=
 =?us-ascii?Q?eEDT2x1RnIWEqwW4uj9NvxV8UDddQn1ZSpnzTVgUZ8oP+jgTjbP3e994c7Ur?=
 =?us-ascii?Q?ONMEsfRg8XQhpeI5J7OKrUMWryd+RxYp5LY1RHKQVfVCgpyoTILIlTl3+9Nh?=
 =?us-ascii?Q?Ws4JD6KuUG4gpQm4cNdUpxKRKeRzQs6maRWxnjVr4oy/Xc/Inuk27o+Pvbto?=
 =?us-ascii?Q?0AhmkcNlyuDdStfu/1Dh4tgaOFz3E3KqHIpNCDCDpUPNcOp0lw844ulwZvin?=
 =?us-ascii?Q?yGphPsZY/yLjQYzij6o0GSaeNi3+JqVyAv01dj2h6SsaxSecTvDu1k05LudT?=
 =?us-ascii?Q?ZuONRChTBmosd5H8GgNZR09a2dtH7pJyh4tEb/r5FFEdwicSnZkNBzdqLrZb?=
 =?us-ascii?Q?xMoJIbNafW6P7z4KIqg+TuNNB52O7CBWmxk1TPJGlE8M3RblnjWp+K+1BriQ?=
 =?us-ascii?Q?yObMtQ1PqChjMOe8A+Vpl1eH9TbYCbMZjLlonvKFPJCGmPtKaqiSmdu5MEF4?=
 =?us-ascii?Q?aKRSqvrDCYMYJyHTqqusD4fCR8mkBIVXQZKiryQipIWR80TXdBSn3rCoDg31?=
 =?us-ascii?Q?oGIFw3KC8q2qSAs+qHuqjzxXcN6J0kE=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 688218b2-a1ea-463f-087e-08def242134f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:04:34.0375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bu/gZTWOynUuq52TPA1i+OMjtkblx6M6cp/DHZVotRhED6HN6/yHCsLEE+NtkCaUd94ycSrEcaV8hVqD9mST0KzK3V9ZZKdfP6LKOntgVrY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5761
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_090441_468867_735061B2 
X-CRM114-Status: GOOD (  10.79  )
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

Fix misprint in mdio bitfield name of GPIO_2ND_I2C_MODE register.

While at it also fix an7583 mdio. It should use an7583 specific
mdio bitfield.

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index abfb018f207e5..e8c018620f1e9 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -49,7 +49,7 @@
 
 /* MUX */
 #define REG_GPIO_2ND_I2C_MODE			0x0214
-#define GPIO_MDC_IO_MASTER_MODE_MODE		BIT(14)
+#define GPIO_MDC_IO_MASTER_MODE_MASK		BIT(14)
 #define GPIO_I2C_MASTER_MODE_MODE		BIT(13)
 #define GPIO_I2S_MODE_MASK			BIT(12)
 #define GPIO_I2C_SLAVE_MODE_MODE		BIT(11)
@@ -66,6 +66,7 @@
 #define GPIO_2ND_I2C_MODE_MASK			BIT(0)
 
 #define REG_GPIO_SPI_CS1_MODE			0x0218
+#define AN7583_GPIO_MDC_IO_MASTER_MODE_MASK	BIT(22)
 #define GPIO_PCM_SPI_CS4_MODE_MASK		BIT(21)
 #define GPIO_PCM_SPI_CS3_MODE_MASK		BIT(20)
 #define GPIO_PCM_SPI_CS2_MODE_P156_MASK		BIT(19)
@@ -1026,8 +1027,8 @@ static const struct airoha_pinctrl_func_group mdio_func_group[] = {
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_2ND_I2C_MODE,
-			GPIO_MDC_IO_MASTER_MODE_MODE,
-			GPIO_MDC_IO_MASTER_MODE_MODE
+			GPIO_MDC_IO_MASTER_MODE_MASK,
+			GPIO_MDC_IO_MASTER_MODE_MASK
 		},
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
@@ -1051,8 +1052,8 @@ static const struct airoha_pinctrl_func_group an7583_mdio_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_SPI_CS1_MODE,
-			GPIO_MDC_IO_MASTER_MODE_MODE,
-			GPIO_MDC_IO_MASTER_MODE_MODE
+			AN7583_GPIO_MDC_IO_MASTER_MODE_MASK,
+			AN7583_GPIO_MDC_IO_MASTER_MODE_MASK
 		},
 		.regmap_size = 2,
 	},
-- 
2.53.0


