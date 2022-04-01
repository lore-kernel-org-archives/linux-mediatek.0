Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A724DC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Apr 2022 14:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XtOoNXEZjw+oisLSFbK6iDstSb5mRn2KKUBj9zCN8jw=; b=lgpiEWN81KoQeB
	h3Rvl4bm2lR1kAQ/PYHfpATsPR0Fzk+UIBinyZar0l+ECWmwrp48hJhV05Zf/60VEjh85BtVUnQ8U
	PUC8Xjo/h7xCdBfXEA7m+UgBiDS4GEx08c5f6GdoUSnuVRF63sTl18/LYMCjJSE96+aoVlMDeCc5g
	sa6ucRbkksPI5f8oUu9b/cRnz5p5qrSoNvykl0xzlsBwA5qJeMGJZgFucsy4k9EIHVO0QEFr3/mSg
	PMGNss76fZEbEWh2YrCOVwhWVFUftXuX6Qe8WlrJcFx5Pf1HAOBzafqqhgJpX6s7uCpzOPq66FkTm
	naKJyzldGmAO5AMVpRZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naIYQ-006CF8-1o; Fri, 01 Apr 2022 14:47:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naIQO-0067xC-T9; Fri, 01 Apr 2022 14:38:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0BC7C60EAA;
 Fri,  1 Apr 2022 14:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91837C340EE;
 Fri,  1 Apr 2022 14:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648823931;
 bh=ThPeycLj+4C+6ieQIJwKgxtTuow7S0mzR6CtjXU1XN4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hNHn7J4Vo6xFK8Gh0ZOV0lIh9/GMPMe2oINeWOq0XmuomjojTlo14JFzTCKuHYWQo
 em4+ftMoruT8nIOartKG4gnjgh0ByOuWp9V8YCZwv2O09ZTYjdLSY58XoHL7tXfvoR
 KvvfF4stSMyNu6WKa6C9ty82mbC8l8CGB9ZsbfJJaJ523XfHRXjWqQxmTg1EMURdWX
 2/KhFtPmdUk9KGbhq7kovf9V65W/OkkcW7rOz25R0zAPF/vSHxwsh+MT/mwx35Vee3
 78zL77XYIp0e5WgyoBqxiyFeieCQone8mTLnt8Rm9NTGHuMAeWvcaf+sFtPp1U3hPG
 4FTQirmpE+Pfg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ben Greear <greearb@candelatech.com>, Felix Fietkau <nbd@nbd.name>,
 Sasha Levin <sashal@kernel.org>, lorenzo.bianconi83@gmail.com,
 ryder.lee@mediatek.com, kvalo@kernel.org, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 sean.wang@mediatek.com, deren.wu@mediatek.com, johannes.berg@intel.com,
 YN.Chen@mediatek.com, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 23/98] mt76: mt7921: fix crash when startup fails.
Date: Fri,  1 Apr 2022 10:36:27 -0400
Message-Id: <20220401143742.1952163-23-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401143742.1952163-1-sashal@kernel.org>
References: <20220401143742.1952163-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_073853_048256_B7685D73 
X-CRM114-Status: GOOD (  12.31  )
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

From: Ben Greear <greearb@candelatech.com>

[ Upstream commit 827e7799c61b978fbc2cc9dac66cb62401b2b3f0 ]

If the nic fails to start, it is possible that the
reset_work has already been scheduled.  Ensure the
work item is canceled so we do not have use-after-free
crash in case cleanup is called before the work item
is executed.

This fixes crash on my x86_64 apu2 when mt7921k radio
fails to work.  Radio still fails, but OS does not
crash.

Signed-off-by: Ben Greear <greearb@candelatech.com>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7921/main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 9eb90e6f0103..30252f408ddc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -224,6 +224,7 @@ static void mt7921_stop(struct ieee80211_hw *hw)
 
 	cancel_delayed_work_sync(&dev->pm.ps_work);
 	cancel_work_sync(&dev->pm.wake_work);
+	cancel_work_sync(&dev->reset_work);
 	mt76_connac_free_pending_tx_skbs(&dev->pm, NULL);
 
 	mt7921_mutex_acquire(dev);
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
