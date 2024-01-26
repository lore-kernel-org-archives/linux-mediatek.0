Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288B8C47DDB
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jan 2024 23:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qSXVbFoG/exQx3PnGpEWpQQ1t1d8y4UCiwgXQ1/JoHo=; b=oO14+/MCgg8Hyra/fEVs/eS5Uz
	2mHiyvpfeH1l3UTLiOLHGr0YMdmo5Vgir6Vc/EJHBwt2edzLwQJEiafoyUcSigq5DxcJy3f0QcgnQ
	9afCBsA3lLK0P/EQkTSm8lHsrbMoKlpZZKjwQCf6zT5JWrC9E+1x1ePzxkDIqf7WHvno5NypAhQ9F
	TxF67zVOi5FYHKPijXD+YVi4lrOKZiFN8/8SDTPKLfp59yl/kN1GbYVLfeFbdq7WszSciYoNlnohv
	Hhvir3euZe3S3eQydX8tS8fopYlNMEvQrB2wE1JSyUYWmEnh54br255mB04ddevw8FYvDoOFgSyfP
	Nc5OrKDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTVTD-00000005kcc-02z5;
	Fri, 26 Jan 2024 23:18:47 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTVR3-00000005ioV-1Y8E
	for linux-mediatek@bombadil.infradead.org;
	Fri, 26 Jan 2024 23:16:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=qSXVbFoG/exQx3PnGpEWpQQ1t1d8y4UCiwgXQ1/JoHo=; b=J+opc6NrIyPXuNeb4XbUqXbuIC
	sUEFSJ/6MeehvhZwIpTQ6IFLxyIRGGJ+hBwmDzsG5XQHE6XQCea1prago6gKcClSQPRqkvWNZ4NuP
	BG2Yt+bk5KjZlORq8cnNKNIoxgNpfbfFjFrJKfE64+uC2PC3dIUvqfA32r9OWVWPq/LFz96nPjfpR
	M8CTvJ425wDYX1D2kC+GUE0d8N1hz1gjHV3BA6Vt4LCgvG6VqAWmp9zVqV7xurBEzLTiBMaJ7gU1H
	6RdctjBxuwM8WECNt8z8oUMZ0kakdietDpUhUjh8r1HJarQfxN7y5aSOtSluXTj40KpnW58hTt7Ez
	CqfP76ow==;
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTVQv-0000000F96J-2aHC
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Jan 2024 23:16:31 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-783cd27aef4so58576885a.2
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Jan 2024 15:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706310974; x=1706915774; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qSXVbFoG/exQx3PnGpEWpQQ1t1d8y4UCiwgXQ1/JoHo=;
        b=FqqX5oAoupp9reXyJqMzo/+Lfu3L/R+RPj8uHaycZwcEsDvhRhDQn7Z7tc0KckK5Wn
         kLWlvetI/BFUqHf8oPxCpt66mE+VH8z2HF4H25Wbng68XtJb1lfDU6snH6xkemvjCkck
         ifOCVS7FNGTcJic6DDsplvbDQJH0B4+tx8ju8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706310974; x=1706915774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qSXVbFoG/exQx3PnGpEWpQQ1t1d8y4UCiwgXQ1/JoHo=;
        b=bZu19chnF831r///G3P340BRD0iH8TTrtGv+6hu+fa691g+bg74kcrptNSIVHD4P4n
         9z27P5ohy98rqecqTy7GiwAaS14POhklaf4h4BL2d4BXlxAUDiK/mLiS3+4IrEjjUO9W
         vyAiedVfvMxknClGGlWXDeB5tW+tsHWFe3e68+INAcmppODD4kceEvndbMW17UOaj2HP
         8BNInHx2obHrOm8Y0uWN9JAZKPYQrjpeL0Y/a4cr5SRPLH+Bt9Eo2OisEPFVYAb4qWf9
         zo+9IP5ZfPTSENiSvw/m9+2U0n8FKAknStPUBrqurackbt37TdCG/b75B5kiZF3AWEv/
         UCIg==
X-Gm-Message-State: AOJu0Yz/VcC7t4LyQ9BzrZBqka2tQeG0V88nb0Rq5vzEL4pkxdHu4icP
	ozpGjozsXeGZMIcKB1iwKX1778TVo9291zc6YsxSMpqmz0pceBpgauzaonOtSA==
X-Google-Smtp-Source: AGHT+IHvS/HbW0NAYrQIsdlvGBtX2lor9Od+LhJ3Cj/UhY6yAa3AiOtgFTNXNbwuU2inqgPn30b9WA==
X-Received: by 2002:a05:620a:12e6:b0:783:89f4:a1a with SMTP id f6-20020a05620a12e600b0078389f40a1amr527242qkl.104.1706310973985;
        Fri, 26 Jan 2024 15:16:13 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id m4-20020a05620a290400b00783de3ddf5esm507358qkp.70.2024.01.26.15.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 15:16:13 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Jan 2024 23:16:07 +0000
Subject: [PATCH 08/17] media: mediatek: jpeg: Fix kerneldoc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-gix-mtk-warnings-v1-8-eed7865fce18@chromium.org>
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
X-CRM114-CacheID: sfid-20240126_231627_093194_8CE976A9 
X-CRM114-Status: UNSURE (   9.47  )
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

The field is gone, remove the documentation for it.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
index 8ba6e757e11a..8877eb39e807 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
@@ -144,7 +144,6 @@ struct mtk_jpegdec_clk {
  * @jpegenc_irq:	jpeg encode irq num
  * @job_timeout_work:	encode timeout workqueue
  * @hw_param:		jpeg encode hw parameters
- * @hw_rdy:		record hw ready
  * @hw_state:		record hw state
  * @hw_lock:		spinlock protecting the hw device resource
  */

-- 
2.43.0.429.g432eaa2c6b-goog


