Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C74DC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 20:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5rjfTGrt4xmymVGtpNrhi9ebxqtPFU1Wg32kJfF6yZM=; b=jHxSPhbRZUjfxZOSwmwHDXWsd6
	gPPtV1AHmTj/aoMIVaz0hIplYdZ72MytQ+FwCcpqwa0fA46gf5jrtOsbyTLEp4fmkoZHmEzI5kYUp
	hC37GoGhGH9YWghseh+eIMzXrL8x0kO5a7iL1cOaVq/STTUna2x4iPxtgD/Gex26ItZmLIKf4PF8q
	a3vu4TgYo2jvVLhy3km+HkdAG8qpioOSBFq/sU03Jt+Pu0j31+YEjFbCuAkh0PSwUkJoMngUr3Vq6
	z7X3y324/JA1jBp5zK/bnSnUaGL2sEHvNT9pjYzu+pbItApJLpYBFxxYmrSXqCrlQq0rMQnS5mNta
	EU5ZDhcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDX4s-000gLv-B3; Mon, 18 Jul 2022 20:10:50 +0000
Received: from mail-io1-f42.google.com ([209.85.166.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDX4p-000gIQ-VV; Mon, 18 Jul 2022 20:10:49 +0000
Received: by mail-io1-f42.google.com with SMTP id u20so10218058iob.8;
        Mon, 18 Jul 2022 13:10:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5rjfTGrt4xmymVGtpNrhi9ebxqtPFU1Wg32kJfF6yZM=;
        b=GX4qzG8DlSRy1yl+lRl6JaVvj7PYDg+RQ6zisQQ4DH0HHgBZiihxV5S40De++iDQ5y
         Lvo5T2EuwWgOqqVgQwoFEcxHf96zU97HTaEb/b+/CJvAcAH0aJvtYpZLiM/TFQnGURGu
         MzNnvFYUm+A0LgpVNdawVJ+q59EFMGxG1vTljJ1Ysvfabd//X5UFoSwJ0tAcosnpClRA
         /J9gYlFB4voYEZtrZXWLKEy/zMSvNIKsEt9CBTYw1k4i1EDCBdJNbh7nqGefXqsEvUIF
         WQagPGaVtbdCZ4/gb88f/BQnw0zMdw6EsPgMdBrL0F3gmyJQZ+OSARaGaSyvbIa4m7tb
         Iehw==
X-Gm-Message-State: AJIora9dKT9MbdfOAnza0rkw0VDa4fEMfgEtoMGeFVEeG7kfy+ETd7CK
	FdepFOO8vdyWQ9I+ypgm7Q==
X-Google-Smtp-Source: AGRyM1ua0GjyZ64NbEhZxZhxjYVvv+/wFm0Bro8rMy75FpwbrAzy6qGL73JtXq8/EIoL73W0XywYIQ==
X-Received: by 2002:a05:6602:2b10:b0:67b:bef0:65b4 with SMTP id p16-20020a0566022b1000b0067bbef065b4mr12925297iov.182.1658175044407;
        Mon, 18 Jul 2022 13:10:44 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id q24-20020a027b18000000b003415de88347sm3165447jac.123.2022.07.18.13.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 13:10:44 -0700 (PDT)
Received: (nullmailer pid 3465081 invoked by uid 1000);
	Mon, 18 Jul 2022 20:10:42 -0000
Date: Mon, 18 Jul 2022 14:10:42 -0600
From: Rob Herring <robh@kernel.org>
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Cc: matthias.bgg@gmail.com, devicetree@vger.kernel.org, benliang.zhao@mediatek.com, linux-mediatek@lists.infradead.org, bin.zhang@mediatek.com, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4] dt-bindings: mediatek: Add axi clock in mt8173 dts
 example
Message-ID: <20220718201042.GA3465001-robh@kernel.org>
References: <20220712111106.31089-1-xiangsheng.hou@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220712111106.31089-1-xiangsheng.hou@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_131048_030178_AEC13008 
X-CRM114-Status: GOOD (  13.90  )
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

On Tue, 12 Jul 2022 19:11:07 +0800, Xiangsheng Hou wrote:
> For mt8173, it is needed to add the axi clock for dma mode.
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> ---
> Changes from v3:
> - fix number of column characters
> 
> Changes from v2:
> - remove assigned clocks and parents in dt-binding
> 
> Changes from v1:
> - none
> ---
>  .../devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml        | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

