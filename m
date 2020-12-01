Return-Path: <SRS0=+qQs=FF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2BA5C64E90
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 01:35:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2612E206F9
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 01:35:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vxo6rkF8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2612E206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sac9ol3vR/Cdibkc8IPoRInDUx+OdOG99ucR6VJPGrw=; b=vxo6rkF8kNoiQ6144o9oox5rg
	X8OyBIPydIAFyNnTFVdegf1PwftjUvwxXG6pdcFd+fDooXpgyxOhXY1iifit/RKurS3gd4fAO3ySR
	0/N+XgyYjySkZ3rNcyceIzwQ37+agOQh1ERuadKXdR0Q1HU7nneS8mzf1/VkwEfEp1vT/IrW1iFzC
	iICuVTI2V0dwHzQnEptuEVDS9Fg2yPSyqmztJ9ciF/ji8qqrCK6wgZqjfJfIR4Fu24L1HsPPYykoW
	fGhQFJZ7IQBiLRskgEktdXqxbe3CMmO/z6tB6jC6Uf597bM2FmNGEX2bLbGUofn7ys2aPrQwtuB11
	rP3+QdzUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjuZr-0003Si-4B; Tue, 01 Dec 2020 01:35:35 +0000
Received: from mail-il1-f194.google.com ([209.85.166.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjuZn-0003Rj-1m; Tue, 01 Dec 2020 01:35:32 +0000
Received: by mail-il1-f194.google.com with SMTP id p5so98011iln.8;
 Mon, 30 Nov 2020 17:35:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GVpuIFWzwjWwv3nZSyTHsP20wE6qwR6Pcp5yFWMuI+c=;
 b=Y6JPeHoJ+9uU8y9RL0ZGRcR0rhpRcR42CWTcJdnVQsZi1u5G3GL8A9pFxK5XgV8WKB
 OAWaS1iHHTN8+Ff1uB/3jtt99s204pX0EmqmHS1NK2mImVSXZq4zm8pZTnYeLFYp4m5I
 o6tXjIzB+8i/MwWTcPHtJy4zM/xwyzSiN/cwvMsQgcOL6bFvRR2RlZocQUxP8jGVTeyn
 5tG5C9gonWakYXd1Pb1Rvs5KMQSleW2g8yovRbzOhqMBo91asLY/g3r3GsulZgNpF1OB
 Gg4rPUOpUehZ67eeiIqQtKVRv9IFWalZTW+0ulXYzKEPM5fIFcbe78KVyof/9SLO7o28
 xCIQ==
X-Gm-Message-State: AOAM531lr++MekoFcm4kgXP12m3a9cbRjPdfJyfJf9gsRPaMrsROKgLk
 BVesjlaB3pHuPnMupXYrHQ==
X-Google-Smtp-Source: ABdhPJwUlN5l3Gh7+xqYqg3UP+GDBb5GmRGKTM4mwYtbcsbfdWR7c6k4BnU7cVtaPzTijBI9x6+sng==
X-Received: by 2002:a92:50b:: with SMTP id q11mr528232ile.49.1606786529992;
 Mon, 30 Nov 2020 17:35:29 -0800 (PST)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id b15sm186046ilg.83.2020.11.30.17.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 17:35:29 -0800 (PST)
Received: (nullmailer pid 3440973 invoked by uid 1000);
 Tue, 01 Dec 2020 01:35:26 -0000
Date: Mon, 30 Nov 2020 18:35:26 -0700
From: Rob Herring <robh@kernel.org>
To: Daoyuan Huang <daoyuan.huang@mediatek.com>
Subject: Re: [PATCH v4 1/4] dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
Message-ID: <20201201013526.GA3327634@robh.at.kernel.org>
References: <1605839346-10648-1-git-send-email-daoyuan.huang@mediatek.com>
 <1605839346-10648-2-git-send-email-daoyuan.huang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1605839346-10648-2-git-send-email-daoyuan.huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_203531_150839_D045E61B 
X-CRM114-Status: GOOD (  12.52  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Maoguang Meng <maoguang.meng@mediatek.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, menghui.lin@mediatek.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, drinkcat@chromium.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, sj.huang@mediatek.com,
 linux-mediatek@lists.infradead.org, pihsun@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 randy.wu@mediatek.com, srv_heupstream@mediatek.com, acourbot@chromium.org,
 linux-kernel@vger.kernel.org, tfiga@chromium.org, ben.lok@mediatek.com,
 moudy.ho@mediatek.com, Rob Landley <rob@landley.net>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Nov 20, 2020 at 10:29:03AM +0800, Daoyuan Huang wrote:
> From: daoyuan huang <daoyuan.huang@mediatek.com>
> 
> This patch adds DT binding document for Media Data Path 3 (MDP3)
> a unit in multimedia system used for scaling and color format convert.
> 
> Signed-off-by: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> Signed-off-by: daoyuan huang <daoyuan.huang@mediatek.com>
> ---
>  .../bindings/media/mediatek,mt8183-mdp3.txt   | 208 ++++++++++++++++++
>  1 file changed, 208 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8183-mdp3.txt

In the year since last posting, DT bindings are now in schema format.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
