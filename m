Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCAECD37A7
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Sep 2023 20:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NA1Kdxb7daymV0YxfPouFeomYl6O2u2EVjnI/tmIwsA=; b=LOU7gya9n2JTxq4mE6l504iyKp
	DXiT7mbcG1OcFUhjnCBMmW4LaffU7c6Kx41chmQ6uPxOieuHVVvYZVzQiI3/bsF0B7tqrLuPGVHY3
	ESPAZWXviJ61l198wgsaHXKBrvCV6cFh8AL775P8z9tgUWONjLO1aSSe6RjKlfdzHnQWNRFfGcUYe
	xfoqX/Hzc5o91LUjQoVdTHug7eLCXkXnK/3pQLM8p//B/gzqXR2C7DkvQ+9JWj6Pj+/uML4iCdOQP
	ABBEhtSTtYAahdZZsDNvcx5JUlA/P7j5+C1O2bKg9fb2GIDdzZ8dTbgqiruRiqi3Ce3IQZ6dEEPxq
	0TLn/MhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhF51-00BHxR-2E;
	Fri, 15 Sep 2023 20:06:19 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhF4y-00BHwf-09
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Sep 2023 20:06:17 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-68fb2e9ebcdso2113767b3a.2
        for <linux-mediatek@lists.infradead.org>; Fri, 15 Sep 2023 13:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694808374; x=1695413174; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NA1Kdxb7daymV0YxfPouFeomYl6O2u2EVjnI/tmIwsA=;
        b=KC+1Ho8dsS2QfKBA5Oxj1QElxUZx9tuFr8lERcM41ymUBd2iPIvsZ4KdkcqE8xk1KK
         hXdhpo+5CwUWG27ZMjcJUnSu1iqNo0+irnusGIaEPSh12oSeWOqFuKdcSu7Gnzbw+LJo
         JS9Bh45X/M25outTnriBdCgAayko4mWnMYwYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694808374; x=1695413174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NA1Kdxb7daymV0YxfPouFeomYl6O2u2EVjnI/tmIwsA=;
        b=ole2j9avEeAUiBA/DIe7ao0pqKw3nDRZqP/aUz7Cd0v2oSo3BuYb/V7rclE/hyMVpc
         yOb4qi5GsTGBLJtCW+tLFiCs3HYTNS5m5lmJ5xFLExRdDww5IKCHpMos2gKEylsykCNu
         tqBiHjT1j23PDer5Z5rwifYmuEa8EnDW6S4FzL7yE2Al5Mw8U4PkkfZY4rnaUX5tS8xW
         +gadDWYDFv3Dpgl3J7WS9SFy0KiY6zUrhcC3gJDucNINuyaVfYk1TK3tCQq5pMQB7Cph
         HGywhULjpZP5yXGi/mN/QzL9U7W2I0K/oMDqSDGsdgi2eg58o4lLZAQ9cYPjM3ElgQ6v
         AhWQ==
X-Gm-Message-State: AOJu0YxrAniVnvIrysFmqJ68aA3vp4vLVhKjqPnY6FCHWN1raa1qu+/g
	lNANTEaBpOGonIW1eJzO72MCsw==
X-Google-Smtp-Source: AGHT+IFke9xOUg8o+dOHQMGmNXaiNCKQ4Q7uIE2umqN8LSN8Mp8jp4PO0FBx8ts/vz9hu+v/WYKIrg==
X-Received: by 2002:a05:6a00:148c:b0:68e:2c3a:8775 with SMTP id v12-20020a056a00148c00b0068e2c3a8775mr2968885pfu.33.1694808374440;
        Fri, 15 Sep 2023 13:06:14 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id x42-20020a056a000bea00b0068fcb70ccafsm3331958pfu.129.2023.09.15.13.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:06:13 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: Kees Cook <keescook@chromium.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] wifi: mt76: Annotate struct mt76_rx_tid with __counted_by
Date: Fri, 15 Sep 2023 13:06:12 -0700
Message-Id: <20230915200612.never.786-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1585; i=keescook@chromium.org;
 h=from:subject:message-id; bh=F+6DHSa+ER+x+MQqlg0EvaQeoh8qJvI3pA3g8dGL8RY=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLk0Jorek+I1OQBAgJduc/L4Xg3jOs5WnEWt9
 MGRZATCBjSJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS5NAAKCRCJcvTf3G3A
 JjWhD/9tOUC/st1EceKH0gvMzRBD27QO4Nk+fG6Y9rJZUv16gV9EFMsoYqUSuRwgZy8/P9I+BVc
 mkHZtoGs6fWhEJtny0ZlAMmZdUHnicF2M7xIxIb7tZFMp8ryHV7g7tiV44qtuz3uQN5OR5/G52S
 Bn/tXp6kou8NrfLsJt1aauJtm7CgcykOJt93RH8I49CjsLVQ0mYrF78RZc+bromdT1TGY3lCbYu
 YDSjb1YGbcNcpayfbzfJ5jPwJU1gQAn2ZxQWEyrqc2J7py+yj914/HyikOMrYaVlgUrqBoOQpYm
 l5vhqamxGJPeuQpBh4WtZukLo3z/zlEjghImla5afiElmNqimHsGWRI55luMz6VjGivM2ekVN/S
 OzaBZMte8ZaHt365A6WesjhOeByhDLffpDTS5K13NGnlNJQZchkZYpeoPEx5OT0frP4OOB9o8vr
 C3RTak4zrGO4iFO1qPK1oI0qgvYa6AsmHUgus5elElfv5xavrh7yAAOJsGsbDmCh3TmV8te0Zb1
 0/wQs/l4sO4COIHIOrBNqNqVd8eilEgy2mRzPiEdVkwor2g0GCSU0wZbw2TABQ0flcoKda5qOjB
 PpNql+uzB7LJjZUtMa8HdL83infm7t7Kex3RaoAOWdRDfWmcI7i1ap4tETW5nwk4KrP0kRt2sxt
 gysLmbT Unzq0a5g==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_130616_109733_882AD868 
X-CRM114-Status: GOOD (  11.24  )
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

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct mt76_rx_tid.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>
Cc: Sean Wang <sean.wang@mediatek.com>
Cc: Kalle Valo <kvalo@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/wireless/mediatek/mt76/mt76.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index e8757865a3d0..03ef617b1527 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -376,7 +376,7 @@ struct mt76_rx_tid {
 
 	u8 started:1, stopped:1, timer_pending:1;
 
-	struct sk_buff *reorder_buf[];
+	struct sk_buff *reorder_buf[] __counted_by(size);
 };
 
 #define MT_TX_CB_DMA_DONE		BIT(0)
-- 
2.34.1


