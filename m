Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685EDC6FD18
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 12:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SBertetORVW57D4Qn1kS8HxfnJyMQ3NfyoVt6rJXeWw=; b=X/1/d38EVQhh0XhaPKoBuOarnL
	0v09L10AbXOPzP+d6156K3P+46Tgd0aHrkWJz7L/IVOPGhNQPCa0pBJI5TrPlwS9GEToGRk0ZDb9G
	iaZsjP5SvylUhV3PNzGf/E5KaHckuNDH4qdTI2Byke+vogyfLs8hP5vMNS+Yks+xZr+GqabhpkVjb
	6NRyAGcz+NJXtL5MqHD0LdiiwaftbTSw4s1mPyJqIEiYRKoXpWYjGAuM21d3WkahAFnjm87ouBRBA
	McRsDvjRzeysVAxXYTaALPlFZbg86xikRfds5852NW1IQoBO7gaGuFbLgDTZv3PV8sfJKI6FFGcGR
	ZxpLgOnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piDVf-007Cuv-26;
	Fri, 31 Mar 2023 12:05:35 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piDVb-007Ctx-30
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Mar 2023 12:05:34 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5456249756bso410607247b3.5
        for <linux-mediatek@lists.infradead.org>; Fri, 31 Mar 2023 05:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680264331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBertetORVW57D4Qn1kS8HxfnJyMQ3NfyoVt6rJXeWw=;
        b=jJYKQuohc4q23MSrpDjfNbvItKi4OeXxV/JiVsMH1u69/oc+hhZnHl+qafU/eiH4n6
         fW+LnLnJ1EbzJrlZrmw27H30jZAlcHuAElxlUoo5p2XHokmFvACqJ/swhGjAQ3WNqWco
         DumOcwmKSRpfirCl6ztX/cQNURZ8+AB/lp1zGF80Ul/QKpbuTucfgL8kH8y1HF+8j+9+
         yq8jO/0GALbIjk7DOXxP5cnYW/SuxOZ/j+PBe9ZNyRhAoEyiR6ye1iP69ZbVcGpU3a+3
         nSQ1Lhe98iMsb8F3ZOh6VIDOIfw5wXQQjHoL6I9b4Rp0OkH3q45tYXLqlUmlP+IGCdL1
         6oLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680264331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SBertetORVW57D4Qn1kS8HxfnJyMQ3NfyoVt6rJXeWw=;
        b=WLvhNpTEgPjAilUOnHrGM/HJHqXFUXm2ICh4yvwMmHVE/FxwmHkevdxf4s2QoIuL6w
         PAEyx/iDuWZFnk46zz/q8yyVG4Un+BFok90mgRmGynOJk2dYWK0xPNQa8F5vFJW/g8Kd
         CDfFZY1mXR5UPojQIDIznAb4zDMecUs/hSzf/RP6519OIl5p+IffmBBv6UG7SVI+WSyJ
         uK21/1iYu8pYRRbECp5GbWO6yxR+8O2lrxFtgP3+e9jwhJZMB76bTJyO7pEGK04jVRkq
         7bMJ1XOnoeEW73jUePbruLoOePVUIfzI4vKLQvoZxZCrPJw016ccOK4qTtwEgn1ILEtt
         VlHQ==
X-Gm-Message-State: AAQBX9eypFK553xrasiXGSRd6R3c59h7FhGmX05cKTcrWMvgxpYFIcOE
	qVs9hoFGdxpHGI02eZsJU8fmfvrDRodI0YCcpkwVjA==
X-Google-Smtp-Source: AKy350alOUKFv8JHxb8OmChOgvitPrDAx4h8WLR3fhEV2ib1x87O1DkuqB5uGPeBCLNGixpUYQPibS7V5oz35p99nco=
X-Received: by 2002:a81:ad5d:0:b0:540:e744:13ae with SMTP id
 l29-20020a81ad5d000000b00540e74413aemr12477767ywk.3.1680264330881; Fri, 31
 Mar 2023 05:05:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
 <20230203-evk-board-support-v3-16-0003e80e0095@baylibre.com> <8c917be2-e15a-921f-aaa9-b8753d2463de@gmail.com>
In-Reply-To: <8c917be2-e15a-921f-aaa9-b8753d2463de@gmail.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 31 Mar 2023 14:05:20 +0200
Message-ID: <CAFGrd9oPKn84yK2VpfJQRd1HbBTwq87Fuc6=Uw3uaeLjm89=8w@mail.gmail.com>
Subject: Re: [PATCH v3 16/17] arm64: dts: mediatek: fix systimer properties
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Zhiyong Tao <zhiyong.tao@mediatek.com>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, 
	Fabien Parent <fparent@baylibre.com>, Amjad Ouled-Ameur <aouledameur@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_050531_971396_31109C4F 
X-CRM114-Status: GOOD (  14.21  )
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

Hi Matthias

Le jeu. 30 mars 2023 =C3=A0 19:34, Matthias Brugger
<matthias.bgg@gmail.com> a =C3=A9crit :
>
>
>
> On 29/03/2023 10:54, amergnat@baylibre.com wrote:
> > From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> >
> > MT8365 has a SYST timer (System Timer), therefore the compatible node
> > should be "mediatek,mt6765-timer" instead of "mediatek,mt6795-systimer"
> > (which corresponds to ARM/ARM64 System Timer).
> >
> > Plus, register range should be 0x100 instead of 0x10.
> >
> > Finally, interrupt polarity of systimer is LEVEL_HIGH.
> >
> > Fix the above properties accordingly.
> >
> > Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>
> Patch looks good but does not apply cleanly because of previous patches t=
hat I
> didn't take and need rework. Please resend the patches I didn't queue wit=
h the
> comments addressed.

Sorry for that, I forgot to drop this patch since it has been already
fixed in the Bero's series [1]
I will drop it for the next version

[1]: https://lore.kernel.org/all/20230309213501.794764-4-bero@baylibre.com/

Regards,
Alex

