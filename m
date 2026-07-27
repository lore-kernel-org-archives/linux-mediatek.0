Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA18CC54EFC
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 07:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=caoEufxWhxl4xR8F/QHETnFXM+lFqIkseVkGhX10P6k=; b=c0H/xYaN6CIABSYqzy2RLkXR/X
	u3n1vAOlwDZkM64ET052wm9CQya4bmUg02XcMaOu9VBf9VKmauib/E1HVBb/gJ11iFQt6TUB8frQ2
	o/DFAPggOdSTok9n1RhwyyTFPTcJ6zDv6Tk7WRjG1ps2HdOvqOXH/f944X5yA4pOi2gUZoSRQYpJF
	GHAX8Uo2eM+iIKXTmaHnHKVR+MI05ZmMLuZlKC7GMUG9Iw3ndmXsuw6GbTsD5FyBTrz61K1GhKlcx
	1PD5EqSTnAGoBa9aj68XvXAjFDyo4tHMm3bCpBllnlTDgGxdf33v4KB+7AzPJrRV1Vna2Np5UAbOA
	7wVlUYDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFzP-00000002A1h-2kZY;
	Mon, 27 Jul 2026 07:43:07 +0000
Received: from mail-northeuropeazon11021117.outbound.protection.outlook.com ([52.101.65.117] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFzM-000000029nR-1yyN
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 07:43:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rAaPQxLit31FW7LzoJn+NPzgEHKB5OlW17FAokUMxofANcZccqwVp2kwSq0/gO/btc+6kz/YSblf2x6hn1p54ymp/C7niYgQAmQTz4KmXIj4NqcE9sHye/PAxrQEAeNZmVI4spoWWnnwaNU7iOsKu6OxGgEKOJD+NOiQN4uoOiUzEZPTPlVDxqPU7H59gEUvf9tbkYD4hHQv/5iwCzfXs04oeUoVz+JkP9oDmzQHRG9LyKIAFPEbnEhuzVMEpISFBkLJq9VlrEj/QJD48+NSwnfqyaCngpsF8102DlVV5Wn1ZP7W2elvpKZhcPb6Bft7Set8zrYEsT2IdD5CRqCs3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=caoEufxWhxl4xR8F/QHETnFXM+lFqIkseVkGhX10P6k=;
 b=PIQg/544U998vapxKYx1N6rAUkXafVS3UhEnGsvr+0wOTA2BwV++qQHi4GwBATVMxxcx4Vz/+0mX1ddpIieyT3dwbD4uE1LInvfWAd2UgzjKfI+JHAiXsSXeSK0d2IGGBZkorWuw2Fd5Ak57marD4yAM+QJ39swlTm0Dgr4ucRkj2vacVFbtO3f8iY3JyevKj3zPWWfWcJof5dNUCDdxE9ETMxWSDK8FH4SvNlp4vn0Q1OA3Sg29EAcjrqM1bmfVVJNn+0I3pvmw5o5PLOu+YKQD1lhcSdmWjiKaoiLigiPbJa1BKsW9DElThKO+VdMB/hjJ4lJftSSN6yFlwP4HNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=caoEufxWhxl4xR8F/QHETnFXM+lFqIkseVkGhX10P6k=;
 b=OBy1S2hkplC+nAXibb8mQw8VitLCHRFubFn9jEj8OBdAxNu3GwMIhT5cHFzNwomjyHlZd67ugrH+FwC7R6Gofw5FaQqefMDa0X7KpvkKPfo+bMtu7Js5XEt+mBHQmT7lEZ1ZvEIsM2rE7qSYwxsVI+gxocEFBXZ8p5HQEoXaD16aeM581QLFt5kvHEr+oml7dLDNJ7RkSJVjerEO94Onc837NUZ4BU9XNwtINf6RcY1neZnE8RD3vYtkreYyPPZjbLGwyRRznFuGhTrSml0MPYo+JuZPgTPZYgOMhJxcpgZUeTvs6DDnzv0BbKFeTAMzul2V8EowlnOEcN2Tg8oFsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PR3PR08MB5868.eurprd08.prod.outlook.com (2603:10a6:102:81::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 07:42:57 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 07:42:57 +0000
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
Subject: [PATCH v7 07/34] dt-bindings: pinctrl: airoha: an7583: remove i2c pin function
Date: Mon, 27 Jul 2026 10:42:07 +0300
Message-ID: <20260727074234.3761170-8-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 53e63ae9-9917-47e7-8769-08deebb2acde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|52116014|11063799006|56012099006|10067099003|18002099003|22082099003|3023799007|38350700014|921020;
X-Microsoft-Antispam-Message-Info: rvSyl8dEz4R43p/vIds/XuJoK5D6Bn3vfSNNDM5s1k6UnnEnFwb1eEHi5UGhY55v6BjF0jRhg4W3eM8MKYhDURctDvcV482UAhJAqYXh630pYvvTL+HiFHOhenugOgQKcwsHU9AKmsE/pviI1lrBHT9FicWUVLQoMMrJQvm8Z1J9//Ov8tWZ/ucMliRwy650R4ttVrtGo8TXb+bhTg37gmkLZZk96mfCbCw3cE/NSX9Sg8gXUFnAsWKJmWa5O6sAuxivx7e/HV4ffyrBfie6Eumg3zxOGBfG6ni6XCe06avDJsG+IXHP/HHerr7e1m/od4kmVZs0bx7FXRgn5RuXBZJyo4IVFV+2tRdOsBW0Mz0eqSxCkXDXgiTcmT04dQRo9XstiDNlAsu2kumPBk0xzm96BebjBSyhlHcK7mof4bneLBIYyy3qMPtPjajHr4qbpmy9gp0zUZrGg/WUWgFL8Qtc0MqCjbgbVI9lmh5wl8r5ugUSCmiTcnk9kq19Zy63qHEPdCO3eYMgiSNizHjMIeP+ZaU8bbqiDlGO/nTbFJWrr5U/XjP0hQ6lTPpRsdosp5IAspUWQxu6xvr6KEeRSgs/0ipHYGjTxKsvpi2560VpF1RZkyMrdaii3kmLGm4V/PfW03V1kjJj6If/6aA8/XZb2QgMPEeZFL1qibq8q6MrYdDy2wpOYpn0XkOjbk65Br+RFkywHczLYAPZbvM6wsZlJg0ESNEUCsKU00fB9N5fVCXlMGKftzAB17/Ljdrg
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(52116014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(3023799007)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5Thr/1WwpAMz4ZuYWQLXjCOIZRKuq5WNDgQYsoX/V2T1/Puak8aAFIdfk+p+?=
 =?us-ascii?Q?mKXudXmV6Vutp8myJnaTWJfFO8gS7Ic616IZqePDzejxMIIQ3eXsW2gjXt42?=
 =?us-ascii?Q?7cl5TFv5ESQPcTlPCXVj1C9zfTJ+2TI+5Wd/FE+ZQ49Vf8drWLRu7QCi/1o8?=
 =?us-ascii?Q?PDjP6c64bv0N5p0Yhk6FS+af0EGlnR9sNLjbDv7beimA3ye2vL5LbNsTaya8?=
 =?us-ascii?Q?TBYePuI+IZsKWJI4SEB/Qa0QxD5IceHBhKxJj3DUd19gITClJwkVZH4Zk0G6?=
 =?us-ascii?Q?F5J82v2A9km2mkbrYXfdK2FLOkzYkgbD1C9UuBjZf3A2J6+VWGzK6lQL2L7l?=
 =?us-ascii?Q?iNHb6XRAi71/gtI7ZlrIWucvpwrgxfOqjBsLsO5zcxN7fBwof91Lqk/iippq?=
 =?us-ascii?Q?SOYIYPwDS2a1ZPDTLp8T/JunIjz1J0tC/TE3L/1VCIZzWeH7OPmHng8G/OKz?=
 =?us-ascii?Q?nPGKZPqHRYecdxTZ4j57+nc56U4JuxvPboLjdfWqR0Qmh75jZ0x+Esnz+0L7?=
 =?us-ascii?Q?QPa+S/Tkdl10ng4DJolokDbMCIbZCtseQ1+BhSFwilKraUxE7pD25b1EyXeO?=
 =?us-ascii?Q?YK7uyQmyGUXIM5CAaVO5h1LL2zbGdi36VZzhJqxHvHW5fGsZ41ZFML5QaMPC?=
 =?us-ascii?Q?0TPIPcxK7KG8EU/GB6Ui/hbn1MFWlTh6RRtuzJwZU73/dLnV+Xd8An3+NdM3?=
 =?us-ascii?Q?FFJeHvNaCiB8jZvoFWaExlc4zkwz/jX41UNeBERZCSpKZa9SrWyl9DYfLVIh?=
 =?us-ascii?Q?Z2ZCWqSUT+/RLFET022HCG964ZjMXrGpgbqD4YwiLtMmcOCeBnREzikH9OnT?=
 =?us-ascii?Q?CDbMRzHkTFyjZs4l0S5eIMgAt7liCAYD2YFchEYicVVixElkQUs/uMls4aGa?=
 =?us-ascii?Q?NefwyrguKkzEePAdgbm36DzpPvGRjSHyTBBWgSzaZo08yaIG1aA5LXALTGQ5?=
 =?us-ascii?Q?CbTQI94SHS14u3XcTzEQoacrVdYRqhkHcdXVNSZbilgn0cfW3MDqSe48XUVX?=
 =?us-ascii?Q?DTN7fvRDmBiqO9QRPjSFLLUEVOzGmUge3rzvpVWPvb+xp2w59e2PJt+qoFRY?=
 =?us-ascii?Q?zDs9boU5GU+XQuQkbdaSuxtO8gqKmstvl3jcb8DRHB1xhh8fdrR8MrLJ8BAp?=
 =?us-ascii?Q?4XB6UC3FoIJQ/g6nuOlXetBTc9OH6/WxGpaQOp/8MeSM2oJ1JcAs4K6xNsBb?=
 =?us-ascii?Q?5q44l4KiUVp90TuwLsnKFtkjfMvRhBuk6TUrUHvel8Z+2nnwNR0TgCw+a/9b?=
 =?us-ascii?Q?17HPiP7uh3BtxdpXndizhyWz8aMLeUqvAJVUg1wV1Oix7kORP9T7E71tn4BN?=
 =?us-ascii?Q?xjgUKRApBYfscpXl0gBVKEa2LPR1tc42tbVL8V/WLm038Qh7dHvsJFmFRJa+?=
 =?us-ascii?Q?7dfuWrvbYGqFU5yueaTrgZVkgjyRaJsRnJWzFLASirKrpTNnKRpLSdHX6Zjx?=
 =?us-ascii?Q?VDjeTy8zzSsVKuWPJcWIyHTvfN4n8m2lnayXTwRvm6qyJX/1fWpYNPej5jF0?=
 =?us-ascii?Q?aNZtLS/SUEA3V403BVQvTcr9onCV0hwqPKJULaPK/7CrXcsb6xNEsHKBlerx?=
 =?us-ascii?Q?VeMk+3O0i31oUFkYC7w2rPFEMwcWq0JRsIGX2tNMtVq1wbJANiZ5jeBlDTmd?=
 =?us-ascii?Q?3Q5c9iL06eQxKipgV1IhFmPh7+3lDAYXWWOdE9leIMi9rFjou3Y7BcJ34MNb?=
 =?us-ascii?Q?VYQneBSPNDaNALmv5IEq3lgBmAyjhLHjsfnpn94/qfr9QN2UtsaYiUyWCowW?=
 =?us-ascii?Q?yGe7ZKEOZruy2tMSGgKU1tmgSOgukf4=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 53e63ae9-9917-47e7-8769-08deebb2acde
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 07:42:57.1779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vr00CD9CTcXy4io0MU+aVtcLLvcgdcccX4jhrALYQDdqFJaljk6gqWgJYQ6YioRyxlG1XdolZA1bbGdHxKZJYE+xBnu8QtmuNZxSZ2xaQyA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5868
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_004304_529967_58D5843C 
X-CRM114-Status: UNSURE (   8.25  )
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

In the AN7583 case there are no mux bits to enable i2c buses, so remove i2c
pin function from device tree binding schema.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../bindings/pinctrl/airoha,an7583-pinctrl.yaml        | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
index f52802a3ad79d..8d8ec6adb97d1 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
@@ -60,7 +60,7 @@ patternProperties:
           function:
             description:
               A string containing the name of the function to mux to the group.
-            enum: [pon, tod_1pps, sipo, mdio, uart, i2c, jtag, pcm, spi,
+            enum: [pon, tod_1pps, sipo, mdio, uart, jtag, pcm, spi,
                    pcm_spi, emmc, pnand, pcie_reset, pwm, phy1_led0,
                    phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_led1,
                    phy3_led1, phy4_led1]
@@ -117,14 +117,6 @@ patternProperties:
                     enum: [uart2, uart2_cts_rts, hsuart, hsuart_cts_rts,
                            uart4, uart5]
                   maxItems: 2
-          - if:
-              properties:
-                function:
-                  const: i2c
-            then:
-              properties:
-                groups:
-                  enum: [i2c1]
           - if:
               properties:
                 function:
-- 
2.53.0


