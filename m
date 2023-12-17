Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8851CC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Dec 2023 12:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Lg07BUdOWLUb55sl4jY2nUVlLAz2wv5V6/HSrQCs+4=; b=ryPWUEikkVR368
	57VtOGGzxXNk6OZvxhWb2ToUX4MWcK8b7uok9J/ybRbr5z/DmGM65IDu9a8mosQakJNg67SHXxct+
	54PR5TwcLH95nQBokTFj3FAaurf09RIxvyJrqN9T4lCZyGXpBTqbE75LWfudxFtUdf2NnIVWnPg8Y
	TMLe8TK9g7XNj7UmMkea9xTPOuPUpGGp4OJjVfH6KEkz3CvUb7y2ao4zGko/qzow2OprawdVz/XGk
	virA57KwzLDWvRzs3iMnfmC7pQtjBkHg5ri9Lc8oqyY9lSBdHP+6QJDH5811kNUQzLRWAnerCXKIh
	J3hFHwqPA4SyPXMVgkDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEppe-007jIJ-2g;
	Sun, 17 Dec 2023 12:01:18 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEppb-007jHe-06;
	Sun, 17 Dec 2023 12:01:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C0F3660005;
	Sun, 17 Dec 2023 12:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1702814469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Lg07BUdOWLUb55sl4jY2nUVlLAz2wv5V6/HSrQCs+4=;
	b=ZP2lPxfBeruufnF1FkXf5EEupfSURUouUpZVNBWpt9hzX776i2vf0egCVk609emM5rwQOe
	8UyasLk7LJ7an88tcOqUzI2yU0vxxW42D08t6m7itnmaLDC+K0tGN2qiCzQNbvEsWBBsxY
	hwbmguqITa0CkysH9MJo59hXkNR7zXolm5/uBOaY9Cw7LgDEkeoON6AlnMZemUu+5XX1Fv
	XXaMWPBMk8nFhPY/753hBJQcplIOBFEgQ3MkD6wCJqDZjT/Ps4/jfwuqTadyGBFwrybnRh
	d41T+ISJmN+alFszpETgB4FvSKcitQEgrV19AO92Zg5aZdTaVoklFrvqBnAmLw==
Message-ID: <968d0374-2584-42dd-9ec4-c30fb01c5202@arinc9.com>
Date: Sun, 17 Dec 2023 15:01:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 05/15] net: dsa: mt7530: improve code path for
 setting up port 5
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
References: <20231118123205.266819-1-arinc.unal@arinc9.com>
 <20231118123205.266819-6-arinc.unal@arinc9.com>
 <ZVjNJ0nf7Mp0kHzH@shell.armlinux.org.uk>
 <5e95a436-189f-412e-b409-89a003003292@arinc9.com>
 <20231207180332.ugfp33xcdkw3elrw@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20231207180332.ugfp33xcdkw3elrw@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_040115_228742_D0D2B872 
X-CRM114-Status: GOOD (  11.92  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, "Russell King \(Oracle\)" <linux@armlinux.org.uk>, Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, mithat.guner@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 7.12.2023 21:03, Vladimir Oltean wrote:
> On Sat, Dec 02, 2023 at 11:36:03AM +0300, Arınç ÜNAL wrote:
>> On 18.11.2023 17:41, Russell King (Oracle) wrote:
>>>> For the cases of PHY muxing or the port being disabled, call
>>>> mt7530_setup_port5() from mt7530_setup(). mt7530_setup_port5() from
>>>> mt753x_phylink_mac_config() won't run when port 5 is disabled or used for
>>>> PHY muxing as port 5 won't be defined on the devicetree.
>>>
>>> ... and this should state why this needs to happen - in other words,
>>> the commit message should state why is it critical that port 5 is
>>> always setup.
>>
>> Actually, port 5 must not always be setup. With patch 7, I explain this
>> while preventing mt7530_setup_port5() from running if port 5 is disabled.
>>
>> Arınç
> 
> Then change that last paragraph. You could say something like this:
> 
> To keep the cases where port 5 isn't controlled by phylink working as
> before, we need to preserve the mt7530_setup_port5() call from mt7530_setup().
> 
> I think it's a case of saying too much, which sparks too many unresolved
> questions in the reader's mind, which are irrelevant for the purpose of
> this specific change: eliminating the overlap between DSA's setup() time
> and phylink.

Will do, thanks.

