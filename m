Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE6AC55184
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2026 16:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PSxZlJgvm0vaYYLGPn7Qm0UYPKiRPHbn0QCV3eqAzk8=; b=v1TqRQESKjtntl8FrwkASpJXDX
	IptpGF74R6Ld8phjIYiUjdfvVswlZXOsewof8FsWsrRlPjLERvWJRJvgeASgA2LdCeYbX5Yc5svlr
	lffYk2zxgW/Soss+4nZLKEVDTylfc8pdQqSv58uPqvquOdZeLmFJSEeFuQJXze47L+0bzT6bxxShi
	Xkledqi/VLDZByhgfvct3YSl2QfjLZizhk2QTLi4Uiwgq9YZjP0hgRNwg8oDaL9kAKgmYdp4vx2XY
	QkQX7tSetkNo3tweBGlRobk/DDlACIexH1wfRn9IK/9k11GrZtTDlwzHCfh9zxIqH0GFG7b3mYKA+
	qYozj6ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHdI-00000002GC8-2ecb;
	Tue, 04 Aug 2026 16:04:48 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHdG-00000002G5k-2B1Z
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Aug 2026 16:04:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cNXBu6uyYwJEmg6215KkRoPI4p40PNWdmFSsstVOoWEWiTtqQxKSKMwr8zTDGqRR3PGvbuklx3OaosJzvw7oVaZO5N3Eas09HyJBl5r2flqMgna+lZdAFwVp9wXatp32Zvjcu0xH5Q3QxxSwMM5Ua03q0XrVw9eCTsxpCVR1Seut8JgSm+EwjBarfoJ1fTeb8ECKgqg8Oh2Sr2fcCNDDcuvezynKFSyhgRPMIddOT9O7Jlhz8OB1lRbyW9znPMJ79dxvhzCraJxW63Yokyd6ynyl0G3+EZlG0l6lYTjkYG37GUoHf0cC1/Zj7qI+2D5TslsQvEuP+O4LHtAg58yR1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSxZlJgvm0vaYYLGPn7Qm0UYPKiRPHbn0QCV3eqAzk8=;
 b=mp2tUzcGAAl84esCWrgfhn9hD6XrxYreHrV0Z+Cfr9OIHIF88rEGReqKR4McWNxzQGt7ioAB1cy/2hoOdt3U8tIYA8AGc7LZdtnPtCWN8zsOOkUrV7KdXRVg87o/Z4K8jxplIcltO9MjtI5NsN+ya8tlkaDPNCrTsmagS5BCYmIqwjMBKG38pyap8mQUbP+Jd94CuLVa/Z4ItBTqAWqOAKB/GKSi0dONIL4M5uzg0QvJWHqm+hkA6wAuTPJmp9ME0ZSGuy9qo6CcitzDsYlerMXq7rQ3TYsa6D+HmVpdsYB/HLP3YHWWL5OaNDqAUxmmj+qzTM4FjxBvJMp60AXBhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSxZlJgvm0vaYYLGPn7Qm0UYPKiRPHbn0QCV3eqAzk8=;
 b=5IyJ2P6ZG0THYDfEA/o2DA1l6MfwShOEjwbIxyfudwLsrh3SEpNvzQEYPitMQjFOXqUtLBtbwT1zdEKDbxxKQ9hpblHOEy/Ega3me8WkYDd4Kp/q1PbYH5hy1Ox0ZWCDOgJ4zwsHzXsARRuyobpmrAspNaTviHd7RCqC4x+Ith5jOOvHiVTuSGpjHXLy2bJs433x/ynTSF1zLmejgiqhqWxUo9VesK43K8kgCLlWmvz5OY3mHAvopRyJaH0m7YDfLsFWqEr9iOCDCBCOnBfdstXkekjpy94HwT4Oeof4XHeMOFOc+fDFDne5S0LzdSCM2x1UWI+S6SWhEPVVZTipgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM8PR08MB5761.eurprd08.prod.outlook.com (2603:10a6:20b:1d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 16:04:37 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 16:04:37 +0000
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
Subject: [PATCH v9 05/36] pinctrl: airoha: an7583: fix I2C0_SDA_PD register bit order
Date: Tue,  4 Aug 2026 19:03:48 +0300
Message-ID: <20260804160419.3592327-6-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 0ae13c97-6e7c-46a8-dc51-08def2421584
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|23010399003|921020|38350700014|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: fCqvZYi9VRFQjXqMgb3EiPcIRmfcACZKUHZhdUPuIwnrPfCYFhkiCwSo/1c30nYqTzLNTTiuugh6JHkhA+CISw7VCTjdjdhcJWJCKveVumGyXlUNMB6/x4QhrxKZUMMFzUZJwf76kSIPuZSjHEO6qt4x98cf3fB87KpoYsvZywzW16vKiUxrLM52azogtZ40Er6MMlgl0vrQ5v9+V0JQ/0GsuYb7VUApnWFhwy3bJZGny9ggYiMonyeA/OAS6qkzcW9+cjS6HYBS4JShGIivMmQXmLuFY5ofPg21VtRm5cISZS4HEUs73km3a6i8nrD+t+lesCpSMD7xbImm+98RTGh9Hob3ic7ddY/MYO3SBu3/mSq5Z/5Sf4a4dRWmpo6hFu48R2kikwUhOljKAjyCR1sN5hVOUJDISSxP7NF7Qd+BPfRAVTiPoxT+5sw034lJX0QddkQ1WnWGakawFU2MwaF0ckJehpcmYW1djUD5zKKBtKgJZcesLMWApBkDq0l2O2DSRVAfPO8TcSVqyJpVVTG2d7X4raihX8TadjUVbOdA1gIaaZ9Wgpya1RNHAdqs7RHAXB96Rjlwzm3fZSvd9AbYYkAxUKCtEBFoDfKKHWkver2T3ZlVoAF/AMdUA7okglWbkOC1Yilk0EEHxwh9ykbM9WEWRIF9+fcSUS4QeDNb0LMjB/jptzd8VduKU1zeslTX6m90cIuyUK254vjSv0iL2dRi+e53lkHZjICifV4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(23010399003)(921020)(38350700014)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oaLBiiXP4G/nUFasTy8wcvxZRjG/NfKsR3fONgfJVFBivnST+wPTtMR+r8Kx?=
 =?us-ascii?Q?sZQBOHq0fcmI1d05D+Cmx0+HSCcw/aL0gW7JTuK4cu1UjImQAGjwz73DyDP/?=
 =?us-ascii?Q?hU6DOhmYBvTBqfla8WqkJLPF0hTHzC/TgHSgy6RGwjSueOFSGLWQzqoAFj7U?=
 =?us-ascii?Q?4IS44C3jnT+D/SmjSqEErIKbtIhGkLEBpUEoswiPZYeA2gnwOr6JDIw+9xNC?=
 =?us-ascii?Q?gHpEQ+xrD5mlnCtMiI0UdMtQAkFpJQP8RChBQP0DnFbXActmHC6QDCYY94mX?=
 =?us-ascii?Q?JaA6N7dg6kx64UmLj0wcO3DmWvAx8Hag+a07jWSe6jg8VIc7quaa34TwogIx?=
 =?us-ascii?Q?wrf9W6tCEJvWc9Nx4PjpStb6iG+8ox6dqrn7h7Ap/5JrBmQwX/U/m2lUmkDM?=
 =?us-ascii?Q?utVaFwnzDt5zACiCg444/suyxpK8L0xM0fIh9BjZNg4Jg8qkHPJdboym9LZk?=
 =?us-ascii?Q?pxL1PLbRcL7/+tDJPRdenjF7N6gjoOnHV4KLZSWof3UPq96L/tP0H0NGdp47?=
 =?us-ascii?Q?ZJvv8Loynv0ZORY6ERnOYBFKnmgVAQC/L3A7b+l2Y/dL1dg4ONcKiQ90y7Ny?=
 =?us-ascii?Q?mf59Pil/sCpS9jtW65V//wLms8HkS0LpA/g94M28hiBzx/7ezupedRRJy1e3?=
 =?us-ascii?Q?Za/mzLPAolTH41lEYQT7EMi0/81ewdffq4NyjhWym6e5kRERJx59YdCYCPcD?=
 =?us-ascii?Q?gh3QdSP54rpMiPGIu5H+V4Ly/S7xwYXdXox5kUMr5PWgaMPbL8GeNHVMFspG?=
 =?us-ascii?Q?v9Al2+vV2oL/Ld8At1cYoIw3ZEzU2FIiorZ7j4ltxQoYM9x8eu4fe/4b+l16?=
 =?us-ascii?Q?lzno1Eb3BTMG+6jHJpX0UDi3FLPkH9K70CCSkqS428wKUq1jBc4Qx25y0QA9?=
 =?us-ascii?Q?wzVxLtOn0zOoGQCT2MDd/A1jNM4AzO118qEwMxLUw00iBXEftspgeQlevE28?=
 =?us-ascii?Q?qhnOg3eO1h7s3R22G/18znmTAneWUJgoweeK7A1sFPyB1K14IO2r3Mvrw+Or?=
 =?us-ascii?Q?z/y7isZjjo/vec3PAUlIsuTTcfM3C0fDbUpDtKGoKxi2kFxQz0KUT5BXu2Zq?=
 =?us-ascii?Q?gfYtYAU3fMr13Gc9kua3D9F6OLA4HRywzb4zy813W6I+tgQ0Q5fsNP+vn01b?=
 =?us-ascii?Q?ZYXNgN/FEz7C5HNMfKx6eNK2Oqhaii0OMRZlNiK1z8/jze3VGTgIh0FQFcEj?=
 =?us-ascii?Q?kh+g6VYudG3JcyDN7LZdUd1kUWqOaLD65aCYu/3UluzAjPu/eYpV8qBTerzk?=
 =?us-ascii?Q?pS/e4gO6r4BH0t9DcPpQr9fmexpxwr2TipC1c1bNFn4Yu6ky+o+SbfdzdwbQ?=
 =?us-ascii?Q?0WTNFgFAOxjJspdSkBmQ+diMZ1xu0IqBXolJEac/RTyBD5dKchUxECx0dgss?=
 =?us-ascii?Q?6l768jNTMFDjSB09QSDQpwC4JkZkeYkPA1KIa5nl6a77xcaDMshXXBw3M2pa?=
 =?us-ascii?Q?4MbYfx2TGqeqge8C/eVTrQWNH5POaH+nWnWxeMEGwmHVa4tmPwqD3LjdWG7+?=
 =?us-ascii?Q?mEONTNiv5kRWD4nxso/rO18NWqYqhbwUrbi00iHeKH5y4ZH1Lha53mcUJXYK?=
 =?us-ascii?Q?QjQ5IklBIRSS9kw1e42g0ZbEfol+2rZrH0VaGDiytF9eBDvSSN8oGDSsl5P0?=
 =?us-ascii?Q?GPkrWCwj2ySgTFm/SjZ94j+UTnWYpE1bYIGYTgBdpJ1qQ3TB3530JrvgHIQy?=
 =?us-ascii?Q?InWELsL5TwB/zqCKnMMIWhJfQmaoAlJrDjUaxw/VIEfyP5Qa5SNjky3krb16?=
 =?us-ascii?Q?SZwoul87F1en1LG9+5Z0gtd+vmzLGQA=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ae13c97-6e7c-46a8-dc51-08def2421584
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:04:37.8410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3wnFo8xzoQtUd16L7NZSTTlmIBik0snf5JzYo2stDQSjjQamj9dbMmlKS/4fTXTPDzQLvaklqi2T064EV4Vekbvd56onqdd0vX4il8kE928=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5761
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_090446_570693_928BF573 
X-CRM114-Status: GOOD (  10.05  )
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

I2C1_SCL_PD and RG_I2C1_SDA_PD bits are swapped, fix it.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 36d14103798b1..d743d7fdcf0cd 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -185,8 +185,8 @@
 #define I2C_SDA_PU_MASK				BIT(0)
 
 #define REG_I2C_SDA_PD				0x0048
-#define AN7583_I2C1_SDA_PD_MASK			BIT(16)
-#define AN7583_I2C1_SCL_PD_MASK			BIT(15)
+#define AN7583_I2C1_SCL_PD_MASK			BIT(16)
+#define AN7583_I2C1_SDA_PD_MASK			BIT(15)
 #define SPI_MISO_PD_MASK			BIT(14)
 #define SPI_MOSI_PD_MASK			BIT(13)
 #define SPI_CLK_PD_MASK				BIT(12)
-- 
2.53.0


