Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951E3C47258
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jan 2024 22:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=npd3pP1aReG/0ALjdGC6r+4bjQEOxICwXHbbVuqWcZ4=; b=p/n5YYtYGLMuUCwtzjCdC97ioI
	SPwDMf+WRMXhNDWAbOVggvUHqK2E74Imj6BQ4OGXzhZsDs8qrKgG964b4fcc3T6WNMMTDrk5cPKZv
	fDSqsjnrP9Bfm6bG3MvsGxweHGftrtAW9toslctM8GN1quQsNQwIHActIwC+bulsaDbGI+9xmvTpC
	gtWe0D7cYSzJFU8Kteqy+JMPxmBo9Zb69ucwdlqn3lSn4T+ye8KPB7ir4ulNOfp9JvBxhwkkg0zhT
	fXqbsNuARl+maRpdTHh1EO0BbzJKFMY5sLXMvD+Vk0u5ONtzxAIj1VoL2u7RiUZRo841Rx5MOjIaP
	c5/5dPVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT8Wz-00000002Hpj-0ROR;
	Thu, 25 Jan 2024 22:49:09 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT8Wv-00000002Hno-1fW2;
	Thu, 25 Jan 2024 22:49:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D7D4FF802;
	Thu, 25 Jan 2024 22:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1706222941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=npd3pP1aReG/0ALjdGC6r+4bjQEOxICwXHbbVuqWcZ4=;
	b=b6390NbnuGXNe15DVpYrjlfa1PtjIqNM14bhVWY5DOZGJW3IrdQIxWsUry2cdr1ko4tpL2
	XYaM1eDs04rTuDv05UpUPeHePQfY40n9AM2SyvBKizzy15WRT2ukePEzD+BXGzNyI1EqBU
	01dehgiepB3Gv3jPJidrzbLlzOUFiR8vrCCOrr7SCkp39Ri65quXPYI8i/WVMZVqTE6V0/
	wxP2F8GR/RfCJ0XPj6t+8LoFzMkdRjpgiao5ymJs8U7x5dt/dgxDeFU/8k/H5Q0/enjohq
	/3sdCLsg8wTcKEoVz3cM7v9dZsF2g6pZ/mCLagndFZfRHWxcMcMoZo/sX0pyLg==
Message-ID: <a5b37e23-5f88-4a23-a1e3-908513a64f03@arinc9.com>
Date: Fri, 26 Jan 2024 01:48:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 6/7] net: dsa: mt7530: do not set
 priv->p5_interface on mt7530_setup_port5()
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Russell King <linux@armlinux.org.uk>
Cc: mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
 Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240122-for-netnext-mt7530-improvements-1-v3-0-042401f2b279@arinc9.com>
 <20240122-for-netnext-mt7530-improvements-1-v3-6-042401f2b279@arinc9.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240122-for-netnext-mt7530-improvements-1-v3-6-042401f2b279@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_144905_618829_A41BF7CA 
X-CRM114-Status: GOOD (  15.54  )
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

Vladimir could you review this too? This is the only patch remaining
without a review or ACK.

Arınç

On 22.01.2024 08:35, Arınç ÜNAL via B4 Relay wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Running mt7530_setup_port5() from mt7530_setup() used to handle all cases
> of configuring port 5, including phylink.
> 
> Setting priv->p5_interface under mt7530_setup_port5() makes sure that
> mt7530_setup_port5() from mt753x_phylink_mac_config() won't run.
> 
> The commit ("net: dsa: mt7530: improve code path for setting up port 5")
> makes so that mt7530_setup_port5() from mt7530_setup() runs only on
> non-phylink cases.
> 
> Get rid of unnecessarily setting priv->p5_interface under
> mt7530_setup_port5() as port 5 phylink configuration will be done by
> running mt7530_setup_port5() from mt753x_phylink_mac_config() now.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>   drivers/net/dsa/mt7530.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 33c15f10de34..5394d8c6a40e 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -978,8 +978,6 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
>   	dev_dbg(ds->dev, "Setup P5, HWTRAP=0x%x, intf_sel=%s, phy-mode=%s\n",
>   		val, p5_intf_modes(priv->p5_intf_sel), phy_modes(interface));
>   
> -	priv->p5_interface = interface;
> -
>   unlock_exit:
>   	mutex_unlock(&priv->reg_mutex);
>   }
> 

