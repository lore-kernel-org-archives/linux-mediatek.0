Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3E8C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 13:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ayRToWjnATMUiSSHuLBfauHzv3VzguRBjQyXJ5ZLY/4=; b=AhAgo5VbNOzZBQ
	kAhLbHD98FaT9YdLD+v/3okldMfALPIIQsxTIpri/xJBwP6vg2Am+q9t+k036TeYuNb3KjZ6VhDLi
	xAfFhJVuz2hf2lHLmIp6zVSNi8Gf6OfX3/mUO1SJ5Vhk/kr91yLxf47mY8rN9LTWWaMvjynleSBAR
	EIhJWYW3r5PDX6a8cvNoxlO3+FJ4f9y5JhJdJZr1KIPJpf3RF1HKXEOL7fMnGVx6BCs/Qw6OVFtCv
	aOIhNqS3jynizTHJfxk/2nuMfgShe+hVPW3i+wamIiUInUwT0+Vl3x264xePYeiaa6PTTzylxhrAZ
	KkBq6xr3iHY5B7zpy/cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD2nG-00BngE-33;
	Tue, 12 Dec 2023 13:27:27 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD2nC-00Bnbl-01;
	Tue, 12 Dec 2023 13:27:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702387638;
	bh=bORQa449volAyT+EMZHJvP/KuwY9i8DhbUIZ63euxMM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jzPgk9VpkKV0fyriB7dHtcuDiQiXIp7w4XYDgCGGGdxIGa7V17zVpEAa4vvK8LokN
	 Y9T/mwQTVlchSTjlJfz7UOd/WS3ssJXCBtdb/f1L3UdXittnqS8CkK46Eyz3j41CUu
	 O91taj9MdqhHul2r9rH5mM+QFkIRuQKINyKbAEbMU0+GcRGZSKOUgxk8M0cYr1ywfF
	 T2oy8yfo3K/fqI2UlVo8WfoX+ZFteWofeBFAvnCvnLB8lrzUUa2SY/M6IiFWex+80F
	 xQri1CebiCNRwW0FqRYBDujV4oT4BmHcmNaJ6CwBnfr2c1CURfiUDJkyTI4h8uevTA
	 tRMMaqDCZnEBQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4CD513781461;
	Tue, 12 Dec 2023 13:27:17 +0000 (UTC)
Message-ID: <315011be-59c6-42b1-be9b-cd2eaf6debd9@collabora.com>
Date: Tue, 12 Dec 2023 14:27:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/17] drm/mediatek: Turn off the layers with zero
 width or height
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, CK Hu <ck.hu@mediatek.com>
References: <20231212121957.19231-1-shawn.sung@mediatek.com>
 <20231212121957.19231-12-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231212121957.19231-12-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_052722_306321_9578B6F5 
X-CRM114-Status: GOOD (  16.72  )
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
Cc: devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Bibby Hsieh <bibby.hsieh@mediatek.com>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 12/12/23 13:19, Hsiao Chien Sung ha scritto:
> We found that IGT (Intel GPU Tool) will try to commit layers with
> zero width or height and lead to undefined behaviors in hardware.
> Disable the layers in such situations.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

This commit needs a Fixes tag. Please add the relevant one.

Thanks,
Angelo

> ---
>   drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 2 +-
>   drivers/gpu/drm/mediatek/mtk_ethdr.c            | 7 ++++++-
>   2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> index 10d23e76acaa..8789442c039f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> @@ -156,7 +156,7 @@ void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
>   	merge = ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MERGE0 + idx];
>   	ethdr = ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0];
>   
> -	if (!pending->enable) {
> +	if (!pending->enable || !pending->width || !pending->height) {
>   		mtk_merge_stop_cmdq(merge, cmdq_pkt);
>   		mtk_mdp_rdma_stop(rdma_l, cmdq_pkt);
>   		mtk_mdp_rdma_stop(rdma_r, cmdq_pkt);
> diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
> index 73c9e3da56a7..e95331c06815 100644
> --- a/drivers/gpu/drm/mediatek/mtk_ethdr.c
> +++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
> @@ -163,7 +163,12 @@ void mtk_ethdr_layer_config(struct device *dev, unsigned int idx,
>   	if (idx >= 4)
>   		return;
>   
> -	if (!pending->enable) {
> +	if (!pending->enable || !pending->width || !pending->height) {
> +		/*
> +		 * instead of disabling layer with MIX_SRC_CON directly
> +		 * set the size to 0 to avoid screen shift due to mixer
> +		 * mode switch (hardware behavior)
> +		 */
>   		mtk_ddp_write(cmdq_pkt, 0, &mixer->cmdq_base, mixer->regs, MIX_L_SRC_SIZE(idx));
>   		return;
>   	}


