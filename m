Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34147C636CC
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 20:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wcVHq/ToninKh97wZonejb3L1j9muvYR02fKr1OcN9Y=; b=e1Gu5S2O75ccyBgKaYV2g5zi0K
	8/6hnHTqqPCfAweJs3bhmJpx9OeVg5F0LMz5X3jJ7a/CIHu9lmRIx1PoCRG3uc05xn3GOoYFgmNJ6
	3TtuGatXvXPHdscaKe1tD4Xb4Yxsqdqgnqy+aPGTbyh0UiQOhuUkbxcyfCCCZAXIY/wgqd2l9Q3n+
	nBZIazvksGPDFlNOTrlBLXWG++jWhjLDsGYyEalKZxkv/2thkuTcablMWTtZPU84//ajQW9zgX3Ws
	eEZWPoaIraHunlbR42UFo40m46nmxyR6v+QBt0iO1y1/uDbKiCcGmGvyGN3HX/y5dxmCwibF6kA+X
	Hm9YZcQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPUXa-00DJoY-1d; Tue, 07 Feb 2023 20:26:10 +0000
Received: from sender4-op-o16.zoho.com ([136.143.188.16])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPUXO-00DJl3-Q2; Tue, 07 Feb 2023 20:26:00 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1675801538; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MFNHmG7/lU5lU0u3G9nsYk1cs8rNbzIqyvaRcbnB5KpOJpiz1rcXcz4sK6/NjVBY85Yx21w445bxaJR5/MqgkSkguqsTnlvscLfep1WlZq8cWO9WdIvy+Q4m0k1y76tZPvz0gd428FUeZB/fW9i8YxLvjmIRZmcnLVeP9jscz8g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1675801538; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=wcVHq/ToninKh97wZonejb3L1j9muvYR02fKr1OcN9Y=; 
	b=a/fzL72QLxOBJMUYylu0AoOyhN0d2IeV0FwcwbJtUhSuYOTbkObmEChV0V77wB6yiYpWWrNgq/Bw5FHdBer/uCVKTp9ka2CCNHS8O/NkqBJBQ6KdKrNW20zagTcsRenv1Ljsa5xunkL0d2K6Yl57aGWHE6a+3kVBRoCAT87iQwo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1675801538;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=wcVHq/ToninKh97wZonejb3L1j9muvYR02fKr1OcN9Y=;
	b=HCTmg4BsxKu2cQiWm7Vd0BPwN7+baK7Ii1vSGLDOApk77vppQvPowE+frPfj4Hoo
	SzvqIfZ/GjYhr5GhrrCd15HHkGUqMUqNRdcmc6moxU1IglCi/D+u8P3rLUEiwYmB4hF
	TcYGP+v5yo5mWtxVir7Y5DpnyGpPUIklqSu/82ck=
Received: from [10.10.10.3] (31.223.26.239 [31.223.26.239]) by mx.zohomail.com
	with SMTPS id 167580153785286.01988633069698; Tue, 7 Feb 2023 12:25:37 -0800 (PST)
Message-ID: <52f8fc7f-9578-6873-61ae-b4bf85151c0f@arinc9.com>
Date: Tue, 7 Feb 2023 23:25:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: enable special tag when
 any MAC uses DSA
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
To: Jakub Kicinski <kuba@kernel.org>, arinc9.unal@gmail.com
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard van Schagen <richard@routerhints.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com
References: <20230205175331.511332-1-arinc.unal@arinc9.com>
 <20230207105613.4f56b445@kernel.org>
 <5d025125-77e4-cbfb-8caa-b71dd4adfc40@arinc9.com>
In-Reply-To: <5d025125-77e4-cbfb-8caa-b71dd4adfc40@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_122558_912801_FFC4F7B6 
X-CRM114-Status: GOOD (  11.16  )
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

On 7.02.2023 23:24, Arınç ÜNAL wrote:
> On 7.02.2023 21:56, Jakub Kicinski wrote:
>> On Sun,  5 Feb 2023 20:53:31 +0300 arinc9.unal@gmail.com wrote:
>>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>>
>>> The special tag is only enabled when the first MAC uses DSA. However, it
>>> must be enabled when any MAC uses DSA. Change the check accordingly.
>>>
>>> This fixes hardware DSA untagging not working on the second MAC of the
>>> MT7621 and MT7623 SoCs, and likely other SoCs too. Therefore, remove the
>>> check that disables hardware DSA untagging for the second MAC of the 
>>> MT7621
>>> and MT7623 SoCs.
>>>
>>> Fixes: a1f47752fd62 ("net: ethernet: mtk_eth_soc: disable hardware 
>>> DSA untagging for second MAC")
>>
>> As Paolo pointed out to me off-list this is pretty much a revert of
>> commit under Fixes. Is this an actual regression fix, or second MAC
>> as DSA port never worked but now you found a way to make it work?
> 
> Second MAC as DSA master after hardware DSA untagging was enabled never 
> worked. I first disabled it to make the communication work again, then, 
> with this patch, I found a way to make it work which is what should've 
> been done with the commit for adding hardware DSA untagging support.

Should both commits be mentioned with Fixes tag?

Arınç

