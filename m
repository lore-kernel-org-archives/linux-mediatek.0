Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0217DE9410C
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jan 2026 06:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4qcRd9h55YHEi++sX8o5tkpOMIfr4fzGABHLci1bhHg=; b=tUXbTFtYBcoM0p/mjRSaiOxMQh
	t8jqxq2AaSFAuNEWzLzhenYA8p4dRLeYC8reeBBv+tmXJsDZZ2etR+ZUswt0OoKaz2dMhId+1Xq8/
	Gl6Sa9v+zwBtxm9taTwrnKgBRpluPhKuCJ/1tr5wFRmUii/GcIFiJL1UeBvLKhknYVVeIruAe6+Ty
	dcVa3lVoXKKYCE9CXm+UQIDY08scrG0rBeIf/6Pfkq4Oa1rfMgCv4jksPFiUTHHF3nFz1B35cvfEL
	6xugYvRAyIhkG7MAQYhrCVR+KzFHPV3/9JXiG7FFsEcADBgVoiHwXgzV1x0Rv4bCl8oqenYTLwd/z
	+JQTSrPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbC7c-00000006drs-3qnG;
	Thu, 01 Jan 2026 06:25:20 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbC7Y-00000006dr0-3AhF
	for linux-mediatek@lists.infradead.org;
	Thu, 01 Jan 2026 06:25:20 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-121b251438eso4950643c88.0
        for <linux-mediatek@lists.infradead.org>; Wed, 31 Dec 2025 22:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767248716; x=1767853516; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4qcRd9h55YHEi++sX8o5tkpOMIfr4fzGABHLci1bhHg=;
        b=I/A8MnXijzdCR8lCMG+jyPXgQ/hbi1PyltoPDKGFQ4JstRQ9xZh+wMB+tRJAEbGlBO
         98JN6Ik5Jc5kbE6pYoH1hyZsI+/TVr2cNBI9oS3SjgL45PK2hv1zdBmXgT1quOsW/Nn9
         80v2naKJzdI/vyo7Z924ThMtJPaSn08nQSACl6SmJaoUK/qsbxHXetizbw4mN1UoPFR8
         NYl4dI1Erm1OP+MJ9+kHSh9R9x6LaAVESZITC6Jv/whajMAh7pjdRPXusr+DsPVrqpqY
         VCj3JGfzQkf/LdqKNtRcw1hQ9eIp28X+XNt2k4RL0Rzt3z02pwIzrBNDJ1j56G2SrvBY
         d8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767248716; x=1767853516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4qcRd9h55YHEi++sX8o5tkpOMIfr4fzGABHLci1bhHg=;
        b=ecZPl0fPhscfntRsTmesqapOuoh2X/Yv0UnwPetk4pqn0HiEt6UXUq0Bw+Jno8FUw+
         n700RH6+9AwaKASv8nBHxs2NuDlClfYxhzXOrL+bRMgyvxP+bE5+6O/c3r6o8ohgd9gT
         fSfiy5nT322MllF023ZRQB6Hl9wZ58v15ukelU/wokWl4gT6yPC2iA5P7Z1CzQ/Ur2KG
         0v6KmxnRCq3qMlk/8wlMKDRkPA9UoMCv08TjbIaDAKUd13xCE16NtHGSpEOexSUitnYH
         6RPHzxamZHdiujKL7RpkzJOjacZUN8Nb3HClnkPkUbbgBzQuGoxQ9/ms4/Ji0E8QWTW6
         EMMw==
X-Gm-Message-State: AOJu0YygK6rTMibH38nnhDRylNo2mhyQqcYeFb22jYQ/15jeD0PVUfbd
	TcbRWzBOWP3Dpa/BVQ08f/oCgiaSm/QPesMWtqNmqZS0UsobdIcKxpV+
X-Gm-Gg: AY/fxX60cbygTUA+2npl4vqG8Dj5l3i1vhMMOTCuHucjIrJGc3OFbOh3JGxmf/3IwMH
	ISMVVUyCnPEyVsvVDBCzKvct4aw+mCfFldw8Gy5nJWITY8kXMOG1+22hj5SC9WMX1w2zAP6v4/N
	uq/fWvIkl9C4UDTsWDTshFrYwJHEvfBpHS/eF/mtfaMpPIMuYeOS4604goshDyeVZCgKmAtyc3n
	bjMR4urf8Qc7VOLimtYWf6RtqkiQAIPp0Uu80l/Joj7AUnss053aZAuhjsqnSUXdy9o9VDC04ye
	dw1bIkU29P9AqsQTU3HD/uqcNq9LwzjDP//OwMiW2bjFzGLGJ9m0IPaObQp+gvG4pGaOny6nuly
	bSX7in3AHRWMg0EJ2GjjPBF7LOXS/fTT3FMkkv5SZkT/0byEvxmjiFmcAw8JtqQhlWXYE5YeBrk
	GBWho/quKF2WlYVR5hNFFDPz0EG8X8cB/Wh9A2MHXUJVmgulLhcvsIw2UKNEK3wg==
X-Google-Smtp-Source: AGHT+IGI0NzXOXAhA1nrJHqTrlZtGjQqV+6cghOu1VxjpCmy0fuuxWMffXBXRLlyQigtisP9qZeZuw==
X-Received: by 2002:a05:7022:698b:b0:11b:9386:a38f with SMTP id a92af1059eb24-12061991877mr37384173c88.22.1767248715711;
        Wed, 31 Dec 2025 22:25:15 -0800 (PST)
Received: from zubuntu.home.zacbowling.com ([2001:5a8:60d:bc9:9ebf:dff:fe00:f8f2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121725548b5sm147035158c88.17.2025.12.31.22.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 22:25:15 -0800 (PST)
From: Zac Bowling <zbowling@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvalo@kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	ryder.lee@mediatek.com
Subject: [PATCH] wifi: mt76: mt7925: add NULL checks in MCU STA TLV functions
Date: Wed, 31 Dec 2025 22:25:12 -0800
Message-ID: <20260101062514.186040-1-zbowling@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <CAOFcj8Sad3pLohFfRdj5jzK3Zs3FAjFVBuzH=80i_m1YqSbpfA@mail.gmail.com>
References: <CAOFcj8Sad3pLohFfRdj5jzK3Zs3FAjFVBuzH=80i_m1YqSbpfA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_222516_804235_09BA5519 
X-CRM114-Status: UNSURE (   9.45  )
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

From: Zac Bowling <zac@zacbowling.com>

Add NULL pointer checks for link_conf and mconf in:
- mt7925_mcu_sta_phy_tlv(): builds PHY capability TLV for station record
- mt7925_mcu_sta_rate_ctrl_tlv(): builds rate control TLV for station record

Both functions call mt792x_vif_to_bss_conf() and mt792x_vif_to_link()
which can return NULL during MLO link state transitions when the link
configuration in mac80211 is not yet synchronized with the driver's
link tracking.

Without these checks, the driver will crash with a NULL pointer
dereference when accessing link_conf->chanreq.oper or link_conf->basic_rates.

Reported-by: Zac Bowling <zac@zacbowling.com>
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index cf0fdea45cf7..d61a7fbda745 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1773,6 +1773,10 @@ mt7925_mcu_sta_phy_tlv(struct sk_buff *skb,
 
 	link_conf = mt792x_vif_to_bss_conf(vif, link_sta->link_id);
 	mconf = mt792x_vif_to_link(mvif, link_sta->link_id);
+
+	if (!link_conf || !mconf)
+		return;
+
 	chandef = mconf->mt76.ctx ? &mconf->mt76.ctx->def :
 				    &link_conf->chanreq.oper;
 
@@ -1851,6 +1855,10 @@ mt7925_mcu_sta_rate_ctrl_tlv(struct sk_buff *skb,
 
 	link_conf = mt792x_vif_to_bss_conf(vif, link_sta->link_id);
 	mconf = mt792x_vif_to_link(mvif, link_sta->link_id);
+
+	if (!link_conf || !mconf)
+		return;
+
 	chandef = mconf->mt76.ctx ? &mconf->mt76.ctx->def :
 				    &link_conf->chanreq.oper;
 	band = chandef->chan->band;
-- 
2.51.0


