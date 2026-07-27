Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9B6C531FC
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 07:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PoihXNPfca3BmJ3uwvSOWPR4YUYltRteH3OYJNAyfq8=; b=NjYtYlcx1xrutTpwf1y+QQyeIu
	QswX+9JWKeHkpgnCghawL0w9lR4/PGJ6zKpThvvmDl0HhIcrJknuhYKJb2KK0YT2ihi0kX9iMcB2X
	KkF7ofII0EopHJyDvUEfTcMPFYCpAlVOBcgG62Te8MOwL0ZlwpuJ7qBst7fShqpWGJJXFKeOz3L0i
	975hy1yFzxmr2Dq5mJiyaUP14G6ojLxySy/gyD+JgJIZqCIg4IFLEGTu3ByyZQF7R/CfRLj8FNqpW
	kNcJMiVTfafMKyEKaRkfa4FvXGoj1+jjDHn7uNWUcd2FcGjfMEE2Av8FWvfF0aZWpeCMJ9ECnKuzS
	dTGGtXOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFzI-000000029uY-0zpu;
	Mon, 27 Jul 2026 07:43:00 +0000
Received: from mail-northeuropeazon11021117.outbound.protection.outlook.com ([52.101.65.117] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFzF-000000029nR-1kzl
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 07:42:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y4I0M6SSeo2C9bmkjNA4SN+tx9kWJAFh/MybtDHIf4YE804Tbi4QA66txGusd8yG8vTP+Lkf0dNb62rsYm3tSScDLjg9tUl/Te8CwM2ffZ1lmXuj0f8NNMF4M/78fvd65JYwkX33sa45rI3uFqXtP/B8gHI1oYYxmIroxSMX3iCCB6Q++CDjU5rsrF2LiBLBMcwH3xI+0UGWc9vn8yN4Aw3rCJ132zF7bOmtdKwAHV5t7ac+fpgOI39hSx/q54JOZae5U7ELV2T5fLARbBbKbNjQGj8waSnSrkldEsiwaNlbPB2ZB1/VjnkcOwbuBDtHL3wNS0PFXunJCI7rC0cxbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PoihXNPfca3BmJ3uwvSOWPR4YUYltRteH3OYJNAyfq8=;
 b=QW6GHS7NEGefhz7by5Ti+rUQB2y7C81pEb2kcLCRDWC8ISQw+RfconBGQ0lWYRuo3Kb2njl6vOQnA4E4WkyB6ZSECYg+pB/+k4ijrrrb0H9GQ0Jh9WVHuHmfDXOQoQeflqHYQhs7xb8Dwj5y8XEvCVZP2mI92+P4T5KjKNZLowp3X7zX05xnCLWIM+pt0Gk6JkNFIfcp3BSiu+wMG+SbGBBIkPJk740E/UD0eLuQSMwvh2bJ2jYf2OTDbRqh+XZ7R02+tQqG8egtafL8nZAj4V/boSCX9H8Gm9wn4KzYLc2Y0qkGYBuV82cjHmLCwSK4pOiu1MWxT3Mjr64StzIEmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PoihXNPfca3BmJ3uwvSOWPR4YUYltRteH3OYJNAyfq8=;
 b=OpfhjEMwoJ+9DE+8qbtLfeUyJpyNgBRieqNlk6B1OTqfXbk4nK2IY0ZA8yigiO2+qssZECGwGjIR6JLpghxMg99Zs0c2EC+8aIKP4iLIVxq1mDVAi3BLaCh9KxGl5L+wjfvKkaDKH5ttjIKHLx0v4Fu5tVnru00uRPFUWj25awSARX/8lRs+Jk6+mxDQ8Vjz29BdvZh0RX3JWKx6/486sTOCUlQrtHP8EnhcOdv7h6xqZXp+BYdTEP0p9qPLx/V/043ZYiZg3m7O6kNEpk7lVJMa84+o6moEWoaJuZTm+CrHU3aDaBYBRKHKZzGxtTri4F7Rfn4NfaCE1IPdqZDX+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PR3PR08MB5868.eurprd08.prod.outlook.com (2603:10a6:102:81::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 07:42:49 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 07:42:49 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v7 03/34] dt-bindings: pinctrl: airoha: an7583: fix device tree binding schema
Date: Mon, 27 Jul 2026 10:42:03 +0300
Message-ID: <20260727074234.3761170-4-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::20) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PR3PR08MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: 90ea60c1-2603-4a39-bf73-08deebb2a848
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|52116014|11063799006|56012099006|10067099003|6133799003|18002099003|22082099003|3023799007|38350700014|921020;
X-Microsoft-Antispam-Message-Info: giENKIoKI/v4DEf4U72Bvcqi7dc1i8Ix+O6rX5SNFxUbl+9vajtIzJ0coG3UacjCBzqPaScygbj2xXUvcXFJZoyx7NhHPqvrxjBzvVW9GoCxl3Skk9fxBVAhQJrIzlF1LPMMWK7dCv9mQQmK/oEZNmQ/OhRX6/XZT5MZSi6tbizNIa96+3GwNaXaTCSZsFBxlV755XBBPV9+jVvdpwWcziUwEGLVWGdDYn9SGQ2LSw/WWPOHFtYJ8F3z381ywQpJALGdgUePHNGfkep4VKeTaGyq6YiAcoCxps69IVfDsfrEgqgC/hHH45bG47ZTmiE7xiHtXwWGlv6NB7sD0Tu/J9aDC4d0jrZRg3sYUGWVRgkltuFWlhRsuqWHk3sxY6FZJtGyQlw1oY+1Yg9+TSinUgMETsncVUyw93l8XUkMYB/o7ivvwt0qxVUpNu3C5CUYGO6XFAGBu+SSTUAewVNvVqDrVPp5s/vn5oysAS0reJ6O+TKddLZvcGdb5xR76I0mM9EmNOHU/qxnPmz4r0oc2cg421hdUWEoEaCqiYKizKvkhl1DxiZVwpJJAUojxC37/sLExQxHoZi+rkp0+skqhh6dfLV9tbxaRit77j7WD2xchcX7h9ALPzAXpfcW/eHverRIQdHOm4du3B+iirawJv46Wggm1imB5Bfn8OAN0B4N46cUKnHPV8pI+G7sRWLLT4PhtvUyRpACbEgWRm5mLzleWwEA7/+z5nXEtNzHaMKN6xQX7N/vqJZbEw6voqGL
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(52116014)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(3023799007)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n76jh6yQmCqRacFEfxJqVoTkL1DpItV75ckFAARxqt3uB/WJAhwHIColHHEA?=
 =?us-ascii?Q?DRC/2uakEpzRjwhSsRT5yfVn8PQycrYIXkW5oMC2ok1sMGWVQDNfd2oQwH1n?=
 =?us-ascii?Q?tUJMf39J84PdoVzVwBb8hCZvlawkFjdP84VE68OlxU1L7lAF8bydSCfHThqU?=
 =?us-ascii?Q?8kTSxmarQvh2g2uyrvCyihEgqRr1e8Q7Avkm8iDEP2paNfESbDA5QLGHf98W?=
 =?us-ascii?Q?AuyWHG/Pxo26nehnqXjYXectTIuwSvr3WNOq7wltjjEk/gxBSck+a5+EJhoA?=
 =?us-ascii?Q?UighaAHpsjKHrAj47NL17HKVO0QGhk/A369BDISHzlNQvgGQ2Aka+JSBjHlt?=
 =?us-ascii?Q?sMZTCJVXsTTkqRSXPrqWx6XenQVRS1ln9TKwS06UkvVP5vh6ayFwdoUscgve?=
 =?us-ascii?Q?987t4X3qsGziS0PvfNImzKnupVopMaPgj5EXs9HYLFB6gXFMw0oQS0HHxtYw?=
 =?us-ascii?Q?6fPUPRzyLbyEcPO7VeTlVv5BaWCSYpMPgFOKp3dMWSCCOq/+IMCg8v61LG/S?=
 =?us-ascii?Q?BLVCKtKo9RAvXIMADBmagQCYwdIFt5axmP07ORqVf+88SU0Hq7U8z2lI1dla?=
 =?us-ascii?Q?CTY+zH4WscGgoLHeHhSWnDseWEa1SQWugetcVUpscOVcXcimZ/hdnT3VakTY?=
 =?us-ascii?Q?qJ+zb37LLe9Lw7Hv35i6gayYxUXVvIpqys17RrSy4kzrzjAI6LIuNe48G5ka?=
 =?us-ascii?Q?VuNSEv5bRLxVKir96kov5vR1Ep5mxGsjKPsEaJlqwpZdOgyEL8g0rFpH2FEX?=
 =?us-ascii?Q?Crj5XGagpmnBgndH+buutRc27+cFvmVSPZpSg5cFPqt8X9vDaM946fCTVKKy?=
 =?us-ascii?Q?TOQHFCD4enmx7cwEjNlpETxF9zqIhfFsfiRiQNpVEmT5kiDTHjna3zkg00tD?=
 =?us-ascii?Q?ZOwOfTxNgA4CowPv26O2kCxryi28oCY8YBlZMCIjMy4wMu9b3//BxKAtd+aG?=
 =?us-ascii?Q?41Qkwn4sUOUln06Jj04b9ve1Mc2mDiF6D2VaVL3jePEBo/hF0BAB/xypSPs6?=
 =?us-ascii?Q?mONfSNb+vALn2xHEuzGm5TA7vLI1GXHfWsQuYsSOHaiB79x26vMnoIGnXdrH?=
 =?us-ascii?Q?5bOELp6LOB5Qk3I+S2ea7K/ZjC+0DV6CPqEbZhvvudAFbPvmxzUDpKdZdP8V?=
 =?us-ascii?Q?ViUz81k7YVV1FIaCub9PE8j4zPTbzznZXMowc8rQ/HPgj6bOLY8K71yIkfht?=
 =?us-ascii?Q?2Xxgk70IYjAuAIZJ4eXWcfeXC+gGNdc0/DVEF5f1XspydG9ILCSpjGTxYUdk?=
 =?us-ascii?Q?O6NFwMI2NCVjnugO3C4GldPwrlTilj3oGzRwBF5ke0JdWDUARetZW+MA0dhr?=
 =?us-ascii?Q?5ZS5ycJEPcRk/7sNSmakSZCvkdO2WDc6HXdHfwWhqTbbc8DNYTA4GeAzLCba?=
 =?us-ascii?Q?j9XMzintWgwWe3iQEAeKXSseR9Wh1zI9dLNEWcmH7yLpqFCjmS2mA/JXrmEf?=
 =?us-ascii?Q?BSkL8RBZxzBy8NN1WZiSM3AfsY3Xyc7qhfwJHB4T04KYBwSDf7GpRcGNup27?=
 =?us-ascii?Q?rBldVyaFL1xcUC/w30aQD23Vj295RIF7QB1qfHPxOPo49gsXFpNqTB5XbOPU?=
 =?us-ascii?Q?dX33wPVEXU3wzIzC8glR5I/HKaPKNnIqQ/UdP/5t3FG9jSOxklBWW15jNsOL?=
 =?us-ascii?Q?sB8hnSp+lVabzKfi2idp98NDJRvg6cgFrhe+8BB7bhbSwtbdkrvWiAItrz4U?=
 =?us-ascii?Q?WpGkpsy6nHq9KFLGlXSupCB2LCD8ZXV44bgv4dnilPru2vJ48QkxPnfSHaFQ?=
 =?us-ascii?Q?XudwoK60kz0xQeRp0ULX5eA++kWMQwM=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 90ea60c1-2603-4a39-bf73-08deebb2a848
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 07:42:49.4943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mJgxZLRcLGjl1dcANjr9/c3KT26Cu2iIj/0f5P4+45UelrfxPfbogYaXtJCC+JNHgfjFm6VEu/1vhjyEv/PyQEoq3ut1KGDiwiEwJx56SiE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5868
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_004257_460172_F510CD10 
X-CRM114-Status: UNSURE (   8.89  )
X-CRM114-Notice: Please train this message.
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

An7583 device tree binding schema was more or less blinly copied from
corresponding en7581 schema. As result it's not correct.

There are following issues:
 * i2s pin-function is not really defined for an7583
 * i2s pin-function by mistake was replaced by i2c pin-function in the
   functions/groups checks
 * pcm_spi pin-function defined for less number of pin-groups
 * pwm pin-function should have more pin-groups elements
 * unexisting pins was defined

This patch fixes an7583 schema, so it matches actual pinctrl driver.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../pinctrl/airoha,an7583-pinctrl.yaml        | 37 +++++++------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
index 79910214d9b5c..f52802a3ad79d 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
@@ -61,7 +61,7 @@ patternProperties:
             description:
               A string containing the name of the function to mux to the group.
             enum: [pon, tod_1pps, sipo, mdio, uart, i2c, jtag, pcm, spi,
-                   pcm_spi, i2s, emmc, pnand, pcie_reset, pwm, phy1_led0,
+                   pcm_spi, emmc, pnand, pcie_reset, pwm, phy1_led0,
                    phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_led1,
                    phy3_led1, phy4_led1]
 
@@ -159,17 +159,8 @@ patternProperties:
               properties:
                 groups:
                   items:
-                    enum: [pcm_spi, pcm_spi_int, pcm_spi_rst, pcm_spi_cs1,
-                           pcm_spi_cs2, pcm_spi_cs3, pcm_spi_cs4]
-                  maxItems: 7
-          - if:
-              properties:
-                function:
-                  const: i2c
-            then:
-              properties:
-                groups:
-                  enum: [i2s]
+                    enum: [pcm_spi, pcm_spi_rst, pcm_spi_cs1]
+                  maxItems: 3
           - if:
               properties:
                 function:
@@ -207,7 +198,8 @@ patternProperties:
                          gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
                          gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
                          gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
-                         gpio42, gpio43, gpio44, gpio45, gpio46, gpio47]
+                         gpio42, gpio43, gpio44, gpio45, gpio46, gpio47,
+                         gpio48]
           - if:
               properties:
                 function:
@@ -288,17 +280,16 @@ patternProperties:
             description:
               An array of strings. Each string contains the name of a pin.
             items:
-              enum: [uart1_txd, uart1_rxd, i2c_scl, i2c_sda, spi_cs0, spi_clk,
-                     spi_mosi, spi_miso, gpio0, gpio1, gpio2, gpio3, gpio4,
-                     gpio5, gpio6, gpio7, gpio8, gpio9, gpio10, gpio11, gpio12,
-                     gpio13, gpio14, gpio15, gpio16, gpio17, gpio18, gpio19,
-                     gpio20, gpio21, gpio22, gpio23, gpio24, gpio25, gpio26,
-                     gpio27, gpio28, gpio29, gpio30, gpio31, gpio32, gpio33,
-                     gpio34, gpio35, gpio36, gpio37, gpio38, gpio39, gpio40,
-                     gpio41, gpio42, gpio43, gpio44, gpio45, gpio46,
-                     pcie_reset0, pcie_reset1, pcie_reset2]
+              enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gpio7,
+                     gpio8, gpio9, gpio10, gpio11, gpio12, gpio13, gpio14,
+                     gpio15, gpio16, gpio17, gpio18, gpio19, gpio20, gpio21,
+                     gpio22, gpio23, gpio24, gpio25, gpio26, gpio27, gpio28,
+                     gpio29, gpio30, gpio31, gpio32, gpio33, gpio34, gpio35,
+                     gpio36, gpio37, gpio38, i2c0_scl, i2c0_sda, i2c1_scl,
+                     i2c1_sda, spi_clk, spi_cs, spi_mosi, spi_miso, uart_txd,
+                     uart_rxd, pcie_reset0, pcie_reset1, mdc_0, mdio_0]
             minItems: 1
-            maxItems: 58
+            maxItems: 53
 
           bias-disable: true
 
-- 
2.53.0


