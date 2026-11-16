Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE8D606A893
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 11:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Aivpkpm9;
	dkim=temperror header.d=stu.xidian.edu.cn header.i=@stu.xidian.edu.cn header.a=rsa-sha256 header.s=dkim header.b=w1m941Lq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iDn5Jwu6eLfZdF3r4ltGaB9NYIzcoHuDEBvIkhPKqmo=; b=Aivpkpm9ks7MS5
	/ZjqQolppAu/ZlX4/cF/l4aS8gWoyqiOiYolnLRfm9LBqrpvAOG+1/zUqErtHksGDbJoLQ7z2uZ6t
	0ZWUGltwMSV/ori76RVLopCWVAtPmVqA3f8BZXIjXSQuXgZWriZEaf6kiPOMvbLVTodPpv2geEsrC
	jFQBxKd9VDeunzY/C+cJ06M5P4BDa5nB+O99Nv/p91V6oObOddsgIIKCaUBsbTgo8LilklIWwVbCm
	CBqT1hoQKJLAhqj6T0HJgQkY9E9o1UjH7MYf1JcypWpzersT3MMv3Pis3Dt2q+bCnC5rWTBr7j9kl
	3Mnh+q6DIyZPSpYUOscA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvEk-00000002F1n-4B0B;
	Mon, 16 Nov 2026 11:51:03 +0000
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvEV-00000002Etu-2cqZ;
	Mon, 16 Nov 2026 11:50:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.xidian.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=iDn5Jwu6eLfZdF3r4ltGaB9NYIzcoHuDEB
	vIkhPKqmo=; b=w1m941Lq9P5U3BxeLvEhVlBq3jFmBl7Mp2sx0VjMt2N7cfccMA
	FqhVNIKOROfLp1i4BY3mcO78X1zJgpuIuZIfwjJP7RIzKi+hDmkUit5A5Ju3RD2v
	QrBqPleM+ZFm237NwimvLNaTKlfNKaxLR05Vmj0RSHfamXEYO0hMxxtbs=
Received: from user-virtual-machine.localdomain (unknown [113.200.174.41])
	by hzbj-edu-front-2.icoremail.net (Coremail) with UTF8SMTPA id BLQMCkB2vwQF7vpqZ6S3AQ--.3956S4;
	Mon, 16 Nov 2026 19:50:41 +0800 (CST)
From: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
To: Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <mbrugger@suse.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bin Yu <byu@xidian.edu.cn>,
	Cheng Wen <wencheng@xidian.edu.cn>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH 2/2] wifi: mt76: mt7615: fix NULL pointer dereference in mt7615_get_status_freq_info
Date: Mon, 16 Nov 2026 19:50:28 +0800
Message-Id: <20261116115028.2766-3-25031212351@stu.xidian.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116115028.2766-1-25031212351@stu.xidian.edu.cn>
References: <20261116115028.2766-1-25031212351@stu.xidian.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: BLQMCkB2vwQF7vpqZ6S3AQ--.3956S4
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrW3Gw1xWFy5uFyxJr4xJFb_yoW8ZrW7pF
	WDG3yjk3yDGF4DCa95Cw17C345uan8KrZxCr909w1rZ3WkZr1FyFsFvayjqrnYyrZ2kr1x
	Ar9rtFyakFW5uaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQjb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280
	aVCY1x0267AKxVWxJr0_GcWlnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcV
	AaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0E
	x4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI4
	02YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCF
	x2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
	v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
	67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2
	IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jOkucUUUUU=
X-CM-SenderInfo: ysvqjiysrsjkur6v33wo0lvxldqovvfxof0/1tbiAgUTD2r5zUjNkAAAsQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_035048_909571_6DD402B2 
X-CRM114-Status: GOOD (  10.64  )
X-Spam-Score: -2.4 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mt7615_mac_fill_rx() starts processing received frames as soon as
MT76_STATE_INITIALIZED is set, which happens while the device is being
initialized, but mphy->chandef.chan is only assigned once mac80211
configures a channel. A frame that arrives before that, while the phy
is neither scanning nor doing a remain-on-channel operation, makes
mt7615_get_status_freq_info() dereference a NULL channel:

  general protection fault, probably for non-canonical address
  0xdffffc0000000000
  RIP: mt7615_get_status_freq_info
  Call Trace:
   mt7615_mac_fill_rx
   mt7615_queue_rx_skb

Only report the configured channel when one is available and derive the
frequency from the RX descriptor otherwise.

Fixes: fcdfc29e58ee3 ("mt76: mt7615: introduce hw scan support")
Cc: stable@vger.kernel.org
Co-developed-by: Bin Yu <byu@xidian.edu.cn>
Signed-off-by: Bin Yu <byu@xidian.edu.cn>
Co-developed-by: Cheng Wen <wencheng@xidian.edu.cn>
Signed-off-by: Cheng Wen <wencheng@xidian.edu.cn>
Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 86c6b443ef71..b6256226b605 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -199,7 +199,8 @@ static void
 mt7615_get_status_freq_info(struct mt7615_dev *dev, struct mt76_phy *mphy,
 			    struct mt76_rx_status *status, u8 chfreq)
 {
-	if (!test_bit(MT76_HW_SCANNING, &mphy->state) &&
+	if (mphy->chandef.chan &&
+	    !test_bit(MT76_HW_SCANNING, &mphy->state) &&
 	    !test_bit(MT76_HW_SCHED_SCANNING, &mphy->state) &&
 	    !test_bit(MT76_STATE_ROC, &mphy->state)) {
 		status->freq = mphy->chandef.chan->center_freq;
-- 
2.34.1


