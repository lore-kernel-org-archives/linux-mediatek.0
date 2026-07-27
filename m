Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 479F4C54EFC
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 17:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dh/kFi69mYW9kmuBoFljUEeL5HuzM8hl9++Y0TTJcUU=; b=tm/qjQkV3Hf36kj74mBuXE39Yq
	vlzcUeBYhI6p9dFdlQgoH+N2hitj6Kg3En5lfW0fHlwig54SiqtA/0WAHVjDFZ2Fcyv7u7eiO2S4G
	+AfEpbxD3Fjrf3NecwDvGouqhtZ3hAez9+y/5KwigaM5zpaMFfv4zEL954svYmD+n9wTjVrHEY7kH
	mjxntZmW4ROqyuwof5Fwa/4L4LS16mZR1MZSgKmSDXKeSrlU64OgD5PmGkoP+6dfy4VxXvubUtyV2
	4Wx9Y60RnSh8KQWlq+jF5ITtq1ypt9fD60i/cJmplqZM+kOJS+wD79ocHg4CcP+p0a25s21UT4gS9
	YanyAWbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woPLC-00000003Y7r-0FsC;
	Mon, 27 Jul 2026 17:42:14 +0000
Received: from mail-norwayeastazon11023072.outbound.protection.outlook.com ([40.107.159.72] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woPL8-00000003XwJ-27tx
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 17:42:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KuQOmKSAy/wgJP4cTjfLuB2vn/uST1xeL97bOfXhL+f36z96sswg+PsCNafaOenrsos5HC/z8AWYfxJdVOlbcDCnynRYYuiGh89/ZjdicNgbBM4EL+KZL46XohJC1yehN9zfm++iyQNy7hqcD5EODizKL3AUrlWROvekEJoR/k7N7Qw0yrppybrER9HEKX5bhAaj90bRRtG0OlDloTARrOKEoDts/VEIv2ja/JvjCXphxWATWl7B6B9g3hR+yKu5Fg017yGVZm1/zYaDR2uDBM7N/hzGqFF2xGlXx4ngPIt5QeVx9W6CsKTMiKCvdYZNS2eXOKKR9JJyElTAccJhIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dh/kFi69mYW9kmuBoFljUEeL5HuzM8hl9++Y0TTJcUU=;
 b=RnFabfeS3Y1ljJR0TtLqfwKAPNKpUZ+sf4gkr1VPd9rYC6ZfCca0/tAwLxlo/wTiZXfG9uw9xJyN5xlNntCRyfQaV6QxIgxQ29LO3cPi7pI1+ijIkSiseUxftuUB8JI9udUHDdepTKrW1Z6dwrgMIVc+aNzyOgA7bp1qmiMIeRx3zXnGeITGnuhgl86oRyYWKSyJyS9Ho/4kekc81rRSnVzLGNuqSCgyP3b50c3oemEQOLOU7oQInN8dWTnStCw+Gnrd0Yhz0Hvuo2xtoo1ftHGf++LXxXaF4t4IHazmWdaWIPpreqPZ9z8A8xBRfGKYoKleZplZNQhx6LL1w9w5lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dh/kFi69mYW9kmuBoFljUEeL5HuzM8hl9++Y0TTJcUU=;
 b=RaHOusFcb6CjaGEPDuUkuxjZl12IWXt81vr1ZshFPlxG4WvIIQWCyOUf90FT5BKKwCF/O8qZ7/7qqUlvj3pLOy6qvU6vWzce9kZ2GIuinGJw4gIcqF6+5l/rt3N5qhh+5qg8EEN+m8VRdVkJ+XCXGpS7yTALvQQQZ/7GNEZvwDjmF2LR4F5i8BYYuDFqzuX2IQlP+Ube8bKW0QnOYoCidIKrdzu6SaIrO2pgOVv8Rs77gYk+db/ojmUVaaoBHCorK+2aZqrvjSxbuNFim3D4xpmKi3Npyfsd5bybSdTlbmK6Ml+sBIYHs+ZqETX+eyKu7AvuImbrTMq/Ijc9f7U/Qw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS1PR08MB7537.eurprd08.prod.outlook.com (2603:10a6:20b:481::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 17:42:02 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:42:02 +0000
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
Subject: [PATCH v8 05/35] pinctrl: airoha: an7581: fix pinconf of i2c_scl/i2c_sda pins
Date: Mon, 27 Jul 2026 20:41:11 +0300
Message-ID: <20260727174141.664933-6-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0064.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::24) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS1PR08MB7537:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e563fc8-f37c-4d4f-8c9a-08deec065dfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|23010399003|1800799024|38350700014|921020|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: REt3QBnGhP5N9rqF/23GrYN56kfm98QmxIYSefCw9ujR0cx1ymtK9HqnCl0hWlJcIHCIeuystl2wIjQXpdYPyYZBNzbhMdrqLTeFYfdz8Zv2iu+z1ghBa08fWMouDwvYhuVehOldm0oRVFgXcE+zf+odMIhn3F/K0epVJasPBoeMAQE5jLrRuG/G5XBmRnG4WAMGCX2RJNBIU/A3JANWiBKCzOLSt51TWqIzFIaMEjjECmuro2O1hCp9LJhf9utcWFkSvRz+T4L0ueiBKnJt/miQmDRRqEpJXIwDMdxttXFKEoXgo5svMhtfNGht1bSwWi7TLhfDcIPLHg1oWa8BuF4Kxq8bxYfGNQ2wF3lCvmdEevmmaALx6V+psBfX1lidSWF4wkpow7icStmvpjYmhO4JbIHFdWc4FaY05KzBOCochNRwEtGtGJJOGBBodVSBm1WTiqPUJ+dsU3ejJVS435k9mKEYBJQYPFSTw0XWxIGDw7TGzXzFsH+zq1rSnZU+wrslD9r04bc0kRTKkcITbsXlQvVDjpOCw4Xst8u7uFse2srW0Voe7x0NCwaDgiZytcYMCo1MNoGGiYmAxQTKtfBR5m1VRuf0Wbw806cBXyFIONG7oErBBWbl4GaXKpUrHhwI6STc1GfyqfvhkYV3HwuTo+YkuZN8+CosAxhlMUQYHfr1aox45Id7curBvk9zWfFp0dL5VN/rbACCEU4ekdBcbLFjRE2P7ImSkA4oJs4OWtMmiemxCvw1C6Qu9BZU
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(23010399003)(1800799024)(38350700014)(921020)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fMT4OY1YBZ8Whwaq2s7+GGjNXG5410YwVqCnb5w3UcrL1EiQWOB1WpVOuybA?=
 =?us-ascii?Q?2bsVOBUtUlfOqjiNXYbgllLGN696NsFHnbZHy3Fcdo9e/xyT2yZjdr0OWHpt?=
 =?us-ascii?Q?/ABimYyk6/saEd121QDMsa84TQB5D6mmYmfuCyc2O4AVVbdccdiMAlLnJgjF?=
 =?us-ascii?Q?b17QLrzW3zGtyaiEdwZYo1YKIykdwZmbTwrrmo4KS2PXF/DFVSoJPq48rPu1?=
 =?us-ascii?Q?8O/FEK4FyK2H0t2AfKutRgIK1amglePaxplgJYpkpjGOelIztqwIlIgLN5Un?=
 =?us-ascii?Q?jCJF+7U1TMgCrCEpQeF/6jNj4zemXgJSQxrAPCZCKkMRlxMfYNRF88zbqZH4?=
 =?us-ascii?Q?viUadbP/DOgux7nQfvC2XM6V47punQxhRTCKUbk3/5oZjIrmRjCgjTwsPWal?=
 =?us-ascii?Q?JatQYWIICNw179vh3pVgG//+q2Y/6MxfRuGtifYX08KNMwcjrhghnO8mMAWF?=
 =?us-ascii?Q?asx1phc7v5F5q0aFe1x219CeQTM63AprFN7kmWmqruRE9lG/qPbcTpKoudaQ?=
 =?us-ascii?Q?HYZRTMvIYot/Py9QAmpbIgVXcmZseQVybd+RbM/1O8q9GJDJ4GBr4qCDnK9X?=
 =?us-ascii?Q?tOK4i3MOy+KMudoBGAqDYTf5/za9vl+kYx5Qbk7JuvfVokgX5ylb4ROzRCih?=
 =?us-ascii?Q?LNZETum2O9goEv+/fd9dF16DgcqmXhYHk9ZrZKhEJqfcNmDCrG3IWtbe1ZlB?=
 =?us-ascii?Q?TwX77u7ApgfJ1IKIDII8kVhTcDEGMIcjUWb5zFIihr3lqTAltmeIsERe3Lgj?=
 =?us-ascii?Q?kvsxOsbS4xCMObXFJWzjZ/UsWixihm3FTu3c9yhCf9wOCRD/DHzlN4NlGGC7?=
 =?us-ascii?Q?dy/zec1a3vwFylwP8uTV2InzB2pHLjz8s8S+MbgNaBbOXYfio9esoSiA60AX?=
 =?us-ascii?Q?07o/aTSdaAiLN0SKwHi9Vbz0XEG6h0ZtBSxhcqL8/of0iIAQccZeSJf54hKe?=
 =?us-ascii?Q?7srQL0O7pSmuqBToycsXwBX/1B28x/N11X6z9caOZGxwWYFvSswz5xG4QVU/?=
 =?us-ascii?Q?xhNsXC1HlnfefrfOhWW9hRHGwxOsqDF6PIO3t41GvIVT+12oZ79iwCLEYpJc?=
 =?us-ascii?Q?jLNUMJVfoiBThCKeNUu21LhuwFa7MuSDDHzflB31cHOOGIR5vaJdD62YSICh?=
 =?us-ascii?Q?r3UJTLx795JMCmuR4oAMpus1zimvmCDYmpHThrCzlqWY+zEJh0BVyzq55B7O?=
 =?us-ascii?Q?Hx9zFk92NPKsLHLOEXvKAbH55jjFkX8/bn4IrqnGWeyRW01rLxac0GXMs+1B?=
 =?us-ascii?Q?l4h4tWe62YO7mxB1+Zmp+wOU8jKtyGT3gPsXEkyNQYNhSU81qWUd604dxOmJ?=
 =?us-ascii?Q?oUIWVjFxJ/iGaPoH3kKRwqwjwoNyruWBfj7TTXHsKAyhnP0G/JcsrtkTyb5G?=
 =?us-ascii?Q?cuTVUYgfhfDJilp6+R/31zbjTWQjYFRPFMArm2jEg/Ho0iY9O3xGOzy9mLKs?=
 =?us-ascii?Q?SNGpsCXO5WAGJN1Gs8MgS3Gii08EhMaCa7p2jqR4kKOpCgWPWqJVoZMlp9JM?=
 =?us-ascii?Q?bt+uwpbY3Y3eObqxVmZco83FrpNbxORV8HL9P/FeqCYfWz7nD1a8PLxcCNi8?=
 =?us-ascii?Q?rk8J2WtZrl0tBPOO/BkHGoQkNYRgHMNz+FuLfR6emJzv39zVx/nJA5Sjium7?=
 =?us-ascii?Q?pjXi581SSTvj3UYYYsGp64s33uUeLy9SR0mG3hV4lx4i0Ee/vllcEEdMP2Yx?=
 =?us-ascii?Q?9xRvRhrqJlMjdLfbFCVFeMKgOdmSkgts8SdNQSdUsskgPd1LVqDO3CXAu4qW?=
 =?us-ascii?Q?osqndfEMwHcrEARx6pAq/TF3s6/GeIQ=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e563fc8-f37c-4d4f-8c9a-08deec065dfd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:42:02.5310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O67gLaB6MpN7qCsLHxecP2wvn3AOij3oLYHfvKjj/e14koWLj3GQgUx2JSE1mNAbmeIrkjmHYFYUczjgb6txrsNGlg+6lnfuEGckb1SDBBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7537
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_104210_549329_1D1BFE6E 
X-CRM114-Status: UNSURE (   8.65  )
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

Pinconfs of i2c_sda/i2c_scl pins are swapped, this needs to be fixed.

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index e8c018620f1e9..36d14103798b1 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -1844,8 +1844,8 @@ static const struct airoha_pinctrl_func an7583_pinctrl_funcs[] = {
 static const struct airoha_pinctrl_conf en7581_pinctrl_pullup_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_PU, UART1_TXD_PU_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_PU, UART1_RXD_PU_MASK),
-	PINCTRL_CONF_DESC(2, REG_I2C_SDA_PU, I2C_SDA_PU_MASK),
-	PINCTRL_CONF_DESC(3, REG_I2C_SDA_PU, I2C_SCL_PU_MASK),
+	PINCTRL_CONF_DESC(2, REG_I2C_SDA_PU, I2C_SCL_PU_MASK),
+	PINCTRL_CONF_DESC(3, REG_I2C_SDA_PU, I2C_SDA_PU_MASK),
 	PINCTRL_CONF_DESC(4, REG_I2C_SDA_PU, SPI_CS0_PU_MASK),
 	PINCTRL_CONF_DESC(5, REG_I2C_SDA_PU, SPI_CLK_PU_MASK),
 	PINCTRL_CONF_DESC(6, REG_I2C_SDA_PU, SPI_MOSI_PU_MASK),
@@ -1961,8 +1961,8 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_pullup_conf[] = {
 static const struct airoha_pinctrl_conf en7581_pinctrl_pulldown_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_PD, UART1_TXD_PD_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_PD, UART1_RXD_PD_MASK),
-	PINCTRL_CONF_DESC(2, REG_I2C_SDA_PD, I2C_SDA_PD_MASK),
-	PINCTRL_CONF_DESC(3, REG_I2C_SDA_PD, I2C_SCL_PD_MASK),
+	PINCTRL_CONF_DESC(2, REG_I2C_SDA_PD, I2C_SCL_PD_MASK),
+	PINCTRL_CONF_DESC(3, REG_I2C_SDA_PD, I2C_SDA_PD_MASK),
 	PINCTRL_CONF_DESC(4, REG_I2C_SDA_PD, SPI_CS0_PD_MASK),
 	PINCTRL_CONF_DESC(5, REG_I2C_SDA_PD, SPI_CLK_PD_MASK),
 	PINCTRL_CONF_DESC(6, REG_I2C_SDA_PD, SPI_MOSI_PD_MASK),
@@ -2078,8 +2078,8 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_pulldown_conf[] = {
 static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e2_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_E2, UART1_TXD_E2_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_E2, UART1_RXD_E2_MASK),
-	PINCTRL_CONF_DESC(2, REG_I2C_SDA_E2, I2C_SDA_E2_MASK),
-	PINCTRL_CONF_DESC(3, REG_I2C_SDA_E2, I2C_SCL_E2_MASK),
+	PINCTRL_CONF_DESC(2, REG_I2C_SDA_E2, I2C_SCL_E2_MASK),
+	PINCTRL_CONF_DESC(3, REG_I2C_SDA_E2, I2C_SDA_E2_MASK),
 	PINCTRL_CONF_DESC(4, REG_I2C_SDA_E2, SPI_CS0_E2_MASK),
 	PINCTRL_CONF_DESC(5, REG_I2C_SDA_E2, SPI_CLK_E2_MASK),
 	PINCTRL_CONF_DESC(6, REG_I2C_SDA_E2, SPI_MOSI_E2_MASK),
@@ -2195,8 +2195,8 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e2_conf[] = {
 static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e4_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_E4, UART1_TXD_E4_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_E4, UART1_RXD_E4_MASK),
-	PINCTRL_CONF_DESC(2, REG_I2C_SDA_E4, I2C_SDA_E4_MASK),
-	PINCTRL_CONF_DESC(3, REG_I2C_SDA_E4, I2C_SCL_E4_MASK),
+	PINCTRL_CONF_DESC(2, REG_I2C_SDA_E4, I2C_SCL_E4_MASK),
+	PINCTRL_CONF_DESC(3, REG_I2C_SDA_E4, I2C_SDA_E4_MASK),
 	PINCTRL_CONF_DESC(4, REG_I2C_SDA_E4, SPI_CS0_E4_MASK),
 	PINCTRL_CONF_DESC(5, REG_I2C_SDA_E4, SPI_CLK_E4_MASK),
 	PINCTRL_CONF_DESC(6, REG_I2C_SDA_E4, SPI_MOSI_E4_MASK),
-- 
2.53.0


