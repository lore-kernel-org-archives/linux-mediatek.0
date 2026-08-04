Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B9CC55838
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2026 16:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z62y/O8beT+usARhO3M4MjzPLwrGaSBe5pzK4FkLyHE=; b=KsjhvoZLAK8I1EHub2KlE//jra
	azIfSBit0oyQEhN5LoILcqSF8bXauMcCJe3+6Wtr05WNG/RXKRYf6QPSR+pJkaeHQK1dgb0oXGKsi
	tTbUVA/HyhfDlYaM1HIrYIEYTW/JnAPnVg73PngYMfK93TWQNGfTTsUpLpYXxdMaXhbvju07/Vt0+
	U4VEpRCzU7fOHkvq8go/JHBOivwB9Iql1jzWfJ43XmuYwLY/vsFKJj5aDYoebpPMEXANpuMSKOafo
	wilabKr2x9A+iVTGpARolzM6MAWHl7IX7s+INRAu6bKEGbkfbDsWhmgbjNJrEvxOamAhgbPbM8Vnu
	WtMPZxTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHdQ-00000002GJd-0nrg;
	Tue, 04 Aug 2026 16:04:56 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHdM-00000002G5k-3rsk
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Aug 2026 16:04:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m44tLNq4uP9JjiGleYvdH0wSqUBU3vydZRo4p8G1tBG5X812jVd6RxVqcPwFzw02oKQSosLaKgQ6uLSYFrruXV3GXJLWmES+OAgtqAL3jreAim+/VEl7Byrgrbpdgh1dUXRih8J1yQHTIrzb8vgZg8DdNEqqG0C/3c+WJYKHm+XpH/kdMt8YlvSyAndi6WhC9XVIE3p7pm4hNbAcZX/lAjsbqB/6X6o9olanxPGWQtwfOHfwmZKz1a2gmLkWBvn0uD5EDq19zyfhzLZrFxxSNcEX+03SEKEYfqBu9vkA7LOA6fxq+udQXOpuPk7w0fbQSe0aeEKYCieda3rCK1VfCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z62y/O8beT+usARhO3M4MjzPLwrGaSBe5pzK4FkLyHE=;
 b=Ld3ICptUTnvFONF1UXe5mjKN57NITKdD/wqshXWs+ZmVcAhZsGrcU+s8uazFb1pci+cxsgnI+/+WiDRPs6ivkdFvmcNL+oEHildi5MNHsM0X2gElKArB3f+7kZRcJKcLLWhmZIvy2zAVRCHwZv8FPF9g0CI6VW+sgqa6f4QaYvT4u+/hE7iMnriIBOtq6n7MnoGhvGMAeGWWf/BbUkU1Od9vA/xGCIwRdFPH1BP8GkodJyngFerAVqNQgPqq1IZdnj7Zi1dlykIWNdQAQ16fXWMiaTKSyWGaISQWIJufpm/LXERJpfwZCvl2meeoF1K1BtGe/jL03zRY/vFeeVyV+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z62y/O8beT+usARhO3M4MjzPLwrGaSBe5pzK4FkLyHE=;
 b=N/M0rDnW5tLFRYudBtEn6o6sdwG1FJkeaKVkKJzO9kzFDUy12BBBlL17H+RoXFbyctYD8nXUgjQzRJRYFr099HU8KB73T2RLdlDdLhI1uI7xVg5XS29fWzbzwGsREGXBPgN9u70kBLEv3W2BfpYgnLHmOqkMUmaviIsVQbWPw5IlUqZNwp8Pp5F6udWx9BPi7/P031+fsylZkI19SZtnGjZSohlVFYedg0XULql9mwBEGjKzr8KXMgXBtxawMvf9n4Xlcpb79f9pjq6oSBXt9aTDYfxeiVfs+lzW7zm/UysfD6+iIlyENoSPr9Mu5CogRBih7dj+a9NRK2uCXctD0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM8PR08MB5761.eurprd08.prod.outlook.com (2603:10a6:20b:1d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 16:04:45 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 16:04:45 +0000
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
Subject: [PATCH v9 09/36] dt-bindings: pinctrl: airoha: an7583: allow configuration of non-gpio default pins as gpio and pwm
Date: Tue,  4 Aug 2026 19:03:52 +0300
Message-ID: <20260804160419.3592327-10-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: dad767e3-f78c-42cd-f3fd-08def2421a20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|23010399003|921020|38350700014|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: ne7G3QtEPO7htBQy6tZkYahYLNo80tFhXxz4uLg2XnSSI/T0VPDyWG999G9WZ63MSkQa95PWPISXH+XpuQM7JknAV6oHMknQmmKNasW/Js4uvVTkBdknCI9QdBtDTCJmH7MRHm8yn7kWvabSNvBoWuXbI1K7ZC/2xV1ZcX/38bJO50LGfR0TPQLzcsKA17UPePIha9b0hr/788Fr87OxH1NTcE9E3aS5J8TSw8rNftO8hvwGmjiVRC96wRha9+Ks9Ds4UzvpyJbE9865C2TfwHOZlGCi7COmvrZcRMSxFNOYZs+4NQF+lJ3YrIHBunmZlL4yubA4FS117aciflklw7FFTgYu+1RJkPmbe4CnR3OAe0eKtUR6P3fKsdj9YOuk8LPwp9fz7LuOJSgMoCLAKuT525Lt0MbtLEKnt/bGgZ73lc0CujrEGNWegEL9JV3oLTDqIM8pmJg8GEJxs+R6blB1u3BSAg8P9F3tgwgtwjjkT5WfeIFFvY+bBXRWKSrlJYbjaaJWngYtJDKmJD77YbmP7wIo92lt98ZeNsegFjyeKisl/hh69eRN/D8iFTAUMHrin8J7ZA2D0PYGgiYDvEmITeVCON40liEHugS9BUR/WFLC7Yca8UoZNu/RzOIlOmCS22V8jRgGyqhxwYPDJlhA3MvRnSKyMVjk3BhoMGII2nMLRdvs5B8PEQUnPZx5Ev9jW+atXNQv9rm8B9I5emcN80w7ARtRollJlZEC+2hRIKezFKGBhFl7BGKzUmor
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(23010399003)(921020)(38350700014)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZHwR6BoTtXoeMMqkZo5BKa5+78fWBYARABu5G9C8rtb6IjlMVkZZ1qo06x56?=
 =?us-ascii?Q?jxGswXn83Vam/9QCcwtLWj4k0UgjYxvr60y0tUqQ27B1K0O4jG9W5Sf9tAPY?=
 =?us-ascii?Q?zdCAucqPJ9T65paOHEfz2tVkdWwI7L/OSdeINOmPqLZJ2RR6kcFPDcmh82IG?=
 =?us-ascii?Q?uTw3TiJCqp5hzqqoUKSOdfMJbNAcWSBT8cZlW1QkdtT6hSZFax50oP5mWDld?=
 =?us-ascii?Q?OxrLdpcd8M6VSeA+6HyVXaGIMiJduQuOF1hc17zSPhDy6++7OX04TCgJxGtk?=
 =?us-ascii?Q?9gLBaUrec5QPPU7hgPQ4Z/BBF6bx/dVA7YfonjLZZYLxBJy0yG7DKfAfMah+?=
 =?us-ascii?Q?1DyCu350+H3qKYP3uZvBZPpAfhNAsWOHGOApsNS+QOAOsiQOGizEbOIS3PIu?=
 =?us-ascii?Q?f97NAmri/+fu3Ri2spAJ23vPSBrtLBWQV4uyV3USGfg3B4NSHnc5jszdlmt7?=
 =?us-ascii?Q?XiENxpW6GIFHwS03iY5lFlZJObfBiE5l53hHyxwAh0Kg1BTPxP9aGtuNS0av?=
 =?us-ascii?Q?sEwLgpmczBShDYbvpQXkSrOuQj/IfBK82Pg2R6+2C7Xto18U2wE/yOCAUICT?=
 =?us-ascii?Q?ZtsjDHWudNyFIvvAit2IUPD1yIS4B9b5fgxYHT9Bjj78Wxsm+y7I6YXXXHc5?=
 =?us-ascii?Q?waYyEa7XXx4ETf2MtH/prxoqZromhr5CGNyV1/qQ+OlwqMG/gx+xnjkCguK+?=
 =?us-ascii?Q?DIJ6GyIvs6s7kmaieem8hERycwDNcx3vGdrwIzGJLP7tkgJhY6YNCqWDlvxq?=
 =?us-ascii?Q?FEgWsPSaVt5A6qGo3cjlhkZJhUKGolJqP0KCivUof9YJ0R/4qlr3XygoyZXu?=
 =?us-ascii?Q?9hIDSbd58sGeYjIVjZ398Wj+8AbgzZa63sck9jza9Jnc2wamf4N8A8LPZBTq?=
 =?us-ascii?Q?ko+tQB0Rt8wcNEhO3HO0ZwMN9LW1RRoNxyw10S9EghVYIMdbAakc6RPnx6xG?=
 =?us-ascii?Q?CvfccVhZW2WipouRgBLPuIgoSQiJtcraDbLZbWbpwN3llihSsTjs72pz7U0u?=
 =?us-ascii?Q?3jOetwm2RNvvZMc/bPyyJWDMpDX4yBAadxvu8iOVYSFMbDuJg76OXdLpzG23?=
 =?us-ascii?Q?P8LiWek2DW+MDWffiWRjsKhtqznOjii6Hb9pi2Czs8N5jtsGmePdD/Epl3bu?=
 =?us-ascii?Q?UKm0SKwk30WASMf7A9RxnOCFjPepHPtUImUAwc/bc79y4iPb1ShV1cCXy8mP?=
 =?us-ascii?Q?QfCpjX9Pk2aMNw4WpibVOzEb6nxexlt8+DhGtrQDshD1coX/31UCXgGVFC+A?=
 =?us-ascii?Q?uMwGcSQQ41EpwmttyJlzErkpldLotxi7porGe+GcYrAQc7BKkrrzC0wUVWXw?=
 =?us-ascii?Q?3iXNLaqy2G72voK+bJMfLx+bWLsm4dsBBHIh6i8z6q8njbL/kD0JygwR8kdj?=
 =?us-ascii?Q?j7l0evEO2IRR3+LZgVy6UbvBK0MDb4QrU/UBOTDvBi4W8gGr+6npCS6EAtaj?=
 =?us-ascii?Q?pFMPbL9kHP1VgZnWm+3ZkFbC/FBHSs7RbkiIbWqgwV9rYb8y2P2FjBzrPIQ8?=
 =?us-ascii?Q?RdhHsXDTyJliyM5k1ags7ewOo4dzY3luTC26Gupy5zJdeXJ7vSCrOx8Tboq/?=
 =?us-ascii?Q?HH/NwBHH4OgpqJxeiBL2yZs83NNzst41Jmv57p1mloZWJXVVPBPcOHLY5mTv?=
 =?us-ascii?Q?tkA+IFmuzACVr8TPT3asU1i1lWC4rpHcZe73UfJAKPlqDy1Xk1Yt2FsdmwBW?=
 =?us-ascii?Q?XnOWGj5SjskcICiTVcNIPubd1D4P4Piesba4JFaI9bpoldj0OlxaPnrSoMbP?=
 =?us-ascii?Q?TPyqy/oEQBanCgxPuM4TETTpbtDfS3Q=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: dad767e3-f78c-42cd-f3fd-08def2421a20
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:04:45.5313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UOVDEQd3LqF5FIzVBxcHqESmI33HSSJUix5yIbkPZGdO24amfMeHskH6PbQUS6Ie6YsseIgyw5dVes7R/lwWHQ3Tem1xKzBAJ2NXQ5s999A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5761
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_090452_960925_A8F4D250 
X-CRM114-Status: UNSURE (   9.81  )
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

Some AN7583 pins have non-gpio default settings. This patch provides a way
to configure such pins as GPIO or PWM.

Please note that gpio52 pin can't be configured as PWM pin.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../bindings/pinctrl/airoha,an7583-pinctrl.yaml    | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
index f52802a3ad79d..e2896db7740fd 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
@@ -61,7 +61,7 @@ patternProperties:
             description:
               A string containing the name of the function to mux to the group.
             enum: [pon, tod_1pps, sipo, mdio, uart, i2c, jtag, pcm, spi,
-                   pcm_spi, emmc, pnand, pcie_reset, pwm, phy1_led0,
+                   pcm_spi, emmc, pnand, gpio, pcie_reset, pwm, phy1_led0,
                    phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_led1,
                    phy3_led1, phy4_led1]
 
@@ -177,6 +177,16 @@ patternProperties:
               properties:
                 groups:
                   enum: [pnand]
+          - if:
+              properties:
+                function:
+                  const: gpio
+            then:
+              properties:
+                groups:
+                  enum: [gpio39, gpio40, gpio41, gpio42, gpio43, gpio44,
+                         gpio45, gpio46, gpio47, gpio48, gpio49, gpio50,
+                         gpio51, gpio52]
           - if:
               properties:
                 function:
@@ -199,7 +209,7 @@ patternProperties:
                          gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
                          gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
                          gpio42, gpio43, gpio44, gpio45, gpio46, gpio47,
-                         gpio48]
+                         gpio48, gpio49, gpio50, gpio51]
           - if:
               properties:
                 function:
-- 
2.53.0


