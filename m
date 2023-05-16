Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20885C77B75
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 May 2023 14:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gicnkWQO1k0lDFbOP1mdW6KlbGITRSf6YfEBFOVsRco=; b=P5L5gFLzdDBJ96MEE8GVqmqBxG
	riQEfpAXBhxFemdQxqBAdf7eko1gHo8L02NVEqQeB0dZROgB2p4GPZOnTwmK736YabEUybitn/nQw
	LyZTYcB8YrvUVjD3kgThPJPq7xJErWUXhKYiNDMGC/epKQXW0mVeCi5ibjkyTL3LwI2bqbyH+nVon
	ttGwqRwh/Y7fPF7FmvuZUKflK3TRDUOL2IQPT0MW0fjrzretXLcDhSGh1TlAfTQitbyO+y+Sq0ffu
	roAOXjf7Ro3+79GTr5E+9YllWJgQewh7jsV8eOVfKYa3l9g0efokJHJa8isDXTHP5Nlq6Lxu+VyZC
	ET8ABh4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyw5u-006A9e-2W;
	Tue, 16 May 2023 14:56:06 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyw5q-006A7y-28;
	Tue, 16 May 2023 14:56:04 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A21EF66058F7;
	Tue, 16 May 2023 15:55:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684248958;
	bh=A4ghUFGtUYGU+mfPLHdDtAdikMKuNk5QXqN5HGiifkY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l6JzNxYnLdBMJMUF7phZbXums/Tk1uG/m1vOZ+yGslG8K6suBMltTmgy0f35wA90W
	 +iGuvufTJpHwl7SXtpg71EXlFI8gUmQsEAuyiqqsSulAjKHFu8IA80zRPnx3efsx1N
	 ArNSFASWlfNvx/XJ5v2sWNM7lb32+lpEHeZnCkpntR3Ol84e1kfFQqwSJ+F9bT182Q
	 hcx3VaLjAN1XekVoYBPF+PKSTnMdWkhro/zHqX6dvYJJbmMTiz331iV0Wt6Z5t2gZH
	 J1MiLGewZMe3gB4bEbfIDhfDbWESRQ2ayLWN9SrKDVVsSu3CUhd/x33oEtCXW9bG7R
	 MmvNPXmgEsE0g==
Message-ID: <de62cddc-affe-297c-f020-425f80e683fe@collabora.com>
Date: Tue, 16 May 2023 16:55:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 2/2] phy: mtk-mipi-csi: add driver for CSI phy
Content-Language: en-US
To: Julien Stephan <jstephan@baylibre.com>
Cc: krzysztof.kozlowski@linaro.org, robh@kernel.org, chunkuang.hu@kernel.org,
 linux-mediatek@lists.infradead.org, Phi-bang Nguyen <pnguyen@baylibre.com>,
 Louis Kuo <louis.kuo@mediatek.com>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Andy Hsieh <andy.hsieh@mediatek.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek USB3 PHY DRIVER"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
 "open list:DRM DRIVERS FOR MEDIATEK" <dri-devel@lists.freedesktop.org>
References: <20230515090551.1251389-1-jstephan@baylibre.com>
 <20230515090551.1251389-3-jstephan@baylibre.com>
 <cd6067b2-660a-8f2c-697d-26814a9dc131@collabora.com>
 <b2nk4jw2hpy4ndoq4cojazkn6h3tra2zjffhiswb7aqryabf7q@mkbtzhzcbivv>
 <54e6923c-729a-49de-8395-fbd0b8443aa8@collabora.com>
 <shthzc3zekvm2mrcch6vexsq5djpoxwupvdmmovhrz2ack3wxx@s4ptfhq7iwvi>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <shthzc3zekvm2mrcch6vexsq5djpoxwupvdmmovhrz2ack3wxx@s4ptfhq7iwvi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_075603_021978_55C32DC4 
X-CRM114-Status: GOOD (  29.29  )
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

Il 16/05/23 11:30, Julien Stephan ha scritto:
> On Mon, May 15, 2023 at 04:32:42PM +0200, AngeloGioacchino Del Regno wrote:
>> Il 15/05/23 16:07, Julien Stephan ha scritto:
>>> On Mon, May 15, 2023 at 02:22:52PM +0200, AngeloGioacchino Del Regno wrote:
>>>>> +#define CSIxB_OFFSET		0x1000
>>>>
>>>> What if we grab two (or three?) iospaces from devicetree?
>>>>
>>>> - base (global)
>>>> - csi_a
>>>> - csi_b
>>>>
>>>> That would make it possible to maybe eventually extend this driver to more
>>>> versions (older or newer) of the CSI PHY IP without putting fixes offsets
>>>> inside of platform data structures and such.
>>>>
>>> Hi Angelo,
>>> The register bank of the CSI port is divided into 2:
>>> * from base address to base + 0x1000 (port A)
>>> * from base + 0x1000 to base +0x2000 (port B)
>>> Some CSI port can be configured in 4D1C mode (4 data + 1 clock) using
>>> the whole register bank from base to base + 0x2000 or in 2D1C mode (2 data +
>>> 1 clock) and use either port A or port B.
>>>
>>> For example  mt8365 has CSI0 that can be used either in 4D1C mode or in
>>> 2 * 2D1C and CSI1 which can use only 4D1C mode
>>>
>>> 2D1C mode can not be tested and is not implemented in the driver so
>>> I guess adding csi_a and csi_b reg value may be confusing?
>>>
>>> What do you think?
>>
>> Ok so we're talking about two data lanes per CSI port... it may still be
>> beneficial to split the two register regions as
>>
>> reg-names = "csi-a", "csi-b"; (whoops, I actually used underscores before,
>>                                 and that was a mistake, sorry!)
>>
>> ....but that would be actually good only if we are expecting to get a CSI
>> PHY in the future with four data lanes per port.
>>
>> If you do *not* expect at all such a CSI PHY, or you do *not* expect such
>> a PHY to ever be compatible with this driver (read as: if you expect such
>> a PHY to be literally completely different from this one), then it would
>> not change much to have the registers split in two.
>>
>> Another case in which it would make sense is if we were to get a PHY that
>> provides more than two CSI ports: in that case, we'd avoid platform data
>> machinery to check the number of actual ports in the IP, as we would be
>> just checking how many register regions we were given from the devicetree,
>> meaning that if we got "csi-a", "csi-b", "csi-c", "csi-d", we have four
>> ports.
>>
>> Besides, another thing to think about is... yes you cannot test nor implement
>> 2D1C mode in your submission, but this doesn't mean that others won't ever be
>> interested in this and that other people won't be actually implementing that;
>> Providing them with the right initial driver structure will surely make things
>> easier, encouraging other people from the community to spend their precious
>> time on the topic.
>>
> Hi Angelo,
> Ok, I see your point, but for future potential upgrade to support A/B
> ports I was thinking of something else: adding independent nodes for csixA
> and csixB such as:
> 
> csi0_rx: phy@11c10000 {
>    reg = <0 0x11C10000 0 0x2000>;
>    mediatek,mode = <4D1c>;
>    ...
> };
> 
> csi0a_rx: phy@11c10000 {
>    reg = <0 0x11C10000 0 0x1000>;
>    mediatek,mode = <2D1c>;
>    ...
> };
> csi0b_rx: phy@11c11000 {
>    reg = <0 0x11C11000 0 0x1000>;
>    mediatek,mode = <2D1c>;
>    ...
> };
> 
> giving the correct register range. One thing I did not mention is that if
> csi0_rx is used csi0a_rx and csi0b_rx cannot be used (they share same
> physical lanes as csio_rx), but csi0a_rx and csi0b_rx can be used simultaneously.
> So platform device will enable only the node(s) it needs and enabling
> csi0_rx and csioa/b_rx will fail because they share the same register
> region and map will fail and it does not have any sense because you
> either have a camera using the whole port or sub port but you cannot have
> both plugged in. What do you think about it?
> 

Your description of the hardware makes me even more confident in pushing for
having one single node with multiple iospaces.

You could have a node such as:

csi0_rx: phy@11c10000 {
	compatible = ....
	reg = <0 0x11c10000 0 0x1000>, <0 0x11c20000 0 0x1000>;
	reg-names = "csi-a", "csi-b";
	/* 4 means 4D1C */
	num-lanes = <4>;
		or
	/* 2 means 2D1C */
	num-lanes = <2>;
};

You would then reference the csi0_rx node as:

	/* PHY is configured as 4 lanes (4D1C) */
	something = <&csi0_rx 0>;

	or

	/* First two lanes (CSI0 PORT-A) */
	something = <&csi0_rx 0>;
	/* Second two lanes (CSI0 PORT-B) */
	something = <&csi0_rx 1>;

Preferrably, you should (or shall?) use a graph to describe such connections,
anyway.

This is because overriding the number of lanes on a per-board basis becomes
*otherwise* difficult, in the sense of human readability issues, other than
duplicated nodes being a real issue.

Regards,
Angelo


