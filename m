Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F35CCA47B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 11:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=soHIZFMckyBtmeqmtltoqEHcx5pmrVpeNEKpf5M8ebI=; b=H0ICeRUwF9TtQhB0fzB/yz73a/
	PouW9vwUtlmuy+ELTBxAGmcwRZ/c9kvu1qPjLMAnKQoKbia2C/rZQ9e4t/hkhziVYil+qvIgnExWa
	NHSUNyaGt5ZKWS+fwbqCYiIWsN+uq0siMWwJ1snqIfGjOoPErChT2QURxSUJznZoB2ZPaOSksEahb
	JiFbgrKrW3OiBoekQ8URF3fQpe3yUrhPQF3B4K0Y5Q5kUbvvqeOJ5s1b9/qelcZX+B4Sll5b1TX8d
	3WNE25biIvlBikPcnfZzYsuZ9UjUal1B2VrEwIszWjyDiHGGiiOYzBOVJAwitSOqP5citPjk91Gil
	zypsEsbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAs4H-001ESA-9n; Mon, 11 Jul 2022 11:59:13 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAs4E-001EQM-MT
	for linux-mediatek@lists.infradead.org; Mon, 11 Jul 2022 11:59:11 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-31bf3656517so45924587b3.12
        for <linux-mediatek@lists.infradead.org>; Mon, 11 Jul 2022 04:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=soHIZFMckyBtmeqmtltoqEHcx5pmrVpeNEKpf5M8ebI=;
        b=uQTeni90X9vSpuUi2Z5c/mfpYL3euVwMP2PmnjiBH6KAfstQwsqmxqcY0z5Na11zO6
         xLim4X4YwdEHf52ak2pdFpL3D2b7tcJnB1RoIIeLPAUZOVLJ7q7Gy18TaQd10UPQ7uV0
         HmJMpvZf2ALgg68hxnRjm7Ktsx3emiUGiVJ/Hnahm1GIX3+zoTGQGtYUv2LxaBxjUyUL
         IKjs+6l3UkJrDeJizscE50gnTomp7DvCRkaNCEQyIUedn7LPwNP1kHkAgG/LpsFMuMtt
         ZUzYaUxED4sie+luA6WRGHxIX2eAFyPsgQvRvbNTEI89yQyLe0qox+qn6yaCZjYUT4QW
         Zgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=soHIZFMckyBtmeqmtltoqEHcx5pmrVpeNEKpf5M8ebI=;
        b=FLdKQVEwlmFNOo4bBit5vzlb/eH5JVsk56fOH+m+tF1S0s7xJey7Kon1KJHzx1DPsC
         Nzx+4Ss5WQSb0Q9jZC0Tt7LJNmHONipDP1xBOWYPZ0G4JBoainCquc4/XGO43x3qwK0N
         7i+cUCSPCHW2TPHhKcWfzIaX1Q2OUpJC8vUSjP0PNl8SJbBdmMHFxXoWPdkoWLsfr3fM
         G2zlECyJD2rW5VCt1oe3fZvNUp6InRcu7edbDerI24OdjjhZCRMO7z/CRGHdA5oq2s7E
         4FdoY/7m6YnOu6rSwrprXfh2sKi72qmiMHghp+Vt9QT60hxsxD2YbvGknUX0RfHPyXjm
         ZWAw==
X-Gm-Message-State: AJIora+FyJQuw6uxSiJqlDorBM/7mKFeLNSvd1b4cfc4U2gBw2viXRu+
	dQ3AfAVO8t9BxdHDt4I/PWhmCQGfkrgHV5u23H3oZQ==
X-Google-Smtp-Source: AGRyM1svUfrrpP72tLMZRihy/YrAMA4c44RQU5VYo6DXQhuXv26T2sFNwN3mldeaRom3j44YCBmi2myhto8H8sEtHns=
X-Received: by 2002:a81:cc4:0:b0:31c:839c:7e27 with SMTP id
 187-20020a810cc4000000b0031c839c7e27mr19354375ywm.151.1657540750016; Mon, 11
 Jul 2022 04:59:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220630131543.225554-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220630131543.225554-1-angelogioacchino.delregno@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Jul 2022 13:58:59 +0200
Message-ID: <CACRpkdYk5_C-cUdCgz8EPS=b4=_svA+YQFGNpXeSNboW=CUDPA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: mt8195: Add and use drive-strength-microamp
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	matthias.bgg@gmail.com, sean.wang@mediatek.com, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nfraprado@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_045910_752404_3069A97E 
X-CRM114-Status: UNSURE (   8.89  )
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

On Thu, Jun 30, 2022 at 3:15 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:

> As was already done for MT8192 in commit b52e695324bb ("dt-bindings:
> pinctrl: mt8192: Add drive-strength-microamp"), replace the custom
> mediatek,drive-strength-adv property with the standardized pinconf
> 'drive-strength-microamp' one.
>
> Similarly to the mt8192 counterpart, there's no user of property
> 'mediatek,drive-strength-adv', hence removing it is safe.
>
> Fixes: 69c3d58dc187 ("dt-bindings: pinctrl: mt8195: Add mediatek,drive-strength-adv property")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Patch applied.

Yours,
Linus Walleij

