Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C32C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 21:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iN8jOA40fTgBxFmQ7y31Cr23WneUucRy8iXn0fI29QQ=; b=LEJPlaoaC4K+jm
	Xopo7t9TfBkOT0vM0z3/JN+/TFobNKp0N9R3no0Q22uAziZQf4nYYvO7Ye6cuskE+NnW95xpj9tzD
	UlYZuL7wNNkOk6+mTIlQgHApnz/ZNa3yCgEoLc6Qe3mCb8UgfYT0vWAW//mL4Jy4kSkjRVN6Oex2X
	26B2TIrbcGw7HgRjjGnYUAIDTJApC55Jj4HzZV6N+hmMSFH0r9rWbDFD7rtn+lI0UKzOF4yoccRqF
	/J2Hs8Csq24K8SwJcVV3saWAqXSHC9n9r6b3FQcFWBl9aYpyTWAwtkpw/QHSzvAxYab5iYFWRdx4L
	3aZjpY7N6GK1G5yShFGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8U9z-00AFuj-SE; Fri, 14 Jan 2022 21:30:59 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8U9w-00AFtt-49
 for linux-mediatek@lists.infradead.org; Fri, 14 Jan 2022 21:30:57 +0000
Received: by mail-oi1-x22e.google.com with SMTP id t9so13961130oie.12
 for <linux-mediatek@lists.infradead.org>; Fri, 14 Jan 2022 13:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=qzWKW58EHMRYfJEMWdh6ZI9TALsJ363+iOZxWHKT5Dg=;
 b=m+tA33y4EKPBF5RGvo85oy9HWU3abLrzxeiKVsLD9tVTojyWnpMfPiGManmCHq+SJa
 jUCYY4SnECxcwj0qpyLRNSTBNh11tWxEcT5GvTDzcAsjz8ZAvy9YRLFECkOSyGWKolcO
 smb+cvls8PdAvykD60pN2/GL9MWc0BTWbKWjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=qzWKW58EHMRYfJEMWdh6ZI9TALsJ363+iOZxWHKT5Dg=;
 b=b6pwJXcF4zRrmPEgwHn/CNzMWS8m0qhY1oSJOU7yAQvXz7iYwLY6evuxL0ldIjVQh+
 zcgdqLt4jx9bZxBQC6PvdQSBZ3Wl/4nuuICwtfg3i5SVS5V+B68ZBALUED7saY/6iwaX
 2nJaHMQvavDciYj4b1SGCL0sndcZumayOIVBrm9LqEXjs49fkwzkY6QXur4QHBv7GNHV
 DO5iJvkIc+//6yEySuYJGXgXvwZL84iO8e/K1B4UNiWl9BdSaVoUU0ulUKb7p7+JXMrI
 /ITFJ57V7mRKuIipYtWB+/5/5D0hdbSUp3b5in0ce9CaCs0jyhRQlA/it8FNFpTIiMhy
 8Vng==
X-Gm-Message-State: AOAM533iTYo70WK4mp0ezbzOSywhGC7AjYPJZTfzfEL2Mx0SaAjqZadQ
 9e7WLySrv+shccmePslJNMEA+vCuOy8Xut9O+HOAPQ==
X-Google-Smtp-Source: ABdhPJzLzmiokzwTquHXvpd04mD3pjLPkUF9enSFzCrjicEdCXOV9BJ3Pf4eqRXnVC2O0O5rr5vYBYKUyd0cJHUJnuk=
X-Received: by 2002:aca:a953:: with SMTP id s80mr14644271oie.164.1642195854341; 
 Fri, 14 Jan 2022 13:30:54 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 14 Jan 2022 15:30:53 -0600
MIME-Version: 1.0
In-Reply-To: <69a10908622512c60790f97942731a8ab989b727.camel@mediatek.com>
References: <20220106214556.2461363-1-swboyd@chromium.org>
 <20220106214556.2461363-26-swboyd@chromium.org>
 <1a3b368eb891ca55c33265397cffab0b9f128737.camel@mediatek.com>
 <CAE-0n53Y3WRy4_QvUm9k9wjjWV7adMDQcK_+1ji4+W25SSeGwg@mail.gmail.com>
 <ff81bc1fe1f1c2060fcf03ba14f1bef584c47599.camel@mediatek.com>
 <CAE-0n53FAHDmCznJ35Xh2aTwXBVwukAM3ioKx8SU9VowSaQSqA@mail.gmail.com>
 <69a10908622512c60790f97942731a8ab989b727.camel@mediatek.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 14 Jan 2022 15:30:53 -0600
Message-ID: <CAE-0n53ao52UX3sJ67UQ3dgj0-DZ0xTeo-NrmW5YVAuXfAnxZw@mail.gmail.com>
Subject: Re: [PATCH v5 25/32] iommu/mtk: Migrate to aggregate driver
To: Yong Wu <yong.wu@mediatek.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Russell King <rmk+kernel@arm.linux.org.uk>, 
 Saravana Kannan <saravanak@google.com>, linux-mediatek@lists.infradead.org, 
 iommu@lists.linux-foundation.org, youlin.pei@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_133056_227879_DAD6B63B 
X-CRM114-Status: GOOD (  26.53  )
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

Quoting Yong Wu (2022-01-14 01:06:31)
> On Wed, 2022-01-12 at 20:25 -0800, Stephen Boyd wrote:
> > >
> > > [    2.654526] ------------[ cut here ]------------
> > > [    2.655558] refcount_t: addition on 0; use-after-free.
> > >
> > > After this patch, the aggregate_driver flow looks ok. But our
> > > driver
> > > still aborts like this:
> > >
> > > [    2.721316] Unable to handle kernel NULL pointer dereference at
> > > virtual address 0000000000000000
> > > ...
> > > [    2.731658] pc :
> > > mtk_smi_larb_config_port_gen2_general+0xa4/0x138
> > > [    2.732434] lr : mtk_smi_larb_resume+0x54/0x98
> > > ...
> > > [    2.742457] Call trace:
> > > [    2.742768]  mtk_smi_larb_config_port_gen2_general+0xa4/0x138
> > > [    2.743496]  pm_generic_runtime_resume+0x2c/0x48
> > > [    2.744090]  __genpd_runtime_resume+0x30/0xa8
> > > [    2.744648]  genpd_runtime_resume+0x94/0x2c8
> > > [    2.745191]  __rpm_callback+0x44/0x150
> > > [    2.745669]  rpm_callback+0x6c/0x78
> > > [    2.746114]  rpm_resume+0x314/0x558
> > > [    2.746559]  __pm_runtime_resume+0x3c/0x88
> > > [    2.747080]  pm_runtime_get_suppliers+0x7c/0x110
> > > [    2.747668]  __driver_probe_device+0x4c/0xe8
> > > [    2.748212]  driver_probe_device+0x44/0x130
> > > [    2.748745]  __device_attach_driver+0x98/0xd0
> > > [    2.749300]  bus_for_each_drv+0x68/0xd0
> > > [    2.749787]  __device_attach+0xec/0x148
> > > [    2.750277]  device_attach+0x14/0x20
> > > [    2.750733]  bus_rescan_devices_helper+0x50/0x90
> > > [    2.751319]  bus_for_each_dev+0x7c/0xd8
> > > [    2.751806]  bus_rescan_devices+0x20/0x30
> > > [    2.752315]  __component_add+0x7c/0xa0
> > > [    2.752795]  component_add+0x14/0x20
> > > [    2.753253]  mtk_smi_larb_probe+0xe0/0x120
> > >
> > > This is because the device runtime_resume is called before the bind
> > > operation(In our case this detailed function is mtk_smi_larb_bind).
> > > The issue doesn't happen without this patchset. I'm not sure the
> > > right
> > > sequence. If we should fix in mediatek driver, the patch could be:
> >
> > Oh, the runtime PM is moved around with these patches. The aggregate
> > device is runtime PM enabled before the probe is called,
>
> In our case, the component device may probe before the aggregate
> device. thus the component device runtime PM has already been enabled
> when aggregate device probe.

This is always the case. The component device always probes before the
aggregate device because the component device registers with the
component framework. But the component device can decide to enable
runtime PM during driver probe or during component bind.

>
> > and there are
> > supplier links made to each component, so each component is runtime
> > resumed before the aggregate probe function is called.
>
> Yes. This is the current flow.

Got it.

>
> > It means that all
> > the component drivers need to have their resources ready to power on
> > before their component_bind() callback is made.
>
> Sorry, I don't understand here well. In this case, The component
> drivers prepare the resource for power on in the component_bind since
> the resource comes from the aggregate driver. Thus, we expect the
> component_bind run before the runtime resume callback.

What resource comes from the aggregate device that the component device
manages in runtime PM?

>
> Another solution is moving the component's pm_runtime_enable into the
> component_bind(It's mtk_smi_larb_bind here), then the runtime callback
> is called after component_bind in which the resource for power on is
> ready.

This sounds more correct to me. I'm not an expert on runtime PM though
as I always have to read the code to remember how it works. if the
device isn't ready for runtime PM until the component bind function is
called then runtime PM shouldn't be enabled on the component device.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
