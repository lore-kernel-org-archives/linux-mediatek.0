Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25655C352A1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 14:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eY8P9OwatxqS6QHbzAvbE9XUfgWY+rrKHUdKDn/g410=; b=zJzKk7W2VzyvzK1mKRjsWtzq6D
	gG5DjxZHvvZgQRqjvLAsFye3bOzjRGKXcR2eLjntfCsmumBEYHzfuV2/KIZr+KWAPfvzThMoxEJEZ
	E5ZZBGaN2ViPm9xn5TuyWyz0jMAlJxxhoxNJPwbN0s8CZSg0L6Eu0c8gawwqMa+sySXrHTxHG3K+D
	e2GMzGfQ8/1xmLgUEjrqLiBn2afrCGt7lj6c8j/F4SLpd06erEqc1uALyYu2b7P9LJnH6OXXt8D3n
	xEzWSX5tWEuAcqp0rMZujVdSpJtZ9t3PrmLipOQJzy/EQ5s50VBfGj4xSL+/CPqAL4OHU87jNbgYw
	YcB+tOpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2v3J-004SRZ-HV; Wed, 07 Dec 2022 14:05:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2v3F-004SFe-ML
	for linux-mediatek@lists.infradead.org; Wed, 07 Dec 2022 14:05:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D8A5761967;
	Wed,  7 Dec 2022 14:05:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C46C433D6;
	Wed,  7 Dec 2022 14:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670421930;
	bh=tk8utmezOtdizzCIxzZGRejLD+Uzjwoe5RBptBuevsw=;
	h=From:To:Cc:Subject:Date:From;
	b=bUkQeV27Si8FU4OixZdGd1V+seLWc8uDGu/wajrQRYEC94sP3+xvc8Tcw4kbnsN7S
	 PKDSp4uq+G/Cd1LbDkj/RdvXsOXAy7Ub/nHtrCZUFZj1ZW9sEwoMLF/p3jwdQzYjZU
	 CSibi3L4PQ3LbFtUjhi1aG7qZlp6NTjKEeNTfcBt2lisI9IEdrw8Ec8mtRbUNzBwz6
	 ezeRuekg7SUgcFpPFf9trpYY6rBJg+Z7h6aQ8V6bf71JmSn+mSQg8GbDiiwNd7mKlD
	 mO24NNFQAb7WLhgVLQ81kMD9zIhRPGFpCjG1eISb7gnq6GD5rCPtJ+0hAsHlyIjZhf
	 merBWXBRlbWvQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	lorenzo.bianconi@redhat.com,
	leon@kernel.org,
	sujuan.chen@mediatek.com
Subject: [PATCH v3 net-next 0/2] fix possible deadlock during WED attach
Date: Wed,  7 Dec 2022 15:04:53 +0100
Message-Id: <cover.1670421354.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_060533_789600_15E48989 
X-CRM114-Status: UNSURE (   7.18  )
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

Fix a possible deadlock in mtk_wed_attach if mtk_wed_wo_init routine fails.
Check wo pointer is properly allocated before running mtk_wed_wo_reset() and
mtk_wed_wo_deinit().

Changes sice v2:
- add WARN_ON in mtk_wed_mcu_msg_update()
- split in two patches
Changes since v1:
- move wo pointer checks in __mtk_wed_detach()

Lorenzo Bianconi (2):
  net: ethernet: mtk_wed: fix some possible NULL pointer dereferences
  net: ethernet: mtk_wed: fix possible deadlock if mtk_wed_wo_init fails

 drivers/net/ethernet/mediatek/mtk_wed.c     | 30 ++++++++++++++-------
 drivers/net/ethernet/mediatek/mtk_wed_mcu.c |  3 +++
 2 files changed, 23 insertions(+), 10 deletions(-)

-- 
2.38.1


