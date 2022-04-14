Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39A9C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 09:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R7n17FhiTD9nIlsNgfYQNWKSWk+13vuGVZZf34QD500=; b=gLnPSMbRaOWbbQ
	e+x1RV4FJ2xVHTNoHP+vTNBQU3GKd31Qt4174910/Sf5WFk4J8Wvw+9LPlxaqhAJTHnNjB9uZywdh
	C/SWzx9HcxFNzHJAglZevO4kYwb7X5/uHkrGFLyVytDr7yXPZjDERQmuJUgXWyI0Eycjq0qzEaA3w
	GBDwu/Tlf7c08IS+HZ8suv8Ew6AyVsBK2u2yzUCbs0nptFfD9tYrq17ZFgNsr4QFYM8cno62ySXrR
	cMduIA4oI5DjHV5DadhXty+huGUZ6vI2FGFXbbxq0QdHQuhdlfOq6QrTfQQT3D99VCny4tRlj7YG5
	M0jZNtp6TcMmliVNus6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1newEf-004zut-Bg; Thu, 14 Apr 2022 09:57:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1newBt-004yJ5-Sm; Thu, 14 Apr 2022 09:55:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=qz4eoGCjwqiVTIGhSK37UOjVOVCpyvZrQ4WRtbzGJcY=; b=IgfvKo4LKq04joEXIakfL/33tZ
 /oHC44RXNJTHqMR4lnI6mU/+krly5kPi+SMPImQSAizJaTHbbp8Oia3nSIJZjnlAJMZBO+BoDbYk3
 k2JLdHbB15hdkmr825U1HwR4Us3/MS5uPDPQIs4SyzKRMBs7nhvOuAMm6aJ0ULYPaNhiZwaZ1VWfc
 5acF3FK0aVjHjt1FdCa4sNKcZZR902GA0HXDWTVo7G6iwI2c4ksKAO0Ud7Htd2OFBYFJsVT2bkYZg
 Q12Qn+J615uDYMDHSSzdIL+K0G9fJD5aQK8I8wL02wM8m0km1IkVTmGMKRt+7QmtomgGNLJ8bKsa2
 YON97ZtA==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1newBZ-004yp9-GE; Thu, 14 Apr 2022 09:55:02 +0000
Received: by mail-wr1-x42c.google.com with SMTP id p18so5337194wru.5;
 Thu, 14 Apr 2022 02:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qz4eoGCjwqiVTIGhSK37UOjVOVCpyvZrQ4WRtbzGJcY=;
 b=o6Q2r7jKuN5KwGswZCLVojX54AFIYdM8E7FrOjUvQcnVhxqQaEAlspQV217XzhSoAv
 HD0LmIr8jJ2vFXbfZwCw2TPEHTwaaL4g+qu7J4ZEC0nGohy2w2QiiYlPq1SoyfDNhbVw
 Jr8PQ88O8YL6MDLMXDXARCdmw4Id3hifEtFjffLRP7opy6qBf83OePZLNAFo1V/j/j9p
 M8SbmFrrA3oFhfoRsrHLZaEJjLstgP49/4bGHjOqMNBt8wBXBfChyvkUyhUWZzrLEZTq
 tfY1JfDmZWzim41tkAtdj05+o4/hu2EdCVtbQo0tROIKgQDo2/nUJxuN5C/cUoThnV/Y
 07rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qz4eoGCjwqiVTIGhSK37UOjVOVCpyvZrQ4WRtbzGJcY=;
 b=0DV7Ui0YJLhED7uf482DrqXB+Oc48sZZN8AyNAwTCvgo30G3uZcDbbGZnXn78O4Jpj
 b9hR99/sugbnuMwsQk5R71PxJqRSVH1fZNM816mmN9Ui37Nr7n3f5cro9VLpA9F+OeSz
 DdG3UPtoTNuNk0sxd/ej4HiwwPx71CoYPf/qxx6X2zFYBweKAAwiG8rNbXW3Q/ejjS0i
 lBWrfg5OO/WtflOVirKF52QkzhXiH4zt5x4TzQnD5VdyzCBMU37iWuM92QuetQgimseV
 35kGoPN2rvdi9eqZLFy7FUoz6/GwUZSKrrZP4w4113u1BSxUxsMHKJQPFndFHZj+qPbg
 mLcA==
X-Gm-Message-State: AOAM5309mb0C9WEyq4MVfQJUITJe5JNTzp1krN0709ew2YsPucauhzly
 Z4850VjLjBleLf78aWpxJkQ=
X-Google-Smtp-Source: ABdhPJyJpElLXIDRtcHN0en+en7f4nKd00rYFyVmnDPQ66HEr4AxsmGykL5nNAhtm9fVYQ9i1B0T5g==
X-Received: by 2002:a5d:47cc:0:b0:204:1c9d:2157 with SMTP id
 o12-20020a5d47cc000000b002041c9d2157mr1421460wrc.294.1649930079091; 
 Thu, 14 Apr 2022 02:54:39 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 d14-20020a056000186e00b0020405198faasm1633727wri.52.2022.04.14.02.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 02:54:38 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mt76: mt7921: make read-only array ppet16_ppet8_ru3_ru0
 static const
Date: Thu, 14 Apr 2022 10:54:38 +0100
Message-Id: <20220414095438.294980-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_105445_970578_5E349C08 
X-CRM114-Status: GOOD (  10.76  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Don't populate the read-only array ppet16_ppet8_ru3_ru0 on the stack but
instead make it static const. Also makes the object code a little smaller.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index fdaf2451bc1d..d400a3297b0c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -12,7 +12,7 @@ static void
 mt7921_gen_ppe_thresh(u8 *he_ppet, int nss)
 {
 	u8 i, ppet_bits, ppet_size, ru_bit_mask = 0x7; /* HE80 */
-	u8 ppet16_ppet8_ru3_ru0[] = {0x1c, 0xc7, 0x71};
+	static const u8 ppet16_ppet8_ru3_ru0[] = {0x1c, 0xc7, 0x71};
 
 	he_ppet[0] = FIELD_PREP(IEEE80211_PPE_THRES_NSS_MASK, nss - 1) |
 		     FIELD_PREP(IEEE80211_PPE_THRES_RU_INDEX_BITMASK_MASK,
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
