Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4F4C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Nov 2021 11:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qxSze7SfW5xtQePB/JsSsnOOtLUxEo5IbMDejoQdPjE=; b=ezsCPZw4MYIkTZ
	9KM3QEY0BKMW1T/KdDPjcgvkS/FAVLi0e9vDVLcYt0iXMRFtgjqEqeGOkKNuqBWY0v6hZypyGJR73
	K0Z93FB5YV1M+tMSf0YXVjx8djnt2a3slhHPIq1Px6YfqtEz5knFV4wetojpF3P/bUSP2wlET/BKN
	/NB8U1l3nic+lACUuQDMFe+wk/ahxK8QCqabjoRUvd4wYUwmwFBWnOFTiVeE/B5c/PRVveHpVKfo8
	ntGtH48B9sChnmcMl/zkAcHwc/vNMLfKXrAMZB0LI1QXi1a4OA45TxuC7KFWTbob/c8capvK+Hib6
	/heGTMsX69Y7J/LaEukQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp7m7-00G8QP-KV; Mon, 22 Nov 2021 11:46:19 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp6oA-00Ftut-3d; Mon, 22 Nov 2021 10:44:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dafna) with ESMTPSA id 0363E1F4481E
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637577860; bh=F0sCdl4LDNPsiVCBcFYo9Yve0hPNTO3tV9OSCtyVJ0I=;
 h=From:To:Cc:Subject:Date:From;
 b=Zhi4XWr0K4DNHK96YKsypStuWryd8MzOuLDyqiTHpBOUNhQCdttlcrDn9Z6OouRi2
 z8roA8RsKtPHY5rX5Il0X+DFtSsqKMkKY79ObzmJRIrldMCtDz2dhrpsVa2OE+WNB+
 +fonn97A7iFt6bTUfZzXWpUiYuC25UgHqxlATT3KgoE9tw8ghza/FRUMOrW6ypRMyU
 tapUzyO7PBNLjHzPo7oXv24zVZzXdo2L5J/Zl2AlKDBsuWIE9k5oQQAnXRJQDX6AFH
 okCkKXu1oue8Nhlc0boh6vAu6t1qLGUqiKuGbslKk79gQcoBPMlpTAP2q4pnJu5JHF
 RlLd6ovtDB2LA==
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: iommu@lists.linux-foundation.org
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, kernel@collabora.com,
 Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org (moderated list:MEDIATEK IOMMU DRIVER),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-kernel@vger.kernel.org (open list), linux-media@vger.kernel.org,
 sebastian.reichel@collabora.com
Subject: [PATCH 0/2] iommu/mediatek: fix tlb flush logic
Date: Mon, 22 Nov 2021 12:43:58 +0200
Message-Id: <20211122104400.4160-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_024422_371557_14F66366 
X-CRM114-Status: UNSURE (   8.76  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Often devices allocate dma buffers before they do
runtime pm resume. This is the case for example with v4l2
devices where buffers are allocated during 'VIDIOC_REQBUFS`
and runtime resume happens later usually during 'VIDIOC_STREAMON'.
In such cases the partial tlb flush when allocating will fail
since the the iommu is runtime suspended. This will print a warning
and try to do full flush. But there is actually no need to flush
the tlb before the consumer device is turned on.

Fix the warning by skipping parital flush when allocating and instead
do full flash in runtime resume

This patchset is a combination of a patch already sent in a different
patchset: [1] and a warning fix from Sebastian Reichel

[1] https://lore.kernel.org/linux-devicetree/20210923115840.17813-13-yong.wu@mediatek.com/

Sebastian Reichel (1):
  iommu/mediatek: always check runtime PM status in tlb flush range
    callback

Yong Wu (1):
  iommu/mediatek: Always tlb_flush_all when each PM resume

 drivers/iommu/mtk_iommu.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
