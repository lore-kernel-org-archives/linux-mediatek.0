Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFFAC4451B
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2026 15:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mU5plK4wOuXslrH5tzmT1LzfM6TA652cX7f9RNduBGg=; b=ks9UQjGAESqcDHQcGOAF6ByB1x
	OvLUnp8BZnAjCZ/batASqUqG/LCR1TZReJC+gsD7LnV6PdxX+aeMDCgcNYHJt+xUok8KPyJ4rfDrY
	v005h7ho7yUtf+HpkaPjkdGUkkBTz9jP4JbyH13+CFcIvxPchn2x3356K4H1O8OTiQHG1bjt+8BmM
	D/wQhwXptO+busTZmt52PJ7MAmVZ4qiiaMkiq4CZdmWNcawfPCv5806Kjk7B+5x2//uAKKC/0ZSNW
	VRzgK8GRWddMAaovBlJ3qFFYOhViN860M/B60qkGn0AGmMA+rkMCLVDEPb5L4iOBmnMTFRcTmY/YK
	VIiWZ9Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkdn-00000002dCi-01yY;
	Fri, 17 Jul 2026 15:38:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkdj-00000002dAz-2l78
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Jul 2026 15:38:17 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE7h6P2093874
	for <linux-mediatek@lists.infradead.org>; Fri, 17 Jul 2026 15:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mU5plK4wOuXslrH5tzmT1Lzf
	M6TA652cX7f9RNduBGg=; b=Ym4T26FGSboWTOc59JBr4POlPj3J+PuT82mbDSwY
	XRzYDLR7OkRMjCjKvvmpRPZUEZNEZMcUJ1TZdM4i/OaecTGpd6cyft7WENJinH3I
	tt+dg/pjeYGey+bAGfsUAHGHYuXb2P2XVE+y2CZlw+s3g6Hy/zxMT+dzsg7x9s5B
	aEFFYNAT2NBk2//h4axm8Mdozm7fS+2wo7KaY/Zvpq078psWnAojwMnMNp90TaNv
	f4rpRtOOsOiOi80JUSgnZflxbXIVULuHMQJnsoJ97l4BNPwX9SwsLB1iLasZBlsI
	jxlOgKg2QlM/2l2jEprhcugzH/8XqpQggUULE2Sxb8hRsA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffbquju6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 17 Jul 2026 15:38:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38d7fcd1f66so11789194a91.2
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Jul 2026 08:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784302694; x=1784907494; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mU5plK4wOuXslrH5tzmT1LzfM6TA652cX7f9RNduBGg=;
        b=GCjq0G4Iw4le9bqTRM8vYai1DcNfJk6rcxPKygqd79FGb653w3yr8LKEij578OrT0f
         zqohDgVOGCK4fX8hRrQS2PLDKAcvGbvrihgVBcfezAdGYqiHKTpilllAK9jF+GReWJqr
         OL/qG+EtNhuMH+RnoJt44z49ecXpX7jym6Z5SLPVlzxIPLGuUQU7mrTc/5FJ/509C/kB
         malfr46y9t3HVQqepNAlITgiitI2WcJO7NnVaofmUYMEHPOnY/gYxQpeNl6+0bWwlhiI
         J8idtqHtJ8LWAsg4nPbXPFslYa6TdjE2GUunH2va5aZPDti1G+iEf8AaC09p8XbTRUYs
         iHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784302694; x=1784907494;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mU5plK4wOuXslrH5tzmT1LzfM6TA652cX7f9RNduBGg=;
        b=Mo0bHbxgAEC6tRpTmeiwVqQe8Q/velpiuDRnewYK6om8oI11JbI4qO+uOPoEJaHDMC
         fQg6UgtmJXekOkkwmGx8RbrKAsR9irpw+2+YNjJM/WZggQNBCiXNzXt7R/YhXz0jdKH7
         RfK/mrV13l77PeCfvPWuUmPo4IlcGyjMvalLDmvCan19BeSrLhKoXUPMPQ+BNZJr+ASE
         f2rOfV+FQnYj6LHOE+Runq3ZvmjIj+5i4GnD4msk0ELtlkydZloB1x+uL3W/Ez1aVQux
         NTMg34h9qjDVtQ047wbNRGIpipZGNXUwjysst/kzEwI8stJSCYHRaSntZgQr9PSyIzxQ
         Fqwg==
X-Forwarded-Encrypted: i=1; AHgh+RplxeO47MSE9dUv8/2cTfucTjvZlIuA38h1lgaSkJ3tKOHAVQu5SQW5Boum/0a3xx3Omm9sNp7Epf56izR9Rw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjrQvWgrnO4g7vLFCTaUru2F+0f+suAfQZOptKWzEcywfKNhGq
	qUa7F3uR6Gq5WzTeMEFsUHUs+OsR6Fy32lxVxQ6Tt5js4TbpfnlhRhF3LjEAJFLhB/UOipIaG0m
	0NHvyE6aSY+SeIYktavf9oSh8Kyh2631K7pR0d9o9utrJJMr+k0OncL1bZ/EpxbpVNEb7BoGEi5
	Q=
X-Gm-Gg: AfdE7ckfza+/ok0cuIVPXUHiNYlNwG/8E4mPWmpCAw9nbDq4uQ/5zzrcR7B96fyIG6K
	Db9PaMzmt15s4Wx25D+3V0KHXxnUDQh1Xlyd+TuQs9db8GNZcGpYtUZnqys5pJp83mK+aW2r2hl
	Y13YmGqN6AaQfrIMuzE+f9R8fzS1nL+Ea+WVz5DAcfYaCzoYOKQxA7lNU9uVrCfHu3S9DiNtpT9
	TmIBKuP9YB2KDBqsv/KZ4xhHo7jpJDgbcvqEv0KACaHn8XaBgpAyIkYJJyxppIFE0GLKybMy6Jz
	lUCezQ04Ptryglps46h+8qTzgtMLfqGlCOuIH1iGg/ULaCKYQGHRkrJcXTrPozoxP+4HDI+hhqg
	8nXdXpN9Hu2+i77reLhWZcmV2bmQ=
X-Received: by 2002:a17:90b:2684:b0:38d:f5bb:e0f4 with SMTP id 98e67ed59e1d1-38e4b3e1473mr3203824a91.1.1784302694251;
        Fri, 17 Jul 2026 08:38:14 -0700 (PDT)
X-Received: by 2002:a17:90b:2684:b0:38d:f5bb:e0f4 with SMTP id 98e67ed59e1d1-38e4b3e1473mr3203716a91.1.1784302693542;
        Fri, 17 Jul 2026 08:38:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1ddeb6sm10087302eec.20.2026.07.17.08.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:38:13 -0700 (PDT)
Date: Fri, 17 Jul 2026 21:07:45 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Paul Cercueil <paul@crapouillou.net>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, Paul Kocialkowski <paulk@sys-base.io>, Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Alexey Brodkin <abrodkin@synopsys.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, Daniel Scally <dan.scally@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Eddie James <eajames@linux.ibm.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, Krzysztof Kozlowski <krzk@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ge Gordon <gordon.ge@bst.ai>, Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Peter Chen <peter.chen@cixtech.com>, Fugang Duan <fugang.duan@cixtech.com>, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, BST Linux Kernel Upstream Group <bst-upstream@bstai.top>, Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Chunyan Zhang <zhang.lyra@gmail.com>, CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org, openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org, kernel@collabora.com, linux-tegra@vger.kernel.org, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-staging@lists.linux.dev, linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, sound-open-firmware@alsa-project.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 01/42] of: reserved_mem: Introduce devres-managed
 initialization functions
Message-ID: <20260717153745.geqmmgm4o3j3vhom@hu-mojha-hyd.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
 <20260703193855.110619-2-mukesh.ojha@oss.qualcomm.com>
 <20260716200048.GA1183026-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716200048.GA1183026-robh@kernel.org>
X-Proofpoint-GUID: _N6UZ0Q0y2JYqSN11kN7fzk1ifdOoneS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE2MCBTYWx0ZWRfX1bPDzlzO0rR1
 nuUNqkmrnax3MnVWxfsjlUYJWCqgDgVwGcnsomYM+bYAk0qAcbGaE+ICXD1ds34Dq3XYulNVQTD
 uK6zW8NYp86joKGZDy3TpLMFx3BrtSKOtEwRblMKoxMF52Jlj9yOiGws2qUTaKDPFfonnMwWxVx
 ggoIENis4dwi5RcWOk6exJGxMPlxc/lbQ43ch7tgvDOWlp0jB/asYlVFAeyXrFEZFnNCabn0rUN
 DUEj6sB6/j+lZAJLwUqT2VEBPahaXziuXmcN1VOVs1TT8mAlkWAMtK8ZCts5trrkMtQl1wEsQGj
 zzgXQu/BWuEnUVKJF6FiQyOXtBZab0b/oRGYVy2BrsqfsPkjjgYpOv7EAI6rW3bDR1eWJ0yn/qh
 nHdTyHHyhcB+wHWMuV5NGoQl6h84+/tG12AELx0vx0RxjMPdlja6lAidyPUtHf8SGqIPzMRSZ37
 uf9ywhWkQ/AV5VSxzBg==
X-Authority-Analysis: v=2.4 cv=NZ3WEWD4 c=1 sm=1 tr=0 ts=6a5a4c67 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=9JV1VVRos5_Q502CX78A:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: _N6UZ0Q0y2JYqSN11kN7fzk1ifdOoneS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE2MCBTYWx0ZWRfX1AdKfOvFjDQV
 Mv/MPR4jzqjwD8k5Eii6eXDoqE91YWFXbGM9L80fop5+1eI4zDNo0pKQAYtzBGrilpaBjkt2cmx
 Axjp38NGxDiyVO8CU4ik++E+Oy0yGuI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_083815_695322_3759A992 
X-CRM114-Status: GOOD (  28.16  )
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

On Thu, Jul 16, 2026 at 03:00:48PM -0500, Rob Herring wrote:
> On Sat, Jul 04, 2026 at 01:08:14AM +0530, Mukesh Ojha wrote:
> > From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > 
> > Introduce devres-based helpers for of_reserved_mem_device_init(_by_idx)
> > to help fight dangling references and ever so slightly reduce the
> > number of boilerplate deinitialization calls.
> > 
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/of/of_reserved_mem.c    | 41 +++++++++++++++++++++++++++++++++
> >  include/linux/of_reserved_mem.h | 25 ++++++++++++++++++++
> >  2 files changed, 66 insertions(+)
> > 
> > diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> > index 82222bd45ac6..b35541e9fbe8 100644
> > --- a/drivers/of/of_reserved_mem.c
> > +++ b/drivers/of/of_reserved_mem.c
> > @@ -787,6 +787,47 @@ void of_reserved_mem_device_release(struct device *dev)
> >  }
> >  EXPORT_SYMBOL_GPL(of_reserved_mem_device_release);
> >  
> > +static void devm_of_reserved_mem_device_release(struct device *dev, void *res)
> > +{
> > +	of_reserved_mem_device_release(*(struct device **)res);
> > +}
> > +
> > +/**
> > + * devm_of_reserved_mem_device_init_by_idx() - Resource managed of_reserved_mem_device_init_by_idx()
> > + * @dev: Pointer to the device to configure
> > + * @np: Pointer to the device node with 'memory-region' property
> > + * @idx: Index of selected region
> > + *
> > + * This is a resource managed version of of_reserved_mem_device_init_by_idx().
> > + * The reserved memory region will be released automatically when the device
> > + * is unbound.
> > + *
> > + * Returns: Negative errno on failure or zero on success.
> > + */
> > +int devm_of_reserved_mem_device_init_by_idx(struct device *dev,
> > +					    struct device_node *np, int idx)
> 
> It looks to me like the only 2? users of this could be converted to 
> devm_of_reserved_mem_device_init() instead. The mmc one obviously can. 
> The imx one depends if np is dev->of_node. I'm not a fan of APIs with 
> only a few users.

You are right, mmc can be but imx can't. I can make this static and drop
the API usage from imx but fix the leak by release function.

-- 
-Mukesh Ojha

