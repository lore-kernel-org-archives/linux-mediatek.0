Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FACE9A02C
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Feb 2026 00:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kdvSYvr5NMYBqMkb8DQrSUZYlW2kwKMB4kHjYgxFfio=; b=plydTcKS+FjmVIYwmFFStd2aFP
	sB6Q9GhcyTXtMOydD1VI1A6dXG32M/Gtt04djX1WUCWUwNsyeQn5qE2zU3zDpKcGrm4K2mFzZL5MQ
	VOBblRZtOh3n16fHCc1q2lCWy59IWc4yYJXkOhxtU8H/1noZS4Cg3YR1dRGg8V3WBmMAzzJsdM6yE
	GPh3PcpOwa6GQO8WO5qwrq8YpYwVZd40rZ5gjMWxuG+XmM15vtP3u40hDXdxmIMNcm3XekcbcOp+q
	thxsQNp9+LxMyZtp5LzWZGycW21UNHlwneAq+OjnPdP24w6ycaXKd3PZQqdTV7XDpXUebZS+05rf0
	pUU5Ks9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vss5m-0000000Aejg-4AW8;
	Thu, 19 Feb 2026 00:40:30 +0000
Received: from mail-oa1-f45.google.com ([209.85.160.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vss5k-0000000AegN-0a9I
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Feb 2026 00:40:29 +0000
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-40ed9a23aaeso128939fac.1
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Feb 2026 16:40:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771461627; x=1772066427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kdvSYvr5NMYBqMkb8DQrSUZYlW2kwKMB4kHjYgxFfio=;
        b=SVlkqASPv3IxRFrTHNcAZG5OmaEY3qXL4+zMp1stX1wXWBbLc4A+xHdd0dbV8xBmE2
         WRXMkvYJnmK3rQVYvTspWI+QOkQNQAvRcYKP3mpZqzdJgRC2pbHi2NLvmyg3Qprj5daF
         MNC/AvxoRdqPX0XBOY1QPNRpPpHRqupRy8euqe3GZdXmjFHv+pHry6PYLJNaI94Cd0jB
         KCA3M25GD3NkBv/kBKxO+wpJobIaSaJ/+d+DRLyHtJxUXkDvw02trAvFFTSUbcs6PKDu
         TtB2YxJoiK+EqzLU85wweXC5+QXz+C2pC57W7OzkO4I3M7ChiOjaHrX1raIXYV9nNyQa
         UU5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWXcUQwQ2K4XeSBU90Gsdqtyd/jTKKr4R+klvmHW1s1lZv2drte5zOPVeWGh/yNnlFCBRKvbApm339KcncFzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxMwCXXRYGZoCkq4GrXcmJIGVNPMgPJiaQSyWLQTnMy0iXPkOOP
	R5G7GMTRoArNoYUV+fNymAwkE9xR18XXKdOYXNg7yntkPSUOUaGt/uOZ
X-Gm-Gg: AZuq6aLz+ZcLuDE+XAkI9AX5ctCz6b8f2Xwf2y5QCsL3vvsYqNwTy+IP8K5n32CHvC/
	R6iaFSjC7JHAUSG68fcN5PtQQC4Ib6I1AVDsKDC4SYTgi/uAGlvuMP6uTdybEx1j9en9eIMm9fI
	L9lsX/1FhxyGRoXHxNq9pqpk584R9ZLJ34453C9qpi0p9RFZzNC6Vt7TiTjxI1En89PIWYXMAQD
	Bi15/1Omp1ruQXaPRDPeHEUqebImh6B587lbqfPVoD2PLuStwzPAXJEaosxjiQDTGRiZAHupNy1
	5HvkPc5+X+JTeqv9YHBIRjGgSGE1ateNybejOV2I27V/xFwtrcfyj+oig85SPTwr64LgiBRDL3A
	F4w0jwGbglv3dMLQh/CifEWHd+TALMSNT28WNgdouhdAX6kA/WxByE2E4l9PZaPmHeT3uOdH3/d
	0IzRD/6H2VHGxK4MJ1TY37E2PiEysCR1iYCP2HTh9DWQBD90j50xn0stED2w==
X-Received: by 2002:a05:6870:a0a6:b0:40e:e9f4:90f5 with SMTP id 586e51a60fabf-40f0d997a2bmr9443254fac.58.1771461627086;
        Wed, 18 Feb 2026 16:40:27 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40eaee45d12sm23477659fac.1.2026.02.18.16.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 16:40:26 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>,
	Xiong Huang <xiong.huang@mediatek.com>
Subject: [PATCH 09/11] wifi: mt76: mt792x: add MT7902 WFDMA prefetch configuration
Date: Wed, 18 Feb 2026 18:40:05 -0600
Message-ID: <20260219004007.19733-9-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219004007.19733-1-sean.wang@kernel.org>
References: <20260219004007.19733-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_164028_178740_8F9C2084 
X-CRM114-Status: UNSURE (   8.67  )
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

From: Sean Wang <sean.wang@mediatek.com>

Configure the RX/TX ring prefetch setting for MT7902 PCIe device.

This is a prerequisite patch before enabling MT7902 PCIe support.

Co-developed-by: Xiong Huang <xiong.huang@mediatek.com>
Signed-off-by: Xiong Huang <xiong.huang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt792x_dma.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
index 34f07bd3097d..002aece857b2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
@@ -103,6 +103,22 @@ static void mt792x_dma_prefetch(struct mt792x_dev *dev)
 		mt76_wr(dev, MT_WFDMA0_TX_RING3_EXT_CTRL, PREFETCH(0x0400, 0x10));
 		mt76_wr(dev, MT_WFDMA0_TX_RING15_EXT_CTRL, PREFETCH(0x0500, 0x4));
 		mt76_wr(dev, MT_WFDMA0_TX_RING16_EXT_CTRL, PREFETCH(0x0540, 0x4));
+	} else if (is_mt7902(&dev->mt76)) {
+		/* rx ring */
+		mt76_wr(dev, MT_WFDMA0_RX_RING0_EXT_CTRL, PREFETCH(0x0000, 0x4));
+		mt76_wr(dev, MT_WFDMA0_RX_RING1_EXT_CTRL, PREFETCH(0x0040, 0x4));
+		mt76_wr(dev, MT_WFDMA0_RX_RING2_EXT_CTRL, PREFETCH(0x0080, 0x4));
+		mt76_wr(dev, MT_WFDMA0_RX_RING3_EXT_CTRL, PREFETCH(0x00c0, 0x4));
+		/* tx ring */
+		mt76_wr(dev, MT_WFDMA0_TX_RING0_EXT_CTRL, PREFETCH(0x0100, 0x4));
+		mt76_wr(dev, MT_WFDMA0_TX_RING1_EXT_CTRL, PREFETCH(0x0140, 0x4));
+		mt76_wr(dev, MT_WFDMA0_TX_RING2_EXT_CTRL, PREFETCH(0x0180, 0x4));
+		mt76_wr(dev, MT_WFDMA0_TX_RING3_EXT_CTRL, PREFETCH(0x01c0, 0x4));
+		mt76_wr(dev, MT_WFDMA0_TX_RING4_EXT_CTRL, PREFETCH(0x0200, 0x4));
+		mt76_wr(dev, MT_WFDMA0_TX_RING5_EXT_CTRL, PREFETCH(0x0240, 0x4));
+		mt76_wr(dev, MT_WFDMA0_TX_RING6_EXT_CTRL, PREFETCH(0x0280, 0x4));
+		mt76_wr(dev, MT_WFDMA0_TX_RING15_EXT_CTRL, PREFETCH(0x02c0, 0x4));
+		mt76_wr(dev, MT_WFDMA0_TX_RING16_EXT_CTRL, PREFETCH(0x0300, 0x4));
 	} else {
 		/* rx ring */
 		mt76_wr(dev, MT_WFDMA0_RX_RING0_EXT_CTRL, PREFETCH(0x0, 0x4));
-- 
2.43.0


