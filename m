Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F63FC54E41
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Mar 2024 12:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y0v7RjgmO/yDuWlF3/kTo+sHgoivtGNOWfDVn+nq/Ik=; b=e/rPIFjfuQjx8c8akr0s+GsH/r
	pv1LruYMGKwDKMte6XANl3Xulyojkab1ChVd2oHvfySO9nlaOnpViPWvOm9xggHmyUF3PSH8jfp4l
	VBVEHgjt96F73Olw0FvF/isQjToa7h7Vlv9riakZIkiOIwKGQyX8MFDPTW8EIR0jUh1DM0tT544AB
	6aaE8+DbVS32L0Inpmwlp59BagJxYmeK20HzziLdXeZDVSGHUe7MhsgFtK5bXVZvflPp+qzp6PTt1
	PdEKLuKS3PU5sUcn1cwWfBXIWD63zfv16SSK37dfKkbrb2FrZs6JFf9W/IeVgwGEkMC+XBFwJe5Pu
	5FmJ9i0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhUG8-0000000DdLr-29Yu;
	Tue, 05 Mar 2024 12:51:04 +0000
Received: from mail-oo1-f54.google.com ([209.85.161.54])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhTAo-0000000DPo7-0fl5;
	Tue, 05 Mar 2024 11:41:34 +0000
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5a1358e7e16so546545eaf.0;
        Tue, 05 Mar 2024 03:41:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709638888; x=1710243688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y0v7RjgmO/yDuWlF3/kTo+sHgoivtGNOWfDVn+nq/Ik=;
        b=iW4sHhflxedaKCBqvYhYOD+k1ACQL7QLlbK0KoOsR6dvRxQxnSg1Xqv0AG3Ba1DbnL
         QDKzPGF3nUzf9iIoAl++VOj5E+vKbgsjzyeODhrN/LkuSLdIl8sF0Xg8EidvqD/pb0dH
         RHVitnySydspnD8DV0S1KDmLJIJ8//uIzXOWDLC3BG1nFq5JnkaDff7BZiaBrY+1YGDD
         CdfV3pvZodLJPUT9uHp/iBjePI7GwzJhZQcsS1V9ENWlfZFAg3GsE/UX94W6fH9duY5m
         fptJ7f42Olt/9HZ0bxypSwuJ7t7dObP8+U7sa9WpJhb10tgkfWOJO8SGzdH17Wy3HBdy
         Wu6A==
X-Forwarded-Encrypted: i=1; AJvYcCVUpofcar8UNfDckQT4MJnN7mKd0LFgKTSLVg3ks1G80TVBveUyI6tP5O7kJ83nxmWQA/I1bn9TPU24lKTz5uBtoXi0JzERCHu1E5jHk6R7het1zc+t9Vw3fPePm8w/TDfbRRk0WmS6xsbi+lFjyJaH9fp6VWtzcnc=
X-Gm-Message-State: AOJu0Yxj4E+HX8k4WIsDJUHSdNaCxGjpFI0vwkMPfg1uFJH9KNhJYcx8
	VVyJxFNN5w58ejTyFzyk+DenlTSTrjduuXOZTfSnbyiZu79ZKmsXTncaCfb5Xw6IkQ+sEZceVxT
	Slg/EHQw4hil3RId4TsmcIipk8M8=
X-Google-Smtp-Source: AGHT+IHF4dBKyk4hRdjM6vf7T079M6yi9lKk8JmaNs0S9UveuRzmmaiok7o5fr454KPibdMqlJlfLpZYpB8AMdLmm0k=
X-Received: by 2002:a4a:d4d4:0:b0:5a1:31a1:7f75 with SMTP id
 r20-20020a4ad4d4000000b005a131a17f75mr154574oos.1.1709638888053; Tue, 05 Mar
 2024 03:41:28 -0800 (PST)
MIME-Version: 1.0
References: <20240301092657.15528-1-qingliang.li@mediatek.com> <ZeXmcl4ngEm1RccW@hovoldconsulting.com>
In-Reply-To: <ZeXmcl4ngEm1RccW@hovoldconsulting.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 5 Mar 2024 12:41:16 +0100
Message-ID: <CAJZ5v0ifq_ZsrQnq3b4LSUJxAVMO55=m7tL+L3nNP7ixBb9yHA@mail.gmail.com>
Subject: Re: [PATCH v2] PM: sleep: wakeirq: fix wake irq warning in system suspend
To: Johan Hovold <johan@kernel.org>, Qingliang Li <qingliang.li@mediatek.com>
Cc: Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Johan Hovold <johan+linaro@kernel.org>, Tony Lindgren <tony@atomide.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Dhruva Gole <d-gole@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_034130_767364_0FF3A817 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Mar 4, 2024 at 4:19=E2=80=AFPM Johan Hovold <johan@kernel.org> wrot=
e:
>
> On Fri, Mar 01, 2024 at 05:26:57PM +0800, Qingliang Li wrote:
> > When driver uses pm_runtime_force_suspend() as the system suspend callb=
ack
> > function and registers the wake irq with reverse enable ordering, the w=
ake
> > irq will be re-enabled when entering system suspend, triggering an
> > 'Unbalanced enable for IRQ xxx' warning. In this scenario, the call
> > sequence during system suspend is as follows:
> >   suspend_devices_and_enter()
> >     -> dpm_suspend_start()
> >       -> dpm_run_callback()
> >         -> pm_runtime_force_suspend()
> >           -> dev_pm_enable_wake_irq_check()
> >           -> dev_pm_enable_wake_irq_complete()
> >
> >     -> suspend_enter()
> >       -> dpm_suspend_noirq()
> >         -> device_wakeup_arm_wake_irqs()
> >           -> dev_pm_arm_wake_irq()
> >
> > To fix this issue, complete the setting of WAKE_IRQ_DEDICATED_ENABLED f=
lag
> > in dev_pm_enable_wake_irq_complete() to avoid redundant irq enablement.
> >
> > Reviewed-by: Dhruva Gole <d-gole@ti.com>
> > Signed-off-by: Qingliang Li <qingliang.li@mediatek.com>
>
> Thanks for the fix. Looks correct to me:
>
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
>
> I think you should add back the Fixes tag from v1 and CC stable as well:
>
> Fixes: 8527beb12087 ("PM: sleep: wakeirq: fix wake irq arming")
> Cc: stable@vger.kernel.org      # 5.16
>
> Note that WAKE_IRQ_DEDICATED_REVERSE was added in 5.16 by commit
> 259714100d98 ("PM / wakeirq: support enabling wake-up irq after
> runtime_suspend called") so no need to try to backport any further than
> that.

Applied as 6.9 material, tags added as suggested above.

Thanks!

