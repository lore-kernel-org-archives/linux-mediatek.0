Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B65D358E4
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jan 2026 09:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DytMJO0WqVXchRW5Tcsc01QJ5SYiHM6gt4jb9e/3TBI=; b=E2wnNPIOjoo3EtAA/XA31KlJ5z
	W3WpKmGloSkKwfVgSeUdcZ3/YjHpO6FT2TqNX/ftbEreJbubFwg2d4fbmisjzf4F6XGJiWYGRPKIK
	u7EVqXTcpcL58fxBSyM3usdTxik9BNrTOGp05iXrAz2b4LNmLpgKO9Xj8NJwxDwXUUoCuZ0Dyiy2z
	gQtSbb0nWeiclnbMjXZeIOtKSowY0H9pMtE4qImm5H5luK50DCpqWN1aZTUo/B7WBb8uc8ZvGziY/
	xlBu11KXhCcRGMivfQR7mohfdNb2HFwESjSmeICH/v+yHCF5Ysi6gjsKaaT4h+y+OJdqxP6zZU4s0
	QV7cPImg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlNyt-0000000HUa3-1aNF;
	Thu, 29 Jan 2026 09:06:27 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlNyr-0000000HUZf-0tZF
	for linux-mediatek@lists.infradead.org;
	Thu, 29 Jan 2026 09:06:26 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-2b720bb90d0so735006eec.0
        for <linux-mediatek@lists.infradead.org>; Thu, 29 Jan 2026 01:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769677584; x=1770282384; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DytMJO0WqVXchRW5Tcsc01QJ5SYiHM6gt4jb9e/3TBI=;
        b=OFnDq3C7TXztrphtXkZr2iRyyt+Il/bRp1DzH134WlA5MqEnMJi9Hds6GRs+FTAGhC
         z+vfYFn2fvMoOAxOJ8331NdzqbF8qgacURz3sgQWyDlwhjJm+Em7p1tcQ6ZJzJz/gKPp
         stphQfHwVCKNPsFUaKdoG4wROEDfh3zseKxwG0xH1iHOAVBSbD9InDVud4+k1/7wDYu6
         90zB6Gt7z/ZfEVie0Tluumlc33rW0CL8CoMcWH9lxzmQdblwJ+hF84QxFo9pMoWTDL5D
         WcfvT3wbGBl5Fc2hjwk18HbJtpi8JmMmGNslZLIqlZRpp+rZqakD+dSZSMgHqgdHvjdG
         UeAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769677584; x=1770282384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DytMJO0WqVXchRW5Tcsc01QJ5SYiHM6gt4jb9e/3TBI=;
        b=s32IoBCfy+g9Zj7gxE+sNWi67uDtrilaoBmPfbufu5uvxZZz7wbHWEUTg0qwhG0rle
         fs9rruN7s3HCFVDwdBLednaiBmU37d1jCw0A22MzCmnyfz4QlGPkYQCpPRyESsZYdmC0
         53F0LQE6o7XiWCvE2VJFsC3ckXVZ+11ucajuuOgJdHQScI7ivOllzAnRNTJGBsPt756u
         1S+w6aT0t6fPmDaRYFj3FIQUnQyKQiPIxLhU+bc/0SQWgs71UDd+rfDOPrzUOwni6vrf
         beCjxsx88RRQprb0RscVWri8xofaPnYCjfcRVArvEFoFUGW4YPF/atvWW/k/15rv6CTu
         EuTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYg83YQZB0ka35hIS1QVlkMLD6VYe0bc3sETRLE6cbYR0Nnce67jiHT2OG7xWdiOG0hcNx6I4HJdp68VgJDg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ2pyx3oFMYeMtSlU6zSjHO8VL/VMAbZpKKv5X088tyJXLRVvf
	/lx25fA6FVAL+0c1RK+/IUB8phqpHoDVbUMm1iy6FC5FC1FnqO+SRvFB
X-Gm-Gg: AZuq6aKTsUMA6PmbU327hVpYZcrPCjGtGeW4ddJ7k5t36pcHuv8V+A25tQq4EHmzO4H
	ZsY5vh0Nbz0oB472RkBTRo6Sa5MPbvT5xYIhwiwwLud3LZ4JVaoYF3ZmtFANL51G+b5pZDZHjXX
	GjxNdw6knLipT59G3MYjm1t1GgpFylct6mkzMeoypisuDjY4rjoi3ygxaxgLKpjeb8fORAuynkY
	z9G1Ai2TSvpPM+5ClhUtFYTFSv8IN3n77TXZW8FRMiCqGqc9cjxYDW8bLQWjD4g1JxKfeEYLCI4
	n0iCf+r58IV8hXt9WwFpu7Akdj4RmSjw+NjEy50EyRXPCHTz1xxDl3iGeejSVDOU71TqFfG2Bsu
	zXNj9eRoelgdSPN+ej8lHl/BOqthkNLeM1fZfKKQZxUl+uZ7M8NWwCUgpmONl1WY/meYyp/WblD
	cGryfHiS/pyDxJbjkKsk3RWEBB5srflLlkb+iBqVrdPEglRTSqY9KcqKgCSCImWQ==
X-Received: by 2002:a05:693c:310e:b0:2b7:2551:502f with SMTP id 5a478bee46e88-2b78da5a1b0mr4292742eec.35.1769677583860;
        Thu, 29 Jan 2026 01:06:23 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:4a3c:9f7c:8037:90c1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1abe714sm6050559eec.20.2026.01.29.01.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 01:06:23 -0800 (PST)
From: Zac <zac@zacbowling.com>
To: zac@zacbowling.com
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux@frame.work,
	lorenzo@kernel.org,
	nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@kernel.org,
	sean.wang@mediatek.com,
	zbowling@gmail.com
Subject: [v7 PATCH 7/7] wifi: mt76: mt7925: add error logging for MLO ROC setup in set_links
Date: Thu, 29 Jan 2026 01:05:22 -0800
Message-ID: <20260129090520.192374-3-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129084611.187744-1-zac@zacbowling.com>
References: <20260129084611.187744-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_010625_259385_F115DC48 
X-CRM114-Status: GOOD (  10.46  )
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

Add error logging in mt7925_mac_set_links() when mt7925_set_mlo_roc()
fails. Previously the error return was silently ignored since the
callback function is void.

The function now logs non-ENOLINK errors as warnings. ENOLINK errors
are expected during link transitions when the link configuration is
not yet ready, and mac80211 will retry the operation later.

This complements the error handling changes in mt7925_mcu_set_mlo_roc()
where WARN_ON_ONCE was replaced with proper -ENOLINK returns.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 device")
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 0b088c448151..769c09e99d48 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1048,11 +1048,16 @@ mt7925_mac_set_links(struct mt76_dev *mdev, struct ieee80211_vif *vif)
 
 	if (band == NL80211_BAND_2GHZ ||
 	    (band == NL80211_BAND_5GHZ && secondary_band == NL80211_BAND_6GHZ)) {
+		int ret;
+
 		mt7925_abort_roc(mvif->phy, &mvif->bss_conf);
 
 		mt792x_mutex_acquire(dev);
 
-		mt7925_set_mlo_roc(mvif->phy, &mvif->bss_conf, sel_links);
+		ret = mt7925_set_mlo_roc(mvif->phy, &mvif->bss_conf, sel_links);
+		if (ret && ret != -ENOLINK)
+			dev_warn(dev->mt76.dev,
+				 "MLO ROC setup failed in set_links: %d\n", ret);
 
 		mt792x_mutex_release(dev);
 	}
-- 
2.52.0


