Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0862DC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 19:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AkkQdaDNOYZMSLUtzMLUyqsxir9M4nKI8xzeqoUNUqg=; b=v67foi9f7uaV1VOv8J8YjvOE0K
	GI3vw77WKx8ovcpSt3Wx2dBwo+ZZDXH+25DrHxx1E6Sus5xpaB73rKe0BJzieERxbyMXPLwQgDK8Z
	VFz3IOoHoU7kpwlNILEi0kaTu0IQXr7sx/Z71biYQXXvnmbAeaVgeK7FpV31rVFPxEhl+eAdxgacI
	9ckx/nCNflIOFu7+hxrlWOb8/oAnxv/iwpoLuF1Vr1lC8NWXFgjBbd1AYeuxaKOVcAuW/xC2swbV/
	s3P8+Yciauy602qSE7iqmyHdOqoDmoye9N5PK86lbmF0+/LDj01tPXCppzRwVd5UisEWbNVnMu/uk
	TCn7P8UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeLmp-00BD8F-3M; Fri, 30 Sep 2022 19:35:03 +0000
Received: from mail-oa1-f52.google.com ([209.85.160.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeLmf-00BD4G-41; Fri, 30 Sep 2022 19:34:54 +0000
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-13221a3fea3so131858fac.5;
        Fri, 30 Sep 2022 12:34:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=AkkQdaDNOYZMSLUtzMLUyqsxir9M4nKI8xzeqoUNUqg=;
        b=HP4va2dGQ/YL5l1I1mCMu1hI+e28OfHrz/iSQcuNXBwSuG+l/UCbwoqC2wJbq56WTe
         EjENTGOPkoGFSN+o2S64l6s6/mkT7HbDHooGTjF27nxcNYXmPea9KAeCsxBPdflJ3rsq
         6M4QITJ809QgbvHUqNPElp3wSGjSNmLjCGrVc+Jo6EhXDSduqw4k9q0dGQzrzC3L+Z+7
         1SSshNnq9zQV8dzUkB6U4L4Bn3LlOk2qRKXzKqWLqWW+FUiFy6f5FtDvRxlz4eE6XmV2
         PT36f23lJntf2QyeNvYhRDFbG6olcn/bdJTQj6RQRiW+1kvNhBfD7GOBH5LeOV7h4GOg
         wdPQ==
X-Gm-Message-State: ACrzQf3+ryI0EO6GC7Sd29w6CbEh4De1HuDS92gMQIf1VVKUSWH301Qv
	H/4IqM8vi/hjsQ6Dafjq2jShdFtk5g==
X-Google-Smtp-Source: AMsMyM5Veku3oHrh2CrG3IifJOQGymTa3zsIQ8rtoCCekJEK7OtgxQ9USLdqDC3TTRMYEL41zH8kMA==
X-Received: by 2002:a05:6870:ecaa:b0:131:e816:b6a5 with SMTP id eo42-20020a056870ecaa00b00131e816b6a5mr3355975oab.229.1664566485639;
        Fri, 30 Sep 2022 12:34:45 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z9-20020a056870738900b000f5e89a9c60sm939654oam.3.2022.09.30.12.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 12:34:45 -0700 (PDT)
Received: (nullmailer pid 754872 invoked by uid 1000);
	Fri, 30 Sep 2022 19:34:44 -0000
Date: Fri, 30 Sep 2022 14:34:44 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: daniel.lezcano@linaro.org, tglx@linutronix.de, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: Re: [PATCH 2/2] dt-bindings: timer: mediatek: Convert to json-schema
Message-ID: <166456648367.754820.4078509083909702972.robh@kernel.org>
References: <20220929122901.614315-1-angelogioacchino.delregno@collabora.com>
 <20220929122901.614315-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220929122901.614315-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_123453_203289_E94A8ADD 
X-CRM114-Status: UNSURE (   9.47  )
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

On Thu, 29 Sep 2022 14:29:01 +0200, AngeloGioacchino Del Regno wrote:
> Convert the MediaTek SoC timer txt binding to json-schema.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/timer/mediatek,mtk-timer.txt     | 47 ----------
>  .../bindings/timer/mediatek,timer.yaml        | 86 +++++++++++++++++++
>  2 files changed, 86 insertions(+), 47 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
>  create mode 100644 Documentation/devicetree/bindings/timer/mediatek,timer.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

