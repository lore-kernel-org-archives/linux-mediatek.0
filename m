Return-Path: <SRS0=3MyJ=C3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0000C43465
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 02:26:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D05723600
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 02:26:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gRsLXjKU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zH/WIS7S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D05723600
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9sloXd1VodcUonziPhTSV3JebrMKF99W9QtdfSMAGQM=; b=gRsLXjKU87mSrr5RhAC91ILBA
	GLC6yufliwt3dvLrXoym+M1w/eQaDXpfeaVlNzUP5hwJRY+ycYQyI1XD9Fs4RlSK/Vf9AaC+bIEz+
	RtMc0ns+0JOpQoApyOVbd2NCSyb0B6z15yLEG9IO9Oj6GNHKNEPuDBsx8sbUaPhN2PtrVEaEOx64s
	nsF+i+BG7uB2E4jBU1vKTFN65/BszMgwfCRHxEPYYDgJqVsFc1nGF3cQCeI+SfykPKLwdqcYjlCiX
	xVtrJmA7hxkwS2ZktXFFSbE0pvoV8sUWJ/XcH3i9QS+v8cmjbV56w9setWJRbOu3IOck8kUElhutE
	u0bk10mTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJ65t-0005aj-56; Fri, 18 Sep 2020 02:25:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJ5qI-0005yr-2M; Fri, 18 Sep 2020 02:09:45 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 792892395C;
 Fri, 18 Sep 2020 02:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600394979;
 bh=lQcexyaZjXVoeH73AvKNhcfC2KEiQeqKqtVo1iyGMso=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zH/WIS7SM34UKClyiA23KA3J5ftMBEyZFTlAqWWEc75GnD5c3zYH/aXLfUIiWa2cr
 4fNRnH8brTv01Zn9MdniDMZStblswAehMHFgvTlEaG3qA6beaxJqPOGPN9258pLdmG
 Fx3hsvkLSgwhEk2ibDa3NVATE6MJIj93o/Dh8wN8=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 079/206] mt76: clear skb pointers from rx
 aggregation reorder buffer during cleanup
Date: Thu, 17 Sep 2020 22:05:55 -0400
Message-Id: <20200918020802.2065198-79-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918020802.2065198-1-sashal@kernel.org>
References: <20200918020802.2065198-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_220943_121656_5842023F 
X-CRM114-Status: GOOD (  11.86  )
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
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Felix Fietkau <nbd@nbd.name>

[ Upstream commit 9379df2fd9234e3b67a23101c2370c99f6af6d77 ]

During the cleanup of the aggregation session, a rx handler (or release timer)
on another CPU might still hold a pointer to the reorder buffer and could
attempt to release some packets.
Clearing pointers during cleanup avoids a theoretical use-after-free bug here.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/agg-rx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/agg-rx.c b/drivers/net/wireless/mediatek/mt76/agg-rx.c
index d44d57e6eb27a..97df6b3a472b1 100644
--- a/drivers/net/wireless/mediatek/mt76/agg-rx.c
+++ b/drivers/net/wireless/mediatek/mt76/agg-rx.c
@@ -278,6 +278,7 @@ static void mt76_rx_aggr_shutdown(struct mt76_dev *dev, struct mt76_rx_tid *tid)
 		if (!skb)
 			continue;
 
+		tid->reorder_buf[i] = NULL;
 		tid->nframes--;
 		dev_kfree_skb(skb);
 	}
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
