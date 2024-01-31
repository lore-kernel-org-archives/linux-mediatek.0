Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA54C47258
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jan 2024 11:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chi2lU5U1YU8qE1UXxKBErE0HNrknOZPJGYh4f+rrCo=; b=yb/+SuKKA8UaN2mwM+ewIX8FLF
	D5LLaJ27kB7bW5GcTz4PK62dw1bcby7lhoFpByEBdPNHl2oruY6w2x4DXYpxtBSPU8ZoOe22xpRU+
	UGvOkw8I4aExspfrNpm+t6rsfdo3v9L7Y8zVmCGDrb+2AcHB7742aj+N4XgLyaesoBKgozGk7beXt
	T/IJnt7BxWZvkdgWnuNkct2NgqhmhBOBj/mRvYD0RMq50dCiQHHNwrmQTKZ0leHFx7tj3zPTOd3Dp
	8POYHxel/JpcyF8jxSSbTq3yDb93K96tmMYe+nWR7nJucIv/ix6niOgfMZEXnR70uFUa8db/BkFkJ
	gcwW8yEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8za-00000003BQF-1E0l;
	Wed, 31 Jan 2024 11:42:58 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8zX-00000003BPG-00mK;
	Wed, 31 Jan 2024 11:42:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706701373;
	bh=1LrKOT6zOkvOtdG1q90dBaEd32pdBD9e7IHCq6opG3E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ABzV98aIWDp/moh2/6kSB/75RQPaCX1CmoupAYsmYelEfLo0KtRw9iQs4R8ItoJ4R
	 r1mCT5mRcu9gnjvrMDcPN44gMPE4P3xt98NCrMUKooo1NS+eDLDrptHunAYN+Vl4m2
	 XJTlC4JKQakK4DZ0iOxlCy+AzQ+730fZWFI5MXlQojMjH2Ix9fps5FJIk0Lv7jD/6s
	 NQXi7vZDeFeKQKaLNGl7TygDovkqpVTeAufE/87T5HPAbA/lvOi0zpHp5IredGZXB8
	 R9BcWPxsOb5Sr7sJ7hV1ZrBXeRlpPNh/9iYFGj5xvIwGQnLzIO9ZHgtLCMINIcF/lA
	 ZpIrfScC/5ikQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 58C1B3781FE1;
	Wed, 31 Jan 2024 11:42:52 +0000 (UTC)
Message-ID: <11f4cfd2-f6a2-45cb-923a-95760a1b9883@collabora.com>
Date: Wed, 31 Jan 2024 12:42:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 2/3] ASoC: mediatek: mt8186: correct the HDMI widgets
Content-Language: en-US
To: =?UTF-8?B?SmlheGluIFl1ICjkv57lrrbpkasp?= <Jiaxin.Yu@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "ajye_huang@compal.corp-partner.google.com"
 <ajye_huang@compal.corp-partner.google.com>,
 =?UTF-8?B?Q2h1bnh1IExpICjmnY7mmKXml60p?= <Chunxu.Li@mediatek.com>,
 =?UTF-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsik=?=
 <Allen-KH.Cheng@mediatek.com>,
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
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>
References: <20230730180803.22570-1-jiaxin.yu@mediatek.com>
 <20230730180803.22570-3-jiaxin.yu@mediatek.com>
 <25e6ab45-ecad-4bc3-bf4d-983243c939ad@sirena.org.uk>
 <c6ae8630d06138b6d0156c19323afebf0718f522.camel@mediatek.com>
 <089fe457-1c61-4b7b-ad37-a67e7f46cb56@sirena.org.uk>
 <6aa6947865795fc534b61f5b8a80b3c42fd5a0cd.camel@mediatek.com>
 <9c90185c-9cd4-4a08-9925-be5d460af54d@sirena.org.uk>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <9c90185c-9cd4-4a08-9925-be5d460af54d@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_034255_192242_DBCE76B8 
X-CRM114-Status: GOOD (  12.17  )
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

Il 03/08/23 21:33, Mark Brown ha scritto:
> On Thu, Aug 03, 2023 at 07:20:15AM +0000, Jiaxin Yu (俞家鑫) wrote:
> 
>> I agree with you, in fact the speaker is indeed doing this way. But
>> about the hdmi that on the board, I did not find a defination link
>> snd_soc_dapm_hdmi, so I use snd_soc_dapm_line to replace. The purpose
>> is to control it link speaker. Or what do you suggest I should do?
> 
> I think the sensible thing here is to define a DIGITAL_OUTPUT() which
> can be used for HDMI, S/PDIF and anything else that comes up and isn't
> clearly wrong like reusing one of the analog descriptions is.

Hello Jiaxin,

the MT8186 Corsola Chromebooks are broken upstream without this series.

Are you still interested in upstreaming this one?

Thanks,
Angelo

