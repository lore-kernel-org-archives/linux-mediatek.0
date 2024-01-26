Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461AAC48260
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jan 2024 23:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yCxJ4tiFippaBrxy1sFWSD98oDdK4KvGR8VQl9S7yQ4=; b=cKuD8fu662d2HVoPC6a6oeS/Zs
	bTzZFxI1TeRlqfpf/pI/wOQIUav1SlQMNT1ZAlVZ0fyUWkwbBdicivWQk9qs2fxwJdcAb6qtbiLFC
	RaWecHzHaodwJYM+/z40Mqj9zg+MfSPl46NpxgM60kKpsU7dBLuwqGrotNTogtOXc97+fU3H8v1Xf
	9mw3I8zpuE6/fY+CAOBCeIuh2ByZGkIDyFGnE4QstK0XT7HWXdUGDx0csjm+t/ZElFjfd9rbsQdVA
	h0AhYDFlVd4IRjnZF8FO95ScWeXOCVcSYuEk05vkdzCEqOdzpNmRk8XFr4oNMJh8APEP+jBqOm1lz
	folwWt6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTVTJ-00000005ki6-0Zq1;
	Fri, 26 Jan 2024 23:18:53 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTVRr-00000005jVP-2Fhf
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Jan 2024 23:17:26 +0000
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3bbbc6e51d0so587452b6e.3
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Jan 2024 15:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706310981; x=1706915781; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yCxJ4tiFippaBrxy1sFWSD98oDdK4KvGR8VQl9S7yQ4=;
        b=SLRslFPTTWSRObsP4D7sFhnh3tH+h4Tk4ioN1CPP30tuheicpOnAxlgZc7cWtc6fuB
         uZerJFFmHpaQ0He6t3sMqQ9IdXc7G/SvF2f7CQn6jJ3Vhb/4qWOH+FYFK8lxWQMA2Ups
         jolwIIFzbRpZzwt1rQcaa58uw+ccFSIHaanQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706310981; x=1706915781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yCxJ4tiFippaBrxy1sFWSD98oDdK4KvGR8VQl9S7yQ4=;
        b=N8pMHYdUXUAD61vDS5a+XWjTGVzxdye/yTcI+PyCpqr/uUPBHNyVm/jyzJAoqtl4H6
         qVcOeMGxmm+bVCsE/jvSXixkJuJfFn5Hj3VxrG/7/i/+s53GtABbvr4GUyEUr85ST/AJ
         hFhqsiK1BsjqL+/zMnraJpqx14WR4tcHjSw5HOJZf8kDuxU4LAOU2Om/aiPxy/kFD9LH
         4hZh6jl9su24w3Pss+kPnQfnpRwY/25FkBy6FuQYUr9cVTH83Lc1wZs57tze8/VvL27r
         fs73arkfKhO+45Iz184SyImldXdCZ28WwDu6S/GIMtEv3nRIMYsfNutucrx8Ir6vf5d6
         1h6w==
X-Gm-Message-State: AOJu0YyIMm3dm8iHGobD3mMnNBXz9HYHo/AF9plXykkUHRolAOPDiBak
	DGFwhKDbAIIrMvfOV0nCWSvm8U+daY5le9mEzBv7wl+pesk5h0BUVb7p9YvzyA==
X-Google-Smtp-Source: AGHT+IG2D3NC+8qBPHrcajc/wj1UJVv6b2Ko0Gyqx05WQt6GLVPDwCaJl+4BVmpG1ygKipZTOYQ4Rw==
X-Received: by 2002:a05:6808:124d:b0:3bd:c98e:bf88 with SMTP id o13-20020a056808124d00b003bdc98ebf88mr451359oiv.79.1706310981414;
        Fri, 26 Jan 2024 15:16:21 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id m4-20020a05620a290400b00783de3ddf5esm507358qkp.70.2024.01.26.15.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 15:16:21 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Jan 2024 23:16:14 +0000
Subject: [PATCH 15/17] media: ipu3: Fix kerneldoc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-gix-mtk-warnings-v1-15-eed7865fce18@chromium.org>
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
X-CRM114-CacheID: sfid-20240126_151723_770286_73285AFC 
X-CRM114-Status: UNSURE (   8.65  )
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

Remove documentation from missing fields.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/ipu3/include/uapi/intel-ipu3.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
index caa358e0bae4..4aa2797f5e3c 100644
--- a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
@@ -2485,11 +2485,9 @@ struct ipu3_uapi_anr_config {
  *		&ipu3_uapi_yuvp1_y_ee_nr_config
  * @yds:	y down scaler config. See &ipu3_uapi_yuvp1_yds_config
  * @chnr:	chroma noise reduction config. See &ipu3_uapi_yuvp1_chnr_config
- * @reserved1: reserved
  * @yds2:	y channel down scaler config. See &ipu3_uapi_yuvp1_yds_config
  * @tcc:	total color correction config as defined in struct
  *		&ipu3_uapi_yuvp2_tcc_static_config
- * @reserved2: reserved
  * @anr:	advanced noise reduction config.See &ipu3_uapi_anr_config
  * @awb_fr:	AWB filter response config. See ipu3_uapi_awb_fr_config
  * @ae:	auto exposure config  As specified by &ipu3_uapi_ae_config
@@ -2724,7 +2722,6 @@ struct ipu3_uapi_obgrid_param {
  * @acc_ae: 0 = no update, 1 = update.
  * @acc_af: 0 = no update, 1 = update.
  * @acc_awb: 0 = no update, 1 = update.
- * @__acc_osys: 0 = no update, 1 = update.
  * @reserved3: Not used.
  * @lin_vmem_params: 0 = no update, 1 = update.
  * @tnr3_vmem_params: 0 = no update, 1 = update.

-- 
2.43.0.429.g432eaa2c6b-goog


