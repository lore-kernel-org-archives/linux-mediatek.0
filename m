Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16B3C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 01:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fydIsMYn3BewSKh94s3xFmCTrmlCzd+B5ulnPbaabJU=; b=dIAEeV0KXihapBCvQrhKuJgsIt
	mthm7lXYUxrNe+dEx0ahsKspzv0TZTQNw/efB9ucDARhwJr+1LSK6e17Z8auUALYqOdJa6C0QkdAr
	CyQ3Vz1NhJy7mEL65p63L4ZZ/FIQ6ztvP6zALfC3tRfts+COjrgYpI9x2QXCKPo/NV10Atnl3ZYZ3
	izyTu1APsEGHG0lkzdsfWi6iL/lyYY/guF68Qe+rE+FKLZothLhpa8rja3hfddKnOBsz+uHbcsppA
	Xal0TqU6lcz7D6NSxa5o4lhfG2L4QBNdo/hM5yZgKrWy7gilWUlH9t9PTbQXuFgnBtZXuRvAW0+PR
	Ah3oK1zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olhH1-004JO5-RE; Fri, 21 Oct 2022 01:56:35 +0000
Received: from mail-oa1-f50.google.com ([209.85.160.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olhGz-004JL5-RV; Fri, 21 Oct 2022 01:56:35 +0000
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-131dda37dddso1917264fac.0;
        Thu, 20 Oct 2022 18:56:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fydIsMYn3BewSKh94s3xFmCTrmlCzd+B5ulnPbaabJU=;
        b=biCRyBCgaTqI0GlUufqroAFQw+H9/KKIA2vCxUwAfErkgXULyryuNHpLxS7MP8ER4y
         /QSOF9mBo9VozwNH3x13vD5unUU82p394ZmxDXLW2NUYu3K/Y6Rv9vC624mjb1m7r+CI
         JWIizApTWF6MljzcNn5wSzRqAoWnPAg4eq555lakju4DdGKrI3u4agS+xkE95txwW9c5
         OHS4VdXJmpN8TES7whIYI/PEyjP+ThchKrxHqLiO7S8TWLGgRNgTkOgOMHHbs8QxcjIL
         49T2stByw6wEuumPvCvXBzZe4LAwJ2hY6j2KREY6lKl9eDjZvca6ybpO7/QR43dmEh+n
         pmhQ==
X-Gm-Message-State: ACrzQf11KwKbVGbbCUhFD//8wQVEPE47hs4H7McbUCbzx4mZhTX7JsXc
	LI7hjfBNBqTgrIjSl92ySA==
X-Google-Smtp-Source: AMsMyM4gP8ZuOjCQJhQJIrtqcG7n85msXVGfLpUQXLeDaFhozhy80dSFQfWJC/tI+27fIyTKFwGd9g==
X-Received: by 2002:a05:6871:154:b0:136:5e72:d59b with SMTP id z20-20020a056871015400b001365e72d59bmr10024696oab.87.1666317390400;
        Thu, 20 Oct 2022 18:56:30 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w24-20020a4a9d18000000b0047f94375092sm8232493ooj.40.2022.10.20.18.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 18:56:29 -0700 (PDT)
Received: (nullmailer pid 2157019 invoked by uid 1000);
	Fri, 21 Oct 2022 01:56:31 -0000
Date: Thu, 20 Oct 2022 20:56:31 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-mediatek@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, linux-kernel@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] dt-bindings: phy: mediatek: tphy: add compatible for
 tphy-v4
Message-ID: <166631739023.2156965.8672610831833263050.robh@kernel.org>
References: <df51b63add2830d91b527db64fba6ffdb7765f5d.1666193782.git.daniel@makrotopia.org>
 <07c5d962515c4f675f076bb91d69eaf651b187c6.1666193782.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07c5d962515c4f675f076bb91d69eaf651b187c6.1666193782.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_185633_944492_C98CF5E5 
X-CRM114-Status: GOOD (  11.29  )
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

On Wed, 19 Oct 2022 16:38:14 +0100, Daniel Golle wrote:
> V4 can be found in MT7986 and MT7981 SoCs, it supports PCIe with two
> lanes.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

