Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5975C761A6
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Apr 2023 17:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M6gkago0IX2qDsFTPoqyaI/Smb2BtWMPqkzjbhBxBBY=; b=XD9qPWeF5NxTTvKXxTNRxt/GIp
	hFqUh6cir5GmH/WDb2eRpwVB07d0E05BxHmtztKvdm5OuID4wnDQsztrtFe2ljQ3kTJoscjOYzaqy
	mTo2FQcnhIlS3VP5/dOjh5HSpAaJeGmneKLKy05yxY6KAjtIgqN1zSJiQe8hWkh6spPoCOMlYUlxP
	qYz2g7jzV4uyFQWvOuJXI1bYaJwvoJrjKHRxoPYUHR7+EQv/uHzpGIXKODbtKO42/4JqOMcEsmiTQ
	r8RJYFzwzqWOvLXXG5oenIbkBCX295uGssV08+66uIyIOATpYpjztxjZnzWusOUE/F3MuPUD8LHfF
	vnZYQpMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjk8W-002KYj-36;
	Tue, 04 Apr 2023 17:08:00 +0000
Received: from mail-oa1-f41.google.com ([209.85.160.41])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjk8S-002KX5-2M;
	Tue, 04 Apr 2023 17:07:57 +0000
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-17ebba88c60so35341761fac.3;
        Tue, 04 Apr 2023 10:07:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680628075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M6gkago0IX2qDsFTPoqyaI/Smb2BtWMPqkzjbhBxBBY=;
        b=TCQf+olTCMvbkyMd/BbGFfmsJAeFp+UCatu2Nd2MN7b/dFdTVE9/YTdHNK7bRTfIKu
         Ew8ZxO6/MMrjOH0diZQY97hDzvZTfBQfswOGsJltUDz4bUhGsMOVTJIKE/E0YN5QMFJo
         utEggmgiaU8/yxAta5wUmo25qLSvffIeJlmku9Kx9jK3nanEEVH2QT72izyBS7r+WzoN
         CsIQ0sV2l8uTTNU6w0Ty8BMA5tJmddI4He2peJTJKntY5tIzxNp/+hZv5t/eqFF9yNWG
         0KLjMu4OKyNW1MOqP5xQKmZnczMmoiIqARso1Lp6mtLeFrWu9qCq/GuIJ3JFFytAU+Va
         evxA==
X-Gm-Message-State: AAQBX9cTedcqh0Bg7C4r3RG3tyDXlda0SWEXf4bG7aZ8GFHxdU755THJ
	cOB3L53dDMwWXXMnt4qhkSO3aWPAAg==
X-Google-Smtp-Source: AKy350boa65dpRdsMFN94tJSdJniDAXV5Su1VkGjuBPDPH1ry4H904Fa2qgHRI+R97gDaNx5b+aQyQ==
X-Received: by 2002:a05:6870:d599:b0:17f:d229:bc54 with SMTP id u25-20020a056870d59900b0017fd229bc54mr58236oao.12.1680628075017;
        Tue, 04 Apr 2023 10:07:55 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id kw17-20020a056870ac1100b001802d3e181fsm4961509oab.14.2023.04.04.10.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 10:07:54 -0700 (PDT)
Received: (nullmailer pid 111440 invoked by uid 1000);
	Tue, 04 Apr 2023 17:07:53 -0000
Date: Tue, 4 Apr 2023 12:07:53 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Mattijs Korpershoek <mkorpershoek@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: input: Drop unneeded quotes
Message-ID: <20230404170753.GB49361-robh@kernel.org>
References: <20230320234718.2930154-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320234718.2930154-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_100756_772569_9E021770 
X-CRM114-Status: GOOD (  11.21  )
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

On Mon, Mar 20, 2023 at 06:47:18PM -0500, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/input/adc-joystick.yaml     | 4 ++--
>  .../devicetree/bindings/input/google,cros-ec-keyb.yaml        | 2 +-
>  Documentation/devicetree/bindings/input/imx-keypad.yaml       | 2 +-
>  Documentation/devicetree/bindings/input/matrix-keymap.yaml    | 2 +-
>  .../devicetree/bindings/input/mediatek,mt6779-keypad.yaml     | 2 +-
>  .../devicetree/bindings/input/microchip,cap11xx.yaml          | 4 ++--
>  Documentation/devicetree/bindings/input/pwm-vibrator.yaml     | 4 ++--
>  Documentation/devicetree/bindings/input/regulator-haptic.yaml | 4 ++--
>  .../bindings/input/touchscreen/elan,elants_i2c.yaml           | 4 ++--
>  9 files changed, 14 insertions(+), 14 deletions(-)

Applied, thanks.


