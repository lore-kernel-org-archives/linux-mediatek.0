Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BB7C636CC
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 22:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jurn9Xl39+lOyl7ynfR7764vZm+bPZub6GwDaU1WTio=; b=zRy8tMpilaldMCwz5x4lcxgAbk
	mEgQpTCCQDL5sKqDMgdb9JnR36HsBW833xlfhc0BaHago/OFKO0m/O7bdHwmMUfsgwhIWyLyTlzSr
	zM6Mk5ISqKgZUnr/sSgOICDLs71TlYfO9E8bpQbBBuG3TG63P/zucVZhJZITbN3FdU6L+ZF4z/7BV
	s1cBgVXd8hBWF2+shPX8JR8V4B3MkX+a7nrCGz7qZmJWRH8XRxYguWDPao6VaWQrd93zxVxE92nQ/
	KX1AAeNtxYEaQ+zj5CdxaAZCyBQELEZmtTAepn2W+RLj1ZtUTIbLdn9ncMf2aP2Y5abRWxOrcLwwv
	fNJOKmOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO4eX-003uIB-Ed; Fri, 03 Feb 2023 22:35:29 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO4WQ-003rD9-2i; Fri, 03 Feb 2023 22:27:07 +0000
Received: by mail-wm1-x332.google.com with SMTP id q10-20020a1cf30a000000b003db0edfdb74so6219306wmq.1;
        Fri, 03 Feb 2023 14:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jurn9Xl39+lOyl7ynfR7764vZm+bPZub6GwDaU1WTio=;
        b=iYjzenTqutnchFRPKwX069Lo8OCMSAnSdKZhm8TuPGub/Mba05GXm13GEKbRQgP+/D
         gZQxqDAgqnPxtgms2QnozyCRD0AgKFsW6Eeu0TPie6OTGD29BNa6rrb8rLxMFPnlEh3Y
         YaDk37QDaMw+TP4pM+Zx4pnANzFBahhNxXLTb4uxnwk3npOuCmzczbkLMCtWiLEKbqV0
         /qxbig3R9W3uWHethRwpNlDzpznirjDBeXR12KKYu1o9GJWhHzODazGUZzA4Z/hoeV4E
         UcMHRz4axOnpAu4AJ583f5G9JXE0uOVCiqkvnMU8lT9ME5ww6hnjiDwlXZWUdnFX9CSd
         nEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jurn9Xl39+lOyl7ynfR7764vZm+bPZub6GwDaU1WTio=;
        b=UlsJYeUjH7ESdWmiQrTeQHIMIxgHftHdDH6kZakBCuarxNlL7sMirgXcgwrg2dkptH
         77k0t9btg1MzakAZ7MOZhTn3gz4Q0QvrHZm3wZaOYzNhAugMHdTbGVIJ68d+gOuY9EE2
         JkKJoO6x+hysWGiTXAP2c/yJ9p30xmpntT6BPTjdjD+zktQxqkAffxUAkAmD07t8QZii
         R8pxluygdw+V98lglruxfMnX9DaRYUEesnM08h+wYi8PzkjoXWkqPc8oWFgAzofuYejD
         Puie3oq0FbY85pS0b46pv5QxssaN7ZecwM2TgpkkDtZM/lWXpp6uzrpqRbAzwX8Huu67
         rRtg==
X-Gm-Message-State: AO0yUKUdZ221KJOvXnD2yt5W7GV7Z4k/0zXprs8DzngXnPB8wH4jl7mv
	sNcQpucuHr6FgAgpfafzPIg=
X-Google-Smtp-Source: AK7set/ZNS0u1GzxheAwHXQZQ/S4Daj7aBkBSdtH4UG7XIyINkTzXTlsjMBri8WQnjjawyjOJz8GYg==
X-Received: by 2002:a05:600c:1f10:b0:3db:742:cfe9 with SMTP id bd16-20020a05600c1f1000b003db0742cfe9mr11765807wmb.34.1675463219130;
        Fri, 03 Feb 2023 14:26:59 -0800 (PST)
Received: from skbuf ([188.26.57.116])
        by smtp.gmail.com with ESMTPSA id o2-20020a05600002c200b002bde537721dsm3017536wry.20.2023.02.03.14.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 14:26:58 -0800 (PST)
Date: Sat, 4 Feb 2023 00:26:55 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
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
	Jianhui Zhao <zhaojh329@gmail.com>,
	=?utf-8?B?QmrDuHJu?= Mork <bjorn@mork.no>
Subject: Re: [PATCH 2/9] net: ethernet: mtk_eth_soc: set MDIO bus clock
 frequency
Message-ID: <20230203222655.gjfasxbw2je3r5pz@skbuf>
References: <cover.1675407169.git.daniel@makrotopia.org>
 <cover.1675407169.git.daniel@makrotopia.org>
 <a613b66b4872b5f3f09544138d03d5326a8f6f8b.1675407169.git.daniel@makrotopia.org>
 <a613b66b4872b5f3f09544138d03d5326a8f6f8b.1675407169.git.daniel@makrotopia.org>
 <20230203214844.jqvhcdyuvrjf5dxg@skbuf>
 <Y92Hc++jn6M6AIBQ@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y92Hc++jn6M6AIBQ@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_142706_194412_A44E1383 
X-CRM114-Status: GOOD (  11.43  )
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

On Fri, Feb 03, 2023 at 11:15:15PM +0100, Andrew Lunn wrote:
> > Checking for valid range? There should also probably be a dt-bindings
> > patch for this.
> 
> This is a common mdio property in mdio.yaml. So there should not be
> any need for a driver specific dt-binding.

I meant it would probably be informative if the dt schema for this MDIO
controller had a "default: $val", "minimum: $val" and "maximum: $val".

