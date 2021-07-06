Return-Path: <SRS0=SroS=L6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4513EC07E96
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 09:55:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3690619A0
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 09:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3690619A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p6lx9gzTSx1fye1kmpkQS/IA55FwUPLqt0n2u4JeFLw=; b=REFigCncwayM70
	aFArw3wSPL1TUkiHoS8ABBUVnsgy+DEjPkCXtPn26BDoloO3UiHviwhGfgqvGQ+NWdjl1K4tFWlSh
	vkS/u/Hqi7sfW+mBHLV1q/iQ1x4pe9swsXBfJmlWkCSejcuLY6GDpx6CIWWvTmq2GhdQ46Bx0pMAZ
	G/gxxN1dFHLo2cviQZRQT9iGnmJJq7OIBlPhcRb/QV8oC5oAyPIvqOa8qVx4FahE6yo4WEhLWSnjX
	yT7lPgiu+Wj2vYodat9TW3YgmbQpkyeLMJwdDs4jTHE0WKJ/9eZlA1bSdLywCNgP3F7U+gcrx63YV
	USO7ZHzFi0b5roL/rXpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0hnC-00AwNW-D5; Tue, 06 Jul 2021 09:55:02 +0000
Received: from mout.gmx.net ([212.227.15.15])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0hn8-00AwKr-Hx
 for linux-mediatek@lists.infradead.org; Tue, 06 Jul 2021 09:55:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1625565279;
 bh=HfI1fnAl8yXB7R6zw/6uGgLzJrfs1z8CTgu8YasTu8A=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=MSlfUBxlZvS9mg5TyrL+qgBsEYkpw4pJrf77rmAC5efOCMZRz1SimhrVBzBlfzexm
 N0Vc0qlII3AwMyvyBydEaA3hHmZZ80sWLMbCshTfUFT2bI7V4ONGaTvyKJb0bgLnFS
 7MBKVYOKio+OM1q8fonyXBi4c68oVIXrGC7TcR/c=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.245.79.159] ([80.245.79.159]) by web-mail.gmx.net
 (3c-app-gmx-bs60.server.lan [172.19.170.144]) (via HTTP); Tue, 6 Jul 2021
 11:54:39 +0200
MIME-Version: 1.0
Message-ID: <trinity-cc8f5927-9aaf-43ae-a107-6a6229f1b481-1625565279264@3c-app-gmx-bs60>
From: Frank Wunderlich <frank-w@public-files.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, linux-mediatek@lists.infradead.org, Matthias
 Brugger <matthias.bgg@gmail.com>
Subject: BUG: MTK DRM/HDMI broken on 5.13 (mt7623/bpi-r2)
Date: Tue, 6 Jul 2021 11:54:39 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:OoEQiM/tnR+cNPyCdrhP49bAjgvwQ+lcL2OS2XXYultpQRZ3iKmx2n0JXV3n3Fd/VHVP9
 URFMBbMlD29B8YWbPuG94J3F5zWccIqeUBT1b3/QLw7EcLA1JrI3PjO+FQx3imeyC8zgfU+KOerU
 SBvcaufgt9H7rbyrAH7vebZLBS9lGqXs77pGRfMkntQEsAfeL8lO7PqFYuVKbfqsm2saOSxPGiZz
 1ywjhxyBlAPnO/j9ixwng5+18VP/dFCoD3JyS/5IHrvnwd1vKJnHRUax54UOu+AonufbuKYhQFcx
 Nc=
X-UI-Out-Filterresults: notjunk:1;V03:K0:NiH7UObdIF4=:Bg0EwcLfhCF2bM3KUv6JSd
 Q39d+oRzZNlz2GzCi6t2BMIrQIiPhiBUPc+0wnnrteIX6OuFa45YuJBgPrfIBXx6tguKBCp49
 TGWem2GBYxZzGvsBFmWJaAF+PZ1qESJlVy8Erlqquwecq4q5ec2f4NZHwL+6bXn6MQh94FTb/
 7VCcOdZyhkZO12oi2vioRCcbwlqJBQt93keYwD5q9PXa8u2ES4hzaLLkfRKigJffBXop14S7w
 ndcMLVDhRQ7RoEmE0z2jLSVoHqogiW4s/4lx5h2SfSX4GjxKOZYcdan9jjHgyljizL6ZqnSHk
 vwlmTHtLChPXl7RdigxxPSyrmPsUH0CaPXY2O6i1obnMglJjNTehzP28kTKvH7KgE/1YGNe5F
 Shf/BUgVaLsdnU239JwpE7RIaZI5legkv8qnx5icFi/uZL0oXWHIzGkkV2uWeXE6JvcX/HV71
 0q1qoLQb/ONFD9IFKO1+L0UDKuymVbAOXZAOxqvYXYXL4NhSMFA4aNdoAc+oqZmqdzzsJMnuS
 jkrlfwdVRbCwremdvuZFG1yW6qXDPaIT/LV9PRnZR9a5GXNhcCZsf/nWPPbcw8C81mY+5EMB0
 G87A0GZyvJboKu0tRvYvq71SZ4cDqgxutnJA5PwydKQbCxKiS75ao4pj7Hy78hw2KYOe1041Z
 kEJQh3d7E+fMzyvRIHjiTrdZrFlFt02GNS+gu9Tvot+F/VfteqJIdJkTFVu8T5NP7KR6wj+oY
 nkDj8u7qnn14WAyEqge63SRfsb/Yx6NNhTzlhkAoCTUHv8qr31k9Hcqpg/LhlnIrLwcqOm8I9
 uk9Inzb0MBA89p4qj/3aVdcWSy1ZeHIldpXz6EqZ4EWd1qPCV8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_025458_985835_BE20D7BE 
X-CRM114-Status: UNSURE (   9.21  )
X-CRM114-Notice: Please train this message.
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

Hi,

i've noticed that HDMI is broken at least on my board (Bananapi-r2,mt7623) on 5.13.

after some research i noticed that it is working till

commit 2e477391522354e763aa62ee3e281c1ad9e8eb1b
Author: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Date:   Tue Mar 30 13:09:02 2021 +0200

    drm/mediatek: Don't support hdmi connector creation


which is the last of mtk-drm-next-5.13 [1] so i guess a problem with core-patches

dmesg shows the following:

[    7.071342] mediatek-drm mediatek-drm.1.auto: bound 14007000.ovl (ops mtk_dis
p_ovl_component_ops)
[    7.080330] mediatek-drm mediatek-drm.1.auto: bound 14008000.rdma (ops mtk_di
sp_rdma_component_ops)
[    7.089429] mediatek-drm mediatek-drm.1.auto: bound 1400b000.color (ops mtk_d
isp_color_component_ops)
[    7.098689] mediatek-drm mediatek-drm.1.auto: bound 14012000.rdma (ops mtk_di
sp_rdma_component_ops)
[    7.107814] mediatek-drm mediatek-drm.1.auto: bound 14014000.dpi (ops mtk_dpi
_component_ops)
[    7.116338] mediatek-drm mediatek-drm.1.auto: Not creating crtc 1 because com
ponent 9 is disabled or missing
....
[   38.403957] Console: switching to colour frame buffer device 160x64
[   48.516398] [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
[   48.516422] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CRTC:41:cr
tc-0] commit wait timed out
[   58.756384] [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
[   58.756399] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CONNECTOR:
32:HDMI-A-1] commit wait timed out
[   68.996384] [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
[   68.996399] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [PLANE:33:p
lane-0] commit wait timed out
[   68.996423] [drm:mtk_drm_crtc_atomic_begin] *ERROR* new event while there is
still a pending event
[   69.106385] ------------[ cut here ]------------
[   69.106392] WARNING: CPU: 2 PID: 7 at drivers/gpu/drm/drm_atomic_helper.c:151
1 drm_atomic_helper_wait_for_vblanks.part.0+0x2a0/0x2a8
[   69.106414] [CRTC:41:crtc-0] vblank wait timed out

so i guess the breaking commit may be this:

$ git logone -S"drm_crtc_commit_wait" -- drivers/gpu/drm/
b99c2c95412c 2021-01-11 drm: Introduce a drm_crtc_commit_wait helper

in drivers/gpu/drm/drm_atomic{,_helper}.c

but i cannot confirm it because my git bisect does strange things (after defining 5.13 as bad and the 2e4773915223 as good, second step is before the good commit till the end, last steps are 5.11...). sorry, i'm still new to bisect.

the fix is targeting to 5.12-rc2, is guess because CK Hu's tree is based on this...but the fix was not included in 5.12-rc2 (only after 5.12.0...got it by merging 5.12.14)

maybe you can help me?

regards Frank

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-next-5.13

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
