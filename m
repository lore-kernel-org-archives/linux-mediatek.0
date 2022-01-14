Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A8CC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 09:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3M8slCPkLEeAIH5Vc/4n9ewAEXus14djVcKw3Gajlgo=; b=L5KgkYIdm1VwDB
	7bl6/xjkWuZz8BpB/URK8bCpiNZKUZIBHrDZvokXzQbMYtf6zJQzIogpRdUBN7319EAqi1jgzdpKe
	xuK2W0jNAnBKNj+uHt3/gFIzaIIqjXGqZ/ddfrc4EzUrXWQHKzG4HZVeJoI7u/SefTSPnw02SEO28
	S8iZSZXZk1GlNopBwuO1uk0fCyhVpA4nvW6XtBRe7UjUE/+tLxwHtHLV6vb/seEkBw//DM0sNHWZo
	rrnABfIhYi7MgqOH5t86QZFWub77YBNy4jUEfK3LB9wUbKzN9EHWgzlGRxSggaQpAd1JYCCMTDYfJ
	NozGad7QNL8EjRi2bgsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8IXh-008Pyz-ND; Fri, 14 Jan 2022 09:06:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8IXf-008Pxn-6p
 for linux-mediatek@lists.infradead.org; Fri, 14 Jan 2022 09:06:40 +0000
X-UUID: ed80ead75aae469cb4d02261638b7457-20220114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=wKtSaIvrIQJrzzaMQrUQ1aSBbqZiDTuHQhxL7FvGnt4=; 
 b=AQnA7kwdOmsnfeB5UO1hlL0Qgasif02VenemBcSiUe6EFdIE6edrhQjCRPDAv30qGjlLJlG80BSreMLWNwwNQPqhm2koKK1bxrLUzY1V80vLocPoNREr2K2QEehqbQca9gxo4BGpaKH16QpVT9PkqOgBtY4vElqBmEysLW31e1o=;
X-UUID: ed80ead75aae469cb4d02261638b7457-20220114
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1020734303; Fri, 14 Jan 2022 02:06:35 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Jan 2022 01:06:33 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 14 Jan 2022 17:06:32 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Jan 2022 17:06:31 +0800
Message-ID: <69a10908622512c60790f97942731a8ab989b727.camel@mediatek.com>
Subject: Re: [PATCH v5 25/32] iommu/mtk: Migrate to aggregate driver
From: Yong Wu <yong.wu@mediatek.com>
To: Stephen Boyd <swboyd@chromium.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Douglas Anderson
 <dianders@chromium.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, Joerg Roedel <joro@8bytes.org>, "Will
 Deacon" <will@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>, Russell King
 <rmk+kernel@arm.linux.org.uk>, Saravana Kannan <saravanak@google.com>,
 <linux-mediatek@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 <youlin.pei@mediatek.com>
Date: Fri, 14 Jan 2022 17:06:31 +0800
In-Reply-To: <CAE-0n53FAHDmCznJ35Xh2aTwXBVwukAM3ioKx8SU9VowSaQSqA@mail.gmail.com>
References: <20220106214556.2461363-1-swboyd@chromium.org>
 <20220106214556.2461363-26-swboyd@chromium.org>
 <1a3b368eb891ca55c33265397cffab0b9f128737.camel@mediatek.com>
 <CAE-0n53Y3WRy4_QvUm9k9wjjWV7adMDQcK_+1ji4+W25SSeGwg@mail.gmail.com>
 <ff81bc1fe1f1c2060fcf03ba14f1bef584c47599.camel@mediatek.com>
 <CAE-0n53FAHDmCznJ35Xh2aTwXBVwukAM3ioKx8SU9VowSaQSqA@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_010639_286764_6A2DE927 
X-CRM114-Status: GOOD (  29.18  )
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

On Wed, 2022-01-12 at 20:25 -0800, Stephen Boyd wrote:
> > 
> > [    2.654526] ------------[ cut here ]------------
> > [    2.655558] refcount_t: addition on 0; use-after-free.
> > 
> > After this patch, the aggregate_driver flow looks ok. But our
> > driver
> > still aborts like this:
> > 
> > [    2.721316] Unable to handle kernel NULL pointer dereference at
> > virtual address 0000000000000000
> > ...
> > [    2.731658] pc :
> > mtk_smi_larb_config_port_gen2_general+0xa4/0x138
> > [    2.732434] lr : mtk_smi_larb_resume+0x54/0x98
> > ...
> > [    2.742457] Call trace:
> > [    2.742768]  mtk_smi_larb_config_port_gen2_general+0xa4/0x138
> > [    2.743496]  pm_generic_runtime_resume+0x2c/0x48
> > [    2.744090]  __genpd_runtime_resume+0x30/0xa8
> > [    2.744648]  genpd_runtime_resume+0x94/0x2c8
> > [    2.745191]  __rpm_callback+0x44/0x150
> > [    2.745669]  rpm_callback+0x6c/0x78
> > [    2.746114]  rpm_resume+0x314/0x558
> > [    2.746559]  __pm_runtime_resume+0x3c/0x88
> > [    2.747080]  pm_runtime_get_suppliers+0x7c/0x110
> > [    2.747668]  __driver_probe_device+0x4c/0xe8
> > [    2.748212]  driver_probe_device+0x44/0x130
> > [    2.748745]  __device_attach_driver+0x98/0xd0
> > [    2.749300]  bus_for_each_drv+0x68/0xd0
> > [    2.749787]  __device_attach+0xec/0x148
> > [    2.750277]  device_attach+0x14/0x20
> > [    2.750733]  bus_rescan_devices_helper+0x50/0x90
> > [    2.751319]  bus_for_each_dev+0x7c/0xd8
> > [    2.751806]  bus_rescan_devices+0x20/0x30
> > [    2.752315]  __component_add+0x7c/0xa0
> > [    2.752795]  component_add+0x14/0x20
> > [    2.753253]  mtk_smi_larb_probe+0xe0/0x120
> > 
> > This is because the device runtime_resume is called before the bind
> > operation(In our case this detailed function is mtk_smi_larb_bind).
> > The issue doesn't happen without this patchset. I'm not sure the
> > right
> > sequence. If we should fix in mediatek driver, the patch could be:
> 
> Oh, the runtime PM is moved around with these patches. The aggregate
> device is runtime PM enabled before the probe is called, 

In our case, the component device may probe before the aggregate
device. thus the component device runtime PM has already been enabled
when aggregate device probe.

> and there are
> supplier links made to each component, so each component is runtime
> resumed before the aggregate probe function is called. 

Yes. This is the current flow.

> It means that all
> the component drivers need to have their resources ready to power on
> before their component_bind() callback is made. 

Sorry, I don't understand here well. In this case, The component
drivers prepare the resource for power on in the component_bind since
the resource comes from the aggregate driver. Thus, we expect the
component_bind run before the runtime resume callback.

Another solution is moving the component's pm_runtime_enable into the
component_bind(It's mtk_smi_larb_bind here), then the runtime callback
is called after component_bind in which the resource for power on is
ready.

> Thinking more about it
> that may be wrong if something from the aggregate device is needed to
> fully power on the component. Is that what is happening here?
> 
> > diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> > index b883dcc0bbfa..288841555067 100644
> > --- a/drivers/memory/mtk-smi.c
> > +++ b/drivers/memory/mtk-smi.c
> > @@ -483,8 +483,9 @@ static int __maybe_unused
> > mtk_smi_larb_resume(struct device *dev)
> >         if (ret < 0)
> >                 return ret;
> > 
> > -       /* Configure the basic setting for this larb */
> > -       larb_gen->config_port(dev);
> > +       /* Configure the basic setting for this larb after it binds
> > with iommu */
> > +       if (larb->mmu)
> > +               larb_gen->config_port(dev);
> > 
> >         return 0;
> >  }
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
