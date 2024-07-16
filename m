Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B742C3DA49
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jul 2024 16:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=84K6jsVZXrxYYTF7G3ziw40hXRHgGPXzsBt7ZfCB+/s=; b=QnhJlhSN2PqUwYBB3Sbt5PUrKN
	Q9pafRLSZ1Gig757NQ4TyI6+8O22QnFdBHrJvq5P4PtQII/7NM0P9kaBKlltbF6xbYMAcg+Q52WJC
	BlblvhNAV/EQOkOMMCLqlzabiZuAqazGqKjTWshQMZmuT+0B9QDCM4NcMT5uwUcuPxVHlnETlgJMc
	cUFUNIY3MmzvIV3ale7l9e51lVEtQqhoFVatycCgsrAWe/ze6+yE3z35J4VgYuHFzNB0LhY8fJbhH
	CMEK73hI/e2IEAIKNGKKjGh1WdO/eN1yIElDOI7gMbswdgwRa+1/4FCWscu7cvmYsKAaeLn/sVqy1
	ZKbIsqCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTkhc-0000000B09Z-1A9J;
	Tue, 16 Jul 2024 16:06:56 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTkhG-0000000B01X-39gC;
	Tue, 16 Jul 2024 16:06:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721145991;
	bh=gI21/Txq0/V8Mood/7WNX4+a8nWK19FWuXo1RHgcBlQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N4CqeFe8PNc3O+xfgpqGJQFUDEW+QKrrwmE1npMejRElOw2F71TZo63D/Z4iJ7Caj
	 qklrx7vdRHrdCwPtgmHeqiEYtDApNOGRZooDnolD1wrfNTnui/d68Q8am6HMse0SDb
	 J1+TMDsGtPuvLq4LL5fkNV9sZRduAwbYKqjI7GEGecd1FDvOuAL5+p2hMNdzTi0eNb
	 VxBpM1dipIovxmrsn8NK5nscLTmFHq7r+Ut8eiCN5wt9JbNKx+0IUO4A8xWgAvzvQ/
	 S9RAQ7XQPJRu7K/GyhgJKhS8axETw3pI5vgDaJl68aEFDxQVUIn+h/om7qBbXKAglg
	 obIuxqnflsjmA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 18C8237821CD;
	Tue, 16 Jul 2024 16:06:31 +0000 (UTC)
Message-ID: <a4fb5ab2-c11c-4761-82c0-76c01bcf65d6@collabora.com>
Date: Tue, 16 Jul 2024 18:06:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] arm64: dts: mediatek: mt8195-cherry: Remove
 keyboard-backlight node
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, Tzung-Bi Shih <tzungbi@kernel.org>,
 kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240715-cros-backlight-dt-probe-v1-1-0b5afe64c94b@collabora.com>
 <3dd2dcc9-5fbb-4384-985f-a61e26cc8a5f@collabora.com>
 <96f91c0a-e693-45db-a664-1c396b14999e@notapiano>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <96f91c0a-e693-45db-a664-1c396b14999e@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_090634_956257_39743809 
X-CRM114-Status: GOOD (  33.97  )
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

Il 16/07/24 14:16, Nícolas F. R. A. Prado ha scritto:
> On Tue, Jul 16, 2024 at 11:24:44AM +0200, AngeloGioacchino Del Regno wrote:
>> Il 15/07/24 18:09, Nícolas F. R. A. Prado ha scritto:
>>> Commit 970c3a6b7aa3 ("mfd: cros_ec: Register keyboard backlight
>>> subdevice") introduced support for detecting keyboard backlight
>>> fuctionality through communication with the ChromeOS EC. This means that
>>> the DT node is no longer used. Remove the unneeded node.
>>>
>>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>> ---
>>> Different CrosEC FW versions could potentially not support discovering
>>> the keyboard backlight functionality, but I've tested both a recent
>>>
>>>     tomato_v2.0.23149-099cd3e539 tomato_15699.72.0 2024-01-03
>>>
>>> and an old
>>>
>>>     tomato_v2.0.10686-234e646fd8 tomato_14268.0.0 2021-10-07
>>>
>>> version on mt8195-cherry-tomato and on both relying only on the
>>> discoverability works. I've tested on both tomato-r2 and tomato-r3. I
>>> have not tested on dojo, however, as I don't have access to it.
>>>
>>
>> Dojo will work anyway because those machines do share the same base FW... but
>> anyway, I'm not sure that this is the right thing to do.
>>
>> The commit that you mentioned says that it is meant to make that "work on machines
>> without specific ACPI or OF support for the keyboard backlight", but not that the
>> intention is to stop using either ACPI nor DT nodes for that.
> 
> Yes, because as I understand it not every EC might support this protocol. So
> that commit just added an additional way to probe the keyboard backlight.
> 
> So we don't need to stop using the DT to probe it. But in practice we have
> already stopped, as long as the EC supports the protocol (which from my testing
> is always for these platforms), since that is tried first. Meaning the DT node
> is now useless.
> 
> The only point in keeping the DT node would be to use it as a fallback in case
> the discovery with the EC fails or breaks. But I have never seen a DT node be
> there just as fallback, so it doesn't feel right to me either.
> 
>>
>> The DT kselftest is relatively young, and I suspect that anyway this is not the
>> only affected device, so the justification is only barely valid.
> 
> I didn't include the failing test as part of the commit message proper as I
> don't think it should justify this change. I added it just to clarify my
> motivation. The test showed me that something unexpected was happening. After
> looking into it I thought that a DT node that is no longer used to probe has no
> point in staying around, so that's the justification that I added to the commit
> message.
> 
>>
>> Don't misunderstand me, I'm not saying that I'm not okay with this, but I'd like to
>> have more opinions about this.
>>
>> If we choose to go this way, ideally we should remove this from all of the upstream
>> Chromebook devicetrees (not only MediaTek, clearly!) so that would require a bit
>> more effort to test here and there.
> 
> Note that the cherry DT is the only DT upstream with the
> google,cros-kbd-led-backlight compatible. So it's really only tomato and dojo
> that need to be tested.
> 
Perfect. Let's remove it then, possibly with fire ;-)
Can you please send the patch without the RFC tag?

Also add my R-b, so that I'll remember that I've already checked that patch for
when I'll be able to pick it.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


Cheers!

