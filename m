Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 130CDC531D0
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 07:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eh7ICRCOshSN7S+HPUzEy6bJZx/Ck1ceC+yB3ac3f6M=; b=EnmazgrN0nV2ugFZ1AMaDhGpgx
	O3ox7ZimllhaQw8RBvFpLEbJfYqqXJ+EWjku2lFdIwRHgtV9d3QyKp2X/0eZ7/uG07HXFM7vYH+U2
	QNm8Es17Uy4LA1URkVfMwwTw2Ca1lzX53JxwUsapcbGrq8Gsai9BycttNvryo35ck4dJX1Qo1s2Aq
	uOElNB+lQBJHkQATl6Q5nLMss5iIU2NJWfemr5/ZpxBccLXY28r1LdVd2rYZcf0WgYjIyl2ZB6hQY
	zaVby/8b5g69bU4ZLRyfja9AH+2wNCNd3NfovFP6SnxFjWzEqesZ2Q3n05NDUPD96UXIqjj8fUipy
	Gqe0+ysQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFzU-00000002A7w-44ef;
	Mon, 27 Jul 2026 07:43:12 +0000
Received: from mail-northeuropeazon11021117.outbound.protection.outlook.com ([52.101.65.117] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFzR-000000029nR-0Yt3
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 07:43:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ap76gnZlrVIKTJX4zKr5AiEPoZoIxjxMDBd8AC28bJ543wE9CnxEzJ8C33312TAJzzG5cD8Syo7xpWPMzNh0wRTyfEJTyQwp8TZcxVjArh3Abk8vhFu42SQDjgec8d3kMtUPGC7j4J92zZxQn8lG5MjHSNmJlbT+kkGukyoIUfE/X7VkvGKKBcjTbK1oo8Cf/aSjjDcv+XsrEo62i5ccm7bQu/2b7tKk4KMI9TKq6mycHbW4HWct1BcF5fKlqBNfg5iKIeU2vbxpyea4fhoPnW+u5UbwtyJtpRif8osCcV0r8RifmRG3yg9hNVtALg4ZxJZQRT8jp7p45Ao0V5qfGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eh7ICRCOshSN7S+HPUzEy6bJZx/Ck1ceC+yB3ac3f6M=;
 b=Ei5BI1zCLqJCS+eMCvNiBql9WQ4BxoXiVzdOKCngryOMhxDVLN7ozxOuFppc5Izni+WQV8uXJEq2U2zlCgP7zf0PAp1rhvvOmx9pzB75KRK3JLkktkGnvU3/BkLBwvcXdkp5u0ngVMWW0eETAf1F5inkCbMBZGnRyqXqTrJhqRCIWBjfntcxyKmj69i7EqUuyTNlmflBIm5+yhRXmfMIDez7cq3AY2sMk9KYjmPTTpGiEMQSjqXuxrdb6+nem9yU8LdBwdA5z7xkZmhq7tMQIN6jtuDQB6YiMi8a4lg9yZlgJdwAIwIkz8zQwnodTJDPqP6FSCNDq6fVz3epti4WuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eh7ICRCOshSN7S+HPUzEy6bJZx/Ck1ceC+yB3ac3f6M=;
 b=6qODqfdHO4GzWnz8KEi+1sjwujxKQ6DQNj8yceZH+qmGYhkYS4jVXyPZeu60PDPtpmNPp6JQNocaFJrtcbaFv7VKQYWO53oVy9X3GU7l6uVD+ULX4quHhWuWhDxTiSaeMhme+LXxalAYYfYV2nl+N+IvwtQBCdSW11iCNGHFuiprIR7Kb9Ls5Kxivx/ghr56vmEjGuZmSADEmt7evAsK1Aj+QNPQmX3PsJmsdh1/xNdzbb+3Z5Bgp4XPdVEgflEaRV8aVe2eWflRPc9MkbIU/mX2SD8AxLlSy6ytGrUvez5NIMRtzNfEi18b2M9rYnyrRl8jwHg1cfOtsbu/Rg+ONQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PR3PR08MB5868.eurprd08.prod.outlook.com (2603:10a6:102:81::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 07:43:01 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 07:43:01 +0000
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
Subject: [PATCH v7 09/34] dt-bindings: pinctrl: airoha: en7581: allow configuration of pcie_reset pins as gpio or pwm
Date: Mon, 27 Jul 2026 10:42:09 +0300
Message-ID: <20260727074234.3761170-10-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::20) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PR3PR08MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: 39c0d3a9-398d-443a-0d0a-08deebb2af1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|52116014|11063799006|56012099006|10067099003|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 6oR81eZ6P5ywBRaaiZv116fcprqQCkPZHhsj4+m2MqBYE3X3Imxy/Glwgf8Ckv9phGWukLETW+0xN4wqVhmEH3lAAdtNX5kVtaYU8ZVwV8KqEI+RjpGwePMSIdn4m7viPqp7ZN1RIvhMOx19e6c/vYghQme1SVGg2z7NFqz0oNhMUvmA3eKkiNt3Jhft8+qIVpTK2P2HfHnQLCD+WHFLEWMVy5VnV6D0dtyg8sglJmdpV2p1j/FNlcHwOuErwUlPqDIVpwGHHtIo//Le8qToEKwOk1BJ/NwmcAXN5bIKQj10/BBmmtpXIDSG9yR+mlJ/0l0rV5nCYZLnx59QT8kWltwdQ/2ZrDUTpGQ2JQwyUdn0d6+C1gCtxmxcX76/nipdbReljBV35RHSB+S1rUvqn/zOeQ/8RmLXRCnb7Bw4QS9QwOSCHe3EWjij4ZkaozFr72P0CsRlbPxgVHIefemt4TPKcqkIKtKbtlv9r0LOWMUZ1f7isJwDzkR7TB1hSBj+F2Z+y6mtwO8yyR1Yf20bdBBozfYx7gBdfQ8JZQymI89S/MlezEJr4uX77N7R7MVZNk9c2fajN1jcRthH1J0Gl4IhHIvD9l2GbzwN1icX9WBg7RkjEZuEw1q7mIazdNC2fyEhRkDRc99KnakMhlDmPbLqkQ6UCI79wSG9JS0vJFav6zs3CLbj2OunQ83M/tM564Vbed/TwcQdChkWXZvlv/ftTu6Me3ZemiHvCNVh+WA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(52116014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cskZZUS1j3qOWNh40aNfFm1ksApoVrJOzpwkKicu5y6kRZO0ZGzyvERN5hTk?=
 =?us-ascii?Q?FZeQG+QUbUhFoB4auY4gVjwa1YAdDr3YvXyS6Y4Rw1UskGuzMLbmECoBUuLk?=
 =?us-ascii?Q?7fWte9/yT8lmSFidggtTwfcAJQFsUVeebEiOT2orGhn1eYetHEI2ijDiKqUX?=
 =?us-ascii?Q?s58aOnFLaqaaIzR+7NPtER7crcGvmFiYgBII/BrW4ur1hY/oHvrL7PQ2yy3u?=
 =?us-ascii?Q?vhim+J1JqqxjEhKxD0kXvgvYrYfsekhtLQu1w6HCG99BXU7esYNBA3QouA0/?=
 =?us-ascii?Q?mN1CVeSf0jC3lwLSKl3B9VXrJbg0GE3AWR0GrVuvBYm2dAYzCofFNz+7wQuD?=
 =?us-ascii?Q?T+1mOI6XseymcuYpj4NwiOWb/kn3sNdzAycpehbYMLT16yL/ahxAxvXRk9/I?=
 =?us-ascii?Q?LHE0J/cTaBby2R/f+raqVHnx+LUZ6s41jJuWQ4qJrllCqoNhykiUNopQ9oT+?=
 =?us-ascii?Q?XH0KgAabHFyvGEVEyhQ2RmHGpOwL9UgZmiSOZ5XrswHsvm099W6Xs4zr8mjh?=
 =?us-ascii?Q?DdXpgyJzx7CIqfjhsl3MVGkUzV8InMs870ntGHxB61OXo+M/CsUHNLlIIXPQ?=
 =?us-ascii?Q?4uHwkDA/u/WWxwZuFfpklqiD7khhEwNE8znoywxsan6BLGy2CNoOOMHVsVv8?=
 =?us-ascii?Q?rU8jRq8OCi8rDy5L3XX/ATsNoADh5mB1r5gWcZJxTc6oEeMnI+TssafpNgmg?=
 =?us-ascii?Q?goHqwglUfezjrV57SY/KoyQA4WJhlrFug3jdTd8vKOIPLLwnwJLHAEG2M89n?=
 =?us-ascii?Q?Ut3RbuK1grrqeCRcsg3W1U8fNSWZuisAU8S328Duh+Pf7L44tfOsFkIRp/dh?=
 =?us-ascii?Q?NEzbb5+U/hCZnbvXqo1L4EVFmJxAvrqjD8HFAnUPU5wJxLeRLjGP+1T4yamp?=
 =?us-ascii?Q?7RF2qcNkOf89SawBNf+4+LvhUEdj5ds8D5A9o0bHClco7cIY2WIQqu62T34j?=
 =?us-ascii?Q?kxNJXDwhf4XcMsBrOuSnh4SnSSGLWL4Uw4n9royXgNwSAnCjYaI/cGGath/0?=
 =?us-ascii?Q?YdGRMkqfPaN1Xx7R5Wefi/BBWPfpYsDGpFGcRlDsJr6BsRDs0kuKJyXO4kN6?=
 =?us-ascii?Q?2hwCdqHIe1MQmfm3BY0N1euewdvVUdxFAXzBuBxArNcJllSqzCgo2bm7fiT+?=
 =?us-ascii?Q?qMQgqarrDjwHDpf/Shk7pbyW2r750IYbClFjeG5KABg0VQ7vDc978zJ877GZ?=
 =?us-ascii?Q?a9JZtIRCCjxmmMUMLCzTvMyNG1KS3C/ipVhm0l5qGQh5angVrVrq1xl1hwgu?=
 =?us-ascii?Q?mOkMZ2loC697ENrLm3HLtH1J3FXai//t9/S8gnnu8NbRbY6iQ6UfQtYO/vbW?=
 =?us-ascii?Q?qmuZf3SRyjXKinFPgj5s7rf+85PpMAaeXCe1vfAHBrmuT2d4Ly1LUIkjhjuo?=
 =?us-ascii?Q?GgRqNZap6w+R0dUkPS/oT9FriZU4jnoiUmrZhMB/Cii6LkxMq8SYjKQQxK0c?=
 =?us-ascii?Q?wlDXUyVevNQGX1P4WW5HoXsw8dRlRRair4gY8cMubk71ibFNKDzS4HBkdxX8?=
 =?us-ascii?Q?hQsr3kXOurLSKsKsUZRDXk3t7N/VI1QmqxlpOZA9PdJIaim9NtM2S8Z5lJoS?=
 =?us-ascii?Q?Ksqn8AGYyLOlM07QGT29+1glpmjy5NB5kYHvqmsVYzErs/WeXb58cEpFT5jb?=
 =?us-ascii?Q?8+AMJRX3eMysM0Ep0d//Q3607DxDclXbPgoaIOhK9U8EfEDbh1D0/82V0/+8?=
 =?us-ascii?Q?8KIriswDUYUwYDR13zTVp8hWBSI7ZErLvCIXOKcK1FTXLvsuecFPsNORLiU6?=
 =?us-ascii?Q?s7FEPBKoQR+GoWsOIWc+GH8GbxGwtrI=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c0d3a9-398d-443a-0d0a-08deebb2af1f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 07:43:01.0023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aMCaKhVZf1Ac5UIKSkHr3n2QYFB7oFdiQPKs9rANQ6i9lNHeeySTKtudqSdnOHhsY2YEmzB6OUZpPkdHwUpx48e4gLnhzKiT0zni3uQyG4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5868
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_004309_192470_A5C15E78 
X-CRM114-Status: UNSURE (   9.50  )
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

In the an7581 case
 * gpio47 and pcie_reset0 shares the same pin,
 * gpio48 and pcie_reset1 shares the same pin,
 * gpio49 and pcie_reset2 shares the same pin.

This patch defines a way to configure these pins as gpio or pwm.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../bindings/pinctrl/airoha,en7581-pinctrl.yaml     | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
index 12dd85b5b4105..1f281d3c47cba 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
@@ -61,7 +61,7 @@ patternProperties:
             description:
               A string containing the name of the function to mux to the group.
             enum: [pon, tod_1pps, sipo, mdio, uart, i2c, jtag, pcm, spi,
-                   pcm_spi, i2s, emmc, pnand, pcie_reset, pwm, phy1_led0,
+                   pcm_spi, i2s, emmc, pnand, gpio, pcie_reset, pwm, phy1_led0,
                    phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_led1,
                    phy3_led1, phy4_led1]
 
@@ -187,6 +187,14 @@ patternProperties:
               properties:
                 groups:
                   enum: [pnand]
+          - if:
+              properties:
+                function:
+                  const: gpio
+            then:
+              properties:
+                groups:
+                  enum: [gpio47, gpio48, gpio49]
           - if:
               properties:
                 function:
@@ -208,7 +216,8 @@ patternProperties:
                          gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
                          gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
                          gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
-                         gpio42, gpio43, gpio44, gpio45, gpio46]
+                         gpio42, gpio43, gpio44, gpio45, gpio46, gpio47,
+                         gpio48, gpio49]
           - if:
               properties:
                 function:
-- 
2.53.0


