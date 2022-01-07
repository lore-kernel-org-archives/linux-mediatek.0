Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C92C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jan 2022 02:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bEVDfFVIrLAM8uzVKiPW5Np+ln2KBDBamhEbBOMHths=; b=aOtLJ9cWxcj4rc
	pZnqGGPNXuA6Wus+1xLqjAJc5P/MzcqKvNzbBGF7Riv/ypyMVZvwlSWjPhhyhAkMTCGjWAslFBm0i
	cIfsqDF/VEGfsigxOdWCgeCC2WGlYVovDz3ba9z4hx4H5Vl7NYpnWiK8cVx+XXkdG1D1z7xhR7U9O
	BTOCAIbum+KqVeQPfqPTsdZZgpWXIShLsdU727VOiXMSV3q8n56FJrFREgikW5qUwVa4SItCFOs35
	JfiS//1jQPsyVDPJsGbeKAVy8ZotakUtbeB6pTRKN6fY/8KDoIFjz42VqzyKdL68EEu4XD9O+Bfs+
	YK9TZIKzeLTAF++JFghA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5fLn-00250v-W0; Fri, 07 Jan 2022 02:51:32 +0000
Received: from mail-sgaapc01on2099.outbound.protection.outlook.com
 ([40.107.215.99] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5fLb-0024xJ-4b; Fri, 07 Jan 2022 02:51:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HSj5bwzwfpxuKZZMoM5IOHIGupaFgd4kT25dY5bM9SmEoqeFiAwpnr3Oee13bC1P1WjW4ckw/y12jDYb+ohgypClTEs49AE9hcchP96ufNbhdNaLdlAXfItgswJzGjeMp3WXMH7RyPaqTH4xU+xZVzxtsQhM0IC2K1zhO3kAqxswM/6UTS1EpvrJxhDrpMbcy9f9j6VPxgQ6UCRE+9WickZrdPBcHFAVZLruw0YzZAB5+iyvcKGbga0sSQlIM2fZUADwrEwgvSgMU9DYNBoiU/3qdiY4aK88dVRWH9VpQK4J2QyZJFcWHK7cwlnl5WWfd143f9pIy2tiNKIbjYWAfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5r4UGt1bprd3oWYhcqQ18mvvoJrjKspLTKeP6SBKXY8=;
 b=nP0BYHvJ3f3aOL7e1Q1PAs0VmXnWHSPVP21/hzUV8O19gffG88HgFg0EOETyhmMjzqzBvXjyoX3/bM0QUQDg8T6sECtZhW6QDirQsRFDrpz8XqaomndS91Iskdd18EPEofwkQGZiuInb/LuBSECoDo5Y0jhynIL9/GdLY4WSJY41WkyvZWRJYCO3CjMfIIHNxckecfTDvp8T3YpxvqZ1U9lZmDggSgDCGy/IB5jhxX5TrIlvxT+74UnbOvI/fBVxE729XUPe2bxmKutDmVMu24ZotZWn8G5tuKzCZsv1WMQNOoH8Ugbq9U9hDVhTLGXXMnZfDOBTpVUOYFa0bZZHzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5r4UGt1bprd3oWYhcqQ18mvvoJrjKspLTKeP6SBKXY8=;
 b=PR0eVAP1LJekZh5l65n4BRxYqCncGRme4pRx7OElVT7jpPaYITOCVt1h0ahZl3UyVuYY7UQ8BZk8BLuP7fJPj7hXEOz8Z0k9vDtD2hsTuk7deHVBILUsxIk8G8Wt/bYiw+WTjFbt11sZ5o1XRXvtBd3hAo59+KJNcbx7OnfbPLI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com (2603:1096:4:78::19) by
 SG2PR06MB2859.apcprd06.prod.outlook.com (2603:1096:4:18::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4867.9; Fri, 7 Jan 2022 02:51:10 +0000
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::ac83:c27d:7c9:74ba]) by SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::ac83:c27d:7c9:74ba%6]) with mapi id 15.20.4844.016; Fri, 7 Jan 2022
 02:51:09 +0000
From: Wan Jiabing <wanjiabing@vivo.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: jiabing.wan@qq.com,
	Wan Jiabing <wanjiabing@vivo.com>
Subject: [PATCH] phy: phy-mtk-tphy: Fix dumplicated argument in phy-mtk-tphy
Date: Fri,  7 Jan 2022 10:50:50 +0800
Message-Id: <20220107025050.787720-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20)
 To SG2PR06MB3367.apcprd06.prod.outlook.com (2603:1096:4:78::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9e8575b-eed1-4081-c69a-08d9d1888e97
X-MS-TrafficTypeDiagnostic: SG2PR06MB2859:EE_
X-Microsoft-Antispam-PRVS: <SG2PR06MB2859BE7002BD6F5C5F9EB583AB4D9@SG2PR06MB2859.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dAImU5NtYV1lVUhGUnp3o1L/P7gh8xaWkfFEDyluzPhUpvX+8IoLCSmrdeSTbi4mGlastJHqKXPaIIHiAeGdOQPO2tNudt7gm72UajVmvFe6MWoBOBl9Gh0AeUGNKzydxjXV3BDdi29Il+L5l9JzCZS95zaTFR9yIFlnhNxvaEi14JLzrKjPHhooLNtkxz2oTvceI9LXFkDPVuxykjxELkCYJk2Ny+dIisR8gisS4yrQuY27wX7WcyHZbd5P/J1ap0j504p7RMij0uSE0MZ+kGV947BinII5J2AZ9SqPAcBVzHLZSd6WxpoS+sVzJj0FbiRCYblX87sWQ5SjTVMZ4puhxLXgz7izbdECW5I3ymGgr/8VS5IsDbPnK1niHFRiguwT+dg4hFlfC4SI6LyqPuYPApsrC/Gv5+OXTV8HBY6G9DFJJem2hyJOxtoTL65im+DbLSbm4UIcxld1y7q5yNz6dKnOgqGcfIk/Ygs+yr+51O7I4PqzYprIsqEAGEr9x8Tdx33OwomMvDHWMW5jdtKWp3ALHl04KIQZHfV0hKdw7Rqrk3e+GO//HmryKL2c/YhZxgqFCD+8tLAuIzCd8lYvRQtUoUOL7mwuQElfJ9k4U3QpSPOAI5CpcSpT+a2umSBfNtlsHctRNFxtjRfrWrVZDNwgoD6/j58AIxq8NzDidQxb5ysYZd5+kQOMr6KVgtFKvjmNjFrn/8oDcswOpg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB3367.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(26005)(2906002)(6506007)(2616005)(107886003)(1076003)(36756003)(38350700002)(38100700002)(6512007)(316002)(86362001)(6486002)(66476007)(508600001)(66946007)(66556008)(5660300002)(83380400001)(52116002)(110136005)(8936002)(4326008)(4744005)(8676002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Bbx0LZ/CzUS6JePgdMucK7R2M+u7cOf62eJkF47bjdTNwJigMOjVsykGDRWg?=
 =?us-ascii?Q?vs3DYgkFWW2AEYR2wg4JidMTEJzfEgzL+6CU3svv2auPUi2TFrHWmWRx8u++?=
 =?us-ascii?Q?zzUJRPzmXetwYzVKHyF5wl7I39y+mklzkUcvwdoxw3f6vaWnEmtDMEx34kV3?=
 =?us-ascii?Q?CuEhgIQy/AlOdJjJOmIGIcqw+k9/o5u09RukxAocz08PJvZpSLAgAUZws41r?=
 =?us-ascii?Q?iG8nBLu4Sgf+QF52kg5nL+0GhdzS68b8WzzlhcNHHG2oJZ02tfuRCqZzE7xn?=
 =?us-ascii?Q?ME+QfQ80Wt1MU3QNVAVovkCyuwOFpp8lVao77Dx/Rh+7qC7/m6vfD/VMm5rQ?=
 =?us-ascii?Q?J1K3X+blHVES5l24yA5SoKeK5NhhImzlgGUC2ovxbM9LTAt2/hx1tCG5yVX5?=
 =?us-ascii?Q?vFCsY/T8+Kr73peTEcA4Sswm8ZMqOHJgG50w1XFDoVB4lstDvZGPIagjftWH?=
 =?us-ascii?Q?z0LQTxiEy735B7aH/efgfF5BVQoXLWf6YXRwAMqcb84bFpASqYfvyjHq9G+A?=
 =?us-ascii?Q?GgPrAlnMGXv5sv7+wlf/6Nj+rBGSJKq+tUt3ymg4GZ+pl3d9MpxaW8/8ams+?=
 =?us-ascii?Q?Jp8k1u2fBJTXkPb7J0VaPawaYirOkmln4PoXEDmhWRAC6UJz4mGV7Phtts+Y?=
 =?us-ascii?Q?kDRV1vmsBTk71vJ3UKUXfZ32Qi0fB0D236VOFntSf+ui6Hi2v4L2iCiJNEs4?=
 =?us-ascii?Q?EH9cTrrmijBTWum1cUipYlXUr0c7HsTmCKeK6wJiUOYMZlvEav8UUqa/yaEe?=
 =?us-ascii?Q?Y72qwUpXGi4IU8IqUF04vFCmCf4gAbWayvUHa8606mHpvrS6OpT584VrGfh4?=
 =?us-ascii?Q?MfebBIWwxDhxdC2uLs5m5Db9+hwGQuGMY9v1FAk5hyAgJFFxsoRXSuZsHycH?=
 =?us-ascii?Q?sHiG+q9UmW8h+qgbEFKw2MN85O1VT2mm/m5wVeYNEr2sINXLR3V2N8N8gugK?=
 =?us-ascii?Q?Sfkl4TnX06TPEZj2tSYE8GA1LHfAuy/J27j//IJeqnE4BC/Hn9nCCJ67pjbc?=
 =?us-ascii?Q?M4vkFBXK4nsLXeJ0QbQPPQLhybNYlZuCWc+MsrTSt8KjsivYgTNwroCZcc1p?=
 =?us-ascii?Q?zxufNHbW9+ooE0pgqcJ8YOCLZMWDlC31KB0UBNqxOMB7rLnczso1a0/ia9oF?=
 =?us-ascii?Q?xi2xh8lhB7MF0xNqjbKlgE31nJErEpZGkYDYHc/oHW23f29CmzjpUWKzfLrZ?=
 =?us-ascii?Q?OVt9LTjCdWqKp8E5ToBixO1jTbRc0AVb1khXUDThmW9eF57nW0VAZJ8VgF82?=
 =?us-ascii?Q?8pKqjGjfGdh1Djpd+ajq3y9XqvmmgsYQJhpPeWXfqDabdVZ861TXDHMcERuG?=
 =?us-ascii?Q?ocxG1H6evdxB85QV9hcUbmoVIcEH+lqkXSZKjFNNFPELRH7aFKj7JhsIFiZM?=
 =?us-ascii?Q?pMYAVeXZ6zWLl/yEnpMblEd+TJFkxDaK6TnpccT7K7er/ctUmyz+ONewA4Vz?=
 =?us-ascii?Q?ZyEUt7wHiBsYURSRqkaNlY6AcCu21Pt5TQzaWvkISA/6aT1WQ7ByKrOxDIOi?=
 =?us-ascii?Q?ilMq6QUYWyF6wS8L8U9ij5f1r9fRF+JsoTk1SrlTrIkZc8d9xEJ5GAVigbmr?=
 =?us-ascii?Q?LeCi0OSeAdbxEqhR14V/wmuqvHPMFb1q9gXN//y+0n0NS6wLXZV7KkoH7gG4?=
 =?us-ascii?Q?SMvWF2+fUQCm1upQ4tfh6ak=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e8575b-eed1-4081-c69a-08d9d1888e97
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3367.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 02:51:09.2391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fZULO9vQVtpDTbxBuQPQVezDoaeZt+j3z+L7CisEE4dWW7UXhimjk/XX6VUx8fpbcCHF23hy0fjk5BZIpUFnZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB2859
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_185119_211864_CF24321A 
X-CRM114-Status: UNSURE (   8.51  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix following coccicheck warning:
./drivers/phy/mediatek/phy-mtk-tphy.c:994:6-29: duplicated argument
to && or ||

The efuse_rx_imp is duplicate. Here should be efuse_tx_imp.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 drivers/phy/mediatek/phy-mtk-tphy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index 6d307102f4f6..8ee7682b8e93 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -992,7 +992,7 @@ static int phy_efuse_get(struct mtk_tphy *tphy, struct mtk_phy_instance *instanc
 		/* no efuse, ignore it */
 		if (!instance->efuse_intr &&
 		    !instance->efuse_rx_imp &&
-		    !instance->efuse_rx_imp) {
+		    !instance->efuse_tx_imp) {
 			dev_warn(dev, "no u3 intr efuse, but dts enable it\n");
 			instance->efuse_sw_en = 0;
 			break;
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
