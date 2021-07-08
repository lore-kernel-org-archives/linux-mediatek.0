Return-Path: <SRS0=ooiB=MA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27E1EC07E96
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 07:22:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE38261CDF
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 07:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE38261CDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/P9t/nie23c7z2x3z31tTz9g7yTqE4bcPUrEuWP7Z1Q=; b=xk1EWpeMVbPD8pl0T0quGdMRvP
	v1fz/j/2p9mzUjGe7suLyd01Hx2YRKbW0c+aY8XigVO4GeN5ubYjwpMpDkNFPHyqGacLJYt5ebyFa
	HQnyvNhb2cbuOcy0ulIdyQNvEJxnd4OQdOYYSXvFrpEim56I1Q5hdPfSGH1xnVHJFSxo1kk6KPQe5
	CvCrYuyTQ6/BaSC80XZpLMSx7XK93o+M6eLUODwSfa7ohH/3+TIEsptI0ebdXtoGeztjL9JhdZO8t
	DbawifN5To0J8oaE874QVIkIU7fPGZBhJTtNCUdGxskXDqShMhBA5Irs60erRI18HpI/5jbAcIrDp
	T2pegHrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1OMc-00GBzD-34; Thu, 08 Jul 2021 07:22:26 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1OMY-00GBxf-9y
 for linux-mediatek@lists.infradead.org; Thu, 08 Jul 2021 07:22:24 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dafna) with ESMTPSA id 1F3F31F437E4
Subject: Re: BUG: MTK DRM/HDMI broken on 5.13 (mt7623/bpi-r2)
To: Frank Wunderlich <frank-w@public-files.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Collabora Kernel ML <kernel@collabora.com>
References: <trinity-cc8f5927-9aaf-43ae-a107-6a6229f1b481-1625565279264@3c-app-gmx-bs60>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <25d61873-38ae-5648-faab-03431b74f777@collabora.com>
Date: Thu, 8 Jul 2021 09:22:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <trinity-cc8f5927-9aaf-43ae-a107-6a6229f1b481-1625565279264@3c-app-gmx-bs60>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_002222_504712_55B16A73 
X-CRM114-Status: GOOD (  25.75  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Frank,


On 06.07.21 11:54, Frank Wunderlich wrote:
> Hi,
> 
> i've noticed that HDMI is broken at least on my board (Bananapi-r2,mt7623) on 5.13.
> 
> after some research i noticed that it is working till
> 
> commit 2e477391522354e763aa62ee3e281c1ad9e8eb1b
> Author: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Date:   Tue Mar 30 13:09:02 2021 +0200
> 
>      drm/mediatek: Don't support hdmi connector creation
> 
> 
> which is the last of mtk-drm-next-5.13 [1] so i guess a problem with core-patches
> 
> dmesg shows the following:
> 
> [    7.071342] mediatek-drm mediatek-drm.1.auto: bound 14007000.ovl (ops mtk_dis
> p_ovl_component_ops)
> [    7.080330] mediatek-drm mediatek-drm.1.auto: bound 14008000.rdma (ops mtk_di
> sp_rdma_component_ops)
> [    7.089429] mediatek-drm mediatek-drm.1.auto: bound 1400b000.color (ops mtk_d
> isp_color_component_ops)
> [    7.098689] mediatek-drm mediatek-drm.1.auto: bound 14012000.rdma (ops mtk_di
> sp_rdma_component_ops)
> [    7.107814] mediatek-drm mediatek-drm.1.auto: bound 14014000.dpi (ops mtk_dpi
> _component_ops)
> [    7.116338] mediatek-drm mediatek-drm.1.auto: Not creating crtc 1 because com
> ponent 9 is disabled or missing
> ....
> [   38.403957] Console: switching to colour frame buffer device 160x64
> [   48.516398] [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
> [   48.516422] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CRTC:41:cr
> tc-0] commit wait timed out
> [   58.756384] [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
> [   58.756399] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CONNECTOR:
> 32:HDMI-A-1] commit wait timed out
> [   68.996384] [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
> [   68.996399] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [PLANE:33:p
> lane-0] commit wait timed out
> [   68.996423] [drm:mtk_drm_crtc_atomic_begin] *ERROR* new event while there is
> still a pending event
> [   69.106385] ------------[ cut here ]------------
> [   69.106392] WARNING: CPU: 2 PID: 7 at drivers/gpu/drm/drm_atomic_helper.c:151
> 1 drm_atomic_helper_wait_for_vblanks.part.0+0x2a0/0x2a8
> [   69.106414] [CRTC:41:crtc-0] vblank wait timed out

We also encountered that warning on mt8173 device - Acer Chromebook R13. It happen after resuming from suspend to ram.
We could not find a version that works and we were not able to find the fix of the bug.
It seems like the irq isr is not called after resuming from suspend.
Please share if you have new findings regarding that bug.

Thanks,
Dafna


> 
> so i guess the breaking commit may be this:
> 
> $ git logone -S"drm_crtc_commit_wait" -- drivers/gpu/drm/
> b99c2c95412c 2021-01-11 drm: Introduce a drm_crtc_commit_wait helper
> 
> in drivers/gpu/drm/drm_atomic{,_helper}.c
> 
> but i cannot confirm it because my git bisect does strange things (after defining 5.13 as bad and the 2e4773915223 as good, second step is before the good commit till the end, last steps are 5.11...). sorry, i'm still new to bisect.
> 
> the fix is targeting to 5.12-rc2, is guess because CK Hu's tree is based on this...but the fix was not included in 5.12-rc2 (only after 5.12.0...got it by merging 5.12.14)
> 
> maybe you can help me?
> 
> regards Frank
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-next-5.13
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
