Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8547DE706FA
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 09:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=epR7kML4uq+MfC56HTBz3XD9T3bIMTGDymcaABXyZOw=; b=wu3eENrL2qog8UZiCFvThMacj/
	2pFHrdk3PWe4LKsFhdsyloF+WLMgpx5YiYDT5icLrTQnXIKwveydhowdHMNU5bkuNnpt1/ieXzbiK
	UxiQjY0ZOKJKcSgvUM/9rVQ5TU43XR34s/s3Gt1nDKI47K/5twoxk15+1Eqa4krrJTdFgHslqwzW9
	fEbFF4GVtFbAfwP3XcHwcB3QZv+vTa3nnUwBtUyo37kiLJR/AbUdb6Ssse2wvPbAz1OY0tHvFsA49
	B237wwJxWpuDWYONGcE6O4lji45rN/SL2/GPomg+fKbuDVdcAWTvKy1W163/s3SnODAYEPkMb+FOL
	5nWKPnnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjFip-005Yjn-1d;
	Thu, 21 Sep 2023 09:11:43 +0000
Received: from mail-tyzapc01on20723.outbound.protection.outlook.com ([2a01:111:f403:704b::723] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjFim-005Yhe-2b;
	Thu, 21 Sep 2023 09:11:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=acHfolHkGyHCrygFOBEmKj47vQOd+IafDhtHVRkdM4B+zygLr4D0iohAc+osNgKLeFu6MekdYhWiSgp68yuaaT6AxYJtsxlTVh1SZOtrRBtYl20gWJoLzyILNCuFvtdHGpSa8Ou4+tFgS8vvTJM8ATlZCRdJBugjnwm729k4XqmL447e1bmtOyyyqI7wIX0EwgNI1DRzmR5GT/V/2Ts4EgnVDKV/0KRlehU2+It8PjPom5tQZuPKSpHoShmBj2egFfrg6eiFxfl/wL7IeAIm6etiN9QcBmWPTGrS0p8ub2juC/NOhq0ZpXSBiKPWeUEp4sGyz6GX1gvsXofCCpie5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=epR7kML4uq+MfC56HTBz3XD9T3bIMTGDymcaABXyZOw=;
 b=C8u2YWkqUg3u2Mw05uIgDK0GbEq/y+dzN7FW+VK2DqJeYjecfuXcRyTdE1qJ4oEMPwnklXzUclAstFKpDj94a2581yZKQ6mmbuhf2es1xgfpgNEjeard3myhdSP8SXZbNVq9NkOu6M+AK7IKh8S4j9gfdCGiEjK+7TBT1oO6Pwl9y+UXihctanHumXujnhFKnKVpFzBrGNaud2FIMvD47XRHdaQSwX4jee3PnN/MUPdRunB3MHEQcKKbyWu/6H3ABvTRcPpl+7Tp4Jk7MR5Z9dC60nfOFbpcVih8cEbaQe99Uk+u3yyWA8gcCc+050m0qlGJLnVAjyrdHPb0HBHG3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=epR7kML4uq+MfC56HTBz3XD9T3bIMTGDymcaABXyZOw=;
 b=NkqQEt+GD0EJBasOvh7zv8FX8LdkAzfdHyH7O7ZmvdK72AEvZHMZtJVVg6n2dBAm8pKsYrxBFLp6/1Rr+3NXcOUxhs+et2100rNYY1PHWofHcAw1t0hgwVV4c0Mj+EsL5/9ka2JskvF5YK4sB0ekMQ6Kd5wi4ABr1AnsfGO0M2P3a//jr8Mtx5CqB5eQRtgJjhq3Z0Wqv0uJaABU3/+aOTEhFKJmqR4pz+9NtUOL4UalLuxfjZOtSEAnvWcVVLw5LL/jXW41whFI0lmplVOGtSYO9JIl9S2eijq8ZLF+GQOiGpX66zApS+EjxAsS+s3BhD9yyjcPLaIJkA8oBrktbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB5288.apcprd06.prod.outlook.com (2603:1096:4:1dc::9) by
 SEYPR06MB5492.apcprd06.prod.outlook.com (2603:1096:101:b4::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.29; Thu, 21 Sep 2023 09:11:28 +0000
Received: from SG2PR06MB5288.apcprd06.prod.outlook.com
 ([fe80::1d4d:f221:b9dd:74d1]) by SG2PR06MB5288.apcprd06.prod.outlook.com
 ([fe80::1d4d:f221:b9dd:74d1%6]) with mapi id 15.20.6813.018; Thu, 21 Sep 2023
 09:11:28 +0000
From: Minjie Du <duminjie@vivo.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Minjie Du <duminjie@vivo.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Balsam CHIHI <bchihi@baylibre.com>,
	linux-pm@vger.kernel.org (open list:THERMAL),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1] thermal/drivers/mediatek/lvts_thermal: fix error check in lvts_debugfs_init()
Date: Thu, 21 Sep 2023 17:10:50 +0800
Message-Id: <20230921091057.3812-1-duminjie@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0014.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::11) To SG2PR06MB5288.apcprd06.prod.outlook.com
 (2603:1096:4:1dc::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR06MB5288:EE_|SEYPR06MB5492:EE_
X-MS-Office365-Filtering-Correlation-Id: c28ecbed-f092-4afd-e226-08dbba82bcee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B5XW9tMfwGWeBmUXujodriucQwHX8X2mHuGX2YHo1IycbNe7ADcooz5kxLlab+DQpMvqH+gJm2/KAD/XAp+1JZWBbt07a4WIjtSAw1T85GXzOvoLM5LDaIdjotfrTnicIeJoOsZRcauC016Ean1Dib3m1qwfIdqDTB63kTVmh2eLWNTTVA5AvTAdiucMB5vj3/RnJSqyxPAGBTKXXRXxmGEDlR+3Rx0rVLU3uH6nS3R5Uo7nN6R/SW6aZOTNWjVsvjWxfyvxyL+aWHSKkU9qT/mbT1IjGoSWl9X6vTxyhw0eZlYu/3cbmlQ/UxZglO6Z/hTuij8ZjdN0bdf5MLq2KxBMh/kTOwpkcgv7WbDFJLZrkzC6Z1KewgHEtCC83UK2cPh8Pj7L322irYCotYvQ/2oxh0rWXQDHiVjI9HFBwkf3dr6FnDRy9iStPeW5tvWHH3HTsEh9gBFeTWVNvFlOh0w+vnyzAcwDaOFQNeQvEFfY3qy2BnK5Gd2wtr8rztM79ECPvGhkqd6M7vIrj+1Mr7mHH1n9Q3f51QCAc3NW+fZ8F+/ytEc6HtULp5mzrvJhb8kP3ZGjGGS56GVoXuAO2y45NJokOF2a/wcibgh+yYKE3mOJHDdAiV45L8pouM/KEyI00mvWs2j/nMOuNZjDaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR06MB5288.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(376002)(136003)(396003)(451199024)(1800799009)(186009)(6486002)(6666004)(6506007)(52116002)(6512007)(7416002)(66946007)(8936002)(478600001)(5660300002)(2906002)(83380400001)(4744005)(110136005)(316002)(8676002)(107886003)(26005)(66476007)(1076003)(66556008)(41300700001)(4326008)(86362001)(2616005)(36756003)(921005)(38350700002)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P9v0DSzdhXD+PkwxLz7UId152n13K8oRZc1mA29MfggjB0Gyet6sir+h1Mq4?=
 =?us-ascii?Q?JqfFITNsPTczj+S+UvDoShNRKpk6GePtgG6VRIH+8j1F+uQrRNofnQ9Qu8H2?=
 =?us-ascii?Q?+WEMGg/nUSmy7SyP2R6jo6Stog9161jDKE8FZgeC+7a9ob6GL4iBcoML2u/I?=
 =?us-ascii?Q?88O6o6SKYczLP7613+S/33x/2ffPqzErnsMF9CRtKQG+nJcrfmxtEg70JW0m?=
 =?us-ascii?Q?stzLF0Z/+g0OaacpbKSHlLmNrvWoGlCL4P/k3aDdZ2cO/FKXGVluSfjankHC?=
 =?us-ascii?Q?+DxrB/4zASLzxja1LBBUnUvtlyRCOp6anoRG15GN5qvoBzc+taSK1J1R73V9?=
 =?us-ascii?Q?Cr8u3zlGyj6NM1OUNOoFgbG0vv6W4QLTBq9lfF6rg6plCHuUQ91KIJLuO+6S?=
 =?us-ascii?Q?1deIjabDvxR+3NLDGmAgKW2j9FbQ8NeB03d5HZDqhQE5K7AxnnTesNrJanuD?=
 =?us-ascii?Q?x4bA63Anb8+H5CLYXH1FPXi4mIokQCfMzBwsuWo8CeOu3gKeM/sywji8+hvh?=
 =?us-ascii?Q?U21ehfdfzIh5tlVftr8n391tym852Wwh/UsUn9cZz6UQ3Ia/hl2bCGJKz38F?=
 =?us-ascii?Q?yfT6PObfg5Njmtu/cI/BYK7kZ7AzenJc9ISCWMgguSAyo6LbPe2+iN0Fn2Iz?=
 =?us-ascii?Q?/OARVGyt1Tj24kgB637ddyYxFfE3bZFyvfWW4cuW1cOGsKWr0w97jpY6qv1e?=
 =?us-ascii?Q?5Ky5YZXVSw7HwleSG1Pl+JAurPS3bpt39UnsXawQKV7xQo4laTn08xwiIvgl?=
 =?us-ascii?Q?KfDjpOqSOWc6i+hzvrDxZzXXv5u81biZK0OzhMmQg5ELJxPBfwnandvuJcH1?=
 =?us-ascii?Q?66yXI9UW82ZA1sLGhmgWn8yQxJYwupXiFjM07GN61k4xHIUYKY84PSSFEH8W?=
 =?us-ascii?Q?NWnGsb4de1chpbwWA2LgJ+N6vU6gUoK+SvbBRTk4MSTJx/9GEPHOdnOQOeNp?=
 =?us-ascii?Q?mj4kd5A6WfoL1nBedYVzzH/2WxUaKxvLMTWtHdbEIeXBrfWb80hfi/w77NMd?=
 =?us-ascii?Q?ukjhAeb5Ilmz9XkArnZ8gc8Wi2GTo9bTWzpwl1fhI9Ku5o42dpjtY6b4MFy9?=
 =?us-ascii?Q?S2teV+Cn0PR2Mtq9M5gYto3nOCGIGiW89542wVKjYm9t1qkrWF2qhlaJ3uWL?=
 =?us-ascii?Q?k0tcc4hdHhlIcs62P1RTNp/hUqlP0/nIppLThtB3hMC+7lpTa9oyuUY+qo6+?=
 =?us-ascii?Q?b0n6e/JNHa7LqpefzuQHWEfYPP03v7+MOXQaik9msk1nTvrZ9vb3yGaAShXd?=
 =?us-ascii?Q?3LQECsbUEqQyw2qFH74uosTDuikPqzMwv5Un1XzMGL8r6P770d0mD2X6XP2b?=
 =?us-ascii?Q?4UmPtAaO81+PjmEgoBEuCk4p+ZkTb9wRXZUGfSIJEEREWRk7esvRR4y2eSkT?=
 =?us-ascii?Q?MhO+fn6RZcjrx2/lyAzPke6Qfni9bo2ZHjlUnqw4W2FUhwi2mg30/7sI3pHY?=
 =?us-ascii?Q?yUblyb5nJHEwWHKsH7bty0nJ99QGR1gdP/RHFXCI0dCvUw8WR51nLJAjzYOL?=
 =?us-ascii?Q?u9EHN6cWvzMUjp+asxUwRyja7WIC8wy7EyJiVZLTCxsWgMoCI1c4akmcC4eN?=
 =?us-ascii?Q?s2nryguRizw5RfyeCclBADvh4yG0JpMyxGNzbp50?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c28ecbed-f092-4afd-e226-08dbba82bcee
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB5288.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 09:11:28.3473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6UdQ+0Es+tnh6Q/5yj3mO65CIdlrN6T+f4VcUz76paleb6iMu5vN65uqfbrbyAhhvYzm+EDGkeDvQ5pym1r91w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5492
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_021140_950515_4D508EA7 
X-CRM114-Status: GOOD (  11.95  )
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

debugfs_create_dir() function returns an error value embedded in
the pointer (PTR_ERR). Evaluate the return value using IS_ERR
rather than checking for NULL.

Signed-off-by: Minjie Du <duminjie@vivo.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index effd9b00a424..88240600e6ce 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -213,7 +213,7 @@ static int lvts_debugfs_init(struct device *dev, struct lvts_domain *lvts_td)
 
 		sprintf(name, "controller%d", i);
 		dentry = debugfs_create_dir(name, lvts_td->dom_dentry);
-		if (!dentry)
+		if (IS_ERR(dentry))
 			continue;
 
 		regset = devm_kzalloc(dev, sizeof(*regset), GFP_KERNEL);
-- 
2.39.0


