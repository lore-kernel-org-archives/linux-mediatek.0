Return-Path: <SRS0=C/QR=NB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3977BC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 01:53:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC39F6101E
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 01:53:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC39F6101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bEglUsvKvr+f8cBW6yJy/wSceaJdF3HR41QH0KKnqaY=; b=tLCsxcYtoBPvXz
	O01ra32BvHM/oXRO6CBCBvCWk8hZtw5c2WaAgFH+vYAlXGfgcjSQqn5J2q3le+U0bvQUoxSammpuw
	Y9P8b6n+pWx0w9q0kUI6P5YJaHAqA8hbiPHOWgLgSrRhCMgGyGhz1FAF/saT17rtGRhJTzCzpb55M
	RZAbZhu9v5cgPadGf/+DEQ8ja1Laz+7Rf+62BuwyOc2faajD0i3ImL0cid5L4Jov7sYnEXs3pGuhZ
	tDiDKAVHWFJehDz5uSkq8t8NKLwzCy0r1MwVpwMJbdBiD/wwMSBVqSvmZwsISrtRHySaxdT+OCaUg
	1uttQnRz+aq4zzl4FiCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDGx7-002EXn-Fb; Tue, 10 Aug 2021 01:53:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDGx2-002EXE-34; Tue, 10 Aug 2021 01:53:11 +0000
X-UUID: 047e4aa6a61c4381a8055670ea92bc11-20210809
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=AovUnvA/WhUJcaeR0tck3lnEatlmvY48SJ1ZfJWX3DU=; 
 b=S3H7afW74x/aH0a1lP3g9d8a4vJb3caifOBRxeD98JvPi9ZJFqDRXzr3lgRIcdPdK4ImlY51S2BZhippds1w38qk9a+teQ9ETNBLsKcozzNYr39dp+1ycNTFF6//FQB6rhy6nj9AZYFZ7WdLRh9tuIX20m6hjeDsQjYaeuHLd30=;
X-UUID: 047e4aa6a61c4381a8055670ea92bc11-20210809
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 559542751; Mon, 09 Aug 2021 18:53:02 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Aug 2021 18:53:00 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Aug 2021 09:52:58 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 10 Aug 2021 09:52:58 +0800
Message-ID: <1628560378.15645.1.camel@mtksdaap41>
Subject: Re: [PATCH v1] drm/mediatek: add AAL output size configuration
From: CK Hu <ck.hu@mediatek.com>
To: jason-jh.lin <jason-jh.lin@mediatek.com>
CC: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>
Date: Tue, 10 Aug 2021 09:52:58 +0800
In-Reply-To: <20210709055635.22296-1-jason-jh.lin@mediatek.com>
References: <20210709055635.22296-1-jason-jh.lin@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_185308_185412_A2C40EE8 
X-CRM114-Status: GOOD (  17.16  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Jason:

On Fri, 2021-07-09 at 13:56 +0800, jason-jh.lin wrote:
> To avoid the output height is incorrect, AAL_OUTPUT_SIZE
> configuration should be set.
> 
> Fixes: 0664d1392c26 ("drm/mediatek: Add AAL engine basic function")
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 75bc00e17fc4..fc608d05f040 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -34,6 +34,7 @@
>  
>  #define DISP_AAL_EN				0x0000
>  #define DISP_AAL_SIZE				0x0030
> +#define DISP_AAL_OUTPUT_SIZE			0x04d8
>  
>  #define DISP_DITHER_EN				0x0000
>  #define DITHER_EN				BIT(0)
> @@ -196,7 +197,12 @@ static void mtk_aal_config(struct device *dev, unsigned int w,
>  {
>  	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
>  
> -	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs, DISP_AAL_SIZE);
> +	mtk_ddp_write(cmdq_pkt, w << 16 | h,
> +		      &priv->cmdq_reg, priv->regs,
> +				DISP_AAL_SIZE);

This modification break one line into multiple line. This is not related
to this patch.

> +	mtk_ddp_write(cmdq_pkt, w << 16 | h,
> +		      &priv->cmdq_reg, priv->regs,
> +				DISP_AAL_OUTPUT_SIZE);

One line.

Regards,
CK

>  }
>  
>  static void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
