Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75955C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 12:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pwAIz5YfCHExcR//d2Cu4bwUY83DjgUJ7OTx4aGy0bY=; b=wuW05hu7ql85H937g5dS7mcgg6
	uArpeLR4vvAYuvGi2zHVkXyRLmLm0SRYFLkd+ivmR56hYhTJp4hMQZtQZcdC8snf+hugN9tlUq+AO
	b8VZyNB7wQUp37GZMKgQNdN0XA5rM9auuCK+bs3rIC8+xCWrLDBwNUAlrdd/oNXT99F+VFwl+y/v4
	SVnBh9GmqWFHc5SmpSIJbYnn4gJVyEtGVmtwVKfRDx722dt/TTzb6OCnBac1y+QifGJdhjiTjIepk
	3/JAUpKKMLXE8pAMyYLIRtfmHY3doBbWkJs4R7pwqZmLuGWzz6C8eaietZuEuyandQP1TQv0ZRWrB
	5gtaL3QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osNcc-005BGO-6t; Tue, 08 Nov 2022 12:22:30 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osNcH-005B31-KI
	for linux-mediatek@lists.infradead.org; Tue, 08 Nov 2022 12:22:12 +0000
Received: by mail-ed1-x536.google.com with SMTP id a67so22157992edf.12
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Nov 2022 04:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pwAIz5YfCHExcR//d2Cu4bwUY83DjgUJ7OTx4aGy0bY=;
        b=rRtHApUTLpmrb49VLXgA8lhpuLIaEa3606cZ54m2fuII2W/So0ITWAFEOlZ4VuODIp
         Y1H7bruRbTk/hT6r332Bqpy8CALuz4SrqJDFgAJbiafdnlD2qSNL4JEt3+uPYsEauc4q
         IJrPM50qDhnfdQUOP2RtMMkVr+RJ+6l9aY/Z6P8K47uU3TuE0Vl76mWT5HD+CQyLB9Px
         +LhD4z36nZDK8oVfJwJ8tNZ7A/MmL46f5Hjvagt7FRY8BLsHcxIVLeayMxhvMvZlJBnm
         iSxKSJLnrAJDXMGoJAp9cdhSWAGePaD9PgLbQuD1A4qIIY1j3R2pRC5qvqi1vc7oX5WV
         xDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pwAIz5YfCHExcR//d2Cu4bwUY83DjgUJ7OTx4aGy0bY=;
        b=pkby4rztl8Z1u/hoayJR8oG8lvs/K+tp02sNMJlabQsaxTXxlDX7PJoRhwltyPy+2i
         yp5b0vo/acb5aCoiE7ZXreqFMNzbFu6KARsyLuR86y1V5cVAMrnOVK27qQR9U1QrP+lw
         rwo50mM4ImLFtlICSnzCPcJlNySSCcRYlaT5RKryPASGl6/ppk9Z9JE1zzhSTkYrAVQx
         PtB9UlpluvYHpv0fBpnQNj+TPa4FbqA2jPVX02WOgEAxIw6vK8qFNCXBwEX/ycKAHbJB
         wB2oNw2kAW0vfm1wsOTDswVLbqR4Xxwci4ZQZ6A6a4WYfqEFKJCa26FjD1x4fV0ZI/J/
         +KLw==
X-Gm-Message-State: ACrzQf13LIo8/IuoC7y0uSoo99CiEW9gQ82fb5zH/PRLwMHSSOamBqdB
	YDpbs4qcinVIuP82V0rReIQejv03JNBZBDAdtyL3Ew==
X-Google-Smtp-Source: AMsMyM6Fgdh9c+uQFDawnv1UbeThmCU3kZMq94IY+4QXNwDLtyC7UETuZQ23UkDyD8Oirb1FDA8qn/LXTheGxCkZ8CI=
X-Received: by 2002:a05:6402:659:b0:463:a83c:e0af with SMTP id
 u25-20020a056402065900b00463a83ce0afmr900244edx.158.1667910122493; Tue, 08
 Nov 2022 04:22:02 -0800 (PST)
MIME-Version: 1.0
References: <20221028153505.23741-1-y.oudjana@protonmail.com> <20221028153505.23741-5-y.oudjana@protonmail.com>
In-Reply-To: <20221028153505.23741-5-y.oudjana@protonmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 8 Nov 2022 13:21:50 +0100
Message-ID: <CACRpkdbquWk3F=3CrkSWfWkWFQpzRPPbE3nL+zcuBx57aW4WYA@mail.gmail.com>
Subject: Re: [PATCH v4 04/13] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Add MT6797
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
X-CRM114-CacheID: sfid-20221108_042209_745986_C528EC0D 
X-CRM114-Status: GOOD (  11.41  )
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
> Combine MT6797 pin controller document into MT6779 one. reg and
> reg-names property constraints are set using conditionals.
> A conditional is also used to make interrupt-related properties
> required on the MT6779 pin controller only, since the MT6797
> controller doesn't support interrupts (or not yet, at least).
> drive-strength and slew-rate properties which weren't described
> in the MT6779 document before are brought in from the MT6797 one.
> Both pin controllers share a common driver core so they should
> both support these properties.
>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Patch applied.

Yours,
Linus Walleij

