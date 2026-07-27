Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7526C54F51
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 17:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rgJGTH2Manqdb6l7SF0s2oZsQViWSq0iBsx9NKel4Tg=; b=aLwtcyuVl+rLcDtDpg+j3Ep5xH
	kQWXBoaermZgkf6CkXeFH/vaTamsVqAXBIUAmeUPvihyN1AxzPv4i/bXX/i6UC/jD5fQyKOC/WtEJ
	8pA4Yxes5FYVxGuSZoXxgQzPQzr0ZF/bLK2kdxF9ifMbTFpMxroQ7Alg+ZKHekrXvMjDhrkJDsfPk
	FzQjkGVEaBDOK8TmgdvKlb1PlB9/taYyiirT6edVrNgYvsFixcp3/1Ze+0Iz9Pw15Iu4RSA2Ft4fg
	EN9hom//2DjdGdtMp4H2CM21oO47oXSPP6GcLLPRIoxX5Jnxb42iwPAGzA+BUzzNRbWbgW4RGILri
	e7nootfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woPLi-00000003Yi1-3YkX;
	Mon, 27 Jul 2026 17:42:46 +0000
Received: from mail-westeuropeazon11020098.outbound.protection.outlook.com ([52.101.69.98] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woPLh-00000003YbF-11d7
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 17:42:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y300+BxvJ9QVCnLKPd+Ud9K3EIoPKESEHpDvfUM2Xinz3MMIhJ8N2FEqz4F3cs4y6POCI75ahoE94UkcYrHXVVHsitxX1xurc4gVd9Pw7d9BvIygPSGIEnVUhQIs/CFWOGm/s57bWabgJcquFWnzVmK+LRtda20+0XZchtIBu2dEW6Fb0DBajr08nU9k4rR3AMRTtelqeEbUK5ZaFIrIy7vtjhxNIFNVtK45+0sqStL03Eja+9l5RSmz6pFj0JKtOdgwu7FcsJoSD8PqeBBbl4REZUDskAo68pocWDpmrhwlFN0SUy1VPJH5/jHTF/FIWAIL14MHM5BdGuQC//0f3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rgJGTH2Manqdb6l7SF0s2oZsQViWSq0iBsx9NKel4Tg=;
 b=PRLWWQPHrGsSwiYK8uikAu9HuJj6wvs4hMf1Y9cEEytnIyVmk3eyumgTXyLGytNQKMO1tNZzHaixki4wMWF8dIivbc+RAd6GwzDRxpZZ7zSzt42fc5KP7T1n1wpzJgwAGp5VUcJlLk/KmdZxnBh55C9turwM/mcO5nwG5LA6tX9l/pr2oXpT5ZysfSQDZTreSmS7/Ar+qO5dZhvj5ovk0nxEusdDSomryJqec/gtfxPUY43vgNuQg+qegOedCjhszkNwt/C7xrQe7B57FfpfeFUJ7qjWPZL7+nNvTXJK/hEvNNs3JgKBJHO+7Uwv6KxxxwEMSO7cgvM2NQhW/G5Euw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgJGTH2Manqdb6l7SF0s2oZsQViWSq0iBsx9NKel4Tg=;
 b=HCKXPGVc44FtwvzOci/I/NsiO3+JfpLJr2nyrtNGassqtZk8o8yptd8VK6VklvcSj+HkUdYpZqD+BHYC39RL91qepUB7ec/bc8bDuUvVuGtR/QO7VvJmfY+orvvkOp9O/arvrUWc+n5MmqqEv2DbQFRi7RC6swuvZrW61tj8kkURx7BSQ7EMj8gLusrNsEmtakDKIYubp/VpylIM22lqJHTIOaCl5BobsI80OEiPMIZWw/JmY59N+KaaF/ZAQOteqIdr7Z/TKfBso9MpPVKD96H0vot4l8hyUgndeD4HzqP4s1ib3wtwkOJOhMoAgSn9AtosOd1F3KieYEwM4CCOsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA4PR08MB6111.eurprd08.prod.outlook.com (2603:10a6:102:e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Mon, 27 Jul
 2026 17:42:40 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:42:40 +0000
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
Subject: [PATCH v8 28/35] dt-bindings: pinctrl: airoha: an7583: add pon_alt pin group
Date: Mon, 27 Jul 2026 20:41:34 +0300
Message-ID: <20260727174141.664933-29-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PA4PR08MB6111:EE_
X-MS-Office365-Filtering-Correlation-Id: 817bf2e0-fea8-4890-18ec-08deec067473
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|52116014|366016|11063799006|10067099003|56012099006|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info: NInFbsJR15QeB/fQHYO2tU48KQK0nFfCAVKJ97PahaNPn2v6T6yenaMc4C51mQBkBjrZ7mU+QBQviSVIIXhj3YWDeSPBHeUUrJoOEMzrzTHhYddQD6eaVRzJLladsz+tIdwr2i3PshW9m0hkPJoYvvDG+A09/04vhXhfksyd0QG8C09+Opf/2RJA0LhSuYYhh5KdWL27QSXqjWJpR0zc4xRipZCsN63/tn6bT7e9E4dtcQ/xPTxWZPGimhyltlYel5F//WyD3dvat8J4A3uZ4QS+vPemJHdCLAtLBtxd6tboKsYaE1ESBzoFUPe/DUAuP67fZjyNcykuz4Q9Y70x6OV7WLaQnUvfpyWDy2usn49gIEanplcijJqKDk55TLKq9D4AUcqa0IlARFkCPWU6KsKI0pq2brAlqINa7wPZRQdzz5n5+UMNojNdyjkqOmBRklKDs5ArzRd002VRRPfH7yyFa/51Qwf9qSLlgQsIYI2lpU/AX1Hm0keKDXB1WnyIl0PLYfcT8nZOKLZe/o4z3jnLAfEbrFmnDTzI50BcPgPMxxX61AFUclATDBGsIADkTHXnjEwSwZDyvvpY8Q/5jVj9ka43N2tVR6YS2hE+wNMH+apW6ZgZbvNAmRJEb6+610eH+tpY80PvCun3g+zMii42awystkj0wvD21OLD/wpQyWesfwQ+MrhkZrGO0oNpSyI3xijabBTu6OEsHMFIyVK1iR7lQNcabiL3otn+abC8scqKTbDYoiSBE7AV3vd3
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(52116014)(366016)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TS7M21UbTbGgGZtLGRTfNLafsX/hu9aNNEBFJCAYqj/JrtMzcYbx/B8fO4pM?=
 =?us-ascii?Q?2uALceB+cc+rLulNj8crz48AVQ30YcqjxJkydPq5Er+SRp9FOfJjFvrIq251?=
 =?us-ascii?Q?56INxQ1bjb5aHrOGW3rEU1H21TzPwD8Yfch5qM8oHgt8v5mdXJiX/+UAUQY6?=
 =?us-ascii?Q?nUa78c3MUF/6eaprnyxfEmtCq5u7zbYqJKyHz3Vn77ENny/ZiY3/q1zjbJFb?=
 =?us-ascii?Q?7rHEu77DcDMCh8UsVSE3IBkMCSkNqAI+p4OI7EEiK7cVjlydow6daVqci2N0?=
 =?us-ascii?Q?ZN1a00YKOdaK+7MWM6RU11YrtTIuA0AFD3HULzmMGUdfdsmrNuSyyiRW6a+u?=
 =?us-ascii?Q?QuTiDEiyw1l3TB2A/0Appp0fxIFdl3sHifywD7cNUTSpNC2iHzYHiP7KlbqR?=
 =?us-ascii?Q?Uit8c47WrA5gklpE3i4BVVJv2DzmeFUS3Fs9PXKEZnoIej4g+EF55by8e0k0?=
 =?us-ascii?Q?pFv6cUicPU0NdjuwyTx73Rt2ibN5NSHR7SML2DHZPsGTcK8c+NMEdp4GscbF?=
 =?us-ascii?Q?0k8iY90UlNTkxJqKih/3aTTwb50qZ0/nmlf0Qse49OGfMZnxvbDCOHTXHPjp?=
 =?us-ascii?Q?XL8RjxHlXYrZORj0tDrXgBSHA9lnDjA2wJFquyrRm2/E44NEBS7HG5WskFIu?=
 =?us-ascii?Q?CKYw1scgNFhX7RnWkH638H8H241PQ8UOphuF1uDccz2xqEETWjyeesSFfG6t?=
 =?us-ascii?Q?mDwvcQelVQjBlbJKmUAswWY1goDusYsR8iOtW6+311ka8rmsCEJOg00CGVoz?=
 =?us-ascii?Q?IQjH1o6PZYPnmWawars1qUDCQY4hOQ7QPreTAL/PHBY9qrAHVfmibZ1incgi?=
 =?us-ascii?Q?mbIWbDxHBwr+YJjp4+YTjkDXgnXg1OOi8iH78xHy3qcsJ+KyaQJggGR/oxSj?=
 =?us-ascii?Q?jYRTM3A0ZLg+sYXT4K1WyEjHz3q99fYsTI0QQliOEHv7BsIW6UHdr0tvB7oV?=
 =?us-ascii?Q?ZZl5gbLaqmAq8iJ4GYKeI5Ff2wYXBb2kOG3THYsjnnQZs62Ca0WfYptOCPj/?=
 =?us-ascii?Q?/mNDm0U7KLIN2uSDfkGFzzmR+mfs2jKK4OgUf+ZGf4oHT9DLnntXQiWdrFIB?=
 =?us-ascii?Q?qN+ret1ZxXrY3BPqtlRiiEK8fa8o7gAfdVtzFufDrIiIv5in6Lwd0dL1d2Jq?=
 =?us-ascii?Q?zCWsCR8DXS/wpP6LiNaJ70u0nGxXZ1r7wQKMCSSNqBgNQvuPdkIjH6MAVh6e?=
 =?us-ascii?Q?COYkifvdkT3fna4FTAz0tPgDN9/nLzQ3JVpteR2XkjlyGuDZlndyox8Hc7Pp?=
 =?us-ascii?Q?XcGDrHD0a75yw1TN2nzL4p3XAxaIpJfbNOj3gjTEiNxtwF2MAf7+4SAS4soA?=
 =?us-ascii?Q?luTDS7/2dhueWT3ku2YLJdAMhXJFTXvU0EnSDvjXjPmXFiPQUMXlz9E5a0Us?=
 =?us-ascii?Q?OgsYGWGSEQzgSD53tw3YKXn6rgTy4wkk/NCGxUyXDc418ziNXsDCA70h9f8w?=
 =?us-ascii?Q?t02FP+/9sjddyFT4OEFMZhxtnoP0nf3ksKr1YgRS9DcQJDb/SQMUyYTUODc7?=
 =?us-ascii?Q?tjmVjnyXWzFNTbKGMX/k4igQvLxr0uN4ZmT2EU9UTcCOmwRLaPjZXJpB3TNO?=
 =?us-ascii?Q?165JxeeuazpDZJGgSw2qUoKwlupQTL9RKbjuAJxVkZ7rkpewT0tRQGbVv4JL?=
 =?us-ascii?Q?40S26a/xPSDquQBXb8ePLPEYE/9hKfT/FOsa832X7tm0GoPP78UqQPGEQaYZ?=
 =?us-ascii?Q?DtbfVVwXai6XyDe7WIaCtb8dYfTdWSy519AdHrwd2bkZhdv3RJYQ6yXl4gy2?=
 =?us-ascii?Q?maCOCTptoVhS2D1YQzQm7iWAlblin74=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 817bf2e0-fea8-4890-18ec-08deec067473
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:42:40.2687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZDxlNduUUF1V8yKds/GOSmlXSjvaOpRe81k3xRW0K+eOr0tiOgS6RvoC0l3LYTQffgI9GsJh6lVZCTXyg8YMwBzjhzR2fQWkBLUwNpg5GlM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_104245_283958_C6AA89BC 
X-CRM114-Status: UNSURE (   9.34  )
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

Add pon_alt pin-group support for an7583 pin controller.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
index 0a217429b2cb7..7deb48db52c3a 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
@@ -81,7 +81,7 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [pon]
+                  enum: [pon, pon_alt]
           - if:
               properties:
                 function:
-- 
2.53.0


