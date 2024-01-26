Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A06C47DA9
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jan 2024 00:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ppFxbOlS/v6G/Iyc2Jdz2aiKlAo+YrKUjtIhEQOSvas=; b=SNBeEo9PouoEhn8dXdxoB5ssuA
	+ZtzQY8UArqRJV9WcUfF4q35xzeAUo53j0qeP5t98D4+HaTLIRV5vzZrNRMMQgOCjt1z3P8VXsT2Q
	DiH9RglJBiGcgG5vt87J5rCz3f0oSfzW7UlO/3UynMqtPpmZ4GJ3YBavHadNLFWJgoxMiOv1juOEj
	BTWG/Kcbr8Tg+Cdrk/ilTMH7vaI5tqn6JGonG88i8cAImZ6IqB1Ft+wrFO/GOED1BSU6FHfnHpI1U
	CSuTm02jBLw2zJfTlrtA3yKCrUtkPOHe9CQgXgvYt7lFnf6f0ZztkywainjGTtgo0oVEgMGx1vuLw
	Jud9q/Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTWR4-00000005xJa-1WA7;
	Sat, 27 Jan 2024 00:20:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTVR1-00000005inQ-3Kdo
	for linux-mediatek@bombadil.infradead.org;
	Fri, 26 Jan 2024 23:16:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=ppFxbOlS/v6G/Iyc2Jdz2aiKlAo+YrKUjtIhEQOSvas=; b=HqaRyteariv1azqXrm5CT1dwau
	GyTnLNFcUk+Ht7UygqbKFqlcFFCZqLDI+5kVHYF2RCbhJohO1IlD5b6ZskcYH7V+L4RdVehmA8qqA
	LWulBXkcpHc7V6ZjGkr4O38WKJ8m7kt1V2qXnP9WSZyrOVcEsL7kr8DmzgSmRsjLRvxLBem0X8B1o
	wiJdRYE4oyQu+F6k48MlP7pkhGX28UQZ5TGggDlkyLsjyZONEIwWkniSM1AYJpeJ8VIWr3YACZqJl
	Lfycn5UJHRiWNzdHbYVrjmag43gLNCq8sz5AAQnGNYW0QqbGn3HNnqigh8Zi4y/8iXc3rp2P2Htjr
	f/Gq0Yjg==;
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTVQt-0000000F96O-44in
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Jan 2024 23:16:30 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-7810827e54eso67493285a.2
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Jan 2024 15:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706310976; x=1706915776; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ppFxbOlS/v6G/Iyc2Jdz2aiKlAo+YrKUjtIhEQOSvas=;
        b=mYToIsFpsxfqdmE6CMDidymmle2fS1OZh/Mvch6d5WWuRsPUPANwITB7M8+DKYOpBN
         rt5s8UwyS9Pe3K6ahT3UX3ceCK0aqcbEfOTavvPhkGsMFES3wW4tr1MS2O6JR6znBrJQ
         nMUOk+tMA5AXPzpa+PmWD6Tcc4FJpkKldZKAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706310976; x=1706915776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ppFxbOlS/v6G/Iyc2Jdz2aiKlAo+YrKUjtIhEQOSvas=;
        b=oadb4XcyGEWaTC2ev2lqhIQVhWudO09EicG8rtmQfyn8w3GsNnWGyCfdw0qzcLZqKY
         CpkiVxWCEB+BTCmrcM6YkmJeu8Q03Oh6UEuaQtWBFXpX19DFxmvNgQgEVAkUBr1ZfWqf
         EJRmUzH8bAnn1el/p/lKddyy9VHbuP9ELBizfNb59LPe/4fNVFechSflxVnDEgjiB7Hc
         EzFyUdrjlcb15FZvLhzaPGZRbazwUYW0Ym9LZdz2DQmvErXMAG+W4AyBvI72qCHI1VXy
         9mx4Uu3Xv86+pPUk9ubz0aOz7DVTUqgz/HMLbiFdFQgshlWWhevwQkD4l/e1Vhaj0rFP
         jd/g==
X-Gm-Message-State: AOJu0Yz04Ufmqw8rx1ArPoS1eVW50dnqf4ayGj4l+DSH3dwSjGl/vN3x
	s4bMHTQ5sgg9QaMboFTNgvoCdV09uurQmtu9bOO/hGQaCmzPafcmsCzykPLh0g==
X-Google-Smtp-Source: AGHT+IGIpAsQSjaDQPGQ6LECGQr9cN1m4828+DZymi0+3bzM+4XluVJo4MprbQD7HbxK6yJ3CFbmNg==
X-Received: by 2002:a05:620a:2182:b0:783:e064:aa09 with SMTP id g2-20020a05620a218200b00783e064aa09mr622459qka.115.1706310976118;
        Fri, 26 Jan 2024 15:16:16 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id m4-20020a05620a290400b00783de3ddf5esm507358qkp.70.2024.01.26.15.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 15:16:15 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Jan 2024 23:16:09 +0000
Subject: [PATCH 10/17] media: verisilicon: Fix kerneldoc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-gix-mtk-warnings-v1-10-eed7865fce18@chromium.org>
References: <20240126-gix-mtk-warnings-v1-0-eed7865fce18@chromium.org>
In-Reply-To: <20240126-gix-mtk-warnings-v1-0-eed7865fce18@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Bin Liu <bin.liu@mediatek.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
 Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-amlogic@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_231625_683202_04F3AF3E 
X-CRM114-Status: UNSURE (   8.77  )
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

The field is not part of the structure. Remove the doc.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/verisilicon/hantro.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index 6f5eb975d0e3..811260dc3c77 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -237,7 +237,6 @@ struct hantro_dev {
  * @codec_ops:		Set of operations related to codec mode.
  * @postproc:		Post-processing context.
  * @h264_dec:		H.264-decoding context.
- * @jpeg_enc:		JPEG-encoding context.
  * @mpeg2_dec:		MPEG-2-decoding context.
  * @vp8_dec:		VP8-decoding context.
  * @hevc_dec:		HEVC-decoding context.

-- 
2.43.0.429.g432eaa2c6b-goog


