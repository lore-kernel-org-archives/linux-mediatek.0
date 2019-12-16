Return-Path: <SRS0=XFYx=2G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA856C43603
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Dec 2019 13:19:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D15420665
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Dec 2019 13:19:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GtiS8qdg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D15420665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LWfxjRVxti13aDwFwIglUvniU2oO/OVsqNr1PLaZmUc=; b=GtiS8qdgc9ILCO
	DvtHRcHLzuZV65K1OCo5jv6gSOQAVtA40LY89GyHPWF5tNR7mZQe3s0OI4SvqbvA5R2FwChkXa0En
	8aGw6p6pbmaQiDgyYwbsJlBWwTquaDTRLi0lbQ59TN3fJqtL3GRNeSaf7G1uCJXTmWPfkcCvnRMu/
	kspM3AZLFLLvPjlBilcK6LToCfbMrz4gidFH+1NF/8QuEosnT7dcpFloRskqi8xVIGN5XS1JEeWvO
	lYQxDQpEjhJe3z27W/JNfLPp9YWvk83UZuBcqNIJDnoVL3d4SFo60EWU8q1WkyCh9CaZyfjs0VdwZ
	+/0/K6ZouhSe68WoG20A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igqHk-0005M8-Jp; Mon, 16 Dec 2019 13:19:40 +0000
Received: from mout.kundenserver.de ([212.227.17.10])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igqHc-0005FB-7c; Mon, 16 Dec 2019 13:19:33 +0000
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1Myb8N-1hmQPH0w85-00yyN5; Mon, 16 Dec 2019 14:19:06 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] mt76: fix LED link time failure
Date: Mon, 16 Dec 2019 14:18:42 +0100
Message-Id: <20191216131902.3251040-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:FfIXsVXcNeBt8DM3/oD14gV9AaEg1kuMd8THyqz4/RSYXt8bzol
 VT4nBhvNIR65oxPVAJBoQCx0Mg5xsmZZG4yY3iGDfIiztAFr9RRwyuwPZKCC1hP2Ebc2X1g
 FX+vENnYZfUQsOedDzvoVbIxv6rRVM10x3+jQQ75bdj2i/k+bC7y4tgiHPKrg398sgXI1Hk
 CLe6qn9H88bpgLmlWv4pw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iAZnidCZDMU=:WDeq3eS82GM9y63nrZiRmo
 3JUG+UEbatz6cBmivM2B7+tBfsLXMZPjHyLnrYgr8AQyO4VWAWkAXvdINXftuV1yV9kOT2rJu
 rFD+Nb3NkNJP8T0W6aM3QVe+3hkwqidu4Qhbd7gcSGqEBJEJ1wEmoI5q3AWpjo4SVRh8BY/n8
 1+v+yWdQEGSsYoAMpz0Q1pIWrsWpqQH59RXvBqCkFqpBg55DuFUvLAKZEnScfkj0zIDN9Sgh9
 y8edPkXPZocBM/alaots63k5Bc2TPiRiRqRs+U63biMkj68b47s3D6euxclI+ZalStQg9kw+t
 ltbSCk2Y5gaZ0nKKOX9lNNTof0DsU+auYJNy6RLT9k0pOwQ4VA2fXM1jzReLUS0jM/krpArf8
 uWGrdBr2/oEAAhhmoD7+dtqG+po7AwkTWOJYCDELxbGHPkKCDKPL7nOScNrIVqIO9hJA3XFwx
 OwY458CCIgKVJrBZKeI4EqLCmBs0J33fFkJcFCHjT1OWO8EBfmbv4nij7kY56kIynKxQRLJi6
 EbqKgPjtXCx92W+gDjbgHclBHuonNeSJXn1wm1FG2xglOPqs3qH5324sYq6NlZeehhTGpudYM
 gyV9UmJ+mEXBCI2NyjMtMLnyfRn72odkyFt6/CC82Lz4MCI3EKl8sWGx1y8G9G41Vj2GPmPUN
 pNjMciMVw6LVfiIKdJFboThBK+H2qcvbEszQ69sDfbLW3KUmmjMRmksX3R5XlgWcO/1lWCQnk
 h7NruKmPzsF471JVvfDsgChsoHsHBMUZQN3WT7y3wNhZtPFNmNa7aQovOOtyklkh7XhJHfyaJ
 nFkOl56Fng8tuNQkCDI+XFmo/EQGsS8UfUm8JRGCi1clYe0Kv1fT8B8zoCvK+9Wy7uvds+1QB
 fTcUteDG3KZFdJlzhPOw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191216_051932_566101_720A6A98 
X-CRM114-Status: GOOD (  10.71  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Stanislaw Gruszka <sgruszka@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Roy Luo <royluo@google.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The mt76_led_cleanup() function is called unconditionally, which
leads to a link error when CONFIG_LEDS is a loadable module or
disabled but mt76 is built-in:

drivers/net/wireless/mediatek/mt76/mac80211.o: In function `mt76_unregister_device':
mac80211.c:(.text+0x2ac): undefined reference to `led_classdev_unregister'

Use the same trick that is guarding the registration, using an
IS_ENABLED() check for the CONFIG_MT76_LEDS symbol that indicates
whether LEDs can be used or not.

Fixes: 36f7e2b2bb1d ("mt76: do not use devm API for led classdev")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index b9f2a401041a..96018fd65779 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -378,7 +378,8 @@ void mt76_unregister_device(struct mt76_dev *dev)
 {
 	struct ieee80211_hw *hw = dev->hw;
 
-	mt76_led_cleanup(dev);
+	if (IS_ENABLED(CONFIG_MT76_LEDS))
+		mt76_led_cleanup(dev);
 	mt76_tx_status_check(dev, NULL, true);
 	ieee80211_unregister_hw(hw);
 }
-- 
2.20.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
