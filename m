Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF04EC56208
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2026 22:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eDaXBo0suX5TtrxDytcpznhLGqRrwrA02KYekcB6jq8=; b=AAqTSOpyH/Ck2T4bH8gr0Vx6RB
	vAyFSvC3+Ehq1eXurFTApewKF/U3eisIhgtmTzbvGbwR65HCv/XmhWkaZoekQUzVE4OpE9r0YdvWN
	SxvP6lFBSwfoT8tybezSMelNh9aUZy34BjyynQrOHqW8Um8HPLu7KnJgRZQS4PAqSw4APbGPBotFZ
	CY70oeWnsR9aKsW4vwm6aMUKmxSdQnqKg48T4Czfbyie5mMSOxc5oGHL6nCBk/wz6eQaHhKeAzDxL
	1bnfLzUTT55GhQAtqnl7Rpw+6AyOBbfZKFscly0kcGQI8uFoY8vpPNJSb2HH5IUSmsqom1rZZHxxr
	nihDJGuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws6F4-00000006m07-3OPz;
	Thu, 06 Aug 2026 22:07:10 +0000
Received: from mail-westeuropeazon11023113.outbound.protection.outlook.com ([52.101.72.113] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws6F3-00000006luJ-0t2q
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Aug 2026 22:07:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vBN6Sp1rYCA/TWX8sg0I9J/6ydLr2DDtBqOPhbjX75ARLRgreCk6XtbqDjJ/JoZcJ7DA8hP1QgDCNIYLyyXB45oKHkasYvAUZGzbzLz2SGWlwSkZeZTouAiiYsyZo+B0f9vmYbpe9xotZuwIJupbmpZeegMr9aWPT9hW7PtIvoKnUhF/9ieWc/kIqV/BwIgS/WA5lueq7rDg8+q745E6RWykpz77ehLkWYZ8XwBR4HbYyy+VrNIHLxWeZ3hTjoENLRLhWq7tBm0OOv14reiuT3Jqs/S/pazTcTSL6xKbpmAra7o0CFWMFgkqEd8fWTBgm+LwtL0L5v1vrTPysOSHWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDaXBo0suX5TtrxDytcpznhLGqRrwrA02KYekcB6jq8=;
 b=FvWd5hxti3y+MGngANa9YMBB/YxQBumbkDCTkdJoqJ92QqjdM+oIJnkbjn4vzAwlb/Fh109K0KuLUQQvR11BUAwqU3OmfZbkYP6pAcopbJeIIar60aep86ifLLkZTangmsBdiJO0flk1LMEGaoaPItp6mgUUuX/mUhVVWl8Ftnrz8pG99REGn7Nqc5Bok0uvEMOqg44g8xaNS5EJ0BO9fzbubC8s50WaufNqz8BxJEsP17BDfmWA6OoXOVbNmOA/sOBgmHUe27TKhvCbE4F++SQctp0KsKbC8q+rNAhdu9C59sgJuytElyVzBZIRTIYG0enMqM/VdkHAXZZwt6uJXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDaXBo0suX5TtrxDytcpznhLGqRrwrA02KYekcB6jq8=;
 b=P5/jp2vwdlyroySZuXgTeXMqvpyTjfterxKBwAQfQEXkAzqPZe6czdz9Cj93yTnapU39svV8q/Ci9BzTLXqNQu6MxEGw5I84Sd4psDGwUglC2lwFxsmYJh8OkGd5eTeqFIWHpGmu0puKQ2q9DbqAPN66gHaqxFF42o59L2sjj1eqgk3LcUFXGUzSYDzP+VhYTaiXLGdClj2IFqIfKTUdc9LzKqwaOo6GaIuRyampOy70cL97U3c4q+xpXORtuoT0ROXexCIixAQjw8TT19QgBrjUjJHoZvJUlvOXwLDrNNgpdf9020JDyADjW8S45RrTQbaMOtgeXoXlRsFu53+7rQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by VE1PR08MB5823.eurprd08.prod.outlook.com (2603:10a6:800:1a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Thu, 6 Aug
 2026 22:06:59 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 22:06:59 +0000
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
Subject: [PATCH v11 19/37] pinctrl: airoha: add missed IRQ resource helpers
Date: Fri,  7 Aug 2026 01:05:57 +0300
Message-ID: <20260806220615.4078303-20-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::17) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|VE1PR08MB5823:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d86b875-77db-4826-ddd8-08def4070981
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|23010399003|366016|1800799024|921020|38350700014|10067099003|56012099006|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: atWN+tai9DAilZDKdUE234ufrPI1AstNO25q3Ken1HkafEYGoEj/+Yta3+Zr3wgRxRNxYJ1PkLXJ6fxv1NA7mbbfDh4rCnLun1vLZnwzbCQmCCP8bcItPrcaJYLdsMDrMHy9/nP+uz0bcc7a3VeBvthg+ZCvqtE9ooq3jtOEhttl1t0tRX+fASFW9FsdSLQ4dvRH42ooLayyewZLbU1z680LMdqDJCaxVPnvrroemDYeUkIem6cFej2AuNuMPoPpopwCx43fuj8hO1IewKsvwZ/UO44S3TM0AeeH/K/yHfEUvl8ZOt5wHGAtSoKYHUbS+LwhGEQFOVB/2ff/trUGjxRgXRJ1aQML+VlU+WUvYLedAxEHfWhYd0tlOppm2aC145HScJXmgIOU1haVMPZOUg7f8UiGJjbcdrvraDpHSv/cnrSdY6K7zNFHzJKhUZI8odhUK6ojncI7FEMa0Xk358YX3ueS4yVHmkCHAUhJ17A0BzeZKN2YK43Ga7694N5m1oQVc9cXQFbcJCdTADe14eJSIABXNl8p42UYk95kyEJOEC/WIzWossy/EuJLWDew4XN6//vp4m3X9mKy+BGCBuXi0X8NEjh0xaw7JOYn9u7jK2YNVIPZCywozRhWCQfxwI5b7zhmQaz4mX401zbjY340aTB2pCbrxe5Epgkmzg0vWguDwkB2D+156xpZ0zljZr0R7EWJqWVvTs6FWYrlA8X6Cb+9jAc0waeCM163MIi7sGBfNWlHfMVcklNA8ugB
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(23010399003)(366016)(1800799024)(921020)(38350700014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2/ac1PlQiJgzmIgHFW/yvMVt8+2ft8NESId6uZah0pmJc7mlkHYEqAykAYVJ?=
 =?us-ascii?Q?UpiYncNxN3c7PUZvP7u2yyZ3bv7l2HDDGJ8PZf2ANCNKFgH3UhTYWNCzqDb2?=
 =?us-ascii?Q?jdtMnAIiYlsR2RyJIKTD9CcDx5uWofKZ7rZV2A56c2cLXefryIo+X1NPUnS+?=
 =?us-ascii?Q?1IB7nSYXhmw0rC9uKHwxLmkvcVAL4bhOPMHTBe9MhYZCTcr0a4vCuCTZxXKz?=
 =?us-ascii?Q?yXA8Zu6av+wY05BcO1By3ENlvo6kUGife6biCuvM932OsNnqcPVl8KDzlrMT?=
 =?us-ascii?Q?9YvKPxyGTtxaiNFPHX+Cz0FuW4ffTXbUDop93pg7qwkHiIIKx4k4jcHHwWWq?=
 =?us-ascii?Q?Y+uPcSUGorG72fvdoThh4X8/brfKjYbo+uluJUtyeOGuC6p2mtjL4RvvK+4P?=
 =?us-ascii?Q?O//W6vprpkb9xX5qqtSgH0CgKNE+RJxHgBsVQc9U4n1bX7W5d2D+JSvL4g0/?=
 =?us-ascii?Q?cPeUiPPL9pv3iWXAL7LiABpoxZOvkEWYbtaqOPEEnRAv8rJIU/wCkq8S5nls?=
 =?us-ascii?Q?YETW44EhNDv7G1VRS6U3f0Fh0gGCN5GxnARUNf3o3/I82is+iXQTInRukOVK?=
 =?us-ascii?Q?r9/IudSii5UCuY0FXdjtUi3D7VxkQNKkP1iuQrgrrjkaDLwDqqPR/WIYxc2I?=
 =?us-ascii?Q?YQJkwyE0MRyjIYFpLiavvKskPxREZzF0LERi6S0oFJtswyqrzvbD6Pgl3YY/?=
 =?us-ascii?Q?WslxuxrthsDtTIV/fHtfZqqyk4ut9oRZYwYcxFoOfo6VnLeBZ1eBjsqa6q7G?=
 =?us-ascii?Q?8BBPEd3izVvH9oVbsnkCsmC0J8vCsTdRgdPoljxI9dHTyzQOQVVqelYuVXOm?=
 =?us-ascii?Q?C+o6yfyGsjVtYMPnrO3G0/1l9asNGIh04u2OFmQjMGC+Qtq+4QEL1nRO0XjV?=
 =?us-ascii?Q?/hsN9TWZNcRoanbb7Tr2n8NzUCmmQPcMJdzFT48c8Qda1RZcgb4M6C1xjmtl?=
 =?us-ascii?Q?VEyH5ALbUeNq+/Ae4HBD97D8GiMr7+2KmCdzCWIHk4IR5YeQrQ6x2afeaUzA?=
 =?us-ascii?Q?EZfa4zWPPpxMMFgOv23WslR6ofkpRiY96ZYoQwUtChlpJ5UqcDB7xT/22ej4?=
 =?us-ascii?Q?petKDruQxYtJiyV2qB/vrB1VWDlE947FfYPHAa6iytWPL96aN72V+YFQ69vh?=
 =?us-ascii?Q?tNVCHX15Ff81KCXkJYueBXNNTlQNVUlQ2HQQzZmUkv0PSg2IurDbMjtX9A37?=
 =?us-ascii?Q?cYOrGH6zhIgXltP+9XrbYvU33XrpnUkdXkZrH+xNmXy1uUHyCnWBRcneuUlv?=
 =?us-ascii?Q?NDETQn7jPK+SopGf2B+N0m+Ey0i3iLBM/7EbDdB9hS+n6E0SzmbKU/4woB2q?=
 =?us-ascii?Q?r/9LbbaA2imJvTk9PkFz+3/DLZ0q9gGvsO/TrOoa0zOfsBdpDcR1mGg055dG?=
 =?us-ascii?Q?FFPj+5Fcd4fKFLeVOD14zz7OviJ2xFtxeAN4scCTCTqKTQjrTMFoMz4yxLJX?=
 =?us-ascii?Q?Xezq8AyZXQqTKwrTBqnLipHeP/JXJ/BUOWdNwlUmrWcX0Gj1FhHVLBpHdIxb?=
 =?us-ascii?Q?NDNvwHCaBeh/odP+P9rIW0fxOrLfia+hhwXQvMTJhoT8lBFLenm4czESeidl?=
 =?us-ascii?Q?OokIfVuFVdYZ4XTo8MifQ3sGAaW2k05U0PqzNA33FxU7TynPRgoeHYgw19N6?=
 =?us-ascii?Q?s+N0lzBrNuap9tG+rg8sFBFn37wPSE4NW3zO3QNlwLgS/Ys7RqeF8smeMJn3?=
 =?us-ascii?Q?J6I53rLYrkYolWsJ4ZRyYSafE/Cm4CJOymvDaTUH+LaipwJkfi4Hf9ZNrjU1?=
 =?us-ascii?Q?bwSc49LFZLxBSMdgJ+ktoLK+7ow4hyY=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d86b875-77db-4826-ddd8-08def4070981
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 22:06:59.6246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yrix5Xdi29LTA43pBfuYI67gfLtTY+v2/I0xT0rrY6VfpMjCw7fCjoi/cJvw7nRvJx9hOYpFijzr8wX2BN6aqnl4xCtOVNk/dTjiMzorr4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5823
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_150709_248203_8BC712D1 
X-CRM114-Status: UNSURE (   8.40  )
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
index 0f2837320d1ca..c64f3c9a35acf 100644
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


