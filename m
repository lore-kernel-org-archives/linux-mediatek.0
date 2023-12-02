Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29525C4167B
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Dec 2023 08:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U2wLMvIIVt4NNTdGsFG3SPBRcTEOfz3PdLa/GlA7GzU=; b=dapCBbVuRkYqJl
	1E9UnR1rkY82i7xNg9vDGuW/J1s+0YjeTc7wbu1EZEcnBS3+L/Tx70yhzMThPXd6ZTzNYXRPV+uNe
	sMhEoAk0lat+9mOxFOizWSj7dzbzrgTIh8J4ePG7QpMkH2S0OGRwJCSMogA2bvYYLDMvfcdAJU3J9
	JoIEa0MRQPmqG5OC2zPzZfnxaS/COxCxanEPls5NVS0t0VfkUKQDi79r4Ilx/mdq7fvbvWHrLHhm3
	JOXL7v5/lAVacmh2B6UOAk6BWwDfWo+w+1p9xDf1hfri2rpqWtDzKL5z9CtTtyul/Aun6yKKAKWWY
	dUuKnJA5yWLeIYlaFaSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9LUW-00FJvG-2b;
	Sat, 02 Dec 2023 08:36:48 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9LUS-00FJuC-13;
	Sat, 02 Dec 2023 08:36:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6476F240003;
	Sat,  2 Dec 2023 08:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1701506200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U2wLMvIIVt4NNTdGsFG3SPBRcTEOfz3PdLa/GlA7GzU=;
	b=pCSuWAI9D8zF/hQO2V4ig9tFsgd/ew1diFvWU/0pjWH64JXKoxcouGA+Mzja+/yl4zDoov
	dZF4PpQQKhIXp3LNwFSJGwiHwdRNE7yZs8buTVxP+k7oTs/212WKhDvPKSFzNsn0ALf0oL
	q68fPW3eq2W9Db7kqa7QDVT6YQPyFgz7AstIXWbpDUCmHorRjocpPgjfmee9962uKVqPfn
	R9v1QZxORbOLzp1WoB71qxsDqJeFLkW2OYmpzw/YWXZvhxXoOBJ1PX/7dW+/B1ZIpoY+Jv
	mpVGOWeakcUTBSIRkNJA/4MjvH1fKxC0GmD4coHpvGPYI5Tb00JUT2hfNN4H+A==
Message-ID: <5e95a436-189f-412e-b409-89a003003292@arinc9.com>
Date: Sat, 2 Dec 2023 11:36:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 05/15] net: dsa: mt7530: improve code path for
 setting up port 5
Content-Language: en-US
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20231118123205.266819-1-arinc.unal@arinc9.com>
 <20231118123205.266819-6-arinc.unal@arinc9.com>
 <ZVjNJ0nf7Mp0kHzH@shell.armlinux.org.uk>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <ZVjNJ0nf7Mp0kHzH@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231202_003644_519149_6C3CD86D 
X-CRM114-Status: GOOD (  12.59  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, mithat.guner@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 18.11.2023 17:41, Russell King (Oracle) wrote:
> On Sat, Nov 18, 2023 at 03:31:55PM +0300, Arınç ÜNAL wrote:
>> There're two code paths for setting up port 5:
>>
>> mt7530_setup()
>> -> mt7530_setup_port5()
>>
>> mt753x_phylink_mac_config()
>> -> mt753x_mac_config()
>>     -> mt7530_mac_config()
>>        -> mt7530_setup_port5()
>>
>> Currently mt7530_setup_port5() from mt7530_setup() always runs. If port 5
>> is used as a CPU, DSA, or user port, mt7530_setup_port5() from
>> mt753x_phylink_mac_config() won't run. That is because priv->p5_interface
>> set on mt7530_setup_port5() will match state->interface on
>> mt753x_phylink_mac_config() which will stop running mt7530_setup_port5()
>> again.
>>
>> Therefore, mt7530_setup_port5() will never run from
>> mt753x_phylink_mac_config().
>>
>> Address this by not running mt7530_setup_port5() from mt7530_setup() if
>> port 5 is used as a CPU, DSA, or user port. This driver isn't in the
>> dsa_switches_apply_workarounds[] array so phylink will always be present.
>>
>> For the cases of PHY muxing or the port being disabled, call
>> mt7530_setup_port5() from mt7530_setup(). mt7530_setup_port5() from
>> mt753x_phylink_mac_config() won't run when port 5 is disabled or used for
>> PHY muxing as port 5 won't be defined on the devicetree.
> 
> ... and this should state why this needs to happen - in other words,
> the commit message should state why is it critical that port 5 is
> always setup.

Actually, port 5 must not always be setup. With patch 7, I explain this
while preventing mt7530_setup_port5() from running if port 5 is disabled.

Arınç

