Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15151C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 02:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DlSerauLBPO5cCwPW7W5xehK2u7+gNpPih4O3vdr/04=; b=PjccumtSyTAiso
	3Q2wC4z26vVUEg4YoGJH5k0rn4OygcVm5aslhMnmS2omiuRNVhlGiwNTTuSmLXHdCHbi6SwCx7GTN
	dAl0s9T9kPucGyqGTzLOU2UMr/3pVWr9EkoxakyuI0ig1gchZtd2MGc5QrFcBagq7VuI/R14NA1YK
	5/phTFliM8Jq7JLRW1CIYCxXoONuMueroDJXAdQXGVI+HyXHT96uRYSHMADub01Kqda2tE+CHz3Jc
	jKB5gR10QIT4An5OIzKeuEN6yr/pM4r5UcxQqw/UWRHYiZNsFlk8LQAo9UTAH9T9r7SVLw/UcQeYC
	R0cDDZU9V3TnnB2l0shA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfBgz-0087Oy-6B; Fri, 15 Apr 2022 02:28:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfBgj-0087KS-Gd; Fri, 15 Apr 2022 02:27:59 +0000
X-UUID: f8c91bbd9ff54540a6783bd5e9b3e085-20220414
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=vf2H6VZ182YiINjGCXVF6weW8Fyk0UPWYeqCXKGSJwc=; 
 b=pFU69XQ3XAX0K4VWFOJFRvERLOof38UQDrBM6lLpOIV0SyIhp4gAuabLcrKHKSZ+ekkDdui92j8MU7IqRryqHSutAcD0ehFxOIczIgzQsh1EMIuzs+gvRuhXzLkswCj9V6UYgkTcsKwsAqzWXC5QwanwSF8YUJvdV66KLWbMzII=;
X-UUID: f8c91bbd9ff54540a6783bd5e9b3e085-20220414
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1236431534; Thu, 14 Apr 2022 19:27:52 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Apr 2022 19:22:50 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 15 Apr 2022 10:22:48 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 15 Apr 2022 10:22:48 +0800
Message-ID: <8ad4a21dd1fa039478d5fcacdcc6e3f8e6af787c.camel@mediatek.com>
Subject: Re: [PATCH v4, 1/4] drm/mediatek: Adjust the timing of mipi signal
 from LP00 to LP11
From: xinlei.lee <xinlei.lee@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>, <rex-bc.chen@mediatek.com>
CC: <jitao.shi@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Date: Fri, 15 Apr 2022 10:23:20 +0800
In-Reply-To: <12c7587db24f0f72e8f7d30c294c7b3eac241a83.camel@mediatek.com>
References: <1649644308-8455-1-git-send-email-xinlei.lee@mediatek.com>
 <1649644308-8455-2-git-send-email-xinlei.lee@mediatek.com>
 <12c7587db24f0f72e8f7d30c294c7b3eac241a83.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_192757_753044_00166A79 
X-CRM114-Status: GOOD (  20.61  )
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

On Wed, 2022-04-13 at 09:59 +0800, CK Hu wrote:
> Hi, Xinlei:
> 
> On Mon, 2022-04-11 at 10:31 +0800, xinlei.lee@mediatek.com wrote:
> > From: Jitao Shi <jitao.shi@mediatek.com>
> > 
> > Old sequence:
> > 1. Pull the MIPI signal high
> > 2. Delay & Dsi_reset
> > 3. Set the dsi timing register
> > 4. dsi clk & lanes leave ulp mode and enter hs mode
> > 
> > The sequence after patching is:
> > 1. Set the dsi timing register
> > 2. Pull the MIPI signal high
> > 3. Delay & Dsi_reset
> > 4. dsi clk & lanes leave ulp mode and enter hs mode
> 
> You just describe WHAT this patch do, but WHY this patch do? Does
> this
> patch reorder sequence to follow any spec?
> 
> > 
> > Fixes: 2dd8075d2185 ("drm/mediatek: mtk_dsi: Use the
> > drm_panel_bridge
> > API")
> > 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dsi.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index ccb0511b9cd5..262c027d8c2f 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -649,14 +649,14 @@ static int mtk_dsi_poweron(struct mtk_dsi
> > *dsi)
> >  	mtk_dsi_reset_engine(dsi);
> >  	mtk_dsi_phy_timconfig(dsi);
> >  
> > -	mtk_dsi_rxtx_control(dsi);
> > -	usleep_range(30, 100);
> > -	mtk_dsi_reset_dphy(dsi);
> >  	mtk_dsi_ps_control_vact(dsi);
> >  	mtk_dsi_set_vm_cmd(dsi);
> >  	mtk_dsi_config_vdo_timing(dsi);
> >  	mtk_dsi_set_interrupt_enable(dsi);
> >  
> > +	mtk_dsi_rxtx_control(dsi);
> > +	usleep_range(30, 100);
> > +	mtk_dsi_reset_dphy(dsi);
> 
> The original sequence is done by patch [1] not the patch in the Fixes
> tag. So modify the Fixes tag.
> 
> [1] 
> 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/gpu/drm/mediatek/mtk_dsi.c?h=v5.18-rc2&id=75374fc2c152ef42c45c6bf716743d5f5bb6d24d
> 
> Regards,
> CK
> 
> >  	mtk_dsi_clk_ulp_mode_leave(dsi);
> >  	mtk_dsi_lane0_ulp_mode_leave(dsi);
> >  	mtk_dsi_clk_hs_mode(dsi, 0);
> 
> 

Hi CK:

Thanks for your review!
This modification does not violate the spec. The main purpose is to
move 2, 3, 4 of the new sequece to the lane_ready function.
I will modify this Fixes tag in the next version.

Best Regards!
xinlei
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
