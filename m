Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8EBCCD195
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Sep 2024 10:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TCJasSYKVjow3JC40yzY2SOXT8i1dE0D2/d7NAXdL7g=; b=UduepPCz55s/xlI1jNqwExUl2Y
	B5X3vdLfRm+p6loFXQvx+rRgQ8UJz20z73xMojaaxhUJi1ZrFvj2w4EIMUbOgIbe0VwiLUVCUOpem
	vaW8GQUDLi0FDQwri4bHCSPHkkWXnzYLiLoy+F0kKK2iXS3fln1/uiuuga12dtO/yent+wfnpdpPu
	3T0CQsK6mehYLVTKDp3sC66+e41fE6Vot3YbisbUd1HwBYM/sQr3kuoidKSpchUePWbqvfTkeB5H4
	s8DHxpZfL4M5Bpfb6V3aODFKScaUK/dIX/2riYuQdA8r9iqrZ/ncsPSTSaDZ/F4WK1xfPN1gbaouh
	/t1ul6rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqrjb-000000080DK-0Zdk;
	Wed, 18 Sep 2024 10:16:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqriU-0000000806Y-3EtG;
	Wed, 18 Sep 2024 10:15:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1726654521;
	bh=ngZrcRDlM5CWBR80rje1RK9nTLokmmBXmMbbHkuM5P0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g7h4R+JPJFvG4wo1gZY7K4fOAOoEr3AxH6k0hlsP107hvZuoX1yw40g28rTlRMLAN
	 WrMwDCBsKpC6YBCS6pdHcSDj2039i+wY8tlhox3wumHROkpM2QIFLnJA6F3ubh6ofZ
	 AOX/MIr13YAAHxA0O/LKMCr1HDR3K5wHnVuQcgVWe3exr60QqdcGuTl55e+I9wwg1I
	 VK0e25qb0YzPKbNRZRxXsMKSx/IP2D1pvgCH3l8vW9AaTOIMT0Qdvo77Hkyu0kpY6M
	 fwx9hxH0scgNWr+4weo+1aFK8+DLQ1sk+cdUpeFmy6wPeTKNvZ/90DvMDr31VZXm5y
	 HyJgXpMIkZqpw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B497917E10AE;
	Wed, 18 Sep 2024 12:15:20 +0200 (CEST)
Message-ID: <92a8d48f-e109-461b-bb6a-29da98a444ad@collabora.com>
Date: Wed, 18 Sep 2024 12:15:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/mediatek: ovl: Add fmt_convert function pointer to
 driver data
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Singo Chang
 <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240917164434.17794-1-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240917164434.17794-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_031523_040437_3714249F 
X-CRM114-Status: GOOD (  12.21  )
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

Il 17/09/24 18:44, Jason-JH.Lin ha scritto:
> OVL_CON_CLRFMT_MAN is a configuration for extending color format
> settings of DISP_REG_OVL_CON(n).
> It will change some of the original color format settings.
> 
> Take the settings of (3 << 12) for example.
> - If OVL_CON_CLRFMT_MAN = 0 means OVL_CON_CLRFMT_RGBA8888.
> - If OVL_CON_CLRFMT_MAN = 1 means OVL_CON_CLRFMT_PARGB8888.
> 
> Since OVL_CON_CLRFMT_MAN is not supported on previous SoCs,
> It breaks the OVL color format setting of MT8173.
> 
> Therefore, the fmt_convert function pointer is added to the driver data
> and mtk_ovl_fmt_convert_with_blend is implemented for MT8192 and MT8195
> that support OVL_CON_CLRFMT_MAN, and mtk_ovl_fmt_convert is implemented
> for other SoCs that do not support it to solve the degradation problem.
> 
> Fixes: a3f7f7ef4bfe ("drm/mediatek: Support "Pre-multiplied" blending in OVL")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Tested-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>

Awesome.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



