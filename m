Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FC5ECAAD5
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 08:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LpGVPj8CIK19EfZu5dXGNSqeOrOuTWBx1oS8prwzieA=; b=rM4pkoT3oqhVKLqpgAKm8fwkHK
	wHbH561StM0iL5aso3x4tsCJUvsdOxqbMkphDu4+s0YIkFKbPSJUpZ9Qa363tboBMf0leGiVLadRD
	UkZi/rNAp8xxvIaSBkRHoUQR8ScgktxvXUEgCRQ2sZJcDtlmDiZCJMlfj/2Buere/dlOgSNWiEl4s
	MdOl+AlKBazMYZDcKWj/JmlHwzhEvbkjPAf8puI3gAYTXCp1h8h1rsM/LAYT4TVE0zLL1ml7gdLQ/
	X7dzhaRXvdJn019ROlPOpy4FEKMqr6D8q1jeOaNXQMlE4SecyCWGlVboLvnOn7YKRII3SKGNTsqP9
	PwGZ2KIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU2Md-0026s8-Sx; Fri, 02 Sep 2022 08:49:23 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU2Kf-0024af-Rp; Fri, 02 Sep 2022 08:47:23 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MJrzQ0ZZ9zkWsf;
	Fri,  2 Sep 2022 16:43:30 +0800 (CST)
Received: from kwepemm600010.china.huawei.com (7.193.23.86) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 2 Sep 2022 16:47:12 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600010.china.huawei.com
 (7.193.23.86) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 2 Sep
 2022 16:47:09 +0800
From: Sun Ke <sunke32@huawei.com>
To: <mchehab@kernel.org>, <matthias.bgg@gmail.com>,
	<hverkuil-cisco@xs4all.nl>, <ping-hsun.wu@mediatek.com>,
	<daoyuan.huang@mediatek.com>, <moudy.ho@mediatek.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <kernel-janitors@vger.kernel.org>,
	<sunke32@huawei.com>
Subject: [PATCH 0/3] three fixes for mtk-mdp3
Date: Fri, 2 Sep 2022 16:58:17 +0800
Message-ID: <20220902085820.3777360-1-sunke32@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600010.china.huawei.com (7.193.23.86)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_014722_090905_08DD4518 
X-CRM114-Status: UNSURE (   6.88  )
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

three fixes for mtk-mdp3

Sun Ke (3):
  media: platform: mtk-mdp3: use devm_kfree to free memory allocated
    with devm_kmalloc()
  media: platform: mtk-mdp3: fix PM reference leak in
    mdp_comp_clock_on()
  media: platform: mtk-mdp3: fix error return code in mdp_vpu_dev_init()

 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c | 7 ++++---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c  | 1 +
 2 files changed, 5 insertions(+), 3 deletions(-)

-- 
2.31.1


