Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CF8C4707B
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jan 2024 10:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mnarWtqoAs82gLTcu+JfpQz2WRb849FNnw7B0aiWd04=; b=pknnxMsQHUAvx9
	75nhiOIyjk0Ra47DMAphlGWLrHv/ucX5AsKTnY8qapDX/rLBXcuKnPJ+756eAwiKbUli4eGqVuZN0
	3YD409fYOlHwV6Ph+UHfiksfGs3lxEF0g/cLbI14KrGmAL50qiXVV1ovwMLfVFzcXIrVAAcuedsG/
	OgII65oDG7YrL7r+nJUqc6OVTar9HiH2n4WDH9a8Hx6bpPTsjePbI/zIoAlXS0Oa71e1GcQmjCBkJ
	MNl9zuVcbj3vCMEhVN0qK+2TeeMUspJ/muMOb4vaudGkJ/8YIEFRnNyeeXodfsQmCf3QE7GWYfNY8
	b5m6giVS6Jwug3d5f+Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNsmW-00H92c-0d;
	Thu, 11 Jan 2024 10:59:28 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNsmT-00H90Y-0O;
	Thu, 11 Jan 2024 10:59:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B8181BF20F;
	Thu, 11 Jan 2024 10:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1704970760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mnarWtqoAs82gLTcu+JfpQz2WRb849FNnw7B0aiWd04=;
	b=Ik5y72Syp/Es1qKGg8RGffSk4Z8K0lLV7Ywkliibu7CbsQ8txkCqoVH41f6A1hjxlIqrqu
	gHNmbYuC8nhup4V+BIV2dtuYD0Aefme9NlRPLb+88b/6HVULRSFb6dpLv0okcRyxn7vjrB
	b/lxKNhWVJfNyKmojWb/wg/TaLa/4SVUbPsgsHv9i+3YtI08mH8cIWgrKj7iQLzd+DsNdz
	gn2N653pqp4g3g1NMSGTsJRozMJgM0u4truZ1K/GWw27vOjIyeqTL+EAdjjR5HMYPNB0fz
	yWIf45Tn8Aj5xDQFbWo/hnZBBXi8AfDO6izxzTIIMpi3dMTKiaJ+OhEBkMLfjQ==
Message-ID: <94a63ea3-29e8-4387-9a1a-0f6321f15b60@arinc9.com>
Date: Thu, 11 Jan 2024 13:59:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 07/15] net: dsa: mt7530: do not run
 mt7530_setup_port5() if port 5 is disabled
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
References: <20231207184015.u7uoyfhdxiyuw6hh@skbuf>
 <9b729dab-aebc-4c0c-a5e1-164845cd0948@suswa.mountain>
 <20231208184652.k2max4kf7r3fgksg@skbuf>
 <c3a0fc6a-825c-4de3-b5cf-b454a6d4d3cf@arinc9.com>
 <48b664fb-edf9-4170-abde-2eb99e04f0e5@suswa.mountain>
 <2ad136ed-be3a-407f-bf3c-5faf664b927c@arinc9.com>
 <20240109145740.3vbtkuowiwedz5hx@skbuf>
 <0a086b5f-b319-4f08-9513-a38c214e1da7@arinc9.com>
 <20240110182358.ci7pg7ipcbsjxqjf@skbuf>
 <009fec43-0669-419e-a3a9-ce54c676a324@arinc9.com>
 <20240111103146.t5fzr2wlw2tyrkkb@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240111103146.t5fzr2wlw2tyrkkb@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_025925_291555_4674452B 
X-CRM114-Status: GOOD (  11.48  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Dan Carpenter <dan.carpenter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 11.01.2024 13:31, Vladimir Oltean wrote:
> On Thu, Jan 11, 2024 at 01:22:12PM +0300, Arınç ÜNAL wrote:
>>> BTW, besides OpenWrt, what other software is deployed on these SoCs
>>> typically?
>>
>> Other than OpenWrt which is widely used for these SoCs for its ease of
>> flashing and upgrading, compatibility with legacy U-boot versions that
>> usually come with any vendor making a product out of these SoCs, I can only
>> talk about what I deploy to run Linux. I use mainline U-Boot along with the
>> device trees from the Linux repository to boot mainline Linux kernels with
>> Buildroot as the filesystem.
>>
>> Arınç
> 
> I meant what other software (operating system) _instead_ of OpenWRT.
> I'm trying to figure out what other users of PHY muxing there might be.

I'm not aware of any other projects that utilise PHY muxing of MT7530. It
was me spending a few months bringing the feature to OpenWrt in the first
place.

Arınç

