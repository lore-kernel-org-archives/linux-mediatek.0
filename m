Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1D8CCF9E9
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 09:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7kb6i3Ui41ioREAPMc1OYY2A/hgG1LeFTRItqcsIUMw=; b=XnvhYjk8Tst1+dXcHKi5wnWA0y
	9ONoJQWmNBQxqX0xqACo4qFVPOv0hE094/HIjtbOCHR8TIUcSyQoHZ/gx//kp0lrwbRkzWUu7PMnM
	Yx7LS55sEJuQvijBG34fZcXPNuUkqK8t9A613ffLEaGsWcGZ1Ao4BozZtLZb6Oib/S7j1Xa0d5lXW
	yts++s1S/Ez/HGXSRKaguwz2q2KAfFMHqH/UkEN3KDof0ch4QelmwEcR2TMP+AXa8z/JqvsL8fUGw
	xnC/YIGxPBmb6r3iOuWzU7h//HtjLgpAEfzPYjOpUZi4XM2LHIhc9SRTKjy0B0lYI42qAVkvE/ADX
	HzzdWO1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stlDF-00000007ysk-38es;
	Thu, 26 Sep 2024 09:55:05 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stl8U-00000007xK2-1Kul;
	Thu, 26 Sep 2024 09:50:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727344208;
	bh=zngix2gVE1F5QVFNusvqetKSt9V1HjHYpC3pgfic71I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l+s6nWGXm3sh1dqE7D5Yyhtk3Re8obEP+jmHsTeWoaPjQILsx/FO04F2el7sWQJ62
	 Se3neRT7D7DKG395C1kjkB5vxtTLqXZ6rPjEbsqniVuQmayYmKtfd17WDcEI99gX8Z
	 j+hIjh/Ax3sJi9zx5tTKRdTmxFjNryL6qKZ8xCSUZ9SQ4TYyk/kyI55Wp4Mfqca+sZ
	 tCQLATDTnIfALNZXRynWBkjRLFJVl92segxJCYmgVyV1sqbP3vRoyTEhjP6O2jXfYr
	 CmON4WhF2fQUwd9S3dus/PICjygvT6s7OxeNppDmg0da/rJjq7sSvRb3soTNoiamTT
	 o3vMd4lLODCOA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6574917E10C7;
	Thu, 26 Sep 2024 11:50:08 +0200 (CEST)
Message-ID: <d3cfc62e-5c79-48ef-b86e-28dc9c17012c@collabora.com>
Date: Thu, 26 Sep 2024 11:50:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] drm/mediatek: ovl: Add blend_modes to driver data
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "alpernebiyasak@gmail.com" <alpernebiyasak@gmail.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20240926083526.24629-1-jason-jh.lin@mediatek.com>
 <20240926083526.24629-2-jason-jh.lin@mediatek.com>
 <a3da0d24e6749b054f8a65656ec40d4aa0b9f2dc.camel@mediatek.com>
 <a704c8ad4e9d6e1644baf338cbb98de4aa2ccf6e.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <a704c8ad4e9d6e1644baf338cbb98de4aa2ccf6e.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_025010_543403_4A3C499B 
X-CRM114-Status: GOOD (  21.26  )
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

Il 26/09/24 11:49, Jason-JH Lin (林睿祥) ha scritto:
> On Thu, 2024-09-26 at 09:30 +0000, CK Hu (胡俊光) wrote:
>> Hi, Jason:
>>
>> On Thu, 2024-09-26 at 16:35 +0800, Jason-JH.Lin wrote:
>>> OVL_CON_CLRFMT_MAN is a configuration for extending color format
>>> settings of DISP_REG_OVL_CON(n).
>>> It will change some of the original color format settings.
>>>
>>> Take the settings of (3 << 12) for example.
>>> - If OVL_CON_CLRFMT_MAN = 0 means OVL_CON_CLRFMT_RGBA8888.
>>> - If OVL_CON_CLRFMT_MAN = 1 means OVL_CON_CLRFMT_PARGB8888.
>>>
>>> Since previous SoCs did not support OVL_CON_CLRFMT_MAN, this means
>>> that the SoC does not support the premultiplied color format.
>>> It will break the original color format setting of MT8173.
>>>
>>> Therefore, the blend_modes is added to the driver data and then
>>> mtk_ovl_fmt_convert() will check the blend_modes to see if
>>> premultiplied supported in current platform.
>>> If it is not supported, use coverage mode to set it to the
>>> supported
>>> color formats to solve the degradation problem.
>>>
>>> Fixes: a3f7f7ef4bfe ("drm/mediatek: Support "Pre-multiplied"
>>> blending in OVL")
>>> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>>> Tested-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
>>> Reviewed-by: AngeloGioacchino Del Regno <
>>> angelogioacchino.delregno@collabora.com>
>>
>> This version has difference over 50% with previous version.
>> It's better to drop these tested-by and reviewed-by tag.
> 
> OK, I'll drop this.
> 

You can keep my R-b tag on this one, I checked it.

Cheers,
Angelo

>>
>>> ---
>>>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 41 ++++++++++++++++++++-
>>> ----
>>>   1 file changed, 34 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
>>> b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
>>> index 89b439dcf3a6..0cf7b80f612e 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
>>> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
>>> @@ -146,6 +146,7 @@ struct mtk_disp_ovl_data {
>>>   	bool fmt_rgb565_is_0;
>>>   	bool smi_id_en;
>>>   	bool supports_afbc;
>>> +	const u32 blend_modes;
>>>   	const u32 *formats;
>>>   	size_t num_formats;
>>>   	bool supports_clrfmt_ext;
>>> @@ -386,14 +387,23 @@ void mtk_ovl_layer_off(struct device *dev,
>>> unsigned int idx,
>>>   		      DISP_REG_OVL_RDMA_CTRL(idx));
>>>   }
>>>   
>>> -static unsigned int ovl_fmt_convert(struct mtk_disp_ovl *ovl,
>>> unsigned int fmt,
>>> -				    unsigned int blend_mode)
>>> +static unsigned int mtk_ovl_fmt_convert(struct mtk_disp_ovl *ovl,
>>> +					struct mtk_plane_state *state)
>>>   {
>>> -	/* The return value in switch "MEM_MODE_INPUT_FORMAT_XXX"
>>> -	 * is defined in mediatek HW data sheet.
>>> -	 * The alphabet order in XXX is no relation to data
>>> -	 * arrangement in memory.
>>
>> I don't know why you drop these comment.
>> Without this modification,
> 
> Since we change the MACRO to align this to DRM input format order, this
> comment is no longer needed.
> 
> I'll send another patch for this.
> Thanks for such a quick reply!
> 
> Regards,
> Jason-JH.Lin
> 
>>
>> Reviewed-by: CK Hu <ck.hu@mediatek.com>
>>


