Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2E8C55162
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Aug 2026 16:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jQmpfn45uaTNNsHtj+z4E83LXS4CJJjfzV+3sS08LV0=; b=XSd58cByBZzWjhJq4VsM3p/B0P
	HyvF5K5PqgNqUimp2qUuR/qIeHB8PveEzPuwXXGePd2nD2CdRXL9nteoeCyItzkvPzLBt8lJ1SGjT
	faYVVYFYapUSI4t0l+PXXs8YCpE6GNyKAqwRS0Gm6+XoidHIYMtdzP/7GNotxcz03xgyy6GKZcT4y
	pyI/GvEtFlTeXqAnVL+nLxBpEYFHld9UU+ZbECoXihsdHoH5RYbTWryhiDC5U9AV65g13OdLdAkvI
	GeCcnV9OLFQy19k5UGaqrBRDlAJmTVqT+ZHrk8HwNQJjlVCEhe6j4nAoGO/x5/0BRBD9UM+B+Dfsh
	amZQqnOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqYhC-0000000FoXj-30A9;
	Sun, 02 Aug 2026 16:05:50 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqYhA-0000000FoXJ-2boi
	for linux-mediatek@lists.infradead.org;
	Sun, 02 Aug 2026 16:05:49 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2cf50c6f235so28888755ad.0
        for <linux-mediatek@lists.infradead.org>; Sun, 02 Aug 2026 09:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785686747; x=1786291547; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jQmpfn45uaTNNsHtj+z4E83LXS4CJJjfzV+3sS08LV0=;
        b=LQrTOXNEXkt+nrDyM4fNqFRev0sxkRV61rWaVv7ChZZ/Ma04N7khusCUHMfiPMkbrZ
         3Nm5Z3Larbg1syIvisk2wrx7rhYj/eRZCLMdZjRssP1356puKGfRuOMW33AEhwBmWDk7
         PZTamd09iFxtZKZgml+maEVpx/Hm7Ru3ACyhMbZJCimFt/HzQESZTekRG57QKZniKi+P
         +zf6QJYZfrlm6zjoafbdWj1nzOTOdwQZpFVg9m+6XroDFtBNuQIznKJl10WrSpnp+ki9
         AvtREPBbBNUkgg1v0Dot/sX5viQSytTqDvceFoytrOJbmk+xBQUEKQjA7Cqy2LyF047e
         HH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785686747; x=1786291547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jQmpfn45uaTNNsHtj+z4E83LXS4CJJjfzV+3sS08LV0=;
        b=jZPwbrUcJhv8b5L052JwinzF1kH79qBWq3l8nnMXux0XHiguwfPp9ZREGP450IgGrO
         l96jFt91RGMNin4tOlKeaf/VgxTDkvRiO/HJfAy58dnJl3Wu0vPlxZr9r/2JtvQqJpF2
         n5dN3bM21S+QXJKo0jz6YDl6W3q+sfAq49zUW28xtBGbHBqKhvSkK04GWnkET9gKfV/Q
         kjsf4W99vJJjJ6tKOcdCL4+ZC9DZ//N5Ju0IcZBZgrHJjHv/g14ALO0rm3cjegSmvDUd
         QyyNRISPqlL55Rn4Ut4198sIPXr82tNNjcrDq2QPYCv+sw6g60psiadlQ32JChXdj/Tg
         rt1A==
X-Forwarded-Encrypted: i=1; AHgh+Rqt3WacYty1YMcfbIe/7xT7jhrkc2moKkdJijbH1zcKZYpROuocQtF3e2ed2IXhKw8WH6Cbzi8N51qnxb8wdQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2TKKh8jae00p1AQn6a0pJtZVWFhQTz+55yb4oy5CUkokbVfrH
	PUTi58W3WvXMiE1cVi3SnY4H+gxFVerYqHDwsK+wkBMy0tkJwtrBU3AM
X-Gm-Gg: AR+sD102Dyff5WnmniJRcy2oAhnmHhW0OzlhlO6GW5GAhGWNQDaElF/9jgqkxEDKzdp
	jIEk2+ElIwpqSVwoaB8NC+KQaogDXyQ7H1dMJA0Q9fD5pXBTAdyPtxsZbxJA9VfLI1BMPwZP2Ln
	kQS+cdhnVJy36W3ElQD4rKmvSbtcv3Hg27gXHU1QaAipbszAvMmj1nz94b4ls8tTaQw5wdmhwKC
	v+g+WWuZy9sr+54b/vPnjVudiKMvXIiAWPlTf1nHKTzxf1DnyD1CWfZVhbg94lIFtTKMtF+Bf28
	Yh2eaIsJ+QHwfsL81LWSRkTXuhBwFZ0VEfYLzjyt8rVoieIwuWiFpvR8z0WX3zUCB+dia8APt+G
	uiIpO+rkI0lv3mK1vmUhsP6WZfYEKNkJpFCPDy6++GSBi3p0mESrhQ88bYFL16mVspTB16jQzlK
	ogp0pHa4G3aNj4Lsw7gP0kxAoFOXdSoNnusCP3CesNsY2nivXFbyBQk+2YSngfLAHFkgdS
X-Received: by 2002:a17:902:d489:b0:2cc:61e8:5fba with SMTP id d9443c01a7336-2d05244492amr68660835ad.32.1785686747186;
        Sun, 02 Aug 2026 09:05:47 -0700 (PDT)
Received: from Hybread.localdomain ([118.100.92.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b120fe0sm26777115ad.67.2026.08.02.09.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 09:05:46 -0700 (PDT)
From: Koh Tom Han <kohtomhan@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Koh Tom Han <kohtomhan@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] wifi: mt76: mt7996: validate sta_num in ALL_STA_INFO event
Date: Mon,  3 Aug 2026 00:05:40 +0800
Message-ID: <20260802160540.1072-1-kohtomhan@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_090548_669013_CBA0CC19 
X-CRM114-Status: GOOD (  17.49  )
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

mt7996_mcu_rx_all_sta_info_event() uses res->sta_num, a __le16 taken
straight from the firmware event, as the bound of a loop that indexes the
rate[], adm_stat[] and msdu_cnt[] flexible-array members of the event.
The count is never clamped and skb->len is never consulted, so an event
declaring more stations than it actually carries makes the driver read
past the end of the received skb.

The strides are 20, 36 and 12 bytes respectively, so the worst case
(tag UNI_ALL_STA_TXRX_ADM_STAT, sta_num 0xFFFF) walks roughly 2.25 MB
beyond the buffer, in softirq context. Out-of-bounds wlan_idx values are
range-checked by mt76_wcid_ptr(), but the break statements inside the
switch exit only the switch, so the loop keeps running; indices that do
fall in range accumulate out-of-bounds data into wcid->stats, which
mt7996_sta_statistics() exports to userspace when WED offload is active.

The return value of the preceding skb_pull() is also discarded.
skb_pull() returns NULL without modifying the skb when the requested
length exceeds skb->len, so for an event shorter than
sizeof(struct mt7996_mcu_rxd) the pull silently does nothing and res
ends up aliasing the RXD header, taking sta_num from arbitrary
descriptor bytes.

Check the pull, require the fixed part of the event to be present, pick
the element stride for the tag being processed, and reject any sta_num
that cannot fit in the received payload. The subtraction cannot
underflow because of the preceding skb->len check.

For comparison, mt7996_mcu_wed_rro_event() in the same file already
bounds its iteration with "while (skb->len >= sizeof(*e))".

Found by code review and confirmed under KASAN with a KUnit test that
feeds the handler a synthetic ALL_STA_INFO event carrying four adm_stat
entries but declaring 65535, using a kzalloc-ed struct mt7996_dev (the
handler only dereferences dev via mt76_wcid_ptr()). No MT7996 hardware
was involved:

  BUG: KASAN: slab-out-of-bounds in mt7996_mcu_rx_all_sta_info_event+0x19a/0x3a0
  Read of size 2 at addr ffff8880012422a0 by task kunit_try_catch/28
   mt7996_mcu_rx_all_sta_info_event+0x19a/0x3a0
   mt7996_all_sta_info_oob_test+0x24b/0x360
  The buggy address belongs to the object at ffff888001242000
   which belongs to the cache skbuff_small_head of size 640
  The buggy address is located 32 bytes to the right of
   allocated 640-byte region [ffff888001242000, ffff888001242280)

The same test passes cleanly with this patch applied.

Fixes: adde3eed4a75 ("wifi: mt76: mt7996: Add mcu commands for getting sta tx statistic")
Cc: stable@vger.kernel.org
Signed-off-by: Koh Tom Han <kohtomhan@gmail.com>
---
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 30 +++++++++++++++++--
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 2e83f4b79..65d9ae11e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -648,13 +648,37 @@ static void
 mt7996_mcu_rx_all_sta_info_event(struct mt7996_dev *dev, struct sk_buff *skb)
 {
 	struct mt7996_mcu_all_sta_info_event *res;
-	u16 i;
+	size_t elem_size;
+	u16 i, sta_num;
 
-	skb_pull(skb, sizeof(struct mt7996_mcu_rxd));
+	if (!skb_pull(skb, sizeof(struct mt7996_mcu_rxd)))
+		return;
+
+	if (skb->len < sizeof(*res))
+		return;
 
 	res = (struct mt7996_mcu_all_sta_info_event *)skb->data;
 
-	for (i = 0; i < le16_to_cpu(res->sta_num); i++) {
+	switch (le16_to_cpu(res->tag)) {
+	case UNI_ALL_STA_TXRX_RATE:
+		elem_size = sizeof(res->rate[0]);
+		break;
+	case UNI_ALL_STA_TXRX_ADM_STAT:
+		elem_size = sizeof(res->adm_stat[0]);
+		break;
+	case UNI_ALL_STA_TXRX_MSDU_COUNT:
+		elem_size = sizeof(res->msdu_cnt[0]);
+		break;
+	default:
+		return;
+	}
+
+	/* the firmware-provided station count must fit in the received event */
+	sta_num = le16_to_cpu(res->sta_num);
+	if (sta_num > (skb->len - sizeof(*res)) / elem_size)
+		return;
+
+	for (i = 0; i < sta_num; i++) {
 		u8 ac;
 		u16 wlan_idx;
 		struct mt76_wcid *wcid;
-- 
2.53.0


