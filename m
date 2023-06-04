Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39834C77B73
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Jun 2023 12:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TDn8YYiBgXe3r21cm1jfI/woIIBtKXmlQB8jMG4QMOo=; b=1zL8yr08b4mrnTB4JI4d3wr+8X
	w3A5f0ndQ2mJWHHw5e4f5PZepJeKS2wVwf4hdZHh0D4EY0q8utuNTJ2iYL42bBTYD5SRRncK95YYc
	89JhV1pvwoWRVSNH4cFGJLQ5iVvjGhIguepNC4Fiov3Kxsl9ji0d6y5aIO9k+OJXripzC+kH1f21r
	NiZwUkk2bwYoeFuADN9JJD+fa4wkndJHYvUiJEXGyeNJ/3zg/Je7Kg3gEhzXT8iYtfPqYC6WUjQWO
	yqecRyPgwaI0t7gduWe2CIhnSF3WaiSv7t0JbFqmZ2qkkKnwhYPGJ4TYkYaQtLHI4vGSiXk4q7gal
	KPLtUPwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5nGY-00CB7b-1G;
	Sun, 04 Jun 2023 12:55:26 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5nGV-00CB6c-0K;
	Sun, 04 Jun 2023 12:55:24 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-977cc662f62so103756866b.3;
        Sun, 04 Jun 2023 05:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685883321; x=1688475321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TDn8YYiBgXe3r21cm1jfI/woIIBtKXmlQB8jMG4QMOo=;
        b=rCiLQm8r7AsBnR0YdaOOjhZjiaTSbli+RZPxkqHLqdZGIpUudPt4jMW0oaGLQumV20
         VC3wBhx1K9m3OG/fOdrGjU/X2e21mZH51sVVVqYWByyxYW5XbC4ANM7Dh/e9zqdw/E4/
         QgUG5MftcXEhHF705ui6Vvs4iPaUskAvWNVtGeSYYH4ZUOw+NGlCcdbU6VF4FQTEJn3H
         jgbimlJwV4af5cQIR1GcDG5g2BGYhEEQFE0p7zCv93aH8M2uYv5HBTCYq85id/VgEphH
         L4aNWgDV3qHr+T8BM5Z2hrx53Rmie7o5hwsBR5RUoNlQfW70ZrNPEyU7BVqxoy8WiY3y
         ba2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685883321; x=1688475321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TDn8YYiBgXe3r21cm1jfI/woIIBtKXmlQB8jMG4QMOo=;
        b=ey1a8UuRHx52g9bWCB/vGQmI91+EeJgNkF/XZX2K+96n76t7FxflBXjqgGZg2cxE5i
         JwLi3FhLgpyN+mhqCQwg/VYjhx9YJI0aCIwBedAKBdMB5cA3sKTngUxUkiWTp9/GxVYX
         LTmCK6hZYfzvXfpHAaEKfiryQyw9oBMpGaFFRFRYWicr61dVGFI8+rSRXpjjnCgmc4Lo
         lm/0ymCpsgB3vqa1JpVpKFUZ6EwMl2oxj8wN7Ho+3vC2iSBcz0opNyvxxzOGugudhEZo
         sUGd5//+bX5u4+TyLg8b4qpoD0lQDp0ZPldZyWZbYpaXLYDFV0ZLQ703Y91Bdzcyc7iX
         SRow==
X-Gm-Message-State: AC+VfDyV2Y5PjuBKxPttcbMfbkWg5TmDIa1YBH28ZJe8jE24ne3q5LK5
	9wCetWTD4cGH6V59pt6Z+Sw=
X-Google-Smtp-Source: ACHHUZ7ja9CDX3BNoyA2qTqEGzXUEEqIef58uTxByuQrtW5OxZTF515OuthTTD2Lh95XYymQeO7jeA==
X-Received: by 2002:a17:907:8690:b0:96b:4ed5:a1c9 with SMTP id qa16-20020a170907869000b0096b4ed5a1c9mr3772273ejc.51.1685883320625;
        Sun, 04 Jun 2023 05:55:20 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id gf18-20020a170906e21200b0096629607bb2sm3033939ejb.98.2023.06.04.05.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 05:55:20 -0700 (PDT)
Date: Sun, 4 Jun 2023 15:55:17 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Subject: Re: [PATCH net-next 08/30] net: dsa: mt7530: change p{5,6}_interface
 to p{5,6}_configured
Message-ID: <20230604125517.fwqh2uxzvsa7n5hu@skbuf>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-9-arinc.unal@arinc9.com>
 <20230522121532.86610-9-arinc.unal@arinc9.com>
 <20230524175107.hwzygo7p4l4rvawj@skbuf>
 <576f92b0-1900-f6ff-e92d-4b82e3436ea1@arinc9.com>
 <20230526130145.7wg75yoe6ut4na7g@skbuf>
 <7117531f-a9f2-63eb-f69d-23267e5745d0@arinc9.com>
 <ZHsxdQZLkP/+5TF0@shell.armlinux.org.uk>
 <826fd2fc-fbf8-dab7-9c90-b726d15e2983@arinc9.com>
 <ZHyA/AmXmCxO6YMq@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZHyA/AmXmCxO6YMq@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_055523_157656_34D5577A 
X-CRM114-Status: UNSURE (   9.58  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Jun 04, 2023 at 01:18:04PM +0100, Russell King (Oracle) wrote:
> I don't remember whether Vladimir's firmware validator will fail for
> mt753x if CPU ports are not fully described, but that would be well
> worth checking. If it does, then we can be confident that phylink
> will always be used, and those bypassing calls should not be necessary.

It does, I've just retested this:

[    8.469152] mscc_felix 0000:00:00.5: OF node /soc/pcie@1f0000000/ethernet-switch@0,5/ports/port@4 of CPU port 4 lacks the required "phy-handle", "fixed-link" or "managed" properties
[    8.494571] mscc_felix 0000:00:00.5: error -EINVAL: Failed to register DSA switch
[    8.502151] mscc_felix: probe of 0000:00:00.5 failed with error -22

