Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89462C83F09
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jul 2025 19:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MLyqT+xILuclBbcabGc7fi9R39np5F7oBhDxlkOWYXQ=; b=dGEkAhabd6GuiSbtuiP4c+g2rI
	cNnRVfOxyoL430mKVxJFzDNLblZNIsiw5sbfTKicwJtNzHKqGqfTYevU78ZRwgYvCF0u5EjZGBJh6
	ux2HhiOf5vA8PWUteEjQdg/dTQgkuFK6ysrekcgp6jL3vQHvF1MDd3lTfdi+hxuLEO7p9vzMyEnRN
	UvZOU2nP3c1lommsy8RC2auVSsqIkdjDWoZ+1AqNxpWffBdx4Gx5itIgzBUQHbx+CA4Qup7h8tuC4
	VTCyFnks5ktn/2YQIuJiRTk0NZYS5O6JHHrSjz2Ga6XxpxPkTRwgaRi/+Iy/2popbz40Hmh4waROK
	4cls5tyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEA2-00000006McJ-0umH;
	Tue, 08 Jul 2025 19:39:26 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZByB-0000000663l-2xlk
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Jul 2025 17:19:05 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6099d89a19cso8292175a12.2
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Jul 2025 10:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751995142; x=1752599942; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MLyqT+xILuclBbcabGc7fi9R39np5F7oBhDxlkOWYXQ=;
        b=BXlMWVLyPscRFNqHoGTT0L3+At6pfL/Nbd4la+7ZJ6ZrEayG9npj95qYcCHnWJlQxS
         wKaBNnfjOCvekmv+N5LRQDsbu6DbQBf7wDbyKUFmkFoyddfXT+hVh8SjTGD37bqTVby9
         Ikf8+gkpskrPkq0ie96eUDZRLG0l5/vEOPAS/W+Lv5bMfJRVUbvnxnC40PraNe0Ih9vh
         Bd4Pi8Bm9IRL0hrnpspoID4MF5B6LVZxK4XWdY3UNdRyj4C80dHBTDC/VN3aOGBTJBEq
         hz2L3TF1pH5PxdEmijgoiT1y12QGDsE7X8WpWWxInR+MHpjAxEZaLUAiHP06JVA6ddZM
         Uyvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751995142; x=1752599942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MLyqT+xILuclBbcabGc7fi9R39np5F7oBhDxlkOWYXQ=;
        b=Jomp17LyR0af3wIMDaJossuqs9/dNXLrUCKkzRCVUii16TRprR7haUruaxtpcvrLtu
         wAr0xuYxsov86YdG7zlXi5FfbkLrUMUKMc7TaT/GpPxJHP2JHTHYfgF8E3gH9MZppiy8
         11IqoFpd3i9fUK5QQvI8lqOqQ9Zn+1muZ1RKLHM7MmlRiSdYaBzksNJCzmaN0zOdCdxw
         K10GhDdXbJd+/TncL4dQawoSnul4LudnucE4sacFw3O1sSDIiKS4etS6E6we6oLiSBxb
         fMCDk1a57hMFZkmm216TaPHJkVTTf7lUHgwwHichAnpe8L4W5Upt9sa++8npZGCNdRUY
         0dYg==
X-Forwarded-Encrypted: i=1; AJvYcCUmpTQ5thL5GcrIVWXYndEtyajUweN3RaQTwo32Bbi8xiberirPGhUmkOCPyK+yjUA1CbRiy8QAzX+GzPiEYg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7D/ufnfLhOA+7VPBnRW/IwTE0Ra+WTAGw7aSYd6DVxssBh8x7
	BJCRdo/P1o97F6wqrXDMzbsiuLXDPkVvM2123ThnRZJ8+xhqYpreus1FVtNxOxc7cSw=
X-Gm-Gg: ASbGnctWX5C6RdfE4vY0dykvaKP2MxoHDXokpejiI18cQY95d/z1kks1O23Q+PgL7i+
	lzHkUthwF2ZlfGJSz1RKKmEmQgyMLNS3BmlrDM4fG77I6PDZI9EFXkOpYm6peKNtbpKhkVD/Se/
	urLGqnr8605V1wMkLpsKuxWUq0oY4jItffHyyDcF2ksXVSUTsEu6jsll1qToRLV5PqoPHft1Hrw
	BhCNlV6FvFvXjzQfRzfQ+l1mKkobtOh3wooLuVXCMkouHArlliKIlFvRN/J7dc7wqef0kg6z0De
	j6oJnnwnwCCJ9QSNrBHVDXMdPmEQSUG9iMOVJZ28rFdbaGvKGYYvs6WTGwzeXshNQAbjr6DYnxy
	sUQM1uKrJqCWLTSr9bd55spknCR85
X-Google-Smtp-Source: AGHT+IGX/NwWOkwFLXujzCHW7XovaOBzMDe2z1U1HjJW1JNezxlOayLu/X2MMKSGGW5j6xiogVApeg==
X-Received: by 2002:a05:6402:32b:b0:5ff:f524:90e0 with SMTP id 4fb4d7f45d1cf-60fd6525ea2mr13940909a12.11.1751995141685;
        Tue, 08 Jul 2025 10:19:01 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-60fca66410bsm7426227a12.1.2025.07.08.10.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 10:19:01 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/8] pwm: mediatek: Convert to waveform API
Date: Tue,  8 Jul 2025 19:18:30 +0200
Message-ID: <cover.1751994509.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1572; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=JOXG8LBbhkmPcwt0LlDsJ6pBd6Fa8cmBh4Mg0M2MoAI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBobVLnNn1ldDvMQsM8b+Zo1DdJTZXm+JuvH52QQ UWuaJKoYtCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaG1S5wAKCRCPgPtYfRL+ TrivCACBxEQA0w7JemLEzIvOyLsYqx/bUAPrN7KlveEFbxvo+zaOiDaDtO2zmn5sz7Jhr+6+Txn fPMK8tRJnqqBzXT+oe0SNgIN1Yejp0UBPIviz4Sh8KsIe1MWep+j6SeJU/G30RE35/AySduHGzj wXSOvjV+VB9TzRLnatbmjXMRJ/JoWspLY0Bw1unzDZ1x62U7nbun25s06EKd0wcI2ssQ9EGejNW n9S5FBR1ZHsoUksjGLlZywzdYcce9orXFlrHwm4HIq3BJpAbqzg4je5bc2fyMMjr1UJBpytqe6E kAc6vb1dchMn0Zavtv2NuHZV5HnVpMXitAclkxA0vcA25qWt
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_101903_849190_0C67DDA3 
X-CRM114-Status: GOOD (  11.67  )
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

Hello,

after a few cleanups and preparing changes .get_state() is implemented
and .apply() is aligned to the usual PWM rounding policy. The last
patch then converts the driver to implement the new waveform callbacks.

While this last commit removes functions that were created and adapted
earlier in the series I still consider these earlier changes sensible.
They provide a good intermediate step for both testing and bisection.

I don't have access to hardware documentation (yet), so please double
check that the names I introduce are sensible. Also one issue that I see
is that after poweron the LED that is connected to pwm0 on my mt8365
board is enabled, but the hardware is in a state that is detected as
disabled. So I'm open for feedback, otherwise I will address these
points when Mediatek will have given me access to their manuals.

Best regards
Uwe

Uwe Kleine-König (8):
  pwm: mediatek: Simplify representation of channel offsets
  pwm: mediatek: Introduce and use a few more register defines
  pwm: mediatek: Rework parameters for clk helper function
  pwm: mediatek: Initialize clks when the hardware is enabled at probe
    time
  pwm: mediatek: Implement .get_state() callback
  pwm: mediatek: Fix various issues in the .apply() callback
  pwm: mediatek: Lock and cache clock rate
  pwm: mediatek: Convert to waveform API

 drivers/pwm/pwm-mediatek.c | 498 +++++++++++++++++++++++++------------
 1 file changed, 344 insertions(+), 154 deletions(-)

base-commit: edd3bcb1801e1bb98f4f81485140e18c86406ced
-- 
2.49.0


