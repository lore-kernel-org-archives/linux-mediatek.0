Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE527C25B78
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 16:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DVcQEIP+MENTssUPsqaOZqlKvsqibx0etjqeiTYhCrQ=; b=s5jwtp2gYso7uIrjFCJHl8zsVV
	GzYbyQI9TZsVuQtllvVpum+PgVjZ2rLZQyV/8DfNMVuRWulVwB7QXiDC5+Ei1+oAvIplMRzXdW7wX
	Mo9HePQ4VL6mI3InWml8kcSeESVrMg+EsjpRlF+So9gOIVcBw+DxYfZa5Qd6JyqYKmPhcBA2JTKmr
	daC6g2JEji3GIbJWUpIXPyU8yvxYnbQJnyy2YbtZHzUIHKkoqtMkiurERdkZizQNLvfTqBdv0EQUV
	DcoZpfw5SP55tMe6yG+MP7JKud8D/HgBgqvrUSsQHtFNd7iaoE/yzsvx0iELS8qXYlSszKea4ou7V
	g2XVBKqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEWgk-000000033yF-0yac;
	Tue, 04 Jun 2024 16:07:06 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEWgf-000000033uw-1kve
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Jun 2024 16:07:03 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-35e4aaa0f33so3022663f8f.0
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Jun 2024 09:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717517218; x=1718122018; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DVcQEIP+MENTssUPsqaOZqlKvsqibx0etjqeiTYhCrQ=;
        b=MyaNhD88jP8t4ev5l7GQzlz3bcj9yR6SW5MLFwwRxb5xdh7HMC0LQqjS8bFYnXaPbA
         ps4SZQkVmcr+gSnHyqgwGXlcPXbmP2T5O3H5EUov7YfUV5db0r5iNsyyu3g32SBqX4d5
         HTK0EcWqyNE/ABKN74F0SQZbRBwVo3dXJf3DjAEjm5AJd2hGYGgXHshekaeQ8JHBrpNJ
         xyGBgwSeZHpgo7PZVNLYArPeAdesMxLPII/boAX2dUiybA1HBvbCl0Xe1egvg+bEzzRC
         SB/0gytjLJkzzVbdrgLTg6X5WSVjUwlhJLyM50u2nopPkOVTZ8aIKBMI3eqqZDRVXNVP
         XQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717517218; x=1718122018;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DVcQEIP+MENTssUPsqaOZqlKvsqibx0etjqeiTYhCrQ=;
        b=Os66oQ+Y/GmqHdbBjVkJCNyNC4wvg7ShW0ZEJVoP/ZpI6hthqzpAwFFizZEhkY8VkG
         Ptm7e0YHkonKBIPE2t3oaWviaxhQGq0n69idGa2cUQe5bJOAlveNjSRZeM2fe3TkRjuY
         5+c414wvnnILKy51bz2zheLhsDygTRONzU+LuMmSPGfFED+pkVVdmor8iy/6i7fErxeF
         GE8EBTiTBn799NAGeNklJOlFLWCt5Inl0etn/K7oiusmixfRI+AMH3/bv1FdRrw9at0i
         Rz3EEY+NC/nmItzrwJUwmLwB+pI43yyGLJsI6ZAjafy5VdI6QJGuEmseYvGNmZHFS77K
         3iaw==
X-Forwarded-Encrypted: i=1; AJvYcCWeGPeYLajWboLhkivxcnNkH1p/zPyRpjLsO66kIeF2pBRU7xFRKvBp8lyQ62ksvpUHoTzYXuBCDQYVLMK+8UVmdhmG4zp0vrNlPgBqJO0WMatF
X-Gm-Message-State: AOJu0YxWY4wur3FqDU4tAMvW44b2IgUa4v6HVamNSlLGNzcar5q7V9JO
	r35EgVqgF/YBaT1hAdw7NUjzNj3vMQuCURS5rUyayFxGUIvCbcOwJhY1zhGV7su1E3qU71gwnxy
	H
X-Google-Smtp-Source: AGHT+IFYA1dhRvmL2GTj5Q6k/vk2zOUsQMMogmi/rc6o5NV9inVq5WoI7Vq75aDni69dzFSZ/DMrow==
X-Received: by 2002:a5d:438e:0:b0:354:c43d:d5a with SMTP id ffacd0b85a97d-35e0f26984cmr10765554f8f.24.1717517217961;
        Tue, 04 Jun 2024 09:06:57 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04da756sm11983392f8f.59.2024.06.04.09.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 09:06:57 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vincent Shih <vincent.sunplus@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rafal Milecki <rafal@milecki.pl>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Joy Chakraborty <joychakr@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 manugautam@google.com
In-Reply-To: <20240510082929.3792559-1-joychakr@google.com>
References: <20240510082929.3792559-1-joychakr@google.com>
Subject: Re: [PATCH v3 0/1] nvmem: Handle actual amount of data
 read/written by suppliers
Message-Id: <171751721565.70889.16944298203785853489.b4-ty@linaro.org>
Date: Tue, 04 Jun 2024 17:06:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_090701_558471_E4103238 
X-CRM114-Status: GOOD (  11.18  )
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


On Fri, 10 May 2024 08:29:28 +0000, Joy Chakraborty wrote:
> This Patch series stems from discussions in patchset,
> "[PATCH v2] nvmem: rmem: Fix return value of rmem_read()"
> (https://lore.kernel.org/all/20240206042408.224138-1-joychakr@google.com/).
> Where we come across the fact that currently the nvmem suppliers do not
> actually let the core know how much data has been actually read or written.
> Instead they are expected to return 0 for success and the core assumes that
> the amount of data written is equal to what the core has requested.
> 
> [...]

Applied, thanks!

[1/1] nvmem: Change return type of reg read/write to ssize_t
      commit: f5de138db5b76de7d96d4cf92f871ba893ba0119

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


