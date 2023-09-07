Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE26EB8FDE
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Sep 2023 12:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x3yyEVpkwS7CpkgyE2G6p4dJCdDksd46OIvz/DfKVns=; b=BPNU7GzPLEPd1wS4dK017BrHpH
	pVlvWthd/t66BQ6B/9y5OHieaCcxQTWiY3tIGMYpX6SoJHNwIOU7PDN3vQ9EtZeR0+vtkZRDfsc09
	MOlcw3bUOjPoc9+R0cy4V0SMZ32JRXJV2vwV4PYz43zudhYrUM6lK3EAMIpF/8WxZ3vGnUSolxUrl
	4oxURghR9QDqUPHD2z//nzJRHsebvam8Ydo93iU/+54+12WNnq+bRieX8x+U+zVeNfc9r3700RgNM
	MJzNTZwBQDYig1C+bCDauDgL95EOSaPg1Y2ptWPLJNjbCehkqf3e+vSRmmPDg6KlGknfIjZB4YQq7
	cwDCCRMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeDzc-00C4kZ-1Q;
	Thu, 07 Sep 2023 12:20:16 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeDzZ-00C4jw-32;
	Thu, 07 Sep 2023 12:20:15 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F2C7E660730A;
	Thu,  7 Sep 2023 13:20:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694089212;
	bh=9nFIF3CS/uUveFelu84S9tXR3ZFKHURU3blJxWp35Mo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UcLWjEw45AJI43p/8EiHne0nwzX8pZ1kfZ7Fnh+yFsoJIZyMIYfxyVHtQL1eBE+kG
	 B2gxgGgCslcNKATRDaS6vqN9tnQtaaGb1Wh0YXK1UO5AZsA00fSLaZ8bDJin96mdQI
	 BtxXNg6zI7FE0krVRLK6KplRXApp/BR9zJrPc9eBOxzrDBa2E4B5reuv8wdQ8gDKr2
	 JzFE2UrJniQ197okp/0hJnn/oLF0M6bPBVm8e0BeSAtiLWIookpC30wKBAMn+HhJBz
	 iuaczJ0GqSu5mgqtjUe1/nDNEItuuojLQYkWQHQv4JtscdJ95eH8DVEbPnJ4+toY0w
	 f5Hgpf15LcBaQ==
Message-ID: <304cf77f-b239-6ed7-2f86-7cc601f6067a@collabora.com>
Date: Thu, 7 Sep 2023 14:20:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 10/15] drm/mediatek: Support CRC in display driver
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>
References: <20230823151332.28811-1-shawn.sung@mediatek.com>
 <20230823151332.28811-11-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230823151332.28811-11-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_052014_131478_B3750EFB 
X-CRM114-Status: GOOD (  18.17  )
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

Il 23/08/23 17:13, Hsiao Chien Sung ha scritto:
> Register CRC related function pointers to support CRC
> retrieval.
> 
> Skip the first CRC because when the first vblank triggered,
> the frame buffer is not ready for CRC calculation yet.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 53 +++++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.h     | 20 ++++++++
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  5 ++
>   3 files changed, 78 insertions(+)
> 

..snip..

> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> index febcaeef16a1..3b67c3dc0525 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -45,6 +45,10 @@ enum mtk_ddp_comp_type {
>   
>   struct mtk_ddp_comp;
>   struct cmdq_pkt;
> +
> +/* struct mtk_ddp_comp_funcs - function pointers of the ddp components

While at it, can you at this point just add kerneldoc for the entire structure?
That should be pretty straightforward, and just a 10 minutes job.

Thanks!
Angelo

> + * @crc_cnt: how many CRCs the component supports
> + */
>   struct mtk_ddp_comp_funcs {
>   	int (*clk_enable)(struct device *dev);
>   	void (*clk_disable)(struct device *dev);
> @@ -80,6 +84,7 @@ struct mtk_ddp_comp_funcs {
>   	void (*disconnect)(struct device *dev, struct device *mmsys_dev, unsigned int next);
>   	void (*add)(struct device *dev, struct mtk_mutex *mutex);
>   	void (*remove)(struct device *dev, struct mtk_mutex *mutex);
> +	u32 (*crc_cnt)(struct device *dev);
>   };
>   


