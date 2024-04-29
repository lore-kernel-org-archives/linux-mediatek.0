Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46246C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Apr 2024 16:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TBoYdFZFpJunUvgv52P8o/805oLnG0rRdaJVdgyqfIE=; b=H0+YC8dh5VnzMf1TLUSlpBw0er
	l543vxagaUa2CU0cjutcSR7hj/xMBCIrfqR4r6XzJAODr2kRPZrmZ+M0a4Gcq7OWK045TN61uF2ld
	M8CjcJmXUrVcwjWwMrrwCyXrDlfWN+j0OWHzOyb2SzVDhW/IpcNikjUpwfZ+HeL8gmA+l3vHO9hH9
	KX7w4YoLybtISAeB9G9NqHvqEdaMiB7UtZHZYUkAkFnheCcuW71nZbrZSo8U7ZAtUZ35Rs1e7+bdp
	P4/19yxzpEnddeToKH9/lj9BdCXF5sUcjJ9lSlt6BuGzl5fFW5oFYTUbsVt0Oa8OJbw1f3XR4z/SJ
	jIDt/KYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Tf3-00000003YAd-1B3y;
	Mon, 29 Apr 2024 16:15:25 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1SYf-00000003FGL-2oRt
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Apr 2024 15:04:47 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-78f03917484so307887085a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Apr 2024 08:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403085; x=1715007885; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TBoYdFZFpJunUvgv52P8o/805oLnG0rRdaJVdgyqfIE=;
        b=apj6f4HkyXAe/Luid6AcPeHWc0tcedOq0qVH6fEg1uGZBeOL+Zdv4CSBtm7rbyZYS2
         A4hta82IL3vvS99Uq1d3EYzVcPCqt40CA13Ix1syJowdiXBRC48gJMcNrBKL9cINtOD/
         vEA00d8nz04oFAhK40zG/5m6pzKM5YYQk/EPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403085; x=1715007885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBoYdFZFpJunUvgv52P8o/805oLnG0rRdaJVdgyqfIE=;
        b=W5ibOOt3NBBcyBy8pC+VflwY2TaQUPjsf32efxERhxzdvgRlcCOHJcjbi1+DEPiBjW
         KaiMCnq+yOAemPD9myYuWkwuvlFaXB2Pms/Y3tCRhrkMwHnNnESKZ6jpLccGVYk+gWbP
         qrn2nHHUT86kThdzRM97vPT6fMTNHLcER/JlfDkuKqE90oeSVf4evu6YmfQEaR0HLwBi
         rzVIyQtql66ENldkp4QVc2je5zP4VwCVLUdyVxb5DE2LowK/I59zL3+7og3DYprc72hi
         dPr1LnDR51e6f5K3SHrqzccED1EqW8/q9VSOo50MZPqsHOwE3G2bcq6Bbm7nJY43HEWa
         ljqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXA826Trp55ftdcdX+JiB+yyUBPg7pPOpOv61aoTLQb9HLFBMrXA7lK8zTwQ/lPYZ/HdiVq42NT3ehnpvsxyF/xVGmFkJfeFppKCuMCIndRxmKr
X-Gm-Message-State: AOJu0YyGWbYqEhyhsx4NcEqS4cBTqOvj8it2AT9Q+Fn2bCN6gtURR5pN
	Ts0Lj/r5Iwl7U2E4o5VUsMH8jV9kD+Ep8JLeG30JgM8U8jidqwp/v8Ko4iT+4g==
X-Google-Smtp-Source: AGHT+IF+chYPShGmmjcrkgz/giMi8LlMh1kKDt+AWNRJgL6Fjthaoaa54O+J4vw4mx2W4IdeglySVQ==
X-Received: by 2002:a05:620a:39d:b0:790:944d:65b3 with SMTP id q29-20020a05620a039d00b00790944d65b3mr8124237qkm.62.1714403084821;
        Mon, 29 Apr 2024 08:04:44 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:04:44 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:04:41 +0000
Subject: [PATCH v3 02/26] media: stb0899: Simplify check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-2-3c4865f5a4b0@chromium.org>
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
X-CRM114-CacheID: sfid-20240429_080445_746282_2322CC14 
X-CRM114-Status: GOOD (  12.56  )
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

chip_id is an unsigned number, it can never be < 0

Fixes cocci check:
drivers/media/dvb-frontends/stb0899_drv.c:1280:8-15: WARNING: Unsigned expression compared with zero: chip_id > 0

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/stb0899_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/stb0899_drv.c b/drivers/media/dvb-frontends/stb0899_drv.c
index 2f4d8fb400cd..35634f9a8ab5 100644
--- a/drivers/media/dvb-frontends/stb0899_drv.c
+++ b/drivers/media/dvb-frontends/stb0899_drv.c
@@ -1277,7 +1277,7 @@ static int stb0899_get_dev_id(struct stb0899_state *state)
 	dprintk(state->verbose, FE_ERROR, 1, "Demodulator Core ID=[%s], Version=[%d]", (char *) &demod_str, demod_ver);
 	CONVERT32(STB0899_READ_S2REG(STB0899_S2FEC, FEC_CORE_ID_REG), (char *)&fec_str);
 	fec_ver = STB0899_READ_S2REG(STB0899_S2FEC, FEC_VER_ID_REG);
-	if (! (chip_id > 0)) {
+	if (!chip_id) {
 		dprintk(state->verbose, FE_ERROR, 1, "couldn't find a STB 0899");
 
 		return -ENODEV;

-- 
2.44.0.769.g3c40516874-goog


