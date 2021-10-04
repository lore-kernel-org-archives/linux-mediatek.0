Return-Path: <SRS0=jwT2=OY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DF75C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Oct 2021 16:55:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAE2A613CF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Oct 2021 16:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CAE2A613CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LuciqPasyJBuFoXckBjxUleCfMbHWL0fmHLq7M9R56o=; b=f1dYOQcEIMcprv
	Zf/R3dF4LKG6mYZvS/KxFbLFaVXe66+N/DVt3uXJZQaphabXDRHVRlF58jkbtDcyHwdnYrMo2VerV
	O2eJV71LWpTJUbMTnZUajlSIuw20hVZkDD3rY5MiAdjYaYPTDcODtC3GSvsvr0x/zyrgo5UnAY6K9
	lOICAQKiGtlmN1IXmqRvspftvv3N74iU3ij404XW5JUHIcFU0w1OfU32kPSjc7rhM+Glyq84yTZbx
	Bx5UN+PnlGHtIoqRLulPURmeHN2EAxp3c+8MsG5EiTDt5WY6Myr25CDX4KyKvSNzN3kVTLSPpkQef
	NAfmOX/9lyU39uEkOoEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXREw-007CvA-L9; Mon, 04 Oct 2021 16:54:58 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXREu-007Cu2-3v; Mon, 04 Oct 2021 16:54:57 +0000
Received: by mail-ot1-f42.google.com with SMTP id
 c26-20020a056830349a00b0054d96d25c1eso22393258otu.9; 
 Mon, 04 Oct 2021 09:54:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bX1AWjTVQ99QhdMBAvTgxvLZsO8dKqZ24tnr3dEHNw8=;
 b=UykcpDhI50mq07rGmx/q5ETVyH2A0Ji35SV81IzLLYQf1KUCbGX0Ef4HEMw8CqlXDN
 os83yomwbYB+zylxzzvvvnkAOtuwVfkRlJhQIBA6n3FxL0yvUpjsk2jVqvXAOH8W6GII
 CcSZaIkLCSoW1sxNGu24kJSnzpzf15VpuS4hfBZ4MncpIVSW+oUCfc0nCA/jBvGqdhBn
 Zo1xGFNZe9aIUxnR4GtzcyZ3KFzxbMENmdCRgLxMXpeaHgKR0aa55h44G2y4OD9NOuPR
 vXATAlzFy0BMqc3eScT1UQUxsAI00RsXVdVCf4SQ5xtYyZwwxzvwyNQxet6tqBXZTISH
 JN8w==
X-Gm-Message-State: AOAM5302raMdyo8nL782+6EmlHjQFlSg9uCrQ88i9HNa5zW1IGaY3ccX
 c9woGKo3AduOgq3p3AqeVymqT36TMQ==
X-Google-Smtp-Source: ABdhPJwRXaKWlO5doyFlIqDOX6eKpoHs6FSOnYo+lTc7QnEVeYigsMQ3rRlJ7Hq/fQ3+OH+d8D37Lw==
X-Received: by 2002:a05:6830:3486:: with SMTP id
 c6mr10175603otu.101.1633366065420; 
 Mon, 04 Oct 2021 09:47:45 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id g12sm2919168oof.6.2021.10.04.09.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 09:47:44 -0700 (PDT)
Received: (nullmailer pid 1453765 invoked by uid 1000);
 Mon, 04 Oct 2021 16:47:43 -0000
Date: Mon, 4 Oct 2021 11:47:43 -0500
From: Rob Herring <robh@kernel.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: drinkcat@chromium.org, matthias.bgg@gmail.com,
 Rob Herring <robh+dt@kernel.org>, chunkuang.hu@kernel.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>, kernel@collabora.com, eizan@chromium.org,
 hsinyi@chromium.org, jitao.shi@mediatek.com
Subject: Re: [PATCH v4 2/7] dt-bindings: mediatek: Add #reset-cells to mmsys
 system controller
Message-ID: <YVswLzTQhuj7zI4Z@robh.at.kernel.org>
References: <20210930083150.3317003-1-enric.balletbo@collabora.com>
 <20210930103105.v4.2.I3f7f1c9a8e46be07d1757ddf4e0097535f3a7d41@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210930103105.v4.2.I3f7f1c9a8e46be07d1757ddf4e0097535f3a7d41@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_095456_183606_BF9EFA97 
X-CRM114-Status: GOOD (  13.58  )
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

On Thu, 30 Sep 2021 10:31:45 +0200, Enric Balletbo i Serra wrote:
> The mmsys system controller exposes a set of memory client resets and
> needs to specify the #reset-cells property in order to advertise the
> number of cells needed to describe each of the resets.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
> (no changes since v3)
> 
> Changes in v3:
> - Based on top of the patch that converts mmsys to schema
> 
>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml      | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
