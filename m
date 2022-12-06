Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6079C4708D
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Dec 2022 16:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t8cA4ACelgyjXGYdUQh+jD+jJuegWDTJ6AcOocRBXlg=; b=CrXK6yOsk9CQkqC/R4wVRfCb2a
	U1t4Tf+S7vMDbe6MRglIT6YD6idVMvEQb8BhI6cv2FKMiVZehBvasWenRs6O5wwOOc//ND/8g3P23
	ybKZEtxTCZ/9yOmnz7OC8zh7tY+fLNAHlX7pLCR99JPAnslLGYSlX/ffmC8dwAhOwEn8a/4qIEMpz
	xxNxVmMpeRqgT7PZIFZtMcNR4zgEBsiiWx3nC3pJlYQ2Wfu9GOMaEkql7rfpDBU9dpniaQVcr3ezS
	Q0+nD96wCt/el1bapjG1HcuSfXm85OWBV8413xIByvZZ3ZS+eZh7SyXEp8jAAAhLkp4m4VR4XDrUS
	r69DA1MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2aR3-00E2ls-Do; Tue, 06 Dec 2022 16:04:45 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2aQv-00E2Og-92; Tue, 06 Dec 2022 16:04:38 +0000
Received: by mail-ed1-x530.google.com with SMTP id c17so12376603edj.13;
        Tue, 06 Dec 2022 08:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t8cA4ACelgyjXGYdUQh+jD+jJuegWDTJ6AcOocRBXlg=;
        b=UDbZ7YkU9hRMLDz1egSCEnbQlgdWZjEVy636iYNE+34e/fSxF62gaDd6CTMdppFtCK
         gg/tmHGxjv6MmTRtOIK6cx2Jjb3mrtGU3frQXEfew2/+LTUEgbnyISdsKs3uGml2JOtZ
         JvYal2m3xNBsJGKirr1ul8T5Nqd523nKJZ5j/6tsiWtmmwa5Lq9hS9GDQVfeeHi8DuNO
         9AH2mDVYfYFz3XMKsNqvPsJgk2ntQaoPQjCS/0XXQ47EzhHk/ZzAcZeGVyZBpXi0/BKY
         ja42TGmlgxjL8R53NfB3B/0xZOOKq7jWt3JyWFWCklmO4Nc0rmdZcq3WlTtSguff+bFS
         +xvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t8cA4ACelgyjXGYdUQh+jD+jJuegWDTJ6AcOocRBXlg=;
        b=s6aFUsf6C0AWnEJ0N/tAtfjYGJ8jw6v8tFebbTaK4DNUSbugqHu/O06CkjLRdlXCct
         BXoeXG6eF3e52gLYCVGHHU+SHsoepHx4zvsk8DF7DzEvnYM1cd125J9+b2lpN2lIvIfS
         WcUsOfRxwrJ/2j1DIQ8i2OqIh/4XoXPe/9eJBEE1RAS4oXjcPD77dJ6nidLm780zksJE
         9se4+oGfFd7etmw9jTZlYnH9b+KI+yeUZ1dfPzKEt7vGN3D875VmnhL7fSjwQsXkfT3j
         6yqJbggvWeDw65fsuON1gwk6HUTzub7C208n0UzDtVJ3Gpes8P1nDWTXnKuc7spb2z/S
         EE3Q==
X-Gm-Message-State: ANoB5pm147kCns3E0iuCncXByPf4HwRnEZ3YAm5odOkLo5BMHRGt0O7o
	31b6/eyRC0Xy/fKCwSU/ppU=
X-Google-Smtp-Source: AA0mqf6eCz9WrlnsQ6nH/cJ10vu3pmDPK2/Tun57q7E62E++v7Ogms9pw0K/xifG+5+Clvkvi4W2KQ==
X-Received: by 2002:aa7:d1c5:0:b0:46b:a536:e8d0 with SMTP id g5-20020aa7d1c5000000b0046ba536e8d0mr26487265edp.261.1670342673471;
        Tue, 06 Dec 2022 08:04:33 -0800 (PST)
Received: from skbuf ([188.26.184.215])
        by smtp.gmail.com with ESMTPSA id gi20-20020a1709070c9400b0077d6f628e14sm7565992ejc.83.2022.12.06.08.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 08:04:33 -0800 (PST)
Date: Tue, 6 Dec 2022 18:04:30 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, netdev@vger.kernel.org,
	John Crispin <john@phrozen.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Marek Vasut <marex@denx.de>, Sean Wang <sean.wang@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	=?utf-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Linus Walleij <linus.walleij@linaro.org>,
	UNGLinuxDriver@microchip.com,
	Woojung Huh <woojung.huh@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	George McCollister <george.mccollister@gmail.com>
Subject: Re: [PATCH v4 net-next 0/9] dt-binding preparation for ocelot
 switches
Message-ID: <20221206160430.4kiyrzrumcc6dp2g@skbuf>
References: <20221202204559.162619-1-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221202204559.162619-1-colin.foster@in-advantage.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_080437_345281_04084EDB 
X-CRM114-Status: GOOD (  21.39  )
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

Hi Colin,

On Fri, Dec 02, 2022 at 12:45:50PM -0800, Colin Foster wrote:
> Ocelot switches have the abilitiy to be used internally via
> memory-mapped IO or externally via SPI or PCIe. This brings up issues
> for documentation, where the same chip might be accessed internally in a
> switchdev manner, or externally in a DSA configuration. This patch set
> is perparation to bring DSA functionality to the VSC7512, utilizing as
> much as possible with an almost identical VSC7514 chip.
> 
> This patch set changed quite a bit from v2, so I'll omit the background
> of how those sets came to be. Rob offered a lot of very useful guidance.
> My thanks.
> 
> At the end of the day, with this patch set, there should be a framework
> to document Ocelot switches (and any switch) in scenarios where they can
> be controlled internally (ethernet-switch) or externally (dsa-switch).
> 
> ---

This looks like a very clean implementation of what I had in mind
(better than I could have done it). Sorry for not being able to help
with the json-schema bits and thanks to Rob for doing so.

Would you mind adding one more patch at the beginning of the series
which syncs the maintainers from the DSA (and now also ethernet-switch)
dt-bindings with the MAINTAINERS file? That would mean removing Vivien
(see commit 6ce3df596be2 ("MAINTAINERS: Move Vivien to CREDITS")) and
adding myself. This is in principle such that you don't carry around a
not-up-to-date list of maintainers when adding new schemas.

I don't know if we could do something about maintainer entries in
schemas not becoming out of date w.r.t. the MAINTAINERS file.

