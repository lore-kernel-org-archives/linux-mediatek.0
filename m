Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6367C25B76
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jun 2024 12:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rRCcnj2jMkLvJXHyIOV1qFH+HjkbeuzHzQOHUvj+aHc=; b=4Y/gqy4rl47LBey6WJbtG8Jd/Y
	MP1mxIg5hjzMzmpEk4qsQ2XlxGiNqc8m82dRw48w7UmVwVqxdH8qGfyQUQjNwR2Yf3UiX/khI0zbg
	2oucjiCH4rssbaqEd4RzSKEf+WQo8fnGZZduFTD1P1aiWXXLv1XsIz0MFTzyQ2iTr4st46g3/JVvn
	X8tD6VSAbBMvuGurSuwj7V5cSgPiWWbV3BMDo6tQ7ejd/JWjNYZEBxX+taiTIEeJRKeNmD6TL9trC
	tjwF0V4/13JO7ePG+ZbUU6QFHn250TrqrxcjNex7STxN/THVcViKJYhomfmgJJyF+nv0Aturu3I1B
	cEdn5/eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH0lX-00000008rCV-1pm1;
	Tue, 11 Jun 2024 12:38:19 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH0lR-00000008rA6-0Ae9;
	Tue, 11 Jun 2024 12:38:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718109491;
	bh=kj5qaVbqaQZcuY/DAi1KbmqH4orxFs4setQOSPqpduw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CgsuC1JErhyECA3tzoGI0mBBnijkB/u/D7XKU3ntgykQVAZiOzecN2VpOqbnLs/Fz
	 Ao5uBmpzwfBH2KoRca+AYtHxsG3iBuukpbHqChzqZc01QTZV6FvEty7rwQujKUMrRt
	 a8PhUuf7EkaqVl9/En2ck6ePLXd/VphRyG2cYrRThlBnUlsyuNv6KGin+k91A1/OI8
	 Qemx6TjnsCUTWMpiMMwqANCZSYiR/LXrsj/jRxzZJL13pGekvL+CQK0ZXZZBgI0QZD
	 V355vc7Gcb3N3B8urMSe5AYyVZc9IDSocaWFXLkbjJuHu83HmBFUCOZLSb7ZkK+T3u
	 gIwuvLGRaOZvQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7418F3780EC6;
	Tue, 11 Jun 2024 12:38:10 +0000 (UTC)
Message-ID: <d7d32ef3-8b2e-476c-a15e-7f829ea0d60a@collabora.com>
Date: Tue, 11 Jun 2024 14:38:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ASoC: support machine driver with TAS2781
To: Mark Brown <broonie@kernel.org>,
 Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 matthias.bgg@gmail.com, trevor.wu@mediatek.com, allen-kh.cheng@mediatek.com,
 kuninori.morimoto.gx@renesas.com, maso.huang@mediatek.com,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20240611022227.2508354-1-zhourui@huaqin.corp-partner.google.com>
 <Zmgsfafmfedd9_MV@finisterre.sirena.org.uk>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <Zmgsfafmfedd9_MV@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_053813_490741_F97E2007 
X-CRM114-Status: GOOD (  14.35  )
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

Il 11/06/24 12:52, Mark Brown ha scritto:
> On Tue, Jun 11, 2024 at 10:22:27AM +0800, Rui Zhou wrote:
>> Support amp TAS2781 for mt8188 platform
>>
>> Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
>> ---
>>   sound/soc/mediatek/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
>> index 5a8476e1ecca..07f67f96c889 100644
>> --- a/sound/soc/mediatek/Kconfig
>> +++ b/sound/soc/mediatek/Kconfig
>> @@ -233,6 +233,7 @@ config SND_SOC_MT8188_MT6359
>>   	select SND_SOC_HDMI_CODEC
>>   	select SND_SOC_DMIC
>>   	select SND_SOC_MAX98390
>> +	select SND_SOC_TAS2781_I2C
>>   	select SND_SOC_NAU8315
>>   	select SND_SOC_NAU8825
> 
> Ideally this would be sorted to avoid spurious merge conficts.  Also do
> we really have dependencies here or should these just be being enabled
> by users - these drivers are all pretty generic now?

The only dependency is on the MT6359 PMIC's audio related IPs and nothing else.

I'd even remove the other select statements for the other codecs, honestly,
as there's no reason why MT8188 wouldn't support a codec or the other, and
there is no reason why that SoC needs exactly those codecs, apart from some
board (Chromebooks) having one, or the other.

Instead of adding a select statement on MT8188_MT6359, adding the TAS2781_I2C
driver as a module in defconfig is a better idea..... at least, IMO.

>  Not that this
> change in itself makes a huge difference to the existing state.

I agree it doesn't make any huge difference, but I also don't see why users
can't simply enable (y/m) that in the kernel configuration :-)

Cheers,
Angelo

