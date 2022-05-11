Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6873EC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 14:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7bsbaAyZZJwO3YmjdwfCfPFng9pLdkTFgSiuqneIiFM=; b=xmv7zzR3rBHmJw
	H8to8+21hBEpCP3a6vz2r/Wc2pyTbUh9QHKlzjEFy0s/r/jWeScT3BSIurCMHxYKrZJmb9DJ2mXsr
	XnulBPmoPnOPH7m8dl+pG2AnyrLym2j8zVg06MBNZrtvlE0yXzTLffLopISkPtIyzfCPjYt3pZ1lB
	CiItbgQAxc1IwmQ5Sv2I9lpxwnBKuxaKmzoshEAEAUWmjTevhnq2w5Kgca65Ay0EUsxmGxfP/QGTk
	p46bz68F/GMKqyO2b0dKYzihd205+faHjd2iUxWZT+tOhSkIgM28McYFbKeHn8rz/0zABVGszIaGt
	pe4TFFDUSynmL+cqhA6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nonMs-007DLo-Bi; Wed, 11 May 2022 14:31:10 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nonMf-007DHe-Vy; Wed, 11 May 2022 14:30:59 +0000
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-ed9a75c453so2983523fac.11; 
 Wed, 11 May 2022 07:30:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Mp6dTbokvQGCqhdm89KjWBFi8stC9bHFTBWdjBNBqBw=;
 b=uv67iTb7M67/N8vUknlAoFczzVgtsqNe1tB5OWz7+QUcBzBfyIKKH3+IIqpVxvFFEd
 yP7RiGxznludDFFDBwWpjPCveUosYsBUZMIgpXJyPvJKiKZJbQZScyVmfe8fXHf6TDwF
 QVhC9gqYdaiijRnnC2J4h45B/PIxuMNU5FNL9vb/49ZGN65s+Acw7jVdxMumDTctr3kI
 Y9Xb8RuBLD89tteceZCh7LOvmp8+mGxd6Tfhkut5ktN/hq5cpiAgPTe6MrpNNOqAZPd9
 3GRsi/CSxSb6/Ge2Su+dK3n2C90ZiDI7sjJMIl0p1cCObsG98bltDBdL5ob/OL6RQkGW
 mdgQ==
X-Gm-Message-State: AOAM532mIPR/80v7pKn0H6ATz4E+skIINMP3/HqgYZ3oqYHXzT5YWRyr
 T3RcQOq6T0xPJeMAwxfTkQ==
X-Google-Smtp-Source: ABdhPJzrzFc0fZ7+LrYKUTYDibPYbzEg//RObkHsFf1tLCR7BDw2r72XuTFEFO0zWdV4Qjlt6iDktg==
X-Received: by 2002:a05:6870:2e06:b0:ee:e90:7e65 with SMTP id
 oi6-20020a0568702e0600b000ee0e907e65mr2780364oab.49.1652279456231; 
 Wed, 11 May 2022 07:30:56 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 22-20020aca2116000000b00325cda1ff8esm803219oiz.13.2022.05.11.07.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 07:30:55 -0700 (PDT)
Received: (nullmailer pid 263258 invoked by uid 1000);
 Wed, 11 May 2022 14:30:54 -0000
Date: Wed, 11 May 2022 09:30:54 -0500
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, chunkuang.hu@kernel.org,
 xinlei.lee@mediatek.com, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 airlied@linux.ie, matthias.bgg@gmail.com, jitao.shi@mediatek.com,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v6 1/4] dt-bindings: display: mediatek: dsi: Convert
 dsi_dtbinding to .yaml
Message-ID: <20220511143054.GA263204-robh@kernel.org>
References: <20220504091923.2219-1-rex-bc.chen@mediatek.com>
 <20220504091923.2219-2-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220504091923.2219-2-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_073058_063857_8E63CB94 
X-CRM114-Status: UNSURE (   9.03  )
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

On Wed, 04 May 2022 17:19:20 +0800, Rex-BC Chen wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Convert mediatek,dsi.txt to mediatek,dsi.yaml format
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  .../display/mediatek/mediatek,dsi.txt         |  62 ----------
>  .../display/mediatek/mediatek,dsi.yaml        | 115 ++++++++++++++++++
>  2 files changed, 115 insertions(+), 62 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
