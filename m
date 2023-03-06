Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8F0C678D4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Mar 2023 12:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1g4AYGzxTWyuARpoPesNpg8EiVTXYK4wwkJzSL4nXXs=; b=HfBB8aTULsH7hsQsxCnFuADg6K
	x+U1Dd9Hudzw3CCJS6S/9UxHrIodkzjpUN4qsZ83Th+PS5x79e7qDsxD3Z68QMwnGNbZec0oO8bG/
	H1tbtFpWiLCi7ip2SBQLnXhoEY9btev96DAPT4KHsjRkP4SSHGCqp+LI55wkBmhQ+PKI+4VuBUO/v
	w/eV0xkqZrl1ttMaltgDI73JRU9bGWAY2UYKQCqR9HN/MzoEE9Bigeqsyyec4P1RJ/vwysRDol1tF
	49tIMiK/r2uUVkMd98UjY9JN/E1WtN2NJXYJ7jF/3mVhua9nCoHkSm/mffuiIQnon+NYE8GXdUMk3
	cC5RwADA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ9l0-00CeKZ-SD; Mon, 06 Mar 2023 12:15:59 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ9kx-00CeHl-88; Mon, 06 Mar 2023 12:15:56 +0000
Received: by mail-ed1-x52b.google.com with SMTP id ay14so33940519edb.11;
        Mon, 06 Mar 2023 04:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678104952;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1g4AYGzxTWyuARpoPesNpg8EiVTXYK4wwkJzSL4nXXs=;
        b=bNBYn1TnRcdbUj1TqpxVf5w4INnvEjSqvJATHZL3viiCgAe5kp/1aYJV3tXUZ+I8YT
         0vCWGQuC16ynAcvcZnRa5hfRn/jz/QCFUY6K7Zrww2DOxPQLM9RLS3vqxXuG8Yc26yPz
         o2IVbERznLqdY8VE1LgEKZh+B5AfNg7DwIjDcTKTy1k9Or5yOIV3cCyZ9Dr6vQ993zDC
         CEZBUuUoHmV8iNhBwIuy9wsE5KyOBmLoNeECjwtbZQ1S03Of68bWqzXkOCIsZJBdYaHe
         JoZGH+txs9zp+P6QinTeqi9DThGgPfkNutBu2p20LjJsTtWbv0J12Z2H/1D48xXogVHp
         Buuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678104952;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1g4AYGzxTWyuARpoPesNpg8EiVTXYK4wwkJzSL4nXXs=;
        b=Cn1mkR5yCMGZnXY3ok8lzUQ/pwHHpPs5d14TUuNreoqu0e2lWuIxpurPjbDluVJkDK
         sBc/9LucBKqkpNCme3K6M2SJABeJesBPFmFwBwczGF+QUyWFRXye2Ng7NdseSYQKNdTs
         eH59uSnTBGnk7dvi38RWzQ8FMFbGME3QG/w0GlWfz0LswB6iIgh4l4hqjrNvXHxa2Cz5
         IyjEY99NJrlMV/A+hfTn/JtQ6xHgS0jaqw6A/u5kwx5HY/B8x2ACwLr7HfLK2hV8Mj/4
         xyjPEuI3GxzP/r7lwszZGFLAVURtINq9+4r4d0EOn6cJt9wSymtwi5abC9UaHo7xoY5Z
         I0iA==
X-Gm-Message-State: AO0yUKVoiTFuXKHzvE8PeWta5MZy6qsEM/Y1rZj38XM8a8Vi0/RmBKUv
	dPlIAPBds55AgysGJW8Q/Yo=
X-Google-Smtp-Source: AK7set83ncGukr5k9XtPEBkCv42ZvOmeZIY23CtKgfOVZ1N4PNDRl2X2UQy2myUkpOZpI/aknFckcQ==
X-Received: by 2002:a17:907:c689:b0:914:4164:658a with SMTP id ue9-20020a170907c68900b009144164658amr506482ejc.42.1678104952142;
        Mon, 06 Mar 2023 04:15:52 -0800 (PST)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id o13-20020a1709062e8d00b008e22978b98bsm4525453eji.61.2023.03.06.04.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 04:15:51 -0800 (PST)
Date: Mon, 6 Mar 2023 14:15:48 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: fix RX data corruption
 issue
Message-ID: <20230306121548.k33fgu7adg44zruu@skbuf>
References: <138da2735f92c8b6f8578ec2e5a794ee515b665f.1677937317.git.daniel@makrotopia.org>
 <138da2735f92c8b6f8578ec2e5a794ee515b665f.1677937317.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <138da2735f92c8b6f8578ec2e5a794ee515b665f.1677937317.git.daniel@makrotopia.org>
 <138da2735f92c8b6f8578ec2e5a794ee515b665f.1677937317.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_041555_323308_3F4A5947 
X-CRM114-Status: GOOD (  14.40  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <vladimir.oltean@nxp.com>, Eric Dumazet <edumazet@google.com>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>, arinc9.unal@gmail.com, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller" <davem@davemloft.net>, =?utf-8?B?QmrDuHJu?= Mork <bjorn@mork.no>, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Mar 04, 2023 at 01:43:20PM +0000, Daniel Golle wrote:
> Fix data corruption issue with SerDes connected PHYs operating at 1.25
> Gbps speed where we could previously observe about 30% packet loss while
> the bad packet counter was increasing.
> 
> As almost all boards with MediaTek MT7622 or MT7986 use either the MT7531
> switch IC operating at 3.125Gbps SerDes rate or single-port PHYs using
> rate-adaptation to 2500Base-X mode, this issue only got exposed now when
> we started trying to use SFP modules operating with 1.25 Gbps with the
> BananaPi R3 board.
> 
> The fix is to set bit 12 which disables the RX FIFO clear function when
> setting up MAC MCR, MediaTek SDK did the same change stating:
> "If without this patch, kernel might receive invalid packets that are
> corrupted by GMAC."[1]
> 
> [1]: https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/d8a2975939a12686c4a95c40db21efdc3f821f63
> 
> Fixes: 42c03844e93d ("net-next: mediatek: add support for MediaTek MT7622 SoC")
> Tested-by: Bjørn Mork <bjorn@mork.no>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---

I don't see something particularly controversial with this change.

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

