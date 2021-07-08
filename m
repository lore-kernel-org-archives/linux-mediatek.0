Return-Path: <SRS0=ooiB=MA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C38C07E96
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 12:31:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 723E2613B2
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 12:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 723E2613B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EVB+PChz1zyh77mT4UQ9FMktLTVW/31gaonzt2t0jbY=; b=WOIkQosGR8G3WkOJMbTt+Vk+Gj
	FinFDTiY75A7cyPM0LZqijGOGfVRGp4sTMBHUe6rkE40Zsn0m7MFHfjqU28GlGKUi7J23Lz9SqAB4
	zSb104pk2m3BIZITdEutI89PrHi9ZEXsNjaafq6ZIgSmEtBy2qGOSy3UK/PcRtsazWhVk9HrOaUHn
	Iv/oelJYOGdbxW49XJdYW0oo/PfJmD6DO1bZTePpW7G8XjztwcLVIpEVmjs93t83jCwitsFhKU/ih
	GZ0fjOE3Hy+457sfZSrNeybTUSk8g+wZKOTf2girRD97bujG+e2Eiggqk4/q1WiQ/H6eCVJFAxFHH
	omAPkEew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1TBC-00GtIu-66; Thu, 08 Jul 2021 12:30:58 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1TB8-00GtHP-Qz
 for linux-mediatek@lists.infradead.org; Thu, 08 Jul 2021 12:30:56 +0000
Received: from [IPv6:2a02:810a:880:f54:e8eb:1d02:4dd8:a76b] (unknown
 [IPv6:2a02:810a:880:f54:e8eb:1d02:4dd8:a76b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AAF981F43B8D;
 Thu,  8 Jul 2021 13:30:50 +0100 (BST)
Subject: Re: Aw: Re: BUG: MTK DRM/HDMI broken on 5.13 (mt7623/bpi-r2)
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger
 <matthias.bgg@gmail.com>, Collabora Kernel ML <kernel@collabora.com>
References: <trinity-cc8f5927-9aaf-43ae-a107-6a6229f1b481-1625565279264@3c-app-gmx-bs60>
 <25d61873-38ae-5648-faab-03431b74f777@collabora.com>
 <trinity-e6443313-a436-4e9d-a93c-1bef1cce135d-1625736911475@3c-app-gmx-bap19>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <df431199-0c65-fb9a-02b4-9f84899f37ee@collabora.com>
Date: Thu, 8 Jul 2021 14:30:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <trinity-e6443313-a436-4e9d-a93c-1bef1cce135d-1625736911475@3c-app-gmx-bap19>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_053055_195543_E5B98C48 
X-CRM114-Status: GOOD (  29.97  )
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

Hi

On 08.07.21 11:35, Frank Wunderlich wrote:
> Hi
> 
> just a small update, added debug in the vendor-specific functions for page_flip and vblank and it seems they never get called
> 
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -87,21 +87,25 @@ static void mtk_drm_crtc_finish_page_flip(struct mtk_drm_crtc *mtk_crtc)
>   {
>          struct drm_crtc *crtc = &mtk_crtc->base;
>          unsigned long flags;
> -
> +printk(KERN_ALERT "DEBUG: Passed %s %d \n",__FUNCTION__,__LINE__);
>          spin_lock_irqsave(&crtc->dev->event_lock, flags);
>          drm_crtc_send_vblank_event(crtc, mtk_crtc->event);
>          drm_crtc_vblank_put(crtc);
>          mtk_crtc->event = NULL;
>          spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
> +printk(KERN_ALERT "DEBUG: Passed %s %d \n",__FUNCTION__,__LINE__);
>   }
> 
>   static void mtk_drm_finish_page_flip(struct mtk_drm_crtc *mtk_crtc)
>   {
> +printk(KERN_ALERT "DEBUG: Passed %s %d update:%d,needsvblank:%d\n",__FUNCTION__,__LINE__,mtk_crtc->config_updating,mtk_crtc->pending_needs_vblank);
>          drm_crtc_handle_vblank(&mtk_crtc->base);
>          if (!mtk_crtc->config_updating && mtk_crtc->pending_needs_vblank) {
> +printk(KERN_ALERT "DEBUG: Passed %s %d \n",__FUNCTION__,__LINE__);
>                  mtk_drm_crtc_finish_page_flip(mtk_crtc);
>                  mtk_crtc->pending_needs_vblank = false;
>          }
> +printk(KERN_ALERT "DEBUG: Passed %s %d \n",__FUNCTION__,__LINE__);
>   }
> 
>   static void mtk_drm_crtc_destroy(struct drm_crtc *crtc)
> 
> finish_page_flip is called by mtk_crtc_ddp_irq. this seems to be set in mtk_drm_crtc_enable_vblank with mtk_ddp_comp_enable_vblank. this is called correctly
> 
> 113 static inline void mtk_ddp_comp_enable_vblank(struct mtk_ddp_comp *comp,
> 114                           void (*vblank_cb)(void *),
> 115                           void *vblank_cb_data)
> 116 {
> 117 printk(KERN_ALERT "DEBUG: Passed %s %d \n",__FUNCTION__,__LINE__);
> 118     if (comp->funcs && comp->funcs->enable_vblank)
> 119     {
> 120         comp->funcs->enable_vblank(comp->dev, vblank_cb, vblank_cb_data);
> 121 printk(KERN_ALERT "DEBUG: Passed %s %d \n",__FUNCTION__,__LINE__);
> 122     }
> 123 }
> 
> i see both messages, but mtk_crtc_ddp_irq is never called and so the other 2 not.

Yes, In my case the irq isr is also not called after resume which cause the warning
even though "enable_vblank" do get called. Don't know why is that.

> 
> root@bpi-r2:~# dmesg | grep -i DEBUG
> [    6.433509] DEBUG: Passed mtk_drm_crtc_enable_vblank 510
> [    6.433530] DEBUG: Passed mtk_ddp_comp_enable_vblank 117
> [    6.433537] DEBUG: Passed mtk_ddp_comp_enable_vblank 121 <<<
> 
> 
> comp->funcs->enable_vblank should be mtk_drm_crtc_enable_vblank, right?

No, this is a bit confusing , there are also the funcs of the components, see in file mtk_drm_ddp_comp.c
so for mt7623  it is mtk_ovl_enable_vblank.

Thanks,
Dafna

> 
> 641 static const struct drm_crtc_funcs mtk_crtc_funcs = {
> 642     .set_config     = drm_atomic_helper_set_config,
> 643     .page_flip      = drm_atomic_helper_page_flip,
> 644     .destroy        = mtk_drm_crtc_destroy,
> 645     .reset          = mtk_drm_crtc_reset,
> 646     .atomic_duplicate_state = mtk_drm_crtc_duplicate_state,
> 647     .atomic_destroy_state   = mtk_drm_crtc_destroy_state,
> 648     .enable_vblank      = mtk_drm_crtc_enable_vblank, <<<<<<<
> 649     .disable_vblank     = mtk_drm_crtc_disable_vblank,
> 650 };
> 
> but it looks like a recursion:
> mtk_drm_crtc_enable_vblank calls mtk_ddp_comp_enable_vblank => enable_vblank (=mtk_drm_crtc_enable_vblank), but i see the messages not repeating
> 
> mtk_drm_crtc_enable_vblank(struct drm_crtc *crtc)
> 511     mtk_ddp_comp_enable_vblank(comp, mtk_crtc_ddp_irq, &mtk_crtc->base);
> 
> 113 static inline void mtk_ddp_comp_enable_vblank(struct mtk_ddp_comp *comp,
> 114                           void (*vblank_cb)(void *),
> 115                           void *vblank_cb_data)
> 116 {
> 118     if (comp->funcs && comp->funcs->enable_vblank)
> 120         comp->funcs->enable_vblank(comp->dev, vblank_cb, vblank_cb_data);
> 
> but params do not match...comp->funcs->enable_vblank takes 3 arguments but comp->funcs->enable_vblank has only one.something i miss here...
> 
> i guess not, but is watchdog somehow involved? i ask because i see this on reboot/poweroff:
> 
> "watchdog: watchdog0: watchdog did not stop!"
> 
> i see this with my 5.13, 5.12-drm (5.12.0+mtk/core drm-patches) and 5.12.14 too (hdmi is working there), but not 5.12.0!
> that means something in drm-patches (mtk/core) breaks watchdog. maybe the recursion mentioned above?
> 
> regards Frank
> 
> 
>> Gesendet: Donnerstag, 08. Juli 2021 um 09:22 Uhr
>> Von: "Dafna Hirschfeld" <dafna.hirschfeld@collabora.com>
> 
>>
>> Hi Frank,
>>
>>
>> On 06.07.21 11:54, Frank Wunderlich wrote:
>>> Hi,
>>>
>>> i've noticed that HDMI is broken at least on my board (Bananapi-r2,mt7623) on 5.13.
>>>
>>> after some research i noticed that it is working till
>>>
>>> commit 2e477391522354e763aa62ee3e281c1ad9e8eb1b
>>> Author: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> 
>>
>> We also encountered that warning on mt8173 device - Acer Chromebook R13. It happen after resuming from suspend to ram.
>> We could not find a version that works and we were not able to find the fix of the bug.
>> It seems like the irq isr is not called after resuming from suspend.
>> Please share if you have new findings regarding that bug.
>>
>> Thanks,
>> Dafna
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
