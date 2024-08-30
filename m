Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91444CA0EE8
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Aug 2024 07:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7xu3JKJHlEYye+kXxMg85WfFO5HKCksk47rPJuWUOdM=; b=n72ZAai1Mj5+D/gA6KofxWiVZE
	zDXUvpn4u+eczX1yWGqDpH3hrCDr/mOKNDbbkVHGTwKybzJaDefKgreJlqAWqgk05C81ozBZMT7bW
	BgXq7SHLFdTZaikgKugCJyFmatEZsj24k8unHfa7yg1vKEf01YKZXZWTE6CnI5ouy2T2iPhRBhH5e
	kxDMpw+VQe47Wx+HcHBZCBB5vFU9cAhc3oyQtqZWLvDFNOAgtFsrCXy5bQsyXOUCG9tQ3VhVk1fqN
	Sl8oC2mFlPWfuNh/6cGn3DwxRf/Ufs5iUpnJ6uCV0fvrJN0SJn+QLrfS0ePrIyVPnSJTOpiRxh7vf
	8hWfef3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjw3j-0000000570m-3xgE;
	Fri, 30 Aug 2024 07:28:39 +0000
Received: from mail-tyzapc01on2061a.outbound.protection.outlook.com ([2a01:111:f403:2011::61a] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjw26-000000056FR-2rMy;
	Fri, 30 Aug 2024 07:27:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j1ArYRbRKRcbS04WGg1NgPoYvsSZvyjX5Pcrf7se9Gtekt6a26LyovJ936pngGoXTFg7bt0H/2o1U+LN194gt3X4+kFXLXkfuauJ3U0t2XFfTXCy5NPFltcwMKK9tAU3caeaPuOMz4LYotsvtmKZDpy9FO5+8j1oJpKZ26o3FsJXosZ2S7wOeywbSACZdG0r9CPaz4uaxQhtT6nb2m1YSCejWx5GCY4d6YyNWaM/nfHKRtxnJtnZIWDMa8v0G0X2IVq9ly4TT143nieW03GD51n4jjeB2b6ZGeDXHP/6oAePXE+7pzu3h902mQGKPcZ+xv9UXAMdM+980HUjKyadbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7xu3JKJHlEYye+kXxMg85WfFO5HKCksk47rPJuWUOdM=;
 b=M/+Qzybvr4pGsMFv/gI4/Jjqr1XTCfkDOUSfGomLQWQBFrj0b14BdAL4vIsvB356EW4kOX0PKDzYLdm990Xq6TOnu2EfqtHvmGlVfu9A8lwjx6vY2a+MwsXowzXmCTAeLMnbmjGM8IV44uUiB9H8C025y2rKhAL3p5irqh9B7zid6uhkR5mWtBMSOXl18UflX4QiSQi/gGchb7FOaXuAv67dVZrpNPyUmdPyHQv/o3mwJGTFZFT3FzQO0P4Vi9y7F5cKS4kXXdlbO81gGHYLrClRH9/DFjQyCpclpRdRa6RSvLL7j7EXlodjW2z7BHgQSh337dzrX0GoUclR+yPc1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7xu3JKJHlEYye+kXxMg85WfFO5HKCksk47rPJuWUOdM=;
 b=eG+VXle+BDDa2WuWOe4vI7qj/il2kJlAvKkIL9NndfqPtjwQYvcLY/9yczVB/nxVcNOZijx+b8K7VKtXdvMLc9j/+XL87xcAWTGVvB/kt+0Kk/tnBHcvtS3j9cbnK53R9i/gHc6ZVafeGpLlrX9x37xA+M2buMU++MymrZTy+iIRGQmvGEbYUZqKxNLw3+3w76RCPN4RDJKzx0+jIyEpkvdXmpgkyXOwFsh3MKb6iYnYRnN7pgxq5kvznp/U5gYzTDwojQtLNcWePZaNDGtEiRH7+658oGvxi+1TNEtA6Y1HwuMxXEbMz3hZiYLycJGBtRmi5jmqFWlEr1y/HsIp5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4113.apcprd06.prod.outlook.com (2603:1096:820:31::7)
 by KL1PR06MB5895.apcprd06.prod.outlook.com (2603:1096:820:c9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Fri, 30 Aug
 2024 07:26:51 +0000
Received: from KL1PR0601MB4113.apcprd06.prod.outlook.com
 ([fe80::7e85:dad0:3f7:78a1]) by KL1PR0601MB4113.apcprd06.prod.outlook.com
 ([fe80::7e85:dad0:3f7:78a1%4]) with mapi id 15.20.7918.019; Fri, 30 Aug 2024
 07:26:51 +0000
From: Yan Zhen <yanzhen@vivo.com>
To: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	opensource.kernel@vivo.com,
	Yan Zhen <yanzhen@vivo.com>
Subject: [PATCH v1] soc: mediatek: Simplify with dev_err_probe()
Date: Fri, 30 Aug 2024 15:26:11 +0800
Message-Id: <20240830072611.332886-1-yanzhen@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0129.apcprd02.prod.outlook.com
 (2603:1096:4:188::19) To KL1PR0601MB4113.apcprd06.prod.outlook.com
 (2603:1096:820:31::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR0601MB4113:EE_|KL1PR06MB5895:EE_
X-MS-Office365-Filtering-Correlation-Id: 32642dab-d86c-4694-4867-08dcc8c51dd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oplKXakdaXUr9oSqNbxAC59slAYpmHXFB1edxJZlrQGA/Vm3Ol5Gsl7u9CyF?=
 =?us-ascii?Q?DRincwAFrCyc5CRVU/dU9EJtbGHkPW12uo5zuAE3fSgCrGLgOgZyOUUDvZBN?=
 =?us-ascii?Q?EBi1NpEADnYdDbK6ZI9Sb8fvIAQXZ9INuaG0trbTEePRQsfoVebaIj74IQtV?=
 =?us-ascii?Q?qLH/7G/vfkFROAMWoGf/Wtvztcxj9EeZtUUtec479AvFJcTLA8IUht+u8JxJ?=
 =?us-ascii?Q?wA4P8jFC+d6B7BiubsmFPdEXdZ1y5j75hp1eqyARnLUWvetliVbw9AULEM2o?=
 =?us-ascii?Q?tbKkYwJAa8kWLNLn/Ep3N20/OVQ+ylnxn3J5kDaN+NCYC5LbdCYr5COK8LaJ?=
 =?us-ascii?Q?avxpoUzOrG1EZgXHtGjCFcreJY0U6FXY3DwhPktOY8t3UQ7WhwKDovQFSlQ7?=
 =?us-ascii?Q?mR58ekhjqbxmGC4xU5b5GiJugwsHq7pYlBRu/QSGj1C7H1dr/s2jbdzP/xbM?=
 =?us-ascii?Q?4uNXp3FftFoZRD8bW+EvuVuDvvrbxzMk8IzoMIXjOuSEMtbiZz7B7G+kFkX2?=
 =?us-ascii?Q?clZ91UxtIoXdIjsAgACwjC/7hDDkL9b1xcESqYF5HPWeuzatowUkAZEt9GOv?=
 =?us-ascii?Q?fHo/l2yB+ml1dTzBX04h+zoSf3uQvP741+WS7C/Se35TfM1ywhOxkEQW0U3O?=
 =?us-ascii?Q?DZZjkhO7QJoV9Uav9R4Uq1EIGUiLONCbcOI1lhWL8tnXK3w2jXVKiJo7+Y9Y?=
 =?us-ascii?Q?xqSB1RPtwp+QfYOeXkWRfODHNNAcactBmXx3O0xzV3ox6EgsV/uXIbm3PVl0?=
 =?us-ascii?Q?g57BEq0aSZEoo0eEuNWKQsZ4PXZO1b5KH0DEVKWWOZwja6sC9k07B6SImyei?=
 =?us-ascii?Q?hUBQl9dkl/Xqq2SlKN4x/i2i+2UYCs/Qoh0vFgozEKWrYomPcJQ+WzV2YMwB?=
 =?us-ascii?Q?JKtwEbX7wURD4IOYRIOEETIxf2O9e7YsEy0GsC+tsY/f9I3gM9D9sG/PS1AR?=
 =?us-ascii?Q?YU5MgdnqLW/DJiYmHHi0YsUTuTqc6MWijTtX8AUW/UxyKu0EDXRMldbe6SxY?=
 =?us-ascii?Q?y1HNacr7YLYVgBNz6FZL9dkbSzTvtgN5qaoUUKEWaiUnENbE3k0LtJK+Nyi7?=
 =?us-ascii?Q?iSz5nUWJfROtj/n5xqrKFDqYza9+JTAP12YrrZNncz1v1NFt6ceEa6rBUtr1?=
 =?us-ascii?Q?wl3xaTfd2FyEubGGSZzCKwNhexDKAoppkTgFQgaCfp41ewCoeykOYrMQ0LEE?=
 =?us-ascii?Q?qGQegUIRWXm51pR3ncil6gXFwobLXVAouRM0AFXY60XN/WDiI0MD97zMD/NO?=
 =?us-ascii?Q?xHG66jkpYRY1de/l9yxZQMDAFjORT69s2JttKFRRzlTlJJ7Xffsf262hvy5O?=
 =?us-ascii?Q?+/jmqaS7KZtXNboCUA8KU77sOey9fpRTtxDFHUk031y2j9llYk8TUERbm4Um?=
 =?us-ascii?Q?0AEF+nEVNXrZZsfEqhdt1Z87A/lHGAKuvjDl74YePhldJxVyiQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB4113.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TVW7aQ1P0iK5P4r+5jVhA8RlICGxxPNu0vlbYj+NNSKF6lfxotsU4lNtYo+e?=
 =?us-ascii?Q?mHjL0RmmiDL1HxGreK3ISCqp5S8htx0Ld4XGTyJ+gj+XOXEuQ4WHaTgcfSUn?=
 =?us-ascii?Q?8pyhi80GallLPNlsVaTfJsCXTCyQ9nahd50mLCHd79C2hQuAECL+x/J6oyi7?=
 =?us-ascii?Q?0/H4Oo8k5b+BThjOnkH4zI+Qg8ABRIcjvaQ4jYwCVK/OzaOt/2uF9csMRvL7?=
 =?us-ascii?Q?thh8iY1sUR856sMPJlmI9yhCq7oAUvSgvUT+M/EcUjuATtRVIhfOidmdnHf6?=
 =?us-ascii?Q?qLp+9cO1PX2XBwkCbnqzUg0jDr34Wuz3Fm7fufML0VbHflN3nxu2j1VeIpgU?=
 =?us-ascii?Q?ZIylZBER07RFSimdx5D+1yPxT+pziR/x1CUd9ROuJWQPFcMVkK9s6zJXBVkH?=
 =?us-ascii?Q?IGLeF7UrP6XWrmWcm4nPqnQYUruh8moLtqapdGF7j7nMOJ+7GdQl70yobeI3?=
 =?us-ascii?Q?3OrrCK92+0QizIvzxU6u4m2NvqAaBi6pb3QspqxdJXNFDC/qmPP5I1/Hqw0D?=
 =?us-ascii?Q?0YciGfG57zNpA/2euZHS60lWSHCjQdUw6ce+S11SZDXcZP1cVEkKTxgav3fR?=
 =?us-ascii?Q?x8Klfq2sty2VvHxGE0TWKqNqxAyYC5tS8BqkZGx/SZ0DsrSqcV1nSRrETODy?=
 =?us-ascii?Q?d1TgA0gCD9NpnX0O0at6TV9kZfo0EqQaPHLDvAB95q3y9XuT9P64LiwsKYmE?=
 =?us-ascii?Q?k/ULHBXuDOGhdeEGJbUqmokA1fWgdpppiAF7WkJli+Hx410Wk0UQ1PGT5BDt?=
 =?us-ascii?Q?b5ppvU0BGf09iSaBaMDsyhPf7LcuczHHRfhiEPMFLlUh4uLu5O7/he3Zssk3?=
 =?us-ascii?Q?9i1WIN2p18HiyebAE++JWWZlqGMgYuqU5jH4//njTcEsLVDz6URrBoyuTBnW?=
 =?us-ascii?Q?swlzrsNQnMCGQte+Kn+MuX50iz5nmLrayr1M9bxFcm6Njb3nCI72HZ8MbIWk?=
 =?us-ascii?Q?XT0Lzdj10MbF1e42uLTKrbq3H56DdmAckFJ18dHYqldarglcCC8TQFSUZKWl?=
 =?us-ascii?Q?VkRNjEGtNF+0/EfCmXnj2oAi3wwG0+3MMB8HPR22EX73uSOpdQ+Zyu/w+R1o?=
 =?us-ascii?Q?LE8PeRE2VkbmVj5M2uruKUidbyd7W3OqDfODUVSUZMTg1a5Cde7B5nDam3QA?=
 =?us-ascii?Q?ecrzxRPvoled8JwnoDdzD6yJHIF5lVz26rGTe4olyvLZHbdhjvWMcUJzC0R9?=
 =?us-ascii?Q?msTHtlFotRMnYiBy825ehF27I66wDAYTub6haSBIN8U/lilrfTaEFZR+ORrw?=
 =?us-ascii?Q?p7QpvNuaHUxa/WDvZv5+ANjVbpavhhQmpa+zlvQEXzWPR6ypFu9axS+UWNWa?=
 =?us-ascii?Q?HQGXLdKaNS0yCQGJcwkGPLCv1Sfrs2TX4X1naD3Zplk+ksmhAWjxf0NixyIS?=
 =?us-ascii?Q?xBrqlnvX2x3BKXL6fk/WVTbnKaXVquh57A+jIyvVKHsAcuxEspwdCZvsBq15?=
 =?us-ascii?Q?kSsUzYoqHj2s16wlQuJBSDKbzyd7xXlktEpBwxPd6lIhFvqD8ngudRPNz6f+?=
 =?us-ascii?Q?4EC2CJTWnd1OlITmDXqGukFEjTtKa0iAq/Da3XDx/bOm0Zl4AZa8p4xMpBlP?=
 =?us-ascii?Q?HpdbW/DFBR8B5ukWKglEthz4c0ER0c1eD6FokhVR?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32642dab-d86c-4694-4867-08dcc8c51dd9
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4113.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 07:26:51.7176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vSYeyvXTpRiLpZSeey2Xmurm2MphNDu6OKF/6/1E5Za1gV+x3tHlPDxDXlPB0LjuxInnbUs1Hd+rd58MyFtx1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB5895
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_002658_746987_60CCB531 
X-CRM114-Status: GOOD (  12.37  )
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

Using dev_err_probe() to simplify the error path and unify a 
message template.

Using this helper is totally fine even if err is known to never
be -EPROBE_DEFER.

The benefit compared to a normal dev_err() is the standardized format
of the error code, it being emitted symbolically and the fact that
the error code is returned which allows more compact error paths. 

Signed-off-by: Yan Zhen <yanzhen@vivo.com>
---
 drivers/soc/mediatek/mtk-mmsys.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 938240714e54..2f2aefd4d830 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -399,8 +399,7 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 	mmsys->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mmsys->regs)) {
 		ret = PTR_ERR(mmsys->regs);
-		dev_err(dev, "Failed to ioremap mmsys registers: %d\n", ret);
-		return ret;
+		return dev_err_probe(dev, ret, "Failed to ioremap mmsys registers");
 	}
 
 	mmsys->data = of_device_get_match_data(&pdev->dev);
@@ -413,10 +412,9 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 		mmsys->rcdev.ops = &mtk_mmsys_reset_ops;
 		mmsys->rcdev.of_node = pdev->dev.of_node;
 		ret = devm_reset_controller_register(&pdev->dev, &mmsys->rcdev);
-		if (ret) {
-			dev_err(&pdev->dev, "Couldn't register mmsys reset controller: %d\n", ret);
-			return ret;
-		}
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret,
+						"Couldn't register mmsys reset controller");
 	}
 
 	/* CMDQ is optional */
-- 
2.34.1


