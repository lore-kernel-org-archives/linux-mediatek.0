Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3834BC07E9D
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 21:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w2QQwnQgmCoCtfJGgTC/b/2B1KxxxneV73oIJQj+vXs=; b=Q/5jCCN7qjh6a62QcIFzRCHFHr
	4jCTi3s3MCiO5KOChdG5C1P77K4DClwqChz01UfcS+KG7ocbn3fWNj9IrUuiESRtIT/Bm+XdRcCYv
	OIdmYaqKc3GZK0a4B7AqemztjFyLBwnswq8/ZviMWg1g63XhS9w/cYE6hHEOwrrgaUnVhFZupQjf5
	QOimMC6+6+Xx/AtRhYaWtFeIDe1/f+hRpeKcuhtT2vTg9nwhRmpb1zI0Ny+aFZebZEYwKH/e7O/Gp
	M+GzYBCy+NEiYe6j26ziHpKsN33ZDD1K7Lna8dB/cQbcxUKpSrB8rbaHUIFh3c9H+mpgMlu7MvM8r
	6NIcqp9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocw3q-0075t6-JI; Mon, 26 Sep 2022 21:54:46 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocw3n-0075pr-By; Mon, 26 Sep 2022 21:54:44 +0000
Received: by mail-ot1-f52.google.com with SMTP id r22-20020a9d7516000000b00659ef017e34so5293876otk.13;
        Mon, 26 Sep 2022 14:54:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=w2QQwnQgmCoCtfJGgTC/b/2B1KxxxneV73oIJQj+vXs=;
        b=HY9ByZvzkddm33E133PrBkbo738BZ38+CDfrGqOZSx+le/sfUAOS7DWArGYkh54iwY
         Q2M3Vs4TXHA80g82JNBm6ttQA8tbtbE3KgM4JBfj+4pOPQ27JMn+USRrxT27W64UikfQ
         uE/Ncf/9DsRDVy8k+W1EpWDcsXqKJfUJ+1V/awLUg9HSFajsRdFAleECoOZq0+b45Af8
         cnQnGmpKYr//hXDJTFkCH09KaE9j3x6AmdwekoEt2Q8gNW5RB4fyleHW3yXDkxXqauC/
         EDo+R+eoSvAojUtqCiM/5Fx+lfbuT1HWxvHeawSu1/bBo9Zopc8cjIud+fCX6xc4+DfW
         y4mQ==
X-Gm-Message-State: ACrzQf2zrG0p01mg0szNxcVcmt1ncmIkaWnuwQZEuwNrfqALUSTlK2jQ
	yndL1ccNEkLycusNlYzqTw==
X-Google-Smtp-Source: AMsMyM6bmE7R0bTAstFX4jVboHAVQz30IQaE1gTw1Ch1FS7J/e50TEWed28r2+CwdBjQaLYnUzf7RA==
X-Received: by 2002:a9d:6e0f:0:b0:655:f372:f18b with SMTP id e15-20020a9d6e0f000000b00655f372f18bmr11294695otr.206.1664229281970;
        Mon, 26 Sep 2022 14:54:41 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bm43-20020a0568081aab00b0034d14c6ce3dsm7615607oib.16.2022.09.26.14.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 14:54:41 -0700 (PDT)
Received: (nullmailer pid 2894496 invoked by uid 1000);
	Mon, 26 Sep 2022 21:54:40 -0000
Date: Mon, 26 Sep 2022 16:54:40 -0500
From: Rob Herring <robh@kernel.org>
To: "liangxu.xu" <liangxu.xu@mediatek.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Project_Global_Chrome_Upstream_Group@mediatek.com, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: display: mediatek: dp: Add compatible for
 MediaTek MT8188
Message-ID: <20220926215440.GA2888681-robh@kernel.org>
References: <20220923013953.5043-1-liangxu.xu@mediatek.com>
 <f6e669dd-f2cf-6e3f-18bb-25b21e5eab0c@linaro.org>
 <2afb5b7f761c7931eaf93f2f8a0fd268a39e1b02.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2afb5b7f761c7931eaf93f2f8a0fd268a39e1b02.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_145443_443858_65719D03 
X-CRM114-Status: GOOD (  17.68  )
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

On Mon, Sep 26, 2022 at 10:52:04AM +0800, liangxu.xu wrote:
> On Fri, 2022-09-23 at 13:16 +0200, Krzysztof Kozlowski wrote:
> > On 23/09/2022 03:39, liangxu.xu@mediatek.com wrote:
> > > From: liangxu xu <liangxu.xu@mediatek.com>
> > > 
> > > Add dt-binding documentation of dp for MediaTek MT8188 SoC.
> > > 
> > > Signed-off-by: liangxu xu <liangxu.xu@mediatek.com>
> > > ---
> > 
> > Where is the DTS? Where are driver changes?
> > 
> > Best regards,
> > Krzysztof
> > 
> 
> Hi Krzysztof:
> 
> If you want to see the synchronous changes of dts and binding files,
> then I will attach this binding file changes when sending dts later.
> 
> The driver change of mt8188 reuses that of mt8195. The driver link is
> as follows:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/mediatek/mtk_dp.c?id=48f4230642ee32a97ddf4be492838ce96089f040

So the 8188 block is backwards compatible with the 8195 block? 
That's good, but not what your schema says because you have not defined 
a fallback compatible for the driver to use.

Rob

