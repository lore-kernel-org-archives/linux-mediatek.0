Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA040C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 02:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=spCC97lDGcxoune7UacJM1M3vgORKWQJWts7aM3F8cU=; b=jz5U1sitZuVfSR
	Ho5TQqYX5YHFXsHg2hbKCSSRz6tVoyAhpJMCcaZZiY3fLlb81VIlRT6xbejIjJykHbVA2Cb3EHIKn
	CzSnUiZqPqSvwUX/t0hulXCIlqbgzZYjlqVb5T1xfe5Iv0caMTPLp1rCVPrtV3M7+Cu5Xp4en0koP
	DAmXWdUwhUVbMFJyxO3CiYDNJq1z4+PxlO3px8tSjpZer/55oDTi1MpnOIqsSaHk3pkANloqN9d7l
	J1f8h0Hxtem/Ksgc63cbdp6wyCeZnFO2rh2tEOtLHXs9jwwKcTezb1IXPKnzqdxwUvKbmTONYOmgz
	I7/tcE1BAkxioklGvo9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJRAU-00D1Aw-NQ; Mon, 14 Feb 2022 02:32:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJRAR-00D17z-4W; Mon, 14 Feb 2022 02:32:45 +0000
X-UUID: 4fc82d8ce6cd42519a6cbdd7b46d833c-20220213
X-UUID: 4fc82d8ce6cd42519a6cbdd7b46d833c-20220213
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1572689559; Sun, 13 Feb 2022 19:32:37 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Feb 2022 18:32:10 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 14 Feb 2022 10:32:09 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Feb 2022 10:32:09 +0800
Message-ID: <9295cbd918d1303f5cc2bbb7defb94d5e338606d.camel@mediatek.com>
Subject: Re: [0/3] Cooperate with DSI RX devices to modify dsi funcs and
 delay mipi high to cooperate with panel sequence
From: CK Hu <ck.hu@mediatek.com>
To: <xinlei.lee@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <rex-bc.chen@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 14 Feb 2022 10:32:09 +0800
In-Reply-To: <1644589818-13066-1-git-send-email-xinlei.lee@mediatek.com>
References: <1644589818-13066-1-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220213_183243_185884_79E1011C 
X-CRM114-Status: GOOD (  10.76  )
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

Hi, Xinlei:

On Fri, 2022-02-11 at 22:30 +0800, xinlei.lee@mediatek.com wrote:
> From: xinlei lee <xinlei.lee@mediatek.com>
> 
> In order to match the changes of DSI RX devices (for example,
> anx7625), 
> the poweron/poweroff of dsi is extracted from enable/disable and 
> defined as new funcs (pre_enable/post_disable).
> 
> The delayed MIPI signal is pulled high from LP00 to LP11, 
> in order to match the power-on sequence of the panel.

This is series a bug-fix or new feature (If anx7625 has never work in
upstream and this series would make support anx7625, this is new
feature) If this is a bug-fix, add Fixes tag [1] in patches.

[1] 
https://www.kernel.org/doc/html/v5.16/process/submitting-patches.html

Regards,
CK

> 
> Jitao Shi (3):
>   drm/mediatek: dsi fine tune the dsi poweron flow
>   drm/mediatek: dsi bridge implement pre_enable and post_disable
>   drm/mediatek: keep dsi as LP00 before dcs cmds transfer
> 
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 73 +++++++++++++++++++++++++---
> ----------
>  1 file changed, 49 insertions(+), 24 deletions(-)
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
