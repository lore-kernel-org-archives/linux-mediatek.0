Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E93EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jul 2023 12:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u05gyCUOW398OdPt/Q3aD3BuXhHxCsPGGMQs1qlwebQ=; b=WT1mOOAZZhK3Pdk+RTGsOrQ4w3
	G0wOSeoQRMjrYbffLxLimrhrz/msLiwrN7jpsbyvBteiE3wbhITG4LnONLzQkuFtcMLEDe/QSEHl8
	AhzcNNIJyFpoyE3za/mWhOxEE0I3rW1aXx6sZC1jk/y8QyqLkU3XE/hYw2ho4rO0oCTGiieRa9UGl
	DLK+0C+CRElVqD1GiKSC7DoW0kW28E6mz2fEn9xRnfQ9bF8MDuesqiotx2fJGFz2KBWTnibdqqSXa
	iwxXCkOIxSCfHSzGZmPGM7bav2pTqUwIAttgJ0f//1oURCrLu9yGasTtUrezWq8cITXeOSG4rNn0p
	3Cc2K7DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH1bA-00FsOB-1q;
	Wed, 05 Jul 2023 12:27:08 +0000
Received: from mail-tyzapc01on2070c.outbound.protection.outlook.com ([2a01:111:f403:704b::70c] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH1b7-00FsMQ-36;
	Wed, 05 Jul 2023 12:27:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bZVOwBkHE7DUAZv4Q2uVnkxbGBHWOxbqN8xiwR1Fotk3E3Hjjw/805HD81bnbQ++/Q8T9an3jQMThg8wi81bHqVCMe2pR/nlw+aOwP23IoQVaoU1f8HITSxZRliOPK4WqUdf8OBtlZ99zqfTKbcCHB/FAz2MF8vMBwSuBvY8puQaodFqMLdSRcdx7fS2Jqs/MsLTXlBWiw6dLoxbMdcBR0NzNkzv4kJRHWFDSbLlydAdKs8nActhi6/kIilceUURYoR3q/FBUCJ/v0524pIzeb++smqFYBSoKMPDdNrJHk1/UucEf6r3bsh45qHtWWLGH1obtsZcsqcOhCi9dXCv4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u05gyCUOW398OdPt/Q3aD3BuXhHxCsPGGMQs1qlwebQ=;
 b=JgSBwm5sxpFQCT3AVLPP6V64EGUYbYO3L9l5lTfIPMZgXaLzQg3T9/mLbZ8jUsnUkDki/UpogM/gkbwyKwdbi0lgd0dQRiIKhCZwlAo7u8rp51NTfl8y/GToAj+Z7TT8+j3cLa1WoXVb+sHFqbqmlUEZDTbw+58ojtumeRW2NKzdpnUNrBF9iRaMVBkH9XHM5SrzOf6pzK72CGy/2P054maOisiVSkIJo/Bt/cOFWzfUNueDJg/UsiwKIVTfCUe924MHdTy/e2VZ7v7jpWVvmL8cqjF6LA+/0NV3g+8xjb79RyxFHQc6tHL+ysoo8Y/m2H8p2+miwNWc5X/bPtho8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u05gyCUOW398OdPt/Q3aD3BuXhHxCsPGGMQs1qlwebQ=;
 b=KIxVBIVtNh/LZIfIzxBWtDerGUZlFvmX+IzQjcr6e2Op4larsZGRxiZqmqaPio+YX+DeMOJqmUJwbZ1qDoPJAF2tbl0Kw47hoFXIdaIUFiWJAFVOOAIGOnh7LV9nPR7+qGLK3yF7hIp/w/NmG3HEd2+cbmDCgj2C8VeQFOCwpkct/uOj64k/R6yz66IDUCq7t4Qw6F6fsYtr28xbigZBcyuImRqbumfnbiALWsZDKcEjMy07Zdtw6/h/y+lZUhADOlvfL7ngYfRQ2q0QoE49I//JbUtNZRPnCVdwMQgTCSy/iioBGJmG8LBvcQKE/zpJj65iSx6mgap5+w+C531MNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB5551.apcprd06.prod.outlook.com (2603:1096:820:c2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 12:27:00 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 12:27:00 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yangtao Li <frank.li@vivo.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 4/6] soc: mediatek: Convert to devm_platform_ioremap_resource()
Date: Wed,  5 Jul 2023 20:26:42 +0800
Message-Id: <20230705122644.32236-4-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230705122644.32236-1-frank.li@vivo.com>
References: <20230705122644.32236-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0001.apcprd04.prod.outlook.com
 (2603:1096:4:197::12) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR0601MB5551:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d4d442c-0109-428c-039b-08db7d532165
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HtSbna9pVfAcBL1Fm8yGYCntQzKNc1rQc1L4DV4Upp3xL1/rUwQOoPQwO4mCe+NpFUvl5SSeH/LsZ3aGi+rGLBs0S8CUkqBVG/7u+wH2pglBB6kIfUi2unQiO/I9oyxlSN+DZU9Or3LUefdPJDEHS4TW3GM0MK6fSxQyKiZaowGIUEsLC3JtDTvvcZWDLS3QOVa8ngxxLlRy3mLjVYCuW8MPDbeJ/apEBOmcmJ1PVju51DLs9ltpCUfWirqyzsu5evla9q4zgwiI2UjdjIkogEESGrfBFqUq523dHuJnBLCUbzHC9s+0xw1X4g4FDQGnQ3OsGhZQ+L4J4ygKvxTjkFf2w36Pn+nMrLtV3NrPNNR+SOJOmFHfSdle0+/9s/tnPk4QFwPR+fSjDqqL7CJkUs5MfEn29nfs5Xrlw/Xi/AyCxyNwUDI7U7/fLFzWAjcKkyL6IXh3zAx7zgDFV25eHJFpN/mG12ddtXWoYy5TgXnBTItButml0DVnDm7PKwznw6lj0jdvfjqFqJ7+Vuw2vU0DIfFA76VhWcBfLVOAUR+cVdcb5AAyltvTzTS9vqc9PMWrnRKIYilKuetVWnpwJVEekCpPxTuCu2zPimXDeIU4xicLXQmKTuiR5osZjmQu
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(136003)(346002)(396003)(366004)(451199021)(4744005)(5660300002)(8936002)(8676002)(41300700001)(316002)(2906002)(83380400001)(2616005)(66476007)(66556008)(4326008)(66946007)(6506007)(38350700002)(38100700002)(86362001)(186003)(478600001)(26005)(110136005)(6666004)(1076003)(6486002)(52116002)(36756003)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AqQRwkdaTB/yTMP2lR8pOmGGOEXN5fzvlKt9c3M6PJlpf5QqfZgk2u5C7Y2x?=
 =?us-ascii?Q?JfQ9Q4fTMfEapDqIR+TIFeDUhCS61ApnSLNsq3CI4z03GUD1koGzIL8IqPq7?=
 =?us-ascii?Q?EyVprZs4Xs03LB6IkvfgQ1QA7KiKddEomhHlkSzNgKOVvXiHSY0Yw8J2K3li?=
 =?us-ascii?Q?AERVxV7r1ueQFQXgTEpzSiladgxiX6EC40YQB/5uin7ySpyeeyH+T2JSyr5F?=
 =?us-ascii?Q?stHmzRQO1eJVo3BxXhmjLkKNmKMIkhU8eznLbmbbnn+RjUm14SMug20H0frO?=
 =?us-ascii?Q?+LkcXOW257YqJxzm+IvByg9RDqKQDSU7DqNqf5toZ7GeJBm5az1F9GwCiFuX?=
 =?us-ascii?Q?msyVjNLOEsMxq29ZYSPayuThcNKV+UdCF5zq+o4nOllSox0Use0HO8JV78zi?=
 =?us-ascii?Q?tBMknzEWEnLSsGJHz7KBMjcgQkjNI5y6bRt0lpL8AA+aIjf3cJISZYvFTxEE?=
 =?us-ascii?Q?CYb6rcDmc9WKV9K2zOOC+M6ahNGNXUodrXcdI7shAS4bMHai5+GnJI5UuwQA?=
 =?us-ascii?Q?AIfsvkZwT8yWacwnlMnOrmDp+rg7aRI42/q/eX2st1oTrCKSTFlTslNFlhNU?=
 =?us-ascii?Q?PpOuXzA6VwpjAG8AWQSgkWmZeDTm4D1mOeo7f6CiVKjqvRTfpkOX0Ga5wVew?=
 =?us-ascii?Q?QKkCqel+8sclv4MMfdlqq3TYc4Kc/hzy+A0UXuon8QV3XXC0lmMpzXHPqwzI?=
 =?us-ascii?Q?7wyV4oO6nO6za5tIXHLw/yvlA4ck17LqBmPjX/klyBZgCr8y2trAtCn23bnc?=
 =?us-ascii?Q?wooUi4EpGoc6/WBvJh3aoR+M8K9yQTMQPYsdZF1SMUS4ON34RiF9inUX5ogk?=
 =?us-ascii?Q?bes1LsjEgjttKd8lf8UzTJr/q48ECZrGDWIine8vOnZAHlvKGHWuuPSQx3Dz?=
 =?us-ascii?Q?UpJ1MWckCL/XD+nMUC7lQKanEL29Fx3WL6717hgwaV1BUT9ijrgogREoDoeJ?=
 =?us-ascii?Q?Bakgkyy9zC+zWQa0203hQN9yAl+9hqw9Qs+/KCC9eNoRgb9GR402Ol+eITQE?=
 =?us-ascii?Q?e0H5IMPzzjWdFhxauCSf+Z9gz6bW4Xg7Uvde/xO65nqQyIwi6rBRKdrnWdCc?=
 =?us-ascii?Q?XcLGpiTUboFqjfvzNKBC7NKrwmAzYxTC/sn3VF/scTKGBn/FXM30QUcjiTXE?=
 =?us-ascii?Q?/zF7w0zQD0yZ7YfRZ1LxgJyoZVVrG2HwZlMbKVDeGO5RKLKx/xRRT5LoFpDB?=
 =?us-ascii?Q?2v2MJkiT9lQWBA5TNzHx96DrIdl9WTNTf35j432BlasDkEIChR1T5lklMddL?=
 =?us-ascii?Q?zJ8Lxj9x92vVlY6nRb2WRphjERDU4EENl/LIUgEC63uCMa7lDyWy/9zHlAhq?=
 =?us-ascii?Q?kNhGA2U9ENisx8G4r/tMhVS2BGxcqOEDprrLtNLaTF5DK9A2dhqeFDczz/mZ?=
 =?us-ascii?Q?/3IYMKr21jfuRDnDsJcDwZ4DZjueYXPFWI2a4DGipHnD+DSpLbNr77Nsza/x?=
 =?us-ascii?Q?T97KqZDAXj5/aGVQbmhfp3V185XqCqNA+LWS1iWYlfXjRBviweCy5+VnTnzR?=
 =?us-ascii?Q?u1PSmhHVQp0HjeV6UYLq/3pOsUnZq2zUTERwLBYQa1L00vllk6iOL8HSsUgj?=
 =?us-ascii?Q?sQlpEuaa5y+u+Kg8xNl8ZI2fnxwQP7hwpFndDD0A?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d4d442c-0109-428c-039b-08db7d532165
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 12:27:00.1190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ivNx2W6+5qkTd2mf/R3jFbHXg4HdcDLdLa1myTHkC8DqyHB2011k1iij7mjhIuV3oyqk7YIC0OUS4F3rhWFfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5551
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_052706_000326_90D72BE7 
X-CRM114-Status: UNSURE (   9.59  )
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

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/soc/mediatek/mtk-scpsys.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index 7a668888111c..4b5b972a6b5a 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -425,7 +425,6 @@ static struct scp *init_scp(struct platform_device *pdev,
 			bool bus_prot_reg_update)
 {
 	struct genpd_onecell_data *pd_data;
-	struct resource *res;
 	int i, j;
 	struct scp *scp;
 	struct clk *clk[CLK_MAX];
@@ -441,8 +440,7 @@ static struct scp *init_scp(struct platform_device *pdev,
 
 	scp->dev = &pdev->dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	scp->base = devm_ioremap_resource(&pdev->dev, res);
+	scp->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(scp->base))
 		return ERR_CAST(scp->base);
 
-- 
2.39.0


