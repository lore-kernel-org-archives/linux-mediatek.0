Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E1FECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Sep 2022 17:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V8cFt74Itf7nKgT8JgFtdjDOe6HoLM0N8rLEJTeOggA=; b=ycp6K620IcAbi0lMxhCOxz/AGI
	re9XkvLv2x6PD/lFzV86qPMM5eZPvLtF31ilS58mPNpLcftO52q1D6ZpUyKUb7p+YnxCVWviMJBqU
	PazT9EgljFsZelAvWL8QPVs1ZEp1gseWqaNFe3nllq9gGs918OUF2l9YMxhabetYfvK7Z1fVN3Dc1
	Ws8iVwcmDHyTU123yuQspPrtu8oyFIpcHw9l6xGqBoDd48z7/t9HJcnt10fo+rMZ6sZF+ox7a1YD/
	OzqkS/5MD7Iq3YK2ajLrA1gfvt0M4K2bpwpVSSikjtKwe0oBalaPw/W4jxnmsDN19Q8iG+0aGUiJs
	fLmLX2SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVGMb-00803N-56; Mon, 05 Sep 2022 17:58:25 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVBR1-002Pud-Ew
	for linux-mediatek@bombadil.infradead.org; Mon, 05 Sep 2022 12:42:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=V8cFt74Itf7nKgT8JgFtdjDOe6HoLM0N8rLEJTeOggA=; b=MwtuOcNaIaV/YRWgqusQc8oyKG
	cH7LS9oJW4SatVWFWvodQRgnR9sGaQX/yYUew90/9RZIJyvI0fSQlHi7gW+YB+WptIS/jt/lB+7Fv
	JM4Rm//QvZWx0CbxnI8vX7Ir/e1ZvrccrdjoapNkyhVTuhFPsnDGkJRw6xZ9Tg+k8yR6mCsDC7KTp
	eRrBgiX+bkUGoeSts/NZLHn5kKuYgF2mS6G3pufuUPg6hLrNNyKhYsKNqmGSGvltMvOvw3h4fEmS8
	B3O816rLh/cHkEaWSR6sGu+ZktUHwWd3XtKZPlFo7Os56Iu/43vV6HXAabxpk3Hgfmh0Kt5tcjLBs
	iBpJAXHQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVBQy-009cb6-3x
	for linux-mediatek@lists.infradead.org; Mon, 05 Sep 2022 12:42:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BF979611EC;
	Mon,  5 Sep 2022 12:42:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D98EC433D6;
	Mon,  5 Sep 2022 12:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662381719;
	bh=A3Dk0C+/NFeEaI2QcQ57zIr68Wf8F5QyJBIX1DLuFNo=;
	h=From:To:Cc:Subject:Date:From;
	b=HVS+cN1ij3/dhZkBHIa89J/DU9v5eXplWO4sWk3ELS/TNY0AHROe7VILJiZnbNV1s
	 ol/18k4MVqNpvgL/toMIbS3vnMBun9CvAs3/kIrODGCE0/naGxPwiE5twEt5e1hxFA
	 NRP/1IY1yojgWfKl8QnCaPdOeSvrhbh1OKHhW1CUltRW+lbQg7DR0C7F7d4h1PmX8d
	 Bl6IBunhPz/7gOp4L4cGLARR8n4D+4Jiw9TCl9Artx7h5sZPvrOZ3YfMkM2Ba0Rad1
	 7LwCK/KnA8PdQYtQXW0HkBoEQyvkB2aMMDrZ+Ex+C+MJGDS2Rha2ytRSMJsdqZPkpG
	 6Sey3CPHtnqNw==
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
	lorenzo.bianconi@redhat.com
Subject: [PATCH net] net: ethernet: mtk_eth_soc: check max allowed hash in mtk_ppe_check_skb
Date: Mon,  5 Sep 2022 14:41:28 +0200
Message-Id: <b9f18ec4dd40d53b401a1b9935999bf025f3357d.1662381450.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_134236_369463_3D98BB0A 
X-CRM114-Status: UNSURE (   9.85  )
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

Even if max hash configured in hw in mtk_ppe_hash_entry is
MTK_PPE_ENTRIES - 1, check theoretical OOB accesses in
mtk_ppe_check_skb routine

Fixes: c4f033d9e03e9 ("net: ethernet: mtk_eth_soc: rework hardware flow table management")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_ppe.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.h b/drivers/net/ethernet/mediatek/mtk_ppe.h
index 1f5cf1c9a947..69ffce04d630 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.h
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.h
@@ -293,6 +293,9 @@ mtk_ppe_check_skb(struct mtk_ppe *ppe, struct sk_buff *skb, u16 hash)
 	if (!ppe)
 		return;
 
+	if (hash > MTK_PPE_HASH_MASK)
+		return;
+
 	now = (u16)jiffies;
 	diff = now - ppe->foe_check_time[hash];
 	if (diff < HZ / 10)
-- 
2.37.3


