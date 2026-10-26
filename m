Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E78606A327
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2026 19:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4i+7AVIV;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rjW39+W3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hslISBXc3XOFlG6x7S2yz4ikb3NBWFkUfj2BOwtECQw=; b=4i+7AVIVR0AQiz
	cw7LuuIMiaKzBAjrAq2HaLK2i1YMljrJdHgx2PMGxYrsMk2h/nUOJjU0z2VOUvAnGlUZV9GTqDt/k
	Xh4jamYJh9qZBh2dEuyA9jC22S6x1ZJrH+4UqfjUKDZnevD52F2BXez46V37u/zcvkOTnhlM9jiCp
	91vxgJ13DOlxGDxqSfqJz7CJW1vPaNxZroEPcntATwxFXyv2L8nKox3+nNuzxWmJJZDNfmszHLxDL
	CUj8+3td+u/zPvY/4M1p5SCaynMnuQTln0YOnbDVjChBnyUXcb7yAmREYvNWhNe0nWlBvdHXEDzkE
	mU9biMjyZ5HaF8s+OD7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQ5v-000000038bB-23iy;
	Mon, 26 Oct 2026 19:10:55 +0000
Received: from mail-oi2-x09.google.com ([2607:f8b0:4864:32::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQ5q-000000038So-0uGM
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Oct 2026 19:10:52 +0000
Received: by mail-oi2-x09.google.com with SMTP id 5614622812f47-5179f3beaedso1474734b6e.0
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Oct 2026 12:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793041848; x=1793646648; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hslISBXc3XOFlG6x7S2yz4ikb3NBWFkUfj2BOwtECQw=;
        b=rjW39+W3BrasfTAnEFvXqK9+OIwSZhRcj/ZY3ahWE70+gRci9geIv2qPMJWY5K4D6x
         qMmibq3UMl0Dgs0UO45NHdroe18VmOR3myTwMJ8SA12a1nJtBdw5u5OwN0n8E+2qbTQ7
         hG3AvWexgQHAMgftp90zIwaLDBIpHADGNGjAd85wi6qRVaHB4zyCjFMyRhJGORD1G6Ak
         LFsgE3Fz5RpCIGr+lg9lScg1emp4/aRY3Oatf50eIzlqjX04lynBM3wCNvcSggTYI49s
         qXErVS+32z6ktW2Mck+yPKW26qP51y0L+T+McXRww/xdUziFc1A4qyaefCpxNAEvtDJC
         TnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793041848; x=1793646648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hslISBXc3XOFlG6x7S2yz4ikb3NBWFkUfj2BOwtECQw=;
        b=0ta0ZK7e4iLrE+xKtLh37XAhtlIfIaAnYdlC5PuTln7NtX50QaQWRRpiNqqQ1CfS6a
         rxkBRsl238DOpAdZMhdaM0/+j7Jy7Wzo1qmLrzIjoWFw+wrwYVhelb/zdS9EKz+fWpgW
         90Dx5FiowjsjzWbX0TO8WG9nsgZEDryUz7DAh1us8eXyf8UXLK+3Jz2Pt49AfV3+L2z5
         gFBzpV6XO6qd+n4DnE7np5g6IlswMEhXAAfpHu/8FpRLAPT9ToAvvPFD0p1WC4E+0BpO
         mNpfNKUOoVBg6YPp3pASPKuIj5dzO3LFT4YyKvCx9Ttz8ACl0hGnkdMlDff8CDMGNZ9W
         qRag==
X-Forwarded-Encrypted: i=1; AKwUvBwW6nQ+18n9vn1uE1iAysBx0C4bea6kVK8nOGAdvagtJ4Ih9sTIcWrWnRcQOdq6fyKQfbGZLR1cyGfFcTrZbw==@lists.infradead.org
X-Gm-Message-State: AFq9FYIC7tLe1u6UQr0K2KIA4GXQXh8RG9l+vx3+mOFqM+BefsFevBBm
	tSyOBzmqdKWmO1epVIzkw+u3VwsdtzW8yrvJuQIBy6yqTUAxMFF2njNx
X-Gm-Gg: AYBFou1NUPJFaw8HaHC49Up4qUTNZvrUr5D+jrPgNtVcWPO790lKxkFaLxXwxji+pNC
	5GBiRw4GEfDSM2QEwlQe2yWjTz1s68eEwJZhFQtUz2EPNUx0VDw7StUKmcnz1o3Gp0UPS2+aylu
	eCT0dqtd97zFx8TARM1fgctFpDp+Il4bQGv3dl7kSudClTlQSCZ1/IYxYFevyl3CoRq0c4gN7YL
	ajEwqQxkov8TFPFCArFxwMEUG7s8NJfCNAJeicekPMta6Q0wtyB9iF/xAajAdb0SwsKmb3VUcEt
	Wihy/1MtBgDUsGEb9+WTJ5P5b9rMdmd8BPKMrXAEBJysCAkR8zWXhZVtp/SjgmWhdtb+h8MX73M
	2+LK9Tqmel/LeIxEoaO3SNUm0dvlkmQge4HSsDM4yhyHqk/eL07VXKvCyjTh/gmDzItwe9/v/Ct
	41kiBMTnPKDhNzJFSEDc+WVczx8z3jOK90c7Yt02Rr5bmYaClLTQDdkR6CBy0muaeELv6qew/kp
	u+lv+A9rSWvUj9MHjVqP6jdUv2kFeZbB1/bC5d8s7Z2pR2ZZVE5F6SNkMkiD/WmRFYIj4mZQBid
	r4aj9QtNxvWoZAKM04wdBC5afGzSB//Z0dPm3xV18k9vdg==
X-Received: by 2002:a05:6808:30a6:b0:4cb:f21c:a794 with SMTP id 5614622812f47-55c00261d33mr4881021b6e.28.1793041848572;
        Mon, 26 Oct 2026 12:10:48 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c03dc3524sm5740834b6e.0.2026.10.26.12.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:10:47 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 26 Oct 2026 14:10:38 -0500
Subject: [PATCH 3/4] wifi: mt76: sdio: use CMD52 to mask and unmask the
 interrupt
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-rbrue-sheldon-upstreaming-mt7663s-v1-3-944b1f7e63a8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793041838; l=1910;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=9KbBbuhojfi8oGqXT5PidIszoMscEC5hDq/fupskgeI=;
 b=GzThTvCATPI/ee8BIDVBMnOGZfI02Dm40DZnZKhDEynwCCp6k9M/V6+94HfyPX0T6bmxTpVzO
 4ZYw0j+17aTB3Y/o9OUS/sxyVi3rCA6VeyIZ/kuxBLRQX4KxMFuEwNT
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_121050_281914_BD982F62 
X-CRM114-Status: GOOD (  10.40  )
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

WHLPCR_INT_EN_SET and WHLPCR_INT_EN_CLR live in the low byte of WHLPCR.
Writing them with sdio_writel() costs a 4-byte CMD53 with a data phase,
three times per pass of the txrx worker. A byte write is a CMD52, as
MediaTek's own driver uses for the same register.

On an MT7663 SDIO module (mt7663s, MSDC2 at SDR50) the writes take about
17 us instead of about 40 us each.
The worker is shared with mt7921s, which has the same WHLPCR layout;
only the MT7663 was tested.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/sdio_txrx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
index 3f314e8e1e69..311c31e87ee5 100644
--- a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
+++ b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
@@ -319,7 +319,7 @@ void mt76s_txrx_worker(struct mt76_sdio *sdio)
 
 	/* disable interrupt */
 	sdio_claim_host(sdio->func);
-	sdio_writel(sdio->func, WHLPCR_INT_EN_CLR, MCR_WHLPCR, NULL);
+	sdio_writeb(sdio->func, WHLPCR_INT_EN_CLR, MCR_WHLPCR, NULL);
 	sdio_release_host(sdio->func);
 
 	do {
@@ -351,7 +351,7 @@ void mt76s_txrx_worker(struct mt76_sdio *sdio)
 
 	/* enable interrupt */
 	sdio_claim_host(sdio->func);
-	sdio_writel(sdio->func, WHLPCR_INT_EN_SET, MCR_WHLPCR, NULL);
+	sdio_writeb(sdio->func, WHLPCR_INT_EN_SET, MCR_WHLPCR, NULL);
 	sdio_release_host(sdio->func);
 }
 EXPORT_SYMBOL_GPL(mt76s_txrx_worker);
@@ -365,7 +365,7 @@ void mt76s_sdio_irq(struct sdio_func *func)
 	    test_bit(MT76_MCU_RESET, &dev->phy.state))
 		return;
 
-	sdio_writel(sdio->func, WHLPCR_INT_EN_CLR, MCR_WHLPCR, NULL);
+	sdio_writeb(sdio->func, WHLPCR_INT_EN_CLR, MCR_WHLPCR, NULL);
 	mt76_worker_schedule(&sdio->txrx_worker);
 }
 EXPORT_SYMBOL_GPL(mt76s_sdio_irq);

-- 
2.55.0


