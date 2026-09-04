Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDE9C624D3
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 10:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D3ZDNZuwLBYYUJaypoIthhBgqLX74axE6YBn4AHc59c=; b=gEvK3+qXx0iB6kl4uwy4npm1Zj
	Mz4TCa8wU6gK819eiVmBajP+BoYTbLgRQ7wAFFjoCOBJKR32Zudo8bMJTwqt1rMrPFVGTQNUAAm6a
	eTrj3Aro/I5dXoN690J9I/0wLSKsYzCzCPY0NeRs7ktVy8tavm6YWgcslm2OrknnCzgpBqfarcvii
	hLA0XmhkO8SSdSEShLxcjytlO/yaIG+aDzCTu0qckgZUVM+LBGIEpA7mxN/v3w3RUIsgVDepPdC+p
	1tw0/VYZDfWBZMTt5njLfOXDVmhkfHnZA9u8bGfupGygndC1ZKwRL+2bbmxotr14tz3po6rW3Jr/C
	CBuRQd+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2QiP-00000001bgG-3FIS;
	Fri, 04 Sep 2026 10:00:09 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2QiM-00000001beo-2zy4;
	Fri, 04 Sep 2026 10:00:08 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100)
	(envelope-from <daniel@makrotopia.org>)
	id 1x2Qhj-000000001se-1EmA;
	Fri, 04 Sep 2026 09:59:27 +0000
Date: Fri, 4 Sep 2026 10:59:21 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: dario.binacchi@amarulasolutions.com, mkl@pengutronix.de,
	mailhol@kernel.org, msp@baylibre.com, florian.fainelli@broadcom.com,
	jonas.gorski@gmail.com, andrew@lunn.ch, olteanv@gmail.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, kurt@linutronix.de, hauke@hauke-m.de,
	chester.a.unal@arinc9.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com,
	linusw@kernel.org, luizluca@gmail.com, alvin.sipraga@analog.com,
	clement.leger@bootlin.com, justin.chen@broadcom.com,
	dlan@kernel.org, rogerq@kernel.org, hkallweit1@gmail.com,
	linux@armlinux.org.uk, rjui@broadcom.com, sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com, opendmb@gmail.com,
	andrei.botila@oss.nxp.com, wangruikang@iscas.ac.cn,
	amadeus@jmu.edu.cn, kees@kernel.org, tmshlvck@gmail.com,
	c-vankar@ti.com, horms@kernel.org, vadim.fedorenko@linux.dev,
	daniel.zahka@gmail.com, nora.schiffer@ew.tq-group.com,
	v-singh1@ti.com, oss@vassilevski.com, haokexin@gmail.com,
	alex@sverdlin.org, aleksandr.loktionov@intel.com,
	lgs201920130244@gmail.com, linux-can@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-omap@vger.kernel.org
Subject: Re: [PATCH net-next 14/33] net: dsa: mxl-gsw1xx: Remove comma after
 sentinel-entry in match-table
Message-ID: <apqWeTNBFzOJptkf@makrotopia.org>
References: <20260904043724.2955444-1-s-vadapalli@ti.com>
 <20260904043724.2955444-15-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904043724.2955444-15-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_030006_753855_760B5D19 
X-CRM114-Status: GOOD (  14.61  )
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

On Fri, Sep 04, 2026 at 10:06:20AM +0530, Siddharth Vadapalli wrote:
> Since sentinel is the last entry and we do not expect further entries
> following it, remove the comma.
> 
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>  drivers/net/dsa/lantiq/mxl-gsw1xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/dsa/lantiq/mxl-gsw1xx.c b/drivers/net/dsa/lantiq/mxl-gsw1xx.c
> index a1104b2f92a9..347e16e9fdc1 100644
> --- a/drivers/net/dsa/lantiq/mxl-gsw1xx.c
> +++ b/drivers/net/dsa/lantiq/mxl-gsw1xx.c
> @@ -918,7 +918,7 @@ static const struct of_device_id gsw1xx_of_match[] = {
>  	{ .compatible = "maxlinear,gsw140", .data = &gsw140_data },
>  	{ .compatible = "maxlinear,gsw141", .data = &gsw141_data },
>  	{ .compatible = "maxlinear,gsw145", .data = &gsw140_data },
> -	{ /* sentinel */ },
> +	{ /* sentinel */ }
>  };

Reviewed-by: Daniel Golle <daniel@makrotopia.org>

