Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70646C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 12:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9L32CqPO5tpdtIdmdwuItDbHeb4WCU0OCUvAkL0z1s0=; b=A8jgnXOdQuhdgqxHYOjsVUfXQA
	hQTps8wZpIC30YoerdFNUopM8gzC/P+rnz6nx0IH9BkTxu2fNDDWpjC/JgUv1QHyx8UARp67cAgnN
	N75aUAJJifZjk5e+VoZsyXras2akJfXpi7OGyajNrQ3f4AOHf4xrMGFBzql2ZFSs4PZtjM5unAKx5
	v0J6LSjVlSJjDzQUlC3hZjFhaQOC/h9MzHULXY0YPIJIeddN3sR0YghynCXqsPc86eexCuloLDqES
	79zyFDSNLHElrFapH3M8Rkylfs6cYRuFYqBxKgsFs3Z3jkswA25UVTHD47q+LYG4tcZeUMZ6Yu1F6
	qU76hpcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osNax-005ARK-Hu; Tue, 08 Nov 2022 12:20:47 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osNas-005AMf-GS
	for linux-mediatek@lists.infradead.org; Tue, 08 Nov 2022 12:20:43 +0000
Received: by mail-ej1-x62b.google.com with SMTP id ud5so38145604ejc.4
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Nov 2022 04:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9L32CqPO5tpdtIdmdwuItDbHeb4WCU0OCUvAkL0z1s0=;
        b=PaH8zVNZFaWxZkBeTqFrrlAIn52Z6ALOySEFQbN+48YB7eswuhqFfbwMqDBq2GsSCR
         jNyGe3sfw9BsM3W78ySx+zpEwrY2gFRB+rnPJkIorUoFeKXDAokh8dE40JpXipGkbuPy
         RB9f8UlJcTdmz0I9lVinKLHKT4idjh8iIgQU/viUJUMSJI1RczuQ768aebjuYJ+Djd/K
         F22AwkMtR7jLfsJnJf0VmYF5W8lEah7PeJ+/RynLIY+zXK5/8BSsT/5YIW2ELhBGAIwq
         jD3Ar6khX4wA/0taPM3wyTh49EynpnfsTOmVdiv2KirYhA+1gxwCIOHhj5kWnni0ft0X
         j60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9L32CqPO5tpdtIdmdwuItDbHeb4WCU0OCUvAkL0z1s0=;
        b=sukHGKlSEc3ItcvY+wnXaT/6UOTiQreqcFcfDhQLCR42xTKb1PshAprue7RfiGrAxs
         gToosyBJlA25PSTLwBRldl/Qo6CNOUnxpiXPqznKunolFoy65UPVo58WEzJAFLIRGjhz
         rezMe84nkqM8a7kihcbiPEPQwo0Vb+RYUEOeaXt5eGPOl6r6NWI0LoQOwMlO539EFnzQ
         dFvML4IO4peVpW3JFZJR+H3uB1Z3q6dBjM9HiDhVcihG7cuijtCe3P/l4K/VMdvbfGLp
         TVimqdmuSGi8FjJV9p7lXEHaCwRNbQ49miNYFywh9EKocyhrKgEN//JwIbekbpBSSz6N
         h/5w==
X-Gm-Message-State: ANoB5pmpslMnLgAb0jnqkM/v8lQFY6EXQ1rvpP67RIf05GBZakB93/fB
	bUQ0MCpq/mKpmbV8UiHcS4SXXUcOlVnVTO+c1xN9CA==
X-Google-Smtp-Source: AA0mqf7E/HvXj5m2jiuxDKBMSeyESiNXwJ8GfekmAZnuir2VaYGD+S+2Vjc6wyIWXX54igq6ImLmaPPOUbp/cZQLOjc=
X-Received: by 2002:a17:906:6acc:b0:7ae:658c:ee45 with SMTP id
 q12-20020a1709066acc00b007ae658cee45mr10905848ejs.190.1667910040934; Tue, 08
 Nov 2022 04:20:40 -0800 (PST)
MIME-Version: 1.0
References: <20221028153505.23741-1-y.oudjana@protonmail.com> <20221028153505.23741-3-y.oudjana@protonmail.com>
In-Reply-To: <20221028153505.23741-3-y.oudjana@protonmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 8 Nov 2022 13:20:29 +0100
Message-ID: <CACRpkdbXKhTXNrxUmoFjuO6rmwb-8+seaj-L9ZcHpdFUuYp_Dw@mail.gmail.com>
Subject: Re: [PATCH v4 02/13] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Improve description
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
X-CRM114-CacheID: sfid-20221108_042042_580390_B467BF81 
X-CRM114-Status: GOOD (  12.16  )
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
> The current description mentions having to put the pin controller
> node under a syscon node, but this is not the case in the current
> MT6779 device tree. This is not actually needed, so replace the
> current description with something more generic that describes
> the use of the hardware block.
>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Patch applied to the pinctrl tree.

I am checking how much I can just apply so we get down the
depth of your patch stack.

Yours,
Linus Walleij

