Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E32C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 13:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+gn3Xt9XhYsh/EjHNi3T1Ely7HON1XH8rcFNv3ZGFNA=; b=NRoucEjhAT7byp
	mpF90Fpu/vOl1LAd05j/2jGl8DLedjf5Amy+FVRl3YQdyhPEszxd9R8sPPTjZ6LyYwrZIwaLWLVYL
	Gt1JgogPMa8tMaPQh3J8ZIG7U6AlnRR/s1JebsVAj97GQryivmc+uFFDrsBkuM6UPVv/D6bhGUfFr
	pEVkUJ6g4TUqvdNX6ZqkwFxLmEy+C5mUlHk/3bQS3wBhkHE5gzzshjHKFVFHLIFjtc+1NxTd8ibye
	+yino4qAeSr78PE8V/SjPMHKXbu3HpgfOYIKBXu7Nqs8+gsctA0gXjA/d9hG4rf8gMonn8Z8P60Bp
	0PLPSYfL2JjSjqOgu9+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neGEx-00EQZi-9O; Tue, 12 Apr 2022 13:07:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neGEu-00EQXr-0M; Tue, 12 Apr 2022 13:07:26 +0000
X-UUID: 420a8cefaf3c456c933c426bbaa18370-20220412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=xf37PFnEClW1qM4/2BjwgHyzyNVeDsPno519q5KVfXo=; 
 b=B5cMYRjV7c12iIVoCQZO+AUqVLAvcmU9Wr0NV/2kBsnMcWyYR44l/pyqZsySTXrK98UYiL6PF9X52tcck2fpsNvL31fY1aI37akEG+Ns1QhiUdV3TTFzDoEF8p1VkHhz3cpDvGHfHrPxUcy3W8xk8dGh/JdkmIFYED0xkXuR0HQ=;
X-UUID: 420a8cefaf3c456c933c426bbaa18370-20220412
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 705662806; Tue, 12 Apr 2022 06:07:18 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Apr 2022 06:07:16 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 12 Apr 2022 21:07:02 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 12 Apr 2022 21:07:02 +0800
Message-ID: <2567139ca77c089fab915da30cc48ca6a9110deb.camel@mediatek.com>
Subject: Re: [PATCH v4, 3/4] drm/mediatek: keep dsi as LP00 before dcs cmds
 transfer
From: xinlei.lee <xinlei.lee@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>, <rex-bc.chen@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <jitao.shi@mediatek.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 12 Apr 2022 21:07:33 +0800
In-Reply-To: <7a4e5afb-6947-ed7f-8555-c7402aaa3a29@collabora.com>
References: <1649644308-8455-1-git-send-email-xinlei.lee@mediatek.com>
 <1649644308-8455-4-git-send-email-xinlei.lee@mediatek.com>
 <7a4e5afb-6947-ed7f-8555-c7402aaa3a29@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_060724_136843_2B3DB552 
X-CRM114-Status: GOOD (  24.04  )
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

On Mon, 2022-04-11 at 11:07 +0200, AngeloGioacchino Del Regno wrote:
> Il 11/04/22 04:31, xinlei.lee@mediatek.com ha scritto:
> > From: Jitao Shi <jitao.shi@mediatek.com>
> > 
> > To comply with the panel sequence, hold the mipi signal to LP00
> > before the dcs cmds transmission,
> > and pull the mipi signal high from LP00 to LP11 until the start of
> > the dcs cmds transmission.
> > The normal panel timing is :
> > (1) pp1800 DC pull up
> > (2) avdd & avee AC pull high
> > (3) lcm_reset pull high -> pull low -> pull high
> > (4) Pull MIPI signal high (LP11) -> initial code -> send video
> > data(HS mode)
> > The power-off sequence is reversed.
> > If dsi is not in cmd mode, then dsi will pull the mipi signal high
> > in the mtk_output_dsi_enable function.
> > 
> > Fixes: 2dd8075d2185 ("drm/mediatek: mtk_dsi: Use the
> > drm_panel_bridge API")
> > 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > ---
> >   drivers/gpu/drm/mediatek/mtk_dsi.c | 28 +++++++++++++++++++++--
> > -----
> >   1 file changed, 21 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index cf76c53a1af6..9ad6f08c8bfe 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -203,6 +203,7 @@ struct mtk_dsi {
> >   	struct mtk_phy_timing phy_timing;
> >   	int refcount;
> >   	bool enabled;
> > +	bool lanes_ready;
> >   	u32 irq_data;
> >   	wait_queue_head_t irq_wait_queue;
> >   	const struct mtk_dsi_driver_data *driver_data;
> > @@ -654,13 +655,6 @@ static int mtk_dsi_poweron(struct mtk_dsi
> > *dsi)
> >   	mtk_dsi_config_vdo_timing(dsi);
> >   	mtk_dsi_set_interrupt_enable(dsi);
> >   
> > -	mtk_dsi_rxtx_control(dsi);
> > -	usleep_range(30, 100);
> > -	mtk_dsi_reset_dphy(dsi);
> > -	mtk_dsi_clk_ulp_mode_leave(dsi);
> > -	mtk_dsi_lane0_ulp_mode_leave(dsi);
> > -	mtk_dsi_clk_hs_mode(dsi, 0);
> > -
> >   	return 0;
> >   err_disable_engine_clk:
> >   	clk_disable_unprepare(dsi->engine_clk);
> > @@ -689,6 +683,23 @@ static void mtk_dsi_poweroff(struct mtk_dsi
> > *dsi)
> >   	clk_disable_unprepare(dsi->digital_clk);
> >   
> >   	phy_power_off(dsi->phy);
> > +
> > +	dsi->lanes_ready = false;
> > +}
> > +
> > +static void mtk_dsi_lane_ready(struct mtk_dsi *dsi)
> > +{
> > +	if (!dsi->lanes_ready) {
> > +		dsi->lanes_ready = true;
> > +		mtk_dsi_rxtx_control(dsi);
> > +		usleep_range(30, 100);
> > +		mtk_dsi_reset_dphy(dsi);
> > +		mtk_dsi_clk_ulp_mode_leave(dsi);
> > +		mtk_dsi_lane0_ulp_mode_leave(dsi);
> > +		mtk_dsi_clk_hs_mode(dsi, 0);
> > +		msleep(20);
> 
> This is a very long sleep, which wasn't present before this change.
> Please document the reasons why we need this 20ms sleep with a
> comment
> in the code.
> 
> Regards,
> Angelo
> 
> 

Hi Angelo:

Thanks for your review.
As mentioned in the previous reply, it is because the time required to
respond to dsi_rx is about one frame.
I will add this explanation in the next edition of code & comments.

Best Regards!
xinlei
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
