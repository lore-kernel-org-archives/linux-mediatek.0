Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708E9C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 13:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RBXdhhrG0EKPzn9lXqzUS5GcZ8UV3zIbqZohwJwqhK4=; b=Me9vxGCqUmPFA8
	vd5raxSLXWJ8JtKXVxpnTerlHIJiHVUJDlu2EEYDapg4p0C6ekyIC2A3epKV2mjndLiBoIQ7v8viZ
	W9gQQBDTeI2U5nmfzmNyPjXDXDHm1Hifk5joN7Z2GfHCse+NqPBlOFbFtYd+duBu47u3wPFShNLwD
	SeSxZY6bz3rluP01Azjbmz9fXM1cFFetFR3r3xxdw6lWuhoB36I+ZnGgDo8ISB3p38EdW8oLWo+V2
	44auEgg6WEJMGTjzfs+xq/6Edp2vzvYHx1qfeaXacAE7Hcgbn4XzoxMA5LBbqvUWLX2AmsVG6pjhX
	9GjLUbaGk3AVeoDQZRyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt83s-004NxS-I2; Mon, 23 May 2022 13:25:28 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt83a-004Ns9-8h; Mon, 23 May 2022 13:25:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6C1771F4332B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653312309;
 bh=nLAJ424Uh7yMOyPhA731RzWvn1haYM2Coj+CudAs2+Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ELuPVjRgeU7fvOefU/93dWvHT9RvQXDhlfrvyvSOBx7OCnrs9Qw38ANsJw4WFy7gQ
 vP/NVcbI3bieA25MAsuxB8XnLIV2NpX8ZHW6JuaxybYTLUI7UOKms82XLOHV7g82G4
 EkMVZbBoYLYTEPQZ5CQVHWSQb/WooQ/t0befGVCpE/HWKYlbHoROZrKmQXmKNNEMH6
 e6zgrWDnd0vGzdrCD1V74GrwI3Uk7yw/zBgWDLLYSxG4VIR7q/ZAGMNbUvVd/3BBqE
 E1D3lUfjas7PPKQ6uFQsBBPtD0YnUlIws+FJKwLZkTWXJ0maFBN+RhIsH73CxHVXXp
 m3g4U2FcNLXNA==
Message-ID: <8a027bdc-0fc3-a41e-4142-0033706d3da6@collabora.com>
Date: Mon, 23 May 2022 15:25:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] Revert "serial: 8250_mtk: Make sure to select the right
 FEATURE_SEL"
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Mark Brown <broonie@kernel.org>, jirislaby@kernel.org,
 matthias.bgg@gmail.com, zhiyong.tao@mediatek.com, colin.king@intel.com,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 wenst@chromium.org
References: <20220510122620.150342-1-angelogioacchino.delregno@collabora.com>
 <YnpeYGbo7JJK0lDk@sirena.org.uk>
 <b13b019f-f766-60df-3764-d375f64ea7d3@collabora.com>
 <YnphFjs4E4EYafT4@sirena.org.uk>
 <63169e65-cbfa-d495-754f-023dc8befa42@collabora.com>
 <d91977d2-ebc6-de6e-5eeb-61c25ba0cc64@collabora.com>
 <Yot5uls/3vLzZu7I@kroah.com>
 <da1e4b31-de71-1fda-eff7-2e70fe1331ac@collabora.com>
 <Yot+xTBus04O9TUu@kroah.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <Yot+xTBus04O9TUu@kroah.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_062510_520969_3CA0843E 
X-CRM114-Status: GOOD (  12.30  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 23/05/22 14:32, Greg KH ha scritto:
> On Mon, May 23, 2022 at 02:13:35PM +0200, AngeloGioacchino Del Regno wrote:
>> Il 23/05/22 14:10, Greg KH ha scritto:
>>> On Mon, May 23, 2022 at 12:17:06PM +0200, AngeloGioacchino Del Regno wrote:
>>>> Il 10/05/22 17:29, AngeloGioacchino Del Regno ha scritto:
>>>>> Il 10/05/22 14:56, Mark Brown ha scritto:
>>>>>> On Tue, May 10, 2022 at 02:46:28PM +0200, AngeloGioacchino Del Regno wrote:
>>>>>>
>>>>>>> Sorry for missing this tag, and also I'm sorry for the noise.
>>>>>>
>>>>>> Hey, if nobody broke anything all this testing stuff wouldn't be worth
>>>>>> it!
>>>>>
>>>>>
>>>>> Haha! That's true :-)
>>>>>
>>>>> Thank you!
>>>>
>>>>
>>>> Hello Mark, Greg
>>>>
>>>> I've just noticed that v5.18 was released, but without this revert.
>>>
>>> What is "this revert"?
>>>
>>
>> "this revert" == "this commit", reverting
>>
>> 6f81fdded0d0 ("serial: 8250_mtk: Make sure to select the right FEATURE_SEL")
>>
>>>> Can you schedule this for backport on v5.18?
>>>
>>> I need more context here, sorry.
>>>
>>
>> As stated in the commit description, some MediaTek SoCs are incompatible with
>> this change, hence it's actually breaking late serial for some machines.
> 
> Did I already apply this change to my tree?

Yes you have applied it to tty-next.

 >
>  If so, once it hits Linus's
> tree we can backport it to 5.18.1.
> 

Okay, sounds good, thank you!

Regards,
Angelo



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
