Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F75C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Apr 2024 15:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OI4AOi/6PtgU5zRnLUWjMVWmm8Y+CckVMvMt6qKhGc0=; b=R6JgJhT6RY9bUh5fGxYI+WtIOo
	lHbdrwdo6iPpjVOwxEzZ4oMz+Upqj0J1d7EwiSP6OfPyq/Iz+IuF6roY1Y9IX7Uqiq6xBTYfGraWP
	6IgVBNYftIStKS+f3nzh9JUUG2VGPjzGx04U1hllg3BSaP2QgbkhnMOsSKLZnuG2ju/RfcMNr4Xrp
	jV3sQ+1BqW8F4jMSuv9Mp42+wl9NRxyv+8psdgmhp90BGtUFFUIe9BBcOVLqjgdV9DgJBkQiow4aM
	xJCY6rnOxHi8C7+TFLZndcy454dCGgsdlS1GVjkU+gGZY3Klr/jebW23tJWv307dlJxsGz0JQpIjK
	1YfQ/vaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1SaB-00000003GDF-0lXR;
	Mon, 29 Apr 2024 15:06:19 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1SYm-00000003FLr-3mZc
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Apr 2024 15:04:55 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-790ff1fa7b3so45285385a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Apr 2024 08:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403091; x=1715007891; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OI4AOi/6PtgU5zRnLUWjMVWmm8Y+CckVMvMt6qKhGc0=;
        b=fwXHxeHSPoBFy9UNO28adWy5GHJMLw15mfVGzA1ekdw4bPZn9GOoMZ5vg8ZZbRTye3
         WjDW4YKTMuv6hnw9QEGFgZGiIpkQgU7UR0BkzT31dWH01fWgk4T36ASKlGwe0bq8A58T
         yVwUtK08axH42aTopV9YKWZLeSyVT8SBg0clg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403091; x=1715007891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OI4AOi/6PtgU5zRnLUWjMVWmm8Y+CckVMvMt6qKhGc0=;
        b=NZW4spCrsW13zTwQgr4sL0tl7mTKKdn960g0lhKsy2vsq/t97hzkHHVpf25bwcCiVt
         8cb/xqW9uX2Y0AzI6Y9s/NJ8fJJxfjQ6ghKYmArH3sZS9W0D8OjuNWGfdO24GOCRMr+p
         aOcuaRRjfMMFykLlhZA0QkGvGCS3zhnbkSDUoKnjMO7ZnKEzLzttbY9lKJKmzrbOvqAb
         /WQTyTKeODuFKSSY2m+hGlSHwx1gmgvv3UnsVez9UUFs6G6HiQlynPErvVP5U+zXrbiF
         a9JtwACtxN+gthZZy2nbuHdAL9+Z5qrCMDh78MnK2e+01r4RhP8+QeBbq4M/3gaGbGWI
         qxtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWh3gVdX/vqBI7tU8W1yD46MhkOcIjZalcjljPjN0sltkNpZtbU++UrYeBqm6X5GNew4bbJJPfZ4VpxlIsP4jg97AR+gSE7EJJqh9ZtQz/C4ZlP
X-Gm-Message-State: AOJu0YxXeyd2wxxqyWgn9xkN5h1F/qLg/hat7B5aCdSK27upquK9GVS5
	9FsJTYEBdo9C0E9Jhdn8fjF5GLashmELd2o8Hv2eoCeTNY//YYYUcRWMVBTxig==
X-Google-Smtp-Source: AGHT+IG3TSxma0YdxDVyjt+TwA8E2r3YjCQOsUMIKvXlCmNNngt83Fx59gwPuYEOR/mAqhiKqgMwqA==
X-Received: by 2002:a05:620a:2445:b0:790:f04b:328c with SMTP id h5-20020a05620a244500b00790f04b328cmr4582245qkn.29.1714403091343;
        Mon, 29 Apr 2024 08:04:51 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:04:51 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:04:47 +0000
Subject: [PATCH v3 08/26] media: dvb-frontends: tda18271c2dd: Remove
 casting during div
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-8-3c4865f5a4b0@chromium.org>
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
In-Reply-To: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, 
 Abylay Ospan <aospan@netup.ru>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_080453_268690_50D880BD 
X-CRM114-Status: GOOD (  11.99  )
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

do_div() divides 64 bits by 32. We were adding a casting to the divider
to 64 bits, for a number that fits perfectly in 32 bits. Remove it.

Found by cocci:
drivers/media/dvb-frontends/tda18271c2dd.c:355:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
drivers/media/dvb-frontends/tda18271c2dd.c:331:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/tda18271c2dd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/tda18271c2dd.c b/drivers/media/dvb-frontends/tda18271c2dd.c
index a34834487943..fd928787207e 100644
--- a/drivers/media/dvb-frontends/tda18271c2dd.c
+++ b/drivers/media/dvb-frontends/tda18271c2dd.c
@@ -328,7 +328,7 @@ static int CalcMainPLL(struct tda_state *state, u32 freq)
 
 	OscFreq = (u64) freq * (u64) Div;
 	OscFreq *= (u64) 16384;
-	do_div(OscFreq, (u64)16000000);
+	do_div(OscFreq, 16000000);
 	MainDiv = OscFreq;
 
 	state->m_Regs[MPD] = PostDiv & 0x77;
@@ -352,7 +352,7 @@ static int CalcCalPLL(struct tda_state *state, u32 freq)
 	OscFreq = (u64)freq * (u64)Div;
 	/* CalDiv = u32( OscFreq * 16384 / 16000000 ); */
 	OscFreq *= (u64)16384;
-	do_div(OscFreq, (u64)16000000);
+	do_div(OscFreq, 16000000);
 	CalDiv = OscFreq;
 
 	state->m_Regs[CPD] = PostDiv;

-- 
2.44.0.769.g3c40516874-goog


