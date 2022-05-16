Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8590C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 23:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NasPWYv/NMO7HBd4fM92QVb4HwL3rMUzI6v4MnqhFPQ=; b=FPwV8eQTylhcqg
	vEWNFp/WVn98enNb0DtlJ2e7MPDibBgzBc7Xx2h3AvelPzN9itUuJ2VyUB7HQsme02OltA/rCKIiZ
	piwhgMejcxmxfIoImwWwPn1BBRwrDuxyb2JXPzdygIFTo89BKQX5eO7cbLuSRuT56OZfFUTY/Vgm5
	kyfVnTBfVWxrMbxnK3CpZS37L6RIMV2Ju7Zk5CM0fJBLc4unNKLWr0YAKVkGSXfQ1jwlkLZrgc3KF
	fkk0Vdv/KxTeK6aGIm6D+8/uW3txABN13r3rX5HeKjq3mgOePcTvPXJsEoXBTsyrfkInhpiDIfmkz
	IDRUx3ztj381w20vMOhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqkS0-00ArqD-56; Mon, 16 May 2022 23:48:32 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqkRx-00ArpP-Lz; Mon, 16 May 2022 23:48:30 +0000
Received: by mail-oi1-f181.google.com with SMTP id r1so20556709oie.4;
 Mon, 16 May 2022 16:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=x5LTIsaWOZ1f/mxn/cSQ8aiFsbE9yJUuVihPv1xCLlc=;
 b=73uklkC7Fk19l0e9mHlY+7SBy1RBbjQtBqmhWfzXhc0mSBNOonVHmgLvk5e3pRAT9O
 x+pYEnb8nUTtXOnwQud/Elx2225RkEtPaSgZnzohsI4f6hG3DhMYVW83NFohqbf9tQzi
 29tigqOXvgJwx4FptHucUmm7+6NbaACqHtEcz2WyLLVaDvqjHGX6OL9OkTnR1sbRjiBv
 qVQAlM263ulIhRq66d3q5Pjih3e/iEKF+0oVIOO58X2nLvaEucxLhHV6X6VlMhV2Q/YX
 8OkgNEP2kAUuLWD/C1ClLs1QqFMAKr+PgnNXy2tPJbbpeiXIiHok6OamKrnoIjp+GLdC
 IXWA==
X-Gm-Message-State: AOAM531MkSDM8RRLMUexq2+/rtwCXtjQIMYz8xnSxSN3Evps3TaV58Ze
 qBv6Cz5TIe5ypcUS2kwd1A==
X-Google-Smtp-Source: ABdhPJzUTvob60phC3sXqn1ijohn0Mstb3isikonSGXRcErxRuL+nbisyBQbWnEoaQYItLPI3NWDgg==
X-Received: by 2002:a05:6808:14c2:b0:326:c129:d308 with SMTP id
 f2-20020a05680814c200b00326c129d308mr8919957oiw.193.1652744908349; 
 Mon, 16 May 2022 16:48:28 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 fo26-20020a0568709a1a00b000e686d1387csm6038708oab.22.2022.05.16.16.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 16:48:27 -0700 (PDT)
Received: (nullmailer pid 3562715 invoked by uid 1000);
 Mon, 16 May 2022 23:48:26 -0000
Date: Mon, 16 May 2022 18:48:26 -0500
From: Rob Herring <robh@kernel.org>
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Miles Chen <miles.chen@mediatek.com>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Weiyi Lu <weiyi.lu@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Yassine Oudjana <y.oudjana@protonmail.com>,
 Sam Shih <sam.shih@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 01/13] dt-bindings: clock: Add Mediatek MT6735 clock
 bindings
Message-ID: <20220516234826.GA3562658-robh@kernel.org>
References: <20220504122601.335495-1-y.oudjana@protonmail.com>
 <20220504122601.335495-2-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220504122601.335495-2-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_164829_759364_3B277391 
X-CRM114-Status: GOOD (  11.15  )
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

On Wed, 04 May 2022 16:25:50 +0400, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add clock definitions for Mediatek MT6735 clocks provided by
> apmixedsys, topckgen, infracfg and pericfg.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  MAINTAINERS                                   | 10 +++
>  .../clock/mediatek,mt6735-apmixedsys.h        | 16 ++++
>  .../clock/mediatek,mt6735-infracfg.h          | 25 ++++++
>  .../clock/mediatek,mt6735-pericfg.h           | 37 +++++++++
>  .../clock/mediatek,mt6735-topckgen.h          | 79 +++++++++++++++++++
>  5 files changed, 167 insertions(+)
>  create mode 100644 include/dt-bindings/clock/mediatek,mt6735-apmixedsys.h
>  create mode 100644 include/dt-bindings/clock/mediatek,mt6735-infracfg.h
>  create mode 100644 include/dt-bindings/clock/mediatek,mt6735-pericfg.h
>  create mode 100644 include/dt-bindings/clock/mediatek,mt6735-topckgen.h
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
