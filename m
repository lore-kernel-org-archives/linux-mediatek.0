Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B6DC678D4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Mar 2023 12:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZ8LF7+zMiKZ+S5iJr62As+T9036Y3LSmDtjC77E6fw=; b=X0K/AS66tCUPr/l1dgiowsudal
	pbOrlctaN1UmDX5PwaijaJSHH/3tzuN89XqDyPecBFzwJ5Oq26ha2J7se6Yy4zUOQOxivB/TQq7Sd
	2VA2K9YiP3CuWeRoZjP2os/pwCHuNGhjeWJhEoDvduCPY1EkBgyobnofw7haa7tTlIuuwaDaHnFRW
	6n/Yn10+hytsShk+W9OtCTRsmHPIOcBgFjB1daO2fSMx2iNj4AHvKvq8Q/og/qmlYYCWWEDN+6SqT
	VZt1hLkGsIuhWAFhSdtLs2GuPE80Iry4VSn7GhGXCawV07JrbVP+1+djXqwaV/5irn1fxW+3t76q6
	goT6o/6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXiA0-002Afx-1R; Thu, 02 Mar 2023 12:35:48 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXi9x-002AeM-E4; Thu, 02 Mar 2023 12:35:46 +0000
Received: by mail-ed1-x530.google.com with SMTP id s11so2979574edy.8;
        Thu, 02 Mar 2023 04:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BZ8LF7+zMiKZ+S5iJr62As+T9036Y3LSmDtjC77E6fw=;
        b=mlO7j+I91CiF9Odrd89eS5DsyvO9jnI534f7ySKGe/AxKKqBarZBPaTBWbozq5s54H
         mA1vty6oG43Dx0fphA5LwVjR9Fv/fyOrgQxcvhkk6fW9M/nuWhBQ3AoPkkJ84Pt/e3vF
         c1ZuCtHXtv3HGYtJ1eYDNhtWT6NPLQj+EaHuxbSkIcLghu6v6q5f4Ib1upxtOhrDePxc
         i38h733YifQd7ds7euuFkkjxrby70kxqWVgK8f1WH+U150460s1FJ0ffkHjMjKuDV9zC
         zlUJgMgeisDb9u+ZryN3n4oPpWClolLCnv45+uLXQxIAkRvAsJrmrtazD/vENtT4nT8p
         W3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZ8LF7+zMiKZ+S5iJr62As+T9036Y3LSmDtjC77E6fw=;
        b=dQ0NBqcHJJXby+CT/jZ5JhXlpF2VJrQYFpfcuthG49QXMHkiCU0uKQKm3y8xmNQAWf
         ncqG8ZzAz9/v7oMvACgnlcgpbnaKFzOK4VC444ycRw2js8MWmV4n5VTgFOD1YKWN1qxs
         vrIq4wL2LdtgVOGp/BNnfGxnHXGg4IQRA79cgM93KP/qPUSye6G9ll0YcdEG3NKuKPgj
         KOB8dMyVF0PVlOSJB364Zvywg/Avil9XguCtp4w49u0jMb//3RlKazOFj3nCKvaygswC
         y8fFS+BM+LUK9gM5l+9oCP6/LpFWUVmIc5pNj3Ez2PXdCrp+o+B4UkbHP/kVBUfJ0ZJ4
         iLKQ==
X-Gm-Message-State: AO0yUKUJjIubY4Rk+PhPe8fQ+LOoVVUE41NWIWIzHfbH7qEEgM9cuxGn
	OQk5wyU1fFTejwSemQo/sZM=
X-Google-Smtp-Source: AK7set8MXoP7Db7st9sGfnC5hTDR9aH7I/VoW6jkHJdXhamvjRsvuoLCTgBBjKl6GLv2MDwh/uhWGA==
X-Received: by 2002:a17:906:7687:b0:8f1:939b:9701 with SMTP id o7-20020a170906768700b008f1939b9701mr10351811ejm.66.1677760541584;
        Thu, 02 Mar 2023 04:35:41 -0800 (PST)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id eg22-20020a056402289600b004c2a2ae772asm143014edb.67.2023.03.02.04.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 04:35:41 -0800 (PST)
Date: Thu, 2 Mar 2023 14:35:38 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Jianhui Zhao <zhaojh329@gmail.com>,
	=?utf-8?B?QmrDuHJu?= Mork <bjorn@mork.no>
Subject: Re: [RFC PATCH v11 08/12] net: ethernet: mtk_eth_soc: fix RX data
 corruption issue
Message-ID: <20230302123538.nfet4k3im3bcj4uj@skbuf>
References: <cover.1677699407.git.daniel@makrotopia.org>
 <9a788bb6984c836e63a7ecbdadff11a723769c37.1677699407.git.daniel@makrotopia.org>
 <20230301233121.trnzgverxndxgunu@skbuf>
 <Y//n4R2QuWvySDbg@makrotopia.org>
 <20230302100022.vcw5kqpiy6jpmq3r@skbuf>
 <ZACPCHxbuD7deGTa@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZACPCHxbuD7deGTa@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_043545_512120_B00509B6 
X-CRM114-Status: GOOD (  21.26  )
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

On Thu, Mar 02, 2023 at 11:56:56AM +0000, Daniel Golle wrote:
> The issues affects PHYs (and potentially switch PHY ICs) connected via
> SGMII operating at 1.25Mbaud.
> 
> The only officially supported board affected by this is the BPi-R3 where
> it affects the SFP cages -- the on-board MT7531 switch which is also
> used on all other boards using these SoCs is connected with 2500Base-X.
> 
> The issue does **not** affect RGMII or GMII on the MT7623 SoC, but I
> don't have any way to try RGMII or GMII on more recent SoCs as I lack
> hardware making use of that to connect a PHY.

I don't believe that board vendors need to have their device tree
"officially supported" in Linux in order to claim that a bug affecting
them should be fixed on stable kernels. As long as the PHY interface
type is generally supported by the driver and is expected to work,
it should work with any board (the exception being if there are other
configuration steps specific to that board required).

In any case, a good commit message for a bug fix explains what is the
user impact of the bug being fixed, the configurations which are affected,
how it was noticed, an adequate Fixes: tag, and if necessary, why it is
being fixed the way it is. In other words, it must be able to respond to
normal questions that a reader might have when he/she stumbles upon it,
for various reasons (it introduces a regression, they are debugging an
issue and want to assess whether backporting this patch would help them,
etc). The reader might be in the not so close future, when you might not
be able to provide clarifications personally, so the commit message
should contain all that you know which is relevant to the topic.

Most of these clarifications were provided by you as replies to the
patch, but they should be present in the commit message instead.

