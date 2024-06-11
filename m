Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4F9C25B76
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jun 2024 14:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SAX3YydO9L5ETYZNWCtzE2y6W+KajMLOhrlHyJsrECI=; b=hFtVL4KXic+O+ZjgoFQv4AtKGc
	61ERrl3VY2dPCe1/yOvU0iB/JQc6s5fHgp/oHmY3eAWugRqzW2gd+9emJluxuGEpm+qD35RuQnKVs
	VFiBfGicNnx/D1HmJt0HVdTQ1KvUd3hu4a/A00xaXkTwrJGJGT5PBYJ/f5EbdPR7pBF7F0csad57P
	34YEiP24m9KHPC/jT1W2N1JkrGfRYi+mNLRfgVi70kf8T1gAKSDKH6hRze0M9l5o4epSpixGRFnQZ
	19+Qk/fY2iRsvK7VbjffbIFRc1+XMbCwG+eK8MUjDa6NhpYraQt/h8itVRjlXdBd+X2nU9piweHDm
	w9qPnufQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH2Bx-000000096XD-16wk;
	Tue, 11 Jun 2024 14:09:41 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH2Bt-000000096W7-1GbQ;
	Tue, 11 Jun 2024 14:09:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718114972;
	bh=ViofiMOvrZEBNMzdr2R4C7k85V0pmt2Bb6QhxHXjizQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=z8w1uM6JTfeMeIDudhxhwiHEgYehSqnEGTDABQVoj3aC1VPQh4i44uj47CKFXIBbs
	 wmVbqW7fyNsKEnQSQJrVXb7RSYPkeehuB+LFf40zh+kpnyS5Xw+Q7mO+O8Mn+nlm6P
	 HFjWhCBOURo+KcvedcAMuQ/o0cTMGc/eAdDe2s9F1+AEK1UoLNzAQOvTKaHFLTAq32
	 FUt2XoRrrb8vTopBmAHJ1PqIMiEK1iI7fAVoPhc68K5c0PHyz8/ChjTbxUTVg7HHrq
	 tfDwkxnP4fTUg6hZsCRogZKplvnUCQB6VHOidCDOJkFnP9bKJP4pqCT2DHzZTclaWM
	 R/9C4ZUdMa+Qw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1FB533782186;
	Tue, 11 Jun 2024 14:09:32 +0000 (UTC)
Message-ID: <ca44b61a-3399-41b4-9f78-81a2ae963ce3@collabora.com>
Date: Tue, 11 Jun 2024 16:09:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ASoC: support machine driver with TAS2781
To: Mark Brown <broonie@kernel.org>
Cc: Rui Zhou <zhourui@huaqin.corp-partner.google.com>, lgirdwood@gmail.com,
 perex@perex.cz, tiwai@suse.com, matthias.bgg@gmail.com,
 trevor.wu@mediatek.com, allen-kh.cheng@mediatek.com,
 kuninori.morimoto.gx@renesas.com, maso.huang@mediatek.com,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20240611022227.2508354-1-zhourui@huaqin.corp-partner.google.com>
 <Zmgsfafmfedd9_MV@finisterre.sirena.org.uk>
 <d7d32ef3-8b2e-476c-a15e-7f829ea0d60a@collabora.com>
 <ZmhOz7BB8eJ38QVE@finisterre.sirena.org.uk>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <ZmhOz7BB8eJ38QVE@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_070937_605111_6E14D68C 
X-CRM114-Status: GOOD (  21.01  )
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

Il 11/06/24 15:19, Mark Brown ha scritto:
> On Tue, Jun 11, 2024 at 02:38:09PM +0200, AngeloGioacchino Del Regno wrote:
>> Il 11/06/24 12:52, Mark Brown ha scritto:
>>> On Tue, Jun 11, 2024 at 10:22:27AM +0800, Rui Zhou wrote:
>>>> Support amp TAS2781 for mt8188 platform
> 
>>>> +++ b/sound/soc/mediatek/Kconfig
>>>> @@ -233,6 +233,7 @@ config SND_SOC_MT8188_MT6359
>>>>    	select SND_SOC_HDMI_CODEC
>>>>    	select SND_SOC_DMIC
>>>>    	select SND_SOC_MAX98390
>>>> +	select SND_SOC_TAS2781_I2C
>>>>    	select SND_SOC_NAU8315
>>>>    	select SND_SOC_NAU8825
> 
>>> Ideally this would be sorted to avoid spurious merge conficts.  Also do
>>> we really have dependencies here or should these just be being enabled
>>> by users - these drivers are all pretty generic now?
> 
>> The only dependency is on the MT6359 PMIC's audio related IPs and nothing else.
> 
>> I'd even remove the other select statements for the other codecs, honestly,
>> as there's no reason why MT8188 wouldn't support a codec or the other, and
>> there is no reason why that SoC needs exactly those codecs, apart from some
>> board (Chromebooks) having one, or the other.
> 
> Right, that's what I meant - the drivers are now so generic that they
> probably shouldn't be selecting everything they could possibly work
> with.
> 
>> Instead of adding a select statement on MT8188_MT6359, adding the TAS2781_I2C
>> driver as a module in defconfig is a better idea..... at least, IMO.
> 
> Yes.
> 
>>>   Not that this
>>> change in itself makes a huge difference to the existing state.
> 
>> I agree it doesn't make any huge difference, but I also don't see why users
>> can't simply enable (y/m) that in the kernel configuration :-)
> 
> I think this is a result of the drivers originally being very specific
> to a particular setup

Yeah, I agree.

 >
> and gradually getting made more generic, if the
> driver can only be used on a specific machine then the selects make
> sense but that's no longer the case for these drivers I think.

No this is not going to be used only for a specific machine... so yeah your
thoughts are totally right.

Just as an example, MT8188 (Kompanio) and MT8390 (Genio) are the same SoC again,
like MT8195 (Kompanio) and MT8395 (Genio) - so this driver is also going to be
used for the Genio 700 EVK, other than some SBC, etc, which do anyway expose I2S
pins on some kind of header, so... :-)

Cheers!

