Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197CFC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 03:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XPq/6dFASRqc6e2yem5OrGISl6cnYLvjFfIK/0fW3eA=; b=Rsa51lRNPuiSYKS2PilawY76tC
	YOcGsMYEynYG09CFMAvVdYJE9c414ZcL5sw6pQR2H5DxfBBVXmcR1quGlfNgGsw1gZxoJDyJoK0ha
	FitNYuEvS/NXaNqbv0lNVhk3rnDJRPNrRdJmGAv9e9SSvAX8mRV/qVaxI/dICGA2zHKRD9VO6rhmb
	kyg+mHX9RWx8Nq4uh+I2TI8mPW/dmQVOVyqkskoHB2OmR7REvOFOvAm4UDEPpXgz9iopvfjD17ari
	2sPzmnputEQJDSdZhj93ephTQUyVihDs1ZHbBF7p80lEEDyblVK1JPtHYgoK/vVhn5wDYR5oM6GtF
	DDicoqUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofvHI-00CG6a-Iq; Wed, 05 Oct 2022 03:41:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofvHE-00CG61-Df; Wed, 05 Oct 2022 03:40:59 +0000
X-UUID: ef55ce0be7f944dead336dc3fec4bc3c-20221004
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=XPq/6dFASRqc6e2yem5OrGISl6cnYLvjFfIK/0fW3eA=;
	b=SCh6/H0dGyq73xADrJ9g1XlF71iDpk+sw1pP5/dq88BM8KGIKqIQkLYrzYBxqKIVuadjxtl6giL8GDNfqsZ4dwLzydMx4n8+6TbBQZ7coRWBmVCtgvdtj4VZ6qcNhIpOkyyAebQi9jRj+1krlxGgjnfwtTe3s3JiAiQkmAZwvho=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:3e3b3915-058b-4f20-b442-a1faf51ca557,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:048ee569-c578-4abf-baf4-d93ecc5e701f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ef55ce0be7f944dead336dc3fec4bc3c-20221004
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1184503492; Tue, 04 Oct 2022 20:40:04 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 5 Oct 2022 10:59:28 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 5 Oct 2022 10:59:28 +0800
Message-ID: <b965deb07fb14141531fe6b921dee1f60d4cb923.camel@mediatek.com>
Subject: Re: [PATCH v1 5/6] soc: mediatek: mutex: Add mtk_mutex_set_mod
 support to set MOD1
From: moudy ho <moudy.ho@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Roy-CW.Yeh
	<roy-cw.yeh@mediatek.com>
Date: Wed, 5 Oct 2022 10:59:27 +0800
In-Reply-To: <42ab09ef-427d-f2dd-c480-f3e11f4aaa79@collabora.com>
References: <20221004093319.5069-1-moudy.ho@mediatek.com>
	 <20221004093319.5069-6-moudy.ho@mediatek.com>
	 <42ab09ef-427d-f2dd-c480-f3e11f4aaa79@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_204056_737884_1A81B932 
X-CRM114-Status: GOOD (  24.96  )
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

On Tue, 2022-10-04 at 14:38 +0200, AngeloGioacchino Del Regno wrote:
> Il 04/10/22 11:33, Moudy Ho ha scritto:
> > From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
> > 
> > Add mtk_mutex_set_mod support to set MOD1
> > 
> > Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
> > ---
> >   drivers/soc/mediatek/mtk-mutex.c | 27 +++++++++++++++++++--------
> >   1 file changed, 19 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-mutex.c
> > b/drivers/soc/mediatek/mtk-mutex.c
> > index c1a33d52038e..5dcbd61fe42c 100644
> > --- a/drivers/soc/mediatek/mtk-mutex.c
> > +++ b/drivers/soc/mediatek/mtk-mutex.c
> > @@ -23,6 +23,7 @@
> >   #define DISP_REG_MUTEX(n)			(0x24 + 0x20 * (n))
> >   #define DISP_REG_MUTEX_RST(n)			(0x28 + 0x20 *
> > (n))
> >   #define DISP_REG_MUTEX_MOD(mutex_mod_reg, n)	(mutex_mod_reg
> > + 0x20 * (n))
> > +#define DISP_REG_MUTEX_MOD1(mutex_mod_reg, n)	((mutex_mod_reg
> > ) + 0x20 * (n) + 0x4)
> >   #define DISP_REG_MUTEX_SOF(mutex_sof_reg, n)	(mutex_sof_reg
> > + 0x20 * (n))
> >   #define DISP_REG_MUTEX_MOD2(n)			(0x34 + 0x20 *
> > (n))
> >   
> > @@ -750,14 +751,24 @@ int mtk_mutex_write_mod(struct mtk_mutex
> > *mutex,
> >   		return -EINVAL;
> >   	}
> >   
> > -	offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
> > -				    mutex->id);
> > -	reg = readl_relaxed(mtx->regs + offset);
> > -
> > -	if (clear)
> > -		reg &= ~BIT(mtx->data->mutex_table_mod[idx]);
> > -	else
> > -		reg |= BIT(mtx->data->mutex_table_mod[idx]);
> > +	if (mtx->data->mutex_table_mod[idx] < 32) {
> 
> What if we do...
> 
> 	u8 id_offset = 0;
> 
> 	/*
> 	 * Some SoCs may have multiple MUTEX_MOD registers as more than
> 32 mods
> 	 * are present, hence requiring multiple 32-bits registers.
> 	 *
> 	 * The mutex_table_mod fully represents that by defining the
> number of
> 	 * the mod sequentially, later used as a bit number, which can
> be more
> 	 * than 0..31.
> 	 *
> 	 * In order to retain compatibility with older SoCs, we perform
> R/W on
> 	 * the single 32 bits registers, but this requires us to
> translate the
> 	 * mutex ID bit accordingly.
> 	 */
> 	if (mtx->data->mutex_table_mod[idx] < 32) {
> 		reg_offset = DISP_REG_MUTEX_MOD0(mtx->data-
> >mutex_mod_reg,
> 						 mutex->id);
> 	} else {
> 		reg_offset = DISP_REG_MUTEX_MOD1(mtx->data-
> >mutex_mod_reg,
> 						 mutex->id);
> 		id_offset = 32;
> 	}
> 
> 	reg = readl_relaxed(mtx->regs + offset);
> 	if (clear)
> 		reg &= ~BIT(mtx->data->mutex_table_mod[idx] -
> id_offset);
> 	else
> 		reg |= BIT(mtx->data->mutex_table_mod[idx] -
> id_offset);
> 
> 	writel_relaxed(reg, mtx->regs + offset);
> 
> ...like this, we give good documentation and also keep the code
> "short" :-)
> 
> Regards,
> Angelo
> 
> 

Hi Angelo,

Thanks for helping with outstanding comments and cleaning up the code,
I'll follow this guide to improve accordingly.

Regards,
Moudy

> > +		offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
> > +					    mutex->id);
> > +		reg = readl_relaxed(mtx->regs + offset);
> > +		if (clear)
> > +			reg &= ~BIT(mtx->data->mutex_table_mod[idx]);
> > +		else
> > +			reg |= BIT(mtx->data->mutex_table_mod[idx]);
> > +
> > +	} else {
> > +		offset = DISP_REG_MUTEX_MOD1(mtx->data->mutex_mod_reg,
> > +					     mutex->id);
> > +		reg = readl_relaxed(mtx->regs + offset);
> > +		if (clear)
> > +			reg &= ~BIT(mtx->data->mutex_table_mod[idx] -
> > 32);
> > +		else
> > +			reg |= BIT(mtx->data->mutex_table_mod[idx] -
> > 32);
> > +	}
> >   
> >   	writel_relaxed(reg, mtx->regs + offset);
> >   
> 
> 


