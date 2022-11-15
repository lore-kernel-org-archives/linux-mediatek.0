Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA10AC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 08:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kobGDaLp/XMQcdzV/fuQ/I4j6UcS2IzvXHemgFjeCaE=; b=cA3VgnGuuuqlDcenWxyHwFm4bu
	DhVobeUU1KqYLuJX9uMKZNNoBvaGyOsUPLHPxWwXzBsdkxgiOpkuqLC7xAn/VsiFPwENRg8p59IUR
	OKHSibLpbD3G4lE29uBMN95ynZaauEAjNype87txUyZDPyupyWQkMh68XH6o9ne/u0FkRf1u+yb4t
	Ad7rKaW3GGdH2R954Fp9m03jSvKtTkUWP/Q40xTxJ7pOkH5lNea7rUMc50jfE565GOvKUFf3wGr2c
	HTXobQFkW0jp4aellevdmJMGK4PvcHNCY1YcHir+zg4mI6ebD0fL8tzAiAG3nXc0fyIi83T3cKSZQ
	PZ3DUNEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ourct-0092MT-5w; Tue, 15 Nov 2022 08:49:03 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ourcc-00928y-Od; Tue, 15 Nov 2022 08:48:48 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D5BE46602A38;
	Tue, 15 Nov 2022 08:48:40 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668502121;
	bh=afh5nLCtMvnV2dhw8HFhFnQfG2zyHLlOoAj39CkXeNk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YWidoY67PPOWtdw1B2RBEp7e2W05Cld19Ygu8m29KXI8Yztk5n10AzbdLNtdVPlzo
	 1ruqRz5fhHMRokmnt7h0Wg7FI9lv2BdW2PXdshiilurmQ4LJ6401qIlgi459j6vls7
	 knmEx4+hUn0HqggWooB5FO/1htfNhQ6mzGn5maGvUrE5tb/RLE4+epChr5eU7Amrnk
	 MTwtQ0u5PKXmFfQ8jMiNz4q+fhxQQEYRqy+iN0M5GLBZlmVCVSgE+S63CcKwS8d8KQ
	 A8hG90hX49AK7QCFLBu/4+35xzLp+P68udhaOQ2DMiN5bWP9NgWtWWruBcyszDMmPZ
	 JuzSCLvOYgzeQ==
Message-ID: <75d967f0-f200-da86-868d-7f85a56371aa@collabora.com>
Date: Tue, 15 Nov 2022 09:48:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2] media: mediatek: vcodec: fix h264 cavlc bitstream fail
Content-Language: en-US
To: =?UTF-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
 "wenst@chromium.org" <wenst@chromium.org>,
 =?UTF-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
 "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>
Cc: =?UTF-8?B?WGlhb3lvbmcgTHUgKOWNouWwj+WLhyk=?= <Xiaoyong.Lu@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?R2VvcmdlIFN1biAo5a2Z5p6XKQ==?= <George.Sun@mediatek.com>,
 "frkoenig@chromium.org" <frkoenig@chromium.org>,
 "stevecho@chromium.org" <stevecho@chromium.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "hsinyi@chromium.org" <hsinyi@chromium.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
References: <20221018114122.26785-1-yunfei.dong@mediatek.com>
 <f301a43a-5d55-1607-b8d3-5cd057977397@collabora.com>
 <2d7212e96ca2b80934cc5b53300f46e0454085a3.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <2d7212e96ca2b80934cc5b53300f46e0454085a3.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_004847_175310_EE46318F 
X-CRM114-Status: GOOD (  26.10  )
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

Il 15/11/22 03:00, Yunfei Dong (董云飞) ha scritto:
> Hi AngeloGioacchino,
> 
> Thanks for your detail suggestion.
> On Mon, 2022-11-14 at 12:08 +0100, AngeloGioacchino Del Regno wrote:
>> Il 18/10/22 13:41, Yunfei Dong ha scritto:
>>> Some cavlc bistream will decode fail when the frame size is small
>>> than
>>
>> s/small/smaller/g
> 
> Will fix in next patch.
>>
>>> 20 bytes. Need to add pending data at the end of the bitstream.
>>>
>>> For the minimum size of mapped memory is 256 bytes(16x16), adding
>>> four bytes data
>>> won't lead to access unknown virtual memory.
>>>
>>> Fixes: 59fba9eed5a7 ("media: mediatek: vcodec: support stateless
>>> H.264 decoding for mt8192")
>>> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>>> ---
>>> compared with v1:
>>> - add detail comments for function: vdec_h264_insert_startcode.
>>> - re-write commit message.
>>> ---
>>>    .../vcodec/vdec/vdec_h264_req_multi_if.c      | 32
>>> +++++++++++++++++--
>>>    1 file changed, 29 insertions(+), 3 deletions(-)
>>>
>>> diff --git
>>> a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_i
>>> f.c
>>> b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_i
>>> f.c
>>> index 4cc92700692b..18e048755d11 100644
>>> ---
>>> a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_i
>>> f.c
>>> +++
>>> b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_i
>>> f.c
>>> @@ -539,6 +539,29 @@ static int vdec_h264_slice_core_decode(struct
>>> vdec_lat_buf *lat_buf)
>>>    	return 0;
>>>    }
>>>    
>>> +static void vdec_h264_insert_startcode(struct mtk_vcodec_dev
>>> *vcodec_dev, unsigned char *buf,
>>> +				       size_t *bs_size, struct
>>> mtk_h264_pps_param *pps)
>>> +{
>>> +	struct device *dev = &vcodec_dev->plat_dev->dev;
>>> +
>>> +	/* Need to add pending data at the end of bitstream when bs_sz
>>> is small than
>>> +	 * 20 bytes for cavlc bitstream, or lat will decode fail. This
>>> pending data is
>>> +	 * useful for mt8192 and mt8195 platform.
>>
>> What is the reason why other SoCs don't need this?
>>
> For the hardware not add this feature, and will add in the future Soc.
>>> +	 *
>>> +	 * cavlc bitstream when entropy_coding_mode_flag is false.
>>> +	 */
>>> +	if (pps->entropy_coding_mode_flag || *bs_size > 20 ||
>>> +	    !(of_device_is_compatible(dev->of_node, "mediatek,mt8192-
>>> vcodec-dec") ||
>>> +	    of_device_is_compatible(dev->of_node, "mediatek,mt8195-
>>> vcodec-dec")))
>>
>> I'm not comfortable seeing of_device_is_compatible... this list will
>> grow whenever
>> a new SoC needing this appears.
>> Please think about a good name for a flag/quirk, or a bool, in the
>> platform data
>> for these two SoCs and use it.
>>
> For this feature only need to add in these two Socs, and won't grow
> anymore. So just want to use compatible to separate, not add one flags.
> 
> So you think that using one flag to separate much better?
> 

A flag is better: please remember that calls to of_device_is_compatible()
will perform a string comparison which, as you know, as much optimized as
it can be, it's always going to be slower than a simple integer/bool/flag
check.

This means that even for functional (not just cosmetic) reasons we should
not use of_device_is_compatible() here :-)

Cheers,
Angelo



