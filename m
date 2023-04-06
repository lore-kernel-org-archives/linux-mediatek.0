Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9FBC7618D
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Apr 2023 08:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g28qTdarn5T1CQwl0LUd8q9n28ZuC0xYE9nwtd0SmPM=; b=vSPzZ3BKbaHxjGdEbi+bFQ5xOl
	L/6lxRDbpaWMXkVWjKMGdeLwmsdv3/kNSvYdcUVxzMUDl6MPgixaax1r/oT5RjCVBoxcUYpB0ViMO
	/vECPs5yt/YGEqUMty6LOfm122fQnYAxeofZNVZw6stChyGHuqNmSR2icvZDI4LPyFsIvOm0bmsT0
	PcyTO3asq3rb7BSZwwe+P6BsEgs1H879s7dpOLtCCyl2QnJ0YzPXRkDI3qf9AMI64Rq1KdlCPtaR1
	poK0hPVT6jHuYEzobwrHI0oeARCQSPAtsBbrdxAqUL8COyGBLzGAV5XZVjkh6Kg3kgbxZh6dSNOMO
	0P4n0mSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkKxC-006kWu-1e;
	Thu, 06 Apr 2023 08:26:46 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkKx8-006kW2-20;
	Thu, 06 Apr 2023 08:26:44 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D2DB566031BB;
	Thu,  6 Apr 2023 09:26:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680769601;
	bh=oav4Q570+IEqHszuEMrP/J+ZVB35sBCGUh4o0TPxawM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ai2Nd2YO8SxMM8/ddeAPkrdFMoD9kv3YFuruuXcJoU4pioQJAjxuWLunBQm8OHtvg
	 CEVHsiOPZQqmQszmzYO3GFGgwU6hGEzLfaPVLxPHtr6mLZiwhpqhktR/7i4QViRcLs
	 +LhTwZFKXMsTDlnDX10dsLft1tKLnaJurc9ZlZp+w/HpdytqmIroTGMN5HIJkIz7ub
	 PEkvXvSsuDIbVrdl9+qNGWzHKyV+ooIzfu9j6DdtJ2evtHUm/w8IS836F5VLM8Jq7p
	 kGYXH29+uxtbILPM0IByxVUG3lSZzdOh7uhY6Pwr2/wmuy9/LNfv9E91NNXz6fvhpX
	 WJiqXMgl638Jg==
Message-ID: <17342952-ce6b-a473-4bf0-f96a49d13632@collabora.com>
Date: Thu, 6 Apr 2023 10:26:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 2/9] drm/mediatek: dp: Move AUX and panel poweron/off
 sequence to function
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20230404104800.301150-1-angelogioacchino.delregno@collabora.com>
 <20230404104800.301150-3-angelogioacchino.delregno@collabora.com>
 <CAGXv+5FrUPUg_SsRz6LrW_K_C7By2tSCQ9W_MNJr8XCOcn7gLA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5FrUPUg_SsRz6LrW_K_C7By2tSCQ9W_MNJr8XCOcn7gLA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_012642_914710_D69C76F8 
X-CRM114-Status: GOOD (  23.06  )
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

Il 06/04/23 10:20, Chen-Yu Tsai ha scritto:
> On Tue, Apr 4, 2023 at 6:48 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Everytime we run bridge detection and/or EDID read we run a poweron
>> and poweroff sequence for both the AUX and the panel; moreover, this
>> is also done when enabling the bridge in the .atomic_enable() callback.
>>
>> Move this power on/off sequence to a new mtk_dp_aux_panel_poweron()
>> function as to commonize it.
>> Note that, before this commit, in mtk_dp_bridge_atomic_enable() only
>> the AUX was getting powered on but the panel was left powered off if
>> the DP cable wasn't plugged in while now we unconditionally send a D0
>> request and this is done for two reasons:
>>   - First, whether this request fails or not, it takes the same time
>>     and anyway the DP hardware won't produce any error (or, if it
>>     does, it's ignorable because it won't block further commands)
>>   - Second, training the link between a sleeping/standby/unpowered
>>     display makes little sense.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_dp.c | 76 ++++++++++++-------------------
>>   1 file changed, 30 insertions(+), 46 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
>> index 84f82cc68672..76ea94167531 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
>> @@ -1253,6 +1253,29 @@ static void mtk_dp_audio_mute(struct mtk_dp *mtk_dp, bool mute)
>>                             val[2], AU_TS_CFG_DP_ENC0_P0_MASK);
>>   }
>>
>> +static void mtk_dp_aux_panel_poweron(struct mtk_dp *mtk_dp, bool pwron)
>> +{
>> +       if (pwron) {
>> +               /* power on aux */
>> +               mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
>> +                                  DP_PWR_STATE_BANDGAP_TPLL_LANE,
>> +                                  DP_PWR_STATE_MASK);
>> +
>> +               /* power on panel */
>> +               drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D0);
>> +               usleep_range(2000, 5000);
>> +       } else {
>> +               /* power off panel */
>> +               drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D3);
>> +               usleep_range(2000, 3000);
>> +
>> +               /* power off aux */
>> +               mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
>> +                                  DP_PWR_STATE_BANDGAP_TPLL,
>> +                                  DP_PWR_STATE_MASK);
>> +       }
>> +}
>> +
>>   static void mtk_dp_power_enable(struct mtk_dp *mtk_dp)
>>   {
>>          mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_RESET_AND_PROBE,
>> @@ -1937,16 +1960,9 @@ static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
>>          if (!mtk_dp->train_info.cable_plugged_in)
>>                  return ret;
>>
>> -       if (!enabled) {
>> -               /* power on aux */
>> -               mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
>> -                                  DP_PWR_STATE_BANDGAP_TPLL_LANE,
>> -                                  DP_PWR_STATE_MASK);
>> +       if (!enabled)
>> +               mtk_dp_aux_panel_poweron(mtk_dp, true);
>>
>> -               /* power on panel */
>> -               drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D0);
> 
> I suspect the original code was somewhat wrong already? We shouldn't need
> to pull the panel out of standby just for HPD or reading EDID.
> 
> This driver probably needs a lot more cleanup. :/
> 

I believe the same... but I wanted to play safe, as I don't know if there's any
panel in particular that requires such quirk...

Angelo



