Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C8CD358D1
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jan 2026 08:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wH0KX/wkF+O7L7rR2/DvCIQEVEq5fxSeUKic9d804ME=; b=H3EO6gSk7qFjhoifQhOuYyZOPX
	lqxxL2YRrMyZ+WToCp0RcYHio8Xiw+BAMKB49MySGymvhDecIXy1HmWIL9+tU3WpaMGlZUcDaQp+l
	5PL5d3RB6pfA11OrgQ34d5JIqaEC223mBZmlwDn+topJM0U+JRThfNaYAUboz7xkulIjJul7mIcfz
	ACyhr8nRRYJz0E2fdVD8KnPOWZHjVDbv+H/f19ARnF+9inzkdV7RZqJAgaQoK8goCqRiG3i11H6MA
	4/3kBwfvl9I8ahQ/1FoSbEwsaU4MGUSJ9BzLPYftBlhcTYCLbgpvwVIQfFzCCZRujvceqr4DeR6QK
	XgJ1PNFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlNEn-0000000HRnI-3vQw;
	Thu, 29 Jan 2026 08:18:49 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlNEl-0000000HRlW-3Wqb
	for linux-mediatek@lists.infradead.org;
	Thu, 29 Jan 2026 08:18:48 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-124566b6693so1866914c88.0
        for <linux-mediatek@lists.infradead.org>; Thu, 29 Jan 2026 00:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769674727; x=1770279527; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wH0KX/wkF+O7L7rR2/DvCIQEVEq5fxSeUKic9d804ME=;
        b=Kglz+rsmyqITIA4nGk6BEr60uM4EKBgIR858F/7Cj/l9ryE6eEM6kNb6mzqFHdd9I/
         +9TfCWJMR3lpgyAf521KRH0BcVCy0nFqcgeyf+tLvsXEDZdPzZMkuLVYr6Yn6FtbUY04
         51gAJzQKZfxAnGT+KR+pS3bm6eAHE6APBqy9jKh35z5xVR5ZQMBndnvfWFIou8lQ+eJR
         zxjdoOJ4+Q47iwoTkLs8VwsUfZCNcsHGuXcbpruCSVU/7tUuH9l8qhLYN0hi17uZ8FPf
         8evtZ61aMg+1aNiBicHmIwqxXgq5mkFlze61rMbEMrqwo2Cl5B+rj+OeQRTRzmSV4oRu
         DCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769674727; x=1770279527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wH0KX/wkF+O7L7rR2/DvCIQEVEq5fxSeUKic9d804ME=;
        b=eOvExdUez6Ea3dTeDcxarLEdktBd1jrjM/cRT0kOVVikZeOX6fMgok1bdsSum312bP
         VvDgH6FygPX1I3qmwZgE6cK1QGj+d4Mjdd6yC1Ww///KnI6Mbeq2pe8L2d3PGxFjt0yz
         +jqpXMjudwTpr6ZOabddjfippoYBKkiHS3W2DBd73YR7afpE2eCxmzoNbZrk0hs7+lCv
         4QANMSN/XPwMnUbdFZfNeFRvGggmFjCmFRjatI+TGLuXsowaYdQbLQeD4r7wrS/fuLAK
         z4LGMviw2VQnN8FHttotbN7eR8pA2P8d8Pf1CpEyWceEyLrXV/60Qxhza6SPimm6uYqU
         u7vQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3u6m5AgsJ3Fzcy6gQmR2O6jpEcdTIuef7L3oTd77qCTADXbUrcQDV7h4sBe8TYjWxFUYgHIBRO5Id2NdURA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMdPJxC6sxGtXfjCB+uLpmekfx+NTGXbqpFwsSSkwRqGxrh5S/
	A45lCgIr/sYG8L/6MgsgwcbA5RXirU5+IDzeHMgGmJ7ztz+QUK5JG5+/
X-Gm-Gg: AZuq6aI+8/kpVs4VCA0m2EuX8oqIvPDuHHT/7iTcCdxrJgKM/1Sua+1Ihf/a5BoVjVB
	ggonW1ZSqDhYkDUwBjKX7UI+Xd+0OSWRZoMilpnD73xCAWt6UXpNKPrU+8l5O3rvwpxMKELoetj
	pACAUK3aYZHI7lBQBWR5CODNDFvSAMDYulVXE316FCPCnL5AV3Hhto+EVNYOPwnabHJxEuWH8HI
	pC2d15cbxQoXwqMMp2W0K6OH4sraIWkRKMAlwhRYESyAp9sCO24WBoA1+nHJn/UOFIY1Jqx9Vbq
	T+8ShBU6EshizgmfIHxuS4hc310mTOWNWx3fmcV4ShXIm74z+B6Rvxxrf1dUac2zxfjvB1cuCwo
	Ho6K26wjZU0xEWt7rZFCTOdQ4hD0QPLeAgpObQ+OWYZCeYS7uq0QmbDwTU1h5GFEaxd3SQE8ffO
	XjKtAceJZqrfy5FwXgyRbL4PEBZlr32Awx3YKyc36Zh2qelSnms1k9Didt0uEP
X-Received: by 2002:a05:7022:4a3:b0:11b:65e:f40 with SMTP id a92af1059eb24-124a008e6a0mr4875096c88.5.1769674726799;
        Thu, 29 Jan 2026 00:18:46 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f31e:1cb:296a:cc2a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9efb4casm5483508c88.16.2026.01.29.00.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 00:18:46 -0800 (PST)
From: Zac <zac@zacbowling.com>
To: nbd@nbd.name
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux@frame.work,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	sean.wang@kernel.org,
	sean.wang@mediatek.com,
	zac@zacbowling.com,
	zbowling@gmail.com
Subject: [PATCH v7 1/6] wifi: mt76: mt7925: fix double wcid initialization race condition
Date: Thu, 29 Jan 2026 00:18:34 -0800
Message-ID: <20260129081839.179709-2-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129081839.179709-1-zac@zacbowling.com>
References: <c9b81e89-cd29-44f2-b4e8-0179b2049c21@nbd.name>
 <20260129081839.179709-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_001847_903797_1A52BB82 
X-CRM114-Status: UNSURE (   9.18  )
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

Remove duplicate mt76_wcid_init() call in mt7925_mac_link_sta_add that
occurs after the wcid is already published via rcu_assign_pointer().

The wcid is correctly initialized at line 873 after allocation.
However, a second mt76_wcid_init() call at line 885 reinitializes
the wcid after it has been published to RCU readers, which can cause:

 - List head corruption (tx_list, poll_list) if concurrent code is
   already using the wcid
 - Memory leaks from reinitializing the pktid IDR
 - Race conditions where readers see partially initialized state

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 device")
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index afcc0fa4aa35..fad3b1505f67 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -882,7 +882,6 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 	wcid = &mlink->wcid;
 	ewma_signal_init(&wcid->rssi);
 	rcu_assign_pointer(dev->mt76.wcid[wcid->idx], wcid);
-	mt76_wcid_init(wcid, 0);
 	ewma_avg_signal_init(&mlink->avg_ack_signal);
 	memset(mlink->airtime_ac, 0,
 	       sizeof(msta->deflink.airtime_ac));
-- 
2.52.0


