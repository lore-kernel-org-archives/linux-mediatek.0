Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE41C55ABA
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2026 12:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pTv1/c/ULkVccQ7rasbwg2F2bj9G7I/irTLLjkewmT0=; b=zo6+sce3HT0i/tgUb5Y6oNmMux
	5XxLr68rR5z83xYrISdr8+ZpHA/OmHBtWGi1cAGYFinR0BT1kJaUyenrvmicOMQNxLiBGm1pYAFWx
	kAl8Qfv+iCG4gJNMXuirgBCw1JugBT3NRKJDxQ3ATCA1mkzNxnSYFe0mOh2PZ7e9RODnAxyDDwi+0
	024KDK72VAisvypNrug25UjimYFLkblVK0snu0uosOeVaXN5XDRsr/Sgz/8rOdN+6KOi1EZKbJw/D
	raoDZGGgPr/FdyLJB8w/f65BjwwxHAH5+W2I+7bFiI4Nd68lpBN01MWz/jetVYD1uXBlmzFcwKgnu
	z/7huNpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrapM-00000003udF-071c;
	Wed, 05 Aug 2026 12:34:32 +0000
Received: from mail-westeuropeazon11020088.outbound.protection.outlook.com ([52.101.69.88] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrapK-00000003ucP-25vw
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Aug 2026 12:34:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C25ADx63VDHICmxmOdhfaZ9X3zLzL6R4jeAiHpQBuxnGP/6/vaoobFrYimlaZp7V76+rKm0sKUkhAWW2fKRt/xJ+aj1nAcgSKILePGfvHD24LsVHcWRd7XeqI9k1Xv2ULtEtuYcv3SH3E3BggO/dxZCsoJ7Ql+Jz3Cx6dDpch2eVQtnNspwwnjdbS/lV42WdTJqe0au2pQizPHl+KxiuC+n9yi8wqwqHXAvY8R6oVvPnNhz8V0u5bZ2qzDbHRLL9lYMtFi1YN1NKAH9oHmkcxXUpCET5rpzKyus8tjOdkVXXljMuGmzZgyrROcP2j9J26Rhku8lydtz+JW3BoVfmOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pTv1/c/ULkVccQ7rasbwg2F2bj9G7I/irTLLjkewmT0=;
 b=AhOMwezlxKrz9t2x9VyqIvTXJ3xylF5DDRlK1d61sBx88eZjYWUCH6aJGFJaDQMBC0T70ElsHpgrrcItdaC09WIlp0S7GckBuX3V2y8qU1tBhAnlZrECl0rgZKY6UHoDb0T3WlRCQDRdVazf6piiXb81ZPGafdOmYny+xM36duOWSlZNQ1ZQQJ12LGdc0LzzgMEhvk8C0Fl/F/XG0vNW/tEuM8i8vBY2S82DbYogdl+J04ITx/BpWh4ab76ON+6XsO6WIBbalXrlhICOvrgt05IxCo7aT7IMS+zerNU/FyPOZU2ZYhraIddw2IfU+tl3a9eEKxLZcVTc2gPLSD3fVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pTv1/c/ULkVccQ7rasbwg2F2bj9G7I/irTLLjkewmT0=;
 b=wXxd6EFbdgreuvFni/RRtuthWZ1yolt94T/gqySJRzPRp3zT0aTDWCDdcLIdiHaZPs0M8V5UG2t3likDh0YumJ0diCs/1X2FPbOT1SjvqNoyjKpJIkFYrRpcq0yXhutNHQKh2L/Ne3Zva/GSDTzrpHCAYSWGgB0brat8rJrRGKE9GOauHqQ6DH/53VzGOEDCahzk/0BwapXbQ4HTLBQ++tOQIgI5PW6CSsayBZ2iJSmfzjoaN4beX6qvxWXYuW0qNrceErE2r1vo0RR7n7aq31Y7IhemKWcbB8RxCohZrFM6tRyumlDMSjmecrZb5JDdBxuzRQWCaIBRtPxKvn2TRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA6PR08MB10830.eurprd08.prod.outlook.com (2603:10a6:102:3d3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 12:34:23 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 12:34:23 +0000
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
Subject: [PATCH v10 01/36] dt-bindings: pinctrl: airoha: en7581: fix misprint in i2s function name
Date: Wed,  5 Aug 2026 15:33:33 +0300
Message-ID: <20260805123408.3767648-2-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PA6PR08MB10830:EE_
X-MS-Office365-Filtering-Correlation-Id: 1328675c-9a3f-49d1-cc59-08def2ede132
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|7416014|366016|921020|38350700014|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Qb9qamvBP0+a6OlkGLr2m0GKVNbflA8+KWWMh6xxICpgOFhak/mm9H+XafhhQUL26LA59RdJqFgmaG10bKauCQgiJIOxa9rqo9iZrvaJBatINdCuoT3tO0nFS+dqTdCYcN2X2NSlu1e8fWlWEUDESeOqHsvEMrQrjuwywDbKj6TeK1dOa8yLhMqbE6hB4sISrs+3k8BEoIaqs1tVSmiLP/sc5T/SoeZ5qMiOOSfTIHz4hRLK6BrL2h8IHFCljPlUQtAF3f3cDGwj/IBdij/3VvFX/CqOklOp1nfNQ10YgkX+BoQ4IM4n1BaiGJTU8rTxsYGwn2Y0zmwYEAbE+rOHRKgbt22XwhB1TTlO1Ix0iukAezcV+y6YeKVHRQ+77D1upS+eVMbh1996Qy5GUTPs0OdkdM9ElybaA/70rmv3iSQElKp68g4OAXl2c54yroDW5+LJkBzvapiumk9HhsjH0D1KHKihup8oyK2FyNMp+GQtos11ihoB5ho/wWp5ctV3MjE17H8+97fGr929UxhBIrTGZN/O/MjpAYmMt+UrgaexdBWXp9S0uK1CIxA3t3Tp7fXgpJAqsFlZFGGjdlMZnGDZSEaSe8UVYHGoTmtXR9GTN7ovsPGYbwmU71IG4ffoKYVy/G717HEDjUPdmCWDPeNvq26nvf8fyXfsvyL4mz/LhF9bJwXvfwOlEmE20JsJXfoWiwVwEOckvDWUCNv1yF9+MnVF/STXVtUVRVE0MqkWzKSRtQA9ijx6mIPO8Qzf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(7416014)(366016)(921020)(38350700014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jjvv/7h0rXSHDAdERzaxjGUVgXr2C8wLw/wegDjgPWiADeUIHCPRy7tOs6+w?=
 =?us-ascii?Q?XVUFWL9xveTy37hL52y4wqaPmf73HaDj6Y69Ssp5V8RiTsU/wVfY+a5D9JkF?=
 =?us-ascii?Q?J/hXwBV4VAKgpZS/+Nv5NtrUCG68BPIOcAVcsg++sUocOC7C79kg3Pwmxm8S?=
 =?us-ascii?Q?ne6/NX+WUdx3Q3EolmcJEjlScwUWTszw1aXKhLAVXUegzAwb6dNfoPqXpR4Y?=
 =?us-ascii?Q?+kdHNIW8abn8eHWt/AN81LN1bEJaCd6FlI0ahobVJL8elADqe9lnHa44u0qv?=
 =?us-ascii?Q?WsPqR+4T04xCQqH9M3S3EZg/hLwDKGufTb9n4SXxK9GKWmiksMZrsN7ubLpt?=
 =?us-ascii?Q?dBj0njEpEJvpR4yjq2mtrwWzuWIxl6JhssYqyC+DXw+2mFqjGaHz6d8pi9Jm?=
 =?us-ascii?Q?Xh3g7SQ1CevwUPAdCljsk0vFZJ7lZFmLtKehrrIBLiJCAiT5l+K92OKQUpvQ?=
 =?us-ascii?Q?YMsDV6/OwmG6+FOJH4lUBaengVY4o/R2t/T/k9cqeiV93wKLMN8Y6HNLRLSw?=
 =?us-ascii?Q?++t1wW5qPkrrYdmzY2JIWZ4GYH3mAirhASoYJKtTLS3mBvf+1JT0LByhI7gn?=
 =?us-ascii?Q?QzRBagVctxo/sqA1+T2bY+XeEW2rzx0hw97geTWmYsGj8sVWBESsSFnnJltb?=
 =?us-ascii?Q?jd/x60QzBSwz66DMX57pmSg5Gl6ZilNHjWqR1LJg2pNtLNUYpvT7gmX9PeVq?=
 =?us-ascii?Q?do9IfSHdYti5MxEQZdkv/xN5XZXfq+QEf8DQkL/6cCDMy90qBb/zCj6ozxuS?=
 =?us-ascii?Q?VTXEsQVOle37+mUc6TZsb7lBG5eF4zqNgBL4YTZkMsSaxky4o/k10kdykGtI?=
 =?us-ascii?Q?F3Dy92NnWZGB1j1jfpBqYBxu3mOrFaQYCZ2n5RSkO9chBdaw1H2ax7nOWTjZ?=
 =?us-ascii?Q?G+ORQFhCJXZSSER+YgAorHA4dzGvCpzNTZDPyojaXb8DP9QkUzCDzzLAqm83?=
 =?us-ascii?Q?ld9tt9dNGBQQi+jTg1ChtzYFT28LnPmA82725gF4a0WfKZCk+89xBCA5XrPv?=
 =?us-ascii?Q?kFDfSjg3sfl3yd8RKyb2k6OBhZY1CVP5NOcBL7LM3k/HqcF08DRifSkb0Viw?=
 =?us-ascii?Q?7hz59eAPCeYu9Zi3v46xwn+aQ1gonHwSMgGt/ub1Gig5/OyikBmKxTctUUKN?=
 =?us-ascii?Q?ZgWVKhol5/XYaY5aJhWZGNTkhN0eEaUkexUOakMH5fZ4eS/Zis41DPXeh5+w?=
 =?us-ascii?Q?Db09CsItC47WXa9ykJCxOT9FVcoQx0dqXcpSb9BTsW1HPPv0TkDBqovbBqro?=
 =?us-ascii?Q?1b/QkOLs8UYVhckNzGxlEBA01QIE0IynATv/IDGZLbuw6sLDc4nvzRnGIF/a?=
 =?us-ascii?Q?0JWtU8U7u/QiGTDbDWVDv5ICtAVl5mlV+DJVuCoxICwZYwNI8BMQ/91hEmMR?=
 =?us-ascii?Q?tUsFxpBZeHgUfqGTp6LnCiMrtL2UlYsXACehb9ckLt7IHi/L1eEi0pcb4l6L?=
 =?us-ascii?Q?+wTpYCGkC3ZXYTQgMQ7x01xuwFc80l21qx2DC4Se4LlKbtH/RHbAIynzDhFo?=
 =?us-ascii?Q?4INf4EK6RXZcEt4tBVzwMrNSx/Z6j73+cbD8EwHiW3SzWzTsC15s2YinkWwL?=
 =?us-ascii?Q?5umbvhytUlpmudE5HRNOYxP4HWfY8bVhqWnUxNmOdKytrqQqMGr+IU9cApFN?=
 =?us-ascii?Q?v3B0LsxgSV8ajVBVEwVR2SMTz2ew+Ln1YsF4ATY6+X8am4fSpTPiU/84caWU?=
 =?us-ascii?Q?tlT8FnS1ntVdVnKT8vTpBg/OSAqHeZi9zg6OFjbZYo3mvjENuqAmjUJEVbkF?=
 =?us-ascii?Q?BpF1aDHXSOH0YUdAmQe2rIeFkqsH16Y=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 1328675c-9a3f-49d1-cc59-08def2ede132
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:34:23.4225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KsohrY0qkGaxiFbrIKKf93HDrOiYH9vv8wAaBYD+z+/gw0Hd0gpfPEmtzZ7cYmOPfWuqsObchPAFAYCUsGX2c1mRtgLNzd2xiNsS6LUT4Sg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10830
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_053430_535737_A6C1AFCD 
X-CRM114-Status: UNSURE (   9.65  )
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

i2s pin-function is missed, instead i2c pin-function defined twice. The
second of them operates with i2s pin-group.

The patch fixes the misprint. It also match actual pinctrl driver.

Fixes: d0c15cb96b74 ("dt-bindings: pinctrl: airoha: Add EN7581 pinctrl")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
index 21fd4f1ba78b0..0c5a7eb6d563e 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
@@ -166,7 +166,7 @@ patternProperties:
           - if:
               properties:
                 function:
-                  const: i2c
+                  const: i2s
             then:
               properties:
                 groups:
-- 
2.53.0


