Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C27B1ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 09:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jCIOhLvVlvNV9HUxfecamktxgICT/5zf1IRbWZuyeiY=; b=UMQjXRiN2lVOHSJSw4vsYTnGau
	oxZmPTtukQ89fhULYQ+4VSJMtq9FEWxZAcmiV6qOySE6g1JKASgvnyM1rkLKW8jEIihFl2DS+2JKG
	wq5s8qlsaERmXZSz7X3qYnS1EDDBHU6aLgnPQRN8UQM00NjOekFNxgL7mHeexZsLYn6U6e4dJKQGK
	Z7OQipdlcp6TYmKWHfe9/wVNG5bCZjhXd4SrSi+nVJC8bTcub0LgzeIPcRtMlvEUQj/A0tdgYwc5/
	zp6/nU/0e+hky8FLmj9AJCg+oEXizcQLPr+A4/T3Wxh8UnemD9gKBR7otWCmzspxI0VzOWzhT2JkS
	pMZtu6qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYOn3-00EIuF-KD; Wed, 14 Sep 2022 09:34:41 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYOWH-00E4Aa-1Z; Wed, 14 Sep 2022 09:17:22 +0000
Received: by mail-ot1-x329.google.com with SMTP id v2-20020a056830090200b006397457afecso9870345ott.13;
        Wed, 14 Sep 2022 02:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=jCIOhLvVlvNV9HUxfecamktxgICT/5zf1IRbWZuyeiY=;
        b=YTvc5L6w5aAWrmyBdY3nw/N7B+xVvMzdMLZrPugoPa0yCmTHuZfPxLpvc3UjWheYmA
         LXcAbiY4XkL+8OevtSbLTgZbcxC6dPUMLYkkyRcNWTI+wQkA6Oba6EfSD49HitSTFhDi
         VSX4k3c0hjnPYG/Omp5Xx+K9zgNwTuxj8Kzkw3hu/mUDNJJnjgtJRif4Rvg5rcKRghgJ
         lpbM4x4dKXcVENLNlylRAlj0wD4KHWf98MolUbQG1q+w2PTvusOu6yc0OUODJVqO3n4C
         bZ0gMq1iXkiy4cm5ikT/5ICzgYVc+1cTsJC90xXVgLbssYJuqqOd5BJUPTnmQDVAoH8A
         VRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=jCIOhLvVlvNV9HUxfecamktxgICT/5zf1IRbWZuyeiY=;
        b=1BG8fgq37RLUsV8Nca04EqlOC88bxQK2AoEmMldTE6UCC+RnxudSf6yfVSGdrFaA1+
         p59iInfIuCZZ43JlBuwvzNaHC3uxnuNyTH4r4E69Ckeanib0mH3zjJg7/rAZ//DH49kQ
         8/23O6F3+Ysa9yJulOnkX0yNTja39qnBGil0Eupr86j/yo1DUlVnXwj8jft7iGqnLx8U
         u7mpDN9V2hAu5ELyrJ5XqC9MwLFHclSjHYFn6uEsYGZUIiUruSQN9VrQFmxscKZ/vf60
         4RFft39fnJ74KcV5nkgZszR7+lY8hYyw8x3OtU2aKDqGT60skeqSQd2zuYwO/ApNojAE
         UkyQ==
X-Gm-Message-State: ACgBeo1JUKmCwNkwCaRbVtP53NsERYTinqLHd/77/AJLnr+BEYsm7fCm
	czJrgx8nMPR4gS8arovC9/76i7/ZgBMMq4oIOzQ=
X-Google-Smtp-Source: AA6agR507+omkOoy6Eobpvj7z6t0NT9B9qdaVUmwFrPTtBPz0Sqn1vie6TfYUrdK1+KUiEUglrxPNs70gq8gwNW0amg=
X-Received: by 2002:a05:6830:150e:b0:655:bc7d:1e5d with SMTP id
 k14-20020a056830150e00b00655bc7d1e5dmr8562142otp.272.1663147039255; Wed, 14
 Sep 2022 02:17:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220914085451.11723-1-arinc.unal@arinc9.com> <20220914085451.11723-8-arinc.unal@arinc9.com>
In-Reply-To: <20220914085451.11723-8-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Wed, 14 Sep 2022 11:17:08 +0200
Message-ID: <CAMhs-H-XRGz5UCkEzOJtBSC9nH4kaw45ziaqfobt1wfo8gDjbw@mail.gmail.com>
Subject: Re: [PATCH 07/10] mips: dts: ralink: mt7621: change phy-mode of gmac1
 to rgmii
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
	"open list:MIPS" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_021721_133784_26217CC1 
X-CRM114-Status: GOOD (  11.51  )
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
> Change phy-mode of gmac1 to rgmii on mt7621.dtsi. Same code path is
> followed for delayed rgmii and rgmii phy-mode on mtk_eth_soc.c.
>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> ---
>  arch/mips/boot/dts/ralink/mt7621.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

