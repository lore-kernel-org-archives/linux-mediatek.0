Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C88BC55ABA
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2026 12:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sy2K2i0zQ8e9nKwSQd3DnmrScl8WMNqkY1SZWcwOzW4=; b=G7UEU9Ku42laMTx/4ctU3ylnDe
	2ZoNlY/OeKpGh0eDTN/mVpPj7HBEzCPZ8//agCWVntetcr9TWPLraa2BZy7Rd6kU76k+2YyGfqXE/
	LE3SHHKy/jsKe2HRbnk832IUxdejSHMDzivcRR47m2qrGBV/qbo3bBHfOwkp6Dg64252ecVET5oto
	8rfMzNaBP/xvhpKQGDJn/Fpbt70hZ3DEcFezrPt6ABQtvZCjq5uEKwjdwIGJ3bneG98qXwzBguHaY
	Q9fDeQ7q8r4QXuNv24ZEqouOhkAZITulzTR2Ou6jmpAkY7aRGND094P5Jg5feY64+ut1vqXjnwx5f
	kIngNAKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wraqI-00000003vVZ-22G7;
	Wed, 05 Aug 2026 12:35:30 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wraqG-00000003vRg-2P12
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Aug 2026 12:35:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CV1VtRTyRTsXA2KblB27LzfJNp4lYHFO4kVSgXa66MP70IjccvsgOw3/fp4OC3RBn/J2UkapMuJC/I80G0acOmsOhcCrIlCx9f/bho5IE0mR+nxWR50NEMa4D0TcNKU1z+GQkbWI123pw/AYhClwNGkv3LqHpRF44Z2n9COYRLnAZqKQqCHL2x5kYm10p4pvFvoVcvAJKhYPgBHyv1Zf7R4i4ZuOoZDJbLriKwrEOlWv2xq+1ipBNrvq08zjkjG4eCPJDA7GMAK5OQSwl0kjGOATKvpcK69gi0ClUBJ8EokoaXkfdLkn31rOpP82/B7X/JmzuS2Ol6dE5O8IRGB5zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sy2K2i0zQ8e9nKwSQd3DnmrScl8WMNqkY1SZWcwOzW4=;
 b=CArZv6I9zP78Px1IC4wkk0AzBAlDLyKOlX5cz6sZCos9nqWyXUitmf7WolETEmbC48xvwNRCTf4IIiLHDTn+3CKyZZPxyiPlUgBhHZCIHYxCJgB2UluKyyy/zbsB4GfHwskvg1D0YeEmVb+ys6DvZ/azREROpyb/Fof/auQB10bG3n+4TyFHdTU4VNO7VyNePS6NTMMXOF8VHLkqbSJVPG59hvUPEDbfo2SV4ffUcZbCgKNDWr/R7B27XgSqdAYigiv596F5Td6gLRFBxcjmtmqLlVH7aJoP4rXiAemlvGSGAmN9gmObtJI/aITH72NFmyVwYeKpQr8SF99ccj2a+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sy2K2i0zQ8e9nKwSQd3DnmrScl8WMNqkY1SZWcwOzW4=;
 b=VE33z9YYjM/CjFUoj7vXg7rhxala7YY3nTtxoAVSiqCwuhhPD6S555hednsXwGCD8iUxqyvJwaiqpo+uFeUhfwy90dOHkmRpEP4KhjOJtMhjAOgGANQS5QQ9fvwhWk/Dauaq9Oyg8bINthFrgffFhSFYP8Ne5SfHSq3VBAXMBnxNw5cVdZzBAlC7tAeYsbRnRqYJDiEwGB6lGlchjEGOz1D9awIMuqrgqyI6Sp9oadaWZ/0IVjDH4HefsR2r73FiYnW0btQb99FUS+bWMO5Dyu//w2NHuMRJVJ3hyr6kmLu8XiUQbf5no4xTS7trckQbDsj6Hdh2JqN/SuRlyQQSMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS4PR08MB7831.eurprd08.prod.outlook.com (2603:10a6:20b:51b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 12:35:17 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 12:35:17 +0000
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
Subject: [PATCH v10 30/36] pinctrl: airoha: an7583: add support for olt pinmux
Date: Wed,  5 Aug 2026 15:34:02 +0300
Message-ID: <20260805123408.3767648-31-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::8) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS4PR08MB7831:EE_
X-MS-Office365-Filtering-Correlation-Id: e0b981fe-140c-497a-b958-08def2ee0176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|23010399003|11063799006|56012099006|10067099003|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info: kbVNH9cormTgQ1nDqgwP45+BU7G/fT8lBU4NxbFFOMPdHZYGul0f2Id39XKD83ClSfjDD7sDUlczvmiC2qMHcH/ESaPLwvPWTQIDbVN/VBAQiACqspJSIQKJ/BtarblWZWHrvTjqgbir6y1aCN3KNYvJEbSVYD8q++ei7rT7zIWy+x83omlF0jmspVF/A/TCqfpX1/dinN0q770xaPOhlf9phAohq2W1rjZmVk0iw+RY7rVN9fGD6OjBQgrujyMXDw7PKOFIKwLFrshc4aTIoVWh6Nj2nuPNDYLTjyXDJh/umK7RVW6P2a9JxS9YhQDCZM3YZVt5YTW5y5z6tAIUTskgzrLhEPXT2WHV5xa3RHvmMrrWxXhnTVu+dnXO6yXysZlKwAXFhNqbNIDcl+9bXIk6goTwfFFG3zGgf7wAVuSH2Kk8JL7P/AVueLmdbK8IFMa7Mo3ZzfccAAFsqwP3apxbpMdz8zwIaGcVdcl/ELqaxigKXJqjrufA1lEMp6yjhnfW8JDG/fF36uIIMgKCNQrAnPNwHbgcrJKV5udaxdtJgFYo6V7vW8IeWweoLyd8oEZd/gNP2kuZyoCINGCPlTxy/+90aOkiUN+/Y6MDuD97Pa5B8ehQQYcZ+8hOthNFAqNk7Fe6ogJGNtqrVH5kllKv5poQ3HRGmqC02q344gn3JSsaX9Y7ZvZxlcjJnbgk7V3BcI2lE+FcMTpL+w4QA++E8PuuCdsSjANLA6wmojfo9KPPo38eBujkhtnzTWwS
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IoAHooWKsOXx8IzqBzmlP29eCG9hZYwPcxrcV9wcUtXBAbIUMzR4l8agm78v?=
 =?us-ascii?Q?rEwBii4oM2C1/VJWrI0+d0uLtiGsUpjQMKIW/lHlziG18bLkyuMRsTM95HqQ?=
 =?us-ascii?Q?QXSX2GWwx/ybJCV7UUDa0Bx/9gZXA37JHh4P4BXPaNPxfzdAhPQP7znsG+MI?=
 =?us-ascii?Q?Z2iYaHbUT0vvzBPDcQdFWO2/wh0DJt0tRhmw+HoEp5yBDHGfEUU+mhe/WrCw?=
 =?us-ascii?Q?MfJa2PHy8M1qdM6DN8pWEc+cwszuTqsBFcmFXP35PRYAF0ApXf5DA6gnb8rO?=
 =?us-ascii?Q?61zPfYgfkM7KGQ3YmwzOTzPSV4JbaXLytJwXOMn9fGsqRpPK1hLM9IN1lcBc?=
 =?us-ascii?Q?MtyJxNhfM0zqHzFkxjZIAZcc2G6jFtnzCYXr2x+/BtCUHleuJphpoJHmXS/U?=
 =?us-ascii?Q?dYgIWUhQWzw1r9ZosKkBf/PZznpGYfj9bAtxFMIG/b8pxmTLpXNaKjLDiKtX?=
 =?us-ascii?Q?ebacRwqiJJnjNdfTz2mhTDUiNwOwGnT9ZM8EcQYFB9pCGhs1QOU4DZjRdigo?=
 =?us-ascii?Q?5A6HdrBg4MJEX7Yzd06mwX2Dh+5KUFwQnmRVzqMVjYpJ3VXmRMX+b6j2dfAh?=
 =?us-ascii?Q?aHsJBGJnrgbylMk6VmeqCzPNnMOrb5+VPm/Dw6s80krFWaA5F6mAmCpeqvt0?=
 =?us-ascii?Q?t9DcAt/18rh7P97xgw4xZW+HX4vkos8j+QCU/LFd2TUI/14vJY8BpCraBmqN?=
 =?us-ascii?Q?o7T/gwUWM7TAWdnB6fDHzLjQWAwRgWHXiJCdkMfxi1hcz6lxYpyzWjJt+8tg?=
 =?us-ascii?Q?J5gY0Mcmi/i2s2bEFLw+HJ+wc/ox6uehcXLfc4jp2STYOIr0Gzl9/LfxJWfW?=
 =?us-ascii?Q?S9akid0U1X3Wubny1jTmttE1OsO0BPeq7rwLPNKSVTorEJ4Wnwyv9hwpsSoa?=
 =?us-ascii?Q?brreIVLEM1UUFiuppvwDRcay5l8vMvxSPaAmYi1kMyFulJqNnjzpLSHy0cLw?=
 =?us-ascii?Q?KM0zju6WWNRh6bevpcvqG2N3hMl8jST2SOyvpbtn2byBzbwzHPOusAfdjnig?=
 =?us-ascii?Q?8zxFYzde0uXfCz2RXnR5avs5HaLpNxzeZ9yeP0hAip9V2eS2fJbBlzJat+tG?=
 =?us-ascii?Q?2Cn7ipqtrcHxH9nqkmIgyenbh9Q9Zlx0kzTP8nSLUX14IVM74YmBxsHqzTze?=
 =?us-ascii?Q?vKtXc1lkNALAfZ9+wb7b9+FR6XoM85LpeWZSggsSxWuhbpFbwFK+HYXDKGej?=
 =?us-ascii?Q?ET2r8bQv4PEpd1Pc+zfEQyXjdEfchNj42I02ece8FWWFVFjZ/VrbizwylaXy?=
 =?us-ascii?Q?DsIhVkXMeTLnQdgEuQjYUqY1LO7/P3XFlsuWMbHhWo1hEnl4V5Qul8zdpe3E?=
 =?us-ascii?Q?pA1Qc3fHyybhHOVhCJJ4mjbXU1ny6Bth4vUPwmmhMJfApn3geaSGIiQpGtAP?=
 =?us-ascii?Q?Qxi2SbITyY1n44BkeMkYvQIzodV6n5Sboy1hYWXBnl9ZQsHC8SnVCbhdG40E?=
 =?us-ascii?Q?9B1o2f1bDVg7R5obY3JpGQrf74N/UKWTSDuAWpGwpcE4C8g8BUsaLByK40Pr?=
 =?us-ascii?Q?wlvdXlIlJAGJqu2wB+TuTHZMeBJ9T5d4vtJlMs5quXvSGY5SGUkj4vwKmhnp?=
 =?us-ascii?Q?0EFNnxDhrxpZXgkPK29KoU+osHfwFq1Uo9wxJOWgTdBBiam5wvtWz5ck/j/s?=
 =?us-ascii?Q?5zk2InFnSV9WU9tS5didnCnqDWgk+chpkjyDRcyBP5CHvPtr7h64eK2I+5h6?=
 =?us-ascii?Q?1ygis8JW9/C8oHiUvoTT60yyLLN3Dyhs/1ny4hD2sgNAvxABGj+FhjzIED0r?=
 =?us-ascii?Q?hbNLYHYP53EOeDkypRHrWqTEAW7hui8=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: e0b981fe-140c-497a-b958-08def2ee0176
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:35:17.5264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +tXMryTw31vrgN3pduROggUhT/+u7Y0+H9Fwr/k53DZxpWSwlclvbzS4YT4d1tbEMuHvxjXINq4YfjQlTkn2W34g+Oe7TJHg9HIoUwpcR1A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7831
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_053528_615251_6737AE6E 
X-CRM114-Status: GOOD (  11.11  )
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

Add support for olt pin function for olt pin group.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-an7583.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index 2e145ef5a224c..031a8b36e0024 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -53,6 +53,7 @@
 #define I2C0_SCL_GPIO_MODE_MASK			BIT(15)
 #define GPIO_PARALLEL_NAND_MODE_MASK		BIT(14)
 #define GPIO_SGMII_MDIO_MODE_MASK		BIT(13)
+#define GPIO_OLT_MODE_MASK			BIT(12)
 #define SIPO_RCLK_MODE_MASK			BIT(11)
 #define GPIO_PCIE_RESET1_MASK			BIT(10)
 #define GPIO_PCIE_RESET0_MASK			BIT(9)
@@ -393,6 +394,7 @@ static struct pinctrl_pin_desc pinctrl_pins[] = {
 
 static const int pon_pins[] = { 15, 16, 17, 18, 19, 20 };
 static const int pon_alt_pins[] = { 36, 37, 38, 39, 40 };
+static const int olt_pins[] = { 36, 37, 38, 39, 40 };
 static const int pon_tod_1pps_pins[] = { 32 };
 static const int gsw_tod_1pps_pins[] = { 32 };
 static const int sipo_pins[] = { 34, 35 };
@@ -483,6 +485,7 @@ static const int pcie_reset1_pins[] = { 52 };
 static const struct pingroup pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("pon", pon),
 	PINCTRL_PIN_GROUP("pon_alt", pon_alt),
+	PINCTRL_PIN_GROUP("olt", olt),
 	PINCTRL_PIN_GROUP("pon_tod_1pps", pon_tod_1pps),
 	PINCTRL_PIN_GROUP("gsw_tod_1pps", gsw_tod_1pps),
 	PINCTRL_PIN_GROUP("sipo", sipo),
@@ -568,6 +571,7 @@ static const struct pingroup pinctrl_groups[] = {
 };
 
 static const char *const pon_groups[] = { "pon", "pon_alt" };
+static const char *const olt_groups[] = { "olt" };
 static const char *const tod_1pps_groups[] = {
 	"pon_tod_1pps", "gsw_tod_1pps"
 };
@@ -651,6 +655,19 @@ static const struct airoha_pinctrl_func_group pon_func_group[] = {
 	},
 };
 
+static const struct airoha_pinctrl_func_group olt_func_group[] = {
+	{
+		.name = "olt",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_OLT_MODE_MASK,
+			GPIO_OLT_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
 static const struct airoha_pinctrl_func_group tod_1pps_func_group[] = {
 	{
 		.name = "pon_tod_1pps",
@@ -1190,6 +1207,7 @@ static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
 
 static const struct airoha_pinctrl_func pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("pon", pon),
+	PINCTRL_FUNC_DESC("olt", olt),
 	PINCTRL_FUNC_DESC("tod_1pps", tod_1pps),
 	PINCTRL_FUNC_DESC("sipo", sipo),
 	PINCTRL_FUNC_DESC("mdio", mdio),
-- 
2.53.0


