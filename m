Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1BCCD3442
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2026 09:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n2r+8tONPidRwC+bDiqTgIec2G+NFWKd4YQ4XHysQOU=; b=rKJTnFrZplbwEm7l9ndY++B2r7
	FDk7VImKcC7i/m5Oh6iP4d9GohNKW9H6hh97aWkKiSl24p7iGQqSJQZ9e/Onz/xcjj3mWVyhR7830
	CUvhykRb7s9nmJy9aqGzinNvq560T2WA/I0OEOSq5WcnkDXG0EuBKJ4xQQ4sKHb21D7fdaQrS9H0G
	eIRn5PUgQKyl8qPvveNPS+j7g3ZTn4UoMU3bCjzGKZO142JOYn12bLstQihC2sP3CfE69BTP43ujI
	IQY4AnIycx0gPRoNfmQZoXfJclTXNt3Yp0+D54SLOA3GVw5NlUCoI7FRugIDf/PY9toC/Ih6Rh/B6
	t9+s8oKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKvOo-00000003P6h-3eFK;
	Thu, 07 May 2026 09:52:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKvOl-00000003P5Q-0IOg
	for linux-mediatek@lists.infradead.org;
	Thu, 07 May 2026 09:52:05 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475MRva3157859
	for <linux-mediatek@lists.infradead.org>; Thu, 7 May 2026 09:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n2r+8tONPidRwC+bDiqTgIec
	2G+NFWKd4YQ4XHysQOU=; b=hk7CjrAbJWAFwoncPo8nXNSnkdWhlPzugC0Vuvbz
	oIs0tE86AQcPzXfDNbxNpJJC2h6m8Kzu3bYkDemd7XS6rc9QehjtbuV9ZL/FxZhz
	V+9VdE0I6Z812O4YAeCm1QCkhhgvRXznAYBODvtx/HrBInLvd9ON/OlZBCRKmYo7
	l/S6DiNpwzeIpQg7lnGhTiRTO6IgvYJII+56JS59usJiElGT3k/oskeLJ0/Tdman
	IZQ+h9pvhK2OYgmUrQjH/DSz4DzKha+cWGlUNod8b7bB3Jfb27siJT2aHK6A84mh
	hdrgVyyxuyMM3C92Ib81826vOMOkMOIUlSep3lVWR5Dqog==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhf10uc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 07 May 2026 09:52:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8ebe2c596c6so122286185a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 07 May 2026 02:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778147521; x=1778752321; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n2r+8tONPidRwC+bDiqTgIec2G+NFWKd4YQ4XHysQOU=;
        b=XvsHLTa9D4ctJraFPhoXcot5XyYA1GXSb/N070dk4IU+RsAsmhtiLA4+nDhLVkMdaJ
         rgaPcqfSFNMTV6OGr1Jzu1WG7RO32nAnNH0k9FY4O231kNJOGeusTYGxq9VxUPBKNbui
         6RnBe6u6TmwGmMm00JcMjpuC9q1rctDWSUyRVCmuCfq1XU6zfcu1NkgQXT5yeENn8/nA
         iHr3LaxKfyMCEVk/pi8Wmm/j3rLtjbAc8yOqjuLlLbGVdGtTvHmtlPc3VVzlYdGn6Gm7
         M0vq7vDKBuSIhxXygv0mu5Y4tO07bdOos/vj2KHIJIfttxZmE3wUrgKD+NexdkggxTJB
         sMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778147521; x=1778752321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2r+8tONPidRwC+bDiqTgIec2G+NFWKd4YQ4XHysQOU=;
        b=KtpD7aSed21hpZqSUFM6X8lHhHHsS33wGKrHnLAMx28MUKCaW5u70KZdCsSAuz7ucR
         yKqSQR3b1UXkPffIHB6beCDPoaPRaOFiuovrstO7cO9z4Zx3h2Tc2JBMHBy3Nx7NK5vc
         DE1OJaiLqW2py5wGFEGs+/KXlOYGNEHljMlxOAoWM3+H07LxvL3DSRzKn6IITUT2Rp6p
         VUv3Tq/KsmkKwAPbLFgd6HGLsi8qOp22Rl1xUPFCEi1fDQGfVeK6BAciYUjjTmW6ADeO
         05JonNYL36sQ8duc25rd4wMlenjB/0Po9Iugi3UdWMt3IKqZTNI+gHfA/fIcBbBEBx0s
         53sw==
X-Forwarded-Encrypted: i=1; AFNElJ+KuJhN7ZrxN1XTRkJ5JNdvziiX8tFiYEOFXETvgD4sZQQOpxxGqdr9CMfJeCmzglNigMQDYZLtxbJ6R3NlHg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+HcpJrNQ6rErbCOMqvz7umC/b3V4OAOEPySPBZpW7v8pFaAqK
	IcFJFuKujM0LWMoBS7Igqv8vacPBXVe/tVfAjrJYVmhLIdGPDv8MvUSQ5X2YIvJEcnUaGQey3oa
	1dbgjHYR4kwkKzgW+6pmyz20hGSS/Fo88gR+SOBwjbyKYdRAIObZanXU2H83vQxJHsuyr2UFwYu
	M=
X-Gm-Gg: AeBDiesqfCDgj+a4igKuCp5IiTP9V/Mi+OaMIrCeeFmCQec+f5cFJsuVs8PQ5wYxHcS
	BOroWN+YhHMF9SFM/gpvXOOfixeiajQfrE1TIcG0bER+06dQQve2TP+v/bwzjznA70nD5ohzkNg
	qbx1oohdzwGxBYMWUxXPXQ41Xvi5FdnYL7Klfe+k9UTyTrESRjWkZVDDfqTp0VkQXyuGjbhpJAU
	k4MJ3JHuc5ks7EwAZPMZbgD9n88raM7extAHIIhpn/7Am3fO/GCDih1wfbgIyi7a+KXk2jPTem9
	tbI7Y17S8Uk7nA9MsPCOPMwAAszmyz5lnEydFRuwt5CGQ1w/eTl8i6VK9pwuNveByaTXnV5l7TT
	YzkvKr73mKdohn3vu+ooAzjZz1IArcLYnRhMvTGdwaaJj/88/r8o1YGtn24xhToXhw30zwpzTSG
	mxbjGH+c6pLuitkYOc4V1Eu7aLDt7DqrWOnzW25W6zZbeRLw==
X-Received: by 2002:a05:620a:1a20:b0:8fc:5e81:28eb with SMTP id af79cd13be357-904d65e1e89mr1081203285a.42.1778147520961;
        Thu, 07 May 2026 02:52:00 -0700 (PDT)
X-Received: by 2002:a05:620a:1a20:b0:8fc:5e81:28eb with SMTP id af79cd13be357-904d65e1e89mr1081198385a.42.1778147520392;
        Thu, 07 May 2026 02:52:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c33c8a3sm5505238e87.54.2026.05.07.02.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 02:51:58 -0700 (PDT)
Date: Thu, 7 May 2026 12:51:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Junzhi Zhao <junzhi.zhao@mediatek.com>, Jie Qiu <jie.qiu@mediatek.com>,
        dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] drm/mediatek: hdmi: report jack plugged state from
 bridge enable/disable
Message-ID: <lhxivpwo6aq3ehgzsnkgxnqis5tptmey4dtbhaokyckkl7ghbn@dzaj225pnpk3>
References: <a3e22cbae528c9a38d854a586d1736b860998d41.1776265222.git.daniel@makrotopia.org>
 <c4d62fc2244fb72207855c5a366ff10fad419f2d.1776265222.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4d62fc2244fb72207855c5a366ff10fad419f2d.1776265222.git.daniel@makrotopia.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA5OCBTYWx0ZWRfX3FMdk8fn7tl7
 bSmK8+WKzkcH/gawnnhbth7hN93mikQ1fpcQvbJFBtgSmlVcjiWClyTe5aZc8ZVM7Ph1QHPBPSJ
 7il8+zJ8I8I15Ayyq6VBgsTxwwguPqAggthBKA8S3WBqbiczaIDRPj12wAeT60Q9zPIV8Rpo6O1
 px/uNDV6qtKUw4rtlfZhougGvPo/9FqiD9BvqdcUEYZTmSEOQ1iNY6/adrQGKjCvt92at1MSSqQ
 JFKabUShmc/04JuKapg/wc3Bk/2VDHpYAViAAhOWMMjmgb14oH/dUjUi9okTh6GcLiwqLV9v8Wx
 L/vzqOtuY1FxFpYr9VUMJZzfyQP0xI2GeVFMuZMCpMpYVaQBpZJhWUT9kj/sJo8MgHrCpAG1nNW
 LElrwa9nEt+4IjUL83iycoHndy82XSDgIXMKxqX/mV+EnCjBXWqdRl1tjblXrT/Rhu7ddNHCh1U
 Uq1OIBpXErS5PVcfxzg==
X-Proofpoint-ORIG-GUID: ZysWsRtHQUewWodOFHpHKyGb689E-eWO
X-Authority-Analysis: v=2.4 cv=SuagLvO0 c=1 sm=1 tr=0 ts=69fc60c1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=VT4XjZGOAAAA:8 a=_OD9tO1ZYgXKlZaMhT4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-GUID: ZysWsRtHQUewWodOFHpHKyGb689E-eWO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_025203_226616_005ABE89 
X-CRM114-Status: GOOD (  23.85  )
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

On Wed, Apr 15, 2026 at 04:04:16PM +0100, Daniel Golle wrote:
> Notify hdmi-codec of the current sink plugged state from
> mtk_hdmi_bridge_atomic_enable() and mtk_hdmi_bridge_atomic_disable()
> via mtk_hdmi_update_plugged_status(). This matches the pattern used
> by dw-hdmi, which invokes handle_plugged_change() from the bridge
> enable and disable paths so that ASoC jack state stays in sync with
> the actual sink presence across atomic commit cycles, and not only
> on CEC HPD transitions.
> 
> Userspace audio daemons (e.g. pipewire) rely on the jack state to
> route streams, restore per-sink volume levels, and recover the last
> used device after a reconnect. Without this, those transitions are
> missed whenever the sink change is driven by a mode set rather than
> by a bare HPD event.

I can only hope to see mtk_hdmi to migrate to DRM_BRIDGE_OP_HDMI and
DRM_BRIDGE_OP_HDMI_AUDIO...

I think the correct timing was discussed several times and the overall
conclusion was that the correct time is when the actual HDMI cable is
being plugged / unplugged. See the discussion around [1] and the
captured response of Mark Brown.

[1] https://lore.kernel.org/dri-devel/cwxmu5a37qaqerpaolohxw57nzerkvlumx4dsqwmqwx5t7xhxo@kq6j63hfydra/

> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index 9050d7785f109..565bb72c9b63a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1013,6 +1013,8 @@ static void mtk_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
>  	hdmi->curr_conn = NULL;
>  
>  	hdmi->enabled = false;
> +
> +	mtk_hdmi_update_plugged_status(hdmi);
>  }
>  
>  static void mtk_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
> @@ -1082,6 +1084,8 @@ static void mtk_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
>  	mtk_hdmi_clk_enable_audio(hdmi);
>  
>  	hdmi->enabled = true;
> +
> +	mtk_hdmi_update_plugged_status(hdmi);
>  }
>  
>  static const struct drm_bridge_funcs mtk_hdmi_bridge_funcs = {
> -- 
> 2.53.0

-- 
With best wishes
Dmitry

