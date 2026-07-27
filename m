Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD939C531D0
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 07:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kXUQqRfRgEv8OZlgAWTacNdZ7iIT329UkmX331ftvuI=; b=ASUJ0y4iULNpNXSRtTltO2GdMK
	7VpjIlKsQfQvaj4AGUp+mZnUs5KpbpVjZtxzhpj7CLTAObKG188iRk/xm0Z15yUHAKwuEuQaGkr9p
	hncgkp3puBxGVRg1JfJ2TyG1eeWP2CZ02YgitD8ff8X6aC7FUHeUHSz/Sfg0h23R4R1U2WpSe6jTo
	CUKYDqvr/8LD3/Kmi4nARTpyafSSHUs1DMYEQb0qEzrWbbFabOxFW6Q4/fIFFSAR5TmL7kQnoxq81
	HeeRhcsFs03k9exApll/9qyRF6k9oc30L2BKhWnAbuMGKQjFqzknSpFF4P7UfYwm70YezAFWalHub
	vvPbQByw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFzA-000000029pF-2bYb;
	Mon, 27 Jul 2026 07:42:52 +0000
Received: from mail-northeuropeazon11021117.outbound.protection.outlook.com ([52.101.65.117] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFz7-000000029nR-2Ld0
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 07:42:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZL3IEnDJak5ivjBDFezrydBcaSYj2NRsYKGM0WQ2YkB387TPwsBvwyscfTXd40hxVtjQaQNjgcUCio+Uuf9P7obaZNBgBgyl45PCrV06ebYHDapSmdC18TUGVystLv6/Q0G0ghhzd6xZjEQBzhRRPhFPg8yhqtS/O8jvxGHeXzdXkFZunCwobA00f6WgEDxe6f907hXu6RWj/uey3rzSeEd9PmbG9S2eOIAlCS4h03jkHC80tg+rtbIz+xovrtEYSUykT0/v6sVo0CX89WdLzml24Vo1KeuXXfYvYd3Jifl/n3k2cvqJd+8LFQjYhDA+oBU36nqGdOzWgDXIg98qGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kXUQqRfRgEv8OZlgAWTacNdZ7iIT329UkmX331ftvuI=;
 b=yROSO7kfV77aI2w7gkMHlI9Meicf4TzXGNmSmAP/H9/JPZjzEBDMj12V5rfgKcKtk4ABs4aO01MX5mXKTSDWc4wy5Okf7f4vXFcESPLfbzWTiKqIDBOJrMMjREnMeqTeR7S2R/3nglZwN3artsVj1NotNl8F6p0ZU5H3IcILWvVKdkuhaJp4ZuBaoKiocBbReBXlsyx/8t2HH8EYbXIWsoF5qUT0OWPVG57ogg8XTFiS+5wJP4eelmnMemyg0uBunZETvZhrYj3QUvWqVsZody1s/k/Fr80spUTIb8aNVtXenuTwza8dT/ZGealfc6f5V4BVMdjhIdg270Nbu/iySw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kXUQqRfRgEv8OZlgAWTacNdZ7iIT329UkmX331ftvuI=;
 b=nQMvBD5EWa41fzVxnRfeDphTEPb5sq4OdZ2x5BsnT7m3jtUBJSPmhySsbcizUe6LPZov5Ykb1Nt738ydRZV+uegh1EhRYjcB4p1Gd+g43BC6tDGhJyl8eGcMv2bXX81hQhT8kcJPeikO/rBbAA+H9K38L/AWVItCPStXlSOsOdaj4Au6+x1j7rof/Ak78cCFUyfWix9EGhaoRjUcjGfkhX+981wzS4q3bnZ8nxnynt9TP61j2Pn36l9dNKnwlycD41ZQ+swS1jKV6rUEV6oMpKfZqKllT9gX+uFpBbz8pVxCxwKNuzBsaorvUSDgKdreIvMDpcqYT0qBmQulOVcxXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PR3PR08MB5868.eurprd08.prod.outlook.com (2603:10a6:102:81::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 07:42:43 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 07:42:43 +0000
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
Subject: [PATCH v7 00/34] pinctrl: airoha: split on shared and SoC drivers, add more SoCs
Date: Mon, 27 Jul 2026 10:42:00 +0300
Message-ID: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::20) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PR3PR08MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: 81157f5b-6ce6-4135-574c-08deebb2a4a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|52116014|11063799006|56012099006|10067099003|6133799003|18002099003|3023799007|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 6nmqL/EKtN22YFC96t04DZw7KZKyZHSZQzJLC/pcLSWpcchfa1BMhMct7Ka9O0puV+H4RCdhXCDXwJESYn7iOo8yEtHRN3Aar0bLnB+8v6q/stXlYiY1zLxtb141092/i1ieCmpb733mSWe2500Ew58PgluIsf2WYqBs5djBOxHSpOrRHkixStVBndZf9RHfIqG7W7QxUAeuxWGNIj9znyiJhEnOw4mFTCLlEa5rcJ3L7jkmFtDWRf+WYxFMPNiUkwv29WgZvv3fihN09fxe2bZ1mRGk9AIOr4E59xT19I/k3K4HFP8XMR6VVjn16Tzb67VEnvJXMWJUe+fa0xdnu8YA52sbYtvs3cB7r47V9CIC6TIqcyirezdyABVDacAp9DmLbIOIr1Qsm2MAQLHMtpF0iMJ+U3yPJplEi5V52+HSPACfPD+gjpUo4pPHEmdE/FHa+xF5jz9ThpIckgr2zfbC+vG8izWUQ5hU4UGRiRKhP+Z9L9mR6Cmjk+v3SCEms9NUKJefF5dwEVaLIprOdRN7HumyeLwNHHF+nId8u6HgBs18qtVFBF7ALAB04ZVe0czwllZTcJ2VId9GS+8piAzi7grV0vFZ8GBGdwdCWIL+fpOToG2hcWjcGdtnxuCCB/Tqo0tNzKwi8qlYqcawncJh268TzUAIy77q9+vAtSddsIGt3hADhKnl9G54noQH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(52116014)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(3023799007)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YAK7GvXAUmRPWK3OPH6zDjc534beqjI0EnPCQnjFB1DM/wcsXVP0VKNGTnr/?=
 =?us-ascii?Q?xwZaXldMu2atbA6P1+Pcjm+qHhClIvihSkP0GMNnz835keDyKoPDQTG8Ofvw?=
 =?us-ascii?Q?C+8Z2zAneebjZHyhbBEmO6cJ4gAiSOcsoAmDHWjE4JtZaN5GSDqNIGc61Mpd?=
 =?us-ascii?Q?H+m32guj7eY/0OHaJG5da3AaMHv0iiH0f7D8iv7dvqaXemCUGOkasP5dhpuD?=
 =?us-ascii?Q?orjvJuBtK6JM49TZGDwfWwjteKTiXZDLSAtJCQhsVPNfwkMhy3ia/K56gRvb?=
 =?us-ascii?Q?W/y8hSPUVzKZmyAeJy5NCPzhBvX3udEtUmiLFyr8P9NSqDCKa0LqsqJ1Hno+?=
 =?us-ascii?Q?IpikQGQ6Py17f5E6CPnaObcz9o4++Fn/S017UJ24Tb5VcTRTSchotQhsBrp5?=
 =?us-ascii?Q?3aP4awrjfpGjlclw/nTH147hf0b/iVOT2W0DUQpvJZ9EKI/KC8ulkX8/mYuo?=
 =?us-ascii?Q?6AT5Ygtsw1IVI2Cua1xfBj4fjAA0/4iOlxFYM4Xn43tV3o6mfZOWoa/8IZqu?=
 =?us-ascii?Q?xZztV+FIPGwdUuvvWTKU/m2VVk0rgUDhTgFXGNWzKNtINac3fhSipzwi9Ilv?=
 =?us-ascii?Q?vru8nUrPnS7wLpdldsorV3jOEwTb/+NHmmzcLxp92P8Fan9o3f7zrE0lkGvm?=
 =?us-ascii?Q?u9Icc0V7GIXh5NHWiuCM4HJvu7WUS7ARPySW+PO/NWau41x3RMaIGbC7QUT3?=
 =?us-ascii?Q?5hr/yvJZDfCNicd4Ld9SoWZbG36UrxU5MoI+yqvTCEG/pMTLH70ORODAtoez?=
 =?us-ascii?Q?yVLCeHngJ5kBhfuws2G4YHLnS45fT3bRb9UsjUc37TnkyYe5K5QLdt+OHAwi?=
 =?us-ascii?Q?k0tO0wYSWMiielC+vDAJ6VYuZ18cYQpIfl+iDekrCRbsIOHsRDJb9WPSPsKx?=
 =?us-ascii?Q?0O1udMT2OSspKyLr8lRCOeNA4eUW5TWk8KisJm7rlpInor1wipKT3wIKcuLR?=
 =?us-ascii?Q?+R1s5mZyl18GAJ3Cc9nkkVI4hgpqELluUVEF79VD47v+teYSbFw2cflfvYFZ?=
 =?us-ascii?Q?rCm2GV7InM3KLojILHdfSIixMI4uVTXo2lYDCmF1yA899g4QroVa7uo6KKvH?=
 =?us-ascii?Q?/jApBZomm37EcxvZGEUixPNxGm5fug85TTufYFhZNZCrd6szly/q1hCRNPjD?=
 =?us-ascii?Q?jtxKW9zlO9QwZGMZl3il1amPefW++ULn1shNxeZZZCPuowXbnsldDRAza4D5?=
 =?us-ascii?Q?q7mNDNVFa0aAUZSuQSjKDkgOYXQEZGrlmKPRVn6KNixzE0kq0HAgLIWl7MzG?=
 =?us-ascii?Q?VKSy5FYR6knahOotWGIE5MiawKOX6OQ2KACSHiXn2UC7NMPtfYBOvKjjv7Pe?=
 =?us-ascii?Q?DNCE32ssz5egdyPqaFxx0qAZ0qnlmgY7FSw+uNUOD6q+3Uent5MqaFb6lvCY?=
 =?us-ascii?Q?ly1Hol1mL+QMISlP+c613MTjMTl0WbWB6WV/NoDaTaSmwMTspeHcrYQAbbOV?=
 =?us-ascii?Q?DdRRk8ljz2BKPcc+4D15Fiua2xW7gRY4uExbO/VrWqzVaCiBOMppEkaKYXDh?=
 =?us-ascii?Q?cyABhCvTD3wHr0xHgXGU4FD35ldzqPBcaUR6ZZki2YRxCG7Vo9D6scLxSarV?=
 =?us-ascii?Q?bCY/CnxLEzCEYlrDxBFOqMKcjeOOGYhxtUG9WoRO1nXrxEAV3JUaSExNaIth?=
 =?us-ascii?Q?d9TlOieReGnDLHTwrHqmh8Us6XsHxe175TJP8Ua/6ZDEFcJmNP+sZYRGBD5+?=
 =?us-ascii?Q?tE9HA3YbXcEZok+yyM1OmPj+KiRuQKeD8a+PToWW//WKvGSSUFMyONpBNdE4?=
 =?us-ascii?Q?x10UdOqU0L210VWESeK7T9NRMUVNrxo=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 81157f5b-6ce6-4135-574c-08deebb2a4a8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 07:42:43.5889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K+AHw5y5qhPRWDxr/xInS9ADhZntW5IYHmhG7+TxpiwpvlYzb8Q2XTmNKw5iMWgsVdlDFvo9AqAGAUOHhIxWvAHWEYk5CGYRqybo7ygPNq8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5868
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_004250_045921_D2AF5053 
X-CRM114-Status: GOOD (  12.63  )
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
 * adds support of an7563 SoC

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

Changes v5:
 * improve description of an7583 i2c pinmux fix
 * rename an7583 registers to match its an7583 names
 * add support of an7563 SoC

Changes v6:
 * fix some of the issues found by
   https://sashiko.dev/#/patchset/20260622113046.3619139-1-mikhail.kshevetskiy%40iopsys.eu
 * update device tree binding
 * add bindings for en7523 and an7563

Changes v7:
 * a lot of IRQ support fixes, now there is chances that IRQ code is
   really working
 * device tree bindings moved to the separate patches
 * fix some of the issues found by
   https://sashiko.dev/#/patchset/20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu

Mikhail Kshevetskiy (34):
  dt-bindings: pinctrl: airoha: en7581: fix misprint in i2s function
    name
  dt-bindings: pinctrl: airoha: en7581: fix pwm pin-groups
  dt-bindings: pinctrl: airoha: an7583: fix device tree binding schema
  pinctrl: airoha: an7581: fix misprint in bitfield name
  pinctrl: airoha: an7583: fix I2C0_SDA_PD register bit order
  pinctrl: airoha: an7583: there are no muxes to enable i2c buses
  dt-bindings: pinctrl: airoha: an7583: remove i2c pin function
  pinctrl: airoha: an7581: fix mux/conf of pcie_reset pins
  dt-bindings: pinctrl: airoha: en7581: allow configuration of
    pcie_reset pins as gpio or pwm
  pinctrl: airoha: an7583: fix muxing of non-gpio default pins
  dt-bindings: pinctrl: airoha: an7583: allow configuration of non-gpio
    default pins as gpio and pwm
  pinctrl: airoha: add missed get_direction() function for gpio_chip
  pinctrl: airoha: add set_direction() helper for gpio_chip
  pinctrl: airoha: fix potential kenel panic in IRQ handling code
  pinctrl: airoha: fix IRQ mask/unmask code
  pinctrl: airoha: add missed IRQ resource helpers
  pinctrl: airoha: fix edge-triggered interrupts handling
  pinctrl: airoha: remove not needed irq_type[] array
  pinctrl: airoha: move common definitions to the separate header
  pinctrl: airoha: split driver on shared code and SoC specific drivers
  pinctrl: airoha: an7581: remove en7581 prefix from variable names
  pinctrl: airoha: an7583: remove an7583 prefix from variable names and
    definitions
  pinctrl: airoha: an7583: rename registers to match its an7583 names
  pinctrl: airoha: an7583: add support for npu_uart pinmux
  dt-bindings: pinctrl: airoha: an7583: add npu_uart pin group
  pinctrl: airoha: an7583: add support for pon_alt pinmux
  dt-bindings: pinctrl: airoha: an7583: add pon_alt pin group
  pinctrl: airoha: an7583: add support for olt pinmux
  dt-bindings: pinctrl: airoha: an7583: add olt function/group
  pinctrl: airoha: add support of en7523 SoC
  pinctrl: airoha: try to find chip scu node by phandle first
  dt-bindings: pinctrl: airoha: add support of en7523 pin controller
  pinctrl: airoha: add support of an7563 SoC
  dt-bindings: pinctrl: airoha: add support of an7563 pin controller

 .../pinctrl/airoha,an7563-pinctrl.yaml        |  348 +++
 .../pinctrl/airoha,an7583-pinctrl.yaml        |   65 +-
 .../pinctrl/airoha,en7523-pinctrl.yaml        |  375 +++
 .../pinctrl/airoha,en7581-pinctrl.yaml        |   15 +-
 drivers/pinctrl/airoha/Kconfig                |   42 +-
 drivers/pinctrl/airoha/Makefile               |    7 +
 drivers/pinctrl/airoha/airoha-common.h        |  169 ++
 drivers/pinctrl/airoha/pinctrl-airoha.c       | 2608 +----------------
 drivers/pinctrl/airoha/pinctrl-an7563.c       | 1115 +++++++
 drivers/pinctrl/airoha/pinctrl-an7581.c       | 1487 ++++++++++
 drivers/pinctrl/airoha/pinctrl-an7583.c       | 1497 ++++++++++
 drivers/pinctrl/airoha/pinctrl-en7523.c       | 1125 +++++++
 12 files changed, 6369 insertions(+), 2484 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml
 create mode 100644 drivers/pinctrl/airoha/airoha-common.h
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7563.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7581.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7583.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-en7523.c

-- 
2.53.0


