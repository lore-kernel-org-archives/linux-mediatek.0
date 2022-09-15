Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E623EECAAA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 05:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z1u0N1ZJfcMPueq2SWcO4i8OlPSVWclmpIeRHJIVStU=; b=mvMS11r7cjc30fAwMa8RAn1YUA
	qIV8kiG2q0qe2ht9rdbhJgiPybXw/vtRyVQTPXl+zIhKq0fk5ccOgN1qc6yKGYMJzwi1hKNJHWv84
	B9HtMsSjTPLWV0VE25JyGBEHIV1g+CA/4O4eeu+V6pG7txHe9jfKEd1KvZcmWGkpBp1Gph6CFfEJQ
	5DE+9y2QYv3OqXrnrrInOnG5QbBessvr2epQLQYtX3odaryjxxoY+yE5P0rCGlo6Y7t1O4BGdfmJ/
	Fhkxf1+UQP5ThbHmsNTkfkf5tpvaK3hbp2YXOFySYMusgpmaGFAov79kIVHAMptYhkeAv0qeSzeuC
	VlyQXVww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYh88-000Bzh-4J; Thu, 15 Sep 2022 05:09:40 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYh7v-000Bga-AT; Thu, 15 Sep 2022 05:09:28 +0000
Received: by mail-oi1-x235.google.com with SMTP id w143so897972oiw.1;
        Wed, 14 Sep 2022 22:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=Z1u0N1ZJfcMPueq2SWcO4i8OlPSVWclmpIeRHJIVStU=;
        b=JBIj0fTNeLAKOYOxmzHscUM5+aL1yw70MnW5/dh4qZt+6ZsxY+3J6EwLHZJmvtQ2ip
         Z64u7zK5t9lOjjkZ74nGP7wpPh+iBg41jE3CqJXAsXHzX195IOemhLPsfiDjrWdFW9iJ
         lJeAXwXii8LAcHZTJRKSAFy4xUD6uFHQx44HwX41zw2RLkBxwhnrJRJNLZ0SBBHUgrp7
         AaDk9+VY/aFtnQMMQrvVUHAsYWXnNPxJfBwG4PywLUMgR8a0GeQxlhW/+Ezj6XJOtv7e
         4E5Y0Gwu/IdTrGuaiG4BAzgmbIBgeWt3lgKdg6WOSpqbOkBCw5YfyDvVKTkNZU3GI4cq
         9dWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Z1u0N1ZJfcMPueq2SWcO4i8OlPSVWclmpIeRHJIVStU=;
        b=mg0nLIbiO2KQNbMSvkFxh/YzlmSnmFrjIvrseYXi4wTiWQxoaTZZkgS21ciqpyssbh
         PqXlz9kxtABvkTMTviSGAalyCycL1QVAsaJtu0P3w6TUjRuRVNPdaSE4yd7w8AKMb2f6
         wPSwaQWxuTekANXxOJGiTAqEbOYS2wKqz53F6PbV34XX1dzxK9DdE94Aw6Q2jFCK29WF
         6KdFMmAKRgzSgylvTxRBpfCDHEzvaCmULC7b5KpRR2nSvpx92LGUQ2FE2U736u4E5ar2
         gDHXz/pZJ+Pw1GiwD7XSBvgq1+ZTvDqZcWgBqXmmRaLmUgZvrvUvZHMR8YbWEUEduxk3
         ZrZA==
X-Gm-Message-State: ACgBeo0iTkao9aQKq/A5iNGilvSruhsk/PipJg+jArIrYz+PwyD6nNV/
	nZtIv0ZUARLoY8iBoxn4puaHtI9OgNRqNgwIqSQ=
X-Google-Smtp-Source: AA6agR5i/Bh3pO/9k18kWiTkxaxJwPRYNQzlq1eA12nfEuyi040sOX1UtxWgnNRcqiPP8+KBdgABsT/lEkeVGexV2sI=
X-Received: by 2002:a05:6808:bcb:b0:345:aa85:6f33 with SMTP id
 o11-20020a0568080bcb00b00345aa856f33mr3479669oik.83.1663218565430; Wed, 14
 Sep 2022 22:09:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220914085451.11723-1-arinc.unal@arinc9.com> <20220914085451.11723-9-arinc.unal@arinc9.com>
In-Reply-To: <20220914085451.11723-9-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 15 Sep 2022 07:09:13 +0200
Message-ID: <CAMhs-H-zYdjHX99vXpeDerhMNbX10BWtUq6WSeAHyDNG8ruXCA@mail.gmail.com>
Subject: Re: [PATCH 08/10] mips: dts: ralink: mt7621: change mt7530 switch address
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, 
	DENG Qingfang <dqfext@gmail.com>, erkin.bozoglu@xeront.com, 
	netdev <netdev@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	"open list:MIPS" <linux-mips@vger.kernel.org>, Sungbo Eo <mans0n@gorani.run>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_220927_385468_4D2DC82E 
X-CRM114-Status: GOOD (  13.81  )
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

On Wed, Sep 14, 2022 at 10:56 AM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arin=
c9.com> wrote:
>
> In the case of muxing phy0 of the MT7530 switch, the switch and the phy
> will have the same address on the mdio bus, 0. This causes the ethernet
> driver to fail since devices on the mdio bus cannot share an address.
>
> Any address can be used for the switch, therefore, change the switch
> address to 0x1f.
>
> Suggested-by: Sungbo Eo <mans0n@gorani.run>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> ---
>  arch/mips/boot/dts/ralink/mt7621.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

