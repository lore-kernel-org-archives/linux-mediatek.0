Return-Path: <SRS0=ooiB=MA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F427C07E96
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 09:35:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C916C61446
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 09:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C916C61446
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zKPm1caf3OVCLFi7Dts236nYwmyRgn0anaGUG0ZYWQA=; b=wEAKFPGJuxuF33
	d0/JVd0oQ90ZpgLDtHzIxVPN4nFhvcVvmdMkz5tWQZtgCelvIaflUO0oymjMDhK9J0WevJ/ykH6Eb
	uLfWm8HXoKx8UsKR+sizqpQf8BKgk+ILsN+X385SNqaGCncQ/JttdgmyWR4sT6GobkNTsxMc0gTrC
	xA28l3wLJ26+PqFuLmrUucxJ/l436S2XZfvU84YkUqt1vuQAjj5Mo3MYzBNCUdtSCJ8vtq3qIREiT
	hsjXNe/R9BgNeaafQBos9k7UzecxhC98zmvJTnYoKH/QBIarZyeZIEQQ26lm4VdEFW5tdzjuZbmbX
	U0cJGKWPSUc7avtFIrgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1QRR-00GTsU-Mk; Thu, 08 Jul 2021 09:35:33 +0000
Received: from mout.gmx.net ([212.227.17.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1QRM-00GTpJ-Uo
 for linux-mediatek@lists.infradead.org; Thu, 08 Jul 2021 09:35:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1625736911;
 bh=c5Q2FsPdojCP6Bswqmw6Exz/MdxfLETzLExQXTGx8lE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=DPIQo/8gASI330Cx4yxfanb/dLuuKy32ZiCxm7AfbHVW+8wJ9n7H0rhfTwwfg3t4J
 hMBEpU/GjJPD9xo6OxXEUfDhlBp7BHBzHjDwQMWXy0Pxb1xWnI2xyuleEOW9qB6ROu
 X/2HjFBnvc2T53ULK2eODdX47MIIxwGDhuEprAYs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.147.159] ([217.61.147.159]) by web-mail.gmx.net
 (3c-app-gmx-bap19.server.lan [172.19.172.89]) (via HTTP); Thu, 8 Jul 2021
 11:35:11 +0200
MIME-Version: 1.0
Message-ID: <trinity-e6443313-a436-4e9d-a93c-1bef1cce135d-1625736911475@3c-app-gmx-bap19>
From: Frank Wunderlich <frank-w@public-files.de>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Chun-Kuang
 Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-mediatek@lists.infradead.org, Matthias Brugger
 <matthias.bgg@gmail.com>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, Collabora Kernel ML <kernel@collabora.com>
Subject: Aw: Re: BUG: MTK DRM/HDMI broken on 5.13 (mt7623/bpi-r2)
Date: Thu, 8 Jul 2021 11:35:11 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <25d61873-38ae-5648-faab-03431b74f777@collabora.com>
References: <trinity-cc8f5927-9aaf-43ae-a107-6a6229f1b481-1625565279264@3c-app-gmx-bs60>
 <25d61873-38ae-5648-faab-03431b74f777@collabora.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:a8dv+hSeSfNIo9WHqQ6TEcfo1UipGqirY6lIuH/V1gbgDJORXHn5hHNNXLWniRtJbNTLu
 aGex8DbBZasYA8GYzz/ZM0s9eXbHWUGIMyIkDoTxl06Ty/bdS0WJv+xHi1+lL6bLh67j82kwnMoS
 GWyKcvKzxBHdJZJNvdd9eCiy3dLJ7IqC2c72LWEERvcAna9R/82v9+G+1FBpRsn+/hnFYYjg8mqv
 RgYpIV2BliDoyISDLTtcIGmjIYLdDBhKLM2sWRFOtqBTq/hYUDpMzFHy2N9QBVSsd6h8ZH9zzgzp
 MY=
X-UI-Out-Filterresults: notjunk:1;V03:K0:M3vMpT3BFSc=:F/NKhlmrjYTuX834cBuZSo
 /BanSKuY8fpmxKAagAm9NG8vCZPyC/M9fVcoT85cSt89htL8cxKXbQeLGzpzxhGG9uxWEaxm8
 lcSt0A5k62SN8NDetwDu3at51lwmz/C8wPSXxU9Bx9q59qw60VAFNVxCbN9SHu9nF3TRPBoeN
 PLz7ltPfU9MerD80aSyJGIbnU/SlsNcTkcv4Sf3YFX26hQNehXG3UDphturrtZlQ52tob1AUR
 QeW7IT7ZTkIFiGxbhfT8CTHJ/zH7icMdKyLpzjDanewiRa7Lklwd8R/JQ28+tVUTdqKcy52VU
 g7Rop1R3uCX5wB4RveqrWMaWWPkJtjHuPOHIiatn4roGlCE8dHRY3sXu+z01oQQhqPtueobnu
 fOZP0JjJC4v2bpAH2mlgFRUwjkO6Sa1aiLtBaQGx/i4LcEGQp8XCOuo2FE5Jk9fDBIHvHYsow
 DyTuwV8r7Ps5FfA4aKggVIRhNJyS4mZ2YTXfFS853u/UkQLkn/UxmcnDULMzyj71ofulrH+3y
 MfdFWWSle0MEJEBgMrVqraAlca0fcP1faVusLssJxo2GwdO923SjePkHREQd3IYbgaftEqd22
 oe10T4ekFHxOaTLSK05J+rXOF+iWHgXNRLYOnmmGt9uMbM1vn7XetAGEPTfDzxiU+1V0ZOJk+
 U4Fq6F8c6fnpjX2jIRkhWflLULW96hABhk0cUVPQeTa1Kuie4W0y59jhqICUeKm+ladspcg+B
 wlYHszc6Ihq8ajNbXfRj/4opJ5V0OkxQSntQKfY0JfoHAM8vca4Q/HQLR5OrF0H+h/zx2JyYl
 qcy47vRVCEJAagEhgsLYA6IgCtvpXLWJLJaW74ECs+fNuh/Re4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_023529_358484_B0415234 
X-CRM114-Status: GOOD (  20.03  )
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

Hi

just a small update, added debug in the vendor-specific functions for page_flip and vblank and it seems they never get called

--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -87,21 +87,25 @@ static void mtk_drm_crtc_finish_page_flip(struct mtk_drm_crtc *mtk_crtc)
 {
        struct drm_crtc *crtc = &mtk_crtc->base;
        unsigned long flags;
-
+printk(KERN_ALERT "DEBUG: Passed %s %d \n",__FUNCTION__,__LINE__);
        spin_lock_irqsave(&crtc->dev->event_lock, flags);
        drm_crtc_send_vblank_event(crtc, mtk_crtc->event);
        drm_crtc_vblank_put(crtc);
        mtk_crtc->event = NULL;
        spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+printk(KERN_ALERT "DEBUG: Passed %s %d \n",__FUNCTION__,__LINE__);
 }

 static void mtk_drm_finish_page_flip(struct mtk_drm_crtc *mtk_crtc)
 {
+printk(KERN_ALERT "DEBUG: Passed %s %d update:%d,needsvblank:%d\n",__FUNCTION__,__LINE__,mtk_crtc->config_updating,mtk_crtc->pending_needs_vblank);
        drm_crtc_handle_vblank(&mtk_crtc->base);
        if (!mtk_crtc->config_updating && mtk_crtc->pending_needs_vblank) {
+printk(KERN_ALERT "DEBUG: Passed %s %d \n",__FUNCTION__,__LINE__);
                mtk_drm_crtc_finish_page_flip(mtk_crtc);
                mtk_crtc->pending_needs_vblank = false;
        }
+printk(KERN_ALERT "DEBUG: Passed %s %d \n",__FUNCTION__,__LINE__);
 }

 static void mtk_drm_crtc_destroy(struct drm_crtc *crtc)

finish_page_flip is called by mtk_crtc_ddp_irq. this seems to be set in mtk_drm_crtc_enable_vblank with mtk_ddp_comp_enable_vblank. this is called correctly

113 static inline void mtk_ddp_comp_enable_vblank(struct mtk_ddp_comp *comp,
114                           void (*vblank_cb)(void *),
115                           void *vblank_cb_data)
116 {
117 printk(KERN_ALERT "DEBUG: Passed %s %d \n",__FUNCTION__,__LINE__);
118     if (comp->funcs && comp->funcs->enable_vblank)
119     {
120         comp->funcs->enable_vblank(comp->dev, vblank_cb, vblank_cb_data);
121 printk(KERN_ALERT "DEBUG: Passed %s %d \n",__FUNCTION__,__LINE__);
122     }
123 }

i see both messages, but mtk_crtc_ddp_irq is never called and so the other 2 not.

root@bpi-r2:~# dmesg | grep -i DEBUG
[    6.433509] DEBUG: Passed mtk_drm_crtc_enable_vblank 510
[    6.433530] DEBUG: Passed mtk_ddp_comp_enable_vblank 117
[    6.433537] DEBUG: Passed mtk_ddp_comp_enable_vblank 121 <<<


comp->funcs->enable_vblank should be mtk_drm_crtc_enable_vblank, right?

641 static const struct drm_crtc_funcs mtk_crtc_funcs = {
642     .set_config     = drm_atomic_helper_set_config,
643     .page_flip      = drm_atomic_helper_page_flip,
644     .destroy        = mtk_drm_crtc_destroy,
645     .reset          = mtk_drm_crtc_reset,
646     .atomic_duplicate_state = mtk_drm_crtc_duplicate_state,
647     .atomic_destroy_state   = mtk_drm_crtc_destroy_state,
648     .enable_vblank      = mtk_drm_crtc_enable_vblank, <<<<<<<
649     .disable_vblank     = mtk_drm_crtc_disable_vblank,
650 };

but it looks like a recursion:
mtk_drm_crtc_enable_vblank calls mtk_ddp_comp_enable_vblank => enable_vblank (=mtk_drm_crtc_enable_vblank), but i see the messages not repeating

mtk_drm_crtc_enable_vblank(struct drm_crtc *crtc)
511     mtk_ddp_comp_enable_vblank(comp, mtk_crtc_ddp_irq, &mtk_crtc->base);

113 static inline void mtk_ddp_comp_enable_vblank(struct mtk_ddp_comp *comp,
114                           void (*vblank_cb)(void *),
115                           void *vblank_cb_data)
116 {
118     if (comp->funcs && comp->funcs->enable_vblank)
120         comp->funcs->enable_vblank(comp->dev, vblank_cb, vblank_cb_data);

but params do not match...comp->funcs->enable_vblank takes 3 arguments but comp->funcs->enable_vblank has only one.something i miss here...

i guess not, but is watchdog somehow involved? i ask because i see this on reboot/poweroff:

"watchdog: watchdog0: watchdog did not stop!"

i see this with my 5.13, 5.12-drm (5.12.0+mtk/core drm-patches) and 5.12.14 too (hdmi is working there), but not 5.12.0!
that means something in drm-patches (mtk/core) breaks watchdog. maybe the recursion mentioned above?

regards Frank


> Gesendet: Donnerstag, 08. Juli 2021 um 09:22 Uhr
> Von: "Dafna Hirschfeld" <dafna.hirschfeld@collabora.com>

>
> Hi Frank,
>
>
> On 06.07.21 11:54, Frank Wunderlich wrote:
> > Hi,
> >
> > i've noticed that HDMI is broken at least on my board (Bananapi-r2,mt7623) on 5.13.
> >
> > after some research i noticed that it is working till
> >
> > commit 2e477391522354e763aa62ee3e281c1ad9e8eb1b
> > Author: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

>
> We also encountered that warning on mt8173 device - Acer Chromebook R13. It happen after resuming from suspend to ram.
> We could not find a version that works and we were not able to find the fix of the bug.
> It seems like the irq isr is not called after resuming from suspend.
> Please share if you have new findings regarding that bug.
>
> Thanks,
> Dafna


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
