Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A828DC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Nov 2022 15:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jVQsDWcty0W2Sq3nzrlgytjKBwc4zZnmbfaiPfq+nVo=; b=xw4dhL70CXIPS+VR7LmtVo/rqs
	eocpFEVaszQTPUR6Ww5iJDLKw3TTn6MuvsshfBObxfpgIWG1TBEdC1dkj0tE7A/UtEwnA1D1Cr1ub
	PkLTe0UTaSc1yLpFRf957MAO+vA6ZV/dnwRXdMIWhW4eqv7CfWf0pm9GtTmgt2mDIjWEZvQ76dhsO
	2kGdDOr72FPnFcTSIhf7iktBFFaAIUkwRUfNjK18/JKSITP0Cbph9tYLXCjI9mC/GurzA1lHik0xe
	YQGF4mom65YG6IHTkXLsP+9OJ53fqY2Uo9R0JIl+0ejpX++o0M6HBD+NufMLEbPLeJHs6P+XD5HhJ
	SI/MOu5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Ou8-00HMSJ-6P; Wed, 30 Nov 2022 15:21:44 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Oto-00HMHV-7j; Wed, 30 Nov 2022 15:21:25 +0000
Received: by mail-oi1-f180.google.com with SMTP id b126so4548200oif.5;
        Wed, 30 Nov 2022 07:21:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVQsDWcty0W2Sq3nzrlgytjKBwc4zZnmbfaiPfq+nVo=;
        b=YR3lTtZ1IjH3lJtbdYzpR/WXFmvgJ+gO5AXHBE+GYrDuq4QSdIhxSsHJE/wbSLXLZX
         i4q1BjgxObGL/aPc9ll+IYQX5jtEElmeW0DTtApfFCv2dYqC0oDLyaDyBgYbOI2RcyL+
         NVgbUQQMDUr2mf3lni0/nF6wagHjt3D7t2ZXC1TPNQZRV6k0FDoFVw/I/+W48Onsy1JH
         cZBBchZIDWTfXuXPlEpbgvu1hETRQ5GNkInFZA3AcVDM33MFcNQYf6RwvKc7hbW24vR2
         Q41l8bGJY74ayVqcm3XSJ9uzj1K1i1hXv5JWy3xV2sbincwwrRoZpScW5pimdCRp1mcf
         7X1g==
X-Gm-Message-State: ANoB5pkBaiblicqGcG0EzfO9Rr6nD1HMrc5aGV/3m7jiQw/RJzpxhGDw
	MUzU05g7or6om2+LN73IfQ==
X-Google-Smtp-Source: AA0mqf65tQ4bkkhQaj1hxke0tTpmLkf950uZWJtVKxOL1U2in72mGuD1bFpfr9voCXJ+TYxNV6FmiA==
X-Received: by 2002:a05:6808:3009:b0:354:94a6:a721 with SMTP id ay9-20020a056808300900b0035494a6a721mr20928808oib.194.1669821682842;
        Wed, 30 Nov 2022 07:21:22 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q204-20020acaf2d5000000b00354d8589a15sm707667oih.45.2022.11.30.07.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 07:21:22 -0800 (PST)
Received: (nullmailer pid 2188909 invoked by uid 1000);
	Wed, 30 Nov 2022 15:21:21 -0000
Date: Wed, 30 Nov 2022 09:21:21 -0600
From: Rob Herring <robh@kernel.org>
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Yassine Oudjana <y.oudjana@protonmail.com>, linux-kernel@vger.kernel.org, Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 2/7] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Improve pinctrl subnode and property descriptions
Message-ID: <166982168101.2188848.5173435934071756334.robh@kernel.org>
References: <20221118113028.145348-1-y.oudjana@protonmail.com>
 <20221118113028.145348-3-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221118113028.145348-3-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_072124_298034_8581E10A 
X-CRM114-Status: GOOD (  10.42  )
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


On Fri, 18 Nov 2022 14:30:23 +0300, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Change "subnodes" to "subnode" in subnode description for better grammatical
> accuracy, capitalize pinmux description, wrap all descriptions at 80 characters,
> and remove literal style indicators from descriptions that don't need their new
> lines preserved.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

