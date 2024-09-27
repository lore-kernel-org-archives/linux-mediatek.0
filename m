Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1950FCEBF8C
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Sep 2024 09:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DqW1Z6ilDYncO6WIxfWW4lU0O53b+hjUNpAszcdmBJA=; b=vSbnrSmWg4LliLk6PIx2lJN0/D
	txTcW7YFCqJkV2hU/gMooC099IMP3v9Gh4pXBY+xmFW5rIJK8dEpjqT1XpOgKiJAVMx414pXCnNcV
	vuxNRvMCLru5/mla4MGcnJPLQay8SNy/xE2DjBO9G3CPH2TDt2S2m5ThNeR64m1a3xLMPGVeB0xzf
	HMYJ4TMgu3uaXvnQbLEXt7KkSVgPMrS7/dGyg2rSd4SP0t/UpsEIog0D49pNePSFYpn8hnDiiTWuq
	ks9yUNTnB1mMXXvD7nlXRJICr5zmQIuFSoegQbOVVRH1y0a5DySF6isP36U8hGQ6AuPFnCm6kseqb
	V7AvzOJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1su7DM-0000000AdpP-3ri1;
	Fri, 27 Sep 2024 09:24:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1su7BS-0000000AdUR-3sxz
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Sep 2024 09:22:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727428960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DqW1Z6ilDYncO6WIxfWW4lU0O53b+hjUNpAszcdmBJA=;
	b=HjzwncduUDe11oiLsnh7MHgbLc1XJixxOCZtgp//OY1pGB8I7SP4seqxWx0dTEu4BKiEcM
	yuu49WXorSrWMiYnHa1nXEavdsobiJ6VqPNEDo7zKEo6S0BMwmCd9KSnq3a0+NbKh5yU36
	Mofu48P82uWyuVJ81yRPbsZaU6653io=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-J7dno_3TNi67r0D0oCey_A-1; Fri, 27 Sep 2024 05:22:38 -0400
X-MC-Unique: J7dno_3TNi67r0D0oCey_A-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42cb080ab53so14199805e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Sep 2024 02:22:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727428957; x=1728033757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DqW1Z6ilDYncO6WIxfWW4lU0O53b+hjUNpAszcdmBJA=;
        b=MggwtAytB3LQJIpeN072KY45hcTlHOaC0b3zHTIvVrperRJxRZfmkb94+yMkLU1739
         p/ttd/1FGmTbTBteEMtJh+gn8kNMqWZWl7oMfZA7zxP3ne/CxDNKQySVxRPO3/uqRi9N
         VlqPUDTHk4NkyvMFUaN4tSNfrkeaskWuHZczefHSSkAdoJfFsD3684SPHIzpY63HwJ+D
         ygvDGCArTLvONuLttylNTt2+DPRjg4vDH0vgI87fr6yVM99DcOqJQOfoZ7+2imN9Npxx
         zcfd+Uxx/2hrfFULsgcG/surrxSRRaxC2F+Fycp3GtLEu7LaJUzrZCtAA+MWcF7UWwMR
         +p1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVYYfn3S/LxLsccoWEJOQ+XUb7jK6JGD8Q5d9xHPzjpOJ9dUdYQdC05phGFcC63Jfm7tzQqr9s1io1sVjoRYw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwgKoK2FPTDIpx7F/au+ktcEn5TsYfqm0xDd4uCD1DD5++YeSzu
	zBr/cUJ9XOZ5umXl3xhKfsqytvjOjat2VZ6sq9+/20fvgvHQ48cxYUQVytHLXL/O3RjaKvssOFu
	G4LSPK0fQn+XbKwabfGvzsydYNbkqouNdkX5E23kdt75ZTp7VQQ4fpBL7TbSerJWWiKUSCg==
X-Received: by 2002:a05:600c:3b93:b0:42c:b995:20d3 with SMTP id 5b1f17b1804b1-42f58484b34mr16809145e9.26.1727428957285;
        Fri, 27 Sep 2024 02:22:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJWCF/p5auGwFMcVVPbMUAZcGcxwmZH59KUVxG01mmgdWdNTVcOZrU3cbtQVowAR5ZCeffkg==
X-Received: by 2002:a05:600c:3b93:b0:42c:b995:20d3 with SMTP id 5b1f17b1804b1-42f58484b34mr16808955e9.26.1727428956917;
        Fri, 27 Sep 2024 02:22:36 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e969ddadcsm68540605e9.7.2024.09.27.02.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 02:22:36 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] clk: mediatek: drop two dead config options
Date: Fri, 27 Sep 2024 11:22:32 +0200
Message-ID: <20240927092232.386511-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240927_022243_067727_BB4DC232 
X-CRM114-Status: GOOD (  10.83  )
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

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 0f471d31e5e8 ("clk: mediatek: Split MT8195 clock drivers and allow
module build") adds a number of new COMMON_CLK_MT8195_* config options.
Among those, the config options COMMON_CLK_MT8195_AUDSYS and
COMMON_CLK_MT8195_MSDC have no reference in the source tree and are not
used in the Makefile to include a specific file.

Drop the dead config options COMMON_CLK_MT8195_AUDSYS and
COMMON_CLK_MT8195_MSDC.

Fixes: 0f471d31e5e8 ("clk: mediatek: Split MT8195 clock drivers and allow module build")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 drivers/clk/mediatek/Kconfig | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 70a005e7e1b1..486401e1f2f1 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -887,13 +887,6 @@ config COMMON_CLK_MT8195_APUSYS
 	help
 	  This driver supports MediaTek MT8195 AI Processor Unit System clocks.
 
-config COMMON_CLK_MT8195_AUDSYS
-	tristate "Clock driver for MediaTek MT8195 audsys"
-	depends on COMMON_CLK_MT8195
-	default COMMON_CLK_MT8195
-	help
-	  This driver supports MediaTek MT8195 audsys clocks.
-
 config COMMON_CLK_MT8195_IMP_IIC_WRAP
 	tristate "Clock driver for MediaTek MT8195 imp_iic_wrap"
 	depends on COMMON_CLK_MT8195
@@ -908,14 +901,6 @@ config COMMON_CLK_MT8195_MFGCFG
 	help
 	  This driver supports MediaTek MT8195 mfgcfg clocks.
 
-config COMMON_CLK_MT8195_MSDC
-	tristate "Clock driver for MediaTek MT8195 msdc"
-	depends on COMMON_CLK_MT8195
-	default COMMON_CLK_MT8195
-	help
-	  This driver supports MediaTek MT8195 MMC and SD Controller's
-	  msdc and msdc_top clocks.
-
 config COMMON_CLK_MT8195_SCP_ADSP
 	tristate "Clock driver for MediaTek MT8195 scp_adsp"
 	depends on COMMON_CLK_MT8195
-- 
2.46.1


