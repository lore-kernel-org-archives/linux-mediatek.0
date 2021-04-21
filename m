Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55682C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 17:00:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA18361454
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 17:00:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA18361454
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6USvVD5UnfQDPYJ8FkgYZHO825YqmaNAncjir/+wUkI=; b=Nvv3jMbdvMEXIZaWdMHI/xfnc
	HWl6adDYY+q2JXR4nO+czTr1RIYMk4BHS0qnbHbqdd969XZwQFasf+RkyKM4uf+AR1z4PiTx+cHvU
	24Q6p6opvNt0AZlF337Van7EnO14lvOG0rwWNjXGRvdnLA/63VGhQWAFdqrKiFvJyRctIa1EimPaT
	TPGlTKUjch2ogw8z/mG6krk2X1+vFBLKAPldnQrZCgcqJuPOofJvBO4qrBWL5vbw8P5hrM1VYkwGR
	Jnv8rdsouh3mllblVaTw91mHOwKBsvmRn+5McaVSHSZ3gUCIFAFFLPygAzhS4qiH+Y6CUgTEFnIFI
	0jqPpOA9Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZGCp-00Enw6-5A; Wed, 21 Apr 2021 17:00:03 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZGCl-00EnvX-Uu; Wed, 21 Apr 2021 17:00:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=h+2uWSkW19YMSUIgrRyX+Zrerp6y6BIi//8JY71zHg0=; b=Gs0s8qvsUOL1Hc23bbXF6Bb36U
 I36iOGhvdtnz7/FDzx3hczZRQODwSg7gQo+SCX8qwFo9Fy6YDuDoigTj7ji4MapJjXlaeLeTTMkf8
 hZ3XNJ9RYA2J23/SGAgcW72/VlbID4mgZiAUhJkit6Pgo2R5szYQ90894cLECbNJtnEdVzQmZ+98R
 /jLbxQbKxwRuP1C20yWrkLs3mI4uMKq3jUBYy+je/2fuDtieF1NOa420tb7iKuTVrxcIUa1R65pfI
 lzQI87aUEiCbefe2/VdSKDSM0MwDEgDpZwDK9eJYQLWkfV+q/2C2aPTWAR6gCOdgJHTTIUxnQvEAB
 5F7c3/Aw==;
Received: from mail-ot1-f48.google.com ([209.85.210.48])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZGCg-00D2rd-Ly; Wed, 21 Apr 2021 16:59:58 +0000
Received: by mail-ot1-f48.google.com with SMTP id
 i16-20020a9d68d00000b0290286edfdfe9eso28921184oto.3; 
 Wed, 21 Apr 2021 09:59:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=h+2uWSkW19YMSUIgrRyX+Zrerp6y6BIi//8JY71zHg0=;
 b=N17bybw25JGFznU+8DpwIQgm6RTJSoyM6Wl2M9vmhkH6ulqkm/Eea2liD9EucqttBm
 QimXf38Tg2pFmo2UvqyXcpIesRlzGHbOmtZYjRGYWmTr2+ONqwxoRAPEebsr4aIaaFAv
 WYuZMTAhDaU8ToSDynZmw/B501DHzPh8Se+kQ4AS5sl/FFdM+1tJqe5g+hi9bNNRhgDz
 RUZmC82INwEPeHYUEFsnp0IcgORMHCc1qJ4g2lHCvwhXM8x6qWzs2shajl/TKXTkodB/
 9BgbexHm/HCwM3McSqhhtKtzt/hUiTZr1bSeAXQyden3sPE4C1TRsPdzmKZpKeGv2sma
 uzWw==
X-Gm-Message-State: AOAM530TdPhEGuhF1JiwCDuBk+WDy7DbuobjhB9ZDE69a7NeJ9Yj38KQ
 ZU1BB8c7t6MLgYGTp1N5HA==
X-Google-Smtp-Source: ABdhPJwWoz3BS4dg+l9N7pX1PZhZ/4wlq0ogtsxElhcG8h2QSloGBtatkURwBVfcHg/r68nPpaIvzw==
X-Received: by 2002:a9d:615b:: with SMTP id c27mr22752308otk.119.1619024393434; 
 Wed, 21 Apr 2021 09:59:53 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w23sm643762otl.60.2021.04.21.09.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 09:59:52 -0700 (PDT)
Received: (nullmailer pid 1292145 invoked by uid 1000);
 Wed, 21 Apr 2021 16:59:51 -0000
Date: Wed, 21 Apr 2021 11:59:51 -0500
From: Rob Herring <robh@kernel.org>
To: Nicolas Boichat <drinkcat@chromium.org>
Cc: devicetree@vger.kernel.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 boris.brezillon@collabora.com,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, hsinyi@chromium.org,
 hoegsberg@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 fshao@chromium.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v13 1/4] dt-bindings: gpu: mali-bifrost: Add Mediatek
 MT8183
Message-ID: <20210421165951.GA1292095@robh.at.kernel.org>
References: <20210421052855.1279713-1-drinkcat@chromium.org>
 <20210421132841.v13.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210421132841.v13.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_095954_743973_D295CC74 
X-CRM114-Status: GOOD (  13.72  )
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

On Wed, 21 Apr 2021 13:28:52 +0800, Nicolas Boichat wrote:
> Define a compatible string for the Mali Bifrost GPU found in
> Mediatek's MT8183 SoCs.
> 
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> ---
> 
> (no changes since v12)
> 
> Changes in v12:
>  - binding: Fix min/maxItems logic (Rob Herring)
> 
> Changes in v11:
>  - binding: power-domain-names not power-domainS-names
> 
> Changes in v10:
>  - Fix the binding to make sure sram-supply property can be provided.
> 
> Changes in v6:
>  - Rebased, actually tested with recent mesa driver.
> 
> Changes in v5:
>  - Rename "2d" power domain to "core2"
> 
> Changes in v4:
>  - Add power-domain-names description
>    (kept Alyssa's reviewed-by as the change is minor)
> 
>  .../bindings/gpu/arm,mali-bifrost.yaml        | 30 ++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
