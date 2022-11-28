Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465DEC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 20:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TjoT5TDE+r7cM4/cxzaRtmx/EQ7hkpYtYFeVLk7DIiw=; b=Wn995OCZiTjJdiypF3805OhaLM
	Ab2nBcVK8u7/fBpQBEWg7Xocj6XwA1bpoXkrmhIafXd1x6UC87DEp93dHGGr/6x7XipJOPAQ0X6OS
	8s5mOkcmYio/AKSeIOvWWb9gyFXw2Nri6guJ9Wk0GhnYye5t0S8KYUJdsMK88EIeG5BXDFzD/pUtI
	dPg1m6KguaSNFqFuv2CPMhdd2vyuTFKpJ1fC5hG8fN8GeUfU0PYzz3iAxGqmPVGMIbApSIG2oBBWB
	AcDJz8B3/zJWlJIIeJrxViAIub4vaE8Qqan3kx/6m01wJS55ND3ov2uhf7PmWlS2WTYnltkb0fUA0
	LpspdtPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozkdX-004ILt-3P; Mon, 28 Nov 2022 20:21:55 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozkdL-004IK4-PO
	for linux-mediatek@lists.infradead.org; Mon, 28 Nov 2022 20:21:45 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 205so14826480ybf.6
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Nov 2022 12:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TjoT5TDE+r7cM4/cxzaRtmx/EQ7hkpYtYFeVLk7DIiw=;
        b=Tegs0vU1lxQyFLgxYk9K/CgMgnC3Pug93SCFq53nyd8nzGJFVZJe23sizEt7pAyTem
         IErvnVRzqlmlKT8L7idEBMGUl0OsPoEeDls+BSiW2tEJcDGNgBTTTn35rBQU5C49182V
         M43e8H+uwGNAr2zT8a6aW435ngKhS5gW173hkUYK5w2MOAaemyokfXHeMyxktV6njc77
         Z6FXjai4FguNQtN0iDvjE21EOKLjNVzWrYNZ6nn3EbY8b+H87pOdScxPL0AA9acF048p
         s+AS5YxXJZyISbxkMe7AbtDLGelZwQrP/itQkKBUgnVQeLBlOYLqsSfRMbtVT0+nCtJx
         RF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TjoT5TDE+r7cM4/cxzaRtmx/EQ7hkpYtYFeVLk7DIiw=;
        b=fB29iUD9LTEH4/pkKxgrzMNnMJNsmHie8tBFlLF34M+jiGFireUhqH1nfPR8qzuBCZ
         ZkXSX/KJdcHmOF3qQBn/QPQboPwnmf3Vj3+ulB1oJYMskZT9Oxg+shm4Q2qGB5X8Pxan
         29kB4K0L8+GJFmuBz0apdLILYgxDDOo4kniEC6pENiDQbWbtiuHO/MHNVOS+U/W1+Dtx
         XBwHuf2+Wa7z/F3EyatmDOtLDePLveu8iKvYja2rHQbv+vRJFJdEaBYP/tEEJLotwkmx
         hsIqtOC0ECdM3p7u1HavzK0i5iGa2Lh5f1G7t7ueD5MNtftXOPOFOHjl7OcW8cHXxsDM
         wgQA==
X-Gm-Message-State: ANoB5plUEkNPC+ezYKyNPsWZZ6r1qbu1YP7mHVs27YVyP/o3AU1w+aTg
	eo868hT/NSE/Vy4mRb4jXcny5EiAtgs9Ey7qtBahzg==
X-Google-Smtp-Source: AA0mqf6BPbabzFNaWtiGqHDoUARIK1B690FEkWvfP29g/kDoV64k/3lLmcND0FoPdk1PeTC8p8tl5cIhxajriwjMB8A=
X-Received: by 2002:a25:c7c8:0:b0:6bd:1ca1:afd6 with SMTP id
 w191-20020a25c7c8000000b006bd1ca1afd6mr48535520ybe.43.1669666897696; Mon, 28
 Nov 2022 12:21:37 -0800 (PST)
MIME-Version: 1.0
References: <20221127224734.885526-1-colin.foster@in-advantage.com> <20221127224734.885526-4-colin.foster@in-advantage.com>
In-Reply-To: <20221127224734.885526-4-colin.foster@in-advantage.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Nov 2022 21:21:26 +0100
Message-ID: <CACRpkdYkD-=y0mCnVkkQ9+4m9-nx6jQu=TfL-TPePbps6x+7Xw@mail.gmail.com>
Subject: Re: [PATCH v3 net-next 03/10] dt-bindings: net: dsa: utilize base
 definitions for standard dsa switches
To: Colin Foster <colin.foster@in-advantage.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, netdev@vger.kernel.org, 
	John Crispin <john@phrozen.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Manoil <claudiu.manoil@nxp.com>, Marek Vasut <marex@denx.de>, 
	Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, 
	Landen Chao <Landen.Chao@mediatek.com>, =?UTF-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>, 
	Vivien Didelot <vivien.didelot@gmail.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	=?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
	UNGLinuxDriver@microchip.com, Woojung Huh <woojung.huh@microchip.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Kurt Kanzenbach <kurt@linutronix.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Vladimir Oltean <olteanv@gmail.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	George McCollister <george.mccollister@gmail.com>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_122143_866107_F92D3FC9 
X-CRM114-Status: GOOD (  10.59  )
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

On Sun, Nov 27, 2022 at 11:47 PM Colin Foster
<colin.foster@in-advantage.com> wrote:

> DSA switches can fall into one of two categories: switches where all ports
> follow standard '(ethernet-)?port' properties, and switches that have
> additional properties for the ports.
>
> The scenario where DSA ports are all standardized can be handled by
> swtiches with a reference to 'dsa.yaml#'.
>
> The scenario where DSA ports require additional properties can reference
> the new '$dsa.yaml#/$defs/base'. This will allow switches to reference
> these base defitions of the DSA switch, but add additional properties under
> the port nodes.
>
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>

This is neat.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

