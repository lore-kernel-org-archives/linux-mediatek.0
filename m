Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93500C05027
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 09:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kXhHlY1h7nocfeF1bOOwlqa9GLmp058pSwMc5Nw8eCs=; b=A0PR/wkSZKbFaWpIY+EpTQhinx
	bUIUIl0RRbg/Xl/Ls8aZO/BZdllAapbw5E3Pkjn5LFB+fZ7bXMwkNA+Cm4q7I0w7iN7OaIZIDG6lv
	MNQ5/UcHDcjP0sNDXX6WQHEE4xE8zc7XDoPpJdAoJSI3NwLywGKYN2R16B5CFBa3N5gl/iFrfvhok
	Hq3utw9hBz4+95f0CEP3B1ZQbTMu5oFEwXcCt61rIrZwM+EHe/poz9N5d3YTPxvSrPnTOXzTwDxmh
	xgNuVDN8KFj286AlWgiRYOnfjarZjnNgKUEuTkzxhiRHdi/sI4T1+d/d+ytjVPGH7jlfdXc+dy0Qt
	Eksmk4Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ3Un-000tuf-J1; Thu, 09 Feb 2023 09:45:37 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ3Uk-000tsU-LD
	for linux-mediatek@lists.infradead.org; Thu, 09 Feb 2023 09:45:36 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id p10so1509742vsu.5
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Feb 2023 01:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kXhHlY1h7nocfeF1bOOwlqa9GLmp058pSwMc5Nw8eCs=;
        b=AVQtBu6a+GAA0YuBWAkZuoZ1RiMhYbu91H+uxx6jbo4OyTg1oInL7ybjONKCA9fYgV
         tXH2621Wu1HMYvV00UxmOK9/0ti5yO/2O700FMrMeyTsHiUghbsmknayRo6UceHPmf2F
         MS4KjYawZ5imA3BDzv/iFFibjSN2z+XaxLaXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kXhHlY1h7nocfeF1bOOwlqa9GLmp058pSwMc5Nw8eCs=;
        b=IVdAvr8eCpOS1oyfxT0YJQG5jqXBoT2cw3MqvQ3wqjoV6FP/eeczQ6lc/s+qSYcxM/
         FSPrXYDeO6V7ZsOC+17TtQTsP+Uw6yf19bDB6FXtqvqc2nhLJqO1UnC3rIBsY3d/YYhF
         Mv6qXhT0V0q4VM9pW9mxZrdeH5hnMKL5qd1VzkrhwGQkj/eQMwNVH6iccJ+2nT2mFuiB
         7rQOAKjsR4+oQ2cSpYYVxNpZJgs1LpGzmRNec2BFAdxRuVfl0Pnyf3QIHIEOYZ9Qex1t
         dXCHu4CoqU5bcw2SnslaonMRqtFVmiqkHPg8oQGvuXexMnB51uZTTir+tN35GjlEyGGq
         hT9Q==
X-Gm-Message-State: AO0yUKVhhcmgWw+utFH7h73atIh0rptEfiLwLq2TGl2+vv4r8qGmOiiR
	+USFceUlGc3a7okMgbFdWHX5xGk6g47htMqV9x5y5Q==
X-Google-Smtp-Source: AK7set9hqvzMQiDk15uKKV/k2E6K/8sc6RF0LbaAJ63u86p8XV6MRsIUixqUkVvQiR03JwtLvsvHt9Z3UruyeBFDCFU=
X-Received: by 2002:a67:1904:0:b0:3e8:d5a8:3fbe with SMTP id
 4-20020a671904000000b003e8d5a83fbemr2433227vsz.9.1675935933578; Thu, 09 Feb
 2023 01:45:33 -0800 (PST)
MIME-Version: 1.0
References: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
 <20230208103709.116896-6-angelogioacchino.delregno@collabora.com>
 <CAGXv+5FZqrGzzG8FrmLVzMd7=a23ZJPYGSy5yhYWgH+BFHNmxw@mail.gmail.com> <7784f5a2-3cfc-9999-0ad6-cb9cfc1f2822@collabora.com>
In-Reply-To: <7784f5a2-3cfc-9999-0ad6-cb9cfc1f2822@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Feb 2023 17:45:22 +0800
Message-ID: <CAGXv+5EhDGuzoBA9ZV2=3PVZ209eFq+wOOcTGVvG+gmOnf5txQ@mail.gmail.com>
Subject: Re: [PATCH 5/9] dt-bindings: gpu: mali-bifrost: Add a compatible for
 MediaTek MT8186
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_014534_792579_F1FFC300 
X-CRM114-Status: GOOD (  19.11  )
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
Cc: devicetree@vger.kernel.org, tomeu.vizoso@collabora.com, Nick Fan <Nick.Fan@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, airlied@gmail.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Feb 9, 2023 at 5:20 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 09/02/23 09:49, Chen-Yu Tsai ha scritto:
> > On Wed, Feb 8, 2023 at 6:37 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Get GPU support on MT8186 by adding its compatible.
> >
> > I'd skip MT8186 for now. We have to work out some binning details for the
> > OPP, in particular how to deal with both Panfrost (or Mali) and SVS adding
> > the OPP table. We were just looking at the Mali driver today.
> >
>
> Dealing with binning is fairly easy... I have something already done for
> that one, but I'm not sure that it would be the best option.
> My solution makes use of opp-supported-hw by "standard means", but perhaps
> let's have a separated conversation about it?
>
> I don't think that skipping this would give any benefit though, because
> that is only adding a compatible and whatever binning support would have
> to be generic and 99% not bound to any mediatek specific compatible.

The binning is related to voltage range, not maximum OPP. So it's more
like fast/slow example in Documentation/devicetree/bindings/opp/opp-v2.yaml
or the opp/allwinner,sun50i-h6-operating-points.yaml, minus the efuse node.

The downstream DT currently looks like this:

opp-950000000 {
        opp-hz = /bits/ 64 <950000000>;

/* This is Mali specific; ignore
        opp-hz-real = /bits/ 64 <950000000>,
                      /bits/ 64 <950000000>;
*/
        opp-microvolt = <900000>, <1000000>;
        opp-microvolt-bin4 = <875000>, <975000>;
        opp-microvolt-bin5 = <850000>, <950000>;
};


ChenYu

