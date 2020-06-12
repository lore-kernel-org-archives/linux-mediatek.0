Return-Path: <SRS0=I3u4=7Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D96CC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2020 18:30:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAF3B207ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2020 18:30:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VV9nc+L1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="KAxePdCY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAF3B207ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uP5Gd9i+XacIqFbNC2zCuA6SegslLqXe+5B+W/X9RsQ=; b=VV9nc+L1H/CT68
	fXwQq6s0vclnT8v6wPv8OjSAXOQ6gXUT7KzjS7Q8/U+mYf+85KhUxjZaERjCfI9+Hbe+qvqA2vh6M
	feReC/gGbwcfz9SKRnimSMStATRvDTB2STmCIQ7LjPHsKkqBzSrxIcGu9mAjbwY3Lfqs1W6GWvN7T
	Y+qAS5APuLBgOizWtbU+3nCWzBsl/EuBUk8BhOChFix2VbOje+CWhN69VuCmzBrtAfp0x0Adra4eW
	iYKV5Y6MMOsZJyJ/65eAUeeWRk+1e3SpiHgg3YawjaU4m/LMO8Zb03ZRLp+X7wZoNC1/xP0ocJCO9
	scHF2TFuNJgvNbH6iNPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjoRk-0001nK-AJ; Fri, 12 Jun 2020 18:30:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjoRi-0001mH-Cb
 for linux-mediatek@lists.infradead.org; Fri, 12 Jun 2020 18:30:31 +0000
X-UUID: 8a89546bb6d1497081a203401e49b5a8-20200612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=DR/QwOiy7DR8h4Z/9L2Jab/8wPEsmQ3UrzfyTt+17nU=; 
 b=KAxePdCYKUHPDIc+iFQixKHs/NcJU+Wi9pJNJZasJbZRws8zuOKbt+lBwf+5wzXcln2SJLLtgELJlmWuxDLOE1UFC/uqYOtgCmBPYtFDqUAH6WkR6iG8x0ANdJUPtZeVjgR0yzz567A3wT24/gmba0m+c65QVQRXNJzBGxqW+AM=;
X-UUID: 8a89546bb6d1497081a203401e49b5a8-20200612
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 809583795; Fri, 12 Jun 2020 10:29:55 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Jun 2020 11:30:23 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 13 Jun 2020 02:30:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 13 Jun 2020 02:30:09 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v2 1/3] mt76: mt7915: add missing CONFIG_MAC80211_DEBUGFS
Date: Sat, 13 Jun 2020 02:30:08 +0800
Message-ID: <2863c9a7e14c791202738597184f4a6b75d5bc07.1591983283.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 497600C2256EF5EB818657D376B1AF7AA6C69D695361B82EAFC67C6E4542F0CC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200612_113030_429342_C7EA1D56 
X-CRM114-Status: UNSURE (   5.28  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@mediatek.com>,
 linux-wireless@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add CONFIG_MAC80211_DEBUGFS to fix a reported warning.

Fixes: ec9742a ("mt76: mt7915: add .sta_add_debugfs support")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index 5278bee812f1..7e48f56b5b08 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -384,6 +384,7 @@ int mt7915_init_debugfs(struct mt7915_dev *dev)
 	return 0;
 }
 
+#ifdef CONFIG_MAC80211_DEBUGFS
 /** per-station debugfs **/
 
 /* usage: <tx mode> <ldpc> <stbc> <bw> <gi> <nss> <mcs> */
@@ -461,3 +462,4 @@ void mt7915_sta_add_debugfs(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	debugfs_create_file("fixed_rate", 0600, dir, sta, &fops_fixed_rate);
 	debugfs_create_file("stats", 0400, dir, sta, &fops_sta_stats);
 }
+#endif
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
