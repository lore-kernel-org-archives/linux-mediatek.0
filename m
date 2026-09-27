Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDDCC98338
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2026 21:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yHU4nEGW7+kHgbtl043kdQcpDp7Ms+JDgnl3vA2EDIo=; b=nprzBoFYJ5onFCbs7RrWTKyD2h
	sDzYXQS3k+XYkl5P8XMs8ekFMjYgMkbPGjNdAAVhxXdNwK6LcqepIb7p7611CxAoXY7t6hnF3Cs4s
	q5GTK7lpRSrtg96x24PyO/JKooClbkH3ABsRPtTh+7/uLoTXQwdCfk2skmF+N3yrUuWYUaPXsWhsZ
	JOI9n/D6Z8+nCfE+JrKg7r4niPQXbpvtLdNffof6gzGHE+8C1V6CO495lLX+crOjVg6RFAJ9Ee7UZ
	fzc4tBGkifVLma1ekNwxl7fxKwk2MjHE+g83xgnGC7Z4r9DPeIetEoytfUUhlXLjuroMHxbmwSAyC
	s3ZrXgqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw78-0000000GrsD-3REJ;
	Sun, 27 Sep 2026 21:08:50 +0000
Received: from mail-oa2-f35.google.com ([74.125.231.99])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw76-0000000Grrd-2Oa3
	for linux-mediatek@lists.infradead.org;
	Sun, 27 Sep 2026 21:08:49 +0000
Received: by mail-oa2-f35.google.com with SMTP id 586e51a60fabf-4938dd40902so1338845fac.3
        for <linux-mediatek@lists.infradead.org>; Sun, 27 Sep 2026 14:08:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790543327; x=1791148127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yHU4nEGW7+kHgbtl043kdQcpDp7Ms+JDgnl3vA2EDIo=;
        b=mKP2nmB8nprSfMmS/wCl5I4zcc4+6MHjbjbKSjmr4gUE9Cdq9npFLyevv5LO1bjzEZ
         PAWCLzvHj3HFLuAf5HbfZhrq2DrhCnKNhwNW2g9wHlw/qkbWHVKIILEzNGnD2OVDykNJ
         glfy7d5Xt/fj9/B9iLzO4KCvZQAuZuuzOTImEXzkHeWTVwEj05XQQ4DxIkk6NGzkIvRE
         MU4mNqbUzvSQZNIxZnFiCjWGlaiBQxz4juVxBb6CjBBh4vAVMJ9bwXFO3P8K5dMPKC5z
         lPhWRHKMXYZdF89y/TnLV0K6UmR/NoCYiCB5IKC6/BZ214z9Zfzmoi5HZobCCurz++F0
         tbMA==
X-Forwarded-Encrypted: i=1; AKwUvBwujMD3sQJL8nq1lNgBIYKgU9dmwgh2RMNABSff64Dj7u3CMJaT7XiSpyhVmwqwLcXD71IF7kU4QlK3MZdjtw==@lists.infradead.org
X-Gm-Message-State: AFq9FYKFK/mCe5XqCPpVcj1nKM1Kkqcki7N7fp5qT53/asMschN3SUc4
	L6vY7rnd1oFO+iyJuJVFPoQm9DXxFYhQpGGaHpmYd34yIyk3N8f3/n/B3pTDTSqg
X-Gm-Gg: AYBFou1U7SxdSgWVbHpOIHKJp9urXFPdvXZCdlt1xd0p2S6YkNSNzzXivjC4RuyTifp
	ZcbNQIwGs/ftSMCw7nXUCDePS7kMi0wOH2mh7teVv5jPeUxh8YwV82GGuSo5ybUcIQzWJHftsCo
	IUYPvu6iNJXXLXTser8UFNGJwavzooSVNRsvaZvMIQbBXAni9yzm2ijG754Qyksf+mPTNfyCjU+
	Kvb1kTgONVlZQGgNVzLk80VWKnlkHswNhlHH7Nze18ivm1PGmBHjqBPf4muxMkNui3OHDW4ex2P
	F9qHEeUHGjSrk80+JQ3RBJLWADczeiM5nDD3D5SWG6bLOZaUFKGqnupQWlJysLafTGHnfplkntc
	6toVyRBIWRkAiVQsMN+Nh3/P1VhVX1F6dMQHN4u6cs+3M/dEiA070BvPpOsVg5Nv8sMHbM7r7oP
	ah9vqFSjhYw7/HVGGULZblOXCMYvSRQaS5TAH5jX+xy8dQNVvDYQt10HBzDNzqZsCMCZP0QXUB5
	G98i4zd9Mz98ZrMSB8FmZdjNIOpiowJxK8JWEC9tNjJgRQUSwZoo7+TiRtHwHx8YIwd6g==
X-Received: by 2002:a05:690c:a79c:b0:8a8:8456:a970 with SMTP id 00721157ae682-8a88456bccfmr20134317b3.68.1790543001580;
        Sun, 27 Sep 2026 14:03:21 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:5dd7:b9c7:1078:5394])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a86103149dsm35389017b3.40.2026.09.27.14.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:03:21 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Chengwei Yu <chengwei.yu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 01/23] wifi: mt76: mt7925: make NMI address TLV tail padding explicit
Date: Sun, 27 Sep 2026 16:02:43 -0500
Message-ID: <20260927210306.737669-2-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927210306.737669-1-sean.wang@kernel.org>
References: <20260927210306.737669-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_140848_607679_C8ACEE02 
X-CRM114-Status: UNSURE (   8.74  )
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

From: Chengwei Yu <chengwei.yu@mediatek.com>

struct mt7925_nan_nmi_addr_tlv is __packed __aligned(4). tag+len+
nmi_addr is 10 bytes, so the aligned attribute already inserts 2
bytes of implicit tail padding to round the struct up to 12 bytes;
sizeof() is unchanged by this patch.

Every sibling NAN TLV struct in this file (cluster_id, sync_rssi,
peer_rec, map_sta_rec, ...) declares its tail padding as an explicit
reserved[] member instead of relying on implicit compiler padding.
Make mt7925_nan_nmi_addr_tlv consistent with that convention, and
give the field a name so it shows up (zeroed) in TLV dumps instead
of appearing as anonymous struct padding.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Chengwei Yu <chengwei.yu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/nan.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
index d81d84a222d9..297c2856578e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
@@ -346,6 +346,7 @@ struct mt7925_nan_nmi_addr_tlv {
 	__le16 tag;
 	__le16 len;
 	u8 nmi_addr[ETH_ALEN];
+	u8 reserved[2];
 } __packed __aligned(4);
 
 struct mt7925_nan_avail_ctrl_tlv {
-- 
2.43.0


