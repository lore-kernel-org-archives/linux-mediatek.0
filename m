Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0926CCA462
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2026 09:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DaRwbulkkTIJ93wv1Wgx1yqKGJXajwFFEDheAhreMvw=; b=Gac+zBg/XYWC5dvP7P4DiYncf5
	utBxf/wse+F4cHo1Y7JTfY04FsHi/agbDEJhNKdQUTRo9WA5DwsMb9Kji5qX/k5fvpLD9KO+Xoepp
	Jkz05oKVpaFAIsopphtQRTRvCBnp6/+f6Ilw+tzCl6i88X2jaQzHgBFSH2JmNssRtTYm1sL7pvEAs
	PwgP3HoXtWYqaEO6wdOLdVXY1m5V6zMpI5H1VkUiC5oaSfAnTjyihXTOl2hWmU5HvT0arp34yGfaX
	X3dYheWTcVy6eeKRYQ1S9kWdLItyTMokqKbKwuXU0epQm4GEr/4s0FtCtJ4AHX/MYY9jJ+L+g+4Wb
	O5fCZ8Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdzr-00000002RLk-30ua;
	Fri, 16 Oct 2026 09:13:03 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdzn-00000002RJM-11GY
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Oct 2026 09:13:00 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so1605701a12.0
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Oct 2026 02:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141978; x=1792746778; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DaRwbulkkTIJ93wv1Wgx1yqKGJXajwFFEDheAhreMvw=;
        b=eCmkCRhPNCB424jvEWUTaZyWfk0mFNVx/o4YlpKOUeX2iTuIc8yNB63hV/nsT0Z4jO
         +UK3aIjHUbxrqcrmBDxRqZqGyIidJYN66jqmCHz7WyGwXhQDhatOhjFtMfemk6YyAmMS
         ywrIYVgJ1qbJSuMI97p7guPSmUQD1gsYvFtQPC898OcBaw2kfgMuCutBTUaoTNLcb0Vn
         edS9SivOLXS1Y6F56BRRTI+8plnKIfb961CCzgnLmu3CUnwV3RudGbMs1+unYeDknvxw
         a6GlhX2dctfLKrTwFCJhls+/ysNLwzU2yGkzmuFnc2z4aZxPSspyLFuYJGfJ4pDcI3Wn
         Fwyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141978; x=1792746778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DaRwbulkkTIJ93wv1Wgx1yqKGJXajwFFEDheAhreMvw=;
        b=nQ7pBxQpzBsdwLOxKBhSsoXWQfSjRDKlFeE1lLpS/HimB27LaBmFy/uzKYqV55cy/r
         +F+qCLaSKMpcG86yp6ho67MElOqHXfahr80f3Gdju5fVUlDfaC2KG4xYbXTnWWafBq9T
         nJSiZEKs7bpLjGRVI04usBprGa2CH0AiPBqC9ccqMCfX0SYNOOgf5bzI0CylBNfVP8xq
         uWAwwGS4QnfLtZ4ZBnlv+V0NxVqXtPX4AiEIn8COk2ym29S5f1/eidMSJRm15uwLl2TQ
         lGEGIl6ye8EZ+Zt3QCFf3AqLPPWvndmsRCedSqIq6d8MuIQ+1NGk7hRgm71ndDFdp9+d
         xdTQ==
X-Forwarded-Encrypted: i=1; AKwUvByh4UfWMJ4mZyZ6tG2+k5tS3LVSVOKUbm9rXkBiCkD3Cxww3Afej1wHNB6UQNgc/vNlgs7706nIfPXvbv87Lg==@lists.infradead.org
X-Gm-Message-State: AFq9FYLkt+g8zhIi4F7fFjsK42gfs7eMSXQWPRtT5Z+VE/kXHq+DOBIn
	69E6K5Ykgjc3RqRY6DXrIMYto963OSsSFMqSOPFJB/B+3JDKAOOMEj+i
X-Gm-Gg: AYBFou2OnlPLi2NdCFfgrR9ABmJknvHzIZdQI1LkoKagJyRLl3SC7cT8UQYatcfpstH
	R2uzb5LAwqHswNmpwmMQvBVndGSniR1YCTJJ/8ZAi088MP1/dAd1hObmdqCTM5EoOBoammtQyHm
	aExDFwtycuVi+tAGQPnjgRBOazui/lKIVgTymGjUQKsywTFF2FWpZEwVb6zABWKNOXbqv5kUMEf
	FijVXG7objBzDpGvEAnHULUailPVoZ/o7/4HeXmtyXxg8RNAPRsOFcbD3k/32IkOrz8vKpPN4Hn
	nC8YLWoa3Ocd1TilmxyvKA0uTqAhGUYEJfTQmL/t/L3XkmMxG/Jw17I5wssNOxxFOnUOXtSMZFv
	Gsy29ripb2krir9JdVEwpXB5FUWH0vWIPJs1Eu+07B8T+zZRXv0k2YVBbITXaMb+SLydjc9MUEf
	NGxmQlKEu3p84zf42rTdGyNWVmeWKf4ctuObrmTpTqCFehlazbcNRtrNNXDTIc5Y668AqI/rEhY
	MunnK1oAxLVth6Ok9we6AXClhfrOuO67iijnps4mv7BGfpmqU6JxaKpBWIn
X-Received: by 2002:a17:90b:4ac2:b0:3ac:adce:60b5 with SMTP id 98e67ed59e1d1-3acadce670bmr3331774a91.14.1792141978314;
        Fri, 16 Oct 2026 02:12:58 -0700 (PDT)
Received: from DESKTOP-VNSSJ2S.localdomain (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd65497e28esm767274a12.7.2026.10.16.02.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:12:57 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
Date: Fri, 16 Oct 2026 17:12:33 +0800
Subject: [PATCH net v5 1/5] net: ethernet: mtk_wed: skip ring reset in
 wdma_tx_ring_setup for WED v3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-wedfix-v5-1-8b02e78fd34f@gmail.com>
References: <20261016-wedfix-v5-0-8b02e78fd34f@gmail.com>
In-Reply-To: <20261016-wedfix-v5-0-8b02e78fd34f@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, Rex Lu <rex.lu@mediatek.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Zhi-Jun You <hujy652@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792141973; l=1202;
 i=hujy652@gmail.com; s=20261016; h=from:subject:message-id;
 bh=3VzB1FLCd2mLzCjg7kaS/GAexp/k2KRl3VSTok/MVlE=;
 b=5XzbtZKpJ+yde/h6N2QHggLRyxZpPRxz/vp+RwYavuMpb/33Vc1ZKXfd0XtsE81ayaRaOHReS
 YZ2HLm9vrG6D+qpPZXfGoeFt2VcsBtBboe9mx3MoHFVkvVsdGMvmXBw
X-Developer-Key: i=hujy652@gmail.com; a=ed25519;
 pk=AYHrGhtLNb9z7JIsGOOYWmKKIoVPH7ZZgT+CLIDMuEM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_021259_289962_E0A7BCA0 
X-CRM114-Status: GOOD (  11.22  )
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

Currently WED v3 tx wdma ring, ring reset happens in a separate code
block unconditionally.

Moreover, v3 has double the size of wdma_desc and has different init
values. mtk_wed_ring_reset doens't deal with that and would corrupt the
wdma_desc.

Fix this by skipping mtk_wed_ring_reset in mtk_wdma_tx_ring_setup for
WED v3.

Fixes: e2f64db13aa1 ("net: ethernet: mtk_wed: introduce WED support for MT7988")
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 53d3b7e00e1c..d55042ccaff1 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -1938,7 +1938,7 @@ mtk_wed_wdma_tx_ring_setup(struct mtk_wed_device *dev, int idx, int size,
 	wdma_w32(dev, MTK_WDMA_RING_TX(idx) + MTK_WED_RING_OFS_CPU_IDX, 0);
 	wdma_w32(dev, MTK_WDMA_RING_TX(idx) + MTK_WED_RING_OFS_DMA_IDX, 0);
 
-	if (reset)
+	if (!mtk_wed_is_v3_or_greater(dev->hw) && reset)
 		mtk_wed_ring_reset(wdma, MTK_WED_WDMA_RING_SIZE, true);
 
 	if (!idx)  {

-- 
2.47.3


