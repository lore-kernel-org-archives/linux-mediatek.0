Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B4DC6FA8E
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Feb 2023 18:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UMSuEX3PzF7dxnK96QE6BnCdpykh3c5U6wgrobTc4/c=; b=DlVEvLoMpYNPtBjokP+Sfumtkq
	nj63WDE5pNvsNiEESxEfPr2+95uQW/+T588Ydgh6ykyNuE4oiiPqVZi3lHDvw5Lc+YmWYUYaDvDiV
	K1ctdmOWlH22+7/I6QUmCHbT38+tnszcZj+5ELE2F0vSwaAqbUCAa1HMmblodeGUBvLyrTtgrW5WV
	M3d6HwSavAqEK9XixHRubS6PLQiHoFEtozoxxA+V3YTsUPHOO3dv67fo5O+59MbdFfN7pSJV9Ct2x
	+LjwJbkBSOyntUhwCt3knCg3osh5gy6dmWN/zEZDgSLkd0palPBrPd3ORHxDeb9ru5j9FycrBML4d
	cfL5CQfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWLNw-007fB3-78; Sun, 26 Feb 2023 18:04:32 +0000
Received: from mail-il1-f182.google.com ([209.85.166.182])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWLNt-007fAW-O5; Sun, 26 Feb 2023 18:04:30 +0000
Received: by mail-il1-f182.google.com with SMTP id i12so2795364ila.5;
        Sun, 26 Feb 2023 10:04:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UMSuEX3PzF7dxnK96QE6BnCdpykh3c5U6wgrobTc4/c=;
        b=snkm55w9AszrmnwHngA0ymQRknKlUaHYVdtS7+NsWUHhby95QcDumY0HOqCmTU33Xp
         ge8wzZRscvd8l7yrIgz1Mpf4Y7aoMOYAtrqzFvD+VY4WSHZo6J4Hs8Zr5csU9unZiisc
         HiG0i58XvFDzAbYNBq2uGy8000q/gQ6yNtQiibfSEfRBljVOqqOdGneH36MVckH7VVir
         WOrnXBXJL2u5BIhdt1zkuYDvvfcQ1UtI1Zcu7JildJnSFOAhOEi71ihBu6WCLXUmLLWr
         lKmSvLTVKA2LRwnNTYyMfEGu6AVSgWsl9W7XlSo78Me9al9WvFYc+8oZllZRg9p7owaD
         6j+w==
X-Gm-Message-State: AO0yUKWJHmwWsW/8K65R2A8K3EoUv1fryTHrEkMuzevzPz1zE8bmWzt3
	9/DcGK9TkFr/OBgtu5QHhA==
X-Google-Smtp-Source: AK7set/i0/757auG+RPj2GgQ8Gf8IwoAPeqDUP6Mh+t5Eh/sv0npg2IlH3JW8tgYlgcPvcdhpZtEdA==
X-Received: by 2002:a05:6e02:16cd:b0:316:acef:e65a with SMTP id 13-20020a056e0216cd00b00316acefe65amr20992008ilx.17.1677434668129;
        Sun, 26 Feb 2023 10:04:28 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:8069:8ddf:ff6b:c94c:94fd:4442])
        by smtp.gmail.com with ESMTPSA id a4-20020a92d584000000b003153213c586sm1411833iln.30.2023.02.26.10.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 10:04:27 -0800 (PST)
Received: (nullmailer pid 105263 invoked by uid 1000);
	Sun, 26 Feb 2023 18:04:23 -0000
Date: Sun, 26 Feb 2023 12:04:23 -0600
From: Rob Herring <robh@kernel.org>
To: arinc9.unal@gmail.com
Cc: Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, DENG Qingfang <dqfext@gmail.com>, Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, Sean Wang <sean.wang@mediatek.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Landen Chao <Landen.Chao@mediatek.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, Vladimir Oltean <olteanv@gmail.com>, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: net: dsa: mediatek,mt7530: change some
 descriptions to literal
Message-ID: <167743466228.105184.14755620917019401339.robh@kernel.org>
References: <20230218072348.13089-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230218072348.13089-1-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_100429_807525_B8417012 
X-CRM114-Status: GOOD (  14.00  )
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


On Sat, 18 Feb 2023 10:23:48 +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> The line endings must be preserved on gpio-controller, io-supply, and
> reset-gpios properties to look proper when the YAML file is parsed.
> 
> Currently it's interpreted as a single line when parsed. Change the style
> of the description of these properties to literal style to preserve the
> line endings.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml        | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


