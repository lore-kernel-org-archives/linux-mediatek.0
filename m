Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129EDC19F2B
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Aug 2022 22:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=opKDkyi7lKJltuG48YWCzI+exumamPnJWTRLbM7FknY=; b=luv2kGTX1yk+/4THtGgi2KQ7SD
	FzBv2PE3cxCqpv5OhNJx4HB4fSzAw8KhdZOJda0449ds6rljvyboijbCSs21EZQMgeJGmmrWllhpv
	/xI2MeK8LUok4M4b5A+/g3fakyr2e/GrtOIgv05L7rlUL1zmWtjHVH7VSYcOx9+NkvH/1BU1T1OQo
	fUGri62kSfAXMqsMuetSfTE3B24RkzrAwT5Pr7ivMK9grC4X5cBdRsTrDmL88wKQ1bcVd82EK95lW
	8Wy9cz1iHbbCxHTEAc8fCbW//J0d49k4nkHS0dmncJH7qbKNYJA6R1VYCkB6Tm30sIEwvV6hG/1wv
	dNeRBFTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJMyK-00AU4i-At; Wed, 03 Aug 2022 22:36:12 +0000
Received: from mail-il1-f171.google.com ([209.85.166.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJMy8-00ATrW-Eu; Wed, 03 Aug 2022 22:36:01 +0000
Received: by mail-il1-f171.google.com with SMTP id g14so4540174ile.11;
        Wed, 03 Aug 2022 15:35:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=opKDkyi7lKJltuG48YWCzI+exumamPnJWTRLbM7FknY=;
        b=tj1alLiHN2q5lC5/wnvwlCYTmIzSo5kx+7HYSXNINKLcNkCYJxRUKueKNmNTjfSTU8
         YWUMUzn/+bZMtY6Xfxh/JtO9Jj6TsDItxpUpS4cUSt7LU3DbQKGQyeLnhEuyTeOZr9Nx
         r4vxeWCchM3xna+Qp/8ArWAGadWyVQ0FAg6o7g1oa9siiVJZIF9yaKWE32rXnhEyVrog
         Sgh2xW2urcv5ZtsroUnqY5UELhxZ0keu+aE6wSliBfJspEUwTXIXXud9szAgfg8MbJB9
         yH8O4RrjC6D4DBFS2ybBkZ2jWPTg9TR/8tF7L2s31Jcix3LLQg7P3x3fnON9871L0KQA
         Nq4A==
X-Gm-Message-State: ACgBeo0wXm+xJuEMiENy/bhENcgh/D/3Q4udTpHrw8jmw+HPFYhQ1srR
	+PzVRP27ITd3lwY0L4QqJw==
X-Google-Smtp-Source: AA6agR6J7aD3Fr1axinuEJMEMgZ//1CcnRFYYmCYHmkoxDAcLOTepjMYtaMIn36eWwHarpA6qTaTDw==
X-Received: by 2002:a92:d492:0:b0:2de:2d95:a5fd with SMTP id p18-20020a92d492000000b002de2d95a5fdmr11094666ilg.111.1659566158310;
        Wed, 03 Aug 2022 15:35:58 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id b1-20020a926701000000b002df38c1e8d8sm685134ilc.62.2022.08.03.15.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Aug 2022 15:35:57 -0700 (PDT)
Received: (nullmailer pid 2743980 invoked by uid 1000);
	Wed, 03 Aug 2022 22:35:56 -0000
Date: Wed, 3 Aug 2022 16:35:56 -0600
From: Rob Herring <robh@kernel.org>
To: Hui Liu <hui.liu@mediatek.com>
Cc: jianguo.zhang@mediatek.com, krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linus.walleij@linaro.org, robh+dt@kernel.org, linux-gpio@vger.kernel.org, matthias.bgg@gmail.com, zhiyong.tao@mediatek.com, sean.wang@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v5 1/2] dt-bindings: pinctrl: mediatek: add support for
 mt8188
Message-ID: <20220803223556.GA2743930-robh@kernel.org>
References: <20220801095215.10876-1-hui.liu@mediatek.com>
 <20220801095215.10876-2-hui.liu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220801095215.10876-2-hui.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220803_153600_550045_C387D4F4 
X-CRM114-Status: GOOD (  10.60  )
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

On Mon, 01 Aug 2022 17:52:14 +0800, Hui Liu wrote:
> From: "Hui.Liu" <hui.liu@mediatek.com>
> 
> Add the pinctrl header file on MediaTek mt8188.
> Add the new binding document for pinctrl on MediaTek mt8188.
> 
> Signed-off-by: Hui.Liu <hui.liu@mediatek.com>
> ---
>  .../pinctrl/mediatek,mt8188-pinctrl.yaml      |  226 +++
>  .../pinctrl/mediatek,mt8188-pinfunc.h         | 1280 +++++++++++++++++
>  2 files changed, 1506 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>

