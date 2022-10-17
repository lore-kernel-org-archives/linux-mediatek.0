Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0F5C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 03:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Efailv/xjkaigAZrpIJnkhxi0EwRUxgFmGz2LSpslaM=; b=i+KSzN2u7ZCjlyHkN0BzcO7Lzn
	3byxeCl9F0etl6j1//ZZk7tjTr3ZrS+sSue5NwshuXIup5DU8wL5f3aqLS/YXQ2s8z/0gtDSkW2CS
	y0RssI1sjDwaJQixPfKL+Cqv3IW74VJmRN9V6x3225p7fX0O8qN/u3Nx1IhuuiV3J6Qbq4FidxGc8
	/XjIqS2KsAsWxv+PBGXQFC1KpROtmblgpP9j5DIRoEwkFcQxLo9CY8DtlB515lT021wg5QAb1LWEf
	ctnry0hZcMWFd34IWFHAcwa5+EU62hjdSX52Kntdy+2eRnZuTQMh/9IhZNfEtOPADc/w3jk5qtp9V
	TFBRLSMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okHBW-006fqu-7T; Mon, 17 Oct 2022 03:53:02 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okHBQ-006fiL-M6
	for linux-mediatek@lists.infradead.org; Mon, 17 Oct 2022 03:52:58 +0000
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MrNPB5rHwzHvdQ;
	Mon, 17 Oct 2022 11:52:46 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 11:52:37 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 17 Oct
 2022 11:52:37 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-mediatek@lists.infradead.org>, <netdev@vger.kernel.org>
CC: <nbd@nbd.name>, <davem@davemloft.net>
Subject: [PATCH net 0/3] net: ethernet: mtk_eth_wed: fixe some leaks
Date: Mon, 17 Oct 2022 11:51:53 +0800
Message-ID: <20221017035156.2497448-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221016_205256_926158_9A0AEA1E 
X-CRM114-Status: UNSURE (   6.32  )
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

I found some leaks in mtk_eth_soc.c/mtk_wed.c.

 patch#1 - I found mtk_wed_exit() is never called, I think mtk_wed_exit() need
           be called in error path or module remove function to free the memory
           allocated in mtk_wed_add_hw().

 patch#2 - The device is not put in error path in mtk_wed_add_hw().

 patch#3 - The device_node pointer returned by of_parse_phandle() with refcount
           incremented, it should be decreased when it done.

This patchset was just compiled tested because I don't have any HW on which to do
the actual tests.

Yang Yingliang (3):
  net: ethernet: mtk_eth_soc: fix possible memory leak in mtk_probe()
  net: ethernet: mtk_eth_wed: add missing put_device() in
    mtk_wed_add_hw()
  net: ethernet: mtk_eth_wed: add missing of_node_put()

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 17 ++++++++++++-----
 drivers/net/ethernet/mediatek/mtk_wed.c     | 15 ++++++++++++---
 2 files changed, 24 insertions(+), 8 deletions(-)

-- 
2.25.1


