Return-Path: <SRS0=1nN3=KH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E315C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 12:29:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B185F613EE
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 12:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B185F613EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2mNe6f2KW6P1LJ5LsWZ/3l0qp6E9nkon9t8ZRozsbLI=; b=WWspFt13KFUPth2hNd+lGGaJL
	DoJQxt/wVsyzdlyGdSqT6U2tz9uZGZhfp0zQ0YIAoAdxL+i7kenEP4Tjk2seUnZLbZGs44ToQl6xP
	OFUgUmdVsghdOQftYReWTQb1Zcc4RnUorSPh2CCGo5NjBRH3ShRFPzSaD3lckTxBEXeT6dhnC4apt
	Og81g97cocQ1BlDRlF7JUfG4UkbtupfyV5QJsT4kqf7KWeLrJ4Etpj5UvB+Mi5EdBscJogrwNwmtF
	vi0sirxwt46pRBMcp7HYU5KMGvtp+rEMkX6nbYqWrYFloZShZZMxFr7VVjdUKAlqPfMjhk2e+1tot
	pkrPjZ5nA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgnzj-002k3M-MF; Wed, 12 May 2021 12:29:44 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgnzU-002k0f-WB; Wed, 12 May 2021 12:29:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=ewPs1Oa6a3lyJ4v/+R+Na+4N5EnjMReDZVRwjMtKeis=; b=aLhdK9ga20ZU924IoW9oqPjugm
 S9Xouo3gBiqIkiAd3L2LcIdQhkKyFPjbk1rd9Pu6e9DwmyYvu7lnpiYv5ErLUpAjqdyCKZYkVN+q4
 tTB3m8NpGOGnakeKDhpR2pD5aIJLQqTlnoGrYWa6IORf5jfun6sUIMKys7Op10ubdCnMADNGoNHH9
 r1ewtZSItxcLwkI/XJxaCEyEK4k3HyT0aFSPRe4iiVizwSU3DSGqvPhW4kET6/UMvJyNPkuGBfE0u
 DdyfvgOyvEScaP6X9j+rOPN+q1959/dPKsGP/AeZd4g7J8SdSFSfncyyrBT9mJ2+l+OtWzxYX/vyH
 PrxwBaiQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgnzR-00ALNs-HU; Wed, 12 May 2021 12:29:26 +0000
X-UUID: 26167df6502447999bd887861cbca36d-20210512
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ewPs1Oa6a3lyJ4v/+R+Na+4N5EnjMReDZVRwjMtKeis=; 
 b=bTFrQGbet8lp0YMbCe0aBzgKe/npKGbc6Q4h431YggAP+T+72QOVXBjaG5eC4cELpj/m0v9ix8Laxchl0jPQtTVEmDqJvzCiIOi7iaYu84epEXoqzUb79N3RFiHFdpkuZL+Xwt0SbbecnC94VE5rdse9r+nEScNnVAPdQzsnv90=;
X-UUID: 26167df6502447999bd887861cbca36d-20210512
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1966095168; Wed, 12 May 2021 05:29:15 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 May 2021 05:29:14 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 12 May 2021 20:29:08 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 12 May 2021 20:29:07 +0800
Message-ID: <1620822547.2983.8.camel@mhfsdcap03>
Subject: Re: [PATCH v5 13/16] media: mtk-vcodec: Get rid of
 mtk_smi_larb_get/put
From: Yong Wu <yong.wu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 "Evan Green" <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 "Tomasz Figa" <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 Devicetree List <devicetree@vger.kernel.org>, lkml
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, <youlin.pei@mediatek.com>, "Nicolas
 Boichat" <drinkcat@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 <anan.sun@mediatek.com>, <chao.hao@mediatek.com>,
 <ming-fan.chen@mediatek.com>, <yi.kuo@mediatek.com>, <eizan@chromium.org>,
 Alexandre Courbot <acourbot@chromium.org>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Irui Wang <irui.wang@mediatek.com>
Date: Wed, 12 May 2021 20:29:07 +0800
In-Reply-To: <CAJMQK-iTrQRDDm_=LNqSpvXFd431LYRxXMasJHUpN+K8rJ=Qpg@mail.gmail.com>
References: <20210410091128.31823-1-yong.wu@mediatek.com>
 <20210410091128.31823-14-yong.wu@mediatek.com>
 <CAJMQK-iTrQRDDm_=LNqSpvXFd431LYRxXMasJHUpN+K8rJ=Qpg@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7780E5B9D2712AB2AE1806AA941E22A5D94145B0E8BDFD93F8EBEB7BFDD94F3E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_052925_604092_7C3639F1 
X-CRM114-Status: GOOD (  20.20  )
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

On Wed, 2021-05-12 at 17:20 +0800, Hsin-Yi Wang wrote:
> On Sat, Apr 10, 2021 at 5:14 PM Yong Wu <yong.wu@mediatek.com> wrote:
> >
> > MediaTek IOMMU has already added the device_link between the consumer
> > and smi-larb device. If the vcodec device call the pm_runtime_get_sync,
> > the smi-larb's pm_runtime_get_sync also be called automatically.
> >
> > CC: Tiffany Lin <tiffany.lin@mediatek.com>
> > CC: Irui Wang <irui.wang@mediatek.com>
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > Reviewed-by: Evan Green <evgreen@chromium.org>
> > Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
> > ---
> >  .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 37 ++-------------
> >  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  3 --
> >  .../platform/mtk-vcodec/mtk_vcodec_enc.c      |  1 -
> >  .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 46 ++-----------------
> >  4 files changed, 10 insertions(+), 77 deletions(-)

[...]

> > @@ -108,13 +80,6 @@ void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm)
> >                 }
> >         }
> >
> > -       ret = mtk_smi_larb_get(pm->larbvenc);
> > -       if (ret) {
> > -               mtk_v4l2_err("mtk_smi_larb_get larb3 fail %d", ret);
> > -               goto clkerr;
> > -       }
> > -       return;
> 
> You can't delete the return; here, otherwise vcodec_clk will be turned
> off immediately after they are turned on.

Thanks very much for your review.

Sorry for this. You are quite right.

I checked this, it was introduced in v4 when I rebase the code. I will
fix it in next time.

> 
> > -
> >  clkerr:
> >         for (i -= 1; i >= 0; i--)
> >                 clk_disable_unprepare(enc_clk->clk_info[i].vcodec_clk);
> > @@ -125,7 +90,6 @@ void mtk_vcodec_enc_clock_off(struct mtk_vcodec_pm *pm)
> >         struct mtk_vcodec_clk *enc_clk = &pm->venc_clk;
> >         int i = 0;
> >
> > -       mtk_smi_larb_put(pm->larbvenc);
> >         for (i = enc_clk->clk_num - 1; i >= 0; i--)
> >                 clk_disable_unprepare(enc_clk->clk_info[i].vcodec_clk);
> >  }
> > --
> > 2.18.0
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
