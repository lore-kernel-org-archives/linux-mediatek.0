Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBB3C43219
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Oct 2022 12:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=02DHLrzLJP8kPkxHoMJSCUYhnTM9XF5dBkLVhcluWS8=; b=J6TkriF4vN8cnmoSLcS3BigIw7
	qOOk41SWXC+RIXDh0MUTr4HodHTC+UkVEx7BoHzloAp7uS7Zwy/N8PHX6fPJVhwr6E4Kvx655HDb7
	/gEKkhAM62XW+dtOeqsmYk+CxMcV2hNSB93vGXVUSVcZnxeKOAkv3MagLIZCG5R6Vy8hJCSZMhXHQ
	7DJVbGsOpX+6bDgeJ9eC7UCrLuGEV1+nBUYExWrCcQhydZj2YlTvrGXs0s9KjLfjAdBko7XConTR1
	0DiXT8dS6w0O0eAumPW+BYusERjkdV/Si9JErxJXVkgJ/CG3Cc0LdRq4eGhxc1sbJyJjbH2h79qVj
	pq5hMXSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohsM6-000vFk-Sg; Mon, 10 Oct 2022 12:58:02 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohsM4-000vEV-0M; Mon, 10 Oct 2022 12:58:01 +0000
Received: by mail-oi1-f182.google.com with SMTP id y72so5878061oia.3;
        Mon, 10 Oct 2022 05:57:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=02DHLrzLJP8kPkxHoMJSCUYhnTM9XF5dBkLVhcluWS8=;
        b=jh/WnWZ1OMjpc/UVy6BfJCb5X8u/ED9RDDWokvrRQnubySCC9CEQ3J19oqqxvMP1Ef
         8oghDhsTjuYV+0PQYGLWvRYrDvPjinsGH/Drdnmn71DHuorKeW8V7rlWq85/jZ5gVmmB
         zC3KZHNAsn2coDcW0WZWaacxo8+T+S7ho47mdiTdanva2B/qvCfckg/vSkF7FctPPQga
         z2NsNx/ugpWwmyNTYBRAQVeD7kbcZ3vk/TwR6Fb6XPa41+mXlUIsw4z8zMAIsVU56tfc
         q8pSAO1SBW2YFjgrJe/9BGmOSBoU8+nifnKCKoFhT0tgxxYSootqVk5eplpFL31Q91hK
         aCdQ==
X-Gm-Message-State: ACrzQf3AEKp5qLhtSpqlYeEEJEZG4+N49R5QC7SVqDr/6k4RMnOvpB3k
	/ES3MAvY2MQ1m0dGN+DUTA==
X-Google-Smtp-Source: AMsMyM4hDBKrNCy/IKcknD8z6j4T3aIcEYZni5TT/Sd0AwEdQJZodfTyV2Z5vEFV6hYchEOk+ypASg==
X-Received: by 2002:a05:6808:1511:b0:354:28c8:d034 with SMTP id u17-20020a056808151100b0035428c8d034mr9038170oiw.208.1665406677472;
        Mon, 10 Oct 2022 05:57:57 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r2-20020a4a3702000000b004806f494d2fsm1260498oor.11.2022.10.10.05.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 05:57:56 -0700 (PDT)
Received: (nullmailer pid 475796 invoked by uid 1000);
	Mon, 10 Oct 2022 12:57:58 -0000
Date: Mon, 10 Oct 2022 07:57:58 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Yassine Oudjana <yassine.oudjana@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, Andy Teng <andy.teng@mediatek.com>, Yassine Oudjana <y.oudjana@protonmail.com>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/10] dt-bindings: pinctrl: mediatek,pinctrl-mt6795:
 Fix interrupt count
Message-ID: <20221010125758.GA468288-robh@kernel.org>
References: <20221007125904.55371-1-y.oudjana@protonmail.com>
 <20221007125904.55371-6-y.oudjana@protonmail.com>
 <0769c6c8-567d-68c0-323a-9aaee1241e13@linaro.org>
 <6c889c7e-4c5a-a201-e37c-bf95b6826584@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c889c7e-4c5a-a201-e37c-bf95b6826584@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_055800_078956_A8B32D7B 
X-CRM114-Status: GOOD (  19.46  )
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

On Mon, Oct 10, 2022 at 01:47:18PM +0200, AngeloGioacchino Del Regno wrote:
> Il 10/10/22 13:13, Krzysztof Kozlowski ha scritto:
> > On 07/10/2022 08:58, Yassine Oudjana wrote:
> > > From: Yassine Oudjana <y.oudjana@protonmail.com>
> > > 
> > > The document currently states a maximum of 1 interrupt, but the DT
> > > has 2 specified causing a dtbs_check error. Replace the maximum limit
> > > with a minimum and add per-interrupt descriptions to pass the check.
> > > 
> > > Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> > > ---
> > >   .../devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml | 5 ++++-
> > >   1 file changed, 4 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
> > > index 73ae6e11410b..a3a3f7fb9605 100644
> > > --- a/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
> > > +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
> > > @@ -47,7 +47,10 @@ properties:
> > >     interrupts:
> > >       description: The interrupt outputs to sysirq.
> > > -    maxItems: 1
> > > +    minItems: 1
> > > +    items:
> > > +      - description: EINT interrupt
> > > +      - description: EINT event_b interrupt
> > 
> > Is second interrupt really optional or you just wanted to silence the
> > warning?
> > 
> 
> The event_b interrupt exists (and fires on certain events, if configured to do so),
> but it's currently unused.
> 
> It's really optional.

Optional for DT means may or may not be wired up in the h/w, not what 
some OS 'currently' uses.

However, you can't really add new required properties or entries to an 
existing DT without breaking compatibility. Maybe that is not yet a 
concern.

Rob

