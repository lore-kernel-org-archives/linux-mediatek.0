Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E3760A2601
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2026 14:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uWYxR9Wx;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jMdI/a00
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mIGs1095/pi5A3phf200bT5vD03Lp1U81y8sX9m5/iA=; b=uWYxR9Wxyz3HZsTgc4kX13jqMD
	E2MXFpvtK6kOMo1MPh+mlEFv0vPHdfPmqEDk1+Py7DOdcV26Bz9qavfC4A4gHOjkVK8AZMWIpgHev
	VrmwdxaecLwcGj9TSKlj4L0gasNmrF9mGnF3bRm0Aqe1AmtvLk7sHZt+PXHRpE8TBR9SqewtgcnDn
	blkzUYWopZf9xeSStgY660EUsBtcW+MHtKaTiCNhEhAvjvZPwwaMWeFLi8b9z/W75ykutSJqWnXIC
	Ys9+CmT6YI0gGNx58Wj0CgNZVFaq+F1zkK8XnaHOf71s0Ojdp/V0F3UXcUnEwe7m5F8dkwWL34QPT
	SfywLa3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM55u-00000007H4d-12uc;
	Wed, 28 Oct 2026 14:57:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM55t-00000007H4D-2FcM
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Oct 2026 14:57:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EC91744205
	for <linux-mediatek@lists.infradead.org>; Wed, 28 Oct 2026 14:57:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3CBE1F031EF
	for <linux-mediatek@lists.infradead.org>; Wed, 28 Oct 2026 14:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793199456;
	bh=mIGs1095/pi5A3phf200bT5vD03Lp1U81y8sX9m5/iA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=jMdI/a00XCHeoltZkWKqXpcnERaff94e8hUKV8fOm4MaNY8O7y8prtqZlsS9V/TkO
	 RKGsHZDgxOXPjYTyHI9CJivdGW0s6UtXpw76OxzGTPoDgIC7iHh9yHraCorypu9A24
	 f13SbMaf8ehpJ1Vrn5gwEG45lQsOTRogifSRjAcKVDsVICaojZ3L6MiUauU5qEyNMj
	 qdSbdcvGdfG5xCBzqJn0bcDbuYF1FWV3HjEfaA9067wejwOomt/ISv4QmQZPp64M9I
	 2GQTCVbh2sJlrSjd6LsK2ctiDl2gbWRxESTSbGZXlkBjr7n38p7Qedfk5K1irUEH8I
	 YCwFtpin54F8g==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ab27e45e7cso8554591fa.3
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Oct 2026 07:57:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwOvmeZGlLWu7LYMLw38D5a9k+T7n7dTqNQh8My3UeeAJc7LvqnGAIclJPMQFi1DCXs2ZZE0aEJKp9igm7JIQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYIuVFZKBo8AEOTmwdclUomTOFOZUkA1ZcJzEIZQktF4MdJFgUrF
	dZ/Mo3hg7RvTMOR4Gfcg+QXeujrMhlM0iToPktwW12pEEWddnL6sntKQGraPoxQ5vCL4tuaexp1
	xEj96/u+vCwLvorGbg8XS8AHTPPsVIqOQCyW+CB0oUQ==
X-Received: by 2002:a05:651c:1543:b0:3a9:d756:bfdd with SMTP id
 38308e7fff4ca-3ac9cf1d2cdmr6179361fa.7.1793199454407; Wed, 28 Oct 2026
 07:57:34 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 07:57:32 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 07:57:32 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261028120216.2657397-1-robh@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261028120216.2657397-1-robh@kernel.org>
Date: Wed, 28 Oct 2026 07:57:32 -0700
X-Gmail-Original-Message-ID: <CAMRc=Md2xhYPdUEQ2SeqiGq9uG1qcc9Hi77T4k3ta_wmd56BhQ@mail.gmail.com>
X-Gm-Features: AclHuK-L3iqt92WsRHLJE8OI5aNBBhyNCiN5RHrPr_WcVOO_RomVfpU-3_RxU7E
Message-ID: <CAMRc=Md2xhYPdUEQ2SeqiGq9uG1qcc9Hi77T4k3ta_wmd56BhQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Fix property name typos in if/then schemas
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	freedreno@lists.freedesktop.org, imx@lists.linux.dev, 
	dmaengine@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Christian Marangi <ansuelsmth@gmail.com>, Eric Anholt <eric@anholt.net>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Peng Fan <peng.fan@nxp.com>, 
	Aakarsh Jain <aakarsh.jain@samsung.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 28 Oct 2026 13:02:12 +0100, "Rob Herring (Arm)" <robh@kernel.org> said:
> Property names within if/then schemas currently go unchecked whether
> they have a type defined or match what's in the top-level schema. Adding
> a check finds a number of instances of typos. The typos result in the
> schema having no effect on constraints.
>
> With this, fix the mediatek,vcodec-encoder 'clocks' count constraint
> exposed by the name correction.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/clock/qcom,kpss-gcc.yaml     |  2 +-
>  .../bindings/display/brcm,bcm2711-hdmi.yaml          |  2 +-
>  .../bindings/display/msm/dp-controller.yaml          |  2 +-
>  .../devicetree/bindings/display/msm/hdmi.yaml        |  4 ++--
>  Documentation/devicetree/bindings/dma/fsl,edma.yaml  |  2 +-
>  .../devicetree/bindings/gpio/loongson,ls-gpio.yaml   |  2 +-

For GPIO:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

