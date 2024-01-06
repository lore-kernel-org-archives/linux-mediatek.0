Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5366FC46CD2
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jan 2024 15:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=skoV/MYNvEJ7Q4zca+8v7GcUrjuUMIoeHzDPlkaXyPY=; b=pD2GLpIuKjsyfA
	JNlYaH+MhvqcCR8d2qiZNYPRvrhYFxxmBE4qtCPbRHqVMSiN9rwLZdPvf5jC1sBkgTcDrBkAIANjz
	4yfvwjtyaIgkHWcWAts2qdn+47HhpiiHGRu17R7OPBBk8weUSYEvWAO8bzpaIdAPSEVGkXT0lSrds
	AVw482DG6RK0efp7kMLQn9x1Bb+CTWFb3mWeEPTEjJA0X3ER2xYgpGKgvhkUDiVu9vOa0ufu44ClA
	vH/AWZkExDYulfSTWzpz2IGZDef9yjV1eVE3yFPYW6Jj3JvA1vEmtXqHTLldqlxn/kZAco8Zc9P4C
	l0vQMuZE/ZrWbgj+FWUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rM8Ah-001Tmc-03;
	Sat, 06 Jan 2024 15:01:11 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rM8Ac-001TlK-1J;
	Sat, 06 Jan 2024 15:01:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 567EF60002;
	Sat,  6 Jan 2024 15:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1704553261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=skoV/MYNvEJ7Q4zca+8v7GcUrjuUMIoeHzDPlkaXyPY=;
	b=pSMwvwgcVeeUxycO6OHaK+SCwICC7DmsXLDD+dHVpiqvO0ehxBcQ5/MPqdsrxBg/NXWYMM
	LWoCT1PqXQ24WS2lXN2D5dqv2Vqjli/duePWnVZeanTB3qG0b76eiJlmonD8EHlv7rkxSJ
	Xh7FC1AtuLcuVZBtJgSYMqofRC9mW3j09DgkAQqE9zR2KePRaDbzjry3Vda0HQw94rQSO5
	soUQPqFEhdcHl+p2Wme3AP/3ba68cDNQHbbCAMWx1yO35E66jANw6LaREYVSA5xcIZU9rM
	o1AtHTvKj1UeMjIKlfQRGy4cYpC/AlkfK4WYg8jDYiwdEc42jrmIs/P6U0zWGw==
Message-ID: <f9ad000a-2e42-4ddf-89a4-9a3ff452dc4b@arinc9.com>
Date: Sat, 6 Jan 2024 18:00:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 6/7] net: dsa: mt7530: do not set
 priv->p5_interface on mt7530_setup_port5()
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
References: <20231227044347.107291-1-arinc.unal@arinc9.com>
 <20231227044347.107291-7-arinc.unal@arinc9.com>
 <20240104154241.rxjins4mi5zkbhia@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240104154241.rxjins4mi5zkbhia@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240106_070106_740196_D1A3CDED 
X-CRM114-Status: GOOD (  13.28  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, Russell King <linux@armlinux.org.uk>, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, mithat.guner@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 4.01.2024 18:42, Vladimir Oltean wrote:
> On Wed, Dec 27, 2023 at 07:43:46AM +0300, Arınç ÜNAL wrote:
>> priv->p5_interface and priv->p6_interface are for use on the MT7531 switch.
>> They prevent the CPU ports of MT7531 to be configured again. They are
>> useless for MT7530. Therefore, remove setting priv->p5_interface for
>> MT7530.
>>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
> 
> What makes priv->p5_interface and priv->p6_interface useless for MT7530
> as you say? This code in mt753x_phylink_mac_config() seems executed
> regardless of switch family:
> 
> 	case 5:
> 		if (priv->p5_interface == state->interface)
> 			break;
> 
> 		if (mt753x_mac_config(ds, port, mode, state) < 0)
> 			goto unsupported;
> 
> 		if (priv->p5_intf_sel != P5_DISABLED)
> 			priv->p5_interface = state->interface;
> 		break;
> 	case 6:
> 		if (priv->p6_interface == state->interface)
> 			break;
> 
> 		mt753x_pad_setup(ds, state);
> 
> 		if (mt753x_mac_config(ds, port, mode, state) < 0)
> 			goto unsupported;
> 
> 		priv->p6_interface = state->interface;
> 		break;

This is also useless for non-MT7531 switches in the sense that it
unnecessarily prevents port 5 and 6 from being reconfigured. There's
nothing wrong with configuring them multiple times. These are the remains
of before phylink was implemented on this driver so the thought of changing
phy_interface_t on the fly was non existent. At that time, it was probably
made to apply to all switch models for convenience, as port 5 and 6 are CPU
ports so they're highly likely to be fixed links.

The reason I don't deal with this code block now is because I will get rid
of priv->p5_interface and priv->p6_interface when I also get rid of
priv->info->cpu_port_config() with a later patch.

Arınç

