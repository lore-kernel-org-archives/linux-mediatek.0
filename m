Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE5EC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 10:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ysHZ8jEeM++QDGfzUebNDXItk40Km+I6R5rRxsQxNYo=; b=BOwFm7/MP7Z8yU
	ntYp5AonzYjZPgKSk6NV3z35YC0Tm4IaO5HWLLZtAa0aGDGfj9u/d2r+Ozpdv3QLzE1HaExYChCdR
	GJsHaEGFrsLu0cPYMgrSdeKpq3MC0JhEEWH8JN0jgI7vIVE3y/2Yi38CaSn3vnOUPXCVxHKkLj7IF
	Lz2XY4iQmtDppw94kxSbzkQl5LZ5PJ2gzIA5LNh1nkZsQE9nEamt0N4DYtqmOa8W9ywkrdCkBx5LX
	dolgH3W+4Z5EjNhzaWK5jVTPOe16UBXTKdzHvQeeowm96ZOByzKGBQ4mMUyW1o4EVmIjvmbxDFA/5
	DkhNGaMtQljsLkyGiYCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRX76-003sjF-2y; Tue, 08 Mar 2022 10:30:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRWrV-003lsH-UM; Tue, 08 Mar 2022 10:14:40 +0000
X-UUID: adc7b3d3e8da42a98dfef15282fbbc7e-20220308
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=CsXv8NXxtbgGiiBYrjWnOoZeOQtvLkvmPIooThficOE=; 
 b=JGRit2a3G8haB6Rx659sOev8Qj6VvZ3jifFrZcKNQBYLQSjrc0AMFO9AZXrYIw0PHiTCWbziA+CQHHxtc+FZbR5AgeWtvftQkkATHt6yFjwXweH9yqHWEVUhAqbAkI0IkJlmV7rSbEhI4qlqIEyhe5/Xlx+O7G7jpPCokNpiHRo=;
X-UUID: adc7b3d3e8da42a98dfef15282fbbc7e-20220308
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 281859763; Tue, 08 Mar 2022 03:14:29 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Mar 2022 02:14:27 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Mar 2022 18:14:26 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Mar 2022 18:14:25 +0800
Message-ID: <9e3cd215a2f771236855bdb2f5faa172dcbd1aec.camel@mediatek.com>
Subject: Re: [PATCH v2, 0/4] Cooperate with DSI RX devices to modify dsi
 funcs and delay mipi high to cooperate with panel sequence
From: xinlei.lee <xinlei.lee@mediatek.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
CC: <jitao.shi@mediatek.com>, <allen-kh.cheng@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, <rex-bc.chen@mediatek.com>,
 <linux-arm-kernel@lists.infradead.org>
Date: Tue, 8 Mar 2022 18:14:40 +0800
In-Reply-To: <87lexq2aw4.fsf@intel.com>
References: <1646388956-8033-1-git-send-email-xinlei.lee@mediatek.com>
 <87lexq2aw4.fsf@intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_021438_092656_D86BAEFE 
X-CRM114-Status: GOOD (  16.03  )
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

On Fri, 2022-03-04 at 13:51 +0200, Jani Nikula wrote:
> Please also prefix cover letters with drm/mediatek if that's the only
> place you're touching.
> 
> BR,
> Jani.
> 
> 
> On Fri, 04 Mar 2022, <xinlei.lee@mediatek.com> wrote:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > In upstream-v5.8, dsi_enable will operate panel_enable, but this
> > modification has been moved in v5.9. In order to ensure the timing
> > of
> > dsi_power_on/off and the timing of pulling up/down the MIPI signal,
> > the modification of v5.9 is synchronized in this series of patches.
> > 
> > Changes since v1:
> > 1. Dsi sequence marked with patch adjustment
> > 2. Fixes: mtk_dsi: Use the drm_panel_bridge
> > 
> > Jitao Shi (3):
> >   drm/mediatek: Adjust the timing of mipi signal from LP00 to LP11
> >   drm/mediatek: Separate poweron/poweroff from enable/disable and
> > define
> >     new funcs
> >   drm/mediatek: keep dsi as LP00 before dcs cmds transfer
> > 
> > Xinlei Lee (1):
> >   drm/mediatek: Add pull-down MIPI operation in mtk_dsi_poweroff
> >     function
> > 
> >  drivers/gpu/drm/mediatek/mtk_dsi.c | 73 ++++++++++++++++++++----
> > ------
> >  1 file changed, 49 insertions(+), 24 deletions(-)
> 
> 

Hi Jani:

Thanks for your review.
Is your suggestion for me to put the fix id on the cover ?

Best Regards!
xinlei


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
