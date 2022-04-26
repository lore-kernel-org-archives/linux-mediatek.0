Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FA2C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 18:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dri6GxuYi1o0ESOkM1lJI8gLixlAYvea9L7rtcQ8cMM=; b=qdgCO5F4o568rf
	5jzg44EJbJZgAa4HylhKOZu8FUrLaM86Pji9geeIxS+kdIwFowNHt68GDRO0f24MPoqj6IamIdt5l
	0qdgBXMKORyDa3XNjdZXkek9zSOn4EroXCWiKsEj1pKPsMXX1OLUFhFcFE63cFPM7yDBFMoDY0hlE
	0vyVsAq8L6pYjIvkxNBdvzXA133Q3rfuk/7b2lpiJon7pniVPZ72aIw51HhTA32psSpSv6J7JlM1c
	uFsB04VawWdK2dP+TtUwHL3R8aCoEcbHtQDm8uX7fhGUe5/JKgEC/UBfW5NigD9OxlL0++0rKYbvF
	2tawUBm9oT0fkM8xjezA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njQE9-00FpXg-Ds; Tue, 26 Apr 2022 18:47:57 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njQE0-00FpT4-6V; Tue, 26 Apr 2022 18:47:49 +0000
Received: by mail-oi1-f175.google.com with SMTP id z8so21696701oix.3;
 Tue, 26 Apr 2022 11:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iDLx42JqhRvN2aUzygr7r+pBbJ3YIX1ijHCoIfaNdZo=;
 b=WKeTSQBGsMHpD1UFhN/pvN0ASTwjUUb0oTHJymdH18yT6Mab7ztJWDZ8mIL2OU8R1r
 OKcVGrWLnRrw3dZCg//lwKRo07BAWYeu6yhQfcIJiZ7JWpOVnivUpJQmywU2Yk954mPW
 h2csalOKxof2UqiPH5Y7NnhJJMr6AJbbi1ZhysWpLMZ/xf0gAQCx+cKenCNX15cWjhcv
 BQsxAKmE/IxlZ/gGJZ+Rtez6XfPz8skNQGrqGOUfHEPXJldEmHd69sU1xc8Ltr/JHncL
 oyDJ3dNRPHrPiSOXCNXO2Dt+pj6WWwVO86J728C2PwnlHOEdP1P516g1l8V2W6i0bsF3
 acrg==
X-Gm-Message-State: AOAM530dZqZP8uTxxC7WBV0oEY5z599pGHq1mwzKdYIp/hTWK5ncJ5Rf
 nk1LtSR9II1ySymeYS/GpQ==
X-Google-Smtp-Source: ABdhPJyMWP8qd5uhytgAU4RBASgpL7Ox34Rb/kPRWpFPpgTzxcHHF9TCvq3NVM1PX7WbefB2xFTUoA==
X-Received: by 2002:a05:6808:2d5:b0:325:162b:4846 with SMTP id
 a21-20020a05680802d500b00325162b4846mr7111440oid.147.1650998867328; 
 Tue, 26 Apr 2022 11:47:47 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 d16-20020a056871041000b000e932746d33sm1098579oag.28.2022.04.26.11.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:47:46 -0700 (PDT)
Received: (nullmailer pid 2339789 invoked by uid 1000);
 Tue, 26 Apr 2022 18:47:46 -0000
Date: Tue, 26 Apr 2022 13:47:46 -0500
From: Rob Herring <robh@kernel.org>
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Sam Shih <sam.shih@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-clk@vger.kernel.org, Ryder Lee <ryder.lee@kernel.org>,
 linux-mediatek@lists.infradead.org, Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: mediatek: apmixedsys: Convert
 to DT schema
Message-ID: <Ymg+Uo8dLnKuIWlX@robh.at.kernel.org>
References: <20220424084647.76577-1-y.oudjana@protonmail.com>
 <20220424084647.76577-3-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220424084647.76577-3-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_114748_338635_5590376D 
X-CRM114-Status: GOOD (  13.26  )
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

On Sun, 24 Apr 2022 12:46:46 +0400, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Convert apmixedsys bindings to DT schema format. MT2701, MT7623 and
> MT7629 device trees currently have the syscon compatible without
> it being mentioned in the old DT bindings file which introduces
> dtbs_check errors when converting to DT schema as-is, so
> mediatek,mt2701-apmixedsys and mediatek,mt7629-apmixedsys are placed
> in the last items list with the syscon compatible, and syscon is
> added to the mediatek,mt7623-apmixedsys list.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../arm/mediatek/mediatek,apmixedsys.txt      | 35 -----------
>  .../bindings/clock/mediatek,apmixedsys.yaml   | 61 +++++++++++++++++++
>  2 files changed, 61 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml
> 

Applied, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
