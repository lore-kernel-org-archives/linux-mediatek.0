Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C53C678D4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Mar 2023 10:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tSEKXQWn54O1bcUyLcSiBooFO95lr1k3X3C2W2Migjs=; b=ipVWEQ05BKZ2olfvrKnSdtgkpY
	XgCnxfCcMe2GdaalAPAKkgeosTrYhzexjoWl64WSB0DlSd3RxtLu1AEwEb8oF9G5y4ImHRcrmKr/B
	RAFL/OADg690KPJXXcxZgZYQXHFCY1v2Z3YIuJhc+e6bS3NQVHhXc02R2aEohZZ2DIKQF90bQ/Ll/
	NhjXlpnBL6tdghUTojNGDp9nIMEobw3fksfOrQqpyKuEBJ/jKk3ZO6wQeugr6hfk38DwyOKJDDp0+
	9bcWOT/GosZj+GtT3vOW4YymhYw0XRvGAszhhh2y+Nf0onsYdFn1XeBOYXAMqp7XsKF9dvHgX/uTi
	S0PeeYQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfjj-001a1X-F3; Thu, 02 Mar 2023 10:00:31 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfjf-001Zyz-0C; Thu, 02 Mar 2023 10:00:28 +0000
Received: by mail-ed1-x535.google.com with SMTP id o15so62826017edr.13;
        Thu, 02 Mar 2023 02:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tSEKXQWn54O1bcUyLcSiBooFO95lr1k3X3C2W2Migjs=;
        b=PKEfnraJ0Alp4pZNcheigWRJmahYGgvQZZeXjs9znoUqTHAuIKqbvPVYLDS3NI0Uxg
         17miis2AxLl7gJL7cBMEPQiz3F6Qy2oW9dmmbmAIq3EjdK2r8GoSpV553oczuktpW3EO
         PkoTbiG8qdONuQeSPe0Jl+XBpVVdOW7cia/qyi2wV4/YOIlstLOA78Prqjs31KCainjT
         QR0ryppzWVcQR9Ip6wPQQesRXh7n0wcaQdL3IEwZRj/rTUiwxRUPQQ/RmpA6Cg880Wgx
         6PvfD+jHaeGIrCOjEe9XJ1DNd+UGcNXSx6ZM45VhbpByT+6TPeUrt855RdHTuLSwyfCE
         oX4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tSEKXQWn54O1bcUyLcSiBooFO95lr1k3X3C2W2Migjs=;
        b=R/UKwd5gbens6+MW6ilfLrJfRtnEMsct3agS3ldVgn8gBSd/Xv8FmlioXAQSTT2vhu
         pYGPkOgf7X1VoH5oX58veGIn4y2HF8K4aiUrCqd3y7yDXT8bgBqCbz+xPi8bZ7Iq4LmR
         3IxhEgEID7fJEeuJt0mKBDacKxug1Ny1SPdoLcDkfy6g9KkEGaToKUV/OneP7SqqCi+d
         J9UY9qgCJMaGjTsSfB4L0ePiC3EPgIb9FwJ5IsZNBwExkUlUV6rkCjTo0NSXABRlKcnt
         Baa+2mrtmnt1b0shRgljL5zQBs+qo1w76miFXbEneiWmO03lmbyT9osuC6Xge4/RbXBk
         /mMA==
X-Gm-Message-State: AO0yUKV0J+cVS6Omz6Esw8WQSjTzTpoQhlMrDOJ/a4OxpC4g9awL76Ew
	9EDAvdxnZEPqJPmMOae9/Limqd0QfUpuBw==
X-Google-Smtp-Source: AK7set8cMBsQgSgzNy7n5UjRfNXJOKgJ96z0jDtPPJnBMG6MPTIk+Qj7xG+k75iN3bojtTFYfU1r2A==
X-Received: by 2002:a17:907:2cc4:b0:8a9:e031:c4b7 with SMTP id hg4-20020a1709072cc400b008a9e031c4b7mr11816825ejc.4.1677751225127;
        Thu, 02 Mar 2023 02:00:25 -0800 (PST)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id w18-20020a1709061f1200b008c9b44b7851sm6881257ejj.182.2023.03.02.02.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 02:00:24 -0800 (PST)
Date: Thu, 2 Mar 2023 12:00:22 +0200
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
Message-ID: <20230302100022.vcw5kqpiy6jpmq3r@skbuf>
References: <cover.1677699407.git.daniel@makrotopia.org>
 <9a788bb6984c836e63a7ecbdadff11a723769c37.1677699407.git.daniel@makrotopia.org>
 <20230301233121.trnzgverxndxgunu@skbuf>
 <Y//n4R2QuWvySDbg@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y//n4R2QuWvySDbg@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_020027_112629_F0CE1428 
X-CRM114-Status: GOOD (  24.22  )
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

On Thu, Mar 02, 2023 at 12:03:45AM +0000, Daniel Golle wrote:
> On Thu, Mar 02, 2023 at 01:31:21AM +0200, Vladimir Oltean wrote:
> > On Wed, Mar 01, 2023 at 07:55:05PM +0000, Daniel Golle wrote:
> > > Also set bit 12 which disabled the RX FIDO clear function when setting up
> > > MAC MCR, as MediaTek SDK did the same change stating:
> > > "If without this patch, kernel might receive invalid packets that are
> > > corrupted by GMAC."[1]
> > > This fixes issues with <= 1G speed where we could previously observe
> > > about 30% packet loss while the bad packet counter was increasing.
> > > 
> > > [1]: https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/d8a2975939a12686c4a95c40db21efdc3f821f63
> > > Tested-by: Bjørn Mork <bjorn@mork.no>
> > > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > > ---
> > 
> > Should this patch be submitted separately from the series, to the
> > net.git tree, to be backported to stable kernels?
> 
> Maybe yes, as this issue may affect e.g. the BPi-R3 board when used
> with 1G SFP modules. Previously this has just never been a problem as
> all practically all boards with MediaTek SoCs using SGMII also use the
> MediaTek MT7531 switch connecting in 2500Base-X mode.
> 
> Should the Fixes:-tag hence reference the commit adding support for the
> BPi-R3?

If it's not an issue that affects existing setups, there is no need to
backport the patch. But it needs to be clearly described as such in the
commit message.

You mention <= 1G speeds, but then only talk about 1G SFP modules.
I see that the mtk_eth_soc driver also sets "gmii" and "rgmii" in
phylink's supported_interfaces. Those are also <= 1G speeds. There could
also be SGMII on-board PHYs. Does the RX FIFO clearing issue not affect
those?

