Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89822C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 19:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E9O5I/wJjbPOUkC2i3pPoZK88Gn1ehHO4w7YMc4v8j8=; b=UhRkk6CjFezIGp
	g4p6Szdj6jWKP3MCXjycCjiBrFFFYLeKH6UOipvRzleVLREmkhK0bx456n7AYHamA5QnCYwbqmC3v
	31VlpCnKUmAP98pnHq3+g+kBQIiG0tBm4LRoQk6KIpcWBTvNmwIux+cdEAN0h9QgnaEMn+PxidtK1
	x0h+P9hDcYrEMaU62B+8sSSqWMJdhllelIpiT8bhIr0XfjfLiBGJKzuoYLn9n+g6vQtKQNcQwndAW
	u/PFl36Kwo8uhvFl3Ptsiu8+9klsBQlD5lD5FgzFsCiizG/yUXARIxvNNJPn6RWXkS8qWPdvHWbpR
	ePgT+vYUGzcscu3/wpMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZHFQ-00DKUU-8S; Tue, 29 Mar 2022 19:11:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZHFC-00DKPy-EC; Tue, 29 Mar 2022 19:11:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 331AB61599;
 Tue, 29 Mar 2022 19:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96D8CC34100;
 Tue, 29 Mar 2022 19:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648581064;
 bh=Z9f2r56vngMSRkwrHGORVdFRCd3Ja+qoUjCgMo0+fMY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AOqfCUf7yLFwIfnj5brTUWDumtDXd+nH9QlX4rQ0iGE9+11qaGnEBp5dfHRHfjO32
 aBcnWaGdSBdUaIJbBTN+NVlcs29bfVJx9bZH/qD1VHGmFP37vRLWLy5sH9LyCgTrTC
 HVBcc1/XBxBl/En/IFGZxjAo/jvof8AQcq7muiF49yBOPh4ACv+UoTSYtAcvsrYLsv
 xw/IjhZznRIY/cA1ecbc9P7eyS4w+NLmU97gmiBuxSvJfmPOXLHi5r+zKoQPY9CQXl
 kAiQc+kfmQQyHFY3DHfYToyr/8CLrbSkEZwdHaRxioM8S+oVpOQIJ5NxD4qyimkzXm
 ocTtn0FJky02Q==
Received: by mail-ed1-f51.google.com with SMTP id h1so21829380edj.1;
 Tue, 29 Mar 2022 12:11:04 -0700 (PDT)
X-Gm-Message-State: AOAM530hrMPEtAHOP3v6J3xrOGGUEsUlJlLxsVWP3IZPf3imUIzl+REf
 v+BbCRCyFDGIVdRx104kSaAP8KgRpSiNE9x4Pw==
X-Google-Smtp-Source: ABdhPJz2EcwfbpLLNfbPV4lpc6oRX1DfGgrw/zODvGbU5XGzz47/sV8C7BZQxzV2+8hYQITbC12p1Ms7BrmdH7NXLW4=
X-Received: by 2002:a05:6402:2711:b0:419:5a50:75ef with SMTP id
 y17-20020a056402271100b004195a5075efmr6622477edd.280.1648581062773; Tue, 29
 Mar 2022 12:11:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220329114540.17140-1-tinghan.shen@mediatek.com>
 <20220329114540.17140-3-tinghan.shen@mediatek.com>
 <d720a5e9-d078-6c60-f55b-0506c4b4e1fa@collabora.com>
In-Reply-To: <d720a5e9-d078-6c60-f55b-0506c4b4e1fa@collabora.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 29 Mar 2022 14:10:50 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLrgW4GwSZ20x5Gsu-umjtw4x8k=uHeZk9T2+A3K6UT0Q@mail.gmail.com>
Message-ID: <CAL_JsqLrgW4GwSZ20x5Gsu-umjtw4x8k=uHeZk9T2+A3K6UT0Q@mail.gmail.com>
Subject: Re: [PATCH v12 2/3] dt-bindings: mmc: mtk-sd: increase reg maxItems
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Tinghan Shen <tinghan.shen@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Wenbin Mei <wenbin.mei@mediatek.com>,
 linux-mmc <linux-mmc@vger.kernel.org>, devicetree@vger.kernel.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 Ryder Lee <ryder.lee@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_121106_558933_6B859402 
X-CRM114-Status: GOOD (  16.20  )
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

On Tue, Mar 29, 2022 at 7:43 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 29/03/22 13:45, Tinghan Shen ha scritto:
> > Add optional host top register base for the reg binding description.
> >
> > Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > ---
> >   Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > index 7032f7adf3ca..6d41bcec900f 100644
> > --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > @@ -40,7 +40,8 @@ properties:
> >             - const: mediatek,mt8183-mmc
> >
> >     reg:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 2
>
> it's just maxItems... adding minItems: 1 is not required.

If 1 entry is still valid, then minItems is required. If not, then
it's an ABI break.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
