Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE52C5DF9D
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2026 19:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XJwi0QFK55qyeCrO86vrrS80VWeYk5fCjTfDDqIvZe0=; b=OqTWCZjvI3BhxzX/0q/Bv1yJ9v
	ADhehOA9l1BZzOqNoCyoARQ3dqwM4GSa73NWOUME8kPHlt3iul549Ne/Z5SQNj01OWHCfPDHs6iOU
	PyA1ywG7tqLBklg0X8dEht0h599wwXOXAzLRuPtC8z1ZoQ3nAhV8e/1dJ4DYC92iwqxeDX/6S6zNh
	PKrLNap1rj82f1mYvYdwVFU1kLUXCHNZtxYK9xLIieZuNnKdT0Xpkw8K6nWMH5LEFJ8HxFS7I7zbf
	Gm9fhpjCy5JXxlFZ6ven54mkUQWd4fdZpvGSFDotGIVxRzlA9fTkGLzD9xHJCojHwVpwHwYnX58/S
	EgzXkb8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyaix-0000000HKHu-0G0s;
	Mon, 24 Aug 2026 19:52:51 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyaiu-0000000HKHZ-3zZn
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Aug 2026 19:52:50 +0000
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-448b0ff4a57so5394838fac.2
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2026 12:52:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787601167; x=1788205967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XJwi0QFK55qyeCrO86vrrS80VWeYk5fCjTfDDqIvZe0=;
        b=iZu5DdabSdXFwGIufoCNmsmWGyfbp14p7nSrr9orW7lR9NUEXODfMcDWnYYoxp1XaF
         6kR/FnXNsIhO3SnAMeiO99sWyfzU1ZpfvSGUkta6SJIUz/XyXRQxKASy8nvebLoiD9Vy
         FswHSWwbVVJHR+rfNxSKOECjHc6b1IKARfStnIA/mr1dOvnZfgRErkCXoIfPTKUC/KRY
         cIh2Ho2fI/cfYklyAGbquFwUG/l+Xd8DuZap9NZGuf1XK5YZTSKJFDWKH+K4q444sUpA
         q+5dW5j9u3+TYldQFV6olHR5YoiyO7Ql7IgoZ9KrarwZ5qgEM923KeOuPC6cye5gvBDg
         ovFQ==
X-Forwarded-Encrypted: i=1; AHgh+RoWf0ABAn0a+gc1HY2WeuAVViGyZtnP2gIWlzUazM+OOGeXLMZdqqosLnGBUH8l7O6L4F6F9oeUHAwGU5FqcQ==@lists.infradead.org
X-Gm-Message-State: AFuF++llIzqSfIVe1gdJWIXs38fPz8AKFnIzlQnjtr0q1BX2q8hkuSab
	eZIIqMYLyIQ+d6Qn5vZ2jZwyQxpq4/9+oiW/idthDOAY1iVJghV0+zhm
X-Gm-Gg: AR+sD10MtxtDkJxkGl4ZlebrqM4q5hCcvHHrO2LeBrrahknQvGd/uypuOlWvnHZOwA+
	KJCSq9ptm0dNl+Qw/96hW3nnZo4+6uARNhjGy7lGoWizNnZxqozWyX4+ONj7JE/v7KKuKLXBfLl
	3hYW+9n0zjDoO2iGZNWaCO8S2CeJOFByoLMGcMenc6n6IqDXSPwuP7Euk5pWTA2RfbmwMhEIO61
	LgMrXISqhvSnWmsBRqE6d4vrUVPj9nu4FVxRSB8RTT8a/7Sh2RZQSjzv9N3UWvm5oJ0aB6pdFuO
	bZSZV1e6H4LVcgd3hpvhnLy8cTV1MVPE0DQjPjT9Q5ganhbCoqOPt+WdVezdCh+eJ6b0S3WF2Wo
	Fa0dFYH8J2gDElXLP9/l+rTRjTpzfmMm5X93NG2XCn9pIR715M8AQyOIR9vAn512gskPqiMNAAK
	K3f55rNJy26zrjZNyh+R36Py7Cujd2yeHZ9xuj2uU79LIUhqJI5rxKCw6m1krE1dlVAzHZFhbz8
	cB3xzTJgvIdzkzsI1xdQhAhmgcQFCZXAUah0U+iS0Th
X-Received: by 2002:a05:6820:612:b0:6b0:1ba4:dcc5 with SMTP id 006d021491bc7-6b1904bb382mr889480eaf.20.1787601167058;
        Mon, 24 Aug 2026 12:52:47 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-463835bcdcbsm5805896fac.18.2026.08.24.12.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 12:52:46 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Sean Wang <sean.wang@kernel.org>
Subject: [PATCH 00/15] wifi: mt76: mt7925: fix NAN operation and NDP performance
Date: Mon, 24 Aug 2026 14:52:12 -0500
Message-ID: <20260824195227.12589-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_125249_016222_735A65A5 
X-CRM114-Status: UNSURE (   6.52  )
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

This series fixes several MT7925 NAN issues found during interoperability
and NDP testing, including NAN startup, scheduling, peer configuration,
DW handling, ULW updates, and deferred schedule events.

It also fixes HT/VHT capability and rate configuration for NDP peers.
With the fixes, an MT7925-to-MT7925 NDP link reaches VHT80 MCS9 NSS2
(866.7 Mbps) with about 290 Mbps UDP throughput.

Jacobs Wu (2):
  wifi: mt76: mt7925: support deferred NAN schedule update and cluster
    events
  wifi: mt76: mt7925: fix HT/VHT caps and rates for NAN NDP peers

Stella Liu (13):
  wifi: mt76: mt7925: fix NAN NDP STA record role index
  wifi: mt76: mt7925: fix NAN start failure
  wifi: mt76: mt7925: fix NAN committed CRB timeline layout
  wifi: mt76: mt7925: report only 2.4 GHz NAN supported band
  wifi: mt76: mt7925: drop unused NAN 2.4/5 GHz support config
  wifi: mt76: mt7925: drop deferred NAN local schedule update handling
  wifi: mt76: mt7925: use OFDM-only PHY mode for NAN STA records
  wifi: mt76: mt7925: share TLV setup for NAN enable command
  wifi: mt76: mt7925: replace NAN DW end event with DW start
  wifi: mt76: mt7925: fill all DW intervals in NAN avail_map
  wifi: mt76: mt7925: clear CRB before deactivating NAN peer record
  wifi: mt76: mt7925: add ULW event handling and peer ULW update
  wifi: mt76: mt7925: configure NAN PHY setting on enable

 .../net/wireless/mediatek/mt76/mt7925/init.c  |   2 +
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  47 +-
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   |  12 +-
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |   1 +
 .../net/wireless/mediatek/mt76/mt7925/nan.c   | 689 +++++++++++-------
 .../net/wireless/mediatek/mt76/mt7925/nan.h   | 101 ++-
 .../net/wireless/mediatek/mt76/mt7925/pci.c   |   1 +
 drivers/net/wireless/mediatek/mt76/mt792x.h   |   8 +
 8 files changed, 569 insertions(+), 292 deletions(-)

-- 
2.43.0


