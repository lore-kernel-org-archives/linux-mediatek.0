Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6531DC43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 13:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=47nTxHvld4zPJV+NwkBD5loo23I+NuXpZildFfSOcVQ=; b=zgiZx1khXZkRhh
	GUSAtnBlFlWcRGaUFkNhlix5wFFCdgC+Ie2yGqvssQhvlMzd0EExP7FEyUItd3CVaqcjsBJualCY3
	aJqtXSgePoZhgRg5UCLK6RKlsIyJN49le8Q2h4Qzi5N5wmfBlr4EKokRManKeYcFAv6LAZmmjC9cL
	Sj4oMl4Ek8s4hbduuv0raJTqRXklXhYsuOrQaxVIqAEwDk9GM2ZAuTUPP1qd1xjbVX6fVk6w0x6P8
	mLDjHmikrYNyMdPVVHtjlf9bXPHN6Fl5MnJfec9NM9YXVKrK7nUyH2nTje63JukzI8uKPQNdZi109
	AWVF5Qjx6cF9dC8kI6DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwkyg-003QGb-B3; Thu, 02 Jun 2022 13:35:06 +0000
Received: from mail-oa1-f46.google.com ([209.85.160.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwkye-003QFt-5i; Thu, 02 Jun 2022 13:35:05 +0000
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-f33f0f5b1dso6726259fac.8;
        Thu, 02 Jun 2022 06:35:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tgfreAiExWVjh0PELNOgid7tEm3i3yoN+t28LQQbOv8=;
        b=eibPvS6z9+8pbrG8odCgye8ROuw9rwjgRmxoNGmI2dtz3/CZE0D0X6siZfUoexzJRX
         FK2Ho/v8GlwrKHDYBotjypgVw4lW2qCuq4PGYP8zQ9m8TTv4EicMH+wRv+PQR+oT3AEI
         09dzbREl82Y4hgr0fmyGS3ed5uktk1yoZhyZn7T507wlhDc2+JU6ePIPsNiqY3L0bYPN
         ibkrKoAxY+UMeAEYJ+pBOrD9AMSnWrtbR4QbNUr42DYYWL/mPsYKs1b7Y4L8fxZPITZy
         smZpX3ShKfLbcNM8Q8zMVUX9Iec7lCYOynyZTv/rDSE4htMDucjbGNlxl3sszrIwDQRq
         OVew==
X-Gm-Message-State: AOAM532bV1yRm9eWfYHBP3uTxqwkfqPssDz+y5ih4ODihlaVSBuYyiC0
	e4oF3oEcHjOJJsJK9UZ2dA==
X-Google-Smtp-Source: ABdhPJwWILYV+CaH9AQ9LI9AUkPXoe8U3uEh9QSpzW+3Pmotl16aphMbVSG0O8No11RVjqhlcb7ghg==
X-Received: by 2002:a05:6870:630a:b0:e2:f8bb:5ec with SMTP id s10-20020a056870630a00b000e2f8bb05ecmr2572853oao.171.1654176903469;
        Thu, 02 Jun 2022 06:35:03 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id o3-20020a0568080bc300b0032e41b45ea7sm368959oik.18.2022.06.02.06.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 06:35:03 -0700 (PDT)
Received: (nullmailer pid 2160289 invoked by uid 1000);
	Thu, 02 Jun 2022 13:35:02 -0000
Date: Thu, 2 Jun 2022 08:35:02 -0500
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, alsa-devel@alsa-project.org, broonie@kernel.org, aaronyu@google.com, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, angelogioacchino.delregno@collabora.com, robh+dt@kernel.org, devicetree@vger.kernel.org, julianbraha@gmail.com, trevor.wu@mediatek.com, tzungbi@google.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 18/20] dt-bindings: mediatek: mt8186: add
 mt8186-mt6366-da7219-max98357 document
Message-ID: <20220602133502.GA2160227-robh@kernel.org>
References: <20220523132858.22166-1-jiaxin.yu@mediatek.com>
 <20220523132858.22166-19-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220523132858.22166-19-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_063504_254043_EB8DC6E7 
X-CRM114-Status: UNSURE (   9.04  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 23 May 2022 21:28:56 +0800, Jiaxin Yu wrote:
> Add document for mt8186 board with mt6366, da7219 and max98357.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  .../sound/mt8186-mt6366-da7219-max98357.yaml  | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
