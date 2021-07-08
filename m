Return-Path: <SRS0=ooiB=MA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3643AC07E96
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 14:01:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0156361459
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 14:01:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0156361459
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IZNAqZhCn+rxrKiAq+qr9xFlNwd3w6q2zLK1ef6ZZFE=; b=kZORth0d8KDJZ5
	1u6HoqhpSWeZLhjbopkTekuWi68UAqY0+THI3EIi1wJhvPedaT3gtRaV33oZSUDmoVLW/fVVCY3N4
	avlSSwJNWkhNxetxfqEimQcx1mRFAPM4GC4fzWyp62fWAeEW1KdYvgrNDZaxBtlaqAGctPvFMh6sz
	k37r4TCQEPkNeuiRg/2AfQqf6mgbc6E40DUhtIliKREkPOMaTaTYLS6eqIgJP64lk2nretpR2F8jp
	zQOwkJrYsoV7sPdFyYmqsPPJOa+IFsoG6IJnesrN/uCU70hleOT6lKFH/6iqW20WvVVyxSVKJaNDy
	eZLGO17VQXRyjU7NDVgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1Uan-00H9qL-E6; Thu, 08 Jul 2021 14:01:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1Ual-00H9pn-8M
 for linux-mediatek@bombadil.infradead.org; Thu, 08 Jul 2021 14:01:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:References:
 In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=oJpudRFbLGkwv4kEDr6XLVpi1hpyM7fEt6PI1D4Lzp4=; b=p0zc+PqagXgybeuaZTHPAXbakB
 Pl9qs1s+ueQ1g1PR1eQCsgt0A/7otdDC2lsbRb+rJ+xFY6cGwvoEs2kXN9n0a6fM21kw9/I0wRyuB
 qp26b6wcRvFpjpaw8OwBWwve+cUhwH5KnVmV8kQGxift8Adm0tfP4JxcuFUHXphMZXtFOzb/XtrtJ
 T97E8A5b4XmZ8JDZidH8t5CgqcSl0WHtEV6OmS3CWL1ojZ1u68z2q9c0ToYNMgMVtZsSbGos8ALn0
 vWEIK1TmEdliTsxwiPkeiG54erf/csKvflfMdhDn+JW6QiHiO952xBFAoYSK/mmmoMxOxT/BY3Qb5
 OifeUarw==;
Received: from mout.gmx.net ([212.227.17.20])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1Uae-00Fjn5-US
 for linux-mediatek@lists.infradead.org; Thu, 08 Jul 2021 14:01:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1625752868;
 bh=wJLSJn1hGsIV0cT50m36a3Mvxx5NqHn/rVaA7yriqQ4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=hh7sgOhe6tpcP0zZFu9hYFPRWLbZXF5z6Z4O+MLvpwrmPfUKDH9ZbQWHC0xBijdUU
 MluClb3UbtUj+nMzx7ZUe4ULV01FCu6hEF50FV+6HqJS6s2mjB5eNO2NxFBBwdIrxj
 pGzu6/+TmmEcF0qqJlMjXWFEBmiBQ4KWNFXGlT0o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.147.159] ([217.61.147.159]) by web-mail.gmx.net
 (3c-app-gmx-bap19.server.lan [172.19.172.89]) (via HTTP); Thu, 8 Jul 2021
 16:01:08 +0200
MIME-Version: 1.0
Message-ID: <trinity-4ed3af00-b67c-468b-be4c-1e4b2379eca6-1625752868027@3c-app-gmx-bap19>
From: Frank Wunderlich <frank-w@public-files.de>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Enric
 Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger
 <matthias.bgg@gmail.com>, Collabora Kernel ML <kernel@collabora.com>
Subject: Aw: Re:  Re: BUG: MTK DRM/HDMI broken on 5.13 (mt7623/bpi-r2)
Date: Thu, 8 Jul 2021 16:01:08 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <df431199-0c65-fb9a-02b4-9f84899f37ee@collabora.com>
References: <trinity-cc8f5927-9aaf-43ae-a107-6a6229f1b481-1625565279264@3c-app-gmx-bs60>
 <25d61873-38ae-5648-faab-03431b74f777@collabora.com>
 <trinity-e6443313-a436-4e9d-a93c-1bef1cce135d-1625736911475@3c-app-gmx-bap19>
 <df431199-0c65-fb9a-02b4-9f84899f37ee@collabora.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:8e+4dnkz5HdUeEwQAIbBhX/zyuSBFGQIIRaR0vNHkeVSovxQzS8gZ42XihYzt8dz1/lDa
 S934zUN3XxKxF8jj1GqmJudA8mCZHQghn2OkR/0ufVP5AAYXhKUbvWhVSKsnPVzHNc3aDZ1XBF51
 X6/HOGeSxxcB7LJ5IwugC+QmRsa1/stBj68AkaXAf3muG7aTiQEnVH9YnAIa+moqX5Y05aTqDQKC
 V58CpzCUoNoLbNBrZWNgZqiRSHJpeOmrL0IlPO/6kR2MfJPx0d7ZLGF7Y3VVeDAafVai5sDXq76z
 tM=
X-UI-Out-Filterresults: notjunk:1;V03:K0:Z90GzCAze48=:gvRIenqr4jAzeeWVhzfOQP
 BtPbImyxhCbmc1PxyGIEepLj6KQJsnUfElejdvg0ZzrONhM/pSdfLy+zGVYCiWVeYUapXGVAp
 eSPBsqcZluzjWtS3VxncB7VF7HFbonk1mrJ8+sI4dPepWRedXEX5eCBasCZ6j1y16Q08+aFOr
 pC81vY32oqpUlCyPFQT//U5Lv5JBYw2tLYHlUaOS2zt3nMvdfRyt28z0g68U3DjoCg/r32x5Y
 oj1br4ye4uCkdXjz+A3/Dv+4rrrmwFsPf5Joe2sy2a0Vjb8uhDoDou80sRBORhqhMtGTWW7y0
 r8YJcJ+OrIE7I0fAqHUTWEpWAYFbf5+ojD4MBtC8vNIeCdhX26Joh2kKSL2oBBrcEH1da7fwk
 Z/svvyHUHdeAnAUPZ7KMnrY3LIBwIHoBBdsq3oJyL/J8tSv2cIwtOzPIk+ecFCzW57KLdit2w
 ZH50xC30cXHKRAJkxnxJHHbN6BSvQSclNz8JVkOA4n2vSWRPKAvIL1PukrBHRmSrYCTiGw2Nw
 do5BDKCVAyS11uAvVA4wqVQUvnOT1QzAS3j5cWrua544yC4js4fhKcw+JevcCfrREA/HaY1U0
 6cZMWlfsdbjE87FiNDWYNcWMK3M/z5UnUn8b6RA4d8ojZ5LQF2irFza1F/RHgSKGypExfCGws
 1DLwNXO5QfmHPZY5Gca/F0GfPM+ofgZHJlkM7fUhwTXZP6Pp4qIxkjeGN3HP0ypGny1CwuUaB
 Lzs1EmXkN/fVykD3yc22kNgj9b17cBbPCuKwkKuS0znpyAQprWR70YfDgWwekVNEolmiPHTh0
 LBa/d5xKhbeybEIky5X0wyZ67rbtQj0tVs7Nh/otjmR24mAHhE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_150121_133072_DB9C76F1 
X-CRM114-Status: GOOD (  18.69  )
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

> Gesendet: Donnerstag, 08. Juli 2021 um 14:30 Uhr
> Von: "Dafna Hirschfeld" <dafna.hirschfeld@collabora.com>
> > i see both messages, but mtk_crtc_ddp_irq is never called and so the other 2 not.
>
> Yes, In my case the irq isr is also not called after resume which cause the warning
> even though "enable_vblank" do get called. Don't know why is that.


> > comp->funcs->enable_vblank should be mtk_drm_crtc_enable_vblank, right?
>
> No, this is a bit confusing , there are also the funcs of the components, see in file mtk_drm_ddp_comp.c
> so for mt7623  it is mtk_ovl_enable_vblank.

thanks for pointing to this. in this function another struct is filled with the callback+data, and this callback seems to be called mtk_disp_ovl_irq_handler which name suggests also a irq as trigger

412     ret = devm_request_irq(dev, irq, mtk_disp_ovl_irq_handler,
413                    IRQF_TRIGGER_NONE, dev_name(dev), priv);
414     if (ret < 0) {
415         dev_err(dev, "Failed to request irq %d: %d\n", irq, ret);
416         return ret;
417     }

as i don't see this error in dmesg, i guess the registration was successful. added again some debug and it looks like the interrupt callback (mtk_disp_ovl_irq_handler) is not called

[    5.125002] DEBUG: Passed mtk_disp_ovl_probe 416 int reg:0
[    6.344029] DEBUG: Passed mtk_drm_crtc_enable_vblank 510
[    6.344051] DEBUG: Passed mtk_ddp_comp_enable_vblank 117
[    6.344057] DEBUG: Passed mtk_ovl_enable_vblank 107
[    6.344062] DEBUG: Passed mtk_ovl_enable_vblank 112
[    6.344066] DEBUG: Passed mtk_ddp_comp_enable_vblank 121

--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -86,6 +86,7 @@ static irqreturn_t mtk_disp_ovl_irq_handler(int irq, void *dev_id)
 {
        struct mtk_disp_ovl *priv = dev_id;

+printk(KERN_ALERT "DEBUG: Passed %s %d \n",__FUNCTION__,__LINE__);
        /* Clear frame completion interrupt */
        writel(0x0, priv->regs + DISP_REG_OVL_INTSTA);

@@ -93,6 +94,7 @@ static irqreturn_t mtk_disp_ovl_irq_handler(int irq, void *dev_id)
                return IRQ_NONE;

        priv->vblank_cb(priv->vblank_cb_data);
+printk(KERN_ALERT "DEBUG: Passed %s %d \n",__FUNCTION__,__LINE__);

        return IRQ_HANDLED;
 }
@@ -102,11 +104,12 @@ void mtk_ovl_enable_vblank(struct device *dev,
                           void *vblank_cb_data)
 {
        struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
-
+printk(KERN_ALERT "DEBUG: Passed %s %d \n",__FUNCTION__,__LINE__);
        ovl->vblank_cb = vblank_cb;
        ovl->vblank_cb_data = vblank_cb_data;
        writel(0x0, ovl->regs + DISP_REG_OVL_INTSTA);
        writel_relaxed(OVL_FME_CPL_INT, ovl->regs + DISP_REG_OVL_INTEN);
+printk(KERN_ALERT "DEBUG: Passed %s %d \n",__FUNCTION__,__LINE__);
 }

 void mtk_ovl_disable_vblank(struct device *dev)
@@ -410,6 +413,7 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)

        ret = devm_request_irq(dev, irq, mtk_disp_ovl_irq_handler,
                               IRQF_TRIGGER_NONE, dev_name(dev), priv);
+printk(KERN_ALERT "DEBUG: Passed %s %d int reg:%d\n",__FUNCTION__,__LINE__,ret);
        if (ret < 0) {
                dev_err(dev, "Failed to request irq %d: %d\n", irq, ret);
                return ret;


how can we trace this further? maybe watchdog related?

> >
> > "watchdog: watchdog0: watchdog did not stop!"
> >
> > i see this with my 5.13, 5.12-drm (5.12.0+mtk/core drm-patches) and 5.12.14 too (hdmi is working there), but not 5.12.0!
> > that means something in drm-patches (mtk/core) breaks watchdog. maybe the recursion mentioned above?


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
