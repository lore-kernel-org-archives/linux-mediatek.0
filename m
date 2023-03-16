Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8D2C6FD19
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Mar 2023 08:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bOOIshCP1zNTWbWkarp9zgBkOxXqTVrIhTIWBY+s2ew=; b=xnU0gbtknHWXS+oENO0o1oYQE2
	zvku8ALHOwdrw59nUTG3+45jzhrh7H5/n/cObmswuEvqXbhkJ+i5JGd+am5bxS0RFImcwLiQwaUF+
	wH85q/aplotQ4cLCUyjWaCbxVKbsdWcvBOO9oV9tm+eUdewlks4Iuwazrh0752mMDAjsFqiNKmaoy
	SxAYoGCdgvCbcfWt45P16GGWQvJ22adpfysAv/p1dRsvjmotHSUx1GAU+kfybmCmAJqRBQ1hlCkWe
	lMrnDN/Qu9wMd5QUXcBggSQ92tlKe4EAV9sRUpuf/Ymssy4c71xfhu62RhRrnTfXRts/Irl3ZdClz
	5hipg+Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcj9s-00Fh6h-0U;
	Thu, 16 Mar 2023 08:40:24 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcj9n-00Fh4C-0o;
	Thu, 16 Mar 2023 08:40:22 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046056;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0VdzyBoc_1678956012;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0VdzyBoc_1678956012)
          by smtp.aliyun-inc.com;
          Thu, 16 Mar 2023 16:40:13 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: andersson@kernel.org
Cc: mathieu.poirier@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] remoteproc/mtk_scp: Fix one kernel-doc comment
Date: Thu, 16 Mar 2023 16:40:11 +0800
Message-Id: <20230316084011.99613-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_014019_480448_D8E867D1 
X-CRM114-Status: UNSURE (   7.34  )
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

Fixs the function name in kernel-doc comments to clear the below
warning:

drivers/remoteproc/mtk_scp_ipi.c:136: warning: expecting prototype for scp_ipi_lock(). Prototype was for scp_ipi_unlock() instead

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4544
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/remoteproc/mtk_scp_ipi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
index fc55df649b40..9c7c17b9d181 100644
--- a/drivers/remoteproc/mtk_scp_ipi.c
+++ b/drivers/remoteproc/mtk_scp_ipi.c
@@ -125,7 +125,7 @@ void scp_ipi_lock(struct mtk_scp *scp, u32 id)
 EXPORT_SYMBOL_GPL(scp_ipi_lock);
 
 /**
- * scp_ipi_lock() - Unlock after operations of an IPI ID
+ * scp_ipi_unlock() - Unlock after operations of an IPI ID
  *
  * @scp:	mtk_scp structure
  * @id:		IPI ID
-- 
2.20.1.7.g153144c


