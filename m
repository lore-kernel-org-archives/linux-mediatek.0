Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F82ECAAD5
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 08:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5oIEL5PwCqxIVIF2rE4Yez3LI3l7lBCf7y9C6hEV4U=; b=sWhYOWy3VxPVOGa0fXlRtW9BMP
	N9rGlar4cxexn8UMBzPKeN11MNRyZm/LMIHP6NOxte4AY4n4TpNu/32vgMCwkoggzlNAcazoqQLa+
	/NRKmlU+F4dmPNhmu4lbE8aFRcF0r5j6bdr/phnMwsCUQDsXfKqVyTSZ5QPy+hnF3DOLN3norG/0M
	08QnnxxdKkJoqn/LF4xFc+FEJrpOO5Wnsj9/TW/cDqTKj7dMrK4LVnxWitQV0Pbd/rq33xT1SCjCd
	2nk2DgjJlosenMHehal2EN7XMzHj3Go2EYL/8KciAySwUo9tyiVzNNu6Dl2lmbAGoRII3TChe6XHx
	0Lw6F6cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU2Kx-0024yh-Tv; Fri, 02 Sep 2022 08:47:39 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU2Kd-0024bb-M2; Fri, 02 Sep 2022 08:47:21 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MJrzj6pwczlWYX;
	Fri,  2 Sep 2022 16:43:45 +0800 (CST)
Received: from kwepemm600010.china.huawei.com (7.193.23.86) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 2 Sep 2022 16:47:13 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600010.china.huawei.com
 (7.193.23.86) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 2 Sep
 2022 16:47:12 +0800
From: Sun Ke <sunke32@huawei.com>
To: <mchehab@kernel.org>, <matthias.bgg@gmail.com>,
	<hverkuil-cisco@xs4all.nl>, <ping-hsun.wu@mediatek.com>,
	<daoyuan.huang@mediatek.com>, <moudy.ho@mediatek.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <kernel-janitors@vger.kernel.org>,
	<sunke32@huawei.com>
Subject: [PATCH 3/3] media: platform: mtk-mdp3: fix error return code in mdp_vpu_dev_init()
Date: Fri, 2 Sep 2022 16:58:20 +0800
Message-ID: <20220902085820.3777360-4-sunke32@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220902085820.3777360-1-sunke32@huawei.com>
References: <20220902085820.3777360-1-sunke32@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600010.china.huawei.com (7.193.23.86)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_014719_933261_2E17454A 
X-CRM114-Status: UNSURE (   7.26  )
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

If mdp_vpu_shared_mem_alloc failed, mdp_vpu_dev_init should return -ENOMEM.

Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
Signed-off-by: Sun Ke <sunke32@huawei.com>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
index 9f5844385c8f..078040b7f65e 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
@@ -175,6 +175,7 @@ int mdp_vpu_dev_init(struct mdp_vpu_dev *vpu, struct mtk_scp *scp,
 	mem_size = vpu_alloc_size;
 	if (mdp_vpu_shared_mem_alloc(vpu)) {
 		dev_err(&mdp->pdev->dev, "VPU memory alloc fail!");
+		err = -ENOMEM;
 		goto err_mem_alloc;
 	}
 
-- 
2.31.1


