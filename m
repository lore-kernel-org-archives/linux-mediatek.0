Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B13BCD8CA8
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jun 2026 22:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zDBvXF2yuCDUwoxTRJn9WiANQ6TvXDN+2ABteU7sgK8=; b=VeemMH4VyhI3IMZu3muvsIZPWv
	syCinD55TBSBgTurzwZdh/+r6olRi81Hvvgj02oFYt/dbPShba3f5vWzUIGU6Z3wEgnAGacZj6dmw
	F3+vtWr5nmG3byX/Tx4koOcvnuG50qYj05HjJpenb016ntz23vM9NtTzSrWNHIoot9NXu9JOwGE5c
	siaSBsRfa8a2MaDyiFsehEv1wKL/p3nqtn1d4qFOuXE/kGbXpaCAuds/0OnDcKCEN4RaL4TgeucyQ
	VbeFqvN1fjAWkxJEYAcepa6iQq7Gep7ayCphY/NuFM9NmppAemr5hhgQbhDkivccg5Pihx4fIfInI
	HpFYQcTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYXCo-0000000Cadr-1ORQ;
	Sat, 13 Jun 2026 22:51:58 +0000
Received: from mail-pj1-f47.google.com ([209.85.216.47])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYXCm-0000000CadY-2Avm
	for linux-mediatek@lists.infradead.org;
	Sat, 13 Jun 2026 22:51:57 +0000
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36c68964315so1164368a91.2
        for <linux-mediatek@lists.infradead.org>; Sat, 13 Jun 2026 15:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781391115; x=1781995915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDBvXF2yuCDUwoxTRJn9WiANQ6TvXDN+2ABteU7sgK8=;
        b=tOO/Am7Kg2K54k+KY4amo2+4cIHmA19P6MR2YL+jzLP+gU6f45mLkV0UtcJA/KjuRZ
         K9hd6OrHclnLxqxrnkuFdUR9g8bdUiDPOJTWkKJHbUks1iAFj/vHz5XfurOLFVQeD4OU
         WFLkDXLZo1mQNIRoExkzSxXPm0ac7A+qRcrAZgkj/w1gm6ZAXPKa2XskdjSXFPlqJV0c
         o2QJhRGY4/EXxsihAXX8F1/GiJZqG6rwBf824RaTBScUmSNC99LhJq3rMDLJXd3lWDdT
         zFRRtdprB/g888zkZfv0OmIWd81V4XhQbUyAsSIj5sDhriVW7i4qbj6y2F6wxYwixQrS
         fvQA==
X-Forwarded-Encrypted: i=1; AFNElJ/FU0FVNMokhLm3kb+dcc3TkOmGFYV+pJ7f4ANmA/SUxQFlIJzNg34KbbwIcHYD0sReVdgVZExB51ZdZsb73g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzqsv/VKeMIJuMK6bFy6cQAcKlmfMMIsx7cWA606VqUmYiCfOgd
	g0sEd9gGzB1CcdEhDaGmMpNlJW75W43yhj5mjEt5h4DWOI0z/SLTAYEv
X-Gm-Gg: Acq92OFX9Bbbgl7ffBEdXm+xkqczBtUa5tvOaf9kv1QQbPVYysWs/UmOjZH38v8BNKZ
	H809Z5DByXHEGYjjzYDrLcGtLpmGLrcP1o5Cj5PFbnEa+zKHNY+nt4JTXF9OjO3l87Y2bAovxIO
	GjVMLnBVBkOFtqIh07Lr3yFidlWkuPuNaOmfDEt2gQ4+DRY/hxfNektL03T5YVufcMSCUCtSjEz
	S3BfPxhsJbjwgEHVf2Kal2dhAsiecP812b2X+ONmRRNLXrzlb/giE4aZa+TpAGzGDHsI4znxFU2
	cZVoGsax2wWYUIuB0lM/CxfshUOQ+dN1f/BMRG39UZsPuTJXb7s5dDD53wdFPsHgGQMS6HLVhWy
	sPNgQRFcxfcRPi2c+3B3CE4xLeFwd9PAC1L7HP2Dp5uVcr5gfVA7UMquT54BCFPH+YxjdPQesk7
	Nci5zB6NA/Ri5UCkOJAgax6jozIGQX4Im3pEXMHs4+41YWbh9DfxyODCKlwFRcelZZeBsAJNLvU
	b80xbY6n1IyL8GBWoy22AocCz2hQNYCYCg6TTxa
X-Received: by 2002:a17:90b:570b:b0:368:d839:28d5 with SMTP id 98e67ed59e1d1-37a040ad487mr8921781a91.18.1781391115156;
        Sat, 13 Jun 2026 15:51:55 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.. (114-34-228-194.hinet-ip.hinet.net. [114.34.228.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379c333c43asm4215770a91.0.2026.06.13.15.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 15:51:54 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 1/2] wifi: mt76: mt7927: set band index for sniffer mode
Date: Sat, 13 Jun 2026 17:51:43 -0500
Message-ID: <20260613225144.2414283-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_155156_582336_6E41BBC7 
X-CRM114-Status: UNSURE (   8.23  )
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

Use the active channel context to select the SNIFFER command band index on
MT7927, and fall back to the PHY chandef when no channel context is
available.

Also pass the same band index to the sniffer channel configuration. This
keeps monitor setup on the correct band, especially when multiple PHY band
contexts are present.

Fixes: 35a5dcc71735 ("wifi: mt76: mt7925: add MT7927 PCIe support")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index e94fa544ff20..17bc7204f02a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2174,6 +2174,8 @@ int mt7925_get_txpwr_info(struct mt792x_dev *dev, u8 band_idx, struct mt7925_txp
 int mt7925_mcu_set_sniffer(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 			   bool enable)
 {
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct ieee80211_chanctx_conf *ctx = mvif->bss_conf.mt76.ctx;
 	struct {
 		struct {
 			u8 band_idx;
@@ -2196,6 +2198,15 @@ int mt7925_mcu_set_sniffer(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 		},
 	};
 
+	if (is_mt7927(&dev->mt76)) {
+		struct ieee80211_channel *chan;
+
+		chan = ctx ? ctx->def.chan : mvif->phy->mt76->chandef.chan;
+
+		if (chan)
+			req.hdr.band_idx = mt7927_band_idx(chan->band);
+	}
+
 	return mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD(SNIFFER), &req, sizeof(req),
 				 true);
 }
@@ -2255,6 +2266,9 @@ int mt7925_mcu_config_sniffer(struct mt792x_vif *vif,
 		},
 	};
 
+	if (is_mt7927(mphy->dev))
+		req.hdr.band_idx = mt7927_band_idx(chandef->chan->band);
+
 	if (chandef->chan->band < ARRAY_SIZE(ch_band))
 		req.tlv.ch_band = ch_band[chandef->chan->band];
 	if (chandef->width < ARRAY_SIZE(ch_width))
-- 
2.43.0


