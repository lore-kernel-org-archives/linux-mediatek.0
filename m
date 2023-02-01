Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B21C636CD
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 13:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pKitcKKw73X1uo1uIzQcYZyxxtvSIaIwF803pkaRmSE=; b=u4VBfH1ZUQ67/r1pAtCNt72Vy2
	CxhxSsyQDrM7ewyRlquHqixdYFiMRCwnMrSrfcTnSnTqL4HJ71f9Ce9WyRmfpRiSWYti224uGVIXm
	ZVMj/RP8TKIMp/O0dtc0jvdW6ITZlgQ625DlNIKzD9JX704Z5K3R5FPvffjqFx3auxLNgP3U7i+Gp
	7LVKuXMRJzcRmcgR3wvOTB/U1s3W37A91iWz3XWJaTjoPjf9Y1e2d31qJo9ta+dLCpbdSHTJlPf3m
	QwRKJa2WggkZy01XHUMOdBtOGYjmChdoBCZRi6SDIhtqGJ+/cftitPHQsaq7CuyPpbiX+Ijw8zhzm
	94u+rGpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNDbk-00C9lP-Ty; Wed, 01 Feb 2023 13:57:04 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNDbV-00C9fh-74
	for linux-mediatek@lists.infradead.org; Wed, 01 Feb 2023 13:56:55 +0000
Received: by mail-ed1-x52a.google.com with SMTP id eq11so762427edb.6
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Feb 2023 05:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pKitcKKw73X1uo1uIzQcYZyxxtvSIaIwF803pkaRmSE=;
        b=FhJUuGyjgf0pkYLwIlP1FpcxIZB3jRzpwHy0CX43ITrZwZiv83McD06EZgYXSO4r11
         dJobdMR8ZOSWRtyrc0Xmp8Yp4nb+hSM/6X5B0n+kJcqwp0/OagZwS+NJE7+L3tr2Vd76
         2PddzgUBgIgwgAv7OoNTXaiAN/+iEq6wD//HY3qidEe5Kjq9oSaIYl3kw259xt92DBpx
         YVpu7Z0QdUjOfnlV0STj1kPGyRHw1K3qJoYft1KBKvD0f4YhaM3aQC1xMkP2oznRJAXf
         20BIwqusiH/5Juk5cXptDlDRFa+kI+LQoMHKQWAf69g58OWBPQaQ99yEWc1MsNOFf/N2
         o7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pKitcKKw73X1uo1uIzQcYZyxxtvSIaIwF803pkaRmSE=;
        b=OHpM80RCe41XhnT80M4WzZGQJhK6wv2mAX3ktUNJ6bMVtvA8i8oNuVLWIKTA0qZmQm
         oWmEqrFwpssoBNGhYf/dqpdm6xXV+gZZhXHTvdalbTT43tieXbJC2Z0/L+yQeFo/5xrS
         HJYSXZ34hmDbwtDXBO2wkyiiGPXBNuLLRNzo1w1MkFv+9c/zR2R1JK084wt2EOCJe6mf
         gKE4H+DWAQk58Le5irIMQJ/0vqFANh8MrwLfDtZqcGmhrCW82MGxJlECM3f2p/7z9q/Z
         hDYjY4sopf98ErSfNR2dfAJ7sczwPtVblh2GjbkHk4TJWx5KhwNpWr7U0oPmBeYWChn0
         b6xQ==
X-Gm-Message-State: AO0yUKWF2iDniM8wvPPxvJBoMwf5U/TAfUVFayljP3BpN6InXzPjcj78
	BKm5zFDOoFwX/QOuLf1775T0HLKhKSG5fNQcsdHc/A==
X-Google-Smtp-Source: AK7set+fW2KmoaBx/FnBrFLbvMtCz3uygU6NdCIHnSnRTpwoLCvXeW88aNhs0BlU1KBStOhx9bPS0QWyidRRPGNGZ8w=
X-Received: by 2002:a50:f60f:0:b0:4a2:27c2:aa9a with SMTP id
 c15-20020a50f60f000000b004a227c2aa9amr643917edn.61.1675259803909; Wed, 01 Feb
 2023 05:56:43 -0800 (PST)
MIME-Version: 1.0
References: <20230126161048.94089-1-bchihi@baylibre.com> <20230131140439.600164-1-bchihi@baylibre.com>
 <ab3357ad-01ec-8a1a-d627-a1543874f0ef@linaro.org> <CAGuA+oqXN3eoVyYkjuZjefPa-q542b7QLkBv+E-0a7k3U8BbFA@mail.gmail.com>
 <ad24739b-f8e7-45ad-ecd7-6d3329f01986@linaro.org>
In-Reply-To: <ad24739b-f8e7-45ad-ecd7-6d3329f01986@linaro.org>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Wed, 1 Feb 2023 14:56:08 +0100
Message-ID: <CAGuA+oqGDSQhUGaK8D+NQATJ_c8d0egULdQ+-S0fjHwW4moYKQ@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: thermal: mediatek: Add LVTS thermal controllers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com, 
	rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com, 
	matthias.bgg@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com, 
	rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_055649_265988_7F76D860 
X-CRM114-Status: GOOD (  23.38  )
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

Hi Krzysztof,

On Wed, Feb 1, 2023 at 2:37 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 01/02/2023 14:34, Balsam CHIHI wrote:
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    enum:
> >>> +      - mediatek,mt8195-lvts-ap
> >>> +      - mediatek,mt8195-lvts-mcu
> >>
> >> What about other devices? You called the file name as generic for all
> >> Mediatek SoCs, so why only one SoC is here? Is there going to be more?
> >> If yes, why they cannot be added now?
> >
> > Yes, there is another MTK SoC mt8192 that supports LVTS,
> > I was asked in v10 of the series to remove the unimplemented SoC.
> > It will be added later with the driver that supports it.
> > just let me know if you still want to add mt8192 bindings in the next
> > version without the driver.
>
> The binding should be complete, if that's possible, so if you had mt8192
> already there, it could stay. Anyway it's fine then.

OK, I will put back mt8192 dt-bindings.
this is the link to the v10 patch
"https://patchwork.kernel.org/project/linux-pm/patch/20230112152855.216072-3-bchihi@baylibre.com/",
it will be the same in next version (v13) of series.
it would be great if you review it in advance, so I could take into
account the new changes if needed.
is it possible to resend this patch under v13, to simplify the review
and avoid breaking the series again?

>
> Best regards,
> Krzysztof
>

Best regards,
Balsam

