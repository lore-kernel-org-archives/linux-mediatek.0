Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB99C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Apr 2024 15:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gMpzOFCFY/OFyCB78Iqov2ITRER3c7lueX7XaC40UJk=; b=ngmlzOUbw6RdbR9WR2CYVTOuSn
	3YuadSCE1l+yGxmyaWbB9egpqnakLKqoFStRaLANgApwWApNmO6AWrbQ+b788sR/ltfrTDS+4mqX+
	IpPxX+Xx9A0l1HhBuhkSd2wDE3cgcXXlGK4S2KpFwpfTCsTs5MsGgCs5nO+TjTUhB7XQT11wKJxwr
	pqz9NxgWVDTKHGBSRzlOJmfJ+PHvSLW7YUuK725zSav9s+UN10c4L1loYhfTthQJHlv+vg108UpLC
	Dl4YxyYPiiPJA5Kid1V/3+qWhQ5YiKYILJGzSsk/y4pG4QpBh359o2nR/YWchTVB04JvaJDFhtzqF
	O/qnpPHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Sbi-00000003HLy-2qo8;
	Mon, 29 Apr 2024 15:07:54 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1SZ0-00000003FXa-2Dye
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Apr 2024 15:05:08 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-22fa7e4b0beso1700978fac.1
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Apr 2024 08:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403103; x=1715007903; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMpzOFCFY/OFyCB78Iqov2ITRER3c7lueX7XaC40UJk=;
        b=gbYWN6wX00nv9deXtkedm9x6f9LU8EKRI240GEkVTtR/jcNy4NFbAkbvD9rLklLpMr
         N/DAbo1z95fLo2of4ZeIIcY3t1IMToDzW6M/0Xrk19csEHO1GRrn+WnusFLWiQM388zX
         vjKuRmQ5L5oQhA45mphjsMJ9CMIaqr8yx09u0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403103; x=1715007903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gMpzOFCFY/OFyCB78Iqov2ITRER3c7lueX7XaC40UJk=;
        b=lt1thu1ZXiLZ/1ZJBlM2iZy/QaomTODmMdsqCFI5/Ja+GD4r2Db1ApJsZcj7IpDMma
         H6UxY2VHGtev6KSPTnRSQVMIU7abVfIu+h9cvyaGOP7BnHXmWwo/qzowScMvMSBOd4fK
         Yj6jsYjpCXFOLtadls8koOtGvhydNmmNzs26SlE6dvvbdB2omXKw31Z2Z7FGayXjpAcJ
         rBlpBDHvDfg3VRAol92G3634PMZjmAISc0yMGdkFEh6eSxQGu+PKxGl2GYlHXRdhNe7b
         +hmlj20LiyiWjl3y76c1XPPdg8dEVAQb2WU0tQuPJ5gFraex0bIerehCK1Hps8ayJE4+
         W+nQ==
X-Forwarded-Encrypted: i=1; AJvYcCULeokVLtSlx/NY5rWKI2OyEBzGUkNtS9KzQQKGHpFCq2Sra/aKT95sQsZ4ZzMP4e/Djpd+NlXPYkgLIjXbfAtwCM7SASoZDec0EjvnGEWOQg0o
X-Gm-Message-State: AOJu0YyLOW25M8SObXBai+ZhKbzJ4sV9F3SUqFx8bTKEmIsqB/wLaLXJ
	TcbfcLgCJAl/2t9xbYFWDwMppmhjgOjlNuuXsi5by+/bNff4RCUyiGqSoW4dZA==
X-Google-Smtp-Source: AGHT+IFhJl+kGtaYhV7Q9Gv3xiaVng6RdI8g6vF7vUpIJM3CzWksrp2O5EtILgQd8YzMcEQUTtUSrA==
X-Received: by 2002:a05:6870:701f:b0:22e:d258:bc43 with SMTP id u31-20020a056870701f00b0022ed258bc43mr12416234oae.42.1714403103424;
        Mon, 29 Apr 2024 08:05:03 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:05:02 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:04:59 +0000
Subject: [PATCH v3 20/26] media: tegra-vde: Refactor timeout handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-20-3c4865f5a4b0@chromium.org>
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
X-CRM114-CacheID: sfid-20240429_080506_678288_5B24D8BD 
X-CRM114-Status: GOOD (  13.36  )
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

Reorder the branches a bit, so cocci stops complaining about the code.

drivers/media/platform/nvidia/tegra-vde/h264.c:645:20-21: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/nvidia/tegra-vde/h264.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-vde/h264.c b/drivers/media/platform/nvidia/tegra-vde/h264.c
index 204e474d57f7..cfea5572a1b8 100644
--- a/drivers/media/platform/nvidia/tegra-vde/h264.c
+++ b/drivers/media/platform/nvidia/tegra-vde/h264.c
@@ -633,7 +633,9 @@ static int tegra_vde_decode_end(struct tegra_vde *vde)
 
 	timeout = wait_for_completion_interruptible_timeout(
 			&vde->decode_completion, msecs_to_jiffies(1000));
-	if (timeout == 0) {
+	if (timeout < 0) {
+		ret = timeout;
+	} else if (timeout == 0) {
 		bsev_ptr = tegra_vde_readl(vde, vde->bsev, 0x10);
 		macroblocks_nb = tegra_vde_readl(vde, vde->sxe, 0xC8) & 0x1FFF;
 		read_bytes = bsev_ptr ? bsev_ptr - vde->bitstream_data_addr : 0;
@@ -642,8 +644,6 @@ static int tegra_vde_decode_end(struct tegra_vde *vde)
 			read_bytes, macroblocks_nb);
 
 		ret = -EIO;
-	} else if (timeout < 0) {
-		ret = timeout;
 	} else {
 		ret = 0;
 	}

-- 
2.44.0.769.g3c40516874-goog


