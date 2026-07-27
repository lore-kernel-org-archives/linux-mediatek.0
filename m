Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9029DC54EFC
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 17:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BY1PKrihg1LsV/UqHmwQ0vCpWSmzUQTkh24lWKBUxM4=; b=0VSMp8G5/gQus2CSl11VuHMQD6
	9xpEY/V2Ga8mLXZKrABVcdLhe0mcW4PaJDjIU94AZXyJD/1t5yiMDot9y/wfbN99XB0L7mK8WG0Se
	/WGSTaCmDiQQ0tIABgW9KHQcsrta7fNDC068ffVAfsr/u2xY7lp3D7b4zbd8J5+LxINcC2uG5/lAc
	NEjM6VWXlDMCa1pEaPA/eIt0R6bPNH7NNRUVLIMzo+5BEZwfdYatAFAL3NrbvQoZLcWWaWR6gDlo1
	gHISAHnvm/l34mCrBWjPwHkU8GizgFMvcPsKSrpRhWFfmdfu8h7HkfYjfALD61hJdtM4D4CufESoJ
	OAwPX1pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woPL3-00000003XzU-26DQ;
	Mon, 27 Jul 2026 17:42:05 +0000
Received: from mail-norwayeastazon11023072.outbound.protection.outlook.com ([40.107.159.72] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woPL1-00000003XwJ-2G5a
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 17:42:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IhrcIZToR/PE9juJvYm6SynE3csMDQHr3mSBbLHGBGOcm+AlJ7cJYRk8e6Qx5O82tX70aTdGlJLLmQ8bQDAjm5K4FLWjnP6B7nLKsGbcs3DzmF5TzmibXEZpWR6zapqD5XT2bcm5tVfLCEYPWLlj0k3UoIB9lAKtk0ycMKfC52lluFUGXnPnSmXMrOpeVxMMtfSHZ99J1F0XjCzDsqY2sO12k+Ron3PdfLyi84MNHYNkTuFECu6GN2Ts+Rx41/eZoNmzj3rgKqZJW0rTJuqUd3Noxp7jRgM/fl8JD7QM+sD99Ghif+OzeuV2mZZl4RDcxhQoOnvQej7oBCtlCVeLrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BY1PKrihg1LsV/UqHmwQ0vCpWSmzUQTkh24lWKBUxM4=;
 b=EA5GU9wA1WoqjctzITymHHrEJpeROFQ4/rY6SkPqisC965QnS+oqo6ykKjmTrDHBVVOlVjYq0p+9zrkyGKIpeeK1LlB3qJYYgdIw5fmM2Vu/W1wp8Nz3h0T1faNK6dXrAbZjgsNgKHRf+wLUuS1BqvIq/oVStZzN1i1s4wgbd6utPs+B+Dw2hUNrpEo3J5UnHo00PM0po0/Vv9JSkKkNDcwAcQfDGwi4u/NYxR21tlAEe1VREBx4AMm6k8BResJV5naF+lc03Bxzf3aY34djIrhyj/Aaiw7tE6GZoTCrlR1D2aCRIuYTyH87OPcpu3Z/TtbRov3LzvOquWMX22DfLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BY1PKrihg1LsV/UqHmwQ0vCpWSmzUQTkh24lWKBUxM4=;
 b=rmL+HFQudn+IvMmwveQ4kSvqfqIPsOonLUr/48igp8CUynIjxAMJc5z9iV0X8REOTbmRVYSMlfkozTmJEg9WfCWSMwvDk56EJqQKUQjq1f3qOlF9mHxnAygfN6I7ZynQpNjN7XhcIof/5GP+oPHPxHnjn+wfWtr8Vo20XLtvQLd22O2bJem7JZOIAYeiPWogW6QYHkavSRYVSoACI+gmNIwVMuanNYs7klYKb4vUjB5g2YHNWxkdCfjmz0kJgOYL/rxoPXPDQ3vg+x1Psw+E0MDb0QNhApvxF/0y7eD+8e/PXBvepp5bwqE+HqNsZrlDRQ4R0rj7P+TO8b47VVIo/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS1PR08MB7537.eurprd08.prod.outlook.com (2603:10a6:20b:481::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 17:41:57 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:41:57 +0000
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
Subject: [PATCH v8 02/35] dt-bindings: pinctrl: airoha: en7581: fix pwm pin-groups
Date: Mon, 27 Jul 2026 20:41:08 +0300
Message-ID: <20260727174141.664933-3-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS1PR08MB7537:EE_
X-MS-Office365-Filtering-Correlation-Id: c3e01b54-6ceb-4f5f-a06b-08deec065b1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|23010399003|1800799024|38350700014|921020|56012099006|10067099003|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: PgOExBfLlsloYv4mZMGom7RfBpDz7D5vdj0rF5TJFw/SdHo4VL4B78hKkpU+dmrN6EnyNdDJrHnlVfAM6x+Aiim4/NGfYVLx9yYFuwTIuAcaHdG7m7b8ZG2VFH/fnA6SpoqWunOTD2OhkfqU6EemQ2m6ayvC2sFnmUp4QkiO5Y0TES5pA7zRcHZeJJwyvR01i8kfnTzHZVsKWqFMEzlYY3kcpgwEvhsU/5utm77d+36075A8S0RnomZf95ASpZe5KA9w5VfAFnWwczWvNWlUQ+S2YR254cGxwk0hOj5+tMCokn6FW8FLhNAZTiu6JJ0CMINBaQiXapaKwNEsPTIHOEcIV1MwUqlDA52FhnVfpZ1Q4EcGDkPzYcsmf4OIdqOcFK1NydlTb8QdT8qscPEyIePOtLTyPMAVIqEeUJCEUYHvpKXB8NoHVvWQiY64lmjvLHh73riGR5wtF1TMCPjCW1V9k+eEMYReKqBAtieTeK++oq3GVbluerjiqm0VxBO6MLqo5ytjTPx4charMOkgkAq1q13Wc2ZXoS5gep/jkH4+/OhCwhxXLs4HkbLmvEdto/97tquliORB/Mz38GFH66I4gZdj+kPdOdg5DP6z4EvblCgIVNDZwWl2MFPRgSWcVEbuf1i3W6jkqeCY8+UdUPE1DVjNVOf/FG4NIxVmBZbdl/qn15KoB95cvlYDV/g2VAamKm5Z6si59Tf9YMCoNafbPUT500EcRYCKQ10ubf7Ly9LHHAn+83RomTkXKRru
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(23010399003)(1800799024)(38350700014)(921020)(56012099006)(10067099003)(11063799006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8Dlj8mshZ1SLtqN6kYDXOUIT15b+UinxcevEaoAwLUNrO74ej4YDpH7GugfW?=
 =?us-ascii?Q?pgxhZLiL3/lxDCAm6Kp+FQl6PtSPtRDDodsgn5qDlF+d4OtrlHcjH3cNfVt2?=
 =?us-ascii?Q?hDBOqQzQk6iP4WgWnyLmC0PSVQJ8IMbBLK1SKLqCKL7qU/QLVoWYRdIwsVBC?=
 =?us-ascii?Q?NS/PawdviD3V+50EN55Msnqxkp3NyZnqLNGYWi7nBau1ChtkEVK4hD9hkW93?=
 =?us-ascii?Q?ICoamhL6/UMioHn8LupLJhx2FTL/WO4OrGhONgafO153w0lMPTDWUQWFz5No?=
 =?us-ascii?Q?PHXY6x6MgIev43T1ESsCN+cISPfg2kHQfTFPQmygEKUi0GionjEheOiJD08y?=
 =?us-ascii?Q?ralvQcPGJFN3vfFBKxwKLMc77r3MZIR4R/URduWXk9nfZ+B/16UjjbLWT/NW?=
 =?us-ascii?Q?x0yaZqLoKZ2NUBJTIFHNcbJfDE1PSHgE+1BA48ADO1oV/0s6iPh/XVejACkv?=
 =?us-ascii?Q?WfzW12esgEUqGLSO1ySOnFcqhAcMEbzcOlpHnh/F3RxdzPVIz79hBenhBMHB?=
 =?us-ascii?Q?CEmGhrMYOCoOPUNcKXulMYC+jyfnQDoLXqDhkVZQe1DAxpAxEgsZAy31hlaE?=
 =?us-ascii?Q?woFrKF2O4BVwOOCr4a/qOgQ+Ul9cerPDnDtXN8LGOvQciWW6O4aMlrVtF9rt?=
 =?us-ascii?Q?qmw/1XX3G/ohQOU/O0LN14yopOUFLc12vRkJM8n3lJYLKGVemommTF8OT07o?=
 =?us-ascii?Q?on7+uEj+bX9xXdswWw80XYo5WLN42aKmrqAaRags9A4qN4gDoDO5yBxEjm37?=
 =?us-ascii?Q?Go6/t6R1SBLbthkFCYjglhAtaf869BH9k57wvJmrbKWQ4LG+jjjx1uZZC7vL?=
 =?us-ascii?Q?bfpXu3JrGwIWjM0UYB5OyujMertx4dyORGUGOoOJNx+2rKZA4D7RCOtxSVmc?=
 =?us-ascii?Q?edySsoIuXnigBdOEQn+IzwUlDfM1EWyo6/YfruF+zbS5wVkmjT/kTZpM+dCg?=
 =?us-ascii?Q?vX1SHKDNkQyJiRYtWw0HuOoVVwucmZ6m72eYG+N1h0QK2W7LkXd8jsxg3ilz?=
 =?us-ascii?Q?5D6oEmzAn+x2A2+wa1DWVI28EOdW0Tjn+p+bjfr1ZBNIVdu7me1C/tSB/Vfv?=
 =?us-ascii?Q?rXa+II3iWslSstxJ0B9ur51+76XAUsI/GsqnYOAgyrH4MW3G6TWHKeMQYDLI?=
 =?us-ascii?Q?pkyLclsUb24B+KDPNZ6+iTb/9sRG12PE4ALAIIhMPTB8dvvbBegdlnqTwOQX?=
 =?us-ascii?Q?rrQiBMBIiEbWZwGjHGLuBAFgJdHjl4AeWPJw5cpFXiTxJ6X5Zf4K6w8UvJb3?=
 =?us-ascii?Q?AkRBE8ZBA4EE/J629YVxw9U/FZ1cpG1FL/Z8OF/xadxegRInTG17NYQqoQrp?=
 =?us-ascii?Q?YzCztPIv2yAnN+BmjxRWbls75im5nDaH0pjiv64Wd60LUkzZospF1twttIag?=
 =?us-ascii?Q?tzw18ISlaKl84LLfaepUBAxc+wqaP2g69UIFkhMzzMNDcaaZz2poneWftb+t?=
 =?us-ascii?Q?idyYIGTkp0hs6lEn2z7UfrXbBsDmdCnxthRLRha92Q2R4CrYr0F/shaYq5JU?=
 =?us-ascii?Q?247U2XUz9hNuAQfwDZJ1BZMueG6yh4FKyLBXmnaK6h7beuUqIEzFK8/q5kNs?=
 =?us-ascii?Q?QfbeTUB3m+IMazyYOUc8Gx7PXTXkYtjKd++bSIOPJ4BRlErl8N3urM3+vQqp?=
 =?us-ascii?Q?sI+E7PUr5QLpYvEOukSSq3qU2f/BH2zGjP6zITca8ixtnByySbyXlCnblnL5?=
 =?us-ascii?Q?Tl6IUhRFEah85CoAqfgCzxU/+MrDvg5GZ1VfywJfrmZ3SPWgDJB6D96KS5uA?=
 =?us-ascii?Q?f9DK49MnGPHBGWKU/3bGtjYG3IoxEH8=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: c3e01b54-6ceb-4f5f-a06b-08deec065b1a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:41:57.6865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ul8zGpAXLeQoFpLxb35rL/nCf3lX7vahFDpAlZDsD+g1Zqz0a8gBc3SSNDP+mwGrVeDuDAdkvEnDP1s7qaoIT5Kwca3ap3CwrWb413GKjiw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7537
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_104203_577844_8FBB1B34 
X-CRM114-Status: UNSURE (   8.75  )
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

According to commit 08a5af468e613b ("pinctrl: airoha: fix pwm pin function
for an7581 and an7583") there is no gpio47 pin-group, so device schema must
be fixed.

Fixes: d0c15cb96b74 ("dt-bindings: pinctrl: airoha: Add EN7581 pinctrl")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
index 0c5a7eb6d563e..12dd85b5b4105 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
@@ -208,7 +208,7 @@ patternProperties:
                          gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
                          gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
                          gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
-                         gpio42, gpio43, gpio44, gpio45, gpio46, gpio47]
+                         gpio42, gpio43, gpio44, gpio45, gpio46]
           - if:
               properties:
                 function:
-- 
2.53.0


