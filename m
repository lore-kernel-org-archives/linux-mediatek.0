Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A313C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Dec 2022 10:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C0fNA7li2melRrJ2fvEzBzk17w400NPv5/Za3XTFksU=; b=YxcqbcpzlnM28hqZN7lkmTVZVw
	PcPPfe1ITQ1V9QGbcVaPC0h/EmoH4ZpYEjGJ7dk5V4hOUPNem8N2K0fd8UG3OEcDD8Lv3b9+Uvf49
	mIHr0p8hrucaF2lFBqUkE3SFVMQ6/j4vCgWR3XXVD30+S7vuTxUt4P8EnYQzog1CvSOEWwkxwyQP9
	2cX6I2bSj8RFRZ9shMO+IK1FchcVUzGEgrp5gkyqk+fKtuLCndcEbL21O8n1Sz8Gx16m9igrMdLOL
	fvuKzjZaDwS4ML0myZsWsRuMLiI1TSnVDMEtUQ9yvtFkyhXrxwUfFCD4AN+Uxu8VK4z5Kk6ioidnK
	PjGwJsTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pApxk-00Eary-O3; Thu, 29 Dec 2022 10:16:36 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pApxJ-00EaiL-9G
	for linux-mediatek@lists.infradead.org; Thu, 29 Dec 2022 10:16:12 +0000
Received: by mail-vs1-xe34.google.com with SMTP id i188so18004880vsi.8
        for <linux-mediatek@lists.infradead.org>; Thu, 29 Dec 2022 02:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C0fNA7li2melRrJ2fvEzBzk17w400NPv5/Za3XTFksU=;
        b=WP3Wk7cvHe6N0tLUiOIS7JTVEgh+E17QI7Uug3ObedTrhMZ6oPVIyzN4bFPBSd4Qra
         6HtQlzFNVLs8ucXNKoWXoUA1RYiR0Afu9OEYz9w3obvnCTS3WupMh6giZgM1elCQC1mY
         iT0oJMt1ACyH7XBdw+0uPqMpxJaD0pSl1Y9oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0fNA7li2melRrJ2fvEzBzk17w400NPv5/Za3XTFksU=;
        b=YYekWa0Z9VDPticzagGzwscA031gRPZflctbGG9Iiuhc5Oea4W41+RiL2X09EMlqvh
         3WK9oZ5/VACjT+JzNrs6qlLTly7gAWuoVR13A2pmnuBBjD/40HB2CwEu3CJaKzjrSU9c
         8rK42sF4nyQ1Lm2swigcX/UsXFDveaMRHaqdFbWqZZZkqPNuoAS7bmiKFT4AFCs/Mrpr
         q0Y8o117ott/wvHKxzStk6/TNmvPxC7EHFdGfeDOF/KRfjYNCxuVKjn93O23rNhP6TLx
         guyZyPr/gvGgA5RnHfoNqtrsdi9Uj5GJu6EFHUm1/djG4WecWAxjEEraJxZg4n1J9Prn
         0Uug==
X-Gm-Message-State: AFqh2krFjazTR9QQDZSeHNV/SEc8dKsocq0+uYG8M5l8gArhZkG97Mke
	nsurhEwKmxPdDeXAoM+zfrQNd8KZF+rCHrh4ZcS2KQ==
X-Google-Smtp-Source: AMrXdXuCQ1T74QcCwFC81IAplOKfPkT1QH9WpfKDVIsV5w8/XaAZftVUaaUiCLqnt1gCsoFAsMNsWbl24g2ZotKJ9BQ=
X-Received: by 2002:a67:f985:0:b0:3b3:7477:5aa2 with SMTP id
 b5-20020a67f985000000b003b374775aa2mr3316243vsq.65.1672308964971; Thu, 29 Dec
 2022 02:16:04 -0800 (PST)
MIME-Version: 1.0
References: <20221221034407.19605-1-allen-kh.cheng@mediatek.com>
 <20221221034407.19605-6-allen-kh.cheng@mediatek.com> <6576a435-dcc1-af80-bbe9-dd98bb0d53e8@linaro.org>
In-Reply-To: <6576a435-dcc1-af80-bbe9-dd98bb0d53e8@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 29 Dec 2022 18:15:54 +0800
Message-ID: <CAGXv+5GniKdzf2cQfmc=usR693gJDq26kvgoUYOjhPdHFTKx2w@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] dt-bindings: arm: mediatek: Add missing
 power-domains property
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
	Stephen Boyd <sboyd@kernel.org>, Ikjoon Jang <ikjn@chromium.org>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_021609_479186_018740F5 
X-CRM114-Status: GOOD (  11.42  )
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

On Wed, Dec 21, 2022 at 4:18 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 21/12/2022 04:44, Allen-KH Cheng wrote:
> > The "mediatek,mt8192-scp_adsp" binding requires a power domain to be
> > specified.
>
> That's not true. Before this patch, how does the binding require a power
> domain? Please show me the part of binding which requires it.

Maybe this should be reworded to something like the following?

<--- cut
The SCP_ADSP clock controller has a power domain dependency that was not
described properly. Add it to the binding.
<--- cut

This was discovered when I was reworking the clock drivers. The clocks
in this controller were being turned off by the clock core, which would
result in the system locking up. MediaTek said this was due to the power
domain.

Regards
ChenYu

