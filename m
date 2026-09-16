Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D951C982CC
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 23:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yl8nSjxuwI/LouP4WDHFD4P4zMMIU3JlJ+zSqw0WuNY=; b=Rhrw6PVAfhvaYUigSazjE+x2an
	cmA0wSqOeHRq3KFuNcvBUdcppwDuHYP/EETqD7t+do7voTuRmQUTH+z/Qqfs9EYqtnI5G/LdVLeYK
	9PaUAPFO3UiMv90ad5X4B67nPHMt1nA3vnwXakw+UIQLTkzTK3Q6OvKoAdMqYLZ1rxP/+dIsKIrbj
	bkaSnFxMgiP9n49LEElI2CmPMCnQ7bR3yjZevEZoPLNJpeKLmkkwrHpUl74rtz657lcxi4svnVHi2
	62cnSyITrpdm3TgZmVWVLpLYMahWuEF5iZ17b2AqZN4A6Guo1hDVCUPXrjFRyM2rpYsuGlaEVrDfb
	dKXaOvLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6zRx-0000000AHi9-1gbz;
	Wed, 16 Sep 2026 23:54:01 +0000
Received: from mail-qv2-x10.google.com ([2607:f8b0:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6zRu-0000000AHhC-0IYg
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 23:54:00 +0000
Received: by mail-qv2-x10.google.com with SMTP id 6a1803df08f44-91064d2d54fso2390466d6.0
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Sep 2026 16:53:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789602837; cv=none;
        d=google.com; s=arc-20260327;
        b=nsz4vXcvhzLquUEApvmPZBVsxlUOXrmf1fvsQpe3K1DdjZodjhaKdZag5utFl2OITP
         CWhqubJtodiWxJeFTspBYLqcmjivZqviHrBQhYh6gti5Z7IMPdqldqNppRr7fLLWtmUs
         jED8VY+GcgtIuab8X6mRECyM1m72ordrvr4UzYMFWoXq+B2Mh2w0mzewYelKEMeAgkwZ
         v34JMD7xywV6zV7NwhOmEGlQ5Iii6kz97UH+m+UG99tudfe3w03F04uICEfFaAdA20ZD
         +lNvNsYakcsCW1Rfq+PWuR0tJd1Y168WGZB3pYs34uhCKwbLpc7gI10DnQ7KV6jJgYmm
         /JAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Yl8nSjxuwI/LouP4WDHFD4P4zMMIU3JlJ+zSqw0WuNY=;
        fh=TvfjLzKZdlnTi02aiRP5c+NvAvSbsOno6bID3LoB/Xs=;
        b=e+7/h/9qvaa/xfYQdfNBdGd1kVXY+eP/SYtamPEgWmGHItRQb5/Ij5JZTplO5Tk3zG
         jlHmvS/YWya3y7klu/7mxt5b1LpjDySGr2j2pLU5lYyuymd8OWsLQey3bXAK1QwSYGBy
         06DudSWcpKOkP7R8nuK2omUdpMcHUizxgiqo63SnE34WacUsTmRRb2J9HSadmgi7bImz
         uD/VCaNDke4DFwoicZNpxvk4yi8YB5CrtPORScme2a328q16afgKt6h2ThssR1BwptOo
         5jwY51v+UFcnyPFzgWYWiZCLingICENPHHHpOcMI2ef3wkKfe6cX0ZFMs7IPJCKFuxtO
         iegg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789602837; x=1790207637; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yl8nSjxuwI/LouP4WDHFD4P4zMMIU3JlJ+zSqw0WuNY=;
        b=VldO2C0ha7T7xKtkXiiP/ttW0bBOlq5Ou4dmL+Q90TnSLi2rxiw/BEm6dRrneoPC3Q
         m1tfi+1gi0VrvKFAYMom4hM6Qy8AucYb+F5pLdv7yrYbKeGBsNUpotuiWoOurxfqXJW8
         1wlUQg3cSHjwm4JnRJvocbzSq86GjUoe3x6cVTHEyODILI3k/XIfdTPmSs/jO36ukYny
         tU3qJ1lx0oEoAieL3dwN9fEcfRk+jU0xeCPvFVjALRBbJGpbED7g+uZwBTbtbeTXXQD+
         G0HsayeduacNtaKYjtcLEzHCTbFtE1NjgU5GX34YcZB6H0nKyYQql49wfkz+WSgw2NYP
         soOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789602837; x=1790207637;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Yl8nSjxuwI/LouP4WDHFD4P4zMMIU3JlJ+zSqw0WuNY=;
        b=GfIt6JP8AzLCkZWQYGLzGIIMB9WYbB6Xzb0sStC+qk17q+wPCG+iFRD3mtSs3IhiQR
         4qfOmm0Qjc5UIgaqqelMNRoiqagmwwgePV+NGU6Q6SsODILfaj4g6RNjf4sr96sS4XQU
         2bWejiJ53iCVrDgp0ftOZZLsGx0Qesi/dCYAaPaj0LOyr3ra3AsrvqMpFaTWlzJ/YDGx
         kipwJqwNx1PG4Q0ahogkww+oyjQurQ7F/R2tjmkC3OtB03BUU9PWbmHRG0f4E/csjpZP
         QnlY+IXTbQ/7oIFCANg8zqZ+xw1i+FFx9TZnVn2DQu5Nue4ai3LLrC06s0JUFtnD6Rvo
         UtNg==
X-Forwarded-Encrypted: i=1; AKwUvBziqeiqCUqOhU0irwtSNhx18H6O9lH5ZbC1Mw3VeUsoeD6jQ8C+GqjfHDpbygswR9tuNconZ+rR+if7EH7r1A==@lists.infradead.org
X-Gm-Message-State: AFuF++njoNjQbC7mY4DPvNCsbcv34J2VT7+g2b5SmxMtp7auvL/RWMYq
	k3jwexmAlz5Mfsq4Llk2mllxodxtg4kDYvfGZVVC8nllbpPBhtoz0rZ+vaidWvv6mLFSdsdtxVQ
	TYjabQF3Z27wc81TXx5bZdCgYguNiGvs=
X-Gm-Gg: AYBFou0f5YogIjfACL/2tejWLxJm67eOJcxlVXUPaWFFFoV+kGa8Gp3q6OloTKwcGoU
	2AX5wOVWaJ9aXv7WUtepBWWEg5/BAHFXPfe+BJ2VyEW8Isui3Mbdq8pHK/aaPZDuVhvbqJuCAYY
	Zm0eVQ0xyfJU6mbT1skXlIWrd1j3Z2U8DuQ107sZoA5ISzhE0ADef6nOgkigTNUaXzUoOdyIlTe
	+4e6O4alR2zdDlvml3P8ey4o6TrKwhYid3TTqhdhWiG6/bXH9PI93+AR5TIJvh3gs+clTbUBVn6
	xF94rXbEJta7ZRdrUlqdw3KzAjYOn/CWVDF/hn1d6Q/1g4noqcZfIcUrlIjvq8p8kA==
X-Received: by 2002:a05:6214:cce:b0:910:94c6:2ea1 with SMTP id
 6a1803df08f44-9123d7318a0mr91642006d6.12.1789602836616; Wed, 16 Sep 2026
 16:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260901083001.8044-1-ansuelsmth@gmail.com> <9609a821-c971-491c-9436-9346c48d2ee5@bootlin.com>
In-Reply-To: <9609a821-c971-491c-9436-9346c48d2ee5@bootlin.com>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Thu, 17 Sep 2026 01:53:44 +0200
X-Gm-Features: AcwNN1XEi8i0bR0p6V2XML1oNL1EMS0XGZ-YJo8qlzp3ByfRA3buomyIp2Ok6rc
Message-ID: <CA+_ehUw0KK8mHDmaH7UBKxq-By7CvXCaWDUg9NvoMPzSe5cgHw@mail.gmail.com>
Subject: Re: [PATCH net-next v15 00/12] net: pcs: Introduce support for fwnode PCS
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_165358_132106_611CAD23 
X-CRM114-Status: GOOD (  12.60  )
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

Il giorno mer 16 set 2026 alle ore 18:20 Maxime Chevallier
<maxime.chevallier@bootlin.com> ha scritto:
>
> Hi Christian,
>
> On 9/1/26 10:29, Christian Marangi wrote:
> > This series introduce a most awaited feature that is correctly
> > provide PCS with fwnode without having to use specific export symbol
> > and additional handling of PCS in phylink.
>
> I tried to re-rerun the mvpp2 prototype conversion, but it looks like the
> series doesn't apply cleanly on net-next anymore :(
>

Hi Maxime,

yes the conflict was caused by LRO patch on the airoha ethernet driver.
I just sent v16 with the series rebased.

Also Andrew had something to say for the mvpp2 patch so maybe we
can discuss how to improve that.

