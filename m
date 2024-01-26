Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE3E6C47DDB
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jan 2024 23:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IQ2hVP5YSWUaFh2DmjHhBwG+r6f86O5FO2Ifv95SzW4=; b=qJrJE7Fz071cOmwpvG4Nx5j7SM
	T5J08VC5kW+5rOdslnXiByb7o0kSPn9gZ5kR24mXqMT9dh9FYeOq8oHJXjPBJGI8ib24Rcug9VrYB
	H5QhR7wdB5J/pH3y+P/RUtwN4PDR6J1okOLewR4cvoGaaBFbJFxSr8WElXLiMdpFP9h3AuCo62sNI
	eWdFcdH8T6QR3Fc+UVA327dC2wcR1SkcuJF7icvSuEJd3q01mPK55MBa+2/P8g2240s0oqbLLcOJM
	weOpuodtP5/nX/xRrlXkFXrJdem1gSj4YjvVjVo8KnXf5HdZcgtRvhgJ2/KNcOJWg6vS5jkWGcp8w
	CVpCrP2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTVS2-00000005jfo-1pic;
	Fri, 26 Jan 2024 23:17:34 +0000
Received: from mail-qk1-f172.google.com ([209.85.222.172])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTVQp-00000005ia6-2XgI
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Jan 2024 23:16:23 +0000
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-783d4b3ad96so78742385a.3
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Jan 2024 15:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706310977; x=1706915777; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IQ2hVP5YSWUaFh2DmjHhBwG+r6f86O5FO2Ifv95SzW4=;
        b=S+/YLqV51YkHEpRBSjSayCHVqhv2eryiqhGUoqKDD6NkDvQQpArvgLAaNsfgFUzO9w
         hXFAo/hXdhB/gHKIc8VgOSsxLJZXLg9lrWxgBi+z8zNC4NltGc0/MvxGixRAqCY57Z7V
         IoF+QyETVObwU5fDsP9TctoFY+pcCbzAtkIK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706310977; x=1706915777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQ2hVP5YSWUaFh2DmjHhBwG+r6f86O5FO2Ifv95SzW4=;
        b=lUQfcClt5lUsLxYzoKoSBKx4w1+jbXIJVIDW2GSQaGN1GaGm6VowFNh2YY9+7Wej+a
         HV0MBK1tXBEsXOPRATd1phYr0H6jqR4QmswcgN29RSflJFvj/WZclzM92MYfH9RUBt32
         6UgwVZlC4Vx9OvyOO6gk4G4lMbCg0KxVn4fMn027QilKdhNaYC90FYxScy1Cj8ZrQFub
         YrlbzGVtaAFen7s99rKYmzR6uQyUt0qEmpF+5/+e87ZlAAbHAirBk3VYxiscEeAntnOm
         yMNl8egXBHwERgye4slb+0vXG7koTTKaatEe+zmOuQxvh9bwjf4v2n3cecc5WIcrHBHf
         yS8w==
X-Gm-Message-State: AOJu0YzR/hksybiQ+XjfkVYSgb8Ed8Y6VQ1qXDHPEKoipbSxdRgwZrkr
	1z9vJjavrnKFP1kyRlqyNB4EAKtq93WZDdHKnwQ1KY+RMEfQyL+isbKWqavybQ==
X-Google-Smtp-Source: AGHT+IHtaIwGnlHCGr2gV5vTdHthY/KJARNYO6pIlwA2CpmdH7LMlVQFPCHc4W3qOep8rQ/bvmYRGg==
X-Received: by 2002:a05:620a:12d9:b0:783:25ba:6c70 with SMTP id e25-20020a05620a12d900b0078325ba6c70mr576836qkl.129.1706310977198;
        Fri, 26 Jan 2024 15:16:17 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id m4-20020a05620a290400b00783de3ddf5esm507358qkp.70.2024.01.26.15.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 15:16:16 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Jan 2024 23:16:10 +0000
Subject: [PATCH 11/17] media: qcom: venus: Fix kerneldoc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-gix-mtk-warnings-v1-11-eed7865fce18@chromium.org>
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
X-CRM114-CacheID: sfid-20240126_151619_897752_4D3D4CB8 
X-CRM114-Status: GOOD (  10.03  )
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

Remove doc for missing field.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/core.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 4a633261ece4..a39986ce79f1 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -428,7 +428,6 @@ enum venus_inst_modes {
  * @error:	an error returned during last HFI sync operation
  * @session_error:	a flag rised by HFI interface in case of session error
  * @ops:		HFI operations
- * @priv:	a private for HFI operations callbacks
  * @session_type:	the type of the session (decoder or encoder)
  * @hprop:	a union used as a holder by get property
  * @core_acquired:	the Core has been acquired

-- 
2.43.0.429.g432eaa2c6b-goog


