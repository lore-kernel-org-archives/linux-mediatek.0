Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402F2C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 15:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZt29QmhSEBBSLzqWM2ZNob+xLXxbXJrZ+TvEAjAZpY=; b=V57V5lyY17/LV75muspYLF1Aw0
	Yw0S+D3e/PYEE+HakK89Mhj3SYmUjfuafQWnVQBhptySMXI2DIfrgTrnyT0sHl/laU8CMhy3mQQSh
	FT0AsjPQrv8Oy1RSEAmFIS+o6E9L6OGy1mGwzs857fzxJdRysTgpLFnJbn7hEzP4E+gQ1ARVdM787
	RiHMj23wyNRM7WbCY+XeUdymuIRcXJ3DdqaN1vZbxeo57NSe4Q+LcFOE+MQ9x0p4ouapok011Mp/b
	khtVeCAHF2h591SdLBfkXiFsKYJ/WD2W80JP8a+0qITqg39azOPNvAxzW6iSi+/E//ny68Iou+rNG
	AuidrxCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9q9c-004R9n-CE; Fri, 08 Jul 2022 15:44:28 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9q9Q-004R5o-9f; Fri, 08 Jul 2022 15:44:17 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B8C85660191B;
	Fri,  8 Jul 2022 16:44:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657295054;
	bh=C9e8etBg/94GadxYv8MdzYOOgITsxTDLOb+J9ydTXUI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bogbx1s19Ny4+aonY/okvHFLJtBHdmRxtkEfd1xOkVJPG/pCRbiXuDyiQZt+3sEpv
	 0MP0rJ7WxFIvF6O0LTlWTmpnVQtAcA0pQYxjzyquj3HcBm9CmVi+wOarpRO4oZ1zhv
	 h3OnP1zB6fnKVqj2lDInyqfDRRKtqTdG75rQ33ZuAO7DjhxtkX71Zke4XqBfXPf6pk
	 /xZK7Y8sm+CRVgvv0ozMkwpUa2cLD/HfuG/HhYHT2TmnB1U2RSxr3qYxkBOzVdT0z1
	 /Y6udKRV95q1mMx15ceWrXvR/rsAYvS5abCrFCsGK4WiI/pYTMAZ0K4w8fT0Y/DBhR
	 vpasooaBoS8VA==
Message-ID: <ac4179e3-decf-f620-c5c8-5f8ec28fc69f@collabora.com>
Date: Fri, 8 Jul 2022 17:44:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] ASoC: mediatek: mt8186: Remove condition with no effect
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, Zhongjun Tan <hbut_tan@163.com>,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.c, tiwai@suse.com,
 matthias.bgg@gmail.com, tanzhongjun@coolpad.com, colin.king@intel.com
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220708024651.42999-1-hbut_tan@163.com>
 <ee0d9788-b742-21bb-9cc5-7b729897408b@collabora.com>
 <503a71aa95b8e4b75eb7e9e5de03a013f5155036.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <503a71aa95b8e4b75eb7e9e5de03a013f5155036.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_084416_496115_46356AA4 
X-CRM114-Status: GOOD (  16.07  )
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

Il 08/07/22 12:19, Jiaxin Yu ha scritto:
> On Fri, 2022-07-08 at 10:01 +0200, AngeloGioacchino Del Regno wrote:
>> Il 08/07/22 04:46, Zhongjun Tan ha scritto:
>>> From: Zhongjun Tan <tanzhongjun@coolpad.com>
>>>
>>> Remove condition with no effect
>>>
>>> Signed-off-by: Zhongjun Tan <tanzhongjun@coolpad.com>
>>> ---
>>>    sound/soc/mediatek/mt8186/mt8186-dai-adda.c | 2 --
>>>    1 file changed, 2 deletions(-)
>>>
>>> diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
>>> b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
>>> index db71b032770d..6be6d4f3b585 100644
>>> --- a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
>>> +++ b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
>>> @@ -295,8 +295,6 @@ static int mtk_adda_pad_top_event(struct
>>> snd_soc_dapm_widget *w,
>>>    	case SND_SOC_DAPM_PRE_PMU:
>>>    		if (afe_priv->mtkaif_protocol ==
>>> MTKAIF_PROTOCOL_2_CLK_P2)
>>>    			regmap_write(afe->regmap, AFE_AUD_PAD_TOP,
>>> 0x39);
>>> -		else if (afe_priv->mtkaif_protocol ==
>>> MTKAIF_PROTOCOL_2)
>>> -			regmap_write(afe->regmap, AFE_AUD_PAD_TOP,
>>> 0x31);
>>
>> I think that this needs some clarification from MediaTek: was 0x31 a
>> typo here?
>>
>> Regards,
>> Angelo
>>
> Hi Angelo,
> 
> This patch can be accepted. The 0x31 is not typo, the logic of this
> code is not concise enough.
> 
> Thanks,
> Jiaxin.Yu

Thank you for the clarification. In this case:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers!

> 
>>>    		else
>>>    			regmap_write(afe->regmap, AFE_AUD_PAD_TOP,
>>> 0x31);
>>>    		break;
>>
>>
> 


