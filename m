Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856D8C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 08:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PajgPkTBW3iluxw6UIGchSAnGs+6/xnB8PBfDDEr3ic=; b=vIHnRiOuGudiBKV58IPmyivmZs
	Sx5sOxELjDLAzNQrA7ZLZe9mDouWhFy1zbF9iFNBOpeUKRboOnplckuH4yorcb8oBhqtpXKgzb5Bk
	l/YumWYxjCuZfObZgaitegnkFodGtFOtodIBkALg2LgPFl9B5pmqXT8YPPx3c1SqgfFFeq6MKzkJP
	8kJ4/gbKvPqYWs8rxl08pBZBVET/wB9GwRT77k5FRa0QX1SGXsr5ZsOI15pccBLJNG1sZ34aKkP2q
	oA5yKvnapceFEv41Zgdk03GsLTdlIcXY+K3OpLee0e21BRJhkFIlFw0W0Rt8Ds+pJZ4X6l8lyBLqT
	TeDIS8mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKZuo-007JjF-1c;
	Tue, 02 Jan 2024 08:14:22 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKZuj-007Jfq-1R
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Jan 2024 08:14:18 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1d4ab4e65aeso9451675ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Jan 2024 00:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704183254; x=1704788054; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PajgPkTBW3iluxw6UIGchSAnGs+6/xnB8PBfDDEr3ic=;
        b=PSAUG20//ffekE0e9P12QDxnCFND3DS9e98hfaZqR2HpKzl64tSnDLcjtpzml2OSdN
         UVKdie/VkRk35YMMc/NKB6mTurZYJovwmdKfo9nVgJSYYTqLo7lVai/sT0vecrYmVQYx
         dIKKbzzsPby+yOR74H6rP/CD3JYbbFAdL3ln0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704183254; x=1704788054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PajgPkTBW3iluxw6UIGchSAnGs+6/xnB8PBfDDEr3ic=;
        b=SPRutclrmHLupaKKb/mUE1X8olUWYjsuCZCXPmrDkbOkqJ55S7/IxR4RgXoxFdLHPj
         kwvb+nB1j8T+i6309mcjoasJ59xoLvKVD/SUsINxvPhtXBOBPrHocpSWhU/fQF8opvWM
         0sleyIgQLOhBqO6610JoJJl0bFLu3IemC1sQ8hayTgkfEJDhtNIkZefR8siDXRoi+h6/
         +afilBmSGxI3jXntwHHCPtW7eHgx2nX6veUhQmCoeiOjnk3ERVmI/AMnUyaR1441+8tW
         V+gkrnEz9D0FHP5oYE4Lk0hjZo4t8166VecHZ2JVtBA52I2ffvlalIXWgQqfWnVMjB7y
         7LJQ==
X-Gm-Message-State: AOJu0Yz88lIWGCa5S0XP1WC02foOssPbSu80U5j0ZMVic6e+AEmRKR4q
	A2tuw6JQCqaygui1ASFFc2m9Or8Uutsg
X-Google-Smtp-Source: AGHT+IHM8m/BePVX0/O3CWysvzAhUtnB/CIoZmU5nwbrD+ulhjtycO32Co8Ei+LLUe/a9ppmi+uE8A==
X-Received: by 2002:a17:90a:1506:b0:28b:efda:98da with SMTP id l6-20020a17090a150600b0028befda98damr20446795pja.17.1704183254545;
        Tue, 02 Jan 2024 00:14:14 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:232c:f04:85bb:a34c])
        by smtp.gmail.com with ESMTPSA id f3-20020a17090a638300b0028c8149ac6esm12640074pjj.42.2024.01.02.00.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 00:14:14 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Pin-yen Lin <treapking@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Weiyi Lu <weiyi.lu@mediatek.com>,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/2] clk: mediatek: mt8183: Enable need_runtime_pm on mt8183-mfgcfg
Date: Tue,  2 Jan 2024 16:12:53 +0800
Message-ID: <20240102081402.1226795-2-treapking@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20240102081402.1226795-1-treapking@chromium.org>
References: <20240102081402.1226795-1-treapking@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_001417_494783_B78C9583 
X-CRM114-Status: GOOD (  10.85  )
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

mt8183-mfgcfg has a mutual dependency with genpd during the probing
stage, so enable need_runtim_pm to prevent a deadlock in the following
call stack:

CPU0:  genpd_lock --> clk_prepare_lock
genpd_power_off_work_fn()
 genpd_lock()
 generic_pm_domain::power_off()
    clk_unprepare()
      clk_prepare_lock()

CPU1: clk_prepare_lock --> genpd_lock
clk_register()
  __clk_core_init()
    clk_prepare_lock()
    clk_pm_runtime_get()
      genpd_lock()

Do a runtime PM get at the probe function to make sure clk_register()
won't acquire the genpd lock.

Fixes: acddfc2c261b ("clk: mediatek: Add MT8183 clock support")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

(no changes since v1)

 drivers/clk/mediatek/clk-mt8183-mfgcfg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mediatek/clk-mt8183-mfgcfg.c b/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
index ba504e19d420..62d876e150e1 100644
--- a/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
+++ b/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
@@ -29,6 +29,7 @@ static const struct mtk_gate mfg_clks[] = {
 static const struct mtk_clk_desc mfg_desc = {
 	.clks = mfg_clks,
 	.num_clks = ARRAY_SIZE(mfg_clks),
+	.need_runtime_pm = true,
 };
 
 static const struct of_device_id of_match_clk_mt8183_mfg[] = {
-- 
2.43.0.472.g3155946c3a-goog


