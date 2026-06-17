Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741A4CD98F0
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 04:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ArfuR8NVzI67YXUhdxR740JEig1V7jCMqGkhEx3XjpY=; b=lkhMChqgJybxiR645TPdQLn2Eo
	0O4PUvNfhjMCIco0CKGs7UPnh2CjSwunmgdr2PQMm4smX+/bYkSz9I5Ct07evTphqfLCLBIbSPbw0
	arfP8msdJgqlhh0b42jZxWZgpZ6QGrVB9KTAShWDxcIL0eo9BU3tdKDdjCP+Do1GZ2LrCVPt8krUp
	iBj5Ai7ymiSTaMN7npTccVUQeGOWiAzO8GimiCUlodAi1kr7uk2KLhQgRoZsU1wVUK8nICSQMFmMb
	UnDaXAMLUpAuagn/SQUeQ1h0teLTmYZomcal7ajjSP07cGibQNUrxy/s0BEqDcS4ECA1H92/kWLrp
	gcr5s0CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZi1b-0000000Gbb8-3twZ;
	Wed, 17 Jun 2026 04:37:15 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZi1Y-0000000Gbah-0Aeh
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 04:37:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ewal0MX5GgNPE825t9RdJiM0FBpqwlacRtia1PuPELMKwmb/K2DV3iXcR0z02zCaK6kir2bk+7iRBiBHbbubh4KNV+als0iQHcxIXvErVq6OLod1ZxoO7a3Ogrxa+V2rjHSWRhcDScYrLj6bYFraddZkGzQ0bYo455DSJFd4w5Ct7UxWOnwUSsJrl3LYjRL5Fm/U5LqD1nYxpATzZtSA8bfrieiZG9FueBOGD8JQwk7Lk9ksh2IrnhMJO+4k3JCD6Bbdp35BRfEuf3bJqfaPPHPlm7244TK8Z/XNLs/PtydkWoXmZM6IfoANTDE8SV395mnNmGpL9GSkZhG0BpXBFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArfuR8NVzI67YXUhdxR740JEig1V7jCMqGkhEx3XjpY=;
 b=XznsjydwX9ygsE7lG8qScCaT42Qhgq6qGOdKzrnnuclyD9+dNxR7Wxhq4SoNj9IMJIB2WQ1cwnKnZRZOWXRoJHLUlS1g/mc/6riIc3FtzeqR4j6FpI4metU7NP0jp/t77zuIaWHoTQM8DjZtGJZ9iXmpy6/yPV8UUqZRk+VSBfSAn5KMT1+UljDNEaOBP4QxWaWASF4+vupyZUSGW8NqNjoxHMc9IB3tv1P+3wunjHdoclF0NevuKxCC80XfPXw4qXPZbc8FxnjNjL8Qs3V6TEo0EphzHpE9rICHw2Wmc6FxDxYP1Iy5qzr2CgkI02EXuMWfh5cexQcQXIFjnIGioQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArfuR8NVzI67YXUhdxR740JEig1V7jCMqGkhEx3XjpY=;
 b=Vzc8JneuarG4aZh819xQlEWXTcAORIFGZbQZbQOivAMBhZ6WNf1TA5reglXawk29L3ykgd00jyOFmkXTLF0mKXPy8ADqb9V5C/FUwINj9pz2C6idsqyOQ/y22QOBJrWocwQiZARAfD8//qWnF0JsAoqA8HIoM/I6PU0xYoeFKQG0aIGvVnI7M5ylNzceFw5emFBHOOiKjhjVI8HkESisjE71WwLa/wTYpcfl01O8sELYP7NAyI++Pxi+GQzoUQt7tHOqma98gFLwtBWJBsdVwDLbLb4WyOcyj7oEpiRiXkD6jLNaSP4PtPJqvQL7MVE5w5ZzB/xLZGwHfEvmfU7Zrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by GV2PR08MB10384.eurprd08.prod.outlook.com (2603:10a6:150:b2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 04:37:02 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Wed, 17 Jun 2026
 04:37:02 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v4 00/14] pinctrl: airoha: split driver on shared code and SoC specific drivers, add supporf of en7523
Date: Wed, 17 Jun 2026 07:36:40 +0300
Message-ID: <20260617043654.2790253-1-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::11) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|GV2PR08MB10384:EE_
X-MS-Office365-Filtering-Correlation-Id: e1733ffb-069f-44b1-fdd3-08decc2a137a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|1800799024|366016|23010399003|38350700014|921020|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: Nut1nqFmkNkZYo+GBC6zQ5mpzN5dNFiWZpuE/G2ZOj14f59/eUhsIk6PAHjrmEYYXJ1tPLflE14agLgY/A6ploy7Z5qkHB8I6uolz5QHHfpU2cfO7b8aPpWZqDYwkEeHbB9hWauY/mXNEl3oNeFg+NWik79o43N6jtYe8gWgYNBOZyajw6XHus9iNzyvqpojdQAkhjLAMRsMokvjNKXazcQVN8YNlzgZIltKq+foFU0SttclXBQSXm81veM4fZ36MzdFedXA8PB7qFovao9A4EQXQy6PCjXgfbrP7lpDVLguOqes58+Eqazz7KSVo3kwI/OW7pJuSrrDZu4GsAUq4ewsDI35cFR/1zo6XqnhI8Dur+bJSIQcYO3MurDn1pB61VjnaaogcZ4+BEO9aB/41pPdap0TlgHoPs+xrR5F5tWL5G3WwY0c6qftaRkPV6Lfl+hDS+U23xMDBWUNhMwYWBcpVjE9KPLPP2yTN4ynKfsw4Zq1m/VSN1RwetXh1GXkjrqviqn1zktCPMIVl2rgs6alehFiyxd8zIH9lQAoF1Obg+Dx8bdWmI6luqtBNTtEs5gmDsiLdnQhiJXuorEzuLVvNBAauETdxVunWQVlJmugTywdniSEN4FN3zQ2uUink1oBg0egcxWcVQvFyfBu0Fg152ds93+IhpHmj0Khd2lj+f0iEqtdoU9vC7HN7lmt9CoOycO55GkgsVW0FZiqUw7TUwviZYBmq452RQcrAPOQBTjjHGwHb3knuRTMo87UZOZHSTkCf7xIU6lTvqyjCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(23010399003)(38350700014)(921020)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZVh64S8JBE9PVXMDn6r+NzKKM29aE6RmY8Fxfw+sBMB/yjrp10k58cPGTAUr?=
 =?us-ascii?Q?LuhjOnTdJolnSfPkDahMkBL+VyRaWe7h500KWpUPF4n+3Kv6byo8Akit7Tdt?=
 =?us-ascii?Q?fzmJ7mlFHcBMSrweySGWpBspBKdu6HPaQJoE3duE1SRdfWXt8Io/o5Xl8cGL?=
 =?us-ascii?Q?kXJgVu+uDe3ECjBSmjEll4hz7DD4LcKjnELGK3vUYHWVEgdmvCt39uzbqZyR?=
 =?us-ascii?Q?e9XICi3tpWjRjILneflFwEvlZOg7Uvix5QHLm2ouFgaLGMz5e6IJUzOyLAFh?=
 =?us-ascii?Q?vwpcUjTfUXWZLGCytjCDxhWDOdXz0G11w1JhTYDGnoNB7I0grafhyT6WSrJ0?=
 =?us-ascii?Q?hOGzCHpwfIxoFYx1cMZqCfTCyciwFSO1PFyKRWDpUZegCwco57lEuPwyd2GL?=
 =?us-ascii?Q?/eA33Qgnbn7HmIWQnSzEgyu+25LZfappii+IDOAxPLgWcUWVrhtkYR2zZBK3?=
 =?us-ascii?Q?w1ka1flglIYyWuNFjbgwIRh43dB//YRPTMwZ2LpeTaoS/kIvUytPGCojw2pP?=
 =?us-ascii?Q?IJcMoxRHVEVrA++rs4esUqYg9uBk9DIU5Iq2Ft3OWcS0vuMHlt1nJpNDHyy7?=
 =?us-ascii?Q?SsW3787vFEHb2iC3EKe9mAi57JYpNOT5XVLXB0uuGiBCt22f66Q7aCTMrTbH?=
 =?us-ascii?Q?kQ73+PuaEhHIQv9ndrz0VQbD0uJzaLZdxoobpl0LAqsk6jdkGeU3L1PC7jfP?=
 =?us-ascii?Q?uPs1jBghjfZoOb4uLSTEku0YOwmNVO2SOZTjXay05AyPVW8QcnQDwImSVeop?=
 =?us-ascii?Q?kFfLZHMRiX4mz8tSbuv851A/xPB9qrm4kfOEulikkCxIwLjrKikj5gXfe0IH?=
 =?us-ascii?Q?ZhV/IchsDnA84vgaQb1w/KaZQLvZ4WpAky5S4hvdK8UaFMLKrNnoi5FmetGM?=
 =?us-ascii?Q?PMtRvidF6h4nNOkgEEke0M5GsHYDLlV15xmcZOUgivzelMxqrIjMGlOKsKyq?=
 =?us-ascii?Q?3bz07Gr2bwCm+A9XwLIiBn2ozBNGFTkVsQaJz71rSnpqQENDzL7pItMT+L+E?=
 =?us-ascii?Q?C0aE84Tn0YmeCp9q2m0krQ5Alz0tzJ+UEdIF7eDus+mNBsstwTS2b1REKa7t?=
 =?us-ascii?Q?y3f7/yr8us5U0MbtJaVv2dDCP37lKn95R+hwBKAtxC+53xIYGv1hOa2GNNxG?=
 =?us-ascii?Q?zwX3bYMoUwaqj21xnTOljXEFSoO6B9f5sNOpzen8x2KxyzikwZG0P0iFJXIm?=
 =?us-ascii?Q?h7LfUQd/UAAwkHb+bjjReBlVxR6abCpihW5M4K4r108/NV2ZLrkOjg9FN1k5?=
 =?us-ascii?Q?GLooZkGQ/qR6AGucPNuAT8QN/h77VTjonjmvH2hqi24GSS3gbDm5SWWzq8In?=
 =?us-ascii?Q?UATXQULtjo/RZqdqTGQ5uGvGaV/JoZSlmPhOfttZyq1EzjyvmUirrrpmi2A8?=
 =?us-ascii?Q?fMnmhja9trJkuqUOKE2O3hpWDdhFMKRpVR8N5H6GCp+uyz4V2GktM9+rhjel?=
 =?us-ascii?Q?0U8UTxglY+DCHM+A///XPzL7yKmLfqAbLxBghzDQx1O2HTY4M3gmhUqwHEnL?=
 =?us-ascii?Q?UvJ28mwmD/QHwZqYQt6VNNC80UwV6L/71iGo1vG3jb0vg4QUYm+O02BF1CMV?=
 =?us-ascii?Q?6aHfAtYt+GxUc6ovSDxa5gELWYhRH7oWw7h6sWq4Ln/hNUcAtRmOQ3k7Bamb?=
 =?us-ascii?Q?Hb3oNTHczNVkvBkuaruDOEZ1fS5a6gyKw5CKFxRe7JGxkSiNPlFbjqGiwHg2?=
 =?us-ascii?Q?6POAjGbOdgw6Er7LEUt6NQNQ9JwaVSulnZN8+jAiFT4yTOEp//gXe8o124L8?=
 =?us-ascii?Q?5tOGm+Cjv59nkIW6lK8wu2EFu2XVV8E=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: e1733ffb-069f-44b1-fdd3-08decc2a137a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 04:37:02.2412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BcZ/3olUUm8jJnVItK9UR0DafoDuhAQ6uy2pUJrBocVWgqXTxwhulbg9K6t5boSUGawVC6+JGBY0FlA7ufgNuwoFwELSUfxzlBqB4lHOaNM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB10384
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_213712_483847_208D7E36 
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

This patchset
 * fixes more airoha pinctrl issues
 * split combined driver on common code and several SoC specific drivers
 * improves an7583 pinctrl support
 * adds support of en7523 SoC

The driver split changes are based on Matheus Sampaio Queiroga work.

Changes v2:
 * more issues of airoha pinctrl driver was fixed
 * SoC specific register addresses, bitfields, macroses were
   removed from common header and placed to SoC specific file
 * fixed address of LAN LED mappings registers for en7523 SoC
 * improves support of an7583 pinctrl

Changes v3:
 * improve searching of chip scu regmap necessary for drivers
   operations

Changes v4:
 * an7583: add support of OLT pin function
 * an7581: do a proper fix of pcie_reset pins mux/conf.

Mikhail Kshevetskiy (14):
  pinctrl: airoha: an7581: fix misprint in bitfield name
  pinctrl: airoha: an7583: fix I2C0_SDA_PD register bit order
  pinctrl: airoha: an7583: there is no 2nd I2C bus via 1st I2C bus pins
    pinfunction
  pinctrl: airoha: an7581: fix mux/conf of pcie_reset pins
  pinctrl: airoha: an7583: fix muxing of non-gpio default pins
  pinctrl: airoha: move common definitions to the separate header
  pinctrl: airoha: split driver on shared code and SoC specific drivers
  pinctrl: airoha: an7581: remove en7581 prefix from variable names
  pinctrl: airoha: an7583: remove an7583 prefix from variable names and
    definitions
  pinctrl: airoha: an7583: add support for npu_uart pinmux
  pinctrl: airoha: an7583: add support for pon_alt pinmux
  pinctrl: airoha: an7583: add support for olt pinmux
  pinctrl: airoha: add support of en7523 SoC
  pinctrl: airoha: try to find chip scu node by phandle first

 drivers/pinctrl/airoha/Kconfig          |   24 +-
 drivers/pinctrl/airoha/Makefile         |    6 +
 drivers/pinctrl/airoha/airoha-common.h  |  204 ++
 drivers/pinctrl/airoha/pinctrl-airoha.c | 2401 +----------------------
 drivers/pinctrl/airoha/pinctrl-an7581.c | 1485 ++++++++++++++
 drivers/pinctrl/airoha/pinctrl-an7583.c | 1495 ++++++++++++++
 drivers/pinctrl/airoha/pinctrl-en7523.c | 1123 +++++++++++
 7 files changed, 4344 insertions(+), 2394 deletions(-)
 create mode 100644 drivers/pinctrl/airoha/airoha-common.h
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7581.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7583.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-en7523.c

-- 
2.53.0


