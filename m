Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA60C55184
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2026 16:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=robBuPXmrJ2qY09qM1jH0W9prIrveTCRQzGFQkGA8rg=; b=4f0FbpApe7LGhTzJfgzdgv+yIt
	v5BL9MyQL7GqZKHJIP4z6UCVQXOQ9w/3pxm3ataxie0dO16ySGV3DIbiBuNwexBLSWGS88Vp9VAQO
	yzUJmXchMcGjiM0Gs/D7pBGgWL7n41/ONNMQo4L5hi7zp4eZq94MthRVJBTIf77nKZGEg8tkFs+U2
	8XwS7iGt9p5luqtGr3mMz/o95U1TKrCVtuutTkpEaaCjYy2OiDN84gzog9do5WKsr7WolKvCSBs3V
	Z7d2ATlE9/ZyB5R3DR3I92Q4HuPvf2+jpsP6T14TJwKGVgETFiYHOwZT62izWLOixYAfUczyk7emK
	ZQ0OsoUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHeI-00000002HCo-3xMo;
	Tue, 04 Aug 2026 16:05:50 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHeF-00000002Gyb-2PCg
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Aug 2026 16:05:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FgEltDAayjvGMySQJVsQy9MkFgACIAidG4eIMekavxbqGSS2gYrnRPfitcvmenG+GtBGUQWbLv+TN20ZXl8bPS2YlF61MqhJNsMfwYxBNZbK52gLzsN0mgy0OVojGU9H9ryQ/PhGEKW1zZmQAKIV7Og1WNByl+n61lPoH2R3i5R4+MMdnccXuXu5Qcx2DfSkj+j0hg+tDEercCQZj86QqosdUiR8q2DXALCQCYve1GY2PadK0BZL6cWYbdXie8ubHC5qpS5HuNQ8KYvRnylwkUlcPYKfWNckKjhkqrgaIhVaBII7QCMVbAg6h70FFS5Ool+Ev7qFC37YN3sYYKdtSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=robBuPXmrJ2qY09qM1jH0W9prIrveTCRQzGFQkGA8rg=;
 b=aLMoFqwFJox2duQq2Px1LLJkpc+T94btM4OC5jeczXdnpWT0H8DL8Qy+cwjmED0CG2187oL7K294/DMCoc9VOB5fPhJLYLDW8laNd+SvkxqXSI4cxg+taxaDmVGFpzIrLiUanNHVOD9+J97nj3RWpm0HevbAiAkrfVvbynOhMnbqDuv50pl4z2mX5SmHCs8AfHYNMsFqG3XaEx/rdEf0GsAmh3PHbufjlytI5mps9JNes3zzgAHeBcWpMNhhzVNdtCv4gtrcmoJIUeBD9gm4Ee2zuvlvUuBlcTsA/6lh6slNZjqJ6HzO9HSCJKSfNWTfmYuKUH+t48LuQo7nzKz5Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=robBuPXmrJ2qY09qM1jH0W9prIrveTCRQzGFQkGA8rg=;
 b=Ys+HGayX42M86eDEDUKuHmnFbme7oIxh9ToussEUFP2G5zbjoqegObWkqtadgqLxGsY+LYMATwHRKsec3NklOJ1LxXPh9hbOSvHrNiK5YOKDPI6zCIQJQvH65/LqoGInF54Fmqj+F4+PyM4g1cc6B/uLz4dPnNC2FeaB5GyiAGE1ZelSwUz6K2CeY/M1pI7GYdP7F+Y60rtmei2YAC53sdXLFjTpnEU7qvzATJpWPARt9PSyZkhpql2mPH4bOd1VC9CUUekGZcIjRHwUHXPfcxNogYWM4t+EGGRyQgD9vEQPWDyT4DMtycpPXwqdQdRBpXueYZ+qj8UvwUnA2EbC5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by GV1PR08MB10792.eurprd08.prod.outlook.com (2603:10a6:150:160::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 16:05:37 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 16:05:37 +0000
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
Subject: [PATCH v9 36/36] dt-bindings: pinctrl: airoha: add support of an7563 pin controller
Date: Tue,  4 Aug 2026 19:04:19 +0300
Message-ID: <20260804160419.3592327-37-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 823534b4-209c-4f6a-8081-08def24238e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|52116014|376014|7416014|1800799024|366016|38350700014|921020|56012099006|11063799006|3023799007|6133799003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: BV8jD1xg/mVZUHUxtUkvAZe8T+xI5MKv+0SfCNUoQZBtTaUy4J3oy1dxQ2C/hpLlpqetVHDvmAYFul6vZjHuf3gASImMzvr+QhuZMQif0Z3QRm1Fx0shxY6+pXBBSQwBeJbpy9I/TLD4H7MxCwKXuJCaAWY+Ulkn/GS7I4cD0rgVu5T7zLkRgXDq6seawBODYRiwkbpjJ4+Hsp9Bijs5AxVO89A/+Ok9VngWNkteJXndON43AM/Qc67g8XlFxUoYmBSBYSX4wFAKwOYKpGOgGfWSnK9muNKbJmzvSyrXYxKojHGGJq3hLT/pQ4Hmsi7fUw+qJTQmLrnpmGQQT1IXsHPPujVmOTJnKmWxkgkgwqseKPwdfzsCndaoG6IFNDDYIGvDjmkP6/lM/7qQsa86Q5/StN+a5FoNKP+s6H/YpV9jp6dTCQ/oO9haWCs7v8UWgWr3i9CM3UudGoOeanNdCu5YXtQUACGBHnUmvkm8840/+11tx0oeu/hCHDAslyisRicMXgOrEa9isq8XRAlRiuo2DBYLMUQ3Xz+9HV5mUF1YAlRGmWvpDl8R/zjiqUOY9bn7hXARc1n9gFQ4fnxJaHCYS/yky9IoZcXMygnz9YY7J6uB6D1BUNb32wWDS1TmSPctNssIF+wCOnGBdmPn03PFsh8VI3YA01K8pdGG9kPpUGWLEfG7RzAyrBq9oQB4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(921020)(56012099006)(11063799006)(3023799007)(6133799003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dMpTD0yzI39TloOYdBP8eqkjhGINZQA0Ws3Kx1OrSZm6CPD/UL/p9n7N3oX2?=
 =?us-ascii?Q?rcWYHKe/D8DAZH9W78+OiIOg/EbXNAfTrLMjwkjNi+OAVCAfmVmzjrBLkM2J?=
 =?us-ascii?Q?vXi58odmOWbt7e3aLIUD6uKRBfBYN2OibwMwUmitfNWOcqfiXI25WR/XLD5t?=
 =?us-ascii?Q?X12UQ/bC08pnlnkLqZfkr04lIEvcNI69PiGJyEpvrnP3XjR1nWWHrTkrCotO?=
 =?us-ascii?Q?m2u/7potjBAnNBLdVgs0bh1sVDGpe32onzkdx3bGK9LGZMqcjQYqTE99ppkk?=
 =?us-ascii?Q?52pPLmbvJDnX+PgaD+pgcV9Fh2ZbhE/r8Bu4FxZUr4MXQioDsz+mMaWThGGo?=
 =?us-ascii?Q?onBgciu+gBEgChhUNVR+PLNWm5qvhzmqCxBon1QH/Z/qfeXU1BktdP5QRNRe?=
 =?us-ascii?Q?VrDagelt7GC0jkjZkkOQSAeQL8Ai8Fz3JFaBVDa9nTUgYCf6RMmiwpevUO2N?=
 =?us-ascii?Q?TVv1jbbCBbbyrSjHctsZKLJhBZv78p8KzeA5M9T6W1xEo8rlzm1NJ/GomMXf?=
 =?us-ascii?Q?vVB6weHhpGP6T9Td1XzyFw4kl9P3dIpMiIiwMlfLeuRBKQJhYdP9YKqo/zCt?=
 =?us-ascii?Q?VkMNfgDKimbqOFHasy4V/jb4vjrePGIhMR7iB7V6WuWhXm7C1mB5qhOqXo2v?=
 =?us-ascii?Q?hp64B6LkiPJbRs9AUBI7ddP77RObaXmSNuu6UhTTFmvz+GACNIH53sQWp6FA?=
 =?us-ascii?Q?2x8I4og9KBy+qKBPTzx68Jppq1uXxhpJIScfUC2F3Hf11mkwBMSz0xfKh95K?=
 =?us-ascii?Q?U1SOGjuOyZxaNxZLlNnHFryLVPuV9KEW/frJVwQ6kfy/+eSd/Yyg3NRQ81l5?=
 =?us-ascii?Q?Ok41ioRSJI959Xft/zIL0UPgHvsfNDAk0vZqLZWjmgItbMklq4cHRZh4MwWg?=
 =?us-ascii?Q?Md/6/eCjTH52CRjn+g3rz6EsKt3nyNWwdVtaboOeXKg3dTRfvcn7sjMeJMYb?=
 =?us-ascii?Q?MvTI42ssiOc7iI9QmUBkTZfeZwG64OKmezj3EggLnWhkJA+ZoyCoXD/P8whn?=
 =?us-ascii?Q?KP9aYLc8S7mHLWmZfV5FYrIbMJJVy4p3sgy/7/py5hc6NNDOfBfLVFVLJz5Z?=
 =?us-ascii?Q?rlxs1MCPiyPD5VSPf6KJi/+6qjPlzDv4arlm5dkQ2yDxIIPfH4fCdiBuLGOM?=
 =?us-ascii?Q?m9micAvmGExJE9f/EtN/5GvPkTbErcJmDixK7IwOOTxRDcnG9pmCFqGAPEoG?=
 =?us-ascii?Q?rz0wnWXB/eoGZS3o/aBWkznB1MXdnaoqnXYAEiTTDkGwte9fEtUAVDzw5BAv?=
 =?us-ascii?Q?kRAVBjWIpxqzs4OVftRFQOVjtyCffTqUR7ze28+4rApbYHu3JmXW3KcYybzV?=
 =?us-ascii?Q?DMR260T7+a4Fhwftu4C1DeIu/asjvtfxUkDOMJ/RQCMWXO+ILEvi5wB6+91Z?=
 =?us-ascii?Q?yf13CYsEv+wSVOw67XweuJQ+uLF6JWnZkSxgE+c+Ai+h6LfyVV32bk1TcifD?=
 =?us-ascii?Q?A7UrDfaeQGMFppJggcR50Ti37aNbyQ22XDlWfcI98sPXYrjiDIXwQMQWafGY?=
 =?us-ascii?Q?h4JtCQ46hsG9BAMa2lIkyiktYCp4Vo2miiyRArICQiEIN5rrsmwuCnglHoIa?=
 =?us-ascii?Q?0CgFl+ulUoOKzPWrPv0HAXV0234W8iVVSyfhdZSLXhbtxaULOud4CZpK4qk1?=
 =?us-ascii?Q?10/VonZQ6i6PMYP10RkBnQJosq8NrWAGFLlZzBCvSN/AmwW/9TqBlyT5ViGR?=
 =?us-ascii?Q?xvzzjzeuCde2EeCmPT9BunTP7tCoAR9cekJwCRR5mvX3pK1dSYx91nrqCMdh?=
 =?us-ascii?Q?TasoTAPpkw0eGKK+bNLO9vi8hEOW+lY=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 823534b4-209c-4f6a-8081-08def24238e9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:05:37.1760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p8/i3xemEdxsWo9fCGyDJL0/cmZ268MFw+LtJqQDQpOOrI9XK9mDhNGfKpqBylunTsj72Rw8dLdU+cPm7muQ4oUdjHQT5ThGvSFx1Dc2Rvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10792
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_090547_657875_EEB24D6A 
X-CRM114-Status: GOOD (  11.97  )
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

This patch adds device tree binding schema for Airoha AN7563 SoC pin
controller.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../pinctrl/airoha,an7563-pinctrl.yaml        | 348 ++++++++++++++++++
 1 file changed, 348 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml
new file mode 100644
index 0000000000000..e626d34661285
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml
@@ -0,0 +1,348 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/airoha,an7563-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7563 Pin Controller
+
+maintainers:
+  - Lorenzo Bianconi <lorenzo@kernel.org>
+
+description:
+  The Airoha's AN7563 Pin controller is used to control SoC pins.
+
+properties:
+  compatible:
+    const: airoha,an7563-pinctrl
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
+            enum: [pon, sipo, mdio, uart, jtag, pcm, spi, pnand, gpio,
+                   pcie_reset, pwm, phy1_led0, phy2_led0, phy3_led0,
+                   phy4_led0, phy1_led1, phy2_led1, phy3_led1, phy4_led1]
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
+                    enum: [hsuart, hsuart_cts_rts]
+                  maxItems: 2
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
+                  const: pnand
+            then:
+              properties:
+                groups:
+                  enum: [pnand]
+          - if:
+              properties:
+                function:
+                  const: gpio
+            then:
+              properties:
+                groups:
+                  enum: [gpio28, gpio29, gpio30, gpio31, gpio32,
+                         gpio33, gpio34, gpio35, gpio36, gpio37]
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
+                         gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
+                         gpio36, gpio37]
+          - if:
+              properties:
+                function:
+                  const: phy1_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio8, gpio9, gpio10, gpio11]
+          - if:
+              properties:
+                function:
+                  const: phy2_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio8, gpio9, gpio10, gpio11]
+          - if:
+              properties:
+                function:
+                  const: phy3_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio8, gpio9, gpio10, gpio11]
+          - if:
+              properties:
+                function:
+                  const: phy4_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio8, gpio9, gpio10, gpio11]
+          - if:
+              properties:
+                function:
+                  const: phy1_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio4, gpio5, gpio6, gpio7]
+          - if:
+              properties:
+                function:
+                  const: phy2_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio4, gpio5, gpio6, gpio7]
+          - if:
+              properties:
+                function:
+                  const: phy3_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio4, gpio5, gpio6, gpio7]
+          - if:
+              properties:
+                function:
+                  const: phy4_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio4, gpio5, gpio6, gpio7]
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
+              enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gpio7,
+                     gpio8, gpio9, gpio10, gpio11, gpio12, gpio13, gpio14,
+                     gpio15, gpio16, gpio17, gpio18, gpio19, gpio20, gpio21,
+                     gpio22, gpio23, gpio24, gpio25, gpio26, gpio27,
+                     pcie_reset0, pcie_reset1, i2c_scl, i2c_sda, spi_clk,
+                     spi_cs, spi_mosi, spi_miso, uart_txd, uart_rxd]
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
+      compatible = "airoha,an7563-pinctrl";
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
+      hsuart-pins {
+        mux {
+          function = "uart";
+          groups = "hsuart", "hsuart_cts_rts";
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


