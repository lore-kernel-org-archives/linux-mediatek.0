Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705AEC2BD09
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 08:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tSgiCYdbTZhBzsFtfZ0J5zrY/KOMVKy0kzRs5gp6JHE=; b=j8zi4BYBgdQox7B7/HrE0amhCK
	cYn2onAkoHgrbZY4tnykc4gmIkLOVz8Q8x5gskA+EhuzFewgIlyaZWfqZyXF5i9ZD4KdFypaVpMWS
	OOgfkz1DBNtYX9TRM3vpqzU3khYgcSj5cpwZlJoxmgGMn9X4IV0Zr2j8+NhVYxy+rd374I4UxXInn
	v9ssBKdPDEbwjclbc8sDa1sp9NqWvZz3ioT5iRp4zgXdlN5Kur0QBTc0cqTwtMLljLUkTMlrNQO8t
	/uQ7QxMfemR0Yw7yQ//14Na+G8f6JuBSl3bTAFevKMlxTyFmPs4A6ssRM81hn+doYCxp9lycnypUg
	OOxxW4Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0nN-0000000HYKD-0Pt5;
	Sat, 06 Jul 2024 08:29:25 +0000
Received: from mail-oa1-f45.google.com ([209.85.160.45])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0nJ-0000000HYH6-0wM6
	for linux-mediatek@lists.infradead.org;
	Sat, 06 Jul 2024 08:29:22 +0000
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-25cb5ee9d2dso294094fac.1
        for <linux-mediatek@lists.infradead.org>; Sat, 06 Jul 2024 01:29:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720254560; x=1720859360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tSgiCYdbTZhBzsFtfZ0J5zrY/KOMVKy0kzRs5gp6JHE=;
        b=sG/mGpDvNXTdKQwS40zNdmQbmjST0ZqWPa0QoxF+VOO1ySDNmN8NA7TnEo7GxtSwbp
         SHwEnj16X1Nr5rVtcqbAdqG66u6aRPBfllIc52+W9re7WHVIdvtHMJgX42FY3+ihFqFi
         C3XoguhH/2F3qutq8pF390v7RYKrrN/dzfTy+m8zeuggedCiJoKY2PKObKkwnkP+tnDD
         pQiOkqnneIFBD8a/YKq4Twd0vy03VOMAz5JKVQDBa05Bz7U29Qmqo48aR9O8UQPEOov1
         xZW5z47IhOzRnqfvKEc5Zkisn8stZlR9iIjJHGAiBZfWviWZddGlgrd8g2T+GpWpVUH9
         ChzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdgmDGpVS/PvXO1xS4tjh+cseRXxUEo9lnH14giEp3GLBnvXbLCh8dMAd1KXiAJ2XTPB3TV41/cFG3jXAM29kIOn+GdmvJwsVxtFTMzQox7BTa
X-Gm-Message-State: AOJu0YwD8LiyCEaL5rkuFZHMo1ShZ+gOxYugJjshAWbR4l3BhdLhiYTy
	PGZxy9Bc44HbUboyvCU5XRFN/m1SH1Xy1jV4L9Y8CTk/lOAfIV8G
X-Google-Smtp-Source: AGHT+IHhGg3iFxDo2Cp9FwlE6n+jfjMQJenn5uw1AfT1Dg/o0uAMM2XzXcgaZ5pmTtYm/eBBuFNP7Q==
X-Received: by 2002:a05:6871:54a:b0:25d:f237:e108 with SMTP id 586e51a60fabf-25e2b5a1bfcmr6904431fac.0.1720254560270;
        Sat, 06 Jul 2024 01:29:20 -0700 (PDT)
Received: from sean-ThinkPad-T450s.attlocal.net ([2600:1702:5083:7610:1e13:57ab:ecc5:1fd4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25e71070ba1sm10744fac.34.2024.07.06.01.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 01:29:19 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 34/37] wifi: mt76: mt7925: update mt7925_mcu_bss_basic_tlv for MLO
Date: Sat,  6 Jul 2024 01:28:14 -0700
Message-Id: <583a3ac10583cfef0028f9a0b5a4802fc4070b99.1720248331.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720248331.git.sean.wang@kernel.org>
References: <cover.1720248331.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_012921_303444_C69515CC 
X-CRM114-Status: UNSURE (   8.53  )
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

update mt7925_mcu_bss_basic_tlv for the MLO-enabled firmware.

The change remains compatible with the non-MLO mode and the
older firmware.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 908aed2eec11..5f2f866e3ce7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2385,6 +2385,7 @@ mt7925_mcu_bss_basic_tlv(struct sk_buff *skb,
 	basic_req->bcn_interval = cpu_to_le16(link_conf->beacon_int);
 	basic_req->dtim_period = link_conf->dtim_period;
 	basic_req->bmc_tx_wlan_idx = cpu_to_le16(wlan_idx);
+	basic_req->link_idx = mconf->mt76.idx;
 
 	if (link_sta) {
 		struct mt792x_sta *msta;
-- 
2.25.1


