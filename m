Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B936C7EE23
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 13:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFJ2wzNIGZ0KOStcSuewNy9zLZfz/DVIl8h5862j09g=; b=jh+Gvvgv+lXXHkfDuNWFwnYD29
	ZiGQd5cptVA5vrceDm91OFbZ18I7iCZLPd3t76ZijYPbeDDDK2XBSSvyYXTWnmbwkd7VQ6c2yFRgQ
	WuFpaCfuLPQ2nQidqAWahLXaE3fGW/CCJGyKZXrAXLqF0vvg5Jmmo2a8L2dAhZlnAwDtIRvVoAjeh
	9yDAY/0uy2G3m7e4/A99Mzw54nQkgdl13/Pg8aduXm2wopDGQF2dD8CNTwUdOWq9s863aMTnHgHZq
	iB4XYsoQJyF71veeBptr/t8mlBoAAFyuLuna87MD8iE+UEyxqsdusQy6qQp9sKVZlABwPNIFCJOkD
	B4Zwqwpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2XCJ-002aVH-28;
	Fri, 26 May 2023 13:09:35 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2XCF-002aT9-1O;
	Fri, 26 May 2023 13:09:33 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-96f8d485ef3so112332466b.0;
        Fri, 26 May 2023 06:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685106569; x=1687698569;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zFJ2wzNIGZ0KOStcSuewNy9zLZfz/DVIl8h5862j09g=;
        b=SZ8Ij6ruFkxE5HmAzgORE4Zkm0chc0YtI3Dj9C86P75v1dVCrd3X+EP+Zhz1kOlJRT
         V5wpit7vQGPj+Jpm6jO4zNROI/iJ3ukfhNByE8Oc1Qpj5SyevKXEmwCzLlGHR5FQ3R8P
         a3wuY6rXAtU7RtdzSUpZGwmktFmiIbevWlP5JunqIMuoaGA2dDldcliaVYH6NMCdXHte
         BnF80tXTSHKKwK6Of5k6kM7pThauCgTn9nkotu6PGjrHemlmR8MysFYpDTh8SrNQwBHL
         CY2yGWrUzSz20HHqBa3w8dM2Cj7y7Nb8AvPgvRBDb1UAvQJ1NfOuNXHgXPGAgUB0wwnM
         7Mvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685106569; x=1687698569;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zFJ2wzNIGZ0KOStcSuewNy9zLZfz/DVIl8h5862j09g=;
        b=GR+Q3PHawYkRmxWxdrx+QXP5w5oPo/y5xwrQDPcs1t893iAxOdQu8sbXc7OeM0l8l4
         9Nfe5h78MZBJrvKew2VtfgJVI3AJQpFfmPX+lxUTrUBg0XrrHfFlfiZx6qI+DXZgFCaR
         SYxGkW1Kdk8gn+GKKFANKyXtXJu8qiDpLyryifyGfgKi9+gbRRpO7r2WboFuYyHQVHsR
         wHjYeJnuLbmDU/F6ojcTPFWbvQ9s8QwjvkibwrzUgKnQFZMd8WOKzOQbTV5R+rHQQdur
         2zW6XDQOOsmreAUrXM6Q0o91yMMQjxuQRVYNn3luihYoRwkw5UzV+wuO2muMUyUlnl4R
         f1SA==
X-Gm-Message-State: AC+VfDxba1Wv0wJ9Sg48453TqxiJ/Pjy/j1q9tiM/7UsP8sRtzBUDlR7
	9bjHTDQwSAOxMhPOQ5WLVG8=
X-Google-Smtp-Source: ACHHUZ5Na1tqMh44XsGjWcNaXiLrMmEVPuZshBdTgVvbPjvRA8qYslkhuP9hKJli3isZlAlI28LZFg==
X-Received: by 2002:a17:907:1621:b0:96f:b9c9:c8b7 with SMTP id hb33-20020a170907162100b0096fb9c9c8b7mr1999316ejc.46.1685106568533;
        Fri, 26 May 2023 06:09:28 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id le8-20020a170907170800b0096f803afbe3sm2164022ejc.66.2023.05.26.06.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 06:09:28 -0700 (PDT)
Date: Fri, 26 May 2023 16:09:25 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH net-next 15/30] net: dsa: mt7530: set TRGMII RD TAP if
 trgmii is being used
Message-ID: <20230526130925.g6w3tbxunoamfmha@skbuf>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-16-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230522121532.86610-16-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_060931_466478_57442823 
X-CRM114-Status: GOOD (  15.89  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, May 22, 2023 at 03:15:17PM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> This code sets the Read Data (RD) TAP value to 16 for all TRGMII control
> registers.
> 
> The for loop iterates over all the TRGMII control registers, and
> mt7530_rmw() function is used to perform a read-modify-write operation on
> each register's RD_TAP field to set its value to 16.
> 
> This operation is used to tune the timing of the read data signal in
> TRGMII to match the TX signal of the link partner.
> 
> Run this if trgmii is being used. Since this code doesn't lower the
> driving, there's no apparent benefit to run this if trgmii is not being
> used.
> 
> Add a comment to explain the code.
> 
> Thanks to 趙皎宏 (Landen Chao) for pointing out what the code does.
> 
> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

