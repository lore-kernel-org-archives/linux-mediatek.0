Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F3CAC7EE23
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Jun 2023 09:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nwyWMrJ3KHae90TffxL9AnX5OQPeP2x8dmjtNZo0s6Y=; b=HBeS6Uk8tP1NsxlzuZCZ3IFP7a
	4qO7amL3eKzNA+HVorE5hIpKLUhQyWXVQPiWxA/ehieTOsodSPOYlbJMDlCaujRn+WDkyM/qVCg/h
	JcHW1FqehSWB46+XEAH1jQ35c6AJytzFoFKxUaGdT2t7PiHnfRNrKErJj+1r5FMrbLJAgwkbb11nX
	NUF1zKDjf+sFoZJpwekvnwzH9Oyz8H2Bblvu1CLdVGg7MhFkugY4UQC/GmTX6Q8vqR+63257HXlhf
	AUYsuw4POv2gSsizG9Y96zGYqXH4p5Fg5sGxHGJgPOPrge+C/5bb8nTurAyS+GhDBxlR5u/01idkE
	AKd9zB9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5jxC-00BiVo-27;
	Sun, 04 Jun 2023 09:23:14 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5jx8-00BiUC-2d;
	Sun, 04 Jun 2023 09:23:11 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9745c5fed21so399075666b.3;
        Sun, 04 Jun 2023 02:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685870588; x=1688462588;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nwyWMrJ3KHae90TffxL9AnX5OQPeP2x8dmjtNZo0s6Y=;
        b=FoOeFN0fzdLZT92B3gdASJ45MYDZrDwkWeqcje+rYQVfgQyrdEynZCciTcPmX3x8Am
         YdWzbf9em1+B/GH1s2qsj5HxYLp6O72WalMOEGQ5iYLl81/YIj46d/dVzN9VtnkHnHtA
         7R39jjqgjvcRZl9Dt++GpctRv9RZqTntHkRAYcV8d8uIgsBEhbsXYjeYOPzAKkO6vqRu
         BqzpgnTMNCL2h79dZZNrNocELrF0hMGwsviQgZrY56YhzQ0p82bYkfJChZ8SrWNJbsaR
         o3Wsbs4aLiO+KfvoM/eoadriqxzGWipaFlNKtyTycb71TklavcEnXfzfj4T0AYG+Tqc3
         MpIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685870588; x=1688462588;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nwyWMrJ3KHae90TffxL9AnX5OQPeP2x8dmjtNZo0s6Y=;
        b=EK7Su1MWiXO+jJ2Q7L/uB+kW6/ccztfYd1nsFq3pabfWJHhW4SH9UkO1QtE216nTTJ
         WhNnFERJbjC6m5/bz51fKOPkkEROoLpGIS3hV8MOEW+Isg+AsaO+PQhCbxnF3+xgSDXH
         mFH/Sg/3Tv9l/s1bpv7leOoWLISNsl1zi1bcGrPnSibccGYW/EZD0MqUw5ZrYpGLAitM
         zpDFTsNEdhK2Fi+85Suf1E0PxUplQW/ZaAVck02yFWjM4eJFJcaCFajdv24Q2WpF1L7c
         JXcmUdfirnIUtXNEoS5smXWkjaGmJsNil8t6dZAQL6KN/+hl4IHlFlKNGfWNjctIGgQt
         6xuw==
X-Gm-Message-State: AC+VfDxGriL/TslE5qwP+1toC0gH/NFYSerIG8Acsj4YQPTkO4S04oO5
	bLAx8lN4i/JHVpDqIPoZ34I=
X-Google-Smtp-Source: ACHHUZ4wQ0kbCG+SQb8rt+ZiQjciDpG8UJ4MAaHfXXLJmol3DdQ8D5D4YeCKTfTmC7SaWnQjmvQ8/g==
X-Received: by 2002:a17:907:3189:b0:971:c931:3677 with SMTP id xe9-20020a170907318900b00971c9313677mr3281732ejb.68.1685870587648;
        Sun, 04 Jun 2023 02:23:07 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id dk23-20020a170906f0d700b009746394662asm2715323ejb.53.2023.06.04.02.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 02:23:07 -0700 (PDT)
Date: Sun, 4 Jun 2023 12:23:04 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next 27/30] net: dsa: mt7530: introduce BPDU trapping
 for MT7530 switch
Message-ID: <20230604092304.gkcdccgfda5hjitf@skbuf>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-28-arinc.unal@arinc9.com>
 <20230526170223.gjdek6ob2w2kibzr@skbuf>
 <f22d1ddd-b3a4-25da-b681-e0790913f526@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f22d1ddd-b3a4-25da-b681-e0790913f526@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_022310_856020_23D74E0A 
X-CRM114-Status: GOOD (  10.64  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Jun 04, 2023 at 11:51:33AM +0300, Arınç ÜNAL wrote:
> > If the switch doesn't currently trap BPDUs, isn't STP broken?
> 
> No, the BPDU_PORT_FW bits are 0 after reset. The MT7620 programming guide
> states that frames with 01:80:C2:00:00:00 MAC DA (which is how the BPDU
> distinction is being made) will follow the system default which means the
> BPDUs will be treated as normal multicast frames.
> 
> Only if all 3 bits are set will the BPDUs be dropped.

Right, if you don't trap BPDUs just to the CPU but flood them, I believe
the STP protocol won't behave properly with switching loops. Worth testing.

