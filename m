Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FEDC55822
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2026 16:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5CiXNFWEVjoRLH7DkqfTPmruWn9eiYmW11EWzvD7l7U=; b=HQH8407+tlHJeVRcCHetDvWcAe
	aHGK4pW5q0LxiWjO1YMdQf0vunCsipMFxu/iPneFmKxIqNCmdYqvCz6GdWchM0eKEDDAaKaavICQL
	J+oAs9ZHYCmRWQDZ06IGSfpTwS8KPpqmjgRcnujzxTabGESF8R8Tqb30DQsRcGm7FPW93vlX1wcEu
	BDHgjOLE8iC6ATwINrhhFYxgrK7L9g7ZGebkNMgWK1dhRlX2R2DAUm+XJ/lQ5d6AAj8FTu63epBX4
	AlF7HvsjmjRu3vFG5JTeYtxEyg9ImCZ6PqHRQtlA1SJ/LAk7Slu0VaB5Hzrg7n4+UIrhVV3So/K/3
	SvpshGHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHdi-00000002GbH-2LMG;
	Tue, 04 Aug 2026 16:05:14 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHdg-00000002GXX-1EI8
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Aug 2026 16:05:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PAlP+41eKRayQLEu1s/Ntak4AB+ipqThB7wBHPy5Wr4hSOcEk0aLTXySd5SMNxXU2SPo1zveEyGBYTodNtrjzyV4qJUhPezuhVgEaJ+Ks1zAbo0qJVSafhvK+Mfhy5GGD9HzDxNboUOi9dju9wtnQyPUdrSay3GhP3A6zrLdfZPBfqlHxGSkgFUk9zID/YemNUQgOXab3WyqpiMyoLA3pqxHGtXMDwsvGjmuJ2jlVHeLXLC5eMfyM5VkLjocOlTx5tC77BsHzFNh3vXFLVPaSdy0SuHRAGBQnxqFWI8uLno4Kap+cGcV3mwdZs3+xgsW9UL07wcPPa4XAqFfXkLc+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5CiXNFWEVjoRLH7DkqfTPmruWn9eiYmW11EWzvD7l7U=;
 b=HgU0uXWZOaKOAIPzFOePt2cUTj1WO6Ec+9z3dSOB8fULTyJ067GSRZB6QwRTprHZzKikmcHSQE/JOyOAE8qJfy4ZANpLU46a3NLeGbaqzwIWvYX+o/3jFQ0asDoELD33iMa9tEILxzZnL8RNU3mJjy/+naVXIrv+YjVat3I7efbdVqLG2iEjWEZw4CegGLNnSwJsSxXPqTbntmyqklUJI3geY4CbbtPFnivFqvWPPoRhX3Z2WU3vjx3Sn9gA2eust95Chdo883vkIOkJbL7cRj77QC2MHpEmeD0IO26LDjGByrX3o/nLLy0z98dTiclQqMcHSkimh4ThlFHAw3tuFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5CiXNFWEVjoRLH7DkqfTPmruWn9eiYmW11EWzvD7l7U=;
 b=Zo5Yt29du7yrgA9U2oeyyM9BJJ7OdH8AR7nbtUkqED9zG2z4XLe2hDhIgCP+IAEcIOvEeTLJ1fXrNc8QN1WhiFdAMxHBE1qSC5qCxmJiATdu3wUAZCEj/ijkHKYtltpvtBbbEWfwYEYK2NqYJHWIHQm+AMd0DG7HHItD4lUABilPUkBFEIdr87ehTTZN/jY+jsHujXZYKmn6tpIbGxfgcW91TU3quueNx4OpmNFgfSFdfP8NKL+ECoGl1DJxNmt3Pir7PtfhgFL1QuT5XbaLJ/D5KteND416EFQZUt0QXPi5iobCEtPgWqoSRo6+9m3BY5suMFBwGXTCBjM4tQs+oA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by GV1PR08MB10792.eurprd08.prod.outlook.com (2603:10a6:150:160::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 16:05:04 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 16:05:02 +0000
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
Subject: [PATCH v9 18/36] pinctrl: airoha: add missed IRQ resource helpers
Date: Tue,  4 Aug 2026 19:04:01 +0300
Message-ID: <20260804160419.3592327-19-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: cd0180a6-6b03-4e84-9c9d-08def2422408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|52116014|376014|7416014|1800799024|366016|38350700014|921020|56012099006|11063799006|3023799007|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: kGzKhRqEI08ewzidWWGEvLBqJHm/oHNLgiEt6Udig1vRRJg8VRxdyFh5AUtYg+QjjrhHtXTl/MLZWh3mH+MQdMq977uzb8vXPzK6C0GbX9Ge5OsRm3SkZo0gfjJbkC6kEgIaMvB5WTCYzAHUnVZBYBdmKmzAeeYQ9aflsBMY2J1A8gQQ6gKgGJTV9v3Bx3Wc/btcRKhCH4iEWE0B+7brmscqwsWJ/OJ9o1yswTFeDBGSOOSpf771cbqzzVtoMGnCVvBHSX6OmyXB4/USADNuFTHUuyaeQ+0eeIbtpznB+SnDD7sp0x12exQSkM8NB0cChO18AQDXstphGBvKcQu2gV8bxuFR/P4yTqm7v8yEDl4qbi7AX/2PYqhfGb3JmnSdC/F2cuCxj37YTDXFlWkSMByn39D4Zs47dHZ790u06kkNZBEfPaXhbqK+jzczebbPDfRptJP6/6FPbpoQft7wMjxAWnE/6W9bDKIzUbsMhatb+Oryc/p1ME1LRj2ZqvCaTO/fB3bcYIFQEPaokEfIVB6AMQ6MoAPJ4kRLa/9JHhysfPKBK/sbucDuFm2Wi1m98NXbEugKpXvg3xys8msT5cLVV4Z+2i83e/4AQnByMrlOOAG+Lq/ZcP+cf1L5px7xyf/va6IlH/K78BOqV5LonBwN/AC+ugHmXylh0HRzah7vjiKlWJSH1avt+VoVuZt9Rnlqy1NBke31JL92b23mxXS/dPrkyf+iyVGQZ3lTCthQ5Z8XWIv5cf4Q9sT3RC6K
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(921020)(56012099006)(11063799006)(3023799007)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d3CdAYw1EfhV+/jhk7dIUJc6NudjA9XYfZOdH4DgzOXdcFgve2ec7v+PM1wI?=
 =?us-ascii?Q?gluv/aZr6EkM8H//VLSZebNHNsLPLEgVC7Jn08WJ3oy3MpCHQTfwyl+nlqK/?=
 =?us-ascii?Q?AHN19TAV+RErU+HSM1ODzddRfzCatKbqPQasuQ8sQG+QhDnghy1v5yaD7U00?=
 =?us-ascii?Q?/ves0fn6akxviTxAMHzymLu8n84PjBR9EmH0vy/cAv8nCzldCqBXDJtW05Al?=
 =?us-ascii?Q?j8qoedgZEHWEnSyyLh/zPVV5rXd7jiBDcRezt/4h7dk2KdItLt1CRdzDIq6u?=
 =?us-ascii?Q?MyjARb4pgIEMHpm7QztWD7ouPFMc6UjCymjThUYZyfwDNCvp0tvII/2ubN8i?=
 =?us-ascii?Q?//dzIF5OaDEtoCblgzuVRnB6d9hAVa8Jx96F4psxa1tolHPa/nzwiMtV6ZeV?=
 =?us-ascii?Q?bmDR9HUsBG8O8Hj70guyUHsJYzcxaGRlycF82NfNmd9Cko/sARwQGxYCmKXN?=
 =?us-ascii?Q?4LIe241VrmrbEx974j/P/3gB9oUTKnietTxJGCNBRTsT9RYVUhEkCH590qrI?=
 =?us-ascii?Q?0riEBRmqrHfOKbkUVoLy5tgwpPAsKIkuFjjxtmwZlZFuosZyo6j3+dDfJ8BN?=
 =?us-ascii?Q?OJO/EbjUUv3HJqKJlU8cQkBRSz6sZr5+NtPrCrosncRW4FLd2w7DmNHE5w4r?=
 =?us-ascii?Q?imGzv7mGyRcipd8fWK0DBppnmV6UrJBgBA8NJF2BdDLxtNMOh3Fk5+o4mtD7?=
 =?us-ascii?Q?TMnetLiSUJYWzG/J6lxU3gEqt4UveV/aqSYFOdS3eTEfcunOH4VKPGlT7Tby?=
 =?us-ascii?Q?+kLJTPPKIRelCFy0mfuqLPeAxLEdbcwolfgHQq/eEYoSvKs7yZFEEb4GXrG4?=
 =?us-ascii?Q?d2eD/+ltA+P3AXSmE8AnUsDUUNbO3tvGLNbzu0ORLu8UouBnhFs+emUaWjrv?=
 =?us-ascii?Q?n1KKSw26b1qmxwTcJ6jvqY5k/h6OydfuUa3oPH+XnIfiq5nSpRb36EpdL1pb?=
 =?us-ascii?Q?eY9JZkyiVc+MzFE3yybDukxB16eUydbLSe/nxgW/nRLla3BCGdx+IcAqDgkF?=
 =?us-ascii?Q?1yo5GEZFeJEgKRB2jKZ+XwPSO3xZRQ2npyvb5jH9jHycyzan7X2SXptVwJkt?=
 =?us-ascii?Q?e6JQ+YDi/Z9GZIEnCRL3JzR3nzKDUjHh9Y50SJBx+xwtQyJPGlpJZBDgXhjR?=
 =?us-ascii?Q?8psxWAWOIfYj9pDHp7lPTJeENbOjoQyCSlFUYldQLXF6ImLD8Sa6nS0dzaMw?=
 =?us-ascii?Q?d+0GUpQpdDK46mONIDjusyQkflBrcv5/ZH9pflP5VwBARu2h4euyoeeZl4yr?=
 =?us-ascii?Q?O1yR5wAakCW9XYztm4Zkf+ppM375Odln8nVWjHPtR/+5ovb2JDKjbsZMtXYB?=
 =?us-ascii?Q?1EOIL5sGcIiE1KRpxhn/gKqt5kympdmSeWvWz2+nogO9dhlI0s5U+zWnL/mK?=
 =?us-ascii?Q?QcuvqrYdX9BWQUolhCNj8EMxrq//EOpdPWswsZDk03w7CGJnRazkSrEBfOpQ?=
 =?us-ascii?Q?snqex9OGOymEsJ75BHgq+lhrk8MEayWxj+v6DV94qGo/LL86okWAUyI6wjlf?=
 =?us-ascii?Q?1V3Wqm4Z5vWL1I5H3byRIx/mdd2P/hERrKK5Oi2uWD5OP5/On78ntIOkd4F+?=
 =?us-ascii?Q?Lin8NdcQQcJNRcB80feJGNgxYOqEVE0yIIZ6jRarZkzkX8zZTVFgg/iumH35?=
 =?us-ascii?Q?xGmOiawWsOF5XMllCeuAb7+dOCXCXNCWIEd8Ilt259L4cqDb6693y4y6g54S?=
 =?us-ascii?Q?6ZLWApgwYl8MsgHMAY3+hk4LBJlKgNdN9vnNeaNqrRdJGJxEsPV3RmdGxxwh?=
 =?us-ascii?Q?nsoD30I02rcJP5OnoyRabprMA5nRU84=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: cd0180a6-6b03-4e84-9c9d-08def2422408
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:05:02.1905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0oh331bmpY5xgGW8kJBwTD2C/sQNASG5YsyJtEktC1Ownnybdxc8edtm1v3fIYLgNZuLxyukUQdoC/YNqcneeWg9RuUXgx9JT52SnfPdsBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10792
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_090512_337929_9830AD12 
X-CRM114-Status: UNSURE (   8.84  )
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

Without hooking .irq_request_resources, gpiolib cannot set
GPIOD_FLAG_USED_AS_IRQ. This breaks pin direction locking and can allow
userspace or another driver to reconfigure an active IRQ pin as an output

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 8895a8123c621..b4c61fa811fb1 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -2689,6 +2689,7 @@ static const struct irq_chip airoha_gpio_irq_chip = {
 	.irq_mask_ack = airoha_irq_mask,
 	.irq_set_type = airoha_irq_type,
 	.flags = IRQCHIP_SET_TYPE_MASKED | IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
-- 
2.53.0


