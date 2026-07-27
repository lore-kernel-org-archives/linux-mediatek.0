Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D499BC53209
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 17:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vpyeFMM8nNputDqYZENTlO+KJhiV7FC1RftZzRdvTkg=; b=v/5yBdVoRpBcGNTvsLEl2WZow/
	2vMe0XDjqaa/8y3+N1PWkfMmF9JYb6x2g/Z42VS0IsuGfVH2rDrP97fymyY9+etLiGNrThhiDDPc+
	n7ArMQDbPewuz+gU3aF0QWwfb9m5b0sOw+U+gKaILRrOw+ULuRO6lEIBU2euhHldJne06MzaHSKJ5
	n+IvDDZpd3bMw9vaZMBZTT+jr9qsyWz0FdGu4pdwwcQBJkwa0KefTz48AcHZHAa2I2omZnuo+nvUl
	w3j3TSo2Wa4Qj+2TOqXHx/Ot6sIaDM6a9CwwEk4EplFBg3Xw2AlzKGwv+eto2pMSxcb1tfXT041Ug
	V7TjMlWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woPMH-00000003Z6b-0JrC;
	Mon, 27 Jul 2026 17:43:21 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woPME-00000003Z4W-3uMc
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 17:43:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bdiS7nvGc9MnlzusV/wAY+2mGTpJcaQk795tep8CCz3YwxjLXx1vHVpVxYKGcY3pUrrZqBOnRuVSpA5Yi0aeNK43YQpAqSIp0nrVA5+g+sBncRLXWDYDCHl7AVaptOYyEHj5FE6hMtOlETLlS2GnOz04LIhV6xOQyUHzoV8illLlNMCkoEFzIqqVHylxSnojaRRAPRZiz/w1UhZ+gT5bPwNKGszTeMsJYu4VxY5kIJqFQnygLdiyWKs5Uswo1TRiXrkwSItaFpyNmY0knirnKnECaFUGNoUqCVg4kTZ0IV/ql8XSEdfvLJG/8dztHcaJPWAZrpDg7Z6lYJtxyMjGrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vpyeFMM8nNputDqYZENTlO+KJhiV7FC1RftZzRdvTkg=;
 b=ysPO+UzA1YbiNaX8F6ad3+axUQ9V1sD4xmS3NawYzb2+qBYF+5YeVAWHPIkpFjLj3Ttgd4r9/5cBh6plIs/ylMd6eLLjBfiCyuaYemz1pWzVHW8P1kFQQExZM1hLnyhpM57nXBU+WomtJfnyIX8HEM0jRCJoLir1TkHMEpF9rXE+xgahKNfN1srRxVD7whzD5pVWR7dNvF9aIJHANomG6uIHNxv5NiDq0+hXkATMKblT1j7Rckdo8XU7K0vtn1lWa5OzcO4D48vmvs/X7GyEgHA4PnGasI3o0rHzwRuZT/wcja2wAXBkqWCTCmkdqFkfjJuk1eYa9ajaCyBUyS3G7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vpyeFMM8nNputDqYZENTlO+KJhiV7FC1RftZzRdvTkg=;
 b=nnwS+aOdMXYH0JIRN6AmjRqiXrnWx0BjtXswnPtfLBW9K5nmPMFEnr8kLc/Z8p/Os8ZaeB17V7IGHRhsBxv75dx4yL3oXmI4cEat+zROlBvK+Oc5Dw6qfhIruuegL3otA/+y4Fn8taGUFjODsnvkoje+y2bZ8QuU/jOAkxyxDoXUrAEtH+eDY3WpDZrrClrEOZujcQypk7584QaDASd9bI7zCoe/CIgC/bOcl+zc7jNByiHck9tCBvpL0+pLU6wqwOk3d6OIz51W/6yGcAjNcxMt9sFhEK9nlFliMVdtLH7BF0e2auynhMkXDxeOeBTnF5fmDUSzce6Qaz2qDLurrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA4PR08MB6111.eurprd08.prod.outlook.com (2603:10a6:102:e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Mon, 27 Jul
 2026 17:43:13 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:43:13 +0000
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
Subject: [PATCH v8 30/35] dt-bindings: pinctrl: airoha: an7583: add olt function/group
Date: Mon, 27 Jul 2026 20:41:36 +0300
Message-ID: <20260727174141.664933-31-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: dfe63662-6eb7-461e-096e-08deec06766a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|52116014|366016|11063799006|10067099003|56012099006|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info: Yw2JbMLA+rP5KvM8RspMa7mTarhLgSFPNqc5T+k3Bvut+4r8ZMdirabYu88yC9gmv8F1pTjHuVfbdNQhVVFAU5XCMPqsYjLzitXVEtBy5kw5DdHgU7ntJRz3SM4EAGRZAxH+EzJktei74vPN/c0M0FrKgbc68hy9VPKFa1olwMZ/qy4o5jr81X2tvLCubaylROrfYpJUdMF/GQXYMVdY7+guPRKRTqtJAWy8DtZ1ABn5p0fAqj3nqcOBMLHZKAhtGKgw2zms1QY0FYeTkDi3quOz+oYc1bBq/2rRNCjYN2Q3z5T2UbCuA3OwylY6WLDufuNoB8CtxMRxlP3v8b3+PjJ+DyLLY3K3D5dotFIPVcruqoJJ9gIDQ3GWSBd5aksOhj9fyutHZqGDEENWmQjsNJbl1WE1sfujEauosOD8+4hISuSTdBtzL7A9vzJOBU/j5zFhNwE7IcwSuqPIz8ny3jjdlwKH3gaQf9CYth+lWtobJq4Fy8CvYf+SYEZkiJjOcXsYksMklBejd58NUcm+OvmtMBAAVtZ/hLwIMjTwgYVfOEWvNztV8CNOWe5VoOWDq1wXNZ/9DOYGeYp/DTTylUu0jE+QWcFfWZJnHbhRouV/QhtK8g8XRa91PzeymQQrjp0GVIAdKAmOMJEmdlR48oNt9Mu9MXdIwyAuA6LU7ILZur1KSslqgRbqrlttL05KBTzlrouBBvnlsu74YrFapCI9/1vw3Yz+YcTDTcbQBDtTQbj7lK0sh0l0V54zCYLg
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(52116014)(366016)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e6wN7pPKRpdcR25C1eDd4KGRT2Zdl3l/EATZJVCIbQUs02Jc9jHxo4WWeyEz?=
 =?us-ascii?Q?onyLMTFcPXr/RcQI9tQwB7Hr8TEzQZq6hnJPAnGRtvBIj6G7YQZ4cXmpb5Z/?=
 =?us-ascii?Q?qNbqruaND+mH++ioSFGXBNxT1qa3ZLKA1GrYjM3dXR1sR+zwfkNpm7Q7cLIk?=
 =?us-ascii?Q?VTGcD4THliD0NbWWW3WoUoFjoZi5cGuOyuQ1w0tYOhncAKhv2kxciln/93B4?=
 =?us-ascii?Q?RKXgxt7jTBcdMip0Nl+IWohrIzJjyUwMtc6CjXpe4UQxZsxjEao+/Cij81Pw?=
 =?us-ascii?Q?gsaL4OPTsxNWvh3q+LUgLyGA8kSxcNkj3FgLRKXM/ZAUcb+TdQnjvbhYgn1h?=
 =?us-ascii?Q?bXvTkYxyG8TNAh/LIXZKCNJyM0CeV/j+vTK2iLtXZaHqkCpciWdy69tipKTW?=
 =?us-ascii?Q?M23nQ0EgfGIuPLkGLCYKohmmqQHQGj9IQ+e7yGPUeE1ZB5aX2JcApQgrCowo?=
 =?us-ascii?Q?DAnufJaTd8tWiLRYoHpr1lZa2gg8BDE5ggti+N6U9y5SIx+EAKTyLkD6ei+y?=
 =?us-ascii?Q?+MftJjNYvWeSqbJqxKBJTqsx7WZxZ/4WrSkHDHoMSmwMyY1q7NEwyOQ4KXhM?=
 =?us-ascii?Q?K9VdF5ZnR7UX9CjaOoB5XS897/FHFNziyuKsOaKXJWm1emXJAcXIbf2XA7GO?=
 =?us-ascii?Q?fqfVsp/S0CAvPvTjECfc1nsON1vN4Ecr+VVSP/H1jPaWvztOTj0a3cF5R4wh?=
 =?us-ascii?Q?MObmthlT+ypMGygNZjDkhZjaQVsjVcpxrXGnovEf/m3+U1CdkTi27pEQxtCO?=
 =?us-ascii?Q?G7vqqvByYd+pfmAndkNz3gKIfYY6ocDfZphp4A6bHqIkdNL+ne6o3riFJuSF?=
 =?us-ascii?Q?3+hbt613mPAgL23az36RUfXK/A6nvsgyYT8+pGLZMnaxs3cRqlq8dxhe4XxI?=
 =?us-ascii?Q?15ZvfG0o0WGVThCA1UHS6GXbTi/LPxdszAD78HqM16gvQ0y72GKwnARY9tq8?=
 =?us-ascii?Q?m/cSnACwmVY4BUJMHV6pdK8eSOBM4bVEIeL/9rOIYHIaHfKPdJ9P80S2hi2J?=
 =?us-ascii?Q?cJDRqewb89iUpGbi4qiqTAl43sLsvNSTtJZU9LGnvCabOZ9cTEhrMXqUp/4k?=
 =?us-ascii?Q?2sk8jQ3Pcc0d0um35fXyJIhajyhBMm9Wv5CmM4a8K5gLZf8bY6lPIoNyJ0bL?=
 =?us-ascii?Q?U7ks1+IDVstgTi3JAxlAKMpirkcaBix9+Z+AOI+fhANtOQzUnInVUEWFfr7e?=
 =?us-ascii?Q?Xu+iQ/StFFafdYgDz3LZI8MDQKaMYnH8PxIr4BNAoo+v2tOolsntZC/VjRt9?=
 =?us-ascii?Q?sP68fPHEm2aV+PwiNAFUO5jJkLQgrK+tfP//rNVMSyX7jb6VsyS++Bxjp9ZQ?=
 =?us-ascii?Q?iNf/FdUSMam2gbjSxDHu1XwsRY4GEbGj2vAh2C6PyL0Y+ljNlTo9t30N469z?=
 =?us-ascii?Q?a4MwAelbQ9SvgdLUhpuKU4v8N1HnWVhKtBkIixW3mxfDlMDhZaBQ/BDKeiKa?=
 =?us-ascii?Q?k3vbAUieUidPiTbzivasiI/lY2TFJBBCVwEkEKIKSMX4Pv267QS3DFtAuxlD?=
 =?us-ascii?Q?1cYYtg1kv7Daa3m+2jGF4OCxRBi/jUMSTzFYy8v8UG42ZyuY3LPug0DnueEE?=
 =?us-ascii?Q?c6/br3DT6AjJvl+S2K7nXTdzKmaBnwJ5GYuVtVohTvRKudPzrkZdCRVw7TSC?=
 =?us-ascii?Q?tWCA85TQLhMbYyeRCC0P9lJbO5TDIqQYWg58n+ZZJsa7mBe7s5aJo2EeCpHj?=
 =?us-ascii?Q?s+WJw6yasr36X/ODqUx4RiDsofHFaxVagpSK1y/JfG7Yvc6wlg3YrIPJRcEP?=
 =?us-ascii?Q?rrhB9yNnumfT8XCOlC8x/C2A8rDp6hU=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: dfe63662-6eb7-461e-096e-08deec06766a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:42:43.5612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /hUFFpd550XMZXScXYD9UqPeyWrpVJ9LPpk1T5S1DhMm08jggry6E5k2VU1LHzYi7yI6GQI+QlhlBSjKpWp8y7dQiOtWix6PHexB7PfurDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_104318_996121_E557256E 
X-CRM114-Status: UNSURE (   8.58  )
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

Add support for olt pin function for olt pin group.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../bindings/pinctrl/airoha,an7583-pinctrl.yaml        | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
index 7deb48db52c3a..f016e0da65a57 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
@@ -60,7 +60,7 @@ patternProperties:
           function:
             description:
               A string containing the name of the function to mux to the group.
-            enum: [pon, tod_1pps, sipo, mdio, uart, jtag, pcm, spi,
+            enum: [pon, olt, tod_1pps, sipo, mdio, uart, jtag, pcm, spi,
                    pcm_spi, emmc, pnand, gpio, pcie_reset, pwm, phy1_led0,
                    phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_led1,
                    phy3_led1, phy4_led1]
@@ -82,6 +82,14 @@ patternProperties:
               properties:
                 groups:
                   enum: [pon, pon_alt]
+          - if:
+              properties:
+                function:
+                  const: olt
+            then:
+              properties:
+                groups:
+                  enum: [olt]
           - if:
               properties:
                 function:
-- 
2.53.0


