Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4620C9832A
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2026 06:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lCOnM4BG9opzc/4UWmCexloGpdYaWaFpKWwedqDPapw=; b=OpzNkF07pIVVLkg8zKpULhM0Cw
	mSzHvqdBu4qE7EcH5w/586GntreJpZfSvhlz5lqyYyyt51HS4lPs3l/Cvk5RF9Oy4Qil7La3TN7ua
	V3kk6YlEJoLuVBcnCG3RHUzmDBN2JqBfKHRvlVscVn/2yorcrAbjIfiCKK7Z6fe20UqheOcE9g5Ld
	O6sq78HlwH+UxCfYZepHgW6YznuAgCiDGPqQYh7UZKpavK4QLO2kxG+KgWjfSITHz84dDdtAEXhUK
	sW5tWokbEoZ2XeVdENB1DtsgxG/DPURBlUCqx8BD5b1/5l0sXeFuzwZrbS8K8WeoatATA0wBoozTv
	yD67skUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR48-00000002Pd7-0UxW;
	Tue, 29 Sep 2026 06:11:48 +0000
Received: from mail-pj2-x0e.google.com ([2607:f8b0:4864:39::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR45-00000002PcL-26XW
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Sep 2026 06:11:46 +0000
Received: by mail-pj2-x0e.google.com with SMTP id 98e67ed59e1d1-39d654f02baso1638141a91.3
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2026 23:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662304; x=1791267104; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lCOnM4BG9opzc/4UWmCexloGpdYaWaFpKWwedqDPapw=;
        b=LetmDwN9hHe95x+LqMBUscGDGUEFM21PsUvEa/zpm6jcxqEvXN+CvAIkUtOMWKYWEy
         vU7lK2a7UExcCuGJTjs9FLOcqnPE4NTNp02fKMYG7MGsDkx9p3gKJVcD5LNxXgLhQq/G
         q3UP8GAAkTd/uoISR7Gkc8+nEsIJTYtXutgczMLYZXW6q3YcBdZdKc5o54F/2IVC2QVM
         DjbOu1/wxiNmTGBhi3JLRR/O+7JreiBUkyMYIv83kN0QGurX+ie5e6QPoClx+x+HKjNE
         u6SkDOpbDa+HI+GVhydZMBCFcr062HwZK3l17tL0KF+8Xooj5cLPvDgwXg9m9e32YUVI
         qGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662304; x=1791267104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lCOnM4BG9opzc/4UWmCexloGpdYaWaFpKWwedqDPapw=;
        b=T+x/wBRUk3AasTrJrg+YmqoATLxe+8jdERxtT2lpZZa3fNbC/fSEDDomZE75wjAm0v
         qjd25Re5spkFNXo1D+/pmhRS7ULA0DM3Blxlf17DUTKjL2Ls7G6rv2q3q0+jbUXTUWl5
         ENiYq7rHJTEOz+3c2KRcZoV1MhefljpIxKcf+hIU70KghvDPK/+ND6RsrBklZKIDLDJz
         Zum7bOSRsqGVP2E1h/PF/q0j5lb315ezBfA6xMKpR+jqkt3LtEB3QBmkjEZhD3jKrUNH
         CztC2eqFGN2zULjDqPOzsBevBBPmZ7Ev2F+mz8sQnuQVZDEV9U9lLAldLevskJSuDD2A
         fQnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkreHRscwVj/zaiA5WkFErVD4lXlJypeij0NjsehQS2+0vYXhtbukWHLMSg8tQYKmH7vqyAAVZOuEKlub7AA==@lists.infradead.org
X-Gm-Message-State: AFq9FYJSVCwQpFgJ+IK7wdwCkK0OGvjLmqiJQGNDckwoQkCzC7q5cdPJ
	XJd/xCzSErroPmLVBAQ7vacfSGABbykM2GvrumCcHDSIC17RKuzgyvoq
X-Gm-Gg: AYBFou3QLTZS4etqz5LrfFpj64rKBRPtWnPuWRnJfrO5wSTWQxGX0psrpsDfZFT8uzc
	f5uhUKUmR/1iMyUilEkz0UqYp+y09e8g7Vu3f6YCXXRP/MUpyQFJQj+GyEsIH1ZkJA5BjTYfIIA
	T+geLe7EWXqAnzYUlBZOOPXIuFqL92DpWumhv0KwClZ7CpDSmZsHdKbk+oYCBi/PM0QbGw1CJki
	6oIfbWhMfbedo6kqO4zKh6d9wr669BlwXay5OrqKWfOgpTwnhTug2hk4HnX3QNNM9qXVzH89MyU
	aPIsQG01tetxs/als1SvlyKWclmGksVJEMW0zAf3LzGMwFt1o7fz1PfFExc0jeEvdPFIO3vX46z
	6eJW3kSMtL8V7NBrotwlE/FMbNm8jArHhdQ8bDru/pwlCDVdCH0wa/5ns5C/zB1Wq3NBTbfea+p
	rjXrbYya4/DrOWQU3nMaACyUMfX5cszIvhVQQAATpUcxDvgxCpSO80zaOu40A4CCGOyxHBg5gB3
	92mYVG/lq47tFKlFQ375inD+uZhg5kbDTnokQrc+SLUqFejk10i+hv5JSiDR1ssqDc8zSbZ9Y14
	3XEMAcMPOibxYA==
X-Received: by 2002:a17:90b:4c4f:b0:3a0:bf0a:c9da with SMTP id 98e67ed59e1d1-3a0bf0ad1cbmr11373686a91.47.1790662303866;
        Mon, 28 Sep 2026 23:11:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:11:42 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Darren Ye <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 00/10] ASoC: mediatek: mt8196: Fix clock error handling
Date: Tue, 29 Sep 2026 13:11:11 +0700
Message-ID: <20260929061121.124001-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_231145_592147_709E07FF 
X-CRM114-Status: UNSURE (   6.75  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series improves error handling in the MT8196 ASoC driver,
mainly by checking and propagating errors from clock operations.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (10):
  ASoC: mediatek: mt8196: fix APLL mux error handling
  ASoC: mediatek: mt8196: fix APLL enable error handling
  ASoC: mediatek: mt8196: fix MCK error handling
  ASoC: mediatek: mt8196: fix register access clock error handling
  ASoC: mediatek: mt8196: propagate main clock errors
  ASoC: mediatek: mt8196: use dev_err_probe() in mt8196_init_clock()
  ASoC: mediatek: mt8196: fix runtime resume error handling
  ASoC: mediatek: mt8196: remove redundant error message
  ASoC: mediatek: mt8196: propagate I2S clock errors
  ASoC: mediatek: mt8196: propagate TDM clock errors

 sound/soc/mediatek/mt8196/mt8196-afe-clk.c | 145 ++++++++++++++-------
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c |  28 ++--
 sound/soc/mediatek/mt8196/mt8196-dai-i2s.c |  17 ++-
 sound/soc/mediatek/mt8196/mt8196-dai-tdm.c |  16 ++-
 4 files changed, 136 insertions(+), 70 deletions(-)

-- 
2.43.0


