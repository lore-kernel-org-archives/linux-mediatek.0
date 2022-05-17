Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0362C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 06:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yDj+J229ND+syNTt6r2bM4B1TLErEPuixlh8uiVVtgA=; b=c72viwoNZWzMS2
	OiVKk6XdrwVQVqwKRD/Xmok/fCHbmJkW7gZqYPHx18rgmFLsWUW+jtovo/vfIwvTNWUpIAoSfnEp5
	L1xVmYX3p4s9wQ2EE2WcAx0mJ+GuAs/9usRRVTa6DV3h5Z17DeZHil+PENMJWRXOjj4TubAv6cCWi
	w/5i5Eq1PADgDVoFX32eoZ617D/Uqbxl1/W9vb2AsEQZTh/iaBp8EM8YJ5gpU55hpudyvosmX6bmG
	VpCOpEvg8ecma56VeoxgJmnattqCB0cVxM/kbxanL4hqVy5Bv+EgkB6rs6hGve01IY8clKT5z6ElU
	XI8l+w0EuQLCbuV0Ri8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqqiL-00BoJj-To; Tue, 17 May 2022 06:29:49 +0000
Received: from mail-sgaapc01on2071f.outbound.protection.outlook.com
 ([2a01:111:f400:feab::71f]
 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqqi9-00BoFH-8O; Tue, 17 May 2022 06:29:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8Hq5/P7Xypjm5jYcWT78JpwE4UL+ncsRK/Ti93bzr9XlvO6VoMy4k8cT+kycsGj5UBQAISDOwAC7gnDvsxaGdxFhzxGvrfj61qRFLyubVKAnkIGprZcQ6E1SV6oDYhDjpCixxfOv0OoqIR/eXwxoUwLV1MY4QU3xOquAMV5qFfrkmEhom5vpCnoxhhmt4eJuxjAhp6412LIgs4UPqajw0L210gBaI/gwJnSvvqBSvShppxp0ehNMo3ZCSxK/hQfCEG1nkKCe0930JWPQW5V4+pNaBUypHeOZVD5oVFMFuNAF0wza8uuGmWYKdWgPaU0ny60QqXoANZ1kJ+dlBrZDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CIHTPaWAgMXYCDy1hDXdOUrLhDWdE0TapGF+eh3Sw78=;
 b=EGl3NTtRS1p3tSzpj6nm1d3xsAVJc4lugHl6x1VDKrsagm0GhWG0sZLcQlS3ExjABVlgxufIk6ssf8X4VoRg+JmTpXDEzm7z1vrgKg7fFyAHBmd6He81UqX/9Hx1EpuLJ9uKGRZyqwMLwOab47uGADtSIxLmZO9TpsWkbYl3lllfWhJibKPckXpS8v0EH1gO8DVM3VirBOy/IKMdVtQa70nmkUa5SgxQS0FInC+6HMUEyylBKxChliP+TyMTETmAFpkr2vQvYYP7R0ne4X9eTNW9XptxPCEaXgWFq/Z5apE1MR975fT8awr/f3BiyatN3EYckCTBXz01UL5h+LluJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIHTPaWAgMXYCDy1hDXdOUrLhDWdE0TapGF+eh3Sw78=;
 b=d5WdsuqOi0sw04UCdq1+SF4MJQZuhFTSLOYRppGNhP9ASZkDLu0gDeu6UsM622EJAbWvYOr7xLqKIcPncEaFllJC7rpxiauMlrw4Sl2pbNobfWMvz1q7vfnUI9sYYasAczGm53KSSrJLcWXByx2LTec6ofZJCKZCwvuWj7R7HU8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com (2603:1096:301:37::11)
 by SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Tue, 17 May
 2022 06:29:25 +0000
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::4dea:1528:e16a:bad4]) by PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::4dea:1528:e16a:bad4%7]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 06:29:25 +0000
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
Subject: [PATCH] mediatek/mt76: cleanup the code a bit
Date: Mon, 16 May 2022 23:29:09 -0700
Message-Id: <20220517062913.473920-1-bernard@vivo.com>
X-Mailer: git-send-email 2.33.1
X-ClientProxiedBy: TY2PR06CA0045.apcprd06.prod.outlook.com
 (2603:1096:404:2e::33) To PSAPR06MB4021.apcprd06.prod.outlook.com
 (2603:1096:301:37::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27734fc7-0bf8-44dc-1b88-08da37ce964e
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_
X-Microsoft-Antispam-PRVS: <SI2PR06MB51404BE5043830E431CA9093DFCE9@SI2PR06MB5140.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZwwDaibLMNB3KuP3ZGIzZxl6ekPm0FRBbiwQfKkMNgr5WsR/FltwRuMYJ/knbibu4NZv+W9XYCcU6hk9RAQ7tTVW3FU8kO92xgtI1b48neDo7l8merapwEqXTbErtzKoABBP0RzcZz1nSlVqf/XzmBR3kFyafS0hPVZpTBosorM6kR+nfQfESnIc5+d84V5ZsrbERojdRpvaI5p2xes2vN40fV5lLUh8C2dRe0YYOTd0QEocpVYrlFtrxNADyMTk8HAlBPEVOYowsdi5Wk12r055iHV1iIUdjjhNwOK0D+J0SiLPlOBT28xJvlWatN4MLQj7HI/1Lwdn3acQSd4PV5LX4bccqcxn3MGaQZNLJ1ezuay+k9Rx6z1rbMgauZu1mLP9ZnflcWbFCysWXI7WRGSw+asFTK8I+5Cvef1iRauY5lOWSWOYRnPtq6G0dXRb5tRWTAmDRo8tKctjsCBHiJ6GOouQILSyJ0KS/UdsqkAqzVkfoVQeWdc3/mSj6ToN3Ii6rKVWAz6dssZz/QfJ1LMmPmGE9bEqiTtGHwrIL4aJvdem0zA/bPQ4d2jxJdCrJ1HhqCql084zFibGFbEQoCQKQS05SBl3xSWtm8izho6IyCLCCUs9qoJOJSPnbO78eSUQEBnE8tQbZv7ZwwagFqrcAx7mVZzopnXRSG1IU7PDiJHeOff3nHw+bTAUUjCBkHYGIESx5BLfFV/rn7JpXZPdo77nttxS1w7HnjjWBGc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4021.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(6666004)(66476007)(921005)(8676002)(38350700002)(38100700002)(2906002)(7416002)(5660300002)(66946007)(86362001)(8936002)(508600001)(6486002)(6506007)(1076003)(186003)(316002)(83380400001)(26005)(6512007)(36756003)(2616005)(66556008)(52116002)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eIm9jPyKGL7/57MG9d+w36/bhyBO8DD/HyPEC/nBfv5pj9ypfUuTMOuFbCph?=
 =?us-ascii?Q?nL1ixOsf89+XAxn3psS7Aj57DR63ypsfW2bk4nPUI4GjcqqeWkgM+FscQgel?=
 =?us-ascii?Q?4ZRAzeWG8A5CqM3H13nf3IiKcQERjwRWtdmkMhWa9wg5ivapWSo6Q7L14IRI?=
 =?us-ascii?Q?4K0eANLZhjezuCbgw9tlACn8S6T8G6n39Ro+bg4KWZOiRyPBUZu/nAw241rq?=
 =?us-ascii?Q?13eBlQFQu6M5xEpBmrSqvOISHCGwExn4miUmRaSGksXES/CPMrwU8dD5bpT5?=
 =?us-ascii?Q?b/1Oe0HxdkXoNj1TAbE53AAithCjwxlFdfG0LINZSQuKasdkhJfKi8aeSNID?=
 =?us-ascii?Q?v3us8oCsvodPFUOipW7uTQLClozOA/HHGeMKddbGietAo+RtoT/ivBprR4Vn?=
 =?us-ascii?Q?Rp8nJrp1VluUhPQB7HpVzx/XKvtJTsi/4v0vWIDQrWTtKy0PbT57wdm4HYXs?=
 =?us-ascii?Q?XwWr0bCuQcIvqcCE8YIfxQFf5Y9S0a21B7FVTOskaVgC9oyE1YloLYAn2zz4?=
 =?us-ascii?Q?2gt1XT/TM+AI0E3jWvgYp/pZT2DrHUcv3tJK6EJrXsKxM2YHGgy8s0cev1eY?=
 =?us-ascii?Q?580n7oaX2YQY2IpOyhqITmuRXlUrIZGRgsJhkqSbmJkBEA09QKD1Ud/gqhqw?=
 =?us-ascii?Q?pKC/V/pPMnM/iPF9ZzYQbr6lSZ2hiUSfFOz/L4fRuNlb5sv2vDYtDADCd+Qm?=
 =?us-ascii?Q?x1+E1SRRgflUeShcUfQ8HnNE+bgcsqisS8JFLfr3xlHBFAZCB44w0InYkANl?=
 =?us-ascii?Q?Nvp1R2QBbd+qzKnj0eaci6oLVqV6rOKXC8eSLOCHWIdH3hJEtJaksoZcZDSc?=
 =?us-ascii?Q?ozKjF0yud8Fy4GMeeUBvDO+efYiBIcbBkeArPE+rVQmAQZeG0Sy58dyFjBUV?=
 =?us-ascii?Q?5mSdAeAw8EgjZeyTVy2/s/1OKdMu6aQ2pPfaJLCZO/oxf/jTcPLf7MYv7wXf?=
 =?us-ascii?Q?Ciaoc2LomvcrzBwaZkYW69R/sGiXP81XQtK/qpzpn1AQcMhA7dBYKZBYyfh9?=
 =?us-ascii?Q?qyTjOAPO/nhb3qX79TQVLmcBCLtgXVSROWaU6XjDdLCU29wVu50vytMCkmeB?=
 =?us-ascii?Q?A/FEEkHDKu55VOO4zCpxdZibI+BrZSCQ8IQcMaHDx6V+i508R9/0b6IUUGjp?=
 =?us-ascii?Q?1Di33+lHiwjybtT8BRzWI/iBfa2vxjBElcQ1fdQVxpiua5mUvaWsJE2aKQAw?=
 =?us-ascii?Q?8XuTriUbFJNuLL1ecn+Xl3dKdTJVnG4gGwa3Wc99xQEQapp7vyW0KuBYmgwA?=
 =?us-ascii?Q?mQTuPQqGjdaTefbmPsf+Q4HLlSKY1wFHBl/JiK6qcWATn6veFDYeg0U11myQ?=
 =?us-ascii?Q?roAEvetk1OCEqxC2yMIPSP+gw5rZTGzX+BcsMvI9107vEojy9cYJpYLAWdEm?=
 =?us-ascii?Q?j2vZrqdQGoOyr4Jc4SsQ2phpKGIVtoMDfX+EdEPo/bnG9YAYy1uvJNsJ1HvE?=
 =?us-ascii?Q?DrDCPxXc3eg7FhN3PccE4I8CxZCee5Dh3Pgg8dPZ2zrooHQ6DfY4j+KS50ID?=
 =?us-ascii?Q?5guLK5Z81w4PTQux9hX8Gc/cMzByPz2oUhx2uF+jmti2s38vOcJV7VaMWON9?=
 =?us-ascii?Q?lbHGZsrMd0UrtAp7wW5X2I6mxDRaOWNIuWmr3m1FkhbYEAeZrhJqkz8G6gRi?=
 =?us-ascii?Q?HQKrKiy1JemeR+186ftQuXjzXr9w+8Re3nKfSPVlFl5k7zDJpSvv6xN0GxmC?=
 =?us-ascii?Q?Mj0+dUm4mbYoT/yYS8L/p1lT75vXSKCXf1Wrki62e3Ry9ZcAwY/n/WwycBa+?=
 =?us-ascii?Q?3CEZ2vPB+g=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27734fc7-0bf8-44dc-1b88-08da37ce964e
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4021.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 06:29:25.3650 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f0iDLUoR5LxOdwE0geQvennVDU677rOo18GmrEYlAg/4D9n7iIecc8Dg8UyXaols4x9IasGI2iUp1lSHtqplYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_232937_329455_E1EFCBDD 
X-CRM114-Status: GOOD (  10.47  )
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
