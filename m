Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 276EDC77B73
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Apr 2023 13:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vLoTHJAetAAx/st088ISjFct0J0mUgSu+NohRXJlu5M=; b=bq/bG9vtIDEWuI8Em5GcVldKyo
	KLbfsv2fGdTb5rkPix0myeE+52HnDAejIMO1C/ria0Tw5M8JG+jr7ULGmzkVrdPeEiiChRLsA+K8z
	7tfIcW9gNDJnD+5NMz0CTAHJgZBn8E/E9bAL9IfxCXLruzxvqaN68C1G6yT9DbB7sxPk0gGpamcFe
	x7vWkgQIwuDZv5nFWageWntrOGvDQxOBmhbis9hkARPNIhu3QiGb0y4jLuvsTNR3BUVMOXCF4DE43
	GUnBgEuAWmbrhc7PAhX5tw9myJiLwVOUGrV0Jggxosha6DitpI+mZYr+JIvv3VlEwwyElqaI/grg9
	jp7hIHrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1po2kX-00Dv3A-39;
	Sun, 16 Apr 2023 13:49:01 +0000
Received: from sender3-op-o19.zoho.com ([136.143.184.19])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1po2kU-00Dv2d-2I;
	Sun, 16 Apr 2023 13:49:00 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1681652912; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=oKB3zU+St+awaAk7qdZIjJP32Rd5veMINAJ9L+U/663EV3Ex1nTX057N1Vrwrfh5O/rGzeqayCczq7zPVNZxXx7pwduXwx7O1I3tYw29VRIaMWlufd91EA6TNF+uhuolIOoy5ZUwM3igl4VHFLMvxVKKpUt/Jje0fBlxhcqx1yE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1681652912; h=Content-Type:Content-Transfer-Encoding:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=vLoTHJAetAAx/st088ISjFct0J0mUgSu+NohRXJlu5M=; 
	b=m7YoFtg+2ri2pw6HUwLft0iK7FSorPAOpGbGV8fnx0tHU2y8spxqNLgYUikFkaPimq/rVNXSq9Dsl32x/z8vdIRyG07u3RR5pkI3vKUTirFmtOb86dnO8+0IIpmmSfPhFvVGk/ty/r5uBOZQnUXcRdVGrlKoSbUXq9FN3vQeD0E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1681652912;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=vLoTHJAetAAx/st088ISjFct0J0mUgSu+NohRXJlu5M=;
	b=fgfksLoll+82DwRnW3tGkpH/+HE7rSwZeDuMMUQe/a7jjbn4ElVb9eSiXIw+c+S/
	iiuCaHGwspyYjeDLiU7ZI4ugRCYHjdoALmyhzLYF0J+5FY+BLYdAjEAOKICnPcVZQUm
	SV4Jgklz2hmdFXfT+cN0GvL+L0Q9UurxcjqR3NFs=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 168165291218171.44379349923645; Sun, 16 Apr 2023 06:48:32 -0700 (PDT)
Message-ID: <8d36ff3b-e084-9f79-4c00-ec832f2cdbb3@arinc9.com>
Date: Sun, 16 Apr 2023 16:48:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH net-next v2] net: dsa: mt7530: fix support for MT7531BE
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>
References: <ZDvlLhhqheobUvOK@makrotopia.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <ZDvlLhhqheobUvOK@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230416_064858_783944_0D0D8B5D 
X-CRM114-Status: GOOD (  31.22  )
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

On 16.04.2023 15:08, Daniel Golle wrote:
> There are two variants of the MT7531 switch IC which got different
> features (and pins) regarding port 5:
>   * MT7531AE: SGMII/1000Base-X/2500Base-X SerDes PCS
>   * MT7531BE: RGMII
> 
> Moving the creation of the SerDes PCS from mt753x_setup to mt7530_probe
> with commit 6de285229773 ("net: dsa: mt7530: move SGMII PCS creation
> to mt7530_probe function") works fine for MT7531AE which got two
> instances of mtk-pcs-lynxi, however, MT7531BE requires mt7531_pll_setup
> to setup clocks before the single PCS on port 6 (usually used as CPU
> port) starts to work and hence the PCS creation failed on MT7531BE.
> 
> Fix this by introducing a pointer to mt7531_create_sgmii function in
> struct mt7530_priv and call it again at the end of mt753x_setup like it
> was before commit 6de285229773 ("net: dsa: mt7530: move SGMII PCS
> creation to mt7530_probe function").
> 
> Fixes: 6de285229773 ("net: dsa: mt7530: move SGMII PCS creation to mt7530_probe function")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

I'll put my 2 cents about the patch along with responding to your points 
on the other thread here.

> Why don't we use my original solution [1] which has some advantages:
> 
>  * It doesn't requrire additional export of mt7530_regmap_bus
> 
>  * It doesn't move PCS creation to mt7530.c, hence PCS_MTK_LYNXI is
>    only required for MDIO-connected switches
>    (with your patch we would have to move the dependency on PCS_MTK_LYNXI
>    from NET_DSA_MT7530_MDIO to NET_DSA_MT7530)

Maybe this is what should happen. Maybe the PCS creation (and therefore 
mt7530_regmap_bus) should be on the core driver. Both are on the MDIO 
driver for the sole reason of only the devices on the MDIO driver 
currently using it. It's not an MDIO-specific operation as far as I can 
tell. Having it on the core driver would make more sense in the long run.

> 
>  * It doesn't expose the dysfunctional SerDes PCS for port 5 on MT7531BE
>    This will still fail and hence result in probing on MT7531 to exit
>    prematurely, preventing the switch driver from being loaded.
>    Before 9ecc00164dc23 ("net: dsa: mt7530: refactor SGMII PCS creation")
>    the return value of mtk_pcs_lynxi_create was ignored, now it isn't...

Ok, so checking whether port 5 is SGMII or not on the PCS creation code 
should be done on the same patch that fixes this issue.

> 
>  * It changes much less in terms of LoC

I'd rather prefer a better logic than the "least amount of changes 
possible" approach.

Let's analyse what this patch does:

With this patch, mt7531_create_sgmii() is run after mt7530_setup_mdio is 
run, under mt753x_setup(). mt7531_pll_setup() and, as the last 
requirement, mt7530_setup_mdio() must be run to be able to create the 
PCS instances. That also means running mt7530_free_irq_common must be 
avoided since the device uses MDIO so mt7530_free_mdio_irq needs to be 
run too.

While probing the driver, the priv->create_sgmii pointer will be made to 
point to mt7531_create_sgmii, if MT7531 is detected. Why? This pointer 
won't be used for any other devices and sgmii will always be created for 
any MT7531 variants, so it's always going to point to 
mt7531_create_sgmii when priv->id is ID_MT7531. So you're introducing a 
new pointer just to be able to call mt7531_create_sgmii() on 
mt7530-mdio.c from mt7530.c.

On mt753x_setup(), if priv->create_sgmii is pointing to something it 
will now run whatever it points to with two arguments. One being the 
priv table and the other being mt7531_dual_sgmii_supported() which 
returns 1 or 0 by looking at the very same priv table. That looks bad. 
What could be done instead is introduce a new field on the priv table 
that keeps the information of whether port 5 on the MT7531 switch is 
SGMII or not.

A similar logic is already there on the U-Boot MediaTek ethernet driver.

https://github.com/u-boot/u-boot/blob/a94ab561e2f49a80d8579930e840b810ab1a1330/drivers/net/mtk_eth.c#L903

So this patch fixes the issue with the only consideration being changing 
as less lines of code as possible. And that's okay. We can make the 
least amount of changes to fix the issue first, then improve the driver. 
But there's nothing new made on the driver after the commit that caused 
this issue, backportability to the stable trees is a non-issue. So why 
not do it properly the first time?

Whatever the outcome with this patch is, on my upcoming patch series, I 
intend to move mt7531_create_sgmii to mt7530.c. Then introduce 
priv->p5_sgmii to get rid of mt7531_dual_sgmii_supported().

Arınç

