Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF1AC48BF6
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Mar 2024 10:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=70/7y2X6wDi3bQCZmAy031TkMZT/+pxcQp5024UYhZw=; b=kd+YCG9ftGleePwabdJLfW7Vrw
	kBqPbDV0GTWRlsfvsK+3pZ43ot7wBltE+qs5xzDrpOwbra6OADa/7GX5Q+h/McN0kUjW4pN7zNul6
	iqRsrIZ9f6ePGnGSEJMVOtiXtrg1YR0V29wIN7Tr6eqdeo6/N7uai+UuNUND+jE9ZFvLLuyH9oh5f
	IQ32czBlBFoAi6/AUeb78wg2dzmSafrJcevYgh3WeI/Ij8c3fnAUfYJSqsGZu6egmD4DE+QnoDwd+
	vgBODquUwYWs2GwNpNmI1PLeObNfx2Y4Kn3uGFR8wDSoN/3llmgWXvEuEEnZNcz7e7FS09i8at6Ed
	my1FGu+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5bP-00000008d1f-1YLq;
	Mon, 04 Mar 2024 10:31:23 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5NA-00000008Ywg-1QgM;
	Mon, 04 Mar 2024 10:16:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=70/7y2X6wDi3bQCZmAy031TkMZT/+pxcQp5024UYhZw=; b=cIvHmhQN/n+1hEZ0X30BuRZZkl
	VJAHQTL9idVk4LSbI9z4cVztjsHQBx7Jd0xAE7eHLEiyI43J5Z+5gd+1Q/3c7UTffKZt1RD/E6M6J
	XXu6LAr6v425ehgnQipq9SQ29WBtjn58PbocNi6LVJ6598TV/XC4+kymW7D7VHOSj8M8925F+yCkz
	hpPkm1xFJAC7U1ZBfiJUiD4DeFiavGBnKIjl6KAs/w3WpJjX/4K/6L+B46E4KWrXp6b0YPgu45iCM
	kzfZv7mOQxZBCQIy4ABBXpTXIQBMBlqEE3UUguupvYdEdQI88opnWfiE1r8A9gkrthWDb8iCBbQBk
	chKKsLIQ==;
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5N7-00000004nWR-0PML;
	Mon, 04 Mar 2024 10:16:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709547396;
	bh=fUVIo8oYMkddeREdeHAUMsLE87NZnHK18xStRoanGpY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rS0o+c5PAr7sQNA0z7g5e4yGNpNnAz2aG1gDopp4IULeGi015H7awhAX/uQjmv43+
	 RSarmHrK8yIsk4kROtJWmerQ+qrEbS+Dycg9781fLwsanidLOfgNvrkKydgKQjKo9/
	 kDiQZCrHuUUqKy1166/dfVscy7JIn+anQZWIY5nBVTXV/HqwWVE06nUfdxlFikAIxh
	 o8jr4VtP2+dG0qih7lle5j/GIvxy3h5XGVMcqSzlen9FB0e8rAP/aGSOkA76xvLBuu
	 eL53PN/HNDcHV34E1HFtqQV6CpBRFZ08FXYXE9gFNNZ0Uicc032u4HAO95n4qBlbaR
	 +TZ76Zdg3I9Ug==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3E38337803EE;
	Mon,  4 Mar 2024 10:16:35 +0000 (UTC)
Message-ID: <22110872-8915-43cc-b074-112644b16e3b@collabora.com>
Date: Mon, 4 Mar 2024 11:16:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: mediatek: mt8195: Add missing
 gce-client-reg to vpp/vdosys
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 "Nancy.Lin" <nancy.lin@mediatek.com>, kernel@collabora.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240229-gce-client-reg-add-missing-mt8192-95-v1-0-b12c233a8a33@collabora.com>
 <20240229-gce-client-reg-add-missing-mt8192-95-v1-2-b12c233a8a33@collabora.com>
 <22e2cf1b-9560-4f4b-b08b-a112e8e272a8@collabora.com>
 <40ae06f4-0cbe-40f0-84c8-9b57dfbeb91f@notapiano>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <40ae06f4-0cbe-40f0-84c8-9b57dfbeb91f@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_101637_253648_02AE4332 
X-CRM114-Status: GOOD (  15.72  )
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

Il 01/03/24 15:39, Nícolas F. R. A. Prado ha scritto:
> On Fri, Mar 01, 2024 at 09:50:31AM +0100, AngeloGioacchino Del Regno wrote:
>> Il 29/02/24 20:44, Nícolas F. R. A. Prado ha scritto:
>>> Add the missing mediatek,gce-client-reg property to the vppsys and
>>> vdosys nodes to allow them to use the GCE. This prevents the "can't
>>> parse gce-client-reg property" error from being printed and should
>>> result in better performance.
>>>
>>> Fixes: 6aa5b46d1755 ("arm64: dts: mt8195: Add vdosys and vppsys clock nodes")
>>> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>
>> Can you please squash patches 2,3,4 in a single one?
>>
>> It doesn't make a lot of sense to have them separated in this case, only
>> generates commit noise for no practical reason imo.
>>
>> arm64: dts: mediatek: mt8195: Add missing gce-client-reg to vpp/vdo/mutex
> 
> I split them like this so that each has its own fixes tag and can all be easily
> backported (as mentioned in the cover letter). That said, the commits fixed in 2
> and 3 both landed in v6.1-rc1, so they could be squashed and still easily
> backported. But the commit fixed in patch 4 only landed in v6.4-rc1, so if we
> squash them all together, the first two won't be backported to v6.1.
> 
> Let me know how you want to proceed.
> 

Oh, I'm sorry I didn't notice that. Ignore my previous comment then, I'll take
those for the next fixes round as-is.

Cheers,
Angelo


