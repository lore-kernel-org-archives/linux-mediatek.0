Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F42C4321E
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Nov 2022 07:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tevgWRegN8UXNx3MDz7wBn2CrQmT6XoRaL0hxw3EWtk=; b=xmO45xdj3oWGkIIDGrlDiCZxMK
	R3WnBHLWGbC7FuijmgRBp7cUwWRunVc6CXJoZeNEW37YLDa0nWdfYZaI1bVb/nQpT54iWhFuKI8ne
	v+XLZHcsjxFtZcEsuVo/V773f5GTeFOMuFDivHkwMEb70Z2CYU+zHo1py2no9Jt9g/+l/V04ZM6qO
	l3hCKBfTM1gzAVfV+xGsKKcKEpvQhTcwqGq1HIcxW6seQud3+msiZkwGOlIYdYTq/lxQIkQg2SP89
	tZinkoOE1r4Om6rfn8O7RdR8/MRC0TIb0wrst02BDZMZaWhzAcAXWkIfCk92U6EM0rjuI3RaUWPwx
	Z6K1Cw3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Hui-00EHrP-BX; Wed, 30 Nov 2022 07:53:52 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0HuV-00EHkG-Kn; Wed, 30 Nov 2022 07:53:41 +0000
Received: from kwepemi500014.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NMWdw2Ht0zRpfP;
	Wed, 30 Nov 2022 15:52:52 +0800 (CST)
Received: from localhost.localdomain (10.175.112.70) by
 kwepemi500014.china.huawei.com (7.221.188.232) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 30 Nov 2022 15:53:31 +0800
From: Qiheng Lin <linqiheng@huawei.com>
To: <mchehab@kernel.org>, <matthias.bgg@gmail.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Qiheng
 Lin <linqiheng@huawei.com>
Subject: [PATCH] media: platform: mtk-mdp3: Fix return value check in mdp_probe()
Date: Wed, 30 Nov 2022 16:13:12 +0800
Message-ID: <20221130081312.35523-1-linqiheng@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.112.70]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500014.china.huawei.com (7.221.188.232)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_235339_869357_91170F62 
X-CRM114-Status: GOOD (  12.39  )
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

In case of error, the function mtk_mutex_get()
returns ERR_PTR() and never returns NULL. The NULL test in the
return value check should be replaced with IS_ERR().

Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
Signed-off-by: Qiheng Lin <linqiheng@huawei.com>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index c413e59d4286..7a2d992dd842 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -207,8 +207,8 @@ static int mdp_probe(struct platform_device *pdev)
 	}
 	for (i = 0; i < MDP_PIPE_MAX; i++) {
 		mdp->mdp_mutex[i] = mtk_mutex_get(&mm_pdev->dev);
-		if (!mdp->mdp_mutex[i]) {
-			ret = -ENODEV;
+		if (IS_ERR(mdp->mdp_mutex[i])) {
+			ret = PTR_ERR(mdp->mdp_mutex[i]);
 			goto err_return;
 		}
 	}
-- 
2.32.0


