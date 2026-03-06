Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3140FCB638
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2026 23:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cSWMrYZtS1n25Dl0iRprlNJFhY2DHDNgNtXIVP/3MB8=; b=oF7vmjcY2EYukRvC0Z+qsQvT2w
	eQcF5Qo4vI4qOATofe//dKP8JlvqPZv7dUMacATlYY/aEyqSpX5Y4952xnvpYBw3XbZNMKZoS8cmp
	R6E0QzGgXfsS85Tp5ltlxRNzwmUWCoobVpRN0Zvx8oePgJICi2iX6IZEbwQZ2U4QOKUNESt/wOFSM
	7JtoMENm9hwTbprbZeQhycTe53/X/2qBfVVyvNhJSziBcJki5q9cLEv/PDqdBDFPay+YiH0hc/Af2
	NeEVvJGfGE0R2Q8esyGH82vzaB+gwYaacORSgkLTq8zQCHQD6xhoYLho6k85nrrqfYsHW5hi0AVC/
	QTMT5Xig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeVf-00000004dOp-035s;
	Fri, 06 Mar 2026 23:23:07 +0000
Received: from mail-oa1-f53.google.com ([209.85.160.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeVd-00000004dOT-0Vvv
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Mar 2026 23:23:06 +0000
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-40ee486a76eso3277025fac.2
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Mar 2026 15:23:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772839383; x=1773444183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cSWMrYZtS1n25Dl0iRprlNJFhY2DHDNgNtXIVP/3MB8=;
        b=D5aFFPviBKjJawAaWDd+rMnm36+2yNdAqvDulqWnSjO86TcCBHhwaOmIKjOe8fogig
         QCznElyJjUznabNTZJ1mcWYA2ni9R8srNd73pJMkH95r23vz5K78p7F8x65WZtNKvnXI
         L/+hXGHil2tiOjcaqW9QMm1AOkgQ+l8n1hFIeMX1kDj2MsMC88dVHAb2gDKHgcftT4QX
         nIIACkYZ0LBtOebpAVkPlwXcX7uQOfoSy5gwMYTKVd3hJuWD+CqDMABKGQwNGL/23DZE
         pN4/SajPf6p3q6v1XDlgZSSNhXnSHB2tXxlgPmbYPTXFgVljlLnUgS3mPnm8TTMWVh9b
         RdEA==
X-Forwarded-Encrypted: i=1; AJvYcCUWAPtLaAW7Jqk+KEfVDrRTf3eAdFejJythAd4CJqVMKfGryGVC9UT4YA/X75fx9YOBjktOQ4FXb2cXS0F88A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0NN9KefBWP7wYRjtjaNft4A0MYsuvZPEDMnM8o4NLIJtleA6J
	7QOI0SHPQoZ4y45NxyFUOoc4fm8xN5eN7G8IaGO7B9w7sZsxxA01euzS
X-Gm-Gg: ATEYQzwLHbgBxlguM62u16vU5upnAdwVPEYnPAE5V9tZGigTwpiRy5WQSW6XdhjC2KQ
	OIPq0D0GqVgVOT5bk8T9w/ZtcrL7XWfEbdPixuMZAYkUDFEarACXTAgKjoXRlB5AWYQxmsdqY4w
	f+T7Fyizk64pFreUc+QJTq6jMxfdF/wvkyN5ZMwxo280Q8hO4obJjIVO2LpJWEIUvOaTzxv9pvY
	PO5ikcCcdwQzWb/n/ed/CWnUkxRIOh68/lRis654xMl0iYYCelyXduDEkG8a/7bRfcJQKBacC2M
	SMDEy+bkzJ7cCeyhMsSf0DxrjzNQUDSErYrtVDGhDYHYlX9NNgbN8zfxlG1UQMGmpu/Hq3SG7nm
	md6kWd07Ke+oPk7fpDLgrXLExYOSmGINxPkrDitVkWIsAoSZdKtmSar3ObRnNZJ4Hu+JOESjP4v
	rXRktqjhV1C9rWkQ7VyGpQXWrXJX4OOMtEHt/ZNwI4SBioAB0FlmMWyq29BQ==
X-Received: by 2002:a05:6871:6084:b0:404:16c6:40b3 with SMTP id 586e51a60fabf-416e4493925mr2449023fac.37.1772839383291;
        Fri, 06 Mar 2026 15:23:03 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-416e65b1c82sm2572344fac.5.2026.03.06.15.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 15:23:02 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 00/19] wifi: mt76: mt7925: fix up MLO link lifetime and error handling
Date: Fri,  6 Mar 2026 17:22:19 -0600
Message-ID: <20260306232238.2039675-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_152305_165382_92606D01 
X-CRM114-Status: UNSURE (   6.31  )
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

Hi,

This series fix up MLO link STA lifetime and error handling in mt7925.

The current add path may expose partially initialized links and does
not reliably release host resources when firmware commands fail (e.g.
MCU timeouts). In addition, several helpers internally look up mlink,
creating implicit dependencies on driver state and making the code
harder to reason about and maintain.

Switch link STA handling to RCU lifetime, align WCID publish/teardown
ordering, pass mlink explicitly to helpers, and add host-side unwind
logic to release resources when link add fails.

	Sean

Sean Wang (19):
  wifi: mt76: mt7925: pass mlink to sta_amsdu_tlv()
  wifi: mt76: mt7925: pass WCID indices to bss_basic_tlv()
  wifi: mt76: mt7925: pass mlink and mconf to sta_mld_tlv()
  wifi: mt76: mt7925: pass mlink to mcu_sta_update()
  wifi: mt76: mt7925: resolve primary mlink via def_wcid
  wifi: mt76: mt7925: pass mlink to mac_link_sta_remove()
  wifi: mt76: mt7925: pass mlink to sta_hdr_trans_tlv()
  wifi: mt76: mt7925: validate mlink in sta_hdr_trans_tlv()
  wifi: mt76: mt7925: pass mlink to wtbl_update_hdr_trans()
  wifi: mt76: mt7925: pass mlink to set_link_key()
  wifi: mt76: mt7925: resolve link after acquiring mt76 mutex
  wifi: mt76: mt7925: pass mconf and mlink to wtbl_update_hdr_trans()
  wifi: mt76: mt7925: make WCID cleanup unconditional in
    sta_remove_links()
  wifi: mt76: mt7925: unwind WCID setup on link STA add failure
  wifi: mt76: mt7925: drop WCID reinit after publish
  wifi: mt76: mt7925: move WCID teardown into link_sta_remove()
  wifi: mt76: mt7925: switch link STA allocation to RCU lifetime
  wifi: mt76: mt7925: publish msta->link after successful link add
  wifi: mt76: mt7925: host-only unwind published links on add failure

 .../net/wireless/mediatek/mt76/mt7925/mac.c   |   3 +-
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 221 +++++++++++++-----
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 180 +++++++-------
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |   7 +
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |   8 +-
 drivers/net/wireless/mediatek/mt76/mt792x.h   |   1 +
 6 files changed, 280 insertions(+), 140 deletions(-)

-- 
2.43.0


