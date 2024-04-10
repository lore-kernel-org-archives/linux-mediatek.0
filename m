Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8EA1CD128A
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 00:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7ryIE7f8ZtWuzluYZgPcDX89WKZsm70yqAukGanFYfc=; b=rBq0n4eOqzIBzQ
	iEqQ7+Zeh6VkMteoGRo4K1f3FZCaT1pMgx/gCTb/XRvxqRx2vmQtrL3GRxGXQtxN5wvMcGX9AM+Tc
	7JZh8ehPTime/Pv0etOm7VgjbL0Nuw9Fa7kpPs6ijwBa47dkWJrk7ugacOkDJQv7xZgm8fqI52y8d
	7fXuc9PANzvgTwPjw39US5WVtBz6h+gyvVhVtHIA0udRsryE+5qiE7whxHQfpln1b9u4qSw4kJrZT
	Hi4lLQeSbxoRejtA4N89dIl89qs42KpViFCuFJAeeXuYOnYtGyRwUegRJBdQVYVwhVkuhto7Bw19E
	OK97MEU3KtpHQU9tmSYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruLV7-00000004MPO-0HOk;
	Wed, 10 Apr 2024 00:07:41 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruLV4-00000004MO5-34hi
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Apr 2024 00:07:40 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1e3ff14f249so20722355ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Apr 2024 17:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712707657; x=1713312457; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ryIE7f8ZtWuzluYZgPcDX89WKZsm70yqAukGanFYfc=;
        b=Zh78fvuJd4OriO+vBn7w48eA6KughIaxUXS+aYDK2Cwj8iZrAm8JY33dIn2w8Ns2t8
         O1BmZ7E2EBguFoCS1NFfZmy+TbI39wqJphtAEabhZ3tEqTJp5OY99E9TWLRbzd64Wq6J
         oWER79/p9kstEgACcBqXgLtIJ6vyjkIvM5/AI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712707657; x=1713312457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ryIE7f8ZtWuzluYZgPcDX89WKZsm70yqAukGanFYfc=;
        b=mZfozSLnnfM9L7DmA0hIHOJsU5gzHVQ/r/pgI2V6nk3WHQ2u+tMupGHFtfxi9srRPo
         gRLGXEoyQfhMc41qQ9Uh8EiTKCP7iOEPL+MdHSaF+NpHspdMDZ7iyHFTi4r6ZTt04d4l
         5GxqDpbyymwcHikrLtWn4hu2uV0/PS4MV5xUOJfxfPPa9xsYhe0iSNDVRwMdq1ZyDiWN
         VGNBiD+MlXCQxrhkQICUksMAG62+c5DG1OFuCt1Mv56cKTxC3p0+/qIRxYz+FCME1CED
         eJFr6cNU/xN8iFAHDk5KTUIPAyP84QCtGsfAcNih3lbe/Olep8MqNB28wvqrw+KBrCAw
         wgxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOhF/8I1w/ZQ1ERyAcXUs9gLQ2Czcak4KqRvJXV5NEe4ha34SMR0aaI+a6jqAzr0n3rpnuYtT5sXYLC8R99ZeTkdn0tCmIbidD9QVuOo0/lTdv
X-Gm-Message-State: AOJu0YwIXMmByE3vebh+I9K1qCwSC/qgxztI52z6ZkiLhTRjMaqNqGsF
	L+N+V3TXuXu873RyYa8P2K2thlkHidcFDbQYegZ7NJepbsr3b5/QSsGfKueTsA==
X-Google-Smtp-Source: AGHT+IGoDhFHXggG7UV/XM8syPMLRIRAsx+Q3uuIedkhsyiKSu/gHHPrWq5HHr51Yh0dVfPQfUt54g==
X-Received: by 2002:a17:902:a3c5:b0:1e4:39e0:660c with SMTP id q5-20020a170902a3c500b001e439e0660cmr5048130plb.23.1712707656662;
        Tue, 09 Apr 2024 17:07:36 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:1f93:f735:b4fc:3be2])
        by smtp.gmail.com with ESMTPSA id kn12-20020a170903078c00b001e0c91d448fsm9504939plb.112.2024.04.09.17.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 17:07:36 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] thermal/drivers/mediatek/lvts_thermal: Remove redundant code in lvts_ctrl_configure
Date: Wed, 10 Apr 2024 08:07:28 +0800
Message-ID: <20240410000730.628043-1-treapking@chromium.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_170738_842107_E5F5AD1D 
X-CRM114-Status: GOOD (  10.15  )
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
Cc: Minjie Du <duminjie@vivo.com>, =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>, Alexandre Mergnat <amergnat@baylibre.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Pin-yen Lin <treapking@chromium.org>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Balsam CHIHI <bchihi@baylibre.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The removed variable assignment is never written to the register, so it
has no effect on the device behavior.  Mediatek has confirmed that it
is not required to initialize this register for current platforms, so
remove this segment to avoid confusion.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

 drivers/thermal/mediatek/lvts_thermal.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index fd4bd650c77a..48d2f8ba3f18 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -985,12 +985,6 @@ static int lvts_ctrl_configure(struct device *dev, struct lvts_ctrl *lvts_ctrl)
 	value = LVTS_TSSEL_CONF;
 	writel(value, LVTS_TSSEL(lvts_ctrl->base));
 
-	/*
-	 * LVTS_CALSCALE : ADC voltage round
-	 */
-	value = 0x300;
-	value = LVTS_CALSCALE_CONF;
-
 	/*
 	 * LVTS_MSRCTL0 : Sensor filtering strategy
 	 *
-- 
2.44.0.478.gd926399ef9-goog


