Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B563C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 15:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ui6F3qwrqT8lb0KnLKSbmA8O5d2sThZYKWt1n7JkXyI=; b=VqH6Rjrofv7wmA
	h10kb1McM5VdtKEtfKANsrbCdFZPizt84CQ+8hN2GbnaOuEN5S/L9eYjSft3rXUQyU2NvS2IgZWJR
	HM72SnBxp8vvGkaUbSSK5dRirGYctRuUJWM4wQEQOooyzOyDdEgMlxDiK5q7MJZl7TGgiFR7ItwQY
	T2uhDQotb5xIJPMhRtFd/eRpvy62+FUHlxnLnMrW4I0O0ihWWGxrmfRLGFUH27vDgi4cx+qnrN1Bz
	Xd7+hDDPad+l4Kf8gWXUUvlb7h1v8P0EOLYrVUVsL9kGJ3gOK8R4I+T1mU3m6jFDoF3CPBqmNGLYP
	+hK02LmqmQeo9ilr/Cig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQA42-00AoVp-JN; Fri, 04 Mar 2022 15:41:54 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ9zf-00AlVy-41; Fri, 04 Mar 2022 15:37:25 +0000
Received: by mail-oi1-f180.google.com with SMTP id z8so4815384oix.3;
 Fri, 04 Mar 2022 07:37:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PACe0xmx6r81EAuaFyvZQyZNTfONIujSTfg4d0qd68c=;
 b=qp1QXfSWp0hF3GZzvW32grp/8RYb5nqRnWCrDbjvMlS1AIZhZqJYxJNB6XqbR9dA/z
 l+qk5goZbG2jyoAxHUyA3YfWoGM5FXkI0E5m/EGIzJEA1gamJbSYoHkV1ROismvA8JOk
 NBjVUcvP2g7FRIpy/wE1/HT/LTT7kC0iud08PQL+DE9W4YW5gmDl10gFLNMAqmpaccHX
 bciz/IGvcIHjJ5Y9MQebflronD3ZGpz8nZObhkx/T+wh43qAxuw0yRHonwF2hDUAKW+1
 u4CZz6kvXN0vjbDr2i3BabmEdVXn2jiBR88oSJwoq1R5yswwe48F1spWVZ3S241etaQ8
 Pneg==
X-Gm-Message-State: AOAM5307ZEGSNE64db8edGKGMiXlLG/MmT8DORq5VOK0C1R3qNp2ar6s
 9IOwjTpRMm707iWx/RZWgA==
X-Google-Smtp-Source: ABdhPJyof2S988VwMuNZcB9U5XecU80emaNMSFoZxgT+mxIr6cGyJM+vro5tIuRKk2C7lcM5e49grw==
X-Received: by 2002:a05:6808:1301:b0:2d5:4226:87e4 with SMTP id
 y1-20020a056808130100b002d5422687e4mr9716207oiv.136.1646408241690; 
 Fri, 04 Mar 2022 07:37:21 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 m26-20020a05680806da00b002d797266870sm2690848oih.9.2022.03.04.07.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 07:37:21 -0800 (PST)
Received: (nullmailer pid 3983773 invoked by uid 1000);
 Fri, 04 Mar 2022 15:37:19 -0000
Date: Fri, 4 Mar 2022 09:37:19 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 chunkuang.hu@kernel.org, jitao.shi@mediatek.com, matthias.bgg@gmail.com,
 mcoquelin.stm32@gmail.com, linux-mediatek@lists.infradead.org,
 krzysztof.kozlowski@canonical.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com, ck.hu@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, airlied@linux.ie, daniel@ffwll.ch,
 p.zabel@pengutronix.de, devicetree@vger.kernel.org, jason-jh.lin@mediatek.com
Subject: Re: [PATCH 1/3] dt-bindings: display: mediatek,mutex: Fix
 mediatek,gce-events type
Message-ID: <YiIyL+Vd1zWiDKbm@robh.at.kernel.org>
References: <20220304095458.12409-1-angelogioacchino.delregno@collabora.com>
 <20220304095458.12409-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220304095458.12409-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_073723_214701_70A28160 
X-CRM114-Status: GOOD (  10.82  )
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

On Fri, 04 Mar 2022 10:54:56 +0100, AngeloGioacchino Del Regno wrote:
> The mediatek,gce-events property needs as value an array of uint32
> corresponding to the CMDQ events to listen to, and not any phandle.
> 
> Fixes: 4ed545e7d100 ("dt-bindings: display: mediatek: disp: split each block to individual yaml")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,mutex.yaml    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
