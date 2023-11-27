Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6BAC4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Nov 2023 17:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gXEZGcv8bSxQjKfcCrALAvNXAs+CKpToCxY7DnKjWaE=; b=oqpRyEMNRaxhB3wgQjfjJ/+RJI
	4V+TGVhGuLcrFd7YCZlA3wDtHvS/7kU+AfbovLzRMhzxvrGOhPaACs8i4j59zKzRMoSmyYovhoGIL
	dfQrH+b4r3Ilou3l/JSiEinDTvzeLJ+Y5rgu9/SWG5uF4YzdsPMmH/C+SsiaPT4n1l0Zr15PxhVWV
	N/ZPCI408l9KohP9nJI2wfXei6gpSvAy1XDDqNbCJKm2JjJrD4S5raY9IflLaKsggZBB1JN2q+1Mh
	QMbvx45ei7brolIm9AXI9vxKyX1PzeonEetqbFjM9u0j1cosHnJ+OOlSeE2tQGGCSPwSZA/DrJ8OS
	7U7V8bcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7fnJ-003AZn-2i;
	Mon, 27 Nov 2023 17:53:17 +0000
Received: from mail-oo1-f51.google.com ([209.85.161.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7fnG-003AYU-1j;
	Mon, 27 Nov 2023 17:53:15 +0000
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-58cf894544cso2400449eaf.3;
        Mon, 27 Nov 2023 09:53:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701107592; x=1701712392;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXEZGcv8bSxQjKfcCrALAvNXAs+CKpToCxY7DnKjWaE=;
        b=Lm+s32j6rJNT3X82/m8dNeTzuamveDP9SovQJvHX/SyTYMANU30bheOe8uaZokQ+MM
         395F+Ess+lsabOISvsUMFzd0DMRig4LGH2fhaVQdYT293PE8AkVoXSgGKLx8i/vVSBgj
         WTylmjHlOO4MLVO5Od2m6UlbyC+knduSl71rb2Y98sIgcVlBZ//dqNKc28i0UMbiMaU1
         Y7FwTrYnk58y2aiBM5/pG/pT7DA2TNLt328uURj97bpikj655HQTHsT+XViUOfoghUOE
         BGSkja4fDiSUX/XZ4i39yFXsIMzLe3WptRvyw6blnARPi1kwLY3an67YWKQFxegsFPri
         x4Eg==
X-Gm-Message-State: AOJu0YxFmKFNLqhcizi5lb9NZolS7bWqygXYg9KHxEkauvgVT5eno8Ga
	t5Ga+u1RafXbbJMZGV5pbA==
X-Google-Smtp-Source: AGHT+IHqCcFjtcM7hpVFdO1GU5tjNNQyP+pOeAzsBXWkues29+89h8GwQNH+gICSaOfRfB6G2/lWGA==
X-Received: by 2002:a05:6820:514:b0:58d:9d79:abc with SMTP id m20-20020a056820051400b0058d9d790abcmr2490913ooj.1.1701107592638;
        Mon, 27 Nov 2023 09:53:12 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id i14-20020a4aab0e000000b0057327cecdd8sm1545477oon.10.2023.11.27.09.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 09:53:11 -0800 (PST)
Received: (nullmailer pid 1865094 invoked by uid 1000);
	Mon, 27 Nov 2023 17:53:10 -0000
Date: Mon, 27 Nov 2023 11:53:10 -0600
From: Rob Herring <robh@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org, Jitao Shi <jitao.shi@mediatek.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: mediatek: dsi: remove Xinlei's mail
Message-ID: <170110758909.1864817.4462999891137574457.robh@kernel.org>
References: <20231123134927.2034024-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231123134927.2034024-1-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_095314_629664_6A63819B 
X-CRM114-Status: GOOD (  11.40  )
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


On Thu, 23 Nov 2023 14:49:27 +0100, Michael Walle wrote:
> Xinlei Lee's mail is bouncing:
> 
> <xinlei.lee@mediatek.com>: host mailgw02.mediatek.com[216.200.240.185] said:
>     550 Relaying mail to xinlei.lee@mediatek.com is not allowed (in reply to
>     RCPT TO command)
> 
> Remove it.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dsi.yaml       | 1 -
>  1 file changed, 1 deletion(-)
> 

Applied, thanks!


