Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28355CD11DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Mar 2024 09:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5r0irEwQn1lB3UnLNAwqebaOIn42MDl/NmPOJcplkmY=; b=Gb30hXhyU9aNDK0iYJZWXO8tYs
	pOGo685P3J6bE9rO2mFNBPcbpNr+FHgCKXgGJoFKmlGvrPFPqAhHJSetc/njkia6e8agpeLTpYTwY
	tcqR7w1KcMymDRlsEfPluP7xr2/Co5MBpkzpEm0GmFd9NzEO80JcrE3noEFczCzUQhfDRkDKvPpSV
	y5l1JYurz0PJ8FbIjBfmmShrHRhcducOOEjZ3R2Weez87TGybnaPmNMzfeGJ5tg0PLPYx1dTJhudY
	QgXYdUG6oKOdr7Ayv+ZVP2c8Y03E2+k9bf5olPo2yPb+VsuN+bOWS+hLn5DI022fp/R/6elXotTh/
	muJTDqjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp2yO-00000003md1-0OeB;
	Tue, 26 Mar 2024 09:20:00 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp2yH-00000003mbo-2oEt;
	Tue, 26 Mar 2024 09:19:55 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27E4A240011;
	Tue, 26 Mar 2024 09:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1711444788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5r0irEwQn1lB3UnLNAwqebaOIn42MDl/NmPOJcplkmY=;
	b=W79L7du6q9HZs1Gs+5VBgV8goGI2G4zYDm6OB/HDnFsDR/cyl+rlwpzRDXSVo5BG058Y3t
	KCWSoBXKKDza+xs5AxeKEInKNb8Yfi8l07NoBbb0EzR4fwIZdpP2K6/aPggQmOzyTe/6g5
	uggF2txSH8TqpcRd5qrv56ClVvr8Vz7hrdobfsukkq2StZivs3erSICy10Z6QZdZrFRwQv
	egveqbn64WYu9jO9buJlovfCmbvF+UomVb0UkL0kTRe8KItqDLfMHybR1EobKJf4Fg/C2+
	/+MkrO9MYX/PbF+DaIE1eKzexSME/ly5JKwP3mZmsxy43CT5dXhqfdGRKd5RQg==
Message-ID: <d65f4c45-e616-4157-a769-c285cbad575c@arinc9.com>
Date: Tue, 26 Mar 2024 12:19:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 2/2] net: dsa: mt7530: fix disabling EEE on failure
 on MT7531 and MT7988
To: Paolo Abeni <pabeni@redhat.com>, Daniel Golle <daniel@makrotopia.org>,
 DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 Russell King <linux@armlinux.org.uk>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: Bartel Eerdekens <bartel.eerdekens@constell8.be>,
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240321-for-net-mt7530-fix-eee-for-mt7531-mt7988-v2-0-9af9d5041bfe@arinc9.com>
 <20240321-for-net-mt7530-fix-eee-for-mt7531-mt7988-v2-2-9af9d5041bfe@arinc9.com>
 <799572b672ea8b4756236b14068aef7c8fa726a6.camel@redhat.com>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <799572b672ea8b4756236b14068aef7c8fa726a6.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_021954_038835_69FFB952 
X-CRM114-Status: GOOD (  18.16  )
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

On 26.03.2024 12:02, Paolo Abeni wrote:
> On Thu, 2024-03-21 at 19:29 +0300, Arınç ÜNAL via B4 Relay wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> The MT7531_FORCE_EEE1G and MT7531_FORCE_EEE100 bits let the
>> PMCR_FORCE_EEE1G and PMCR_FORCE_EEE100 bits determine the 1G/100 EEE
>> abilities of the MAC. If MT7531_FORCE_EEE1G and MT7531_FORCE_EEE100 are
>> unset, the abilities are left to be determined by PHY auto polling.
>>
>> The commit 40b5d2f15c09 ("net: dsa: mt7530: Add support for EEE features")
>> made it so that the PMCR_FORCE_EEE1G and PMCR_FORCE_EEE100 bits are set on
>> mt753x_phylink_mac_link_up(). But it did not set the MT7531_FORCE_EEE1G and
>> MT7531_FORCE_EEE100 bits. Because of this, EEE will be enabled on the
>> switch MACs by polling the PHY, regardless of the result of phy_init_eee().
>>
>> Define these bits and add them to MT7531_FORCE_MODE which is being used by
>> the subdriver. With this, EEE will be prevented from being enabled on the
>> switch MACs when phy_init_eee() fails.
>>
>> Fixes: 40b5d2f15c09 ("net: dsa: mt7530: Add support for EEE features")
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> If I read the past discussion correctly, this is a potential issue
> found by code inspection and never producing problem in practice, am I
> correct?
> 
> If so I think it will deserve a 3rd party tested-by tag or similar to
> go in.
> 
> If nobody could provide such feedback in a little time, I suggest to
> drop this patch and apply only 1/2.

Whether a problem would happen in practice depends on when phy_init_eee()
fails, meaning it returns a negative non-zero code. I requested Russell to
review this patch to shed light on when phy_init_eee() would return a
negative non-zero code so we have an idea whether this patch actually fixes
a problem.

Arınç

