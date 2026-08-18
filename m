Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39295C5DF74
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2026 01:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qgbYfTaLJzZ/mWrE8M0JIJXKh7owvbsDYdf4//0WP8A=; b=fT+f05NEZlvjuBx0L46r5GDOdT
	0Y+IFGUDmqiAPcBM1EHOnaBtc8J4vUJCxRdyP1Mbxl81if9BIURUyhohpqqi2SWAPiOqk50rkV2jn
	pMxnUxuiuIa6mhB+CL//6VRo0ahpf/Dmrk1HNNjxqFdzK9h6pa0LIdbGI+DeIq+OQTpjn3QYJwSl3
	NeowI2/VHcjcingE8ndxKeJFtg3HGx02YKr86IOPdRNDLxHG1H/gAoH9i5Z95bK8FnBa81VUpQ7gk
	98AoaemMqsEJJg5VdrCNpEL+qloBfcI1Rp9VOdDJ4bPxuqgCQFHJnJWy4IwpeoK5r1qITv2Xu9mOw
	If+CU+sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww92n-000000074dJ-2UPq;
	Tue, 18 Aug 2026 01:55:13 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww92k-000000074cb-05GB
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Aug 2026 01:55:11 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-66cad42593dso1551563d50.1
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Aug 2026 18:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787018107; x=1787622907; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qgbYfTaLJzZ/mWrE8M0JIJXKh7owvbsDYdf4//0WP8A=;
        b=A+k9MBF18lA0PCL/2gFP/3+Jqa389D5/Ibnr6S+ZMqYGo+cQaiMN0W2J+I3QGQXs18
         usf+8pmM+0m18TqfElhMtUOAjVPIjpio1ofMaoxTUPB84dIG4PYZAOpM+sLZnYfg3Uhg
         sgS6ZSFq2yp01Rd1Ik5BbN7VnKgkczANR9Z3A/qBW60ZlWuyxyBHAHqfvzJWBZ0aZt5E
         VL6qZj3LQZ+9ONkDRVG7fcviPnBFbiU2CW8TU36MpTX+mWFHUk1p/Uyz1dgPI1MKaqLe
         or95itVC9+aKCLiPMiEUbVqCWYcjIgtAudH/bM/UPIfgucOl1O9rpaGIwee5AmnjCGNM
         EgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787018107; x=1787622907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qgbYfTaLJzZ/mWrE8M0JIJXKh7owvbsDYdf4//0WP8A=;
        b=Iu6UIHIppgTOO7N9erEfpQLcoBpuZH1+b18Db9lMyzk3lSS94lU3wR0OZGhtGJALdD
         geNH2zJzaRBKREjNgLw+3afgdwroCFHkc8FF6yQ2nvnHjpZ/wwIhZ9QRg+GgQEiI8EWn
         48yt5PvlGdyvjYmYVF44FGMiFlYIpp+NbkEaqQH6xervPKMnpR9f3X+gi6/6HDt6oyrR
         iFL8Pkq1NpINzuk4w0IQRI/DuuZJ50CUWs7fSSGTC/t0LgHUVsPxccMNSw7SLjW4cMzW
         E5se63UpXnG9rvHC0/2e7NPs5E0AgNTdxsDHIV/nWBNjCzxEkGr656JeBVJv+PLOsyMV
         ED0A==
X-Forwarded-Encrypted: i=1; AHgh+RomKqL/almgC0YYlLjPC9oFsXNoO1/vMKkhyO/1Qg9NShgAW2i5iKZAvws4aSzgjvEOL/GCbf2tf55NHDjAsQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTxnU73Yg4gpGumUKZEYHHl1za/64J+xmdCR9uvL3GjRGHf1tu
	T/Ugc+wYLBZi4acG+kuygQH/8u6sycRY8yH5cXCmskG0nyaL2VT2ukN2
X-Gm-Gg: AR+sD13vAmbxBVyRnrqrqOTRJzoTccmTo6XdzYJZu6+QbqksVyApsaEOs6fHojJAmV3
	YPb1Yj4QrAN1jxwP+xfhiSlBi8XX6AG7UG1eIEEtkWhR3Prvp02obhGngMHVyPPnQWN+i7KUdGj
	UkXZEcSAhZtPgE8Zfk77XUjujD1IgR257NkARWU6LjgwECgkGNV9IGM2hPWbvyzTvyucR3JWbYM
	Igt5CeNOw7aj580X9OU9qe04yCKuF8qeWQ0V1xP6DQgCJ3bUQhAUBwWbmTHLnIP/fyTMMOWOyS1
	Ti5LmxCmJg/IDsOyYWKMp7Np/fRafCsoZ92A61PcQ/l4WYV3bJwEfUkyzrV4gsRlgQfUdtGUZKA
	VDm3cAYqblxr+8ZAIl48QSbRoAqHVkHljr2/ONptBPS7DgQb7bt2HhDE+t6HrAbnU0YxIFY9FTx
	9XBbiq2uEg2O08rPzBTSs53KHT0OkYPM45VqGi7GXo2Px/V4Bu9TbyIIjP+m6aAHxwRRAGZlsxT
	cgt5gyJ+u78dmRoYzP7ek7L7pMTzmERtp4bXBCNPJE9rSr2MI3agN3nPVYehw==
X-Received: by 2002:a05:690e:1189:b0:667:a95b:59f0 with SMTP id 956f58d0204a3-66c72c826ccmr9003965d50.34.1787018107417;
        Mon, 17 Aug 2026 18:55:07 -0700 (PDT)
Received: from tux ([2601:7c0:c37e:2360::6219])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66cb47a6f8dsm1598940d50.16.2026.08.17.18.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 18:55:07 -0700 (PDT)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jeremy Yu <chengwei.yu@mediatek.com>,
	Stella Liu <yu-ching.liu@mediatek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH] wifi: mt76: mt7925: Remove useless condition
Date: Mon, 17 Aug 2026 20:54:40 -0500
Message-ID: <20260818015440.875703-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_185510_054787_F74CFA37 
X-CRM114-Status: UNSURE (   8.68  )
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

The condition (master_pref > NAN_MAX_MASTER_PREFERENCE) will always be
false because the variable 'master_pref' is of type u8 and the macro
'NAN_MAX_MASTER_PREFERENCE' is equal to 255.

Fixes: a5487a6824068 ("wifi: mt76: mt7925: add NAN MCU helpers")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/nan.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
index d260e803d056..8d13a42b72a8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
@@ -255,9 +255,6 @@ mt7925_nan_mp_tlv(struct sk_buff *skb, u8 master_pref)
 
 	mp_tlv = (struct mt7925_nan_master_preference_tlv *)tlv;
 
-	if (master_pref > NAN_MAX_MASTER_PREFERENCE)
-		return 0;
-
 	mp_tlv->master_preference = master_pref;
 
 	return 0;
-- 
Thanks,
ET
https://github.com/sponsors/ethantidmore


