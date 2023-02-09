Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2DBC636D4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 18:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4w2uvC7tKfN7ZfSyrpjhie/I8cEOrFcZDWMac10H+4k=; b=J6owQbKPNEwWYXyFGVefMQbJzJ
	XvPrVWyvQrdpxjKAK8wTcEeqc6aLvhc+eyq2PAbSo7pdwALL/+hNo1yKnF8DXELyqCLWdomtc/lEn
	cLttnJeL0WmOgNMeurINSyMrsYnxZNAjVNXYcfKvEcQU4igdCVR/ucA5dMPW8H0mwidOHIJXSaxzn
	IQqDVhez+3rRmjArl7UD7dnZ3RBLXe+mBPQMNFqQTCSF1x2vwUot5juJ/Q1yHkAn47h3DQfzmguL+
	Th+s2wMtVN8qKGDwD1RJ6Ei975eAq+OobP6YvvNIhaFDLowanEzJ1ruXAZ9TU/i0NRfpqp8XBfo/j
	y3HCW/TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQBRP-002lWy-UQ; Thu, 09 Feb 2023 18:14:39 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQBQN-002kxL-P2; Thu, 09 Feb 2023 18:13:37 +0000
Received: by mail-ot1-f43.google.com with SMTP id j6-20020a9d7686000000b0068d4ba9d141so796479otl.6;
        Thu, 09 Feb 2023 10:13:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4w2uvC7tKfN7ZfSyrpjhie/I8cEOrFcZDWMac10H+4k=;
        b=5CmLtmU3ZxjSfd0UgzVS3R3WWkIFu71JMLKSFfd7noDK+8I/QuXfcz+puN2+Zc0TIZ
         UEZqgOqiVfLDk0IPaJKS5E/Z0S8Bt+GQiNzGZqYR6bzIk51io0Stjo43Z8ot9FTK6wQX
         uNXWDM2X318xQoLeRivh9bbNBocPFdIrB5sxrnFYPFczSFjH2fdc9XNnbShLazeehKIS
         el2DGakkVxxVRUdIbvLT9ka6Us0GQQJAQ+7wSEFizRKAUfSV/Cn+lwDrWHWNmWFW/M/k
         Swtmq/PJBmalB9bnkuprdwDEwN7Z84xi+Fd5qH0O7Y1e18MvqM5dG0BaSI7sEIArCFH9
         hqpA==
X-Gm-Message-State: AO0yUKVM7ohvCZPXLRLCxoCmK0Id94muB5X8lhS/2T4wDsR9/d/BKHoV
	dh54F19uhnWN6VFb+TwZBw==
X-Google-Smtp-Source: AK7set9geq4xni8+uYB8qGbMxQ7pUXj7wYLAoWyWFhJL4jxzTcF08XJ50z6U9Ah/fWoX6ss5tjhjwg==
X-Received: by 2002:a05:6830:39e4:b0:68d:81ce:a8c1 with SMTP id bt36-20020a05683039e400b0068d81cea8c1mr6701035otb.13.1675966413640;
        Thu, 09 Feb 2023 10:13:33 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id f17-20020a9d7b51000000b0068bdfa56717sm985127oto.36.2023.02.09.10.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 10:13:33 -0800 (PST)
Received: (nullmailer pid 586379 invoked by uid 1000);
	Thu, 09 Feb 2023 18:13:32 -0000
Date: Thu, 9 Feb 2023 12:13:32 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com, tomeu.vizoso@collabora.com, daniel@ffwll.ch, krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, steven.price@arm.com, alyssa.rosenzweig@collabora.com, robh+dt@kernel.org, airlied@gmail.com, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/9] dt-bindings: gpu: mali-bifrost: Allow up to 5 power
 domains for MT8192
Message-ID: <167596641142.586319.10372403582007442030.robh@kernel.org>
References: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
 <20230208103709.116896-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208103709.116896-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_101335_857627_53F986FA 
X-CRM114-Status: UNSURE (   9.88  )
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


On Wed, 08 Feb 2023 11:37:02 +0100, AngeloGioacchino Del Regno wrote:
> MediaTek MT8192 (and similar) needs five power domains for the
> Mali GPU and no sram-supply: change the binding to allow so.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/gpu/arm,mali-bifrost.yaml        | 34 +++++++++++++++++--
>  1 file changed, 31 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


