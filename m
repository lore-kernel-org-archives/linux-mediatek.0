Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EFEC55838
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2026 16:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKRmdOcaj6ZSKlhP2u9sOWlv6A0PPZIW1NfcWGAZwKs=; b=cL2zKBUZYoj5TfgWx+S5/+x1ve
	EREZNoxnLSkdo2vZwVl3da4knSJduSc9JScnJW4ouPrX2f0YRC/4RmcDkJ0ZBngOLufdmxgWKEs6l
	SdqlhQCg7tVYNEeN+vw5I43R0UW5zePaHL28rZHjYiNg/QoEFd4k6XkcsxBcnj9uyXgpWZFrYKJ7z
	ZpSvoI1oSIf+IQvISOaKTDPxvQ14mJ/y/ps304BIrXVaKj4dJ6c9Alye5DwB+tCU4/q7obaOHIP5s
	1bGJloUbb2NKz0EV+RT2BPL0ZkBu7gJTA5tbZTaofNbt8/H6koluS60X5mzKs0lY8nGLPCKu1Nk1w
	2PpvNXKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHdL-00000002GFU-3ZZI;
	Tue, 04 Aug 2026 16:04:51 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHdJ-00000002G5k-2UPj
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Aug 2026 16:04:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHEumLyoOeq4sv1oiQZbtoxEHwMFFe+gJliLjwT1iiqRUGQToMw9DA1No57GifXIGxVPm2SKSMx9OAE0gEeGTQziE2D0bKme/DYPR6fwHr6nTqHpYm9fTPH5UOXBP/YFeOYD3PV8JOLars9nLQkdErpXsUZsoHNe6by0mamvOYC7uvxJWYHaIa7wSWsQVfGtAUIWsRzT2wrVgwIP9eK9KUUs/eoUjRsihLXMyoVBJSsX763GVNa4q2YaCvNvpbh4YT313rs4nvUjkoy93qPRsvif1iZ8FIt2e7UtST/f7ySSkISdMQhbyZVfN1K5eGm+wPN8xrna5NYPmczvYO/V1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EKRmdOcaj6ZSKlhP2u9sOWlv6A0PPZIW1NfcWGAZwKs=;
 b=PxWv8kmM59glCFOqDKTnETz+iU3YtAS9J1N8eZtkiS+Q+5M6WRz22N2OHWDPwEucOZRbvK2oPP8qioKHftWun898OZD5xs/ZjdkqbweHM4wYdZHazcReABQE244cqjAJ0zoN3vFBFSXqBMrcMtir2GRiROz3A4mZkG+mek1RIGhjIRbTwPPhEuRdssqZ/cv+lG+MrmdWyVcivi2O6EIc14v4R62/nNuHL7QNMuBUMXeJ80s1bDChnXsjefez1Ljv9R8NfOvsz3fKppeGaDvgrZVBnpKGe6D0WSKfNPmlN1y3BQZhR/Sb4nDtWdHi9cJ31q1K2F3sNO/lHS6g63+PaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EKRmdOcaj6ZSKlhP2u9sOWlv6A0PPZIW1NfcWGAZwKs=;
 b=p9aNiuNMbepR0z980EHYXy2PiJg8QqDEv2rS2mx+P71fcD2PfPykl2tdNoQaGtLaZYaRvgQLazZVYyCNR+kII03942mgl03H6pVYQTcPkxHQrmnHn+7H4DXRCbTXERiQXVbs1whQWXqKQH4NIRCg/lsLCIX0lf+7jrTj9wR5bygmESterzbrGk8XhqHXuRdaRwm74eQRX14+6ZsxgZOxSsr3asvQYhOJEXw64uWTnXhG918p/CUDRKsPobWNkKUCLMhaoIN1ceGSMSGVaLJNoDWk6fOIwg7xIyyuQbMZE7CdAHuJVP1UhkM3twYJtotQhBaZAW1MUTx1cfoCBtYpNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM8PR08MB5761.eurprd08.prod.outlook.com (2603:10a6:20b:1d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 16:04:41 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 16:04:41 +0000
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
Subject: [PATCH v9 07/36] dt-bindings: pinctrl: airoha: en7581: allow configuration of pcie_reset pins as gpio or pwm
Date: Tue,  4 Aug 2026 19:03:50 +0300
Message-ID: <20260804160419.3592327-8-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AM8PR08MB5761:EE_
X-MS-Office365-Filtering-Correlation-Id: 140432bd-4d14-43a8-2624-08def24217de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|23010399003|921020|38350700014|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: nTRI9QaJtmqBPpAL+Auwx51Xetcy4AfkLJzfslU5/RRpZH7RI70G0bL7BlhHmyR7EiEmIcuPDLHDXgbNRwTiVkQWV26U2FEpqdn4vtEOCZkEDtPtlR6mLpxctGqPAvD8n21zKx0Arcjy08CIGCitzz9+HI8u4ztGrGhrj4B7xKoAG97m9rha2d8JDghFQiCFcE3xs2LUPC0kjuARfrP/3zhyRXiAuOJZNxviV9A5+e9YsKTP4O794aZLNWjPch4mIpU6oUHAaNBiaWNBjLlzmkw6CHPmmzhXzrpfTQb3NCWZXk+P+7yAWysv2yW7cjLmdnP5xDItxJDGcyniUPOdDm5vJNnD9k89IMIeT3Dlx1MJewkfJH9Pmlzvk9eEX3FctUFdsMzjbFQUDFOfp36ZSCP09bHfOiNq0FA5P+Se/hm/uPJVmsTUIFzPqkYh/+6nKWBxoLD6C7oEpsBr1I4nB2XU5vPAYaBhWyfRIZrRJA+wOYsln263TFMbRV4x4qgR5BOkhU6+LH4zWMU3DSfJWYVduqdG6iAEJ7ZZAWNilUukBnKFmoTCiQtnk0wCO82B29qgvFoNZ2CvA+EcVr975xrIpcKMcZZOcBxKeZI5LTNyHOLXXEd4vXaTogkZ7tto1YV4OZ3wmGYmtYssO/bLNNVC+s22rq+8EAkl3GDxSS8+GIKMA4k+dSbCY7IaIkwbY53LWiQ9zSvBYClPDHn7cWH+mwGmI2QKDktLJvdRaH4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(23010399003)(921020)(38350700014)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PnoD+JEx8abv5BsHITisdFd5x9G56Jfa8Q32GxVXpvTU36J/cncmvGuLkuSw?=
 =?us-ascii?Q?WG/VmGwcJxVehf8Xw0UkeJOjzX13BIlduon17H8bcv7L5aQbZvqmmT+AE46H?=
 =?us-ascii?Q?PIV7IFTFaKsKGwqO7v98NPJNTth3seG524Q1CfJdDOtuNonTlUOzeuKconsz?=
 =?us-ascii?Q?TskrCLBQB+Fe5BWph9cH2Sy6pfcFUrxJQmDDACOoAqdUxom7rBqryICd8xOZ?=
 =?us-ascii?Q?NGdqNPihyCh1/WbI/tQW6ZF32cFZn+Fj7BZIAGlSOKz8ooGkxUQqB6l2XjNH?=
 =?us-ascii?Q?oddW3nFjkghc79UksZ0A+T3beKeFqNfixkuXPyhsw4Z85rzUraK7hga9+2UQ?=
 =?us-ascii?Q?7b4PGzZbUOZyN6AimIqs5RloXy7IQEOcbFz53LkFWndoDHkA2a0s3c5Gz3MF?=
 =?us-ascii?Q?hS8sS7WKooV2jG/guRSx6u1PMuJAonSkH9wdk24Zat4Fh5H1dJZaH1cf2kR2?=
 =?us-ascii?Q?pfBOEjrw+StlAkxgQaWP1Ttxx7YqklSsAp+EZiI02lI43rik8msu1HphYEEK?=
 =?us-ascii?Q?f7cMFPdEeSH/4if2cMtWepI1HismHq/BLU4Ypki4aZ1GW7ZeT+Tq7RvphY3m?=
 =?us-ascii?Q?NwBGTSuULnWRKojydvPyb9qLSFqOT/xvZaEJa2ANkwTHjwwdNq0ihEjwy3/c?=
 =?us-ascii?Q?upno2po+eVE9lhr9LreTdwZZsfvIEHBF1v3lNvXUnq5ArmSSfh7naw4Kt8gt?=
 =?us-ascii?Q?AhOKhE+ZeHv14SOF+ovdd3iFkX6M8HlB57llgspvdGpzOAdwiZj6a2NrXyXY?=
 =?us-ascii?Q?jZ/x+lGLMRDexFFXGwzreoe7/8QcJs8ux8tjPXFkOttqpJaHv8CINbSYrDFB?=
 =?us-ascii?Q?wnT6yowlDP1HuR02gK+7ccLYxfq48ijt+lXel20s7LSQw5IoeonykzrW6BOR?=
 =?us-ascii?Q?O1Bafx+O0EoKjlpr00z0QfIUpDe9+i65D8mCg75T4pcd3yIR5+Ja7pZSIw1c?=
 =?us-ascii?Q?gB8aoy8/Ys+CZ9qR16DVEyoYRdyc+rfk4IAQYSfy4fI3U18q/581xNqSYtLI?=
 =?us-ascii?Q?bsKwNXJsjFYpkYCrYUjjkVGSu6eIF+zLycOIKqWGdIax60Coyi5byNbFxf3i?=
 =?us-ascii?Q?E5i2nWtYU712pdIzSDGjozpwxB9F40+0EqnRwCsbhED2bFBTYd+RJY/shJ6c?=
 =?us-ascii?Q?6oDo6qIf8BkdauydBkR8a9Jq1ZqfUt3WcU7CL83y2LRHnuv1KySKQM67raSS?=
 =?us-ascii?Q?F7l5gUh9mkTWKOSweO3Ie/DZ2V0fUuVZw/Cfhyh0ZduV1CZ98Fp/beFw6zJP?=
 =?us-ascii?Q?CoIA63zZSb2VjafrXSwK/L9MD0PxttxkC73/Zksf+wNe4on0InTPoyaBoOLF?=
 =?us-ascii?Q?FiEMVoRkL34kon4EFXoGcZE/Viy1R7yRiFrbiClIuM8PikvmY4h93sUbRGZ4?=
 =?us-ascii?Q?9toyV1wzGVbjU8pvm/+P4k2de6bvLi3G91VrLiqaUVYiQupay4+7pK+qyKgJ?=
 =?us-ascii?Q?9FqbU6M6zfxiUdGVzuXZIw5UJsxkW907LmUe1kgYZw0VzFaebVtGIR0UfrM1?=
 =?us-ascii?Q?a9RXCOjI6Bj6czkf/EvGh4aH9LZomfRbj4sSSIcQvXl2WoCI/WOnvubXHJGG?=
 =?us-ascii?Q?DXb7TRssizKlYmofpYjhMCxbUaz3aNFrkSuHZ0AzAhp4ssl+p+/nH5m22OFB?=
 =?us-ascii?Q?GCcueryTPnKXDOu2W+PKfPVcRO2IkFWiniH78bfc2v8/vVKvh5h2cWnr4CmF?=
 =?us-ascii?Q?AEzZVZjb/GqEBYMXn31ZSQj5UqMdivXdRhEE8K7L/zv9Nj0kRXb90DtcszqA?=
 =?us-ascii?Q?I6rGRVc0OdWCPOnaRKnmda0IhFOjias=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 140432bd-4d14-43a8-2624-08def24217de
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:04:41.7172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eIFkgmFea5zQQeRb8GpV8LldXn8HuKtV93mKgUhO+ecaO/xtEKh67Yu1BLZoK/Wir1gCKv3nlYxBP90H8PKsD+Pd4v8sNA0MybuATAgkC7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5761
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_090449_631809_A1FCAF5D 
X-CRM114-Status: GOOD (  10.22  )
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
index 0c5a7eb6d563e..1f281d3c47cba 100644
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
-                         gpio42, gpio43, gpio44, gpio45, gpio46, gpio47]
+                         gpio42, gpio43, gpio44, gpio45, gpio46, gpio47,
+                         gpio48, gpio49]
           - if:
               properties:
                 function:
-- 
2.53.0


