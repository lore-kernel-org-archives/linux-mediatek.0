Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F07E7DEF0
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Feb 2026 15:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjY8IMEcwraRaAcklulnPu0XEgItry8qPQsBSr8viBU=; b=AZrWi5X3hGg2OfLlyD4Rb8wU+m
	rT0zysnUrtNJRI/CGH41wEJ5GnIdH3Y+gvxzMaoYJhCTfD+TSWjQRHIgTPAF7r9eBJSniJ6kPsYRf
	g1VsbJAzMcIH4/06cdknhtJD71q7qDOH4wqB+2mDfzjmBpYRzULJ1qiaRQDBbGLMEdqpgocgEDjoC
	yTswfFyJTV9iEdEZ2+GvCzUlZNR3CC80+Zxv64UqOdZ5jt7o77BkYzEnJ46ovPtimsjhvR2wvjoVX
	o5sTnGs7p0NC03Bmp7jYu0N6/BhB4NQ1fDtCrialCeK13QlShA0xJnNRyvfOmTxnSpkoI97w3AMdY
	LHz4xtsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmvPw-000000058xf-3hvr;
	Mon, 02 Feb 2026 15:00:44 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmvPq-000000058w6-3hyu
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Feb 2026 15:00:44 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-59e0d5c446cso5538733e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Feb 2026 07:00:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770044436; cv=none;
        d=google.com; s=arc-20240605;
        b=HjkvuVcrjrL2grIR5P4sko1GaCcm1iXbtRbdbRiTjUWTe0zawv5SK/wKdhPzcDxZoF
         w9x6IBWc5dWd1JJJrF3Gy6AMo5Q4WuCBy28pn6xGDs4Jp5UV7zj2IOyDxobyKto2fWm3
         R0R5Uw68vBotSSirzvOGo0rcSfna1hMqvxFWTKwNskcHJYd02lIb0jAT/no1d4L1B0AR
         zWiei9hKD38SYeAIitEv8CBeZM9msDajiXegHWxTwh3Y6SHp2XUVUCLFq/N75F65ES3V
         IZMZNzz+D7Eg/bPdQr3X9MVENh94PXBGGng0MFVxdizwSkxrHZWaWflniIH/cwdrlTrF
         l1+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tjY8IMEcwraRaAcklulnPu0XEgItry8qPQsBSr8viBU=;
        fh=wDN+w89c6syKu6nt9PvTLgFMrgbzUe1ibGow2+h7FGk=;
        b=XUjzBC5E6HLZ5vwH/4gCUwZSZcjxlo27KDKH4tofvnZg3VT9L0o8xnRsQMZ0yogUFq
         8ozoVGr901jZGNUTcSdXnIOrYNhOcZ5ctkdAKeFiIPbPc9iw5gCq1p9XuY3+wvhv4iQ3
         zxeq4YvFcurRczboPOTiV4H1Ltl8V0Q9ZpbXfbXn/oXuwEPlwcigRmgFuQmk0fABu2W9
         8hmG4rVFuKWCKTK9DnKpvGNl38h+UtJSSJkNoXhhYTfgBylRlDRESVywBonlzzZce/Ok
         mF+ZzymU2eDkOh2kGZsiH8Rob6anK12yf8JUGIbNADRIE6a+Cx1yuvby2IjFWkat42SM
         6SUg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770044436; x=1770649236; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tjY8IMEcwraRaAcklulnPu0XEgItry8qPQsBSr8viBU=;
        b=UNzYblhH/fOUNyeKpH5NoLSQqvgREbP//rbyMzmk6P88ED1+w3fQOvze3/mysERL22
         538C1RUReIlo9GoZ8T7i7bEkxOE8UKgmI6n2zKTutvy/eAsZbRzvK6YJfaW7Vzwvr0+h
         Yysox08Lr5IFyWD+eaNPPo/RsdL/e0LwDpAK9Sdec0Pil3P7LzLNHkqIU+wYSs5JenxU
         03hZX0mYAKKCiLFiiMhjEt72j6PyorfZNWyIPz/dw9FCqTxSAx5f0qAD1U8cCFzz2T14
         CefaBKQJnbA3mpQsYv2ZtvnB7sCwOxM6MwzxwUM099NXNC1/5fDivutwQG0d9WmvHNlz
         oYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770044436; x=1770649236;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjY8IMEcwraRaAcklulnPu0XEgItry8qPQsBSr8viBU=;
        b=oI/T8QXgDY26t03+f8mK0H9WxBIrR454DDVdp4/8FW2YkM5xmwnpAwqZsWgeYIZWPS
         1MdDDHQoImzQKfWCg4ErSvXM+qcvjlCju3DurHaYYDrVEnrvTFoYOl4IGdFF+i1JRDAT
         BhuAVip6c9vf93fFAsPsWbtTkC3aCOGsVgOIzk4e9MNrjMjaLjiL7SMJsa44tCKaKDfq
         c3Uqstg1bv/Mi5++jC17GHiPzeopDLg+d4MRL7SYp6VJyR8tUa99vVpV19LDUktdwt5j
         S6d3ob8c7gsPGxnLmXabDjmxNEfnwbh5t66ppc39SVEkZvcxAUQgsropiU1B3DTreEZa
         hKDQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+07hVcHxCecAnpCRP0+wcQjLWyWDrsiKzoYySkzZugL00+sIz2gHz+7GRHbjU2vL4lS8HiHAmD78c3VzB9g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTzDFVpgBq+JaJFlbeOv+xweHtxm7quLSL/t9eawe8gBGkiFAr
	0DVV1xHsxASRKqWdWNBOrMz/LE4rnJ9pBdNJZLUWAVjw1CRwsEaR/WX2o1QlKBX6c+H7SV7mKjH
	3GBOo3/UL2Rz52fL4BjbAd9OBLGWZ4UxCfyDU0J0+ig==
X-Gm-Gg: AZuq6aI1yY528ZVMBQ/GoZAKJ3zxts1dfxWTMhy7TeibCMUu0omS7b+SudmQowVwqzS
	Dxr6LdH/DJEj3D3VJOiGRdGdnkLpdxTnkXXdWYiObGdxEjklR0J8mCAuyVjwLopJAlfldrUPL5G
	q6i0H8ZhehVnZPP9KBIBSwX5ATHT4y8WNo6Gti243oSgdvE5VPf9gZ+zP0HzEEzRJwiSCsjvHj0
	4A25EuFOx2opSIBk6KVLVO0TvpcriahEvk7mrGDLH8NBiKvLcuhhi0p5LbEExbPnbd8aj1a
X-Received: by 2002:a05:6512:1114:b0:59d:cb2c:9b60 with SMTP id
 2adb3069b0e04-59e16443c8cmr3908427e87.40.1770044435428; Mon, 02 Feb 2026
 07:00:35 -0800 (PST)
MIME-Version: 1.0
References: <20260202064820.347550-1-irving-ch.lin@mediatek.com>
In-Reply-To: <20260202064820.347550-1-irving-ch.lin@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 2 Feb 2026 15:59:57 +0100
X-Gm-Features: AZwV_QgUchHwCanQC14NjkrQfkr08G0f7AUahWDnGm1YzWor4lHgCWR2MlI4fGQ
Message-ID: <CAPDyKFokrMP05rqbACON-ov+=diKpRfxywEqyuJHNnUk72L4kA@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add support for MT8189 power controller
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <mbrugger@suse.com>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	Qiqi Wang <qiqi.wang@mediatek.com>, sirius.wang@mediatek.com, 
	vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_070038_933910_BE4DBF62 
X-CRM114-Status: GOOD (  15.19  )
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

On Mon, 2 Feb 2026 at 07:48, irving.ch.lin <irving-ch.lin@mediatek.com> wrote:
>
> From: Irving-CH Lin <irving-ch.lin@mediatek.com>
>
>   This series add support for the power controllers
> of MediaTek's new SoC, MT8189. With these changes, other modules
> can easily manage power resources using standard Linux APIs,
> such as the pm_runtime API on MT8189 platform.
>
> Irving-CH Lin (3):
>   dt-bindings: power: Add MediaTek MT8189 power domain
>   pmdomain: mediatek: Add bus protect control flow for MT8189
>   pmdomain: mediatek: Add power domain driver for MT8189 SoC
>
>  .../power/mediatek,power-controller.yaml      |   1 +
>  drivers/pmdomain/mediatek/mt8189-pm-domains.h | 485 ++++++++++++++++++
>  drivers/pmdomain/mediatek/mtk-pm-domains.c    |  36 +-
>  drivers/pmdomain/mediatek/mtk-pm-domains.h    |   5 +
>  .../dt-bindings/power/mediatek,mt8189-power.h |  38 ++
>  5 files changed, 560 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/pmdomain/mediatek/mt8189-pm-domains.h
>  create mode 100644 include/dt-bindings/power/mediatek,mt8189-power.h
>
> --
> 2.45.2
>

The series applied for next, thanks!

Kind regards
Uffe

