Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98146C88E45
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Sep 2026 06:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2r/zXGRLIz4Gqh+3fWrcMyrCUW1b5XnY6IMEL3+xJGM=; b=lu/6azoPpC1P9VZINbAGgJ3nNK
	YRZeDbki/VtIDVArKu2RhPbuqOEpODBzS9AdiqDNGJt32o3lamS3bwCT+Ftoa6OA0WLjPedHaULBd
	sNip+wpe1vxHzd094X4RZm1j2JVhZR676DQsAcLHvOfE69nfeRBVI4vjXyJrbFBCcfXaBg1gc5qrH
	KAYd58X5piIHQOi1HAF2c6L1R6QF4m39+tWEplXriCZDpfnJyf8kl+USG+ezIHi6s9dU2b+l/tgTH
	IG5GlM5K6JGKrK2agQBlGvc30dT3u7vkv7J32V5+DSxQW6rxgXZlsIGzZfme0KaC1TPprOEk54xGL
	JJNbrWTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5HQ4-00000000aDa-0Pze;
	Sat, 12 Sep 2026 06:41:00 +0000
Received: from mail-oo2-x05.google.com ([2607:f8b0:4864:31::5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5HQ2-00000000aCf-2dry
	for linux-mediatek@lists.infradead.org;
	Sat, 12 Sep 2026 06:40:59 +0000
Received: by mail-oo2-x05.google.com with SMTP id 46e09a7af769-7f66624aa21so346568a34.1
        for <linux-mediatek@lists.infradead.org>; Fri, 11 Sep 2026 23:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789195258; x=1789800058; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2r/zXGRLIz4Gqh+3fWrcMyrCUW1b5XnY6IMEL3+xJGM=;
        b=QiL/kbGRcMD5sM+g0ST6oa3BmyrDzKn01JRS9e/ckMmUr+9JvhFb4Yoqjxmy/Q0L0O
         BnaxZu3g9oLQzf70LeCDkFdRLcbiTjqQEJDRA+WyXl4XMd67zRkTJvkveB2CUDP/iIeC
         tUkQyKWKxf4rh1bm55Bh+neLgHHiV8O/MvrixP0FT5Oa5Qqw4SWTtb1zR9rV6yGRg8u9
         ZzXyiFmSIi0SFp+xTs7rTpx/gklmshpPJa4CEm1VpcMtd5TttGtOCbKanKttdx6eKKLr
         zgv9GAGi36kKSorx21xXWA0vpfDFAqpsZKfD73/uh6c3mfOS6NBWXbNYonj5557k66aS
         u8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789195258; x=1789800058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2r/zXGRLIz4Gqh+3fWrcMyrCUW1b5XnY6IMEL3+xJGM=;
        b=LBcDxiuKD7M5X5SGlO0HF8UF68xJDvmElHRvaZsY70hNEed6vDxmdYMaDxmevV1uWu
         rsJlFN5aq4QGfOZlKklE6+52Mvnuwh2W5pJHgtsxCEaPf0yOtaZT5BapXWK1Fup/h+S6
         AnR4bSxNOhq7yJCX1XX5lvzI1oKcsdKWBG25alE21mBtMHFe43r+VHT0VZe07EkLYhGR
         DnVSyY3bkx6H7A7UgtUuYhduNvSxfAaC5GJvnwXw3WIigoUVfhvpGXcZ9YqeuBYNM+vr
         2Pt2ttArDf28pHSRWDRaHtYiIZ/gGScbgOV/qkBuIP5abrOVy6bV0G/s2f8a2AHEtk5s
         wK4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzMr558ztHoPFTJMM09OQLbEUDqQ1rlJ02sC43iN+ykaAVbaRkx0XiCXoJkff4uxx8q9zWgJhfuZePzC1KUAQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mCSUTlQ+WIKkHRB5PUD2ap/9Q96cXSZheoxwfXaWqEZ7h33zkK
	dhBdUX74Co1m/O1qya5xSfnInPOXlWtjN6MYBkzQmnWoPVRky/8QKscu
X-Gm-Gg: AYBFou3OpLXAIdnfyNkP1XyQIcjCnkZU3tAh7nAwvfwR7cEf0vu5fxAbWPbJK6wBTD+
	Grr1e1joeqSW0Z7WS2/f2C31M5A1fgF+499A9oJKxt3yjwHGBQ0261mAkZ1JIJCOdahv2MJOlT+
	zsFlaFFG8rKJEj+5Pi6YfyYALakwwQymAynNmS2EqN+whlevQnLdUItNfZUHf8EDLgvfkhZRzY/
	vJvY0ubLY0mC6oX80ugQZdthuXZZw302rZj1hZv+X5fR0A9Bh5DMdiijpbbgVvuonU/NG7PMWkG
	m7HpgQgZQH4uPy8e/2vI8Rj7kRAwpgrM8H5Wv4oLya63ObmKx+MQhsikGew6HT7cgPmryJjkiKY
	K2/JbKrCgKcLJsfhM7k4TvxXdMruX7a9eUjLJblPrUD4tqdknsW/JNgB8+e6UouNm5oGAhWozZr
	pppTAXnadiHVKFOTEBPdghcIa8QArZgQI1LJLddjX0VYmn//1BkE8cImgSuNLdq6m1V7M=
X-Received: by 2002:a05:6830:dc6:b0:7fb:547f:98bc with SMTP id 46e09a7af769-8059e14b758mr1096817a34.5.1789195257717;
        Fri, 11 Sep 2026 23:40:57 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f670ec82sm4932735a34.20.2026.09.11.23.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 23:40:56 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sat, 12 Sep 2026 01:40:37 -0500
Subject: [PATCH 1/2] clk: mediatek: mt8173: fix the FHCTL DDS mask width
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-mt8173-fix-dds-mask-width-v1-1-3d0c0292c85c@gmail.com>
References: <20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com>
In-Reply-To: <20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789195251; l=1697;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=rK3LI6EEJl+1gc/J0Nqb7f1MnKq7lREyQo2mSnW3Hpw=;
 b=aEEsL7VWo3CfcnRgQNR4pSp2BW0HTS7IMmCb+Oc21O48+SIoUTLwp4mzW8r7juB7bII0JxlDE
 J6mym376UJXBuM4QPyxPLfo+9VhIWv/sGKsTw5ZFgYRdJ6Q1/Kq1x2Y
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_234058_679548_66BDEE50 
X-CRM114-Status: GOOD (  12.89  )
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

MT8173's hoppable PLLs have pcwbits = 21, so the FHCTL DDS field is bits
20:0, but FH() declares .dds_mask = GENMASK(21, 0). Bit 21 of FHCTL_MON is
a status bit that comes up once a hop has settled, and new_dds from
mtk_pll_calc_values() is always 21-bit, so the poll in hopping_hw_flow()
never matches and every hop runs to the 1000 us timeout. The PLL does reach
the requested rate and clk_change_rate() discards the error, so the cost is
1 ms of atomic polling plus a warning and a register dump on each rate
change.

Six MMPLL rate changes on an Amazon Fire HD 10 (2017) all time out with
GENMASK(21, 0), MON reading the requested DDS with bit 21 set, and all pass
with GENMASK(20, 0).

mt8186, mt8192 and mt8195 share the constant but are correct, as their
hoppable PLLs really are 22-bit. mt6795 is fixed in the next patch.

Fixes: 45a5cbe05d1f ("clk: mediatek: mt8173: Add support for frequency hopping through FHCTL")
Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
index d7d416172ab3..327240cd34fb 100644
--- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
@@ -100,7 +100,7 @@ enum fh_pll_id {
 			.fh_id = _fhid,					\
 			.fh_ver = FHCTL_PLLFH_V1,			\
 			.fhx_offset = _offset,				\
-			.dds_mask = GENMASK(21, 0),			\
+			.dds_mask = GENMASK(20, 0),			\
 			.slope0_value = 0x6003c97,			\
 			.slope1_value = 0x6003c97,			\
 			.sfstrx_en = BIT(2),				\

-- 
2.55.0


