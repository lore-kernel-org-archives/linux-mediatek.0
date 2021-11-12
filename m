Return-Path: <SRS0=l5E7=P7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C3CC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 20:11:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B69660F4B
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 20:11:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B69660F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KsjOkuFsFks3DWCMtX6g/uXsMUFPXlnV05uImBk/fes=; b=QcEeSdp3pwb5KS
	Y1GUSOprTcOlOlcTcZlSxAkoXWQikrzPzkisISqjZ83X86KVby4+zH7UPK85hjM9J9Ca2hZ1+c2cr
	GdyHLX5tx7SP2vR7Mqw2r5ztLJwrAUNI+6gzwMdBmfeSsmvKTqpe9DLasUg/rN+MNvxnV7MJwtOn/
	JrAnqL79P7TTaElwwpvfLl2L3TxtoCq3HYD+nstnXkej4I98fXyYJOJe/UCoQRndkwclk49+TdymN
	9C2T9e2Z2Q0ngLGmtCAzFTDxuSBOk+NN/f7j+llcpBnLRp+x14KZ2Ln9/5pn+RLhmhw2Vs/S3nS9y
	Kgige1G9l4rjF/lBBOCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlcsz-00BWKp-1x; Fri, 12 Nov 2021 20:10:57 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlcsm-00BWJT-OI; Fri, 12 Nov 2021 20:10:45 +0000
Received: by mail-oi1-f177.google.com with SMTP id bf8so19936106oib.6;
 Fri, 12 Nov 2021 12:10:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9WhJ/EjNNePoaOZvGJkmcFbg7yvTKkxsOk56AmN7Y+s=;
 b=ZeCI/8QA1mS4iu/Ai5Ox8hoSb5G+sJGNfLCFykfonujidjPoy78LM2hP+s9qTHxOOd
 XbgpQ7Fy8DXZO28Th2lyS9JnWGiTR6Vn09NvtiJ/twmacjMHSau02azAfk+h4MqOEVU0
 XG5iVcWsq97+3MCBhdK9cWgyIFKOKqf8TEqFNF56KPComwsfVYVy4bOicmRiPwuv0YK5
 ehbcTW07hhoaXgqJ7r/zhkKlmgLRyBQAPIjw3/jlW75A4VvbdLD5Z7+5MFwBMI8S3Gnt
 6RHhUgRHmmF3AKk53VMu04V7cLgjoZJRoAybQDkeyYnLD95DysYCLAISzvAaApiSup3q
 +d5Q==
X-Gm-Message-State: AOAM533xo3UdPJQFeHkp6OGs3d9AraqIdO46umAMppLLxsUqk/poPA+/
 /r0y77UEyIjGP5Fn1DiSdA==
X-Google-Smtp-Source: ABdhPJz5m+fIBjpw5F5peYuJ09KQImnLYi9vaCrFoMWMk0nUKJK3nt3vBV8Ay7r+mVs5n1Db2c5vBQ==
X-Received: by 2002:a05:6808:120e:: with SMTP id
 a14mr28430803oil.122.1636747843746; 
 Fri, 12 Nov 2021 12:10:43 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id t5sm1221415ool.10.2021.11.12.12.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 12:10:43 -0800 (PST)
Received: (nullmailer pid 3287649 invoked by uid 1000);
 Fri, 12 Nov 2021 20:10:42 -0000
Date: Fri, 12 Nov 2021 14:10:42 -0600
From: Rob Herring <robh@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: matthias.bgg@gmail.com, alsa-devel@alsa-project.org, tiwai@suse.com,
 yc.hung@mediatek.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 daniel.baluta@nxp.com, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 broonie@kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: mediatek: mt8195: add model property
Message-ID: <YY7KQi6KN4KzVvh1@robh.at.kernel.org>
References: <20211103100040.11933-1-trevor.wu@mediatek.com>
 <20211103100040.11933-3-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211103100040.11933-3-trevor.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_121044_808694_FA90BEE6 
X-CRM114-Status: GOOD (  10.16  )
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

On Wed, 03 Nov 2021 18:00:38 +0800, Trevor Wu wrote:
> This patch adds the description of model property used to specify card
> name from dts.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml           | 4 ++++
>  .../bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml           | 4 ++++
>  2 files changed, 8 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
