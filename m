Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F9AC25B10
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 May 2024 15:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vEIqX+46YstO49KdzfUit+EY7cLOMRSSqZNN+MC6uM=; b=YqK8jrl2ghOCdpyzhF19FEzbwO
	eKwWqSrSbBHeMo1qgF/HQ6ORcEvJBdfZCQsWdxJrocv967GUhQQHppa1tRycCBsYY7exULgR3Cr94
	MCFe4PwHYZQLRx1w3pz0uLNgg7di8qFFkhUthbc29wV+af1EQsq41uCFqFqTOcOCr1ui2TzU1xUvq
	d3hid6qAmXKhc+gCbWZvUYQhiAfc3fSMhETO8UctaIKmsJj4mHvZrLeO0GXA5n9xeH1SR1IF0RTPx
	baSe6AaGp+mlpfZFdUl2hnd+3zvAp0ZWkqBMTANS1SZpnxoX6wlWOqCwa05mxbBrY3IYRUTuJfUfT
	U5LpzgJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2uwj-0000000H48W-0ZPw;
	Fri, 03 May 2024 15:35:37 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2uwa-0000000H40y-0yNT
	for linux-mediatek@lists.infradead.org;
	Fri, 03 May 2024 15:35:34 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-41b79451128so55219455e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 03 May 2024 08:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714750521; x=1715355321; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4vEIqX+46YstO49KdzfUit+EY7cLOMRSSqZNN+MC6uM=;
        b=MmdZQjOAr/i+zqDUnOXXtv/6omGcszMIUAxaXoxGT5a+3U1YAhrgK7FixSffIieNNg
         DpFRpxXq6KSTBmK+ZwmCgQYAlgiimKPYcTNEZMn/F8pnoNy8E5Y5eAhJ4CgZqPHb/1sN
         Mu16cDT3UKNc9po+K6dfG6O5x1vvbv40ksghHdf3l9p9UOCOOPSrE8kPBKZ+9ji1+PTW
         dTcNWoa6Fk6gyoF0lcOpFTS10u8+xUCkc0sgspXVN8oDpUJG5QvVUQuNye58RIX51Jws
         LYE+Xz6vFT0P1rbX8VF+/kcKqMjXR02QpPu6LsmktPXhqfdqpMv+c4Otc2pc7jNfxtOA
         cd1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714750521; x=1715355321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4vEIqX+46YstO49KdzfUit+EY7cLOMRSSqZNN+MC6uM=;
        b=nFuqyg/r67muNBVL4ox+32KeM5uIUKXn2ewhn3o2pO0RuRxWhHGzFq1FEfrF3hJXzp
         CRTJtcI3MAQ3SQ+1kSbCDRKUS0WKduAbULvnvh8Cdwfp3+A0MRA2n0LP68WHgSDGuzE3
         UCdMII+Ht7YSf5IGVz2wRWickfhmwqC/oTtqeehTyG7UHE0pdYANCXfiGjYbnXSJ3uSP
         53AFLDO7SN2TCF8Yzp7PHcfWFyKI5ziUW7Yl5+SWhlrtuK+Q8PXK3x0lZX6QHVhFQ8as
         mV+6gjN+YxBhSst84b/oo05okEjahTxsDwQbDbKCmHwIyo0xixCYnlB8f8tPRfwKopIK
         lBww==
X-Forwarded-Encrypted: i=1; AJvYcCW35wgt3oplnTwpl9OQjXBCSLJsUwVJ30+Mgrdvf+emsuFbtJDFxRUggzyus21eCc5rRqzMy+mRhPyF6BMUWWiWiIe/BHapoCxAstJkkUpcO9ys
X-Gm-Message-State: AOJu0YzswACeev0MDUjeRKEFPswWrhZm+QiTuiIkrnUjI8bmHT8z+Ob3
	Wp6rlp2PsqolSN5KOhmj9SOVkG7rwAgVbtih8hywggYxh8tzvaXNpuai/2W0jBQ=
X-Google-Smtp-Source: AGHT+IEeDubyf88dJ1F/c3Og9mfDQHnx2tPeXqImVG53S9rY41X7jlVgH6PBon7anUpjzltE+G0flg==
X-Received: by 2002:a05:600c:2157:b0:41a:5521:d848 with SMTP id v23-20020a05600c215700b0041a5521d848mr2499549wml.25.1714750520756;
        Fri, 03 May 2024 08:35:20 -0700 (PDT)
Received: from [127.0.1.1] ([79.87.205.120])
        by smtp.gmail.com with ESMTPSA id d10-20020a05600c3aca00b00418e4cc9de7sm9702373wms.7.2024.05.03.08.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 08:35:20 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Fri, 03 May 2024 17:35:13 +0200
Subject: [PATCH 1/2] thermal/drivers/mediatek/lvts_thermal: Remove unused
 members from struct lvts_ctrl_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240503-mtk-thermal-lvts-ctrl-idx-fix-v1-1-f605c50ca117@baylibre.com>
References: <20240503-mtk-thermal-lvts-ctrl-idx-fix-v1-0-f605c50ca117@baylibre.com>
In-Reply-To: <20240503-mtk-thermal-lvts-ctrl-idx-fix-v1-0-f605c50ca117@baylibre.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Nicolas Pitre <npitre@baylibre.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714750518; l=708;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=SP42j9CgUufiyxU3nQ+lSzjh2IG6/vPluK3RUFWHhsE=;
 b=XEe30h/H6gys1feNgm+rZLzcV5J/Xy1Zpsm4B7NsLcCwZ4+d8iU7BJcBUbsdUPve9xEvBH2uz
 jqhA/ej8FdcAcU8FzxutsgptICjvq5bkBz5Off897RCh2CtDUcC3LQg
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_083528_880998_2533F34A 
X-CRM114-Status: UNSURE (   8.94  )
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

In struct lvts_ctrl_data, num_lvts_sensor and cal_offset[] are not used.

Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 86b2f44355ac..18a796386cd0 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -105,8 +105,6 @@ struct lvts_sensor_data {
 
 struct lvts_ctrl_data {
 	struct lvts_sensor_data lvts_sensor[LVTS_SENSOR_MAX];
-	int cal_offset[LVTS_SENSOR_MAX];
-	int num_lvts_sensor;
 	u8 valid_sensor_mask;
 	int offset;
 	int mode;

-- 
2.37.3


