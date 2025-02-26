Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49FEC021B2
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2025 00:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0pletKUouyioVsVZF/fqts8NACaRbQSVihtm5ubC1Lo=; b=Em/ZWPpsb7uzm+SQjA8+luqwCX
	0GKv3KyN8PJG3cHmm1Bo8liLxZxaL8GFV9tMz/APmxpU/FPQI9Q4EJxlQsO4B2hZ6hdqx3y8HJIjM
	VztMTe9CP1izfMzcAkaXtiwWymsMf9zRJQHG5+oJkr7BlSYkr2yL5AXOB20TyxGrcHOR/DeMdiZEz
	o0dd1KAuphln9K3R/6/AUsSqPqpMi/mL4vid+UQvbG8OZLsMOKSnbxnTVvFxQXCvJt2ZV/FN97o0k
	7fJh4AZ+99cNTjWiAO1cyVZaUoDBUhKEpuIC4OXNC2+udF4r6LKWLx7AZLW1UyNTObZFqtTe1zORn
	ufo4QZZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn5PU-00000001sxv-3R3L;
	Wed, 26 Feb 2025 00:36:24 +0000
Received: from mail-oa1-f45.google.com ([209.85.160.45])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn5PS-00000001swj-3Pfs
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Feb 2025 00:36:23 +0000
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2bc607b3190so219461fac.1
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Feb 2025 16:36:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740530182; x=1741134982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0pletKUouyioVsVZF/fqts8NACaRbQSVihtm5ubC1Lo=;
        b=JHzno3vUkDpE+JXSskX2CPgwx8IovCqqxeh+F/Vfdtq5BluF89ca6fAQFzCJuCtJjn
         LzVazAkShddqrw2k8T2rEfRyL0LonaxwaBDEYbh3OYk/ohw4vHCeG1+PZB6STFaw/7Hd
         PrNEVy5I+q7lUVmYNmnTbUQ176EvKph+gww2qBKYlFF11tz01/ujzXEFX4shiCebC39o
         iUTBIk+LORGRzsuq41IRZ0xOwWvsI0HMrq2ruMBAvlvcUipqu3nRERNlkceotdGnGygi
         RN8zNcVlaenZEChsLA/9nNn8rxTAxKX7gki3ZZ4F6GroApW2RTx8TuBGb7IRH2VbmhpD
         4ATQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkG+/8V94bHz2zAvYWi+19QIy6FktlvvJKjgR9vYVwy3q+xVfAmTjaods3t2+L66fVKnjX7kVJNPCoGtrh/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YziCuOKhwM6qhm8J/NE+vgGGmJdATpOBpzrCPChy5O9gmW6HjnL
	QZIK0JTqdrricHk1rLehTLxVjU819qLXW/T7G19DFj/hZkeXo9Vv
X-Gm-Gg: ASbGncs4ML+hgl5s3ZlfUFNlxl3hW4HFJ0RGUXCLqYLRhT9crZ5vyqQln3Qp1GwrP9b
	6lP3t7OMnK3/GC43Npsk6QRCCetcrlBU31tUdhj4NUCWPSZrUmQLwBcRv/5NMcEz4luu05g5fyx
	k6HTzCALOiUdjf0g2VY2DCHrt6J0yagOEbBLO389FmAu/OrlYFYHe5wuTZq2NtS7PDKmyIS0NgW
	oPnqosfD9pXHbLnUXE6ZgOCgUUlCy8Wmpi8gwnm7rdOgCL/q367vU2lqt6Jx2BdS6PhC9RTooL+
	G0VuYzowpieawA0dgUJ1HUkYKRo0F62APyHyx43GYx0=
X-Google-Smtp-Source: AGHT+IE+KnU9djLUwIDgiUckZlw8WOzgnFVOrJr/Sv1no+MvEyc/jKn5lo75RCkmsvMmoTwWdtXnbg==
X-Received: by 2002:a05:6871:d284:b0:2b7:5726:c931 with SMTP id 586e51a60fabf-2bd50094ebamr12702438fac.5.1740530181668;
        Tue, 25 Feb 2025 16:36:21 -0800 (PST)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7289dedfcd8sm507149a34.16.2025.02.25.16.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 16:36:21 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH v3 3/6] wifi: mt76: mt7925: fix the wrong simultaneous cap for MLO
Date: Tue, 25 Feb 2025 16:35:53 -0800
Message-Id: <20250226003556.82644-3-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250226003556.82644-1-sean.wang@kernel.org>
References: <20250226003556.82644-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_163622_856337_AC1FEA2D 
X-CRM114-Status: GOOD (  10.92  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

The mt7925 chip is only support a single radio, so the maximum
number of simultaneous should be 0.

Fixes: 86c051f2c418 ("wifi: mt76: mt7925: enabling MLO when the firmware supports it")
Cc: stable@vger.kernel.org
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2, v3: generate the patch based on the latest mt76 tree
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 4f35c2f16d0d..604f771af68e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -256,7 +256,7 @@ int mt7925_init_mlo_caps(struct mt792x_phy *phy)
 
 	ext_capab[0].eml_capabilities = phy->eml_cap;
 	ext_capab[0].mld_capa_and_ops =
-		u16_encode_bits(1, IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS);
+		u16_encode_bits(0, IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS);
 
 	wiphy->flags |= WIPHY_FLAG_SUPPORTS_MLO;
 	wiphy->iftype_ext_capab = ext_capab;
-- 
2.25.1


