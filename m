Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFBA7C7619A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 06:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o2miyoGfbCcRLimBj3L70ONV9oorgx56a71K9dJ05CE=; b=PyN0pAs/rbqub9
	pQfRfRyAfCYDPO4weSJ0mumk3+oIhdt/LBoz3TMxOzB503eiaAOQpawUHlBEZ/fNZ5VZ+GzL5KdsT
	3ogdQTyZc/geesc1SslE9+/L7K9SW/sShrisUsNE3XUo1G0yKIBeSLYhm6haZoGdKmhgu+ng4ilfD
	zAK0GuR5wWMPUqSBcNcVQDBVLLKYlxuJFgcNBpSlbDPyLFYQwFqg+YTcXKXBawK2BtSDx+/wwJX3r
	+ckTpXufXmqmk32S75usbn+OvuLh8vEtc7aFxH45xfdkChtEKzocJpkMaLHyewa/ZsTEeD9xKTzgu
	STmz2U+nU2Lt04lZJ7mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmU1D-001yO4-0B;
	Wed, 12 Apr 2023 06:31:47 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmU19-001yNE-1X;
	Wed, 12 Apr 2023 06:31:44 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1681281038; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=My2rJCFnTpnH+GL2v3ym4Pph4sOl8sHD+zJObog45cYOdAxD5Sau/XzTzcrpabz6dQtUIharubH4HHZ2Atptzkv2/cdV4aSNHQjNDznON6oz8X7ems+BcT07CCqbLgvn71/oqqpxIclfQ6iNffA2c10DRXx0MFagSfdue0Swyfc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1681281038; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=o2miyoGfbCcRLimBj3L70ONV9oorgx56a71K9dJ05CE=; 
	b=KITY1A4RVRs0t0PEQZD0UQWplgGdZPwsssWdrAnvK6b+miJYKiAph5ie0giCCpX5H4/JdeTCnZt24mVlVLhW/8kKHJDkPsg19lN5NuJLXTPVh0eY42ZbkSftqYVKaiRdGrSPrB9BUV/BidZGTJIO+7NB8fpIi9Xi1mBZm5Z9vvI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1681281038;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=o2miyoGfbCcRLimBj3L70ONV9oorgx56a71K9dJ05CE=;
	b=EdPisSJMMOUIbAUtQCFrnkidicWtGQqL8APAdPZQ5y2iEfkSSi6cyjdggiNjBI2E
	LoL6qwYcMfqP5rP99X00KQ0e5M6wyL+XhaB5MVWJxIiJc2KfFHNCsiQQrApLVYyKBrN
	OrIjXPWOlgcU/TiiGqFXwMhGT+AWr1TFaggrmL3Q=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1681281035406493.8289945315429; Tue, 11 Apr 2023 23:30:35 -0700 (PDT)
Message-ID: <8cdf8c13-0c6a-9e9a-871a-cb738a181b3f@arinc9.com>
Date: Wed, 12 Apr 2023 09:30:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 net-next 02/14] net: dsa: mt7530: fix phylink for
 port 5 and fix port 5 modes
To: Vladimir Oltean <olteanv@gmail.com>
References: <20230407134626.47928-1-arinc.unal@arinc9.com>
 <20230407134626.47928-3-arinc.unal@arinc9.com>
 <20230411150056.2uhtoy6iqnt2qopr@skbuf>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230411150056.2uhtoy6iqnt2qopr@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_233143_573616_65E58796 
X-CRM114-Status: GOOD (  24.64  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Richard van Schagen <vschagen@cs.com>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, erkin.bozoglu@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 11.04.2023 18:00, Vladimir Oltean wrote:
> On Fri, Apr 07, 2023 at 04:46:14PM +0300, arinc9.unal@gmail.com wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
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
>> The first code path is supposed to run when PHY muxing is being used. In
>> this case, port 5 is somewhat of a hidden port. It won't be defined on the
>> devicetree so phylink can't be used to manage the port.
>>
>> The second code path used to call mt7530_setup_port5() directly under case
>> 5 on mt7530_phylink_mac_config() before it was moved to mt7530_mac_config()
>> with 88bdef8be9f6 ("net: dsa: mt7530: Extend device data ready for adding a
>> new hardware"). mt7530_setup_port5() will never run through this code path
>> because the current code on mt7530_setup() bypasses phylink for all cases
>> of port 5.
>>
>> Fix this by leaving it to phylink if port 5 is used as a CPU, DSA, or user
>> port. For the cases of PHY muxing or the port being disabled, call
>> mt7530_setup_port5() directly from mt7530_setup() without involving
>> phylink.
>>
>> Move setting the interface and P5_DISABLED mode to a more specific
>> location. They're supposed to be overwritten if PHY muxing is detected.
>>
>> Add comments which explain the process.
>>
>> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
> 
> We have a natural language processing engine (AUTOSEL) which
> automatically picks up as candidates for "stable" those patches which
> weren't explicitly submitted through the proper process for that (and
> they contain words like "fix", "bug", "crash", "leak" etc).
> 
> Your chosen wording, both in the commit title and message, would most
> likely trigger that bot, and then you'd have to explain why you chose
> this language and not something else more descriptive of your change.
> It would be nice if you could rewrite the commit messages for your
> entire series to be a bit more succint as to what is the purpose of the
> change you are making, and don't use the word "fix" when there is no
> problem to be observed.

Will do, thanks.

Arınç

