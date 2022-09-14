Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404A8ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 09:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dKB74mBldf0ryE7wHaQ5c2RXlLTkuN5Oo9MVuStsjik=; b=AyUvxDkFVDUTXpeHcGl1/YWCzx
	sy0msOJ4xc3E5udC0nzs4F8DuJ2ytTEqV2lQTJ1e2RJ4FrmslDUlG/9cxwnpinpMJvWdn+WCKrX9k
	73O/yTODsNKINNnGPNZqaSU09R5SHr9+mgpjxAhHT48NMVwcDof02OxVIJA5NeH0hWWTNdflBUB0k
	4UHWWYtqwHl8S2L96FqJfBkCIDU4Yf4JvTsx2tSEJ/E/KWCIsBAZyfQRjby6Sk37uYiHk5B+jtONF
	sC5MoIzLL/uDkS0wf4xaiLD9Sg9JT6M2bfKeC1wq/ew0L6Gr6LqvBbzQxmotX302NlE1CrOFiXIyS
	TptAaMoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYOlr-00EHwl-4S; Wed, 14 Sep 2022 09:33:27 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYOUx-00E2mH-BU; Wed, 14 Sep 2022 09:16:00 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-12803ac8113so39242139fac.8;
        Wed, 14 Sep 2022 02:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=dKB74mBldf0ryE7wHaQ5c2RXlLTkuN5Oo9MVuStsjik=;
        b=LQrcEfQrlyPgojX5I0QYZZZks9ECkgcggZXX41UcDISBB+0WfHaJpmDgtUvBZ/yF4N
         DKp9QgRLsTGr2fzzsk3qBOwytacITMoOhRbaCaeSrMxCV2OddgNiT206nZ3wCI8/Vb+4
         RqgQ77kxCZOve4LGBZKZNMDX91Sge2/iKWGlmSHmLw8UIbiMtn1LWEDnX36JMvDWqGuY
         wkZk5+wxLZ9PkDKRhLWY6zi8tmxLAB8vmrV7a7efQD4i2rhoYYyi3AAxWw7S/mGtQsUN
         QO0+BeyNaEK5hribqjTsQZMg/jYR0Ffi1UVZ0QMcYsOMpPb9HnDrn09aHidu6m8oLs99
         WQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=dKB74mBldf0ryE7wHaQ5c2RXlLTkuN5Oo9MVuStsjik=;
        b=mkeNZb5NkX1JsTSnbuxr6T+NW5BwNS5HpSLfIJ53C6EcpyMWWnvH6Lx9y49ub3eZje
         /e10npQqPt+YyLMtVWQ/8NuKD0RSXQ/ekoEJLpdSsAuckizL3PRuoDr6FcdYUX6iR7xo
         6yeCHlTz5xp5/5Gj+WhKq9rsR9yY1LTSMjtfKhjOTEYu+kFiDpdTR7pJHZwjkKcKk+t2
         Z3G7jJB/ZkA9ocvPfkEgNNAYzWPHXxz7C+8UIEgiIwlrU4xCA8JqBirzvXG4j5jYftZg
         C3cnU2VsTbu5RpkajkWoQz8lVflnlo1zD70PIDc7pzqRjYn5jY6vveKtnTHthnfR0Xv/
         VDsA==
X-Gm-Message-State: ACgBeo0dkE1rupn+UvTgxT9qsxEPfGc9h+TxEDRnRAMlygT/jPc9Mjqc
	X1UHWqzazc2mrZ7ufKwfyz/kY20l01B3XVd+KdU=
X-Google-Smtp-Source: AA6agR6nLizzgsdW2MtHzQMBHn9DNm9fpJhbQUUIbEXzsw0znlDW/B8uuj/JwEk6De066e8MWwu/aAwd592JAvzdEEo=
X-Received: by 2002:a05:6808:1b22:b0:34f:7879:53cc with SMTP id
 bx34-20020a0568081b2200b0034f787953ccmr1433120oib.144.1663146957744; Wed, 14
 Sep 2022 02:15:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220914085451.11723-1-arinc.unal@arinc9.com> <20220914085451.11723-7-arinc.unal@arinc9.com>
In-Reply-To: <20220914085451.11723-7-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Wed, 14 Sep 2022 11:15:46 +0200
Message-ID: <CAMhs-H8C7QagLK-5+A6U647Lf6u6GbUWNVT3cX1uE8DKWzd-7A@mail.gmail.com>
Subject: Re: [PATCH 06/10] mips: dts: ralink: mt7621: remove interrupt-parent
 from switch node
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
X-CRM114-CacheID: sfid-20220914_021559_440639_3C0E7B73 
X-CRM114-Status: GOOD (  12.14  )
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
> The interrupt-parent property is inherited from the ethernet node as it's=
 a
> parent node of the switch node. Therefore, remove the unnecessary
> interrupt-parent property from the switch node.
>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> ---
>  arch/mips/boot/dts/ralink/mt7621.dtsi | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

