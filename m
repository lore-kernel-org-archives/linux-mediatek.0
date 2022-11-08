Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9883C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 12:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dmDShQas36dD47uGMxvPlh2813rtPjLDfwhfhXJ2dxc=; b=lq0vlCp5l5wqYXmfRRoR6U92cy
	ZY5wOwjxuS86NWcRXVLNqsv+El3C3c8pMuGS6I5Ck0eGTvHrY08BYgeQmL259VbXBaMnJMkF4cpdV
	cw20v0nSZ4Xi9B+zm2MqbBWhcQYqbxNS4obU1LHFAAOp4iwatqnZTLWBBgjoRZE/Hc8IGQwHkQkGx
	nvhwsZrbBZdzgnN0C+WaptOb0kVTECx8CHinnQuvl2WB+jvtnd5BZjFaLY/I1xNOil+I1NXJyMJH7
	nEhsor+40JKbSVI1o9CMmdNxSAjGeOSqs5qlIIHTq0z6JyiN7C5dXAHan4/A5enHRkFGLDW/5WJZW
	ugAif2aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osNbf-005AmQ-7B; Tue, 08 Nov 2022 12:21:31 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osNbP-005AeJ-Ma
	for linux-mediatek@lists.infradead.org; Tue, 08 Nov 2022 12:21:16 +0000
Received: by mail-ej1-x62a.google.com with SMTP id n12so38037411eja.11
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Nov 2022 04:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dmDShQas36dD47uGMxvPlh2813rtPjLDfwhfhXJ2dxc=;
        b=zzZvUa+kn9M4LdUavXU8BveFUJ8sU8c0cLaSZOAQAh5EZdN2tfmviS8k0Zavi8DIel
         /dBmC5zWcS9gq/LQ/SDLrCHtN0vhmDWWfTNTACxTfyLvLtjFq//hA5Ijx/XjFl2tYpUR
         S/tdHgCAWFMjXAZPWORRTvFaufVSwUPEMBRK5GVO4YUhnIrV5pPjYcGMct0W7728uoD3
         IAMz73S10iBaN1IKsfiCVgfbA4jun7k/2163Q21nOT0zSLAWe7gAlVO5WuIwaMDAaluk
         OUmhpA58BaClzFN04y93ABrlYvNRckp7aGznHEJW7VNYz3pUJZ5I79ZnxPc/GRmbk4bw
         BtCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dmDShQas36dD47uGMxvPlh2813rtPjLDfwhfhXJ2dxc=;
        b=WzDs4rDco3I7kWWU45Lza+zJVJF5uqm4+8ZljNxTMSmHQVvIycsoMnZZd08m+cmx1T
         XoXe9PZTxpFUjKMiNkZER/h8gd5Xuc+w6jSBYhBgIUUQErT2fXmweoyHw5rUDWoJK3oF
         Ns2Acc4M1JpnPxuvXtdMvevJ85KpKlmVdw8Otxks4SJoUS3fDECeFTDCmzxZpHpKiGm2
         UCZLTfLODykGgU41Fh3R+5GVNA8cbhur80VDn06AjJEF/LAiJCXEOpDPGJ+HPxxQ6Pec
         k6/NG93ArPI/DqJ6lb30ipyK90skgSrN42cVP6dWkvDAUlIVHB7f4AK4pw2S7fgdzX6e
         4n3g==
X-Gm-Message-State: ACrzQf1JLFIapHD+4wi7iQ+lFR9nuSrYRLE3XvAev6b3MTt5zJPgV67e
	rQqoIzN0jdlJWy039AqUAg57xrmtrvHO6ToEMZSmOg==
X-Google-Smtp-Source: AMsMyM7XWqou6nmQNE71q7T1t2yLoNihbYJr+6ZowdOGs74VIQIL9SSg+uc7KcTEC4HyYqrCBRtBbqd7X7SEY2qwhDo=
X-Received: by 2002:a17:906:4c4b:b0:7ad:a197:b58e with SMTP id
 d11-20020a1709064c4b00b007ada197b58emr53775608ejw.203.1667910073486; Tue, 08
 Nov 2022 04:21:13 -0800 (PST)
MIME-Version: 1.0
References: <20221028153505.23741-1-y.oudjana@protonmail.com> <20221028153505.23741-4-y.oudjana@protonmail.com>
In-Reply-To: <20221028153505.23741-4-y.oudjana@protonmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 8 Nov 2022 13:21:01 +0100
Message-ID: <CACRpkdaHHDQt4_u-Y3KZiRuOuZSGd7HUydWJttW2p6NfXaveVw@mail.gmail.com>
Subject: Re: [PATCH v4 03/13] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Make gpio-ranges optional
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, 
	Andy Teng <andy.teng@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_042115_743309_96BFDBD5 
X-CRM114-Status: GOOD (  10.46  )
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

On Fri, Oct 28, 2022 at 5:35 PM Yassine Oudjana
<yassine.oudjana@gmail.com> wrote:

> From: Yassine Oudjana <y.oudjana@protonmail.com>
>
> The pin controller can function without specifying gpio-ranges so remove
> it from required properties. This is also done in preparation for adding
> other pin controllers which currently don't have the gpio-ranges property
> defined where they are used in DTS. This allows dtbs_check to pass on
> those device trees.
>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Patch applied.

Yours,
Linus Walleij

