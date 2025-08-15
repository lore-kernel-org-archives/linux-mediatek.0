Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D7CCA0ED1
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Aug 2025 03:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HinHQKZUtxe4t41iR9D9bn+PEZ105vFBbOQmMnTwk9Y=; b=ix0PkbymLJAWNK8ymLiFgQR++s
	WvcFT6sZ40jEl2W3zUrJ8Zss3H8nNlEHxYpOyDsjUOwmhoTVzsf1Pu39ngghb7JAerTR9rJOwSFEG
	HudI+CZkuDG+SIeNUE6YzGyLp8qg0mk6l63xuCSuJBE4eApqBV051fGqyEkhQCMBBSj6AsMcROwp8
	u74ow9qG/8Y+AqYZL1tTo/s8WEbD4oHfcriNJE6SHZ4VDOmvIJvkE2GC9mKpPdjfC5jDSwTGDsMbs
	FLJFJw6RePvcoFistxwzbuAZkF+no20DNIswUfYWgAZWhc6e5an4yTA4bOqYTHQGrYOSMi3WoU0Dz
	f1FCycSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umkjT-00000001FLA-36A5;
	Fri, 15 Aug 2025 03:03:55 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umkjR-00000001FKT-0298
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Aug 2025 03:03:54 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-55ce52b01caso1699237e87.3
        for <linux-mediatek@lists.infradead.org>; Thu, 14 Aug 2025 20:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755227031; x=1755831831; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HinHQKZUtxe4t41iR9D9bn+PEZ105vFBbOQmMnTwk9Y=;
        b=esfbJXg62k9CrF2RJZCIsRu2Xm/TA4n/EzPo0PuB9mG3Q0KnM+nN1bvONoMnAda9Mb
         ilM5pxPFXS/yVyeipE2IPNAt/+JH1fUQrHHk707yyvg/dQgFiYyJR3GTLnwtNfoarv4X
         NO45xKNPwRBgbDHyDaqRSdaQAT0id4IKNftz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755227031; x=1755831831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HinHQKZUtxe4t41iR9D9bn+PEZ105vFBbOQmMnTwk9Y=;
        b=ccZnWk8ruuQQBeaaZcrKQ/xdTOeMyydmd0vHoVqVKatMurxVZ9NKnPLY7fMu6fS0Aq
         ELrSgdNSAO4HvWLn8wxP7Ks26ai4Wouhpotghlzb3oF+Rodph3+jxGmoB0MuduzqhKTa
         s+hRh2Vjn7ZNEl4Fv+8P+i/1VTQ8LuZbMp+6o2Ylv5QqNddGFneoXRlgmd7nY6PHmP4v
         CoveEt1kssXnlDTWyh2sA7F/wpjMuuLHDHwdxOmC3ObnJzfojrNYiHbZ4ErsSraX54lc
         tJFQQQtvK+yonGSuJ9yPpur3QHifU/b8tZeh71QUos5cXr0szlUtRCuE5yXnPbQvNu1m
         nPqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXmxAFq++5+mlqR395LiqeWIAScDX8w69PIo/vY9FVS2K9OVaPBMgEhk5nfFJ5axjHwoGjwJ0pDVcL9aAHQg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwOBTVu4k0LTEP2C3CNvX8eVMvgWbhgiSaALUnOGU2h/P6xpEGo
	hZo44m+a7jGp1bECKoFmdjAW7ylRHL2JHg358nOzXNT2P9nr4UXhMrCj9Xs8+HH6coM/4/5Iyig
	rTUL6ke0bE20SPl4kKTjjKmLkcE1b6IK3gnUJJSq2
X-Gm-Gg: ASbGncukd16vsijVngpl05evvdt6xjuCM+1nuBuklMtvX96sVke9idFRO6KRTZq5NVY
	FVht/CgvSKz0T6powLZe/HMcmkF0Q7x8Wf/d83Hg6TnJXkM33IJjTP7PJpLzjc65POBW0PBdNzR
	MFPNCZO5nFZXPnnij6oL4RobMEpg805Jz2IsSfBZu42BTHTSdB8HWb8lWCi1mcZrEthmLdvRgZn
	A6ehIX9It8XbyJGkGa2muXyePi1i+HVm6lvJw==
X-Google-Smtp-Source: AGHT+IE5oudoWOuExXFcWc613ObdeU+xcba/kkjYM4lQww+ElYzSmi2/gSXFiaP7UzcFCgh/kx+W9zwxu3OJ8SIUDuU=
X-Received: by 2002:a05:6512:1104:b0:553:a9af:9e43 with SMTP id
 2adb3069b0e04-55ceeb906demr143594e87.53.1755227031067; Thu, 14 Aug 2025
 20:03:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250805135447.149231-1-laura.nao@collabora.com> <20250805135447.149231-2-laura.nao@collabora.com>
In-Reply-To: <20250805135447.149231-2-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 15 Aug 2025 12:03:40 +0900
X-Gm-Features: Ac12FXzlE2kni0q5NyqXgX7d170kjvAVh0V3KwwS63urIxRRXRRBW2zdHpmR4vA
Message-ID: <CAGXv+5GDU45O46A+mpdu1HQ_sfT2Su4fgFCtr4xPjoRPzwOWmg@mail.gmail.com>
Subject: Re: [PATCH v4 01/27] clk: mediatek: clk-pll: Add set/clr regs for
 shared PLL enable control
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com, =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_200353_063538_3FA1359A 
X-CRM114-Status: UNSURE (   7.86  )
X-CRM114-Notice: Please train this message.
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

On Tue, Aug 5, 2025 at 10:55=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> On MT8196, there are set/clr registers to control a shared PLL enable
> register. These are intended to prevent different masters from
> manipulating the PLLs independently. Add the corresponding en_set_reg
> and en_clr_reg fields to the mtk_pll_data structure.
>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

