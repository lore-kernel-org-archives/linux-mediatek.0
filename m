Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88D9C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 23:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jjM7LzjEAinLovIDLzVEBX3P/bFESXusnsD4utZywCk=; b=spfUEU0e5mtyET
	b1R4weMdlMLTPf7JkxRhhbYOnhHq19ttd670tGFATUg4mB0GwZVlivguyqvuGEgquhGbaJVm4uHP+
	RN5gxokhXQmq6nCT48RLAa7shOQYqm1/d+MBig7caE6sN5DdeYBeBLrL+87wT1II8raoQs5dh7iMB
	NShuKcKjnDT550YU6A68EvIWqHZ28E1yoFK/TChIwM8ZhzWDE7KLfFpAIv0SbT1UlylY0qSLG5x9d
	ePRb5QnCEAV5EPYTZv7nW6bGREBcRu75hEABXjCA5BRliqLjPuxC/JNJMhJMrjll/cfq25xewnhwo
	F69nGdU3nHZLoYHq9jVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqkSz-00As1X-Ic; Mon, 16 May 2022 23:49:33 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqkSw-00As0O-Vj; Mon, 16 May 2022 23:49:32 +0000
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-edf3b6b0f2so22254124fac.9; 
 Mon, 16 May 2022 16:49:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RVhdYRsH1wOBb6tq7hHf/sKGXBHaPx+8CRN3GtKz0gI=;
 b=M3fqx+uOR3stXXYeZKL9GxGhUYNIh1rEdfSKgOY1zfLsim0142/iMTV6d0HAlTL8GJ
 v9CDXCER7eYAMi/mIMG2m7UaCOivWrUcAEpHS8lKD2EnvXw/chHG8JY3TZJQBCv77HCS
 1hY8VS7Yqvl8vop8qwDdlvEUD4ikmKv1ux169I5DqQPJsJ73mjjS3hSaViyQyW1BeBD+
 M3xW5CDQv4EwdCRmpC9xWAHuAzOl4ygOgibAt4giLSL6ZGpfgLQm0Thh5R2xcEYxjScM
 vco/xI0H+1MThEKSmPERogEgAEvtNjudXtx7Aqan+3/khqYSwxu0ZdtRkJc7iCKmginm
 GTdw==
X-Gm-Message-State: AOAM530f0GN+ILD3pGnwyUykfX7bX8G78JNM9tvAtV2384Sh+F1R5fuv
 Cy1rSK+W2bcy8Lc3DE6RVlfaidwPSA==
X-Google-Smtp-Source: ABdhPJw64qmMf6hF6uFHOu6opKTOZ5XCwwNHoa14aVFcSxQjLzTHedcTcj7LzCiWChH+py5Al0JXrw==
X-Received: by 2002:a05:6870:73c9:b0:f1:86e3:fa15 with SMTP id
 a9-20020a05687073c900b000f186e3fa15mr6527074oan.248.1652744968802; 
 Mon, 16 May 2022 16:49:28 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 n20-20020a9d7414000000b0060603221276sm4361473otk.70.2022.05.16.16.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 16:49:28 -0700 (PDT)
Received: (nullmailer pid 3564415 invoked by uid 1000);
 Mon, 16 May 2022 23:49:26 -0000
Date: Mon, 16 May 2022 18:49:26 -0500
From: Rob Herring <robh@kernel.org>
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, Miles Chen <miles.chen@mediatek.com>,
 Ikjoon Jang <ikjn@chromium.org>, Sam Shih <sam.shih@mediatek.com>,
 linux-kernel@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, devicetree@vger.kernel.org,
 Yassine Oudjana <y.oudjana@protonmail.com>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 02/13] dt-bindings: reset: Add MT6735 reset bindings
Message-ID: <20220516234926.GA3564356-robh@kernel.org>
References: <20220504122601.335495-1-y.oudjana@protonmail.com>
 <20220504122601.335495-3-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220504122601.335495-3-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_164931_062739_36F3B893 
X-CRM114-Status: GOOD (  11.03  )
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

On Wed, 04 May 2022 16:25:51 +0400, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add reset definitions for Mediatek MT6735 resets provided by
> infracfg and pericfg.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  MAINTAINERS                                   |  2 ++
>  .../reset/mediatek,mt6735-infracfg.h          | 31 +++++++++++++++++++
>  .../reset/mediatek,mt6735-pericfg.h           | 31 +++++++++++++++++++
>  3 files changed, 64 insertions(+)
>  create mode 100644 include/dt-bindings/reset/mediatek,mt6735-infracfg.h
>  create mode 100644 include/dt-bindings/reset/mediatek,mt6735-pericfg.h
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
