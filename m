Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAE3C10F05
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 14:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bsCcuGLo2J2I6ix+dXxn7SDWpUwAIlNPbaC4IivWIA8=; b=hpq9KutHIP81ZvlHeh9WJwsenA
	gnEm3QwKOgVOEEXEiROr6lbPMBRUczRKExXSewsVzkc/nxhKCwKIfKpku7W7s1cL870mUmXBIMDcp
	vivaxhxUlqCCb+eUHDm/xcVAkNu3Fxzm1OYc5+bwyXeKAo2DPyhKY1kKQ7tdagd78uKod/eiDmI8N
	q46iKaw5AxuN+nB9jBEfTolHp/bwOfCaOi7xJJK8tyWYnhiFb12XumOx8BnLucPhs4arFCT15hDEK
	uNlMtwY1XBfZ9kFneUjybfgS7szNhkaIf601iLdMvlotWpciGBFrC8yc3+Bv5dT4lgE6LUNcYEhcK
	OVKxQOnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBFBx-00Czz7-1k;
	Thu, 07 Dec 2023 14:17:29 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBFBu-00Czx0-1d
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Dec 2023 14:17:28 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5d3758fdd2eso7955377b3.0
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Dec 2023 06:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701958642; x=1702563442; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bsCcuGLo2J2I6ix+dXxn7SDWpUwAIlNPbaC4IivWIA8=;
        b=yjbrBzbkVG5ATRPdCJ74zrr4lt0ljUg1/ZKGl56a7ivQAfXdrkr5umSxPv02MDniPI
         LZOtasdJR4EveM2txkYqc9t+Og0EulFrfw9rlw7fOC/0HpkhtR2Ix78P5n5GuShHfFMT
         md8xVaN1AnrP9CQkQ6sA1O3BaYDSi6sFF61BenDQ/bl9TQ4UhvH4fcnzHLJMrR94eDzV
         zs/bcBu+XKt1I0Gg586pjOQgj4PKWwRJt/O6qhTQQl6yfFHYtSt3KoSVzxSGTRxv4HVJ
         zXaA8t38tss/H7z0NHW0mQL+LBRKMaQzlBhHIc1igEHt27BhNdTSE2il445Ap68taInl
         sh9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701958642; x=1702563442;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bsCcuGLo2J2I6ix+dXxn7SDWpUwAIlNPbaC4IivWIA8=;
        b=PuF3kqTihUAQPr8/IJ9VEtzfyUs1xir5xWWSMf2/mfN8EGOJSiXQL7o9IuZef2+Pu+
         eYYyaatsuxt3BjOfj8ZG/eUe6ulYTDzUrkyMXiNv28IHmyGkWTBoUPkNQd2jNINzeC5o
         hQVsDVc+Ni8DkNUa3q+13K0OuXbRlASSO56Cpyn+InbAgeMJ8dRuiwMjJh9NcieR4IP9
         L7qfPIIKqt7ZqRiEEV8x5dhR02laGCNA20sXHcZwN5xZqF/0fAqjW1IzD/x/DxGXwts5
         1KcxumIlSIO8sWpW1FFaok51oG2YTQuRIub6wcD605xCjUU2Zh8kUOUhXF1qG18r73H1
         DTkA==
X-Gm-Message-State: AOJu0Yx3Fno6VtIqfLoliHKPOM5hpPDbrOlS5Brl/jwU/J8rL2GivFmy
	X/r/CV+d6foWqfrxUBM2HMA+sRpPAcuwsi4FiOsu/A==
X-Google-Smtp-Source: AGHT+IEBRQ4AL/XFd1LTfykGK68U5ukkx7PsrewbOYUyuvwi8DZONr9x4L/XICW9RDrsS4gnNobATSOqQIlk4jIDe8A=
X-Received: by 2002:a05:690c:c0d:b0:59d:d85e:795d with SMTP id
 cl13-20020a05690c0c0d00b0059dd85e795dmr2665100ywb.51.1701958641855; Thu, 07
 Dec 2023 06:17:21 -0800 (PST)
MIME-Version: 1.0
References: <20231207063535.29546-1-axe.yang@mediatek.com>
In-Reply-To: <20231207063535.29546-1-axe.yang@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 7 Dec 2023 15:16:46 +0100
Message-ID: <CAPDyKFoFexzhQ59O-v1X_QjgztYZbHfQtKqGKsHsnmU6Bf75YQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] mmc: mediatek: add support for 64-steps tuning
To: Axe Yang <axe.yang@mediatek.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_061726_544194_711A6E83 
X-CRM114-Status: GOOD (  12.23  )
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

On Thu, 7 Dec 2023 at 07:35, Axe Yang <axe.yang@mediatek.com> wrote:
>
> Change in v4:
> - for SD/SDIO, tune 64 steps by default
> - reduce some breaks to improve code readability
>
> Change in v3:
> - use BIT_ULL() instead of BIT() to avoid potential left shift operations
>   that could cause exceed boundary problem on 32-bit platforms
>
> Change in v2:
> - move the change made to document to the front
> - change mediatek,tune-step dts property type to enum for better scalability
>
> Axe Yang (2):
>   dt-bindings: mmc: mtk-sd: add tuning steps related property
>   mmc: mediatek: extend number of tuning steps
>
>  .../devicetree/bindings/mmc/mtk-sd.yaml       |   9 +
>  drivers/mmc/host/mtk-sd.c                     | 158 ++++++++++++------
>  2 files changed, 119 insertions(+), 48 deletions(-)
>

Applied for next, thanks!

Kind regards
Uffe

