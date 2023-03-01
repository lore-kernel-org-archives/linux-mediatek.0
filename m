Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A922C7EE23
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Mar 2023 23:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6jUS8n9lg5ijWAj5qDIi6FkkKAFasoVfY7e8vEy7IvM=; b=R3qS2Ts853THlaPAQGvMroLSQ8
	rkKneYRS8scMol98qQD7BmUWYHnwS2u3apxDCamYHXMr3PnvUO7Df/swFDtq5R9o9E5s41uxouiXP
	p28lZSMyV0z8traby6k8R923W7plVM/aBQ9XdCcdCXXDCQNJw7Y6wlS1doqTV712hxIs7fpdFgaXq
	9HaFxKFNk/6NdulH59a88EQU/UfoqRygxzhjrLhbnnsF6Tw499N3iwwP2i+0STorCLRRBP1IOkcNT
	MeSLgE4s8+BU+wJQWPpsOGPlWrrgd1pk3xqNP3HxVE/GCoMVMJA57sOpkTHu8vflLpqDDm8tzhGkD
	h5wa/siA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXVv4-000GDy-My; Wed, 01 Mar 2023 23:31:34 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXVuz-000GD6-SW; Wed, 01 Mar 2023 23:31:32 +0000
Received: by mail-ed1-x52b.google.com with SMTP id i34so60668254eda.7;
        Wed, 01 Mar 2023 15:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6jUS8n9lg5ijWAj5qDIi6FkkKAFasoVfY7e8vEy7IvM=;
        b=hXAjuASpDVoBDvFrgpEoN083JPnbLaB4WI691Y3TSgEEnIu0PjGAIEAtrxUiZASk1L
         y/u6VO+M1qFmDfIqfynfrfE3fomHbQvl3tj7SU+Iigh8XcfpjwaTs4r87GANIdrjJgkq
         pvEF7JjXOf7UF0Qf1y3tpwnGVbuzA9PZgwdpKGYLpQEdBXsxpzEYW9OfXJ9Q8ycYJq7T
         dsGlXpC/9qIIZTlcVZXTF0smydK9iumjYU0x+RBIfNXWylR85kAKVX95uUM6r7zgmw2O
         jCKb/Dy8eednFUON2e9Yf64eKRUZTxzWCbicdw9EFU3jb+qgGQqH+4DVBUwU7WDtIM8h
         sPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6jUS8n9lg5ijWAj5qDIi6FkkKAFasoVfY7e8vEy7IvM=;
        b=KCpIegEibrwEGFwoHQN+rRZadtvUzugUWFyKGtPrbYGCSdTrBqNEWhQo3BWxo7hvUU
         YPbIcT6+LYU/wGsGoOWRzLfiWHkNuNJSRgwASE3CeumuxW1eMdoLySekrOew8SClsxsT
         AJw1sSJWj9YQjRmqqhQvX/68cRl5WP0k2e15cHiQA1pRWCLQ0mcBj1RYang4jmtinE+/
         wwJISIa9fMzDVwjcRJNzkGiJTlSwhoCPAVE/IBL9po1/2QMB6js+ekzby3ikVhNFkqye
         ULXlHdveeLiX1mLro5DBnX4mq0pS3rVRLyaXBhHaHpAepcbvfX483NVLt8Ed5suv+Fv/
         dcSA==
X-Gm-Message-State: AO0yUKWwjhfVtk4SW1yR+MBlgep3PuuaMg+Hvq8xmNDhpf1NBJxFsm5I
	QrIYsitUxKehRvbuprVLS88=
X-Google-Smtp-Source: AK7set8z969kk793FiYkFoh/JWXyInKIiqDlZJN6AjuWjFSfkF8Dh7s6GEJ5JmlwgkyLWXS3JMuBEQ==
X-Received: by 2002:a17:907:6093:b0:8b2:d30:e722 with SMTP id ht19-20020a170907609300b008b20d30e722mr12240050ejc.3.1677713484433;
        Wed, 01 Mar 2023 15:31:24 -0800 (PST)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id fi5-20020a170906da0500b008e17dc10decsm6343841ejb.52.2023.03.01.15.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 15:31:24 -0800 (PST)
Date: Thu, 2 Mar 2023 01:31:21 +0200
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
Message-ID: <20230301233121.trnzgverxndxgunu@skbuf>
References: <cover.1677699407.git.daniel@makrotopia.org>
 <9a788bb6984c836e63a7ecbdadff11a723769c37.1677699407.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a788bb6984c836e63a7ecbdadff11a723769c37.1677699407.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_153130_003930_BFECA2D8 
X-CRM114-Status: GOOD (  13.13  )
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

On Wed, Mar 01, 2023 at 07:55:05PM +0000, Daniel Golle wrote:
> Also set bit 12 which disabled the RX FIDO clear function when setting up
> MAC MCR, as MediaTek SDK did the same change stating:
> "If without this patch, kernel might receive invalid packets that are
> corrupted by GMAC."[1]
> This fixes issues with <= 1G speed where we could previously observe
> about 30% packet loss while the bad packet counter was increasing.
> 
> [1]: https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/d8a2975939a12686c4a95c40db21efdc3f821f63
> Tested-by: Bjørn Mork <bjorn@mork.no>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---

Should this patch be submitted separately from the series, to the
net.git tree, to be backported to stable kernels?

