Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B4FC47DDF
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jan 2024 12:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fcSfInrMRDMNfqCpUEbtkUTF2FjkJhAuPxRXbI8UKs=; b=0Tx2SHsqwDL0SdGRTsoGTWvTJc
	8oiy/aoQQDML0q9HjZQf0xv3ZNIORaVFMcvKQEk3Vv8SQ6bY2g/5MJqXCjm/S82/5aAUhK1B5V3At
	JVtO+CcGTnwjUIIYN8dMOLdPbp7cLni7kloqEU3A32GL4poKGmKdQRpu7mqNzYLoh94eZVGd458eM
	CvFLjCfsg2Ul29hzfxKxRFuV+CqRDc5427oyGfoHoY65tPNt4o5i1BI4D6AnlsR4kyDs64jmwGoYc
	FteYEVz4cUM1f4CnNKBOTiaS+La7QMBbF7I6wIqNctVflUI+IihOIieorliBzALPYN00e4G5NrnwB
	7N1zVUig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV9qD-00000003NWD-3pxL;
	Wed, 31 Jan 2024 12:37:21 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV9qA-00000003NTt-1wXA;
	Wed, 31 Jan 2024 12:37:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706704635;
	bh=Ve4gakTdVS97IwqTqcMnjzvWFWX6F6kTDN1mDs18iWk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=41d6lcDsQ90ipamoTz3UtZcsw2iXlPy7t1JTzpmTLR9qEbkF37yICg6gufCEmP0xi
	 WikrqZ5S9PupmXPsKWNrWuwr2aMpfDF4Y5cy5uQhRf0fBEAaBbetM4/ChJaJNQ4T+c
	 5LnyycU1ikRrIP4h9TjQXLse8mkj35nDJorXGj47AR//KMgBFNOVWJgkBqcG033AnQ
	 26XmZh/XWEklOHVyRvibqt4MB36P9DxGhsgfcdpXqn1x3UqKWKXDaWUuy/Oljwtcmi
	 LvTmnmT2eqU2su1/k/KGbdmAaHNxHCsjOhhX5fh7AFIJUShIbrSH3R/UBn7xFO0oef
	 l5gafT5LSpoxw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 65D1D378203B;
	Wed, 31 Jan 2024 12:37:14 +0000 (UTC)
Message-ID: <6020133f-53ee-4bbe-856f-7b7b0957081f@collabora.com>
Date: Wed, 31 Jan 2024 13:37:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 2/3] ASoC: mediatek: mt8186: correct the HDMI widgets
Content-Language: en-US
To: =?UTF-8?B?SmlheGluIFl1ICjkv57lrrbpkasp?= <Jiaxin.Yu@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "ajye_huang@compal.corp-partner.google.com"
 <ajye_huang@compal.corp-partner.google.com>,
 =?UTF-8?B?Q2h1bnh1IExpICjmnY7mmKXml60p?= <Chunxu.Li@mediatek.com>,
 =?UTF-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsik=?=
 <Allen-KH.Cheng@mediatek.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>
References: <20230730180803.22570-1-jiaxin.yu@mediatek.com>
 <20230730180803.22570-3-jiaxin.yu@mediatek.com>
 <25e6ab45-ecad-4bc3-bf4d-983243c939ad@sirena.org.uk>
 <c6ae8630d06138b6d0156c19323afebf0718f522.camel@mediatek.com>
 <089fe457-1c61-4b7b-ad37-a67e7f46cb56@sirena.org.uk>
 <6aa6947865795fc534b61f5b8a80b3c42fd5a0cd.camel@mediatek.com>
 <9c90185c-9cd4-4a08-9925-be5d460af54d@sirena.org.uk>
 <11f4cfd2-f6a2-45cb-923a-95760a1b9883@collabora.com>
 <aeef45d131e3e0131b57958253c85cd50a378f63.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <aeef45d131e3e0131b57958253c85cd50a378f63.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_043718_668615_77D53462 
X-CRM114-Status: GOOD (  14.00  )
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

Il 31/01/24 13:25, Jiaxin Yu (俞家鑫) ha scritto:
> On Wed, 2024-01-31 at 12:42 +0100, AngeloGioacchino Del Regno wrote:
>> Il 03/08/23 21:33, Mark Brown ha scritto:
>>> On Thu, Aug 03, 2023 at 07:20:15AM +0000, Jiaxin Yu (俞家鑫) wrote:
>>>
>>>> I agree with you, in fact the speaker is indeed doing this way.
>>>> But
>>>> about the hdmi that on the board, I did not find a defination
>>>> link
>>>> snd_soc_dapm_hdmi, so I use snd_soc_dapm_line to replace. The
>>>> purpose
>>>> is to control it link speaker. Or what do you suggest I should
>>>> do?
>>>
>>> I think the sensible thing here is to define a DIGITAL_OUTPUT()
>>> which
>>> can be used for HDMI, S/PDIF and anything else that comes up and
>>> isn't
>>> clearly wrong like reusing one of the analog descriptions is.
>>
>> Hello Jiaxin,
>>
>> the MT8186 Corsola Chromebooks are broken upstream without this
>> series.
>>
>> Are you still interested in upstreaming this one?
>>
>> Thanks,
>> Angelo
> 
> Hello Angelo,
> 
> No, I'm still interesting in upstream this series. It's just that I
> have less time recently. I'm considering revisiting this issue next
> mouth. Do you have any suggestions for this?
> 

Nothing on top of Mark's suggestions.

Angelo



