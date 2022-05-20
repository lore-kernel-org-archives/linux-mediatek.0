Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2833C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 01:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uKLdzQYhyfwIYpNMsc7mo98uQ2YiAuTnTJEvrUjCuwI=; b=sVPSq/EOXvLGXK
	uIYMujTr7+W9deQ1dml6EHAGhpt5JxQwObc0ZQPEQfcTDmMqXuSbRfgezrfWqK4rHP3McY63eaMqP
	JhaEYP9Dxkeq1eXgI+SkDQOwJTuHPmTC56tHLSxwSwmUs6nk3lUKKakOuGReS5VO8kZcxLdqfxIFm
	7+An25Mh1CWrkOqLHwu4Jw8HjVcrO9YppTH6ztJXVMy/Q3zIlN9Ey9+IY6BHr2sRE5UameGaNjxoj
	xxPfhE96/QQoDo/MxRTHg+m2fZuJjstJIwdtFKfX4wbh/w4NgAN7BwIy0mou5bnAiykT/2Rvomopf
	f4qIiAgSPWjBJOJhgIxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrrZj-00A05L-Ty; Fri, 20 May 2022 01:37:07 +0000
Received: from mail-psaapc01on2071d.outbound.protection.outlook.com
 ([2a01:111:f400:feae::71d]
 helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrrZX-00A02J-V5; Fri, 20 May 2022 01:36:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ilpFXMSIjGIKJyHqGo3UkqgQmF5FtjgShjvb8lMF9RsgVk0Vq0i1JVeHg8cl2OGFKu7mWG6gNVoH/NHOMZfL1Q7z2Jtt4Vp9B0dO6W+4GzwgFQG9jKw6MeeZlgUF8WZ4ghvN2ArP0c2UC0Ls8pI9LOuz4ZP7Ot3EphPgWQU1F7Tuiz0/FtqA8K9dTmulZQOxZ28c6NMYy7v8oQlS+5ybQVD024jcL7X8dPGs7lhUrsT0Gofyu5e4Wq4ZiUMOgI5PCuihp2uCdQes5X/VAE1aJZXL9jspSdnTLaKiP34E2ZW6YqzVyqibgeZxC4OJGgQ9wzKrAlWbOoqEQPdrlFrxew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8K4yORHg7oSurunqql/0/yx7gTGeDoLOgHcF0POSyBQ=;
 b=kMe8RYwvMvVTvrKcK2ZXdNd0i5O3PRrB7t6zCv0EEvsdusAxr2pcOQusCcyGp5lMW83IGzglebQalAQ7EZCzV4ERVxs+X6r/j5P4k5foIa/K0EwVeTHhhD+mNWDln2/qtDvp/YC7dFFYe90qcCvnc6Mo2uRBLeGv/BmbWTApvWGWEhMDaPMA7tky4Q6nkEXLz9lMvOitTJaWm2sLIsfdiTZDg+I5FaxvUGuCGQ+iA98oepd3nDVYL7VIuXM/mVjjOeozUgLG+FHcagiXo3UbXxkjO3FmZNplzsbwP138uTcan0Ts2+BzxNDsCOGSbc8rWKn9oFws+1uDuglBpwlAzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8K4yORHg7oSurunqql/0/yx7gTGeDoLOgHcF0POSyBQ=;
 b=BzI5bnvnK7HQ91ACWHzHvYptanEyeou9CkIphgD/Zaaz+rYsOrce27vNnIX2RYK1GPqgCpqNuwUaJ8nA5oHvDhaVi85Sr9/bQ5UCapxwUJHfeLdfdBZ1N8zRS3Ka4oXy27ToE03whPN+BTESBkSC1ivxHzVLSKrjyny+gSKNe6I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com (2603:1096:301:37::11)
 by PU1PR06MB2328.apcprd06.prod.outlook.com (2603:1096:803:3a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Fri, 20 May
 2022 01:36:46 +0000
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::4dea:1528:e16a:bad4]) by PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::4dea:1528:e16a:bad4%7]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 01:36:46 +0000
From: Bernard Zhao <bernard@vivo.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bernard Zhao <bernard@vivo.com>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: zhaojunkui2008@126.com
Subject: [PATCH v2] mt76: remove simple mt76_register_debugfs() function
Date: Thu, 19 May 2022 18:36:31 -0700
Message-Id: <20220520013633.492622-1-bernard@vivo.com>
X-Mailer: git-send-email 2.33.1
X-ClientProxiedBy: TYCPR01CA0095.jpnprd01.prod.outlook.com
 (2603:1096:405:3::35) To PSAPR06MB4021.apcprd06.prod.outlook.com
 (2603:1096:301:37::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e586e68-8f9d-4fa3-a9cb-08da3a0133b5
X-MS-TrafficTypeDiagnostic: PU1PR06MB2328:EE_
X-Microsoft-Antispam-PRVS: <PU1PR06MB2328A5072F0A8FAD62FADD71DFD39@PU1PR06MB2328.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9mmnlaSPEUAL60Rl3G8BDNjnwLv2CqZDw5EPn+/f6fldOcYdq2FMK38dG71kezuDm88bUnJE96nR9c0zNwR5bNmdKvsBtpppP3woIB5OHQIXuFtpu/zFHG9eqCkhA3DiVp4C2vdaYaAELAmaOY5yFaTotBKuRsFQUJKKs0ju8ZDP1W3nA6xa2dryyxnCz5dYLZ/+KjUC0MMryIk/HAvyRrvnyvb+usNLT+cWQEzzAJQQ6keIgRY86d9goqvCX1FtSKBQPGs7P+9dcoKdWyfA37dQ2BkaXGx/puuS/48lLOmZUnRJJyudncgHv7z4KbihFfA6uvZFmIVmL17R/nDMhy3cdgR1DARbVAqW19bz/r2ZmsOFTR2JwJJTs7JrNoWN3+zjIYvoqFn3emWbZffwl9DZXlTsBmSfshGdy7jTuaVYFAFuVYT0+xJO4woTJN0Ab7W2hKhaseV97TbGzoj0WM0NXnRXF2yqEwQnx/iKsZn96TeTzUSdspW545iQQ24h1yVgG7Gqauu1DwhQKXKHCNYt5cD7ROOZHhxShLaAFvQBuncxarNdJGeSLNka7opE11zJcRmlYh49snjf5jEdSTD3JzdSgoPENuIIKjVHKqOc24vxg1ASECx9OeGx0S2VkFE82EFcs+VdAMm8pFs7WdwKVmx17Jkk9aZ/6IjAuGq/9+FNhvVSpLDReGw3sRTPaAXrMVxHBjOr3YuPooeHjg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4021.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(110136005)(36756003)(5660300002)(1076003)(66476007)(26005)(6666004)(186003)(6506007)(38350700002)(38100700002)(2906002)(2616005)(83380400001)(8676002)(52116002)(6512007)(508600001)(4326008)(6486002)(921005)(8936002)(7416002)(66946007)(66556008)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nnMmMVMRAlYrZlY7qlLrQe1TgOdrz81rX0ikxiQTilVIS+2TK4lrQGbarLT4?=
 =?us-ascii?Q?qw9jcrpicE+NDfPAJ/5EfhwnVucu2obcjJyqKjYSgbb0fPkSi6+vcpKg5pqR?=
 =?us-ascii?Q?rK1pOBvOrRXPjLfCeSr9rGFETkP3bre7c1H9G3eFlrmZnpp6BX+LVY2AkC5Y?=
 =?us-ascii?Q?BDU8ZAokKxgLjpVmSF39R8rdBjyXJeGuEqppZitnPbc+jMWJ3EGJqR+Au3/2?=
 =?us-ascii?Q?ajg3Sj3Pr8TAbIynCWREIb8CtKy9pt2JNRGLHsCtI/RU6a7JLrlTrIOxOK74?=
 =?us-ascii?Q?tob9sQpfwGgHEb82Cr0PddP35gK2wmRdFqydf3jxzvFx1v68bDVMfxVLNMKN?=
 =?us-ascii?Q?KxKmhKdjWlFB/IjiKk1xbzSXnfDOHVHk8tfz1cWvM+QuRU4oK/oAMKnnRP2j?=
 =?us-ascii?Q?wdo9OKZttA5WkGMW+aIXpjpUj+SHB8hPY0efYcXY30RiDlT7QUZaAjir0NeX?=
 =?us-ascii?Q?9tbH/E1Tk9SItHn1nXOsWtuLfC5D1cJgAuPEwPQ7zC9tYlYB5/6uAL5beWkK?=
 =?us-ascii?Q?/6IlVin9S0fnBY/0Vs1hqHhK9tntTvIZVvq3io9OnU1dTeh8tP8tXo/va4jI?=
 =?us-ascii?Q?l64GYlEipObKcDRcqoSdLi7nk46Az2YazufwpIvNh4cSIILgHp3aio0mhPYT?=
 =?us-ascii?Q?EbYY96tDdmeUCvIIPfzqrI0HPIb6nLD5/WRygp1GFMpttUPyaTDILLO9zdrf?=
 =?us-ascii?Q?NUFtB3yViSF1xJ/WVh7CJhE75+S/Hx7YtWc7Uf/TGSBr0I5mEjNrlMgEzfrC?=
 =?us-ascii?Q?FgJDBdiBNU8lA5uDx5d5kror72Lon/V7Ev7zxWNaMTZ/+peO4R5m43dwNHN8?=
 =?us-ascii?Q?MFsUHT8akTWgYvtlcYbzmEQs6lpKhVhHwEVhSqkgrXxe8yPYCB8fHTIUP+gk?=
 =?us-ascii?Q?B/NOG2q9YHEObva8PqHNizmdMLk+ifFUvCyBhNe4qGd7ELl+sgj0sjlMogIY?=
 =?us-ascii?Q?0HapXRHBBNwnQbuOkk2J60F4Vm4SgSo/20dgflOPQ8Fy5I9+fMScsUvHSI0H?=
 =?us-ascii?Q?bjxQzNFNHaf3jmClvyjkVXRC6261jzo52BE29F1MJ/Dg1y2xWnrp5cPQhj8z?=
 =?us-ascii?Q?Z2Qurix9b80ObCaFqTGtpSC0fJQ6UVFrQQSkH3N49ycmZQNX+H72yFUzdrVp?=
 =?us-ascii?Q?PmkNYkMcyBVRnG4De7AmBnR5wG1XlshCQDbtdS/j2UjM5aGYRoksHFjY4Dhi?=
 =?us-ascii?Q?lpuDJmQwpRaQxoM6V3KOC1/V3vTI7pPwGp08GXsShVTTCTFlC1y1XWkGqcuM?=
 =?us-ascii?Q?sbBaC+d2UnvaQfFg8E/FcT/H6h215ptsGJjn+ATwNMdqvuVbXNme7G+0LCir?=
 =?us-ascii?Q?XgmHDGStIX5uy770qMrsUlKVG4VDkyW32rppdzkARkQpARRchpPjjJHppj0h?=
 =?us-ascii?Q?wfQ1vqC1iZbnzr6yKpxkmL6jjSi72fZ6jASXXOSA4pPzWdLw/dpYNaZthYPb?=
 =?us-ascii?Q?PO0+f17g6g/DZMcCJPVgK04f0q331vQ+Lee+ijgiErLz61K7N4wHbGk3y7mm?=
 =?us-ascii?Q?sOcqANb9er7C94NlMPbWRcheyGvWOWaWHggzLhasvHZj30iIKFPbVkKRkw+B?=
 =?us-ascii?Q?i9O3RhZ8Mm0VSptkiHwV576FsG42gA6op0eA00EsyNQOkv1eloz6MH6FZilp?=
 =?us-ascii?Q?J8Ki49bO5cvWNHg1jLvJyci0sZqen8zTvcQLjRIiynrOSgz3STApNs3eeeNJ?=
 =?us-ascii?Q?82gXaQ8EIOpAW3c10OswFbfAGJwszA/K/8on5Z0hKOQJUaqNO4WLdzYQ2u7y?=
 =?us-ascii?Q?kM+6WC15Og=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e586e68-8f9d-4fa3-a9cb-08da3a0133b5
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4021.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 01:36:46.5142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YUSPQY1JmOAH0GN5NxEOmgauMG728XQOjgH4yCauEX7gaFB4TJf/3ZBbhd3IlBhCxzeXEEuou+WywCkJrEDK7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1PR06MB2328
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_183656_030783_1F6034E5 
X-CRM114-Status: GOOD (  10.69  )
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

Function mt76_register_debugfs just call mt76_register_debugfs_fops
with NULL op parameter.
This change is to cleanup the code a bit, elete the meaningless
mt76_register_debugfs, and all call mt76_register_debugfs_fops.

Signed-off-by: Bernard Zhao <bernard@vivo.com>

---
Changes since V1:
* make the title more informative
---
 drivers/net/wireless/mediatek/mt76/mt76.h            | 4 ----
 drivers/net/wireless/mediatek/mt76/mt7603/debugfs.c  | 3 ++-
 drivers/net/wireless/mediatek/mt76/mt76x02_debugfs.c | 3 ++-
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 882fb5d2517f..7967ac210c9b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -927,10 +927,6 @@ int mt76_register_phy(struct mt76_phy *phy, bool vht,
 
 struct dentry *mt76_register_debugfs_fops(struct mt76_phy *phy,
 					  const struct file_operations *ops);
-static inline struct dentry *mt76_register_debugfs(struct mt76_dev *dev)
-{
-	return mt76_register_debugfs_fops(&dev->phy, NULL);
-}
 
 int mt76_queues_read(struct seq_file *s, void *data);
 void mt76_seq_puts_array(struct seq_file *file, const char *str,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7603/debugfs.c
index f52165dff422..6bfe28c82f4e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/debugfs.c
@@ -96,8 +96,9 @@ DEFINE_SHOW_ATTRIBUTE(mt7603_ampdu_stat);
 void mt7603_init_debugfs(struct mt7603_dev *dev)
 {
 	struct dentry *dir;
+	struct mt76_dev *pdev = &dev->mt76;
 
-	dir = mt76_register_debugfs(&dev->mt76);
+	dir = mt76_register_debugfs_fops(&pdev->phy, NULL);
 	if (!dir)
 		return;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_debugfs.c b/drivers/net/wireless/mediatek/mt76/mt76x02_debugfs.c
index c4fe1c436aaa..346501d7d622 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_debugfs.c
@@ -117,8 +117,9 @@ DEFINE_DEBUGFS_ATTRIBUTE(fops_edcca, mt76_edcca_get, mt76_edcca_set,
 void mt76x02_init_debugfs(struct mt76x02_dev *dev)
 {
 	struct dentry *dir;
+	struct mt76_dev *pdev = &dev->mt76;
 
-	dir = mt76_register_debugfs(&dev->mt76);
+	dir = mt76_register_debugfs_fops(&pdev->phy, NULL);
 	if (!dir)
 		return;
 
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
