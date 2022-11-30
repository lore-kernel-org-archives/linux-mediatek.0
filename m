Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E77C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Nov 2022 17:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NbXEpZ0aVb9mBV+yGpUjXQNqRrz9CwkBfjyCJADEE7w=; b=VOGn9jJFU68hsD
	zXql5PMqZICkpPYS4Y47irOcKpfGUMjboY79RwM9kZ8M+Gs9pfVy3AVcCjQRi6FDgA+haQSaRu0cv
	KUDieeoJUkr8KR9xiLFfd8PloZMBZGlL+lHnfYYB4CCq/93OMEDZRXfd0b3YHJ3FtLDx/dNOWV6De
	qfH7AxSE8WtA6kg8c+DPd74ugQGHR4BskVm1IpsA2zowjg9bVu6XWIFFj0Z6KgubbcmTOQmwn7yvK
	HHH08MqL8sq9bKjq3M2m4Mly0jI804dDwTnekfMmYKpSgoW0RdSpTocE24Q9FLPzF4kNBxGQcNOlc
	S4nUr4GE1ngpbz/obSJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0REx-001CJ6-Gz; Wed, 30 Nov 2022 17:51:23 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Qoe-000yFM-FA; Wed, 30 Nov 2022 17:24:14 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1669828953; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S/tfmU/bGGwQvtztH48Ct75lrbtqrXhXhFaZ/qxNerqJ91kUiHyxbc1jZgMG+4D0FKKkKH/4VQ3BLtqRTavpPoP0qk/GhDBztMZabk/SDYZC/2nEdVUnHFj4lt4oCEoZYdqNVJlYpWtQohH7Xk7iafENArs6IvnxKDn4lbCO+NY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1669828953; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=NbXEpZ0aVb9mBV+yGpUjXQNqRrz9CwkBfjyCJADEE7w=; 
	b=C23QGjP6pvzkPw8IT2Uuj+OI28I1OxDdVDda3ZHxJKaLJwmEtBXvApFXi3zZ/mEx84iI22v9FKFVcEQyP1mwTeNAA8c8CIyncscoEw3nyF5RjPbZJoaHJj5B5pIq3hX61yGE+U4Eyaav9m6qghMn5BR1/svu5KRcXCc4bCqS2NY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1669828952;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=NbXEpZ0aVb9mBV+yGpUjXQNqRrz9CwkBfjyCJADEE7w=;
	b=fgVncX7MMGMyEBfpkO8jiLauPmhaMoiVDaHCHtIu1b+XSbYbH5rq3QxvQ66+UjGq
	V03JuP9AIYknMLnVMBa8W3NqAG1KZGS1eLpr23f5DQnweBY5641jnmU3F92tMwbCwcF
	9EJMyICQRP12neK7zmEutFcDRBKbw0f9SP1sI86M=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1669828951728942.0277054948851; Wed, 30 Nov 2022 09:22:31 -0800 (PST)
Message-ID: <32638470-b074-3b14-bfb2-10b49307b9e3@arinc9.com>
Date: Wed, 30 Nov 2022 20:22:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/5] remove label = "cpu" from DSA dt-binding
To: Andrew Lunn <andrew@lunn.ch>
References: <20221130141040.32447-1-arinc.unal@arinc9.com>
 <Y4d9B7VSHvqJn0iS@lunn.ch>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <Y4d9B7VSHvqJn0iS@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_092412_676797_DEA5708D 
X-CRM114-Status: GOOD (  18.32  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Tim Harvey <tharvey@gateworks.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Stefan Agner <stefan@agner.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Oleksij Rempel <linux@rempel-privat.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, Florian Fainelli <f.fainelli@gmail.com>, Samuel Holland <samuel@sholland.org>, Michael Ellerman <mpe@ellerman.id.au>, Gregory Clement <gregory.clement@bootlin.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team <linux-imx@nxp.com>, Ray Jui <rjui@broadcom.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, linux-mips@vger.kernel.org, linux-rockchip@lists.infradead.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Scott Branden <sbranden@broadcom.com>, netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, Rasmus Villemoes <rasmus.villemoes@prevas.dk>, Nicolas Ferre <nicolas.ferre@microchip.com>, "David S. Miller" <davem@davemloft.net>, linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>, Michael Riesch <michael.riesch@wolfvision.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 30.11.2022 18:55, Andrew Lunn wrote:
> On Wed, Nov 30, 2022 at 05:10:35PM +0300, Arınç ÜNAL wrote:
>> Hello folks,
>>
>> With this patch series, we're completely getting rid of 'label = "cpu";'
>> which is not used by the DSA dt-binding at all.
>>
>> Information for taking the patches for maintainers:
>> Patch 1: netdev maintainers (based off netdev/net-next.git main)
>> Patch 2-3: SoC maintainers (based off soc/soc.git soc/dt)
>> Patch 4: MIPS maintainers (based off mips/linux.git mips-next)
>> Patch 5: PowerPC maintainers (based off powerpc/linux.git next-test)
> 
> Hi Arınç
> 
> So your plan is that each architecture maintainer merges one patch?

Initially, I sent this series to soc@kernel.org to take it all but Rob 
said it must be this way instead.

> 
> That is fine, but it is good to be explicit, otherwise patches will
> fall through the cracks because nobody picks them up. I generally use
> To: to indicate who i expect to merge a patch, and everybody else in
> the Cc:

Thanks for this, I'll follow suit if I don't see any activity for a few 
weeks.

> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> 
>      Andrew

Arınç

