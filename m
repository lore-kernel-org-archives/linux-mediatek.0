Return-Path: <SRS0=ALEk=HA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F41C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 01:33:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D92DE64DF1
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 01:33:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D92DE64DF1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Kvl4lRh8UpWHeBC4++AkxqePTeuzYVRBwXInHV9uHFM=; b=niRXkCZ7wEUlPcM8bv1bpDQP8
	B4UPPH0s8lfCp1ZJJOhGE21JyDm99c/z9giYzPsafe8l3nqwiOmggBXKgclFdBTtjMol2L99CjjGN
	Wfm3ESTL3eETshb9fyYNJah2a77y0pF+f+g0JY+C0pnIfI7QgBlxtGHqMys5dM53Um5dAXLUBF5Lp
	7KwrMN7vPm9IZXCCW55zOreDdxUpFIQz9EPMBFB/tCWBSAAp4TwCLUfGJUFuF2ByjRE3LxVy9ktfW
	TeKJa0kLN9ONLXPjZxxEO2WkdMu/madUK8tvs8hU4VBIzbHZGIn5x09Lz/ZykywTgizur4EV2q9Ag
	pzqOYse0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5Iez-0000ri-FW; Fri, 29 Jan 2021 01:33:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5Iev-0000qK-JL; Fri, 29 Jan 2021 01:33:15 +0000
X-UUID: 6b59f50a48a74faeb6ee08f2ab5cc7e1-20210128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=osPAg0K5Yd7X9cjShUvPGC/GtiMhGLI3vpW3QQq8WXs=; 
 b=SVbp7fctsNo7VFTjJqTqn78oe51H5KAUusyw1m52NIs+N/2N9YjYM/NQqd0jfwnBv67qgdLa1Blkzbt70bLt8z8HRpZjfndb0/kSaIdqHBYRwTFEAk3z/boc52W5XqumjhhYghTm+4Ysx3djUOVCzYS9rEm/N9GT9loVjV+HEH4=;
X-UUID: 6b59f50a48a74faeb6ee08f2ab5cc7e1-20210128
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 769493977; Thu, 28 Jan 2021 17:33:09 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Jan 2021 17:33:07 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Jan 2021 09:33:02 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 Jan 2021 09:33:02 +0800
Message-ID: <1611883982.5226.12.camel@mtksdaap41>
Subject: Re: [PATCH v12 6/8] drm/mediatek: enable dither function
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 29 Jan 2021 09:33:02 +0800
In-Reply-To: <20210128112314.1304160-7-hsinyi@chromium.org>
References: <20210128112314.1304160-1-hsinyi@chromium.org>
 <20210128112314.1304160-7-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 61173972B03CFC5DDB5831DC8F9D30A79FD4418A4F9F31FD79A0881E77BA28132000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_203313_841241_8306F98B 
X-CRM114-Status: GOOD (  19.69  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Hsin-Yi:

On Thu, 2021-01-28 at 19:23 +0800, Hsin-Yi Wang wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> for 5 or 6 bpc panel, we need enable dither function
> to improve the display quality
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index ac2cb25620357..6c8f246380a74 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -53,6 +53,7 @@
>  #define DITHER_EN				BIT(0)
>  #define DISP_DITHER_CFG				0x0020
>  #define DITHER_RELAY_MODE			BIT(0)
> +#define DITHER_ENGINE_EN			BIT(1)
>  #define DISP_DITHER_SIZE			0x0030
>  
>  #define LUT_10BIT_MASK				0x03ff
> @@ -314,9 +315,19 @@ static void mtk_dither_config(struct device *dev, unsigned int w,
>  			      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
>  {
>  	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> +	bool enable = (bpc == 5 || bpc == 6);

I strongly believe that dither function in dither is identical to the
one in gamma and od, and in mtk_dither_set_common(), 'bpc >=
MTK_MIN_BPC' is valid, so I believe we need not to limit bpc to 5 or 6.
But we should consider the case that bpc is invalid in
mtk_dither_set_common(). Invalid case in gamma and od use different way
to process. For gamma, dither is default relay mode, so invalid bpc
would do nothing in mtk_dither_set_common() and result in relay mode.
For od, it set to relay mode first, them invalid bpc would do nothing in
mtk_dither_set_common() and result in relay mode. I would like dither,
gamma and od to process invalid bpc in the same way. One solution is to
set relay mode in mtk_dither_set_common() for invalid bpc.

Regards,
CK

>  
> -	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_DITHER_SIZE);
> -	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG);
> +	if (enable) {
> +		mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc,
> +				      DISP_DITHER_CFG, DITHER_ENGINE_EN,
> +				      cmdq_pkt);
> +	} else {
> +		mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg,
> +			      priv->regs, DISP_DITHER_CFG);
> +	}
> +
> +	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
> +		      DISP_DITHER_SIZE);
>  }
>  
>  static void mtk_dither_start(struct device *dev)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
