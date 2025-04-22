Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A232C369C2
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Apr 2025 15:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LrRr7YL1sUndM+TTzLFwngoOX8HTf8RthpcfqJ5G5gI=; b=e3c4VxmdIk+XTV80OOKYSPBoRT
	q0mOPSR72DRsufds8v6eekdP51AxjXPWEYcdVU3jjwxo/ztX/6Q9BLuvXMI9HIeFZZfh/W/Lq8Oua
	t6A+i79qW0J5QrrOindL5mejlEC8p/IJ620UPrhWU5jbUbjwqE01VG2w/3IqE6TDVlXILW+ycd3Ai
	aCmZJ7kI5bjwPZnYADwTPJO5AjGNFAVjFXmE78fWg//WZfs0TcswcGXxk9TT3P5t6k3MLTI4Y5DhE
	yEkBxhQuXM2F3CMqbBQzCYYLWmctYXkfMsZZ8D24Q2+wgKu9+pD8UV+jPNcPmqLPAgrLJXyn7iTpu
	2a9FKVvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FeW-00000007kAW-0Zla;
	Tue, 22 Apr 2025 15:35:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7EPy-00000007SFj-3gP1
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Apr 2025 14:16:12 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MCg1m0023132
	for <linux-mediatek@lists.infradead.org>; Tue, 22 Apr 2025 14:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LrRr7YL1sUndM+TTzLFwngoOX8HTf8RthpcfqJ5G5gI=; b=GnDdAjw/cw6eQ7mY
	TwZNIklOdPwvghRqJLpGxwMqdBIrR2izJlNUofl9o0E+bDSPM+fx098ZfNShxrUj
	hL7ZKXkkVGymfkaimE3jmfC1CjfZRAl6Y9ShMHnMlb3kaj2+c9TrN7If4/72J+WU
	cTgHTeCPJrIDQ7NpnTVkG0bq7MUDYzd1k00tex9r2gkXjA7E7j+u92ZY2/Gjv+TW
	TnQZts+KZ7MQ9I3m4wOMBW0n1cveWHZWc2kL9+SDGbZbJzCIsLVQoRNUOyXLuzcX
	BIW1nwTtiZqX6XbQZ8jGW4aPhs8GxZP6iA6Zk+txdPCOVIn0iGOCAMRV7sLt7iXX
	W+xrzw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4642svftfb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 22 Apr 2025 14:16:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5f876bfe0so814856585a.3
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Apr 2025 07:16:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745331369; x=1745936169;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LrRr7YL1sUndM+TTzLFwngoOX8HTf8RthpcfqJ5G5gI=;
        b=dsTK46rphu4EBI6bsHx7kCeSXskwMnqJMKHbzvtGUJ//A+fhu2zVUiqLZOi1JvOC5P
         ryoFq0/xytrGxDMOGkaPrwwvapwqeaiYUrra8kxDTcYFrTuV0aAk6GfKf7SFUqY5qb0O
         U4K9cwBRerjmL0AtG9c8qmGWR1un+yWxLApQd220oAnM4lrDwaIp8MAIdHUVTq5B+fH8
         l8y7dOIS6yhYz/3dECYkdqf8rW/gaeQH5O/V29C4IvsTYuNMye0kcNAKF3zomTUk3gy6
         sXB5/S4nBofoTtQsA7rAyRRTNyYfDNwIZ+YkhYx4/o9pz6H5+EIphmM3XBg3K2jI1yzF
         LRiA==
X-Forwarded-Encrypted: i=1; AJvYcCXp+yMCGuJS5+vioorrZDiFeCTz76HuUMrH01bVgdCkO18EkSs3u1hYP/we5gg4WBCNqyXYS0zEhiDM8WeytQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmLoQpk9DfkMj8E6OxzJ5mvitsJezymhX69nnqDkfA+wXl/2WZ
	MpMIaFIbQsxKRFtAlIciVyfLC5Nl4VAqRnNIgHAmqAuuaEUqB7+oC1R0S42rm2lItWLuaMFOB1s
	883ot1O4ojMvlCC5rlml2TjFn6b9AEDQ76+zYOare6TpnGhCuEJ0Z8Ukl1vr9wZbwKcD5YXY=
X-Gm-Gg: ASbGnctEYKFG7ZXOcf6xKOZDgX5dqRrO5EVsYBqPnYZE3eDQQpExQqQA+PI2td0P4hK
	BBe2yF611wzZ2jFMgHqwDkvaYAiDS8Yi53bBp7oPaC7Li1MDAX++SL3ctZ0+Gh29ZkjrME99lUR
	k2cim6CH6bZVX7+GpbWN2iP8GGoHlXnBBjtF/1AcdxQo4yEiX6/ob6L7CZCO7OBVAJOkJqPQR0O
	Y26tmjdlVUPOQFdZCu0aUEvBYzBwkDumLACWeQm5iVH+5yWC7+G29wvN/nrkk32buQ+NGsEftti
	obpUw8smrlx6Ag6cNmXXICXPnWbrMLbByaeFCmahZxRgTs1yXjduMv2zYG+z2fFQ4oi4TI+ScjR
	83tHjDMKnRm6hOrUmW4AQ6JAKF9yNGj5WPaLT2ugU2FFsz24qCU50JwTD/FA7/VeR
X-Received: by 2002:a05:620a:c47:b0:7c5:e283:7d0a with SMTP id af79cd13be357-7c927fbadb7mr2561269785a.30.1745331368680;
        Tue, 22 Apr 2025 07:16:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDu9Iz7z///DAle0/e2e4SOfXHkkui6Bh/b7f9Hsaifq8Tlj+3UCpT/UhvhwXTsV/jqxc4wQ==
X-Received: by 2002:a05:620a:c47:b0:7c5:e283:7d0a with SMTP id af79cd13be357-7c927fbadb7mr2561262885a.30.1745331368147;
        Tue, 22 Apr 2025 07:16:08 -0700 (PDT)
Received: from ?IPV6:2001:14bb:a2:9556:dcef:1cfc:fd87:3323? (2001-14bb-a2-9556-dcef-1cfc-fd87-3323.rev.dnainternet.fi. [2001:14bb:a2:9556:dcef:1cfc:fd87:3323])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5247c9sm1215361e87.5.2025.04.22.07.16.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 07:16:07 -0700 (PDT)
Message-ID: <14df4b1c-0a43-45e6-83c5-4c450615d901@oss.qualcomm.com>
Date: Tue, 22 Apr 2025 17:16:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 22/23] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, matthias.bgg@gmail.com, ck.hu@mediatek.com,
        jitao.shi@mediatek.com, jie.qiu@mediatek.com, junzhi.zhao@mediatek.com,
        dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
        dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com,
        ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com,
        jason-jh.lin@mediatek.com
References: <20250415104321.51149-1-angelogioacchino.delregno@collabora.com>
 <20250415104321.51149-23-angelogioacchino.delregno@collabora.com>
 <aestmu2rblcrcz77tuqgkimaj4stg24skyp2avdstahwr3aa3i@cfv5ov2qjcf6>
 <7b3713d1-df18-4da1-a1e2-16dcff08fe66@collabora.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <7b3713d1-df18-4da1-a1e2-16dcff08fe66@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ow-gFHGZHYuiXQQwqZgmV-zyien8il04
X-Proofpoint-ORIG-GUID: ow-gFHGZHYuiXQQwqZgmV-zyien8il04
X-Authority-Analysis: v=2.4 cv=QLJoRhLL c=1 sm=1 tr=0 ts=6807a4aa cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=mpaa-ttXAAAA:8 a=QX4gbG5DAAAA:8 a=iyFSFCpoZHukXat7EuUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_07,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504220108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_071610_916457_169D4F71 
X-CRM114-Status: GOOD (  39.66  )
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

On 22/04/2025 16:53, AngeloGioacchino Del Regno wrote:
> Il 21/04/25 21:16, Dmitry Baryshkov ha scritto:
>> On Tue, Apr 15, 2025 at 12:43:20PM +0200, AngeloGioacchino Del Regno 
>> wrote:
>>> Add support for the newer HDMI-TX (Encoder) v2 and DDC v2 IPs
>>> found in MediaTek's MT8195, MT8188 SoC and their variants, and
>>> including support for display modes up to 4k60 and for HDMI
>>> Audio, as per the HDMI 2.0 spec.
>>>
>>> HDCP and CEC functionalities are also supported by this hardware,
>>> but are not included in this commit and that also poses a slight
>>> difference between the V2 and V1 controllers in how they handle
>>> Hotplug Detection (HPD).
>>>
>>> While the v1 controller was using the CEC controller to check
>>> HDMI cable connection and disconnection, in this driver the v2
>>> one does not.
>>>
>>> This is due to the fact that on parts with v2 designs, like the
>>> MT8195 SoC, there is one CEC controller shared between the HDMI
>>> Transmitter (HDMI-TX) and Receiver (HDMI-RX): before eventually
>>> adding support to use the CEC HW to wake up the HDMI controllers
>>> it is necessary to have support for one TX, one RX *and* for both
>>> at the same time.
>>>
>>> Reviewed-by: CK Hu <ck.hu@mediatek.com>
>>> Signed-off-by: AngeloGioacchino Del Regno 
>>> <angelogioacchino.delregno@collabora.com>
>>> ---
>>>   drivers/gpu/drm/mediatek/Kconfig            |    7 +
>>>   drivers/gpu/drm/mediatek/Makefile           |    2 +
>>>   drivers/gpu/drm/mediatek/mtk_hdmi_common.c  |    4 +
>>>   drivers/gpu/drm/mediatek/mtk_hdmi_common.h  |    9 +
>>>   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c  |  385 +++++
>>>   drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h |  263 ++++
>>>   drivers/gpu/drm/mediatek/mtk_hdmi_v2.c      | 1396 +++++++++++++++++++
>>>   7 files changed, 2066 insertions(+)
>>>   create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
>>>   create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h
>>>   create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
>>>
>>> +
>>> +static int mtk_hdmi_v2_setup_audio_infoframe(struct mtk_hdmi *hdmi)
>>> +{
>>> +    struct hdmi_codec_params *params = &hdmi->aud_param.codec_params;
>>> +    struct hdmi_audio_infoframe frame;
>>> +    u8 buffer[14];
>>> +    ssize_t ret;
>>> +
>>> +    memcpy(&frame, &params->cea, sizeof(frame));
>>> +
>>> +    ret = hdmi_audio_infoframe_pack(&frame, buffer, sizeof(buffer));
>>> +    if (ret < 0)
>>> +        return ret;
>>
>> This should really be done via
>> drm_atomic_helper_connector_hdmi_update_audio_infoframe() or
>> drm_atomic_helper_connector_hdmi_clear_audio_infoframe().
>>
>> Ideally this should come from the .hw_params() / .prepare() calls so
>> that you don't need to store the params in the driver data.
>>
> 
> When switching to the new hdmi audio helpers yes, but I was planning to 
> do that
> later.....
> 
>>> +
>>> +    mtk_hdmi_v2_hw_write_audio_infoframe(hdmi, buffer);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static inline void mtk_hdmi_v2_hw_gcp_avmute(struct mtk_hdmi *hdmi, 
>>> bool mute)
>>> +{
>>> +    u32 val;
>>> +
>>> +    regmap_read(hdmi->regs, TOP_CFG01, &val);
>>> +    val &= ~(CP_CLR_MUTE_EN | CP_SET_MUTE_EN);
>>> +
>>> +    if (mute) {
>>> +        val |= CP_SET_MUTE_EN;
>>> +        val &= ~CP_CLR_MUTE_EN;
>>> +    } else {
>>> +        val |= CP_CLR_MUTE_EN;
>>> +        val &= ~CP_SET_MUTE_EN;
>>> +    }
>>> +    regmap_write(hdmi->regs, TOP_CFG01, val);
>>> +
>>> +    regmap_set_bits(hdmi->regs, TOP_INFO_RPT, CP_RPT_EN);
>>> +    regmap_set_bits(hdmi->regs, TOP_INFO_EN, CP_EN | CP_EN_WR);
>>> +}
>>> +
>>> +static void mtk_hdmi_v2_hw_ncts_enable(struct mtk_hdmi *hdmi, bool 
>>> enable)
>>> +{
>>> +    if (enable)
>>> +        regmap_set_bits(hdmi->regs, AIP_CTRL, CTS_SW_SEL);
>>> +    else
>>> +        regmap_clear_bits(hdmi->regs, AIP_CTRL, CTS_SW_SEL);
>>> +}
>>> +
>>> +static void mtk_hdmi_v2_hw_aud_set_channel_status(struct mtk_hdmi 
>>> *hdmi)
>>> +{
>>> +    u8 *ch_status = hdmi->aud_param.codec_params.iec.status;
>>> +
>>> +    /* Only the first 5 to 7 bytes of Channel Status contain useful 
>>> information */
>>> +    regmap_write(hdmi->regs, AIP_I2S_CHST0, 
>>> mtk_hdmi_v2_format_hw_packet(&ch_status[0], 4));
>>> +    regmap_write(hdmi->regs, AIP_I2S_CHST1, 
>>> mtk_hdmi_v2_format_hw_packet(&ch_status[4], 3));
>>> +}
>>> +
>>> +static void mtk_hdmi_v2_hw_aud_set_ncts(struct mtk_hdmi *hdmi,
>>> +                     unsigned int sample_rate,
>>> +                     unsigned int clock)
>>> +{
>>> +    unsigned int n, cts;
>>> +
>>> +    mtk_hdmi_get_ncts(sample_rate, clock, &n, &cts);
>>
>> drm_hdmi_acr_get_n_cts() ?
>>
> 
> I'd have to update both HDMI drivers to use that instead, and I was 
> planning to do
> that at a later time when switching to the HDMI audio helpers.
> 
>>> +
>>> +    regmap_write(hdmi->regs, AIP_N_VAL, n);
>>> +    regmap_write(hdmi->regs, AIP_CTS_SVAL, cts);
>>> +}
>>> +
>>
>> [...]
>>
>>> +
>>> +static int mtk_hdmi_v2_audio_hw_params(struct device *dev, void *data,
>>> +                       struct hdmi_codec_daifmt *daifmt,
>>> +                       struct hdmi_codec_params *params)
>>> +{
>>> +    struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
>>> +
>>> +    if (hdmi->audio_enable) {
>>> +        mtk_hdmi_audio_params(hdmi, daifmt, params);
>>> +        mtk_hdmi_v2_aud_output_config(hdmi, &hdmi->mode);
>>> +    }
>>> +    return 0;
>>> +}
>>> +
>>> +static int mtk_hdmi_v2_audio_startup(struct device *dev, void *data)
>>> +{
>>> +    struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
>>> +
>>> +    mtk_hdmi_v2_hw_aud_enable(hdmi, true);
>>> +    hdmi->audio_enable = true;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void mtk_hdmi_v2_audio_shutdown(struct device *dev, void *data)
>>> +{
>>> +    struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
>>> +
>>> +    hdmi->audio_enable = false;
>>> +    mtk_hdmi_v2_hw_aud_enable(hdmi, false);
>>
>> Most likely you need to stop sending the AUDIO packet too. Or is it dome
>> by the hardware?
>>
> 
> The call to `mtk_hdmi_v2_hw_aud_enable(hdmi, false)` will set HW 
> registers to both
> mute and stop sending the audio packet.
> 
>>> +}
>>> +
>>> +static int mtk_hdmi_v2_audio_mute(struct device *dev, void *data, 
>>> bool enable, int dir)
>>> +{
>>> +    struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
>>> +
>>> +    mtk_hdmi_v2_hw_aud_mute(hdmi, enable);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static const struct hdmi_codec_ops mtk_hdmi_v2_audio_codec_ops = {
>>> +    .hw_params = mtk_hdmi_v2_audio_hw_params,
>>> +    .audio_startup = mtk_hdmi_v2_audio_startup,
>>> +    .audio_shutdown = mtk_hdmi_v2_audio_shutdown,
>>> +    .mute_stream = mtk_hdmi_v2_audio_mute,
>>> +    .get_eld = mtk_hdmi_audio_get_eld,
>>> +    .hook_plugged_cb = mtk_hdmi_v2_audio_hook_plugged_cb,
>>> +};
>>
>> Do you plan to switch to the OP_HDMI_AUDIO? I'd really like to see
>> bridges use the framework instead of implementing everthing on their
>> own.
>>
> 
> I do, but since I've already reached v9, I really don't want to do that 
> right now
> and delay this driver for another two months.
> 
> I plan to do the switch after we at least get this in: as the V1 driver 
> would also
> need the same cleanup, I may even find a way to throw more stuff in the 
> hdmi_common
> when cleaning up both at the same time.


Ack.

-- 
With best wishes
Dmitry

