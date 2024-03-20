Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641EDC6FD1F
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Mar 2024 15:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EPnVyRoNctObdniIj1LYajBfdJ4KCDXA+i1lA4eN1Ok=; b=5C/cW2IDJuQApw/Z8phiMkxklZ
	XW0ydGKtc9J9AFqZSWlPsSEKOiM4a512MDiNciPlx3TEhwHkSmQirTMmSY0b7deX+meRqKkI31fSn
	qwGnEm0w7MolkuBX0aeLzVBorl9s0SgEqlxZsdyR5dTJvok5N1rL5A7I1sor/+wC4gU/nTB2h3b4d
	ZHOh2y+m+teGKTPrPLgEfVoTuBCPvArX4eI5lysyp+VmtV4+O4uQd6um9bFqwbzjGxCxjo033NOJp
	MEJWWtre6y8Jvph3fPr5nZTpnihBhLP0+X0E4oJx86UC8i1aU2sbgd++rLyM/0qxYH30pnhxHt1uo
	PmQOh0lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmxUa-0000000HaRp-2BuU;
	Wed, 20 Mar 2024 15:04:36 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmxUW-0000000HaQv-0OVy;
	Wed, 20 Mar 2024 15:04:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 58E531BF20E;
	Wed, 20 Mar 2024 15:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710947064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EPnVyRoNctObdniIj1LYajBfdJ4KCDXA+i1lA4eN1Ok=;
	b=RfSA+UhG2CCvT8s3keKol+jqb3t/l0Vw21Xp4Ejm+XNwtdyVT4kjlB4XEFKVcqv5bzcEc6
	wX2fJI42+LksHzhgi+T8TAmfla9hnLdU+63L5FqEOR4RrIYVfXmtUA/3sJowNB6/+arSRJ
	3dFMAdGdEzNXaiy8FAEvb8FtIzrr5Vxb9YQ7bKsxPoC8ZgCMnQnAxL22vjNo5Fq3DMpZUm
	Kke1u5XpWYxbbu46BlExMVGZnIoUjRccIf7WwxCtnHn+6L53zQ+ApgAEm+geG9ansi2ZK8
	+CmSUNTM/kXi9eyCtDL/HRfWUApIC3Ffp4N1/L3Y20iQ+oCjVqfw8FzG3GvelQ==
Message-ID: <3ee60bfe-1283-46b3-9b7e-07526912f763@arinc9.com>
Date: Wed, 20 Mar 2024 18:03:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Fix EEE support for MT7531 and MT7988 SoC switch
To: Daniel Golle <daniel@makrotopia.org>
Cc: DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
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
References: <20240318-for-net-mt7530-fix-eee-for-mt7531-mt7988-v1-0-3f17226344e8@arinc9.com>
 <9d111cc9-c73a-4d3c-83f5-3f59e6c8841f@arinc9.com>
 <ZfrDnFyGay5YTTFg@makrotopia.org>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <ZfrDnFyGay5YTTFg@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_080432_486839_11686BA6 
X-CRM114-Status: GOOD (  20.28  )
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

On 20.03.2024 14:08, Daniel Golle wrote:
> On Wed, Mar 20, 2024 at 11:10:19AM +0300, Arınç ÜNAL wrote:
>> On 18.03.2024 10:46, Arınç ÜNAL via B4 Relay wrote:
>>> Hi.
>>>
>>> This patch series fixes EEE support for MT7531 and the switch on the MT7988
>>> SoC. EEE did not work on MT7531 on most boards before this, it is unclear
>>> what's the status on MT7988 SoC switch as I don't have the hardware.
>>>
>>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> I see the state of this patch series is deferred on patchwork. I see that I
>> forgot to delegate this to the net tree. As I don't see any objections in
>> this series, I'll send v2 with it tomorrow.
> 
> Sorry, but imho it should go to net-next, and you might have overlook
> it but there have been some concerns.

I don't believe I overlooked anything. I've come to this conclusion after
reading every response in this thread.

> 
> For sure it should not go to net tree as you are enabling a new feature
> and not fixing anything which is broken. EEE on MT7988 works fine as

EEE support exists since the commit which I've mentioned on my patches
here. I am fixing it. I thought I had explained this clearly on the
patches.

> of now (see my reply), EEE on MT7531 was supposedly intentionally
> disabled for reasons we should ask MTK people about.

Are you talking about the EEE_DIS bit on the trap? There's no default
setting there, it's up to the board vendor to enable/disable EEE by pulling
the affine pin low or high. So there's no intentional disabling by MediaTek
there. I see no need to ask the corporate regarding this.

This patch series does not in any way enable EEE on the switch PHYs and
MACs when it's disabled by default.

Arınç

