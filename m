Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D4EC55822
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2026 16:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sy2K2i0zQ8e9nKwSQd3DnmrScl8WMNqkY1SZWcwOzW4=; b=uqUTc7OdJmoEXGwC1sA+yC+dEw
	nrkTzRj7sG7GHJny9z9aTy5YH6oZMZ7jq2WdAH8ooXKaUg1sSpv3SAziKY3/hS48kIPvuVAsIWAmP
	SDHnz+bxGmZMQYc5i4YPxOmfDjCuZR6cFP5zKe9ufcp4ne/toEZ4DLYqeiHN2XiCZXbU6nm0mW6Ov
	LQfF7B14HofAUMI6zgsSzBVbF7pSmXd+4fKqvHRyX/e8fkBVXsUWb6BLHrUYWA+jN/YJOckPFG6w8
	LcwzlH5ilJFMksIzOfgjxgWr/hkKt5eMpi4s4HV5PfOHF1606xND9CR/ETkDpmJ+OZk/82kMEMpYe
	UOJk/+2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHeA-00000002H22-2ANh;
	Tue, 04 Aug 2026 16:05:42 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHe6-00000002GXX-1Kca
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Aug 2026 16:05:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+Tj12Z11YzuF01H3nem8jiPQFkMxNm/753Yro0t9bbcfZqACQSa2eKwg5i3is+HLsEAmWQSnDz3LT3luKoyi+d2JdCv4gX2DpyGb8j3zvXXh4Kq6rHixnhqJbBOQ7UFeY2mBGMq8+1mJgDJ9puKcqxTriUN+SwywUj0WziG+JAp6QOUV9mKodpPLTANuMIP8Fx+dePVwMSKQhhCQAtVk6eBxV17lbxSnVZho9awBpqm5hCm7i9othkBQP0vjO98wW3POc+Z+BWvt2H8rV9VQpnKr9Ys255gASvgpuBGlHfeaoi8zV8NsjTPxi0B8b/QCB/BxUoLidW08N22b5vCaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sy2K2i0zQ8e9nKwSQd3DnmrScl8WMNqkY1SZWcwOzW4=;
 b=pYn8MNIO+0Lwg0xH/iadNGq0BrhEV64LGSdCVY9INwYVAOh79DepGWjNeGkdar69vv9S89uchQVnBRKnvI3WEPteMFzN1GR7mCL8XFOkbiOTwACc9gbb51PdSWVUuLroj0dimgeK5a+oM4sYNtTk44yROnxJ3s3o650pMozl9NK7biXD61aikcXQlYwtjUQ7pCIM4OaoL6dSSTWOZ9M/LT/GNfT/5V6Rb2DSxRKSkZ52Y6XoM3Lb7+2oh9WEq5KLsXI8o6IeHrh5LVVYztnhxZ3Uqq0tImBX08zauT8mqrIUNF2PvAk87gvyJ6P5azG6dK/tKMdCaQ2lIKuUvPy7Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sy2K2i0zQ8e9nKwSQd3DnmrScl8WMNqkY1SZWcwOzW4=;
 b=G6r+iqEsX1eVlHf/b/OB64sdNZ/Syxk74KaLg0e4xGVCCzspqte0yEg+bYFjJAo7HMS3QjoMamHAxz55KLYsw1PFJfoqcvdbDFzbXq0sx2v1XdSoq8r7QoqhPlvB6YaWu2BMJbima9kdCUpkTbRB8KTTDRj6xntAYkGOmBOC1hNAYciuGTqtCIdiZ/0o11E0l8jBNNwu+A2yWSEApp+DdbZgBaoqgS126Wk3guvM9T/UFGOkKXVFOzvuCO8CgG6ISOYc2X6V+W8+3YqgOhsF3PXYHzzl0ZqWwPbqVARNz+MUzQHBuk50COVwtVvtLUudWhwPpXzQeWgLxZxL1qb2JA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by GV1PR08MB10792.eurprd08.prod.outlook.com (2603:10a6:150:160::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 16:05:25 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 16:05:25 +0000
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
Subject: [PATCH v9 30/36] pinctrl: airoha: an7583: add support for olt pinmux
Date: Tue,  4 Aug 2026 19:04:13 +0300
Message-ID: <20260804160419.3592327-31-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|GV1PR08MB10792:EE_
X-MS-Office365-Filtering-Correlation-Id: eaf80e60-d0b0-422b-c7de-08def242321e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|52116014|376014|7416014|1800799024|366016|38350700014|921020|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: D3EH3+gNAZyjG0naVw7zDqWNAX0x7P/bF8XthfSfwNMEYfAbgEqaqik+B9fw5UyNVwq/i9ci2pFRNbUYWmhKlrSS50ef2ryxaF54xCu0NrvAuEzILN1f6/WI0IRe3I47l9uwUTwfmqpEMs/0lpcVSokpnMqV7WY0lDbVMoDoqE/b3+jTWd/SEbvdO4AwgTMUtJpK4W9pMFq5MwjByldnlvqvEwzn1Ixvlr96Ik4FAldZU+GWhUqmuIie7LXpucYskOKkmgDS2R38xi3lx223ZQRcnrM3amPrkvgI32P69jil8Vm9DBslcPpml99h7+WwiZFwoILJbfaA9t08JAXtcRZckJhf6qBW5BqudizenE8T/ES77nqk+dxvNUkrMNk6wpOiW1UCL9jp48bZRXT2o6Sh1MWmGJCnNI+suzx/WcxFNSZOkw/dpsWeSBmvfx5WYpLWU6wBEPU6ZzBos264XxRZknJ1e0xNXWsbpJpoI2vjGK4DUyB1Pm3T8dPgUywOWJp4JBsyKBbliExr3zOf3G8Ogu3C9yFf6MnTuwaAyjOXrTZzFv0xQWyifHWVPzQxYU9JzARt5Kln1XVjNSlLXaHIgHwkDPbCkMadSN8HPHsYvwCCDKcfIBK22t3p6bSylyFMo3KYbBt4NucZ3ZiBUd10iIcV23FjpkXceBE7tBs7EV3UiEDWnOPt1MFyzb77eVJps6exev84mYTpKRVDNCzId3A+2TUUgYpo4/AK99U4e5FMZDudgYmEMMEgC628
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(921020)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6YAFStgGSXj6r71Fr/LTbwXX8BPsmtzaWFbeUO2dW0gC0TogmCzV7u+Q/toy?=
 =?us-ascii?Q?+M89DeGrV0Pomr3Vt7xrXIGG48fSuNFx9EGsTCogdu2Y5RQXNw7FgM9Drvlb?=
 =?us-ascii?Q?11Yih4JzkOHZ3PgxsR7SvNUxQ0eCuSHk9WYkeQxi9GSiaGeFbt5+KexSyKsF?=
 =?us-ascii?Q?cBDN20yyIN3QDjvPcl3LdTx21StBEc18wwSKdszktp7hUxJYS6XAZt/ZF7Ye?=
 =?us-ascii?Q?/iagsH6UYZX4ED8ccpEBv/u5MVWIchFq/4b2HNjZgThyPDxMTPsAzQtns6dE?=
 =?us-ascii?Q?dhVPVLnlDxV+8jUzq5qwZntR+JsFRQd25ybAzC93vMFfGa/qI4nIbCqK5dqd?=
 =?us-ascii?Q?NPOfy9h2tFq1/yrVWt74iXeA0QO+iUnWjQbeCAlWt1CcWZWLx7k2LUj/wiek?=
 =?us-ascii?Q?h2A+VgXSiyKL7jZcgbNWbMuW4t1VCOFpyE3AuW2/ikdv6vjo7z18ppAa73UU?=
 =?us-ascii?Q?cRuR8E3SFNm3jhKLA6lfhKtuPtQbWKUubYEovDTqHt9SWx5S8gqx1U8oFrh+?=
 =?us-ascii?Q?yKWxKcpwpMXxJdmHYColF6r7SHIDmVcXL/MieqSoG/y18MoiZHwG6qvJx1ms?=
 =?us-ascii?Q?m/27xdPE8aNa8ogd9FjAH8WGjVYCBgItpaWdmtWIH8K39zE8y7lvYjbxGm7w?=
 =?us-ascii?Q?cyVkNtUIDETKcbFzbRVeMUiINCEDA9qTJh7Bay20R8Z6mIV0iQR2jQR1uvgH?=
 =?us-ascii?Q?HgHD7j0s4pTHXSpUVxYsE4DpI7k9nFevUiNyvfvT5L3QgTRm+5tnPQgmqMMW?=
 =?us-ascii?Q?cWqDy3cScIfSw2yA9dyThxhIB7BSEhstCb/jhEMH858B5LiH/CK5cvedEzlu?=
 =?us-ascii?Q?8Z6oCjku/ozAbiqJkkU7C+IFRCB5ktZcK5GDp1r0Eh5MRuK70tSCwtTXRO88?=
 =?us-ascii?Q?r5cuODqMtY8JJY3Jb6ksJhKXWWcmWwlIqSya3GJEkgCykYClhlwq18aZEFpO?=
 =?us-ascii?Q?hu6bCsMzVWhxtnNxLrf5FKvDvZTBC1ANullqRGEQOqgkdjCYuGyjKWz1xv2G?=
 =?us-ascii?Q?tOb1FHsZZf9vz/tCTC8j3ySvhK/2eHiy7ymhTJcHQEaefyHaFJUJ55rCzTqP?=
 =?us-ascii?Q?x6vsmPCCcnO1r36fqO7BxgHFzLVc+QUohf++T9IeCAIAnKunvlcVPr7t9HTj?=
 =?us-ascii?Q?60pyahTmsGFI/VNmIqiS77qsex+klsbdu4NOrJbuXYDJYMww2DPKkj0hvhG8?=
 =?us-ascii?Q?O1XwlVWFvruJ8UFbk5AMdJ+mWeyCXbt4negIL+Sdts7062Dw80cR1oJnL32W?=
 =?us-ascii?Q?UnfjrElgt+SI51/vk+IBMPYhdMTTI6kFJO1J4tSPJ8uCbM30Kje/abvKKhkc?=
 =?us-ascii?Q?dul8tMUU3huMVb2Arvr/WVDQm59PDKpCKpy4ZPoSzJvKY019d5seFnQHMXfZ?=
 =?us-ascii?Q?nGg6r6f4AL8ppMLoaDR7MPJl7S1RA32kmNpfnZxSf7cGOzte/H49Ez9sqPWG?=
 =?us-ascii?Q?HQXSAtKCC0lhON5y4XhXbaTbKWMs1VnFTfdJK6+GlXUJ2B93sZ8NerWWdLol?=
 =?us-ascii?Q?BtmUM1jX0wPfSLPAb+dm1XVvEEyxonwglxEeqL6mOZqfn0/qxaoVJWkeb323?=
 =?us-ascii?Q?j8+nRtS/nF7doJL9UoOgRj4XmgXWvgFbvIbJ8tdER7YWHO0ds8Y8M/2zNr5r?=
 =?us-ascii?Q?/gsJFg3r+jaJl/GaV9evdbfiKFRKGJowxbR5C1RcVwu+77AN1PrW6LMNHidH?=
 =?us-ascii?Q?g67ZWzcu/oJnbB1dNARhSkytauLIEYHwY7l+AqBGLebyhvG94gMpEI2312dF?=
 =?us-ascii?Q?Epp7vvMp21R/MKeOxyybQOKaGhq17+8=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: eaf80e60-d0b0-422b-c7de-08def242321e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:05:25.7462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PTlOdrRV/GAmxbRtgu01lZ1a85iTSCbVZcyhJt2V79arHrU2orn0ktOR2HD6wEe8UWNJQQgQiempDdr36SP638DL2QT2bhmJghpIWfZTZiw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10792
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_090538_358755_83B6F51C 
X-CRM114-Status: GOOD (  11.05  )
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


