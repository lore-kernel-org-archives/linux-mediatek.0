Return-Path: <SRS0=J0kT=LE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 594B7C47094
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 12:03:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 236FE613E7
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 12:03:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 236FE613E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KwsGB0hz5QwF9hH+PkcQnmo+tfWUwugn8rMn3hKWvjA=; b=A+IRIgk9h6fPHs
	QVkphVpSMhX9X17wURz2jjAvFz1jswrL0K0MJ4qhYT5u2YXSTiOuyLwHblEkb1wEzD8XjUmizML8I
	5AdMfKofwqGg8r3jz6fFto4AD9BLnI/yLyGMg3636YHktHaLnZXHXIRRayJzmAtRcsL6NtVtVS1Gk
	PVrZNX9W4Du/qs0OsSDrJrpDMXAsFoFa1wvkSz9LYkfnF+emb4UbmPGv4+rLljoRrJQsgYvsDklyW
	URMo+ViFtaPS+WPBWQT1yy4GrWFisNG8MmiGKlI5u8txNhqCF4AMVFrLl3BsHMxGnNVSeo3QWj/HA
	h0vrhjv5x5QhSsG4ipdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrJP3-000cMS-2G; Thu, 10 Jun 2021 12:03:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrJOc-000cAK-7J; Thu, 10 Jun 2021 12:02:51 +0000
X-UUID: f262ad9228c8438faadfdbb4c254f22f-20210610
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=nqdoQ9Nvfzyjq8sKsY1fXodFn06TJLmPAimZ1WxAizs=; 
 b=lT9Ffj0lAZvLx6QH8Ytq+zXOjgNflcaLF4v8hyAsjUIHWwBcYaPRl23HeywRis9zqVxAoNPm2Zq529jyHr3afyAB73JXHwQIXoMZxQ3aPjtPXgYPacGIU/TrxpDWHaIsLC8Zg2y1OshY1rSXMBAYxsmt5/I5l+1jLExKPt0iwW4=;
X-UUID: f262ad9228c8438faadfdbb4c254f22f-20210610
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 641367297; Thu, 10 Jun 2021 05:02:49 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Jun 2021 05:02:12 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 10 Jun 2021 20:02:09 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Jun 2021 20:02:08 +0800
Message-ID: <1623326528.23717.20.camel@mhfsdcap03>
Subject: Re: [PATCH v5 13/16] media: mtk-vcodec: Get rid of
 mtk_smi_larb_get/put
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Joerg Roedel <joro@8bytes.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, "Evan
 Green" <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>, "Tomasz
 Figa" <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, Devicetree List <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC
 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, <youlin.pei@mediatek.com>, "Nicolas
 Boichat" <drinkcat@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 <anan.sun@mediatek.com>, <chao.hao@mediatek.com>,
 <ming-fan.chen@mediatek.com>, <yi.kuo@mediatek.com>, <eizan@chromium.org>,
 Alexandre Courbot <acourbot@chromium.org>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Irui Wang <irui.wang@mediatek.com>,
 <linux-media@vger.kernel.org>
Date: Thu, 10 Jun 2021 20:02:08 +0800
In-Reply-To: <c1422242-8d8c-9592-c22d-288c503cd8b1@gmail.com>
References: <20210410091128.31823-1-yong.wu@mediatek.com>
 <20210410091128.31823-14-yong.wu@mediatek.com>
 <CAJMQK-iTrQRDDm_=LNqSpvXFd431LYRxXMasJHUpN+K8rJ=Qpg@mail.gmail.com>
 <1620822547.2983.8.camel@mhfsdcap03>
 <c1422242-8d8c-9592-c22d-288c503cd8b1@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 31E46F2F90E698D9BE899FE64F40478A92B3CBEC8E1364ECF9F19623C746B6C02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_050250_327311_EB76DFB1 
X-CRM114-Status: GOOD (  28.18  )
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

On Thu, 2021-06-10 at 09:53 +0200, Matthias Brugger wrote:
> Hi Yong,
> 
> On 12/05/2021 14:29, Yong Wu wrote:
> > On Wed, 2021-05-12 at 17:20 +0800, Hsin-Yi Wang wrote:
> >> On Sat, Apr 10, 2021 at 5:14 PM Yong Wu <yong.wu@mediatek.com> wrote:
> >>>
> >>> MediaTek IOMMU has already added the device_link between the consumer
> >>> and smi-larb device. If the vcodec device call the pm_runtime_get_sync,
> >>> the smi-larb's pm_runtime_get_sync also be called automatically.
> >>>
> >>> CC: Tiffany Lin <tiffany.lin@mediatek.com>
> >>> CC: Irui Wang <irui.wang@mediatek.com>
> >>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> >>> Reviewed-by: Evan Green <evgreen@chromium.org>
> >>> Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
> >>> ---
> >>>  .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 37 ++-------------
> >>>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  3 --
> >>>  .../platform/mtk-vcodec/mtk_vcodec_enc.c      |  1 -
> >>>  .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 46 ++-----------------
> >>>  4 files changed, 10 insertions(+), 77 deletions(-)
> > 
> > [...]
> > 
> >>> @@ -108,13 +80,6 @@ void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm)
> >>>                 }
> >>>         }
> >>>
> >>> -       ret = mtk_smi_larb_get(pm->larbvenc);
> >>> -       if (ret) {
> >>> -               mtk_v4l2_err("mtk_smi_larb_get larb3 fail %d", ret);
> >>> -               goto clkerr;
> >>> -       }
> >>> -       return;
> >>
> >> You can't delete the return; here, otherwise vcodec_clk will be turned
> >> off immediately after they are turned on.
> > 
> > Thanks very much for your review.
> > 
> > Sorry for this. You are quite right.
> > 
> > I checked this, it was introduced in v4 when I rebase the code. I will
> > fix it in next time.
> > 
> 
> Please also make sure that you add all maintainers. I realized that at least for
> the media/platform drivers we miss the maintainer and the corresponding mailing
> list.
> This is especially important in this series, as it spans several subsystems.

Thanks for hint. I only added the file maintainer here. I will add
linux-media in next version.

By the way, this patchset cross several trees, then which tree should it
go through. Do you have some suggestion?

> 
> Thanks a lot,
> Matthias
> 
> >>
> >>> -
> >>>  clkerr:
> >>>         for (i -= 1; i >= 0; i--)
> >>>                 clk_disable_unprepare(enc_clk->clk_info[i].vcodec_clk);
> >>> @@ -125,7 +90,6 @@ void mtk_vcodec_enc_clock_off(struct mtk_vcodec_pm *pm)
> >>>         struct mtk_vcodec_clk *enc_clk = &pm->venc_clk;
> >>>         int i = 0;
> >>>
> >>> -       mtk_smi_larb_put(pm->larbvenc);
> >>>         for (i = enc_clk->clk_num - 1; i >= 0; i--)
> >>>                 clk_disable_unprepare(enc_clk->clk_info[i].vcodec_clk);
> >>>  }
> >>> --
> >>> 2.18.0
> >>>
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
