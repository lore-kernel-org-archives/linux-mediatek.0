Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E12FCB63B
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2026 23:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yU7MPZjKMz2Ng+u3kVxqlDdH/Uz0ouRNr+7md13U8oQ=; b=QMEjtBk70kujcHU4z2vnIE28f8
	5ZTxCb1KaISJRHHBcjv1l7mUHWyJxq79G9EjPEpu4P/MOcqHZoKIIlrY5AkPDr4cc8/dSqZSmsUcS
	rv4IGlpDBWPC2MOsn1Ku775fL7U4Ci+Wap0jv49Pqry8azMmgcMC+gW0cqcKP/EAJfvu7JX/9i/vs
	m9N5vVLNtjv98+vPEM4sXm9+3+67+RGScUtuhexaIDHMUMNWIkbJIPx31Ao4l0aCa5QDX+tpOc0+B
	YnsbHY1w2rPqHnUXRUXCl7RJmiTvBt74HFpfL0p+hc58aWLt12mYXmNeeUDmwrxmvbiOda/3sIw3Z
	8YcyKW/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeW0-00000004dW3-15AM;
	Fri, 06 Mar 2026 23:23:28 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeVy-00000004dUW-0GbO
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Mar 2026 23:23:27 +0000
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-45f194e9a98so3603068b6e.3
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Mar 2026 15:23:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772839405; x=1773444205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yU7MPZjKMz2Ng+u3kVxqlDdH/Uz0ouRNr+7md13U8oQ=;
        b=lE2QZqjDy0Gpt8wzGhktO0AAp5r1P5mr7/tsb2Ksm7PIclNlnlK1E7stR3DocaBwJN
         h+Lb1tuJMfCHac7Yr4yDV5/zg0t0pULZVtIab1m4wINpnnU888S6+LfsSl6JDDbp3f0t
         STy4UGe9S10K4wmurT0Y9GFYcikOtQY1yM0lx+m9kT8jATMJbIDlWOf8o5QFo9Yku3JL
         tOokkATB8iatGp6v7VmhWZdkZ+Ubho8Ywd0MdxBsGfBDmd904sSgV490WpPpFESuk40Y
         Q70zLKI/fjM5lXRDsXYz7PHb2EBBJSgDp/3XZ5QLHOM92Kf8nwe8cPTSTdF1aAAsq0Wi
         tCLw==
X-Forwarded-Encrypted: i=1; AJvYcCVN1fNNCb8o9JJQVtc+Uy/KGksy/ghh1oLT2OlvjrGzxP+OH7GFlFJErPUHN3oJxh4tBDFAIdCidPindzoKLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8TjvNHAhJAAOkD/ZVb7xf/+IIFIdSVn0f/4Ftx45qqO5/fdh3
	5M/OwShqS6RkDF9c9tILO48LED21TlXQZA9z7jQOHC9dzPidqRzAXXfA
X-Gm-Gg: ATEYQzw8d0Q27xBPnsxacV2diid1oKCfzHx41TWDIbWKfUDGOSvLVzU1SGQ2ZsJSQBd
	puFfJfxnFlOyrg0ufN7MVTyMcwgJ8MQQbEsXVU/m9XbICA9lbHj3+xN2DRlZZ3AjkGOFRHMhqYh
	FQP9MecEf6kjlZN3TqPFYMVBcUq5ub35Nppgy85/MNQ1i+OKnONZjIs9MudwaRIATdteQ7X9dzM
	GdBhE+6EnsvljzxaC4ativLgHyOKA4JKe93oMuhWsw2mNvqhvD/nxldVwqaJ2TtgxZCQ8YvSxfi
	VXt7Q3SXESVUY6L3apiElar63ut7H4SAudi6PvQ2bjfbbxSvrn+ioyrXh7u5Cmw7h4dVZohSHCX
	YGyJwznJ3qv+EtRWi36nHqX9+SAI584RgNb6W4OqdZklo/lwcgOp4JkN0bSg3up1nZZ8ZF9CKh0
	nkhJ/LBo8JaRF5UNx4NRIEdjEhgpf/8MHRPqbkTaf6ci5k+1M=
X-Received: by 2002:a05:6808:3025:b0:45a:8cdc:669 with SMTP id 5614622812f47-466dcb9a23emr2150875b6e.59.1772839405224;
        Fri, 06 Mar 2026 15:23:25 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-416e65b1c82sm2572344fac.5.2026.03.06.15.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 15:23:24 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 05/19] wifi: mt76: mt7925: resolve primary mlink via def_wcid
Date: Fri,  6 Mar 2026 17:22:24 -0600
Message-ID: <20260306232238.2039675-6-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306232238.2039675-1-sean.wang@kernel.org>
References: <20260306232238.2039675-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_152326_111942_6F3CB8F8 
X-CRM114-Status: GOOD (  10.72  )
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

Use mlink->wcid.def_wcid to obtain the primary mlink in
mt7925_mac_link_sta_add() instead of calling mt792x_sta_to_link().

The primary link context is already carried by the WCID, so the extra
lookup is redundant. This makes the add path follow the existing WCID
association directly.

No functional change intended.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index c65e32a14c01..d7a09a0a79fb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -927,8 +927,17 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 	} else if (ieee80211_vif_is_mld(vif) &&
 		   link_sta != mlink->pri_link) {
 		struct mt792x_link_sta *pri_mlink;
+		struct mt76_wcid *pri_wcid;
 
-		pri_mlink = mt792x_sta_to_link(msta, mlink->pri_link->link_id);
+		/* alternative lookup via def_wcid */
+		pri_wcid = mlink->wcid.def_wcid;
+
+		pri_mlink = pri_wcid ?
+			    container_of(pri_wcid, struct mt792x_link_sta, wcid) :
+			    NULL;
+
+		if (WARN_ON_ONCE(!pri_mlink))
+			return -EINVAL;
 
 		ret = mt7925_mcu_sta_update(dev, mlink->pri_link, vif,
 					    pri_mlink, true,
-- 
2.43.0


