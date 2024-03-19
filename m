Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09706C54E68
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Mar 2024 18:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fv2051snAyT0eeP1g4GETpuY9+iur6NRFV2erufXG04=; b=Aurh5Ndtk2LMK48Pt3UWUyPyvI
	TTu0NDlXPUnRBZFaLN5+utnyjjMY3WCwZ6ERRp2doEa5VAtgEpJ3zg2Tixcr8d0NDWHQLq4CsUusP
	2uXS5eD+mlysF/+QINZk+vLPStyDHJMC0ZztRSbIgeGVIUDsTgeAuYRT413mVLSIVtyLLnbSfnyZ7
	/fbhyaBF3gaB+7s5O1I2CeKXJJJhvz5bsg8mqz2VbOw1R/PC1FF9nIUWARq4hfcDyKGuHfTAjMpS+
	/2whyZcySkD+F3yhoeMvhk3yI7P0fqnZkgztAxaigDSuN/5//iubCWzALFZ8915TjX1fYdkY23tDt
	niTqRjYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmeFw-0000000Dpq7-0177;
	Tue, 19 Mar 2024 18:32:12 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmeFl-0000000Dpno-0rFO;
	Tue, 19 Mar 2024 18:32:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 69BDF40002;
	Tue, 19 Mar 2024 18:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710873115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fv2051snAyT0eeP1g4GETpuY9+iur6NRFV2erufXG04=;
	b=JW2NWByy238c24phHn4JpfEO3P6V7hpHACDjy/m4b/etcLoLcmwdnfx53P5crc1HKnSnYj
	ypP6+Gv72ZtAs0Cn+a8xYEWIrJHLKpl5+2FytO5g0/NWeqhxXQ4Ylo97zmccJ0IEU4U1QP
	YfSZYfUmQ8Zbf9NOUacBX9q2KxfgXmGivXITX+vb7fIM/MY1AemqLU/FR734BU2hAiN/S9
	KnkmN+6sGX1WiM3nhHmhv02s0QAxZVseXIyyUjfD5dvznT6rbye18t7PZHz1xqXvzXfj7O
	djP8vh9Bff4YlwV3yHK2xw5lHZBcnsAljQLEJ0Ko3DJYD+If1can1iaXqCfakQ==
Message-ID: <8c50fc86-256d-416a-ad58-1620b8fd848e@arinc9.com>
Date: Tue, 19 Mar 2024 21:31:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Fix EEE support for MT7531 and MT7988 SoC switch
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 Russell King <linux@armlinux.org.uk>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Bartel Eerdekens <bartel.eerdekens@constell8.be>, mithat.guner@xeront.com,
 erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <65f7f17d.050a0220.3c75a.cde3SMTPIN_ADDED_BROKEN@mx.google.com>
 <5514243b-c795-436e-8628-8f421c900bcb@gmail.com>
 <ea889226-3649-4f74-8c38-67c459e4ea4d@arinc9.com>
 <20240318-quizzical-raven-of-plenty-ef21f5@lemur>
 <20240319-uppish-idealistic-giraffe-e17cb4@lemur>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240319-uppish-idealistic-giraffe-e17cb4@lemur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_113201_432419_832F4324 
X-CRM114-Status: GOOD (  12.19  )
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

On 19.03.2024 19:03, Konstantin Ryabitsev wrote:
> On Mon, Mar 18, 2024 at 02:01:58PM -0400, Konstantin Ryabitsev wrote:
>>> It looks like my branch name was too long again. b4 0.13.0 cannot handle
>>> branch names that are too long. I'll keep it shorter for future
>>> submissions. It'd be great if Konstantin could provide a specific limit.
>>
>> It's not really b4, it's the web endpoint and the version of python it's
>> running. I hope to fix it soon by applying the same workarounds as we ended up
>> doing for b4 itself.
> 
> I've deployed the version of endpoint that works around this bug. Hopefully,
> you won't see it again regardless of the message-id length.

Thank you very much!

Arınç

