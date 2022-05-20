Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5682C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 22:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YoFbsZYMZdOM+ifQeux+twJQ9oYOQqgeM9GVa81vrPk=; b=Ok5TEBiayu/Cle
	QpBquh8FJBBvPdDaHpwUbnBhW5s6pYAl30ckNx/dsPIPKY9v296xCRfQocRmaUkynTBaF5N2ERBdj
	lq/zDi/pIhl7PpKJZ7JN+T/ulQ9pFbzI7zcD+4alrZkBnxZr/c5UiPLVslNy4tDw1te5TbfDlSttn
	MbZp6wrino7ZnYltqd5767if6KWRqoZeEFrcVvMoU3fvdURwxz5B+3VlcVgdvn49t2SpMCi15km5s
	LXsGyz/qP3KVzGFckLAzqckW2Nv4Oo4c5Fl/NtwdInaov4nzTRV1YKcTLA+rrQ24/wPH2u4pxOGYW
	QSV3OqTBmILl9w7FfoTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsAv5-00EisO-7x; Fri, 20 May 2022 22:16:27 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsAut-00Eioy-KP; Fri, 20 May 2022 22:16:16 +0000
Received: by mail-oi1-f182.google.com with SMTP id t144so8230814oie.7;
 Fri, 20 May 2022 15:16:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HHfepm0kjI4CxV3pGVRvLmHwIoaKzm9+kLAL1NzKoEE=;
 b=TLwcAolOtdA7glcLSa2meTQnf8PO2ggcbb7Gahx37y5/i/CN0DYjHwZEWjugcsPCNO
 0//Pa1czUH8s5ALMtGG905vweuc+1J3k+4migDD+XqX/+Mv3ddWaGsfOgEEFX5JYn6X1
 e6jiCBq/80kG/4H/W0X27HSWseNWb10CmM22+qdyu2lktHvJT0itiHFqJExFhgQ/iOqP
 wJHJheziFEGylpYe9BHR1dINnqkhtDfTo11EPfsqR+HHK9il73FGOnfE0RP0FGTEenM/
 RvtO9RVm4N+DBIk9jrnWYgl6ucjeE/iazV6NZRhz6+7tYEkZtaMHkXV2lEod0a6aFjE0
 v6kA==
X-Gm-Message-State: AOAM530G5QWrRaIiGBAEZC2rzhwvrpJFlfgTrK+8x7fyfvSzaLEzTf+1
 VeCCIdAzoxMteRtXLHqeQg==
X-Google-Smtp-Source: ABdhPJzF+pUwG91SErE4WYmgGDsLR0PlckfITBqumsWo6qGQownaSro/mN/e5gro2pKA1LCEL1AeAA==
X-Received: by 2002:a05:6808:1496:b0:326:e2de:63ec with SMTP id
 e22-20020a056808149600b00326e2de63ecmr6737618oiw.271.1653084974326; 
 Fri, 20 May 2022 15:16:14 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 s22-20020a056870e6d600b000e686d13895sm1385387oak.47.2022.05.20.15.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 15:16:13 -0700 (PDT)
Received: (nullmailer pid 348614 invoked by uid 1000);
 Fri, 20 May 2022 22:16:12 -0000
Date: Fri, 20 May 2022 17:16:12 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, sboyd@kernel.org,
 chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com, wenst@chromium.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: mtk-clock: Remove unnecessary
 'items' and fix formatting
Message-ID: <20220520221612.GA346673-robh@kernel.org>
References: <20220518093631.25491-1-angelogioacchino.delregno@collabora.com>
 <20220518093631.25491-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220518093631.25491-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_151615_709425_4D3428F8 
X-CRM114-Status: GOOD (  10.23  )
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

On Wed, May 18, 2022 at 11:36:30AM +0200, AngeloGioacchino Del Regno wrote:
> There's no need for 'items' when there's only one item; while at it,
> also fix formatting by adding a blank line before specifying 'reg'.
> 
> Signed-off-by: AngeloGioacchino	Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../arm/mediatek/mediatek,mt8186-clock.yaml   | 28 ++++-----
>  .../arm/mediatek/mediatek,mt8192-clock.yaml   | 45 +++++++-------
>  .../arm/mediatek/mediatek,mt8195-clock.yaml   | 58 +++++++++----------
>  3 files changed, 65 insertions(+), 66 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
