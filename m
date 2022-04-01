Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95CAC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Apr 2022 09:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EZfkm1SofgNe55/uVM7unscdjA51tliZHc/CCQ3FkaM=; b=iSS4hjLDtBUtX8
	Sw83Plixz2qwlD3mtTYokfeJ41bJ2Ed27vgI6eJJOPOTHd2fp0hgFydlweMfsOGuIukYrGRz8oD8l
	s+skOWveQsGx9N0uPUAbt8K1877bN6dX9l1k8E9oPd7UwI3a2Pb3furI/sSB0JthlrXCN5qwEV/we
	7J/lTd3q0yzD/DkV/iAMczZIG3SvcIi2YGA2ej4WVbgxkUPJnpF0zLyMkISkEpXP9oL+5Upnf3ztE
	6sxorlwuflRyqiJXcUNOPjRSlqa94M18psHm1MHp0QAUw5cUyUSt3U21IXAATrkTo9Lc7IBp4oR+M
	DbB/VfZ7A2FQCAD7Vpzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naDge-0053gb-2S; Fri, 01 Apr 2022 09:35:20 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naDgb-0053fc-PZ
 for linux-mediatek@lists.infradead.org; Fri, 01 Apr 2022 09:35:19 +0000
Received: by mail-lj1-x22f.google.com with SMTP id q5so3098446ljb.11
 for <linux-mediatek@lists.infradead.org>; Fri, 01 Apr 2022 02:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/4FSuKnccX1iFN0uwomkiOn5u1Xbdrve2qg2JRoojKE=;
 b=VogYOcScEozGo2HMiWfqxuG6WYR1q4RB22WpLk5JKZJ7C7863bdDZMoez1zh52xN3E
 tQRCs5L9iLeEb3iV/aDNvioJiF6J1FXPf/1x+Jyf0ZnUG8mzmEooJR7j+y5YldogbuP+
 5ezZ26ojecVxEvsIhBKIacbEiCW3aRA9iQwLnC0eJIRp9QpLT3gCIlLWTVPWekSneKDD
 gETW8elTB+iNq/ztsFTbH9BsNjgxNo1YX7KDi+JnJHg6QgCVPbLGDuQJi9sf2ve2FCoA
 TVnlbcWW+EXB4ILmmm8EcrghRQ2R5G/sodiSOxtoOtAHy5iED1RwUgHk4B4qiR9ViDYB
 1gFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/4FSuKnccX1iFN0uwomkiOn5u1Xbdrve2qg2JRoojKE=;
 b=1pRipK0tuhnLZEiNCqlpSI+YbQjWLkHLaX+vysbtqssHtJQ8FH1NmPnQ4vF3CoDCW9
 ah8H3V8SNx7TJ0ihDpKVLUHwArKSF0AV3t5t6UCsrMcX6XR8ipiht5UZ3/FdLQ7KbKJi
 mLw8vt77gjVUpgqKnGnoGWA6BKf3wY1ANvV7r+4gsxgzzu7mpUTsi1XHNI+sZqHeiNQ7
 jI279ow6TDZCrPdwy/wysxh8jpOyrcKwq/jRzK8Z5CgmNF2HZIgArJP4T8Bo7F2GYoTF
 zx2ie4RVShELWu9BoPjaPWkEYxYhxBtAYbJvt0rgmC7zeypq/jlp9MFxRVdAemKZ2qC6
 JgAA==
X-Gm-Message-State: AOAM530GMkFhEe2CLGzTxZoKFRwQnt8mpogFU72AY3xwPfr5OOaLWB/m
 7uYue5DtgdwQJoYdySanL8PVrGi37G/prMc8KnrIPg==
X-Google-Smtp-Source: ABdhPJz6psO/sjbUT/j1r3XjHcZRBUCIC5sFVlTg1I2riC4zd4S5suzIVESlXB2FKEJIV3qX81Z8ZtW69b0xCIMwSA8=
X-Received: by 2002:a2e:8189:0:b0:249:7d3a:ceb0 with SMTP id
 e9-20020a2e8189000000b002497d3aceb0mr12136101ljg.367.1648805715996; Fri, 01
 Apr 2022 02:35:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220329032913.8750-1-axe.yang@mediatek.com>
 <20220329032913.8750-2-axe.yang@mediatek.com>
 <CAPDyKFqoTN1pF-L6qCHxpdMCmPtHP0aHHaDURN2QJsN3v+wZBw@mail.gmail.com>
In-Reply-To: <CAPDyKFqoTN1pF-L6qCHxpdMCmPtHP0aHHaDURN2QJsN3v+wZBw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 1 Apr 2022 11:34:39 +0200
Message-ID: <CAPDyKFo_PYc9ofWuXeaE86oK6FqOAnHsH-ZSG58MfNq8nEOVOw@mail.gmail.com>
Subject: Re: [PATCH v9 1/3] dt-bindings: mmc: mtk-sd: extend interrupts and
 pinctrls properties
To: Axe Yang <axe.yang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Satya Tangirala <satyat@google.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Lucas Stach <dev@lynxeye.de>, 
 Eric Biggers <ebiggers@google.com>, Andrew Jeffery <andrew@aj.id.au>, 
 Stephen Boyd <swboyd@chromium.org>, Kiwoong Kim <kwmad.kim@samsung.com>,
 Yue Hu <huyue2@yulong.com>, 
 Tian Tao <tiantao6@hisilicon.com>, angelogioacchino.delregno@collabora.com, 
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_023517_852230_F1261DBF 
X-CRM114-Status: GOOD (  20.49  )
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

On Fri, 1 Apr 2022 at 11:22, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Tue, 29 Mar 2022 at 05:29, Axe Yang <axe.yang@mediatek.com> wrote:
> >
> > Extend interrupts and pinctrls for SDIO wakeup interrupt feature.
> > This feature allow SDIO devices alarm asynchronous interrupt to host
> > even when host stop providing clock to SDIO card. An extra wakeup
> > interrupt and pinctrl states for SDIO DAT1 pin state switching are
> > required in this scenario.
> >
> > Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> > ---
> >  .../devicetree/bindings/mmc/mtk-sd.yaml         | 17 ++++++++++++++++-
> >  1 file changed, 16 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > index 297ada03e3de..3872a6ce2867 100644
> > --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > @@ -69,12 +69,22 @@ properties:
> >        - const: ahb_cg
> >
> >    interrupts:
> > -    maxItems: 1
> > +    description:
> > +      Should at least contain MSDC GIC interrupt. To support SDIO in-band wakeup, an extended
> > +      interrupt is required and be configured as wakeup source irq.
>
> If I understand correctly, the extended interrupt (a GPIO irq) may not
> necessarily share the same interrupt parent as the primary device
> interrupt.
>
> Perhaps it's then better to extend this with "interrupts-extended"
> instead. See Documentation/devicetree/bindings/interrupt-controller/interrupts.txt.

One more thing, looks like using the "interrupt-names" property would
be good to use too. To easier distinguish the different irqs.

[...]

Kind regards
Uffe

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
