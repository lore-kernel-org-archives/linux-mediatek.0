Return-Path: <SRS0=ALEk=HA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FFC6C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 08:59:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B180964E20
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 08:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B180964E20
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=18g4k7qZfh7oU/sRwTBuwz2rEuapbGPQ/YYielRyRd4=; b=efQYMgeucqnDDEpwZtTkE4ZR2C
	bLSXt33Oemg7ZpzyUaK2qa/SSUo5pa+PHAKtO1FlXttlNnUQYm3qLHLSN2ZMKEzEyw/i2ijQQPv/t
	bt7vVcmB2dwaZ6Y6PvXWHbD8sMi8PHhrfcUkKU20/W99vx/pjm1tfnPn49F2s35+1TbUIQfj2jEr+
	V2ZwAFn7L6dHZDtiehNm9vywUhtJl8bjM1zDgck2OkG+NDYEKu2aUyqyHuNRT+tD4g3oZ2smmrXLJ
	nYSqm4bhDvNO4CjL2mRy9O88JLR99zmzdCj+e49+BKeG1u394CtSIwWihncF1ib3Fp8OukiTaEtl0
	YytALZgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5PcZ-0001zF-88; Fri, 29 Jan 2021 08:59:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5PcT-0001xD-U2; Fri, 29 Jan 2021 08:59:10 +0000
X-UUID: e4a3b739b1b241aaaf9678c77c1a9e3e-20210129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=O6IOBaAxQfjWwIu5XGkj6uilpVZbfJZL9rj3WI2ksQo=; 
 b=JAkdATioTyv8NTkJq10He3r2NhFs4Fhdz/P10dKvS6L1df2RzAZH4y4/xenvMoDoolN49ugVSlTlJ0LRsLn2OMVVm5AUgnVa/T2Gm9sml74cE4JD8uZYymJKJJzdNGUuG6duRrV1lK6UlFDCYqmiLKu53Nw2R+YxVslVjBwsTTU=;
X-UUID: e4a3b739b1b241aaaf9678c77c1a9e3e-20210129
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1093305133; Fri, 29 Jan 2021 00:59:07 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Jan 2021 00:59:06 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 29 Jan 2021 16:59:04 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 Jan 2021 16:59:03 +0800
Message-ID: <1611910743.24406.3.camel@mhfsdcap03>
Subject: Re: [PATCH v4 6/8] drm/mediatek: add matrix bits private data for
 ccorr
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Date: Fri, 29 Jan 2021 16:59:03 +0800
In-Reply-To: <1611909641.31184.11.camel@mtksdaap41>
References: <20210129073436.2429834-1-hsinyi@chromium.org>
 <20210129073436.2429834-7-hsinyi@chromium.org>
 <1611909641.31184.11.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_035910_159551_B2EE5BEE 
X-CRM114-Status: GOOD (  20.79  )
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
Reply-To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, David
 Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2021-01-29 at 16:40 +0800, CK Hu wrote:
> Hi, Hsin-Yi:
> 
> On Fri, 2021-01-29 at 15:34 +0800, Hsin-Yi Wang wrote:
> > From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > 
> > matrix bits of mt8183 is 12
> > matrix bits of mt8192 is 13
> > 
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 22 +++++++++++++++++++---
> >  1 file changed, 19 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> > index 0c68090eb1e92..1c7163a12f3b1 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> > @@ -31,8 +31,10 @@
> >  #define DISP_CCORR_COEF_3			0x008C
> >  #define DISP_CCORR_COEF_4			0x0090
> >  
> > +#define CCORR_MATRIX_BITS			12
> > +
> >  struct mtk_disp_ccorr_data {
> > -	u32 reserved;
> > +	u32 matrix_bits;
> >  };
> >  
> >  /**
> > @@ -116,6 +118,7 @@ void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
> >  	uint16_t coeffs[9] = { 0 };
> >  	int i;
> >  	struct cmdq_pkt *cmdq_pkt = NULL;
> > +	u32 matrix_bits;
> >  
> >  	if (!blob)
> >  		return;
> > @@ -123,8 +126,16 @@ void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
> >  	ctm = (struct drm_color_ctm *)blob->data;
> >  	input = ctm->matrix;
> >  
> > -	for (i = 0; i < ARRAY_SIZE(coeffs); i++)
> > +	if (ccorr->data)
> > +		matrix_bits = ccorr->data->matrix_bits;
> > +	else
> > +		matrix_bits = CCORR_MATRIX_BITS;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(coeffs); i++) {
> >  		coeffs[i] = mtk_ctm_s31_32_to_s1_10(input[i]);
> > +		if (matrix_bits > CCORR_MATRIX_BITS)
> > +			coeffs[i] <<= (matrix_bits - CCORR_MATRIX_BITS);
> 
> I think format of MT8192 ccorr coeffs is s1.11, after
> mtk_ctm_s31_32_to_s1_10(), you lose one bit precision. So modify
> mtk_ctm_s31_32_to_s1_10() to get maximum precision.
> 
> Regards,
> CK

mt8183 s2.10, default value 1024
mt8192 s2.11, default value 2048
> 
> > +	}
> >  
> >  	mtk_ddp_write(cmdq_pkt, coeffs[0] << 16 | coeffs[1],
> >  		      &ccorr->cmdq_reg, ccorr->regs, DISP_CCORR_COEF_0);
> > @@ -205,8 +216,13 @@ static int mtk_disp_ccorr_remove(struct platform_device *pdev)
> >  	return 0;
> >  }
> >  
> > +static const struct mtk_disp_ccorr_data mt8183_ccorr_driver_data = {
> > +	.matrix_bits = CCORR_MATRIX_BITS,
> > +};
> > +
> >  static const struct of_device_id mtk_disp_ccorr_driver_dt_match[] = {
> > -	{ .compatible = "mediatek,mt8183-disp-ccorr"},
> > +	{ .compatible = "mediatek,mt8183-disp-ccorr",
> > +	  .data = &mt8183_ccorr_driver_data},
> >  	{},
> >  };
> >  MODULE_DEVICE_TABLE(of, mtk_disp_ccorr_driver_dt_match);
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
