Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F418C369D3
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Apr 2025 19:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=utVDdpxrgjnfN0h4lobydcS8PzzalhnEHxW9nCf1r/E=; b=YTDPhSH+Dek7SGc+Fvt5fedWcR
	mzPuAxDG6aO/wI4pT1ZdkpI+PB56QPnB04p3ZSkCKiavlBFp/Belif5IYH/zVmuS88JAwmlE7Yc7Q
	AY7XLttUBrZOdX4Qosl3jCto9bi0ZgRU2rkC4RngqehhEz6sJom7xM2KNsnaNTInDKCSS2bObX9dD
	1lHxgxQx4o2SRKsrco+Xh1U9BVJ5gsXWPRrzZdt+LMpPJIJIACa0KeSD4P1DiytBod4qFYZcn0Cyl
	uPofDbz8+t526+I3LKRQGPZBaStCxvubisCwETeWOkMNyReN513QS3Jj/TDu+VOtTmyjqdow2ffKt
	h6Ksa2Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6wfF-000000050zO-45lU;
	Mon, 21 Apr 2025 19:18:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6wdM-000000050i5-3129
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Apr 2025 19:16:50 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LIgAX7013828
	for <linux-mediatek@lists.infradead.org>; Mon, 21 Apr 2025 19:16:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=utVDdpxrgjnfN0h4lobydcS8
	PzzalhnEHxW9nCf1r/E=; b=MY6S0EQskGWy8rz4Cee7XeMpzfOvMJ93mAyoiOC1
	WquXJufkxDsZ7wa6jAPKbLyvquclJ2I33dS4ZoMvAQE+47H1EB+OBp2s/ZvRKWRD
	VTogoGE9ZOLR8NVTZFOD64meJPRApGvUwhU0S6J05yTzRVmggxafSMA5JQhZBXnM
	gFU/Poi00CG0bNrRtNV/mulpZJSdpKQhZn/Qdl+63ore+tOnYW+O+b3pd1RtM+ZV
	eS5d/vYgtrnBpMjrUxD56y7uCbZiJq80CK+3Z3i0zakN8Touqbur09T0Worq5oJa
	4VSq2zvd4D1Oj/5GhIOK1rY3jmmIpaXuxLwkX3Ps0xoGTg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4643wwn5gg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 21 Apr 2025 19:16:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5d9d8890fso947894985a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Apr 2025 12:16:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745263007; x=1745867807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utVDdpxrgjnfN0h4lobydcS8PzzalhnEHxW9nCf1r/E=;
        b=EdFyn1hHBsEqbLpdflGP5xc23vqFjw567YT3AnbFEF2BGwUDf70Q9Uc60S5paSxZpc
         //K5ko6fpSqxsBR0UrM3DDbBmAKJQQmuK+Gn/hqhCu10Yy7UJQIsyK9qh1jAI1qTnkjm
         KJrOHTX4FYHDxS48yNCe2q05zOXSiP9EKFVQh0EluDPjGkll+7VnPMv2rSPK+MxY7tlr
         OCI5KV/QKzvIl7Po1RiRrQl4IDoAKNOD4NG5s6n+6gJKhBSZkX6OzQFtEpb5bt2cJwP4
         Y2R2kdUOLBpmTxis7XkeXOjLERk9Z5p23+mKLxx8LZ/vkjXAfVrCPHXr1zHNjTrtb3xQ
         bHpQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1yls1R+Rnwwl1o+iZ3M2yuPYLg3TLWKrqA2tR4eEacTEvNqy7j8MV6ICPu1yGWDsu9qwTuAEK7UPN/QQsuw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwzJYgfqLS/QkSa3d6kEfDDocZw8ZTRenvjDDUc/DHyNuZj6gZJ
	FTYC2O/uAvkDsSG5OXRh8G8cKnfqhEVRRVpmL8Z3CMsZDzqtxhX0PAz2+xbDH6bgTRtbw844DEt
	3pTZ8CdlCJat4B9oQ+Y9cutz0yHuCjgxbi1TSQq88mGgiYhrhlZ2qEC/EtyCaOW5Ij0e53RM=
X-Gm-Gg: ASbGncsstNxxXUcBwqix96ZYy0QHfiWOlvjiwcK7JBazW2NaoEbyPPNKplRPFT06D/P
	zvP1by8yyB8KP5Yf+cdDI/QiIeArmbdcFpk64Dic7RNgQmegiTCyp2t0ptSIYX6Kpsq9pocWaHl
	Zn3nVm6RdSMGppNbiZb5jOHvGt3ChJm8bzCMUK9PFArt0UOj6Q4CyQ/F4gNOl+sP0JZvZNG861L
	BkkAiHCnZ7IiZWZZ/dbkrWVN5+uvkp2q7ZN9QyjkeWG8+q51fUpX6no3gZLdm3rmyHHlOc9klfx
	670YD5ALAWrOcKoz8Yuanqc1fHUx2NAZJ1AYOKjZhPADcpVUP0FZlLAWjqGI2pVDCyzTkwu4xjE
	=
X-Received: by 2002:a05:620a:3707:b0:7c9:142d:3c66 with SMTP id af79cd13be357-7c92565eeb9mr2626998985a.0.1745263006765;
        Mon, 21 Apr 2025 12:16:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwsaWGw4uh2u7lX7Z9kxeE1gU+aUICLwSlmuNpDpcbTieu7XF0j4yvIIDpkValfcGqijWYKA==
X-Received: by 2002:a05:620a:3707:b0:7c9:142d:3c66 with SMTP id af79cd13be357-7c92565eeb9mr2626993785a.0.1745263006368;
        Mon, 21 Apr 2025 12:16:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5242a2sm1005685e87.2.2025.04.21.12.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 12:16:45 -0700 (PDT)
Date: Mon, 21 Apr 2025 22:16:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Subject: Re: [PATCH v9 22/23] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
Message-ID: <aestmu2rblcrcz77tuqgkimaj4stg24skyp2avdstahwr3aa3i@cfv5ov2qjcf6>
References: <20250415104321.51149-1-angelogioacchino.delregno@collabora.com>
 <20250415104321.51149-23-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415104321.51149-23-angelogioacchino.delregno@collabora.com>
X-Authority-Analysis: v=2.4 cv=IpEecK/g c=1 sm=1 tr=0 ts=6806999f cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=mpaa-ttXAAAA:8 a=QX4gbG5DAAAA:8 a=VUQ5xn941hO9jOC13tcA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: ve2ngHVfsieq3pYBCaSSK7rFuXz9KrgM
X-Proofpoint-ORIG-GUID: ve2ngHVfsieq3pYBCaSSK7rFuXz9KrgM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_09,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=804
 impostorscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504210150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_121648_879280_6432958E 
X-CRM114-Status: GOOD (  35.05  )
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

On Tue, Apr 15, 2025 at 12:43:20PM +0200, AngeloGioacchino Del Regno wrote:
> Add support for the newer HDMI-TX (Encoder) v2 and DDC v2 IPs
> found in MediaTek's MT8195, MT8188 SoC and their variants, and
> including support for display modes up to 4k60 and for HDMI
> Audio, as per the HDMI 2.0 spec.
> 
> HDCP and CEC functionalities are also supported by this hardware,
> but are not included in this commit and that also poses a slight
> difference between the V2 and V1 controllers in how they handle
> Hotplug Detection (HPD).
> 
> While the v1 controller was using the CEC controller to check
> HDMI cable connection and disconnection, in this driver the v2
> one does not.
> 
> This is due to the fact that on parts with v2 designs, like the
> MT8195 SoC, there is one CEC controller shared between the HDMI
> Transmitter (HDMI-TX) and Receiver (HDMI-RX): before eventually
> adding support to use the CEC HW to wake up the HDMI controllers
> it is necessary to have support for one TX, one RX *and* for both
> at the same time.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/Kconfig            |    7 +
>  drivers/gpu/drm/mediatek/Makefile           |    2 +
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.c  |    4 +
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.h  |    9 +
>  drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c  |  385 +++++
>  drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h |  263 ++++
>  drivers/gpu/drm/mediatek/mtk_hdmi_v2.c      | 1396 +++++++++++++++++++
>  7 files changed, 2066 insertions(+)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
> 
> +
> +static int mtk_hdmi_v2_setup_audio_infoframe(struct mtk_hdmi *hdmi)
> +{
> +	struct hdmi_codec_params *params = &hdmi->aud_param.codec_params;
> +	struct hdmi_audio_infoframe frame;
> +	u8 buffer[14];
> +	ssize_t ret;
> +
> +	memcpy(&frame, &params->cea, sizeof(frame));
> +
> +	ret = hdmi_audio_infoframe_pack(&frame, buffer, sizeof(buffer));
> +	if (ret < 0)
> +		return ret;

This should really be done via
drm_atomic_helper_connector_hdmi_update_audio_infoframe() or
drm_atomic_helper_connector_hdmi_clear_audio_infoframe().

Ideally this should come from the .hw_params() / .prepare() calls so
that you don't need to store the params in the driver data.

> +
> +	mtk_hdmi_v2_hw_write_audio_infoframe(hdmi, buffer);
> +
> +	return 0;
> +}
> +
> +static inline void mtk_hdmi_v2_hw_gcp_avmute(struct mtk_hdmi *hdmi, bool mute)
> +{
> +	u32 val;
> +
> +	regmap_read(hdmi->regs, TOP_CFG01, &val);
> +	val &= ~(CP_CLR_MUTE_EN | CP_SET_MUTE_EN);
> +
> +	if (mute) {
> +		val |= CP_SET_MUTE_EN;
> +		val &= ~CP_CLR_MUTE_EN;
> +	} else {
> +		val |= CP_CLR_MUTE_EN;
> +		val &= ~CP_SET_MUTE_EN;
> +	}
> +	regmap_write(hdmi->regs, TOP_CFG01, val);
> +
> +	regmap_set_bits(hdmi->regs, TOP_INFO_RPT, CP_RPT_EN);
> +	regmap_set_bits(hdmi->regs, TOP_INFO_EN, CP_EN | CP_EN_WR);
> +}
> +
> +static void mtk_hdmi_v2_hw_ncts_enable(struct mtk_hdmi *hdmi, bool enable)
> +{
> +	if (enable)
> +		regmap_set_bits(hdmi->regs, AIP_CTRL, CTS_SW_SEL);
> +	else
> +		regmap_clear_bits(hdmi->regs, AIP_CTRL, CTS_SW_SEL);
> +}
> +
> +static void mtk_hdmi_v2_hw_aud_set_channel_status(struct mtk_hdmi *hdmi)
> +{
> +	u8 *ch_status = hdmi->aud_param.codec_params.iec.status;
> +
> +	/* Only the first 5 to 7 bytes of Channel Status contain useful information */
> +	regmap_write(hdmi->regs, AIP_I2S_CHST0, mtk_hdmi_v2_format_hw_packet(&ch_status[0], 4));
> +	regmap_write(hdmi->regs, AIP_I2S_CHST1, mtk_hdmi_v2_format_hw_packet(&ch_status[4], 3));
> +}
> +
> +static void mtk_hdmi_v2_hw_aud_set_ncts(struct mtk_hdmi *hdmi,
> +				     unsigned int sample_rate,
> +				     unsigned int clock)
> +{
> +	unsigned int n, cts;
> +
> +	mtk_hdmi_get_ncts(sample_rate, clock, &n, &cts);

drm_hdmi_acr_get_n_cts() ?

> +
> +	regmap_write(hdmi->regs, AIP_N_VAL, n);
> +	regmap_write(hdmi->regs, AIP_CTS_SVAL, cts);
> +}
> +

[...]

> +
> +static int mtk_hdmi_v2_audio_hw_params(struct device *dev, void *data,
> +				       struct hdmi_codec_daifmt *daifmt,
> +				       struct hdmi_codec_params *params)
> +{
> +	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
> +
> +	if (hdmi->audio_enable) {
> +		mtk_hdmi_audio_params(hdmi, daifmt, params);
> +		mtk_hdmi_v2_aud_output_config(hdmi, &hdmi->mode);
> +	}
> +	return 0;
> +}
> +
> +static int mtk_hdmi_v2_audio_startup(struct device *dev, void *data)
> +{
> +	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
> +
> +	mtk_hdmi_v2_hw_aud_enable(hdmi, true);
> +	hdmi->audio_enable = true;
> +
> +	return 0;
> +}
> +
> +static void mtk_hdmi_v2_audio_shutdown(struct device *dev, void *data)
> +{
> +	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
> +
> +	hdmi->audio_enable = false;
> +	mtk_hdmi_v2_hw_aud_enable(hdmi, false);

Most likely you need to stop sending the AUDIO packet too. Or is it dome
by the hardware?

> +}
> +
> +static int mtk_hdmi_v2_audio_mute(struct device *dev, void *data, bool enable, int dir)
> +{
> +	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
> +
> +	mtk_hdmi_v2_hw_aud_mute(hdmi, enable);
> +
> +	return 0;
> +}
> +
> +static const struct hdmi_codec_ops mtk_hdmi_v2_audio_codec_ops = {
> +	.hw_params = mtk_hdmi_v2_audio_hw_params,
> +	.audio_startup = mtk_hdmi_v2_audio_startup,
> +	.audio_shutdown = mtk_hdmi_v2_audio_shutdown,
> +	.mute_stream = mtk_hdmi_v2_audio_mute,
> +	.get_eld = mtk_hdmi_audio_get_eld,
> +	.hook_plugged_cb = mtk_hdmi_v2_audio_hook_plugged_cb,
> +};

Do you plan to switch to the OP_HDMI_AUDIO? I'd really like to see
bridges use the framework instead of implementing everthing on their
own.

> +
> +static __maybe_unused int mtk_hdmi_v2_suspend(struct device *dev)
> +{
> +	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
> +
> +	mtk_hdmi_v2_disable(hdmi);
> +
> +	return 0;
> +}
> +

-- 
With best wishes
Dmitry

