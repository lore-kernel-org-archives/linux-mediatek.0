Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6173606A31A
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2026 19:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P5SdebLZ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ADY2plTw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QIiFmRnFhWPNQzBn5gMjyz5irv/bhFzVi5C0pT/z1+E=; b=P5SdebLZzilgnG
	3Hbeb7ufWX/7RKqEZytF4Uc5Z3IwvR8KVZBRfNfJtyfUDVQY5I0GpradV2Vus6onhgfRW/PnIHwTA
	BmwDIK3Gr/RtVRZ9Nd/d6NoZuqbyrZmdpD2XwsjPQ2eKExdky53u1Wx7TLhO1JWbhCto2BkFr3K6y
	xpjM07gREgxae+V9IaLFy4x4fGfc8K3oSljjkz+I80Y3oytV3O5+ppK/jthfRoqpMF/t1QY2hwj0t
	hAx9naAYATpJ7TCobnFZFSN6nG/7NVujpjAXaEtNfgD1Yp6NTYdN600bpXsVi7FHz9GOEOeJWlsDz
	UY45l3PnVo5zbJWBxNng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQ67-000000038jZ-2NeS;
	Mon, 26 Oct 2026 19:11:07 +0000
Received: from mail-oo2-x05.google.com ([2607:f8b0:4864:31::5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQ5t-000000038VF-1fBb
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Oct 2026 19:10:55 +0000
Received: by mail-oo2-x05.google.com with SMTP id 46e09a7af769-84585465aabso490664a34.1
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Oct 2026 12:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793041851; x=1793646651; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QIiFmRnFhWPNQzBn5gMjyz5irv/bhFzVi5C0pT/z1+E=;
        b=ADY2plTwv7kz8tNQByODXDrpjoVax5vQZ4bYLQMqx4OYO9FruU3dTJFYSfz79wSecD
         buW/YZ4tf8iIXkqcKfmX7+6Z/ZvEtQgGkOrMV60pw0pO41TLFUOPZwwsYTkmXG//1YAo
         n37A3AU6qT9GUB32s1NvFD4EB6Pqvt/pvGAV0NS2znwTITIhG9VvWRfSHhM3FDS3kluO
         Ww+5UQkc1VhVBltBBvmNgTyQ/4J1FsibaKhw9mIQ6pkpHmWDbuf1DOssfNZb2QPluKwg
         TnmmIyQTEpr0HWcmgyMuT221tDhfPkiQeCzomIx+kdtyM0JdzZ7esMiP9mXawIWLFgDh
         BRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793041851; x=1793646651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QIiFmRnFhWPNQzBn5gMjyz5irv/bhFzVi5C0pT/z1+E=;
        b=0SQYuzzgtKED0xfCcxiQpFpQsG2IfTqbPLaPAC2x/RnUGubi/ghOQ9/F8lVYPAZSJk
         d8PbzPxwjA4S4BP1jn3GUNOCBJDqtF3tUm98phir/+4lM08InCamit6BjIQJ4r0exxKj
         DSSIC4+NRrfg7WlKSu2bsx9UqM9pCbFEsyrl5i6ZzYz7J/QSH8CdVQvVXBTTqmr+2f0y
         CqA39Sp/RaR5LusKRbSqocjI3ZEjZOn9AZei2R9+2rN9rIlfEQ6PmWF5uFagQdp1nEem
         hAWrRA93DfTK7nzwVD4XUdnw0USgxjwtJosFC/BJ7rUzel+rqP7Kulmm8AIdzH52OWc0
         plIA==
X-Forwarded-Encrypted: i=1; AKwUvBwy0Dl5JNPj22EmuEY5gLvSKty+gkHIAOwjnEZ8dyhfNqGEtSYudW8ZQ6Zx67d87dLi22q19VvVmK4xxHidIQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYKGMilFuzRKMsyrOJIameVQqN6e+o2/lsorprshF2vZadV2T+Ki
	Ud0I2yEQS6nXGrPP2d+4KxEQdrOxhoiSu/BWWoeEOv1bUKDfyps+Ut71
X-Gm-Gg: AYBFou3jO2VrTl3KAMxzaxuzUvEoTb5+/mdrldBBWdJitMu6Uy5TRgj/CzE04MyQMwN
	AweiVerpg039FZodcLprvYIRm4UQQdShBh2iuYpN5OAELlp7FWdPYU1vDgIH5G7ODUP3myuPAk2
	9js0MVccR8GrwsQhg2zvBzm/zq9egh/mgE7xhLxNaZhUPcPiG/qqA0Idt85816+uCf5fMv1+znR
	PQ7g8X62vtTGb2YSpE9CU2rqO06S7JIjfDJ56eJxu08/NkfE77/WaMyi/IcPvA4l2obtg2h9lF0
	d+8aQccDlIp0+mxgm6QUggC27CcHOtoxcw11JOIESOa7iKpW5Lg3pZlmIvVkQOK1yWd2O3b/8pb
	RE24YUGBKJffDvlJCl1E6mnSB6f1Qhsnqh6aAZiuHXj/yWzOMXaiGZLrOP3NZNIDTVsB+HjpxDl
	l6lx2EtFdvtfm3wBdLuNXg483KIBvnkGVj3RGut0RbKnCY3yrBbySJpfdeGcfebLUdLzKZ3u+27
	BVdlTTcfVH4k3onlzaJM1HfKldGGiNG6fQfc+a9Ib0qafEQA2HgPVyfSwDraWbXgBj/vWdldyOs
	g4wHBHSoEbETAyWV5HjDDe8/niceR3i26XSOnVsz8iLgMW8=
X-Received: by 2002:a05:6808:150a:b0:532:6c52:9778 with SMTP id 5614622812f47-55f6af83955mr374971b6e.20.1793041850651;
        Mon, 26 Oct 2026 12:10:50 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c03dc3524sm5740834b6e.0.2026.10.26.12.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:10:50 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 26 Oct 2026 14:10:39 -0500
Subject: [PATCH 4/4] wifi: mt76: mt7663s: use RX enhance mode
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-rbrue-sheldon-upstreaming-mt7663s-v1-4-944b1f7e63a8@gmail.com>
References: <20261026-rbrue-sheldon-upstreaming-mt7663s-v1-0-944b1f7e63a8@gmail.com>
In-Reply-To: <20261026-rbrue-sheldon-upstreaming-mt7663s-v1-0-944b1f7e63a8@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793041838; l=5919;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=3uU3p0eYN0gWkFjqNQLRhAPcmSmlrPjUlBG9Bxgtb3g=;
 b=4BBBF/yUowDPHwMwWDdDl2PGA2yooKLBaQvgJiKnkDgfIFukdubCZ0Lb/ZE35bsg1OP3qaTHm
 0MGOuDWtAcRBRC1D1bDKhM5vRsE0gBXaVcupju6xvGzrzB9FXvHck+t
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_121053_534033_5E5761FC 
X-CRM114-Status: GOOD (  22.13  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In RX enhance mode (WHCR bit 16), the chip appends the next interrupt
status block to every RX data read: after the frames come 4 bytes of
zero padding and then the same 112-byte block a WHISR read returns.
mt76 never enabled it, so the txrx worker read WHISR before every RX
read, about two status reads per frame. MediaTek's own driver for these
chips runs in enhance mode and only reads WHISR when no appended status
is pending.

Do the same for mt7663s: read the extra 116 bytes with the frames, keep
the appended status when its padding is zero, and let the next
parse_irq() use it instead of reading WHISR. Each status is used once,
so the read-clear TX quota counts are neither lost nor counted twice.
mt7663s reads only RX port 0, so a pass of the worker makes at most
one RX read and no appended status is overwritten before it is used.
A 1.5 KB frame plus the status still fits in four 512-byte blocks, so
the reads don't grow.

Measured with ftrace on an MT7663 SDIO module under a UDP stream: 881
WHISR reads for 857 RX reads (2.1 per RX read before), with TCP and UDP
throughput unchanged on that air-limited link, no added loss, and no TX
stalls over 30 s of transmit.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h        | 10 +++++++++
 drivers/net/wireless/mediatek/mt76/mt7615/sdio.c | 28 +++++++++++++++++++-----
 drivers/net/wireless/mediatek/mt76/sdio.c        |  3 +++
 drivers/net/wireless/mediatek/mt76/sdio_txrx.c   | 15 +++++++++++--
 4 files changed, 48 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 9e851dea71d9..9c637ebddb52 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -700,6 +700,16 @@ struct mt76_sdio {
 	struct sdio_func *func;
 	void *intr_data;
 	u8 hw_ver;
+
+	/*
+	 * RX enhance mode (CONNAC1): the chip appends the next interrupt
+	 * status (intr_size bytes, after 4 bytes of zero padding) to every
+	 * RX data read, saving a separate status read while frames stream.
+	 */
+	bool rx_enhance;
+	bool intr_pending;
+	u16 intr_size;
+	void *intr_next;
 	wait_queue_head_t wait;
 
 	int pse_mcu_quota_max;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c b/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
index 46188951ad19..f744240ebd34 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
@@ -56,12 +56,19 @@ static int mt7663s_parse_intr(struct mt76_dev *dev, struct mt76s_intr *intr)
 	struct mt7663s_intr *irq_data = sdio->intr_data;
 	int i, err;
 
-	sdio_claim_host(sdio->func);
-	err = sdio_readsb(sdio->func, irq_data, MCR_WHISR, sizeof(*irq_data));
-	sdio_release_host(sdio->func);
-
-	if (err)
-		return err;
+	if (sdio->intr_pending) {
+		/* appended to the last RX read (RX enhance mode) */
+		memcpy(irq_data, sdio->intr_next, sizeof(*irq_data));
+		sdio->intr_pending = false;
+	} else {
+		sdio_claim_host(sdio->func);
+		err = sdio_readsb(sdio->func, irq_data, MCR_WHISR,
+				  sizeof(*irq_data));
+		sdio_release_host(sdio->func);
+
+		if (err)
+			return err;
+	}
 
 	intr->isr = irq_data->isr;
 	intr->rec_mb = irq_data->rec_mb;
@@ -124,6 +131,15 @@ static int mt7663s_probe(struct sdio_func *func,
 	if (ret < 0)
 		goto error;
 
+	mdev->sdio.intr_size = sizeof(struct mt7663s_intr);
+	mdev->sdio.intr_next = devm_kmalloc(mdev->dev, mdev->sdio.intr_size,
+					    GFP_KERNEL);
+	if (!mdev->sdio.intr_next) {
+		ret = -ENOMEM;
+		goto error;
+	}
+	mdev->sdio.rx_enhance = true;
+
 	ret = mt76s_hw_init(mdev, func, MT76_CONNAC_SDIO);
 	if (ret)
 		goto error;
diff --git a/drivers/net/wireless/mediatek/mt76/sdio.c b/drivers/net/wireless/mediatek/mt76/sdio.c
index ba5f123f7e39..95af0a90546c 100644
--- a/drivers/net/wireless/mediatek/mt76/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/sdio.c
@@ -269,6 +269,9 @@ int mt76s_hw_init(struct mt76_dev *dev, struct sdio_func *func, int hw_ver)
 	case MT76_CONNAC_SDIO:
 		/* set WHISR as read clear and Rx aggregation number as 16 */
 		ctrl = FIELD_PREP(MAX_HIF_RX_LEN_NUM, 16);
+		if (dev->sdio.rx_enhance)
+			ctrl |= RX_ENHANCE_MODE;
+		dev->sdio.intr_pending = false;
 		break;
 	default:
 		ctrl = sdio_readl(func, MCR_WHCR, &ret);
diff --git a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
index 311c31e87ee5..f15746a13991 100644
--- a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
+++ b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
@@ -9,6 +9,7 @@
 #include <linux/kernel.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
+#include <linux/unaligned.h>
 
 #include <linux/mmc/host.h>
 #include <linux/mmc/sdio_ids.h>
@@ -87,7 +88,7 @@ mt76s_rx_run_queue(struct mt76_dev *dev, enum mt76_rxq_id qid,
 {
 	struct mt76_queue *q = &dev->q_rx[qid];
 	struct mt76_sdio *sdio = &dev->sdio;
-	int len = 0, err, i;
+	int len = 0, data_len, err, i;
 	struct page *page;
 	u8 *buf, *end;
 
@@ -97,6 +98,10 @@ mt76s_rx_run_queue(struct mt76_dev *dev, enum mt76_rxq_id qid,
 	if (!len)
 		return 0;
 
+	data_len = len;
+	if (sdio->rx_enhance)
+		len += 4 + sdio->intr_size;
+
 	if (len > sdio->func->cur_blksize)
 		len = roundup(len, sdio->func->cur_blksize);
 
@@ -117,7 +122,13 @@ mt76s_rx_run_queue(struct mt76_dev *dev, enum mt76_rxq_id qid,
 		return err;
 	}
 
-	end = buf + len;
+	/* The next interrupt status follows the frames and a zero pad */
+	if (sdio->rx_enhance && !get_unaligned((u32 *)(buf + data_len))) {
+		memcpy(sdio->intr_next, buf + data_len + 4, sdio->intr_size);
+		sdio->intr_pending = true;
+	}
+
+	end = buf + data_len;
 	i = 0;
 
 	while (i < intr->rx.num[qid] && buf < end) {

-- 
2.55.0


