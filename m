Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762F1C636D3
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Feb 2023 18:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=arkdi84OlgD/8JIjBhprSNAS0S9dnuy2bKkOoDUEn7w=; b=IVt4cD4s9XNuhW
	wWNJ8Z3M5KxO8WzlMH8K6JPmXCAXGv2t9To8w/yoh3YT9DsDRGeBXLAGPPD0qK8GoJk02M+VAk+hN
	a59PRH7UXc53y0CIHS4XJqQEpNjG5iWIVNxld801aU2xkzpeAE311ShXRoL984ztfaAPTqDP4jYsv
	09t6nJgGg1LfC/NNDmS0RkFiqDkohvfbanAAc5PIS2qAP+Aqj68nUI8Q6jnHSZ9HAf72IgOXMxrdr
	c0cMLPnBVjw4XvOGfsLL27igpsT4B5/7lYGf13slF8gLv5KPGCIMMUO+ZWBNgSrhVoWhvCSuODbYg
	oz9swGPAZYrlRWyo84tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP6R8-009dTP-BB; Mon, 06 Feb 2023 18:41:54 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP6Qx-009dSK-8v; Mon, 06 Feb 2023 18:41:44 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1675708875; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HvPZoRoztiFry6G8NNQ7DEovbjbJGM+glsPpptqwdg8j3l4zKnBZ9U0N4eGESqM9j2b5b0EToaQxa9LpkXSoIU5MvSjml2YLjChipQNex262mKxCKuZAjLa13p6T/ttnb/p0/fmzkErpMmPh2WaqFGCIurcpwt/Lg1+9wXlSA18=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1675708875; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=arkdi84OlgD/8JIjBhprSNAS0S9dnuy2bKkOoDUEn7w=; 
	b=NumanfTudQLojOt9+t7fsi/8aciPlaLjk6QePC4LAhEPgIt6+RTiyjPAEsdL0OXAThjrr3kEX0Vc+muQNnOFvnZSS3yOEYkgrw58GlORscRuJLxtkBppYOWqLY5nUayJP3vEJH5esYZb+axN65ZPtm4eCIRPaO6I0YCr2z5ewWU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1675708875;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=arkdi84OlgD/8JIjBhprSNAS0S9dnuy2bKkOoDUEn7w=;
	b=X6EWEHD41ZVIzuEsFLMgPG2WhnuB8iZY+XiFkS1SWsBTVtEJayB85MdhuHxD63iH
	pRlt9CYWe6sBFGJ+jKQjt8nya/1Ap+WvwBrGxDVMk7/fk73Uwt+SF8xUPzgrjJZBR+h
	Td6WXz+SrpXh9QNU7jShbpcQAhEiXr7/8h+80YrQ=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1675708872711675.352353078918; Mon, 6 Feb 2023 10:41:12 -0800 (PST)
Message-ID: <5e474cb7-446c-d44a-47f6-f679ae121335@arinc9.com>
Date: Mon, 6 Feb 2023 21:41:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH net] net: dsa: mt7530: don't change PVC_EG_TAG when CPU
 port becomes VLAN-aware
Content-Language: en-US
To: Vladimir Oltean <vladimir.oltean@nxp.com>
References: <20230205140713.1609281-1-vladimir.oltean@nxp.com>
 <3649b6f9-a028-8eaf-ac89-c4d0fce412da@arinc9.com>
 <20230205203906.i3jci4pxd6mw74in@skbuf>
 <b055e42f-ff0f-d05a-d462-961694b035c1@arinc9.com>
 <20230205235053.g5cttegcdsvh7uk3@skbuf>
 <116ff532-4ebc-4422-6599-1d5872ff9eb8@arinc9.com>
 <20230206174627.mv4ljr4gtkpr7w55@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230206174627.mv4ljr4gtkpr7w55@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_104143_390111_4DC88835 
X-CRM114-Status: GOOD (  13.85  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, richard@routerhints.com, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, erkin.bozoglu@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 6.02.2023 20:46, Vladimir Oltean wrote:
> Hi Arınç,
> 
> On Mon, Feb 06, 2023 at 07:41:06PM +0300, Arınç ÜNAL wrote:
>> Finally I got time. It's been a seismically active day where I'm from.
> 
> My deepest condolences to those who experienced tragedies after today's
> earthquakes. A lot of people in neighboring countries are horrified
> thinking when this will happen to them. Hopefully you aren't living in
> Gaziantep or nearby cities.

Thank you for asking, we're all fine as a family in İzmir. This region 
is on a fault line as well so the same could happen here too like it did 
in 2020. Thankfully our apartment is strong.

> 
>> # ping 192.168.2.2
>> PING 192.168.2.2
>> [   39.508013] mtk_soc_eth 1b100000.ethernet eth1: dsa_switch_rcv: there is no metadata dst attached to skb 0xc2dfecc0
>>
>> # ping 192.168.2.2
>> PING 192.168.2.2
>> [   22.674182] mtk_soc_eth 1b100000.ethernet eth1: mtk_poll_rx: received skb 0xc2d67840 without VLAN/DSA tag present
> 
> Thank you so much for testing. Would you mind cleaning everything up and
> testing with this patch instead (formatted on top of net-next)?
> Even if you need to adapt to your tree, hopefully you get the idea from
> the commit message.

Applies cleanly and fixes the issue! You can add my tested-by tag. 
Thanks a lot for the ridiculously fast fix Vladimir!

Arınç

