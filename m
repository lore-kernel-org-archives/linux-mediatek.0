Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9478DC369C2
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Apr 2025 08:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jcz9EqU6ZQpMl1zFWZpq4KGu3DkXTYoxIWYCwpKvcbg=; b=ecmFjBacUOSZMoPYssoMlgexON
	zB9p0y+vNneMl2DuA56d7JQQH7y27n10HpGfUWIsQq/If9NzF0RiMuo0rRoRB1wCujJaIOoKXj8th
	pTPm9W/OpyIHjiHLESqiDVBopqMwL0B4ROUGW/SKlMrIc1IA883daSKI1+4BcNd4gl7sdrYlaffUp
	UsH5Urb9HGp0nR9JRVyjmRXXpYW4HeAaDVzvA+4kkcKAz/OrDUd8LKqg9Ue1LyvwaEskeQghIsJMk
	fOEfZ/hhWhQR2BigTbhYwtR8yyBOvRed7/JHPYMMCwTe6qWcq5tfT1g6pHJtcbd0XBfBVtSI+DUEl
	+Md3SOdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8ENj-0000000GK8j-1KFJ;
	Fri, 25 Apr 2025 08:25:59 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8ENh-0000000GK8E-1TKE
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Apr 2025 08:25:58 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-30572effb26so1787488a91.0
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Apr 2025 01:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745569556; x=1746174356; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jcz9EqU6ZQpMl1zFWZpq4KGu3DkXTYoxIWYCwpKvcbg=;
        b=JnRI2sIbg9307XaPffT9eJFZ/l2qr/Qo4n4RdOd3cYl/ua1k9Hroxd7XdBa9W1NRAa
         y97Z/dY9KXm8j8HJNPkzlD1TZrWoqQ/fb+hHB2ay5ZAtZuWT6dguTnnasfvV2XgavxTC
         sn1qbXUWM9D8jnLqkO5msyBpD8CpeFEh9u1uI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745569556; x=1746174356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jcz9EqU6ZQpMl1zFWZpq4KGu3DkXTYoxIWYCwpKvcbg=;
        b=cRYergcRv1pQQofIN51oj3+V7S+9emvCLtl9Y0ECJyYH2DZOBOYjND6t7oM7Q3AaNC
         Mne0MdE8yPPpY/J5OfeLjruX0wNkmpDSJdr34c41xeoyb7EAgJeITrVDS9XWO9O0Mi3v
         rSPo5z373XSVL+bmsPzpRJL4lk7vFRWepXNZwNADRE8Gi7kVBV56mgYlB5VIr1mXxpQy
         08Mn5zeSzD+X+SBrRWJOiM6HEUhnkUbnFGHHFxBNwBQbw9hkAGaMnvu4FRUsJXHUjXDJ
         ugjWnlWnMiFsLqmOpDSxhwwPhUmqBABC50Dl/GD2SnAredI5edr63hMWYqEP/f9HfulZ
         luIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvUFXtogCj6Z0GtQvk4Ar10PmfLpj5A1QrqLZ8OZ/myUslYwHF0CojpuL41vbszxEYjZywWDCFJwN5YHhFYQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTlJd11XTXBnEhlVRIJ7hTme7IJ7zIz/HRSZttrW2WEpnHRm9b
	p8v4siI+R47rSsJ+St8Pvtis6QGum/IaZwKUbFncURgQf5aanBiGEP3QcFNArg==
X-Gm-Gg: ASbGncufSsd9e0fZgRYjjwSsoBiI/jjGgmvcRFbtUb1meI4TVyYcTAe40qfGApRb5lA
	aRw4RAydBT5BT8oLbjfMQYJQGJyHB7Wt7IoCFdc6WeF9LRSkdJomk4fMA9JRIIL/E+zHuOaUk4c
	oWkxSRQLqIdku5QbAeGNLGq77NYgK9n8rNC5gpXfo3pmXZwDr6FuM4bgPSQ89edjKbsDEwwfLMZ
	JtsAKHYd3rpuNJPtGbyi5rMCxs53NPTCvyM40XAOgsbV9BTEXaaq1mZ0keiFv/JnHm2Bt69q4cS
	jY4cnJcYxosK0w0VbiW2uTOs+qMnJNa4UhF3v2FPwBIVRaPTyfcR8AsdPc0kJABkuleuGA==
X-Google-Smtp-Source: AGHT+IG5Uyfo+8KyJi5NoU797oZIX2TlpTNv7KKnWh9nNRiitklDfGL+r4wwSDuwBFRSrPVBj5U9Gw==
X-Received: by 2002:a17:90b:5448:b0:2fa:157e:c78e with SMTP id 98e67ed59e1d1-309f8d8cdb1mr2089363a91.7.1745569556308;
        Fri, 25 Apr 2025 01:25:56 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:4b10:d9aa:98d0:5bb5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f77417d6sm1019179a91.4.2025.04.25.01.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:25:55 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Darren Ye <darren.ye@mediatek.com>
Subject: [PATCH 0/3] ASoC: mediatek: mt8183-afe-pcm: Shorten source code
Date: Fri, 25 Apr 2025 16:25:47 +0800
Message-ID: <20250425082551.1467042-1-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.850.g28803427d3-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_012557_414336_C79E1E56 
X-CRM114-Status: GOOD (  11.75  )
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

Hi folks,

This series is meant as an example on how to use macros and range cases
to shorten the MediaTek audio frontend drivers. The drivers have large
tables describing the registers and register fields for every supported
audio DMA interface. (Some are actually skipped!) There's a lot of
duplication which can be eliminated using macros. This should serve as
a reference for the MT8196 AFE driver that I had commented on.

The three patches tackle separate tables in the driver. The remaining
one that could be tackled is the list of DAIs; but that one has more
differences between each entry, so I haven't done it yet.

Please take a look.


Thanks
ChenYu


Chen-Yu Tsai (3):
  ASoC: mediatek: mt8183-afe-pcm: Shorten memif_data table using macros
  ASoC: mediatek: mt8183-afe-pcm: Shorten irq_data table using macros
  ASoC: mediatek: mt8183-afe-pcm: shorten mt8183_is_volatile_reg()

 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 616 +++++----------------
 1 file changed, 136 insertions(+), 480 deletions(-)

-- 
2.49.0.850.g28803427d3-goog


