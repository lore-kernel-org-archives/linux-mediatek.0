Return-Path: <SRS0=sTTz=O4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F0BC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 11:32:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7091061411
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 11:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7091061411
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8PhO3Jz7c2WGDWFKYHV10Nrqosue/JrEFsEpOZhopSQ=; b=lM1TmEHhUsVEqi
	7TYyBLzRMQVUbnb+PtfgUFBQ2iHpLh3YsFS7box2RM6HXQt4H4ru6ksJ2XSWjx+1JFMxnmVDaxIWa
	zGJqpCVojkVsYLtCUGvWNjzUwcbKTFT+TaLjHL2/QkV8Do4CX7J7rnDnMwcN3fW6JSKhlfygJRRIa
	Iu1ZCc+vLOLzQAyH2hnqa4TG02vdYZdt4PN9jqZxlO1teASZvrF0C+WK3aFCKeoHIxYtIVJnK/a4W
	QOasu52exlBRU1P1ghahP+XmNogzQUhYPZ+eXO+VpadC9CaTYEDqQFE1/DY3aCcCryj1hXsBAe/2O
	M2iiIUV0XMHRPJm87Hug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYo77-002YFY-B9; Fri, 08 Oct 2021 11:32:33 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYo6t-002YAt-AT; Fri, 08 Oct 2021 11:32:21 +0000
Received: by mail-wr1-x42a.google.com with SMTP id k7so28680576wrd.13;
 Fri, 08 Oct 2021 04:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DXpoD3oDZrKV8QtdRuxL6pqOpnLAebcj0SdO2ln/m4Q=;
 b=JoHG/uBTZMFntcRACH/l+sr2pkbeCEVIUKfEOvxMk1fWVn5q2LHM8DZPmPRFJOd52s
 ZxJjmOKW7/QvhflfrNabweN1S65/lH0zjlKxZc/tygVFjih2yS5wafk843o/KTHTQqxu
 cLmgYxNVKLp0zRTVXcyzCb4xKK2ttp+eSzIAK8ANBjfwTbhK2zqnajKjiYzE/YVdVdj1
 S09HZ567+0FgaGV91WbgLql6DD/pfjWbDUawiWYgNQHCqoWyTXm9VU0UGaTaGSs4Mhpn
 kUzdalLUqugjbrsf26a6oUuO+IF92o2rPDRvJjYCvHKknFCsH5FpRaF4+ujGXsyiOOQK
 oh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DXpoD3oDZrKV8QtdRuxL6pqOpnLAebcj0SdO2ln/m4Q=;
 b=KYhLs/H6J3CxuTzUp5IiJE7IqYfLWOjwdNKJeeHtcvL2tj/RL3PwDF++gG99glV74C
 +mSZ323sZK2jJLLE9XQPIe90yVABc82xqSHUuvAbK0XKZ9+Fq/+jhbF4jzHfRcAFo+4Z
 fUsEYcamn2sVOw6wM4y9a7rH9+ILHqzsU9wIcjNogav/+VxRanLq/IIJ9+TlP9kxWNEd
 PfGDmbmS0SEztBoOAJXYqgxunRS8SKTc8ZcODugz/fu1U/pF6sp/ZBqizc126Q9sZULN
 iVxZb5O7xNQM5eLxmS+SZfu6kklwrB7YAxqbBlS/vHCxfkBiyRgXT3oAdEjqFUgwXxsL
 ahYg==
X-Gm-Message-State: AOAM5301fcq8Eihc8uJFjPZe+coi+6bswZHr6gtLokJNovk220lUJkD+
 6e9D31yosQNJ4QG9jCCBLBU=
X-Google-Smtp-Source: ABdhPJzRugL91kPs3CreYLsjNr8KP8wyVH+RlXWJS54eDst45B5cQSXmo6JVBJbr4/pB/eUoCUmMDg==
X-Received: by 2002:a5d:5889:: with SMTP id n9mr3464217wrf.248.1633692737420; 
 Fri, 08 Oct 2021 04:32:17 -0700 (PDT)
Received: from [192.168.2.177] ([206.204.146.29])
 by smtp.gmail.com with ESMTPSA id o6sm3272001wri.49.2021.10.08.04.32.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 04:32:16 -0700 (PDT)
Message-ID: <9e038baa-9f2e-bc72-e4a7-f184a30ce57a@gmail.com>
Date: Fri, 8 Oct 2021 13:32:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v10, 2/5] drm/mediatek: add component POSTMASK
Content-Language: en-US
To: "yongqiang.niu" <yongqiang.niu@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jassi Brar <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Hsin-Yi Wang <hsinyi@chromium.org>, CK Hu <ck.hu@mediatek.com>
References: <20210930155222.5861-1-yongqiang.niu@mediatek.com>
 <20210930155222.5861-3-yongqiang.niu@mediatek.com>
 <fffdc65c-9c74-3183-f8cf-293134144042@collabora.com>
 <3eff2cfb15677f03d6dcd724fd977ab48fe101aa.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <3eff2cfb15677f03d6dcd724fd977ab48fe101aa.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_043219_419724_1750F85E 
X-CRM114-Status: GOOD (  18.61  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 08/10/2021 04:09, yongqiang.niu wrote:
> On Fri, 2021-10-01 at 13:00 +0200, Dafna Hirschfeld wrote:
>>
>> On 30.09.21 17:52, Yongqiang Niu wrote:
>>> This patch add component POSTMASK.
>>>
>>> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
>>> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>>> Reviewed-by: CK Hu <ck.hu@mediatek.com>
>>> ---
>>>    drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 102 ++++++++++++++-
>>> -----
>>>    drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
>>>    2 files changed, 73 insertions(+), 30 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
>>> b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
>>> index 4a2abcf3e5f9..89170ad825fd 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
>>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
>>> @@ -62,6 +62,12 @@
>>>    #define DITHER_ADD_LSHIFT_G(x)			(((x) & 0x7) <<
>>> 4)
>>>    #define DITHER_ADD_RSHIFT_G(x)			(((x) & 0x7) <<
>>> 0)
>>>    
>>> +#define DISP_POSTMASK_EN			0x0000
>>> +#define POSTMASK_EN					BIT(0)
>>> +#define DISP_POSTMASK_CFG			0x0020
>>> +#define POSTMASK_RELAY_MODE				BIT(0)
>>> +#define DISP_POSTMASK_SIZE			0x0030
>>> +
>>>    struct mtk_ddp_comp_dev {
>>>    	struct clk *clk;
>>>    	void __iomem *regs;
>>> @@ -214,6 +220,32 @@ static void mtk_dither_stop(struct device
>>> *dev)
>>>    	writel_relaxed(0x0, priv->regs + DISP_DITHER_EN);
>>>    }
>>>    
>>> +static void mtk_postmask_config(struct device *dev, unsigned int
>>> w,
>>> +				unsigned int h, unsigned int vrefresh,
>>> +				unsigned int bpc, struct cmdq_pkt
>>> *cmdq_pkt)
>>> +{
>>> +	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
>>> +
>>> +	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv-
>>>> regs,
>>> +		      DISP_POSTMASK_SIZE);
>>> +	mtk_ddp_write(cmdq_pkt, POSTMASK_RELAY_MODE, &priv->cmdq_reg,
>>> +		      priv->regs, DISP_POSTMASK_CFG);
>>> +}
>>> +
>>> +static void mtk_postmask_start(struct device *dev)
>>> +{
>>> +	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
>>> +
>>> +	writel(POSTMASK_EN, priv->regs + DISP_POSTMASK_EN);
>>> +}
>>> +
>>> +static void mtk_postmask_stop(struct device *dev)
>>> +{
>>> +	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
>>> +
>>> +	writel_relaxed(0x0, priv->regs + DISP_POSTMASK_EN);
>>> +}
>>> +
>>>    static const struct mtk_ddp_comp_funcs ddp_aal = {
>>>    	.clk_enable = mtk_aal_clk_enable,
>>>    	.clk_disable = mtk_aal_clk_disable,
>>> @@ -289,6 +321,14 @@ static const struct mtk_ddp_comp_funcs ddp_ovl
>>> = {
>>>    	.bgclr_in_off = mtk_ovl_bgclr_in_off,
>>>    };
>>>    
>>> +static const struct mtk_ddp_comp_funcs ddp_postmask = {
>>> +	.clk_enable = mtk_ddp_clk_enable,
>>> +	.clk_disable = mtk_ddp_clk_disable,
>>> +	.config = mtk_postmask_config,
>>> +	.start = mtk_postmask_start,
>>> +	.stop = mtk_postmask_stop,
>>> +};
>>> +
>>>    static const struct mtk_ddp_comp_funcs ddp_rdma = {
>>>    	.clk_enable = mtk_rdma_clk_enable,
>>>    	.clk_disable = mtk_rdma_clk_disable,
>>> @@ -324,6 +364,7 @@ static const char * const
>>> mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
>>>    	[MTK_DISP_MUTEX] = "mutex",
>>>    	[MTK_DISP_OD] = "od",
>>>    	[MTK_DISP_BLS] = "bls",
>>> +	[MTK_DISP_POSTMASK] = "postmask",
>>>    };
>>>    
>>>    struct mtk_ddp_comp_match {
>>> @@ -333,36 +374,37 @@ struct mtk_ddp_comp_match {
>>>    };
>>>    
>>>    static const struct mtk_ddp_comp_match
>>> mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
>>> -	[DDP_COMPONENT_AAL0]	= { MTK_DISP_AAL,	0, &ddp_aal
>>> },
>>> -	[DDP_COMPONENT_AAL1]	= { MTK_DISP_AAL,	1, &ddp_aal
>>> },
>>> -	[DDP_COMPONENT_BLS]	= { MTK_DISP_BLS,	0, NULL },
>>> -	[DDP_COMPONENT_CCORR]	= { MTK_DISP_CCORR,	0,
>>> &ddp_ccorr },
>>> -	[DDP_COMPONENT_COLOR0]	= { MTK_DISP_COLOR,	0,
>>> &ddp_color },
>>> -	[DDP_COMPONENT_COLOR1]	= { MTK_DISP_COLOR,	1,
>>> &ddp_color },
>>> -	[DDP_COMPONENT_DITHER]	= { MTK_DISP_DITHER,	0,
>>> &ddp_dither },
>>> -	[DDP_COMPONENT_DPI0]	= { MTK_DPI,		0, &ddp_dpi
>>> },
>>> -	[DDP_COMPONENT_DPI1]	= { MTK_DPI,		1, &ddp_dpi
>>> },
>>> -	[DDP_COMPONENT_DSI0]	= { MTK_DSI,		0, &ddp_dsi
>>> },
>>> -	[DDP_COMPONENT_DSI1]	= { MTK_DSI,		1, &ddp_dsi
>>> },
>>> -	[DDP_COMPONENT_DSI2]	= { MTK_DSI,		2, &ddp_dsi
>>> },
>>> -	[DDP_COMPONENT_DSI3]	= { MTK_DSI,		3, &ddp_dsi
>>> },
>>> -	[DDP_COMPONENT_GAMMA]	= { MTK_DISP_GAMMA,	0,
>>> &ddp_gamma },
>>> -	[DDP_COMPONENT_OD0]	= { MTK_DISP_OD,	0, &ddp_od },
>>> -	[DDP_COMPONENT_OD1]	= { MTK_DISP_OD,	1, &ddp_od },
>>> -	[DDP_COMPONENT_OVL0]	= { MTK_DISP_OVL,	0, &ddp_ovl
>>> },
>>> -	[DDP_COMPONENT_OVL1]	= { MTK_DISP_OVL,	1, &ddp_ovl
>>> },
>>> -	[DDP_COMPONENT_OVL_2L0]	= { MTK_DISP_OVL_2L,	0, &ddp_ovl
>>> },
>>> -	[DDP_COMPONENT_OVL_2L1]	= { MTK_DISP_OVL_2L,	1, &ddp_ovl
>>> },
>>> -	[DDP_COMPONENT_OVL_2L2] = { MTK_DISP_OVL_2L,    2, &ddp_ovl },
>>> -	[DDP_COMPONENT_PWM0]	= { MTK_DISP_PWM,	0, NULL },
>>> -	[DDP_COMPONENT_PWM1]	= { MTK_DISP_PWM,	1, NULL },
>>> -	[DDP_COMPONENT_PWM2]	= { MTK_DISP_PWM,	2, NULL },
>>> -	[DDP_COMPONENT_RDMA0]	= { MTK_DISP_RDMA,	0,
>>> &ddp_rdma },
>>> -	[DDP_COMPONENT_RDMA1]	= { MTK_DISP_RDMA,	1,
>>> &ddp_rdma },
>>> -	[DDP_COMPONENT_RDMA2]	= { MTK_DISP_RDMA,	2,
>>> &ddp_rdma },
>>> -	[DDP_COMPONENT_UFOE]	= { MTK_DISP_UFOE,	0,
>>> &ddp_ufoe },
>>> -	[DDP_COMPONENT_WDMA0]	= { MTK_DISP_WDMA,	0, NULL },
>>> -	[DDP_COMPONENT_WDMA1]	= { MTK_DISP_WDMA,	1, NULL },
>>> +	[DDP_COMPONENT_AAL0]		= { MTK_DISP_AAL,	0,
>>> &ddp_aal },
>>> +	[DDP_COMPONENT_AAL1]		= { MTK_DISP_AAL,	1,
>>> &ddp_aal },
>>> +	[DDP_COMPONENT_BLS]		= { MTK_DISP_BLS,	0, NULL },
>>> +	[DDP_COMPONENT_CCORR]		= { MTK_DISP_CCORR,	0,
>>> &ddp_ccorr },
>>> +	[DDP_COMPONENT_COLOR0]		= { MTK_DISP_COLOR,	0,
>>> &ddp_color },
>>> +	[DDP_COMPONENT_COLOR1]		= { MTK_DISP_COLOR,	1,
>>> &ddp_color },
>>> +	[DDP_COMPONENT_DITHER]		= { MTK_DISP_DITHER,	0,
>>> &ddp_dither },
>>> +	[DDP_COMPONENT_DPI0]		= { MTK_DPI,		0,
>>> &ddp_dpi },
>>> +	[DDP_COMPONENT_DPI1]		= { MTK_DPI,		1,
>>> &ddp_dpi },
>>> +	[DDP_COMPONENT_DSI0]		= { MTK_DSI,		0,
>>> &ddp_dsi },
>>> +	[DDP_COMPONENT_DSI1]		= { MTK_DSI,		1,
>>> &ddp_dsi },
>>> +	[DDP_COMPONENT_DSI2]		= { MTK_DSI,		2,
>>> &ddp_dsi },
>>> +	[DDP_COMPONENT_DSI3]		= { MTK_DSI,		3,
>>> &ddp_dsi },
>>> +	[DDP_COMPONENT_GAMMA]		= { MTK_DISP_GAMMA,	0,
>>> &ddp_gamma },
>>> +	[DDP_COMPONENT_OD0]		= { MTK_DISP_OD,	0, &ddp_od
>>> },
>>> +	[DDP_COMPONENT_OD1]		= { MTK_DISP_OD,	1, &ddp_od
>>> },
>>> +	[DDP_COMPONENT_OVL0]		= { MTK_DISP_OVL,	0,
>>> &ddp_ovl },
>>> +	[DDP_COMPONENT_OVL1]		= { MTK_DISP_OVL,	1,
>>> &ddp_ovl },
>>> +	[DDP_COMPONENT_OVL_2L0]		= { MTK_DISP_OVL_2L,	0,
>>> &ddp_ovl },
>>> +	[DDP_COMPONENT_OVL_2L1]		= { MTK_DISP_OVL_2L,	1,
>>> &ddp_ovl },
>>> +	[DDP_COMPONENT_OVL_2L2]		= { MTK_DISP_OVL_2L,    2,
>>> &ddp_ovl },
>>> +	[DDP_COMPONENT_POSTMASK0]	= { MTK_DISP_POSTMASK,	0,
>>> &ddp_postmask },
>>
>> Hi, I can't see where is DDP_COMPONENT_POSTMASK0 defined.
>>
>> Thanks,
>> Dafna
> 
> it is defined in mtk_mmsys.h
> 
> 
> https://patchwork.kernel.org/project/linux-mediatek/patch/20210930155222.5861-3-yongqiang.niu@mediatek.com/
> 

That link is not really usefull. It's part of my maintainer repo:
https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/log/?h=v5.15-next/soc

My fault not having pushed that to linux-next.

Regards,
Matthias

>>
>>> +	[DDP_COMPONENT_PWM0]		= { MTK_DISP_PWM,	0,
>>> NULL },
>>> +	[DDP_COMPONENT_PWM1]		= { MTK_DISP_PWM,	1,
>>> NULL },
>>> +	[DDP_COMPONENT_PWM2]		= { MTK_DISP_PWM,	2,
>>> NULL },
>>> +	[DDP_COMPONENT_RDMA0]		= { MTK_DISP_RDMA,	0,
>>> &ddp_rdma },
>>> +	[DDP_COMPONENT_RDMA1]		= { MTK_DISP_RDMA,	1,
>>> &ddp_rdma },
>>> +	[DDP_COMPONENT_RDMA2]		= { MTK_DISP_RDMA,	2,
>>> &ddp_rdma },
>>> +	[DDP_COMPONENT_UFOE]		= { MTK_DISP_UFOE,	0,
>>> &ddp_ufoe },
>>> +	[DDP_COMPONENT_WDMA0]		= { MTK_DISP_WDMA,	0,
>>> NULL },
>>> +	[DDP_COMPONENT_WDMA1]		= { MTK_DISP_WDMA,	1,
>>> NULL },
>>>    };
>>>    
>>>    static bool mtk_drm_find_comp_in_ddp(struct device *dev,
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
>>> b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
>>> index bb914d976cf5..cd1dec6b4cdf 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
>>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
>>> @@ -30,6 +30,7 @@ enum mtk_ddp_comp_type {
>>>    	MTK_DISP_UFOE,
>>>    	MTK_DSI,
>>>    	MTK_DPI,
>>> +	MTK_DISP_POSTMASK,
>>>    	MTK_DISP_PWM,
>>>    	MTK_DISP_MUTEX,
>>>    	MTK_DISP_OD,
>>>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
