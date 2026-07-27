Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848D4C531D0
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 17:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nRzbrUma1V+4pJ6PcxpTr773PZbRSQg0GZEx4bNNvFM=; b=agzHoBxPjK7g070Y8Izw6/vbl2
	BBl3vyc+leB7rlgE7FxElYTN+tNPo04k8vTHTFpmHVTup2Q8fvwK8cyXDqWPfFHrbapLXKK0AZhbx
	Hoy0K7MiFg0KXZFwRWCCiz6VTghAA+0+n8gujalj/iO5y6sCm+t/4z6plsHE/i7Xrkj4WdaddCXeU
	udjRtjNypEJgz3tKATw6HkFKpR9jGQhk5GtOFaOwY7uoNWGLO6YC7t4ZMet2omqbcpr4kPNF9E83J
	d2GC3ZKSjs33TWMufUNGjKC+h5gSfOEJKf0aR9sxkOQWvEMkJv+WIQFNXaVEq9XaMXYu7bN03aiDm
	jc9MIG/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woPMO-00000003ZDf-2O9z;
	Mon, 27 Jul 2026 17:43:28 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woPMK-00000003Z4W-4Az0
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 17:43:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wSSDONkOPxO7s7SFj3NQHKpw/E1di0wuHzyksddGUeQ0vfHoa5ZE/LQ0lrWOpAhITKK6AGAfu5xQ56KEOnM0pLzxx3/IyMwXeiCA2TRpJilcvXs3t0vjlbwvfnMPDbirHkTwzrSAbHid0nf03c3fo0FZBsdYiur19Huoy545LjPb79QnuSK/1EGJg+8EAX37TNGuP5ypGki678CtnDrB/umSyKib6f0tjXZJQB+KqiCQACZQcnyaFqayISyYuEdta6sEtjxq5EjFi4EOTahdZ8h4gMmO1rocpc3EcvGycsa34syYMbYOdH6Ox06n5N7rcNBH2oTUWE5rrucVel2/BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nRzbrUma1V+4pJ6PcxpTr773PZbRSQg0GZEx4bNNvFM=;
 b=fg2FBghwthOzzVBCCa1L5Kjqt/TpuzRUp47CV8hp3Xc41Jekune3ZoIPoHd3uoooGXjp57p9qEtgDoY4NOJ+w4TRCvUn9qyinC5phKBGe/Vw0ToGn0JTbhgt9SL2kEex4sTK9UKfEjOXHyxMk9uWjQLVVn+YI7ca2KAOttB5ezJxangJYZHxv5aFt8Aw3jV6CAD7ciYSid104RgUl721nVVQQzlyAnUFNlIO1Tj3eW9qVHBvyIOXZUMaVUn1E1gCweN7WM6u8a9gmKQeqYXE6nDNFvX/FBJXiPZkLOUSY5qKIwhn6xWB6QEdbK1XPZ7K0gr67teKguuJuGQsszJIsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nRzbrUma1V+4pJ6PcxpTr773PZbRSQg0GZEx4bNNvFM=;
 b=5G5UZJDCUpF6mSWuqfrpNma5DIVqfBFwVQmcWBZzbCwxUt7TcgRKVSWhIMaFarAW/outTDOOERGemgAEChgyVxnDAoR19v6Cx4TTw3BaQWxkfZixMrCqAx4YhqAcx/gul2ANsmi58Zm0fS1JWx1pOgCh9TtGBoPJ5C8p6h89yRaiW34CCy2YWlbznA/mgc2jibbBSnvE8P5K3brxgB+FxNcWWk9w58bV9JZNTM9nfaNaNw0TLtvM8cX7wJqF+U1i5sLfeYX4vk/5PUh4TxYfdJ8xj7af3oq8eHG2js36JWbZHgfxk/9qw7k/u9ERhjQBErq12P+DMLtZbRt6ar5UMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA4PR08MB6111.eurprd08.prod.outlook.com (2603:10a6:102:e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Mon, 27 Jul
 2026 17:43:14 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:43:14 +0000
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
Subject: [PATCH v8 33/35] dt-bindings: pinctrl: airoha: add support of en7523 pin controller
Date: Mon, 27 Jul 2026 20:41:39 +0300
Message-ID: <20260727174141.664933-34-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: e5127732-e394-4762-35fe-08deec067962
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|52116014|366016|11063799006|10067099003|56012099006|6133799003|3023799007|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 4o1ddheHne37IA5y+65ws6B9G7PQMbQY5Fk5lk18OkNsll/oW/eeJDiIdBZXiFrzjizTqS7Is85xvHNLP4DwaGu6AyS7+Y7wehLlBV1RfF5mUmomhgJMEXLxCGwRQ8PahV2xeQFZ9VIra6QvX0MXmd1+Wko1J8KElRgTSWW6ocSUG8bcDeS61wF37ppGjoe3vpyxGC1DQsn6AhqPahS0xGm5B9rXZf8Con4MJn5VZffd3NwwP3muFg95TJdruzme9u4dCuYRHxfzs5bpeHujQLCyC2kbfC1/3rt0FPRdrJZS+6LZnenqtOA4WUy+9T38fiKpLWjpAWJ+i613iOChBumc6tf8i9fpmdtu5+QVNVU5x+8JNmzlJu8Ll385Piu3ldres4fDj5aCNsLnCMfXc/f3STpovzq611GLmHEBWg/DOr7rcIBYLbYM8JzVkd0GziwXqvKtS554agsCq1frJTMWw19ffWj8RP92pkzPGTE27pp7MkjjD2Nvf8RZMYM372sAgO5Q0kEY8L8JCl87An+d7VAUyxpa//2XZ21ut+Vj+lo5NyAJ0pcqlAyHht8Rt+eCLBE9dM8RjCdcnfIruUyelNQw5HExL2/ex+eXMUF0O1ZC2cZJmKXMbz60DFP6YhsFgMnBnvtxkii8Sk1m7B/1VDWOr3sMiPrvVF/D6WTgMGJgPO7oYngfeXUrs5So
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(52116014)(366016)(11063799006)(10067099003)(56012099006)(6133799003)(3023799007)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zSOG/ZZGdjoj9kzvAo8taET/cztDqFX6QgtKRmH1+LbSvUlDwSPw61yhmJ4A?=
 =?us-ascii?Q?4+vBuZthIkAoe1/OWMMThZzbtTxqqcu0LUGNxhU4J+0L6M8EHV9T+mZxCkKu?=
 =?us-ascii?Q?mwZYDwX0mo2dO7nHzY9P0j6vbUN54I7NlDQbnquBik4xZDI1w403whGaEfhh?=
 =?us-ascii?Q?SFOZNpUBzoaKsvlcM4ZRawypoEPR52Y8FHfOII4+FnqJfxUiZJ0ZO0ykNndT?=
 =?us-ascii?Q?XdM8I8qVC+PJzFhLmQ8TEABlaEALay9do1iBqogtZ3lyLLcvMV2ftRgEAlVB?=
 =?us-ascii?Q?nfIWpk7JIHpyeJ/J0LRGyeBoYiqc38qQzYQwLVf+x2rLniJ5/7ezJsGNg5HU?=
 =?us-ascii?Q?xuUC/WQgNPtxIvWG65808iGmminOdC+Twhf9rnddCFdhJgtwZ6nSyM51hSfW?=
 =?us-ascii?Q?O1pcsYQyNp1nd9UuQe25fqdy0rX+LgEJcb9A0ri6ICza8rNziENUkjPhFtaD?=
 =?us-ascii?Q?7MoXhdPieAlZb5ytM2QRLmvpEPh4cDrl1zny7B/3Vmd5cliLRi8ZfgsNXI/y?=
 =?us-ascii?Q?B8l9XUeU2GJeuLAy3VaSME/YMwEvXZCykndrzJsiqetR9ihEHTSsd0HpDEql?=
 =?us-ascii?Q?9CfUSF7f5YkoP16ycpkgNQVPz75Oc51c/wxYr5xRq06NjZMlowfKpV5gbxaE?=
 =?us-ascii?Q?fUysZwe/u9wQkyFKsb2VsEG1I9Rf+m8bjEZxJJNlPD9pzY1xCZ2YGDhzP7+k?=
 =?us-ascii?Q?to2rWRdTZnD0VDpMBcSD+B/GD3GbCAcsO2c7Jl6V++lPcLrpolgnsjdFSs0t?=
 =?us-ascii?Q?rCXHZDAWRB6a4uFNfps0eCCN91CWgoL8L0DOapVLh/uEbfMuztVBJky62OIB?=
 =?us-ascii?Q?FuQ1onuoMrZDMUAjr9ynhTwj7YWdsErJYtc2g64lZYCxHI0VYYBGVRepPePU?=
 =?us-ascii?Q?Wa4HRDmrSDMSgOkh2lznnbuOgYpuk39sdfawQYu7jYmnxwNm1f4dlDpHnBWr?=
 =?us-ascii?Q?NrkY89IUqWzh8mmpYsUHBxotT4l4dLlO1yaosdrj8MrDbpmNdyc+NSSGshGB?=
 =?us-ascii?Q?q8aXfGnLMEaP22yhLROOdwak4INvL9CpO1WNAStD2/AXJiLTEMY0xO7M8Ar9?=
 =?us-ascii?Q?+0JVDlkOpgBEV+ZL3X2ruIu66/zeT4bcRlZvx28iHQtZj22LgXj12iU1NGZY?=
 =?us-ascii?Q?bFQEoQQkSxUOSz3JPSiHSrMRiob+wHcVzt1/tuvl058CJ2YbBFeC75nfUzFT?=
 =?us-ascii?Q?bmf5sbqR7JaZUzhflOoqMGKCO6Qv8sQlWISaIG4BZxD3RnO2ZZKXq1GeSWnu?=
 =?us-ascii?Q?Ssr0Rv8aiyACr4wFEGdn3TLw0cMiwij8DZSgZ1e9ec+Iw+zJ/kadTJDzXk+B?=
 =?us-ascii?Q?4fyI+Ex5IrwNB0IKcFIPbwm4eFBGoEiE9eZR3qQJTzQ2ETumeADmqZpcDqt5?=
 =?us-ascii?Q?GZJ9mx39P11C/wZaKGWd/dwEsV6/Nh1Dt5CqatqUtRIUBYmK58LAehEbipEl?=
 =?us-ascii?Q?gurVPPYpyweaXP6nEu1h5ebYaIWRWB3wrAUgcvXe5GtzPKZV4ZUfwQUNah0i?=
 =?us-ascii?Q?wyQvKXF/Zosspprtq5+Yejk/5GQQl1sFL/p4axUBESApeaY+52WApQgwcMTS?=
 =?us-ascii?Q?SJzgF4NzGYL+2hb/c88E4lsRn5OMZi6mV2Hia3mdvZD+z6761VCX1ycjN2CU?=
 =?us-ascii?Q?lUh6gQmumbCsw/zwnCBhz2nX2zK+4rLpzoxSt1GKNGrIE84dWhHjZLQiR6Pi?=
 =?us-ascii?Q?80Cs1480mxHK065Lx3BVxGCH5jq9Dc9cpH+8Wsnp/xXmt7b7QECdoth9FWiX?=
 =?us-ascii?Q?a5NavlbUooJeJcZRlApdNdY2VU8MRLE=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: e5127732-e394-4762-35fe-08deec067962
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:42:48.4847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2M325JJtt6SydQ1djrTezL1e170Ma/OK7MHO5vyrjM9VHBDzHkapdbGOysZ2JVPi3G+YJORw0W5XIQhh4Vimet9kOA28k9f9JYPyT5tpeF0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_104325_041135_05A252CB 
X-CRM114-Status: GOOD (  11.19  )
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

This patch adds device tree binding schema for Airoha EN7523 SoC pin
controller.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../pinctrl/airoha,en7523-pinctrl.yaml        | 375 ++++++++++++++++++
 1 file changed, 375 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml
new file mode 100644
index 0000000000000..db8e39af1a152
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml
@@ -0,0 +1,375 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/airoha,en7523-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha EN7523 Pin Controller
+
+maintainers:
+  - Lorenzo Bianconi <lorenzo@kernel.org>
+
+description:
+  The Airoha's EN7523 Pin controller is used to control SoC pins.
+
+properties:
+  compatible:
+    const: airoha,en7523-pinctrl
+
+  interrupts:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+required:
+  - compatible
+  - interrupts
+  - gpio-controller
+  - "#gpio-cells"
+  - interrupt-controller
+  - "#interrupt-cells"
+
+patternProperties:
+  '-pins$':
+    type: object
+
+    patternProperties:
+      '^mux(-|$)':
+        type: object
+
+        description:
+          pinmux configuration nodes.
+
+        $ref: /schemas/pinctrl/pinmux-node.yaml
+
+        properties:
+          function:
+            description:
+              A string containing the name of the function to mux to the group.
+            enum: [pon, tod_1pps, sipo, mdio, uart, i2c, jtag, pcm, spi,
+                   pcm_spi, i2s, gpio, pcie_reset, pwm, phy1_led0,
+                   phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_led1,
+                   phy3_led1, phy4_led1]
+
+          groups:
+            description:
+              An array of strings. Each string contains the name of a group.
+
+        required:
+          - function
+          - groups
+
+        allOf:
+          - if:
+              properties:
+                function:
+                  const: pon
+            then:
+              properties:
+                groups:
+                  enum: [pon]
+          - if:
+              properties:
+                function:
+                  const: tod_1pps
+            then:
+              properties:
+                groups:
+                  enum: [pon_tod_1pps, gsw_tod_1pps]
+          - if:
+              properties:
+                function:
+                  const: sipo
+            then:
+              properties:
+                groups:
+                  enum: [sipo, sipo_rclk]
+          - if:
+              properties:
+                function:
+                  const: mdio
+            then:
+              properties:
+                groups:
+                  enum: [mdio]
+          - if:
+              properties:
+                function:
+                  const: uart
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [uart2, npu_uart]
+                  maxItems: 2
+          - if:
+              properties:
+                function:
+                  const: i2c
+            then:
+              properties:
+                groups:
+                  enum: [i2c1]
+          - if:
+              properties:
+                function:
+                  const: jtag
+            then:
+              properties:
+                groups:
+                  enum: [jtag_udi, jtag_dfd]
+          - if:
+              properties:
+                function:
+                  const: pcm
+            then:
+              properties:
+                groups:
+                  enum: [pcm1, pcm2]
+          - if:
+              properties:
+                function:
+                  const: spi
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [spi_quad, spi_cs1]
+                  maxItems: 2
+          - if:
+              properties:
+                function:
+                  const: pcm_spi
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [pcm_spi, pcm_spi_int, pcm_spi_rst, pcm_spi_cs1,
+                           pcm_spi_cs2_p156, pcm_spi_cs2_p128, pcm_spi_cs3,
+                           pcm_spi_cs4]
+                  maxItems: 7
+          - if:
+              properties:
+                function:
+                  const: i2s
+            then:
+              properties:
+                groups:
+                  enum: [i2s]
+          - if:
+              properties:
+                function:
+                  const: gpio
+            then:
+              properties:
+                groups:
+                  enum: [gpio28, gpio29]
+          - if:
+              properties:
+                function:
+                  const: pcie_reset
+            then:
+              properties:
+                groups:
+                  enum: [pcie_reset0, pcie_reset1]
+          - if:
+              properties:
+                function:
+                  const: pwm
+            then:
+              properties:
+                groups:
+                  enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6,
+                         gpio7, gpio8, gpio9, gpio10, gpio11, gpio12, gpio13,
+                         gpio14, gpio15, gpio16, gpio17, gpio18, gpio19,
+                         gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
+                         gpio26, gpio27, gpio28, gpio29]
+          - if:
+              properties:
+                function:
+                  const: phy1_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio22, gpio23, gpio24, gpio25]
+          - if:
+              properties:
+                function:
+                  const: phy2_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio22, gpio23, gpio24, gpio25]
+          - if:
+              properties:
+                function:
+                  const: phy3_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio22, gpio23, gpio24, gpio25]
+          - if:
+              properties:
+                function:
+                  const: phy4_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio22, gpio23, gpio24, gpio25]
+          - if:
+              properties:
+                function:
+                  const: phy1_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio7, gpio6, gpio5, gpio4]
+          - if:
+              properties:
+                function:
+                  const: phy2_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio7, gpio6, gpio5, gpio4]
+          - if:
+              properties:
+                function:
+                  const: phy3_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio7, gpio6, gpio5, gpio4]
+          - if:
+              properties:
+                function:
+                  const: phy4_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio7, gpio6, gpio5, gpio4]
+
+        additionalProperties: false
+
+      '^conf(-|$)':
+        type: object
+
+        description:
+          pinconf configuration nodes.
+
+        $ref: /schemas/pinctrl/pincfg-node.yaml
+
+        properties:
+          pins:
+            description:
+              An array of strings. Each string contains the name of a pin.
+            items:
+              enum: [i2c_sda, i2c_scl, spi_cs0, spi_clk, spi_mosi, spi_miso,
+                     uart1_txd, uart1_rxd, gpio0, gpio1, gpio2, gpio3, gpio4,
+                     gpio5, gpio6, gpio7, gpio8, gpio9, gpio10, gpio11, gpio12,
+                     gpio13, gpio14, gpio15, gpio16, gpio17, gpio18, gpio19,
+                     gpio20, gpio21, gpio22, gpio23, gpio24, gpio25, gpio26,
+                     gpio27, pcie_reset0, pcie_reset1]
+            minItems: 1
+            maxItems: 38
+
+          bias-disable: true
+
+          bias-pull-up: true
+
+          bias-pull-down: true
+
+          input-enable: true
+
+          output-enable: true
+
+          output-low: true
+
+          output-high: true
+
+          drive-open-drain: true
+
+          drive-strength:
+            description:
+              Selects the drive strength for MIO pins, in mA.
+            enum: [2, 4, 6, 8]
+
+        required:
+          - pins
+
+        additionalProperties: false
+
+    additionalProperties: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pinctrl {
+      compatible = "airoha,en7523-pinctrl";
+
+      interrupt-parent = <&gic>;
+      interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+
+      gpio-controller;
+      #gpio-cells = <2>;
+
+      interrupt-controller;
+      #interrupt-cells = <2>;
+
+      pcie1-rst-pins {
+        conf {
+          pins = "pcie_reset1";
+          drive-open-drain = <1>;
+        };
+      };
+
+      pwm-pins {
+        mux {
+          function = "pwm";
+          groups = "gpio18";
+        };
+      };
+
+      spi-pins {
+        mux {
+          function = "spi";
+          groups = "spi_quad", "spi_cs1";
+        };
+      };
+
+      uart2-pins {
+        mux {
+          function = "uart";
+          groups = "uart2";
+        };
+      };
+
+      mdio-pins {
+        mux {
+          function = "mdio";
+          groups = "mdio";
+        };
+
+        conf {
+          pins = "gpio2";
+          output-enable;
+        };
+      };
+    };
-- 
2.53.0


