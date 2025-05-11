Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980F4C3ABCB
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 May 2025 17:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1o8V806NFIConNLc8885KE8QTfy5R2bUMg4nOs6tmA=; b=JFfKjHAwg8LkZglciNN/wX0ROy
	DIr5LZraLbxGIzKduMRcE9ojqfNVqAEy/3f0gtlOQP0e3wcpeezFTVjRocSnXFY8RHYw121sZ0t79
	6ard157T/dd15d0AWkBaOT0fTSGZHdw8+5benNjOpddozIQOj4gnf+jmvHz6aX9MfQyi3Oyo7aqZh
	XDR0in3fo1IJAGXrfVVYnAKV4JzNPsTN/WTwFiJYXVkR+FykqAEHAlgHkklXkZXs1JfGvgmqPsGBk
	75z79J0CneiqcbikV85geL9r4jIMXgTKbn7txZQR8v28ugAYTHiyMCsjdhy7XrMIGuhAM9Romfvm+
	RYnrOuzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEA7R-00000007ZU4-2mpo;
	Sun, 11 May 2025 17:05:41 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE9nq-00000007XtX-33NX;
	Sun, 11 May 2025 16:45:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=l1o8V806NFIConNLc8885KE8QTfy5R2bUMg4nOs6tmA=; b=RU5qdjuYx/ZXxe1RsvJ5AAlyqQ
	rS5lQCz+T06UioQDRdgpCw+rL42X4dSMWmftAwOIhOulLbeweA1hCKgpeeNtpV/3mjtns7eAMoKpz
	GZXzCNb9pRwoyrF/HlZflmUxf5ppnbNEdwVnWr+aE1p2S4gofevRViv0nhFrppycwpAA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uE9nc-00CGLD-HX; Sun, 11 May 2025 18:45:12 +0200
Date: Sun, 11 May 2025 18:45:12 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v1 02/14] dt-bindings: net: dsa: mediatek,mt7530: add
 dsa-port definition for mt7988
Message-ID: <88d93b58-84f3-4394-80ed-9adf67d525f4@lunn.ch>
References: <20250511141942.10284-1-linux@fw-web.de>
 <20250511141942.10284-3-linux@fw-web.de>
 <043d1a0a-1932-42f3-bcd8-17fad10c5543@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <043d1a0a-1932-42f3-bcd8-17fad10c5543@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_094526_763523_C19F8BA4 
X-CRM114-Status: UNSURE (   9.79  )
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
Cc: Landen Chao <Landen.Chao@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, Rob Herring <robh@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, May 11, 2025 at 06:34:30PM +0200, Andrew Lunn wrote:
> On Sun, May 11, 2025 at 04:19:18PM +0200, Frank Wunderlich wrote:
> > From: Frank Wunderlich <frank-w@public-files.de>
> > 
> > Add own dsa-port binding for SoC with internal switch where only phy-mode
> > 'internal' is valid.
> 
> So these internal PHYs don't have LEDs?

Ah, i got that wrong, sorry.

What i don't know about here is if you should be defining your own
ds-port binding, or taking the existing binding and add a constraint.

	Andrew

