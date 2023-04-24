Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC010C77B61
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Apr 2023 09:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EZrViyOOQTlmyzkZxlxdSE/AYI5IQpXFuh8HBWtjtrU=; b=tb2HtEgvy0/dTqwm9l1zCcbUWV
	/hEDmwHHZ8EoAnDN7EKsFKsdXmb3Zk02Z3EWVb+ZMaXeQxGm3ZG5sDbys2/Ptvk52i/Ro4L7GMWgU
	RdEeB+Vpn9dh8R0f7mv7RkRJHKVqKf6zIwIZ+q3KPuOyswwH7+DcxXEk9X99efDe7DOAl5ncF0+Dq
	yXcnqt6kXtZh9Hw8g3TitQSA35quszwM4xmjklfezPQiO4MKYdYRYsyU2kTfBbjr96cK2J9JdxzmN
	e4yEnvXOV/h7hpGdKEnTCCv98avNNC1ZsSF8nfoLni9nOiSnQVh4rZV3xbEZDSuOMmq05BkeDa8Mr
	WrwlWkgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqsz6-00Ftj5-14;
	Mon, 24 Apr 2023 09:59:48 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqsz2-00FtgY-1Z;
	Mon, 24 Apr 2023 09:59:46 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2E10F660324B;
	Mon, 24 Apr 2023 10:59:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1682330377;
	bh=d4/ywTBBYaIdjKCxRKNX5qZ5Mog0dm0wH5iUfUYbv2M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gUlACtRVAMqeFR53ajNoYxRLdl3NeUNwell40eVgBz/jW8mDh4DyWz7/BiNlyPYXc
	 8E62BuLw3e+7K/zeVd5iAUXJNVbOHiVAXs7KfPpwCwfRRiXeExInvFrcnoEYcRvNmO
	 UWs8m27DaQ3mVENoOWt73ozjNnWPeVAASIUekBbdIAQGHBlC2reRR1ejCuET+1xX+Y
	 Qotg8gu7tryiUqifKtqcW9PGzTyAGKN5wWE3dH23KNEaK56YBFo4xzuajlTYPFL5cb
	 5r7o2EHmVfq+NGd5H0jO+Y2+CJC0YWA2PbBcdKCtTTrIqy0GY7svNrDiJW+Oien2Sm
	 XeyXw7Z5J7RoQ==
Message-ID: <db95dbbd-d740-2c78-e0dc-55c17d5b9a04@collabora.com>
Date: Mon, 24 Apr 2023 11:59:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 5/5] arm64: dts: mediatek: cherry-tomato-r1: Enable NVMe
 PCI-Express port
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20230420094433.42794-1-angelogioacchino.delregno@collabora.com>
 <20230420094433.42794-6-angelogioacchino.delregno@collabora.com>
 <CAGXv+5GJroyKkj8oZw+BQxiUkiGCb-RBOxnKRkURQz5T6=EvNQ@mail.gmail.com>
 <eb78450a-1eed-f914-58be-ee18d85a2d62@collabora.com>
 <CAGXv+5E5Ei9YffWQednLcmWBr2eXfsfjXBFRzxKJd+=O290xdQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5E5Ei9YffWQednLcmWBr2eXfsfjXBFRzxKJd+=O290xdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_025944_737000_3D572C41 
X-CRM114-Status: GOOD (  19.73  )
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

Il 24/04/23 11:40, Chen-Yu Tsai ha scritto:
> On Mon, Apr 24, 2023 at 4:13 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 21/04/23 09:59, Chen-Yu Tsai ha scritto:
>>> On Thu, Apr 20, 2023 at 5:45 PM AngeloGioacchino Del Regno
>>> <angelogioacchino.delregno@collabora.com> wrote:
>>>>
>>>> On Tomato rev1 the PCIe0 controller is used for NVMe storage.
>>>
>>> This was slightly confusing for me. AFAIK rev1 is not an actual Tomato
>>> device. It should be the prototype board, which is the original Cherry
>>> reference design by Google [1].
>>>
>>> There is an actual Cherry derived device that has NVMe, though it's under
>>> another brand and another name.
>>>
>>
>> If revision 1 is not an actual Tomato device, and you can confirm that it is
>> the prototype board... I can send a commit to entirely drop R1 as having it
>> upstream would be of no use at all.
> 
>  From what I gathered from my colleagues, revision 1 was a Tomato prototype,
> and also the second Cherry prototype board. There shouldn't be any of these
> out in the wild.
> 
> FTR, the production version of Tomato is revision 4. Rev 2 and rev 3
> engineering samples are available to partners, but otherwise limited.
> 

Good! Thanks for the information.

> ChenYu
> 
>> Cheers,
>> Angelo
>>
>>> ChenYu
>>>
>>> [1] Much like Kukui & Jacuzzi (MT8183), and Asurada (MT8192) are the
>>>       reference designs.  I don't think we ever upstream the reference
>>>       boards because they don't really end up in the hands of people
>>>       outside of the project, and the ones we do have tend to be quite
>>>       beaten up or no longer working due to extensive testing.
>>>
>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>> ---
>>>>    arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts | 7 +++++++
>>>>    1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
>>>> index 2d5e8f371b6d..11fc83ddf236 100644
>>>> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
>>>> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
>>>> @@ -20,6 +20,13 @@ &sound {
>>>>           model = "mt8195_r1019_5682";
>>>>    };
>>>>
>>>> +&pcie0 {
>>>> +       status = "okay";
>>>> +
>>>> +       pinctrl-names = "default";
>>>> +       pinctrl-0 = <&pcie0_pins_default>;
>>>> +};
>>>> +
>>>>    &ts_10 {
>>>>           status = "okay";
>>>>    };
>>>> --
>>>> 2.40.0
>>>>
>>>>
>>

-- 
AngeloGioacchino Del Regno
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718


