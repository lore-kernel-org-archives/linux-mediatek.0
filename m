Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10647CD98F2
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 04:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WEZqaIeaMkDZTa3VVdkBUl+UfVD+FZ4iH6LW1+maZQ8=; b=RceoAGF6DPoHer+f7SyUfFFAIg
	KBV0bntLeUiuy5JHqLoKUla6YHYzlmgJk9fPI/8uSwNwbTRP0gsl1dHUqORJyZj8XV7kvRGU3F+oH
	jNL5jetdbbVBJetK+keMB1wtHCC5Ji9DMqlr3bZN0rbLdFLD8I7fmLMU30RcBthOepYY9Hlm4CQGq
	GJP5tb7VvUairEtzmO1AcHvs4GkD/5dwmj27DZBKJ3SaX4OncBxztFE+1p91nxF6eOcqJ9k8w2FOd
	k+qCcIIXM9rwedn57pl4whEd43Pc5Oaj2LxJVyPobcBN88P7XCZIAVTGKrBEeaavgO4cwvSDnjzq3
	jsCwLc2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZi1r-0000000GbqJ-3a7O;
	Wed, 17 Jun 2026 04:37:31 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZi1m-0000000Gbah-1scV
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 04:37:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YJeYV35uS4MI5GUz8XD5pXJGyxCGDBz5Zs58jyfQOWh6RUL1QXo2w/ZMgZsQcC+/ly0JkazV1Np+4FK3Xl/IerFj9V8kaLgaFAgAzedTOUGysIf3sxfkHYRXupanTgzTxaCPPj5J9MBTNm3MBTw6BMyvmaGlivSa7YeDpi8PZwAH2eYHQaL68G8uEeeEE+eS69IDGPRhbCoTm2gzqi/ScRpz3v0mztk4DkVzoWoPBqVcTSz+rHfbYtmWi457jeD1JfOmITWeJjGOLuc0u66i14df0C3fVTHwm1+5rOuAC1wU/upwixSMvGtfy4V8WP3v/KgzZG6ghE9TmIMsn6ufGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WEZqaIeaMkDZTa3VVdkBUl+UfVD+FZ4iH6LW1+maZQ8=;
 b=w78xq4hmc+OgVC8pzGQlTIXED4jIj5EUMFRxndycNgEQLGNwc52Sj3z5//AVBknjYgmyl2DjBxdZwq488AOSF5NkJu0+yTnEzbb0YNhbjWmwOJBgezOZlAtd5T68SSZ5euN2zVzOVy38T3V+9HTFKooztxT1vf0ksDSsB7gesMYj3MEuEdHE0YpDEAKDmLYFoP4rjCffS1TkvrhlctSFRSFltHDRo1LMLCFSWNx4nXKQyD0EfrVTLKyIDF72922HdqhJxqpjvhQ19nE3IrySfq6XhCEddimHCo5yzuOKSDO77Yu7ZlLPIhqPbBq2c/PwqA3AG9+IiyypDuMfdkfMCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEZqaIeaMkDZTa3VVdkBUl+UfVD+FZ4iH6LW1+maZQ8=;
 b=KrJbwwY60NRtsOxk3YKaJZcUpyZGGMRkNpB00CxuRV8PPF/Y7AuQZE+Woqic9zwmYeZlqOqwD7uhlrki8aD6XdH0toVF+2d9j16S49Jj8Wg05KBMUv9b61wstaMVrhMOe80pnYHZsXzHjHXki+vp/9zA5M9EiGgPQ52VAkj8U8RtJRBCexRz7sqeBDJprGNW+yCergEESMWJF8FBk8z5ahH4vTMJvqCWyBQ/4LX9B/7KJbfT9gmpVdhwTbrz0//H8Yx748y/mNm0IdNkbOSCUx1+lhZK+ha4BtlelO5V2IAFjATxbSt7YdKby86AZbgk/S6lgMpMcdjwc8+a6Y9c9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by GV2PR08MB10384.eurprd08.prod.outlook.com (2603:10a6:150:b2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 04:37:15 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Wed, 17 Jun 2026
 04:37:15 +0000
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
Subject: [PATCH v4 10/14] pinctrl: airoha: an7583: add support for npu_uart pinmux
Date: Wed, 17 Jun 2026 07:36:50 +0300
Message-ID: <20260617043654.2790253-11-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617043654.2790253-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260617043654.2790253-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::11) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|GV2PR08MB10384:EE_
X-MS-Office365-Filtering-Correlation-Id: a21f5486-707e-4287-fd52-08decc2a1b67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|1800799024|366016|23010399003|38350700014|921020|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: mZEQSDfE8qKKttWZKllJ4Uu592P/eOj9zfzDXebNli7l5JiobNYi6y+Yu/pD+U++RehaBtZVsi4GfKuylfXN/RispdxHHXF+RRhuXCSYy+An8Ng1jQI8+Fd6VtiA95DZaYOAISPXN7YZZIr3cvfznsOLOO0iubjpJoOSfr2fqY/injgM4juRjzQ5b0s9tR0yrGh1Ww9/kmgHzQMXUTpvCir/67cS0OLdWjW1sKdTAly+w1b3hNVqc/2No7roACADQgZTm4RZdjhlv/3uu4iqkms+MoHKVI4i/Frf43DFuVWODp79e+CEFu8J19MQ89J7oQq8luc3ZxckYHOz7qDkTX0zNs32ER4lrFK65j0bDJs413WG+gDOg5HEM8Bm2UE2lXuww8rJJb4bj7dEpGDhioB8XLZ/8e7SiO9TuXBZN4B+p0+61xEH9tXx/51N52jG4njKmk4TYqu9HOKDJME9cDRxKD6cMY0tcWeQJNsYnv+l6Zftld+Golq45Iyo35ptqKqR/DrclNFajygaVxEY9V4n7HBIdJk5heUEG55LARAHXv0ZO6bIsDLvcLVdK4lFnuyoJR/4b4yulhy5hrvW14EZuyn+dbyWSAQLGg/NhILwimYTOqdW18qumzetS7yyKjQ1RbJNBiUyBw0AQXNvDcnjty3CjULxEtEFDNxBGbM3RRNJkktnfJFYKOZCAdEn651pvtOLPbfNOWMjbfqEBUVsRk6L/Dewy0g9+bCNmfcZkasitjUAld48FSMgwKMOWoeT9x/oc0bWRinAAJ88uQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(23010399003)(38350700014)(921020)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aAytnPdZhwT2oe4/Lll7re58ZQNVEBLFZBb4i82UwJftkVSz1qZryXoOM6LF?=
 =?us-ascii?Q?uDHI+y7iXOby+rrgbRNN1PHLPjg0EU2uxU/jIxLpHXym1w4E06dW6emQ49Bb?=
 =?us-ascii?Q?5RRrVBx9HgULgr6VbGsO5Y5HkhEqLm9FvCNmulHrQxb7kh9SfLkQ+KzbLj0U?=
 =?us-ascii?Q?eZim+MkjlZ6BdzQGnuoDVAXtHa2nrI3ndZcckmGDKBoKYphK4AoChRe4gkcT?=
 =?us-ascii?Q?XaaVTP/2BGFsMvXVWQydAI0tyNQh70y+JnWox8YrUsvzVa3zPVaDHNEJUjmJ?=
 =?us-ascii?Q?Iib/P4cP+S1SAfP02MqdCOPyqQsIWO7X0NjcNRgP+HtyQ8Jz9p3QTt9xbk4E?=
 =?us-ascii?Q?f/m30ngdBMyobUFrasZJOMFPH2ZqWWuxTFrtU3JKmifWTeoHWzmeWXwOzqSp?=
 =?us-ascii?Q?dOV4MUNEd6WFa05PknDx3EFXTDno0s8/ZcysyjYJHOuxeZ697uPsqGBPGWWG?=
 =?us-ascii?Q?CrgZzIJY+Pw6JEAtzxDm3pHvs4GkzsHG742qVyNjMaP19g+EMTf0b+Buuff9?=
 =?us-ascii?Q?vpoi1CC6bR7Swo9K+JufTtTAukqlemxiRB+LXpaeeyjAW0wauueclKLQ5U5s?=
 =?us-ascii?Q?eNlFhL6gUDu6P1t00V9z/Q3dzHwF9V5jUnz3Zo/tEgF+VlE0MOsZUGlqyboh?=
 =?us-ascii?Q?7x1MOHHMNwKx9J0e9VneZT0zsp8thwDGlzT8KFZc+m8SbCa1rL/NYkSHAzd5?=
 =?us-ascii?Q?U/1FJFb6CDjEDxULsiQZAAgkUKJKCJqvkbOfI41H3gdOfs7XMhXYzzMQNQzk?=
 =?us-ascii?Q?2jq3/iCgdzyrgGztPjMUPdbEyn6rl7km3P9nPKzcalTkjxc2k2vS0//zvnOP?=
 =?us-ascii?Q?1LG1ILvqG/IHkdYERs7bKII8XdyrafviaKfDvr8aIMjtiiQ673QQjlChWMVG?=
 =?us-ascii?Q?Jk9fq1uYMTuIpIod5GjdkF21U+UqF8YlAS3o+5vSUTolIprKxuR4jzUshT4J?=
 =?us-ascii?Q?A77+EwxZkqOw1jLfdQEri86mFVFsB/CSZXuWPE93e0KZpR7D9kD9Vt1BenwW?=
 =?us-ascii?Q?TBj5cWL+cyVS/aCCCm4xWzX8qlC08HZq0PDoshhXj9vxdkhODzRtqIXhkuGW?=
 =?us-ascii?Q?BKYQmrWSR4ehtX8g5Hy1qfSTK9dOwgJhbQOh+2qenQoKOgLyWuoP2u/JMn9E?=
 =?us-ascii?Q?k2dFH10dn7i8PxzWi3M2QRu2Cl2zUy2gvKK2sQbpsgLM7KMoXqwVYNAM+oaZ?=
 =?us-ascii?Q?oJ7p2HNENxXnfqWKesrx97vwwh0M2cKzi7QvCjPHO3AzaIRwXOkKLI1XoYhD?=
 =?us-ascii?Q?YZmO5bVOp3jEpZ/z6bU/VVF9D/MPyyj4Uz465qvqL6jslNTAj7NPUsy+tCxr?=
 =?us-ascii?Q?xYOjG9rHPygC1pSZ9qRtb0dmJxk8JvqunXqdtsT16DT0/xSukFcbbxMjKkdU?=
 =?us-ascii?Q?2HNzsp8IG/2RoYApoQFHnynWj1s1HSgvlBeDuG6qasz7G14W4Giym0gOU1w0?=
 =?us-ascii?Q?9m4blkB81RXcJ1V+e7XIABjBy1IkjCwmlB3jp+MVIODXiJmFxZGQsseJz+a7?=
 =?us-ascii?Q?8rbxnKoD+EiQmHambvQ7eTnkR6pdEqtEdYZXOf9MqVGPjOi7E5wVpjabZAov?=
 =?us-ascii?Q?RBBWG0KWgwQWkVjf9GVwig2kFJjni9JlSJAc2lR7hpO69wboXt3Br0OodaG8?=
 =?us-ascii?Q?2t1fcjDBplQAtu0RVNUKtuTbjsKFUZqW2hTKTomMQrZResXdTZdVEID+qdoW?=
 =?us-ascii?Q?N48RyfaT8hUXitVxUW4c20Hsbxyc26IuUaP6/Pi6+x6DscLnn5Sc8Ck3sBIP?=
 =?us-ascii?Q?D63gvmQxS0PzfvEldSRDKihQ3olH7tQ=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: a21f5486-707e-4287-fd52-08decc2a1b67
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 04:37:15.4890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2rq1WkhfziIZZysKQnLeU33EOBvKjDM4JLNc7dycT702k1NqLEMeIsIUFEaJ2Tc7tQIQ9BoG0sDB52Ra2fTUZS3E+gm79oWFx1qfp5Kl7zY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB10384
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_213726_542749_A63D27AE 
X-CRM114-Status: GOOD (  10.19  )
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

add support for uart pin function for npu_uart pin group.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-an7583.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index d4fbb12fc639..959eed06fead 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -68,6 +68,7 @@
 #define REG_NPU_UART_EN				0x0224
 #define JTAG_UDI_EN_MASK			BIT(4)
 #define JTAG_DFD_EN_MASK			BIT(3)
+#define NPU_UART_EN_MASK			BIT(2)
 
 #define REG_FORCE_GPIO_EN			0x0228
 #define FORCE_GPIO_EN(n)			BIT(n)
@@ -569,7 +570,7 @@ static const char *const sipo_groups[] = { "sipo", "sipo_rclk" };
 static const char *const mdio_groups[] = { "mdio" };
 static const char *const uart_groups[] = {
 	"uart2", "uart2_cts_rts", "hsuart", "hsuart_cts_rts",
-	"uart4", "uart5"
+	"uart4", "uart5", "npu_uart"
 };
 static const char *const jtag_groups[] = { "jtag_udi", "jtag_dfd" };
 static const char *const pcm_groups[] = { "pcm1", "pcm2" };
@@ -754,6 +755,15 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
 			GPIO_UART5_MODE_MASK
 		},
 		.regmap_size = 1,
+	}, {
+		.name = "npu_uart",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_NPU_UART_EN,
+			NPU_UART_EN_MASK,
+			NPU_UART_EN_MASK
+		},
+		.regmap_size = 1,
 	},
 };
 
-- 
2.53.0


