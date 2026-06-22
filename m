Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47ADCDB46F
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jun 2026 11:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E6FKpN9Sx35Mj6NytIino1TzXfPKfHP9V4FJv47M+sw=; b=mdTKKZaSYI4sOeDSf1LIOfC0Lz
	YeuqyMd6aRNMFhsjYxhWuX287rHibZoWUzN1pHPjZi+1ozrEwl/BvStcnQwKA4AkWRxBrch5AgjAQ
	VYwrAszd0r390W0eA4LJqNJ7w7UkkPC8dsoOqHqo6YkBRVX1N8mAWQL+At7Dkx4KOQ2K04j1zaAZr
	TXGhrcVAFpo9Rl92NAZjHbZ/rXt6mnORagx2a7H7IW3jZzM6eDfs6ifKI5d4MPJOUEKqyJFkO0BHQ
	mH/VuYjEVEVqOUEUCIWiIefXftPRsq2GVz8rMtCLByHK7dHeAYMI0errrBk4sMQGzRU9prmJ32nz8
	OKMwglwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbcrn-00000004uQU-25j0;
	Mon, 22 Jun 2026 11:31:03 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbcrl-00000004uPw-1DnV
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Jun 2026 11:31:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LCK1e92wY9NgEWVvEbeyK9oNuC9SS4NtJ1ToQa9qzujPfNCQQQtEsIWuUw0qN4HWxhx6fBx6q8jhX6HNRmacunU3R3DqrYSO4jlpfSAxJoCC7DHyZtfAHhzoTin2EfZtZdKSo3E4dMnC/3Q7a2uSvyBSvb/FPemSjVGXiUHZjMZ/Nf9YnlOSy6H74s4hdMJUu8qYiAt/5IBJGA8yyoCNhzRkS11N6II0hf983Brd2ro+g+SdscGB30T7prFHF5KyY/3vbG9u1QLUR0q5WGecdvO2f7/EW27v0d21dSALJOjo8HjE0nPxzH4huYlBYcLg6xtOseLR7fyyOhoZGTEXFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6FKpN9Sx35Mj6NytIino1TzXfPKfHP9V4FJv47M+sw=;
 b=P4Nr5K3BxNG/hy/35asgfPzCQU1lgAQ7QveTKQHa3ARZh+fG2zbzsCBvddo0SmXFIz3SXjY9kIX38HZFElC66kWzEOjQLj1+B62JIg15hh9nvdCE2oRXo7oddt94g8RCqC2EwMEvzkPGSWkjLWZUoAAulmYkx/uX4k0UL2tna8oqh2jB1jzYiCIZsB6ZL6JQYSYxoBd2SEAqEM1cQ0mtf+yh8q8CINBYtRnTUeBVbr+KzX8xXaH+qhA5ETDUKXQAg7llSWSj/UMOI5hBcjLTsa/sWrP6ps6N65SOZo4NcWurDQ5KZMy80zFvXJKpP/QF2ieJ5sXCoQei0nWYhotmUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6FKpN9Sx35Mj6NytIino1TzXfPKfHP9V4FJv47M+sw=;
 b=ed6GWVavq0qAutR+cSkQQsez10Xx6udswinrPyeLi02CkAYHXwQ0EnigbDpUxdsckqStw5+joOjl4XhMDDFujZZ0FWzAmTQtdygfwR4xJrQt6th1Xyh9kF1/DnEjDWeY0fAw44zmwEtdVLY+bpjJB0I5tWtC15+GmFEBQFM6Tc2W8JuajJCHJ1FECAn9Rr95gqRKSYe5nLKW9hjpfQAlzDD5mOKqk/SW0BEZnYF0ql98J8wwUw8Q2D3rUJ2r/IbDPFH34Rzj+yPREIYEmCn+cyTRp6PUCZJe4Sdkh5+PEBUQCuHk2m4GfeLE+fgpgZ+ads+UqT6Y9ThevHu5Y/8LPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM9PR08MB6115.eurprd08.prod.outlook.com (2603:10a6:20b:2df::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 11:30:55 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Mon, 22 Jun 2026
 11:30:55 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v5 00/16] pinctrl: airoha: split driver on shared code and SoC specific drivers, add supporf of en7523 and an7563
Date: Mon, 22 Jun 2026 14:30:30 +0300
Message-ID: <20260622113046.3619139-1-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P250CA0021.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::7) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AM9PR08MB6115:EE_
X-MS-Office365-Filtering-Correlation-Id: 23ea1880-c5e2-4336-7847-08ded051b8e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|52116014|23010399003|1800799024|38350700014|921020|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: PmtKjZFO7frlg+EsfC7TeAn5YZIJ0VPGyr12MU/MnA8LIo+9QOQINcsNGsHKiBL0B4k+VeOrT1v4/ItV+xmgV9jB18QQ96zW3lm1noBLa6Ht45rMAcOtVkmqh06rf6O05sSf9OAV/jWFgtHZ4MLXPqqeNRuNnAQBETIKNK2Oeo0UOwOC+of510lNZWPfDWln8d6oi9hNQiK0dWs8UglNywrO2iaGwqrK/wMKF/HwZThyGQgPVoSO2Znnil7X9CdJ0hnlRBWva6LaT2FxY1Q8jJ9pZ/w/EPIEOefNOmF62T+KNEz/E+WdlUTvn9/Y8Kw400k5HU6K35BVotUDw72WFDvBPpCk2c7lSO46OqFOFCrSP1jXqyZ3dEfK0gDL47C3BNykDrqYkDO+jj2IDG9J7b4ihb/+PydBYvZ41mxIw+69/4o2vqCUSOB2OYYX+aokdUs3nn7SrAOldVIghXZl4PmQMp9H9P2nLVhwswn3/vN2V1spjC+S0ZcBv4/oyS0T6FROcaHBQnzCzJlOSmMV+Is0iVjFak15JYcVWBhCgQS6CZONB3lOQQCUVY6i3XXYJX/zpu31+x2TG7K0nar6xeGA9AuQR8bv9pPZaAFMSE6EISvkBMiHD5CGXKKH2IudnI4NkNLfVkS2l19D4wKhKV+64+lOXSgz/K02mzb9lKztNs5ZpXXabsNKtI9nMb1hyHHhB4543Ix7qeOAR/NidlXGBoqrNo2ygz26Ek2BaEQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(23010399003)(1800799024)(38350700014)(921020)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2EqBZMxQXP7WkDQTkw4jcTE9vLVzCZEw6/a3hJZnuYnCkzGCVTSgMjJhNd2o?=
 =?us-ascii?Q?iSIQnVopliPouHHNoXqzrzIMBGC6qhsABFnrV6bnclw0laAgmzuGTKvHistD?=
 =?us-ascii?Q?N0xRUknLbS+2/bx4Cv1Qrf/1Gpx+wnfWTcSVd8OXVoGsVcZvRL15ahZXBfQo?=
 =?us-ascii?Q?GSCfFVGyqMyd78srFqY8xFmtFv6JBmTNcUP22P0aeGxIFjqf+G8pir1hsrIe?=
 =?us-ascii?Q?8Qp8es3hmV3MtJXhowloybi2OJfhpW+EYOwJl7GPi+yc9Z/4i2dIO5daGUM+?=
 =?us-ascii?Q?DnpwayhFiY59uHksE9Hb4VKOBbdN4aGBNnrxooNToG2m3VySxGUrubFv4k7g?=
 =?us-ascii?Q?phbL/AASSqE6tBZgXhqMftT95C5wuaZ/LodZ+/15IcabiUgVbl7ffNEsGqqH?=
 =?us-ascii?Q?tFpAP5LkrtosCBpn00EEe1R+h2gQv+ezH0BQzIyEE/+QHQ6dxf6pHkyMdRMJ?=
 =?us-ascii?Q?pnB1Xmg1XvYeSjEOJGJCmrR7uinpX+WBKWYueAMVJYX5KEd1dEar0u6FnPEW?=
 =?us-ascii?Q?PwsnjJCH51CmJAYvPuoHDq/QbwoKTTOvyzWPcA6K7AOvncr+CuCPhlCmVz+F?=
 =?us-ascii?Q?7ofAQFcF9K7poj+hqGahaSJrfW3IxqCCCAjbjODeVR+l4jmMgYqeH/L/VPYf?=
 =?us-ascii?Q?BDHPa37ZrEaiJ4DZKLiNyZmyaBZWFL65P2Xr6zOdZoLoaPTrr/ipHOlFrj7R?=
 =?us-ascii?Q?cVQH0XKJRHpiCM98eR9kQnHn92INSosVble8wMPpqZLCYwgcJwjjN4yHq/Gc?=
 =?us-ascii?Q?OeKUHFYOvBP2T8R+jx/d43xPP8YxmXFoIbfPzOmpuFY0GamFCHpcCjNdiJ+C?=
 =?us-ascii?Q?Ifb9bHtmLJZqpLtzYespETP8tblF7bDLde1SSxCew2NUgGjC2WNtCplOpXpE?=
 =?us-ascii?Q?V/WM7NuhWoNL+yv/PpQw52ad3mhZIiYMt22xc1GMjnDFi04aS2z/PfXh98gZ?=
 =?us-ascii?Q?nCuI3hA9oIgvLFh6aqTW7DhM3gyfh4IdgPq+JoSNSWIfO6hFtUSv3jAFYTRN?=
 =?us-ascii?Q?Qlp2IWupUYnHFKzDfQp2R9cKFUHzhcb3dbFiCu4q4PlXzfgqpF26f6Bo7aKa?=
 =?us-ascii?Q?RZzn87juK18LIYn/4BzPSBIFB1Dxu8PUW7pJ9D2Goj1qrVG9/LxaZldMAM2V?=
 =?us-ascii?Q?ITLJCC1G3avEKF37F3yJCESGFjmsQ7WF4MhWsAG0eynYDF7w4VRfkKpeg/Wq?=
 =?us-ascii?Q?/8WN8EQrEy+IRt9QUakdeVPceWSwIiLh96VSWyZm3WJsNP40D8JMrdHhgP6M?=
 =?us-ascii?Q?vLp9rcOWAHV+qvRLXQz1xxhwX60k/9C+AphYTD+piNnPdm3qI7XdCWuO/CNc?=
 =?us-ascii?Q?0Lvho6vv0c5SV6zx0HtCamYLe+Rgx5ZNgCdeKO1+xoZlBangWSzKFWb9enYx?=
 =?us-ascii?Q?ac+KwzDdcLzPH5IBWBica8bRen+fd22WBMnuXP8vUdT5WysusdnoljVmytxw?=
 =?us-ascii?Q?n0Im1fI2oU3wMWQpPLNILVU6SaGkJ5doVWN8hrUN/ZI/zBxQFKMm1Q86+Yrj?=
 =?us-ascii?Q?DUwLxpS5+AEiYYvqS1BvixfKUWpGcGLJCFgGqcXLDx9T0Rs9ZqRebYuj69wD?=
 =?us-ascii?Q?mnnjw65w8dN3PFUe2Ed+TU+la8sntdLIdm/4p0PIueYyZKTds5x7ve5NTH6V?=
 =?us-ascii?Q?5TK6eS0KytfGTpcItQAJCQIpynqweE8Z/u/x1Khen8Llr3C7vkN6b2/d2zTA?=
 =?us-ascii?Q?A6WBkrFto63uu+/ra1XMoCLK5xsKbTeEX0sXfzknOmWpUfjpxghAIT3XpkKl?=
 =?us-ascii?Q?WwThksW8LlMUFYEqEcoD3bFwQrpIDxI=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 23ea1880-c5e2-4336-7847-08ded051b8e3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 11:30:54.9915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h72EmVNlw5gb2nWXbscOYtXMUQJo1ju7ZWR4zx6GL7I6n4d8B9nnVaqKlJXKQkNMF5slUl7/iWNJn9NOcH5h+fkayn9xUXzuPABSmXGEtOg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_043101_675802_EBDDF302 
X-CRM114-Status: UNSURE (   9.56  )
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

Mikhail Kshevetskiy (16):
  pinctrl: airoha: an7581: fix misprint in bitfield name
  pinctrl: airoha: an7583: fix I2C0_SDA_PD register bit order
  pinctrl: airoha: an7583: there is no mux to enable the second i2c bus
  pinctrl: airoha: an7581: fix mux/conf of pcie_reset pins
  pinctrl: airoha: an7583: fix muxing of non-gpio default pins
  pinctrl: airoha: move common definitions to the separate header
  pinctrl: airoha: split driver on shared code and SoC specific drivers
  pinctrl: airoha: an7581: remove en7581 prefix from variable names
  pinctrl: airoha: an7583: remove an7583 prefix from variable names and
    definitions
  pinctrl: airoha: an7583: rename registers to match its an7583 names
  pinctrl: airoha: an7583: add support for npu_uart pinmux
  pinctrl: airoha: an7583: add support for pon_alt pinmux
  pinctrl: airoha: an7583: add support for olt pinmux
  pinctrl: airoha: add support of en7523 SoC
  pinctrl: airoha: try to find chip scu node by phandle first
  pinctrl: airoha: add support of an7563 SoC

 drivers/pinctrl/airoha/Kconfig          |   29 +-
 drivers/pinctrl/airoha/Makefile         |    7 +
 drivers/pinctrl/airoha/airoha-common.h  |  204 ++
 drivers/pinctrl/airoha/pinctrl-airoha.c | 2401 +----------------------
 drivers/pinctrl/airoha/pinctrl-an7563.c | 1113 +++++++++++
 drivers/pinctrl/airoha/pinctrl-an7581.c | 1485 ++++++++++++++
 drivers/pinctrl/airoha/pinctrl-an7583.c | 1495 ++++++++++++++
 drivers/pinctrl/airoha/pinctrl-en7523.c | 1123 +++++++++++
 8 files changed, 5463 insertions(+), 2394 deletions(-)
 create mode 100644 drivers/pinctrl/airoha/airoha-common.h
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7563.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7581.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7583.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-en7523.c

-- 
2.53.0


