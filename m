Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 577C2C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Jan 2022 07:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VdcD1tUpuCirsEXGhmlHDuXGc6/bYrvDl0ATF5NIuVM=; b=kYLhNd8zcx9k9L
	QxzR/GpM19x4b8yahGhmMhi3GXy2EPhvyyDX1HIC7VjJWXfLShyrAdR/Het2lJIKwuq4AfG0vw/96
	NtIbbRSCGqRwmhJwbxsDJbMrpg9xT2zs6ihW0jA1un3D5iTO3ZhZIx0bJeQizFCQ7U8cAAZtyDiT2
	u0ZSbKKkPqIDziHkir5pcUKRe+JOUZgNen7gVdFermkUTGHMlRnSRb1MXdxjpyhqBL47/1tN0UoJe
	8N/IFN8C9WSByFbgCvVtWR0x1SvKJVqwnUl5Se5QX5fHDWlFYcuUd/q0mKom8SOHOL7x7OybZ3eO2
	CP8epFc6ym58VD+g8i2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8dfR-00Am7z-OF; Sat, 15 Jan 2022 07:40:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8dfL-00Am6q-W4
 for linux-mediatek@lists.infradead.org; Sat, 15 Jan 2022 07:40:04 +0000
X-UUID: d5f975add9d44e96bd687d82702224ee-20220115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=cX6msMFI9lOTPA5oXlL+F5Bai2aRWhqlCoq+W52/0CA=; 
 b=gM/9nBYWbED1qgA0o5clOxt1NHtKUTmMoOs9yM4JXjnLifWfM8ZqBjQcfMeS1nJ4spDpvOR2McKmKeVvbU9JS7Ny1SHleG5eYfC2oMRp4OsKwhF9eXhU6RYvblskUMbg8clg6b5Sd2wvpRFxhANUaCBBMeJL0ajy8/alDhvyvsQ=;
X-UUID: d5f975add9d44e96bd687d82702224ee-20220115
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1372784437; Sat, 15 Jan 2022 00:39:57 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Jan 2022 23:39:55 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 15 Jan 2022 15:39:54 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 15 Jan 2022 15:39:53 +0800
Message-ID: <fc7207eb9958c487fec5679da73d8f3595cc7bb1.camel@mediatek.com>
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
Date: Sat, 15 Jan 2022 15:39:52 +0800
In-Reply-To: <CAE-0n53ao52UX3sJ67UQ3dgj0-DZ0xTeo-NrmW5YVAuXfAnxZw@mail.gmail.com>
References: <20220106214556.2461363-1-swboyd@chromium.org>
 <20220106214556.2461363-26-swboyd@chromium.org>
 <1a3b368eb891ca55c33265397cffab0b9f128737.camel@mediatek.com>
 <CAE-0n53Y3WRy4_QvUm9k9wjjWV7adMDQcK_+1ji4+W25SSeGwg@mail.gmail.com>
 <ff81bc1fe1f1c2060fcf03ba14f1bef584c47599.camel@mediatek.com>
 <CAE-0n53FAHDmCznJ35Xh2aTwXBVwukAM3ioKx8SU9VowSaQSqA@mail.gmail.com>
 <69a10908622512c60790f97942731a8ab989b727.camel@mediatek.com>
 <CAE-0n53ao52UX3sJ67UQ3dgj0-DZ0xTeo-NrmW5YVAuXfAnxZw@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_234001_455727_1F9F96F4 
X-CRM114-Status: GOOD (  37.61  )
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

On Fri, 2022-01-14 at 15:30 -0600, Stephen Boyd wrote:
> Quoting Yong Wu (2022-01-14 01:06:31)
> > On Wed, 2022-01-12 at 20:25 -0800, Stephen Boyd wrote:
> > > > 
> > > > [    2.654526] ------------[ cut here ]------------
> > > > [    2.655558] refcount_t: addition on 0; use-after-free.
> > > > 
> > > > After this patch, the aggregate_driver flow looks ok. But our
> > > > driver
> > > > still aborts like this:
> > > > 
> > > > [    2.721316] Unable to handle kernel NULL pointer dereference
> > > > at
> > > > virtual address 0000000000000000
> > > > ...
> > > > [    2.731658] pc :
> > > > mtk_smi_larb_config_port_gen2_general+0xa4/0x138
> > > > [    2.732434] lr : mtk_smi_larb_resume+0x54/0x98
> > > > ...
> > > > [    2.742457] Call trace:
> > > > [    2.742768]  mtk_smi_larb_config_port_gen2_general+0xa4/0x13
> > > > 8
> > > > [    2.743496]  pm_generic_runtime_resume+0x2c/0x48
> > > > [    2.744090]  __genpd_runtime_resume+0x30/0xa8
> > > > [    2.744648]  genpd_runtime_resume+0x94/0x2c8
> > > > [    2.745191]  __rpm_callback+0x44/0x150
> > > > [    2.745669]  rpm_callback+0x6c/0x78
> > > > [    2.746114]  rpm_resume+0x314/0x558
> > > > [    2.746559]  __pm_runtime_resume+0x3c/0x88
> > > > [    2.747080]  pm_runtime_get_suppliers+0x7c/0x110
> > > > [    2.747668]  __driver_probe_device+0x4c/0xe8
> > > > [    2.748212]  driver_probe_device+0x44/0x130
> > > > [    2.748745]  __device_attach_driver+0x98/0xd0
> > > > [    2.749300]  bus_for_each_drv+0x68/0xd0
> > > > [    2.749787]  __device_attach+0xec/0x148
> > > > [    2.750277]  device_attach+0x14/0x20
> > > > [    2.750733]  bus_rescan_devices_helper+0x50/0x90
> > > > [    2.751319]  bus_for_each_dev+0x7c/0xd8
> > > > [    2.751806]  bus_rescan_devices+0x20/0x30
> > > > [    2.752315]  __component_add+0x7c/0xa0
> > > > [    2.752795]  component_add+0x14/0x20
> > > > [    2.753253]  mtk_smi_larb_probe+0xe0/0x120
> > > > 
> > > > This is because the device runtime_resume is called before the
> > > > bind
> > > > operation(In our case this detailed function is
> > > > mtk_smi_larb_bind).
> > > > The issue doesn't happen without this patchset. I'm not sure
> > > > the
> > > > right
> > > > sequence. If we should fix in mediatek driver, the patch could
> > > > be:
> > > 
> > > Oh, the runtime PM is moved around with these patches. The
> > > aggregate
> > > device is runtime PM enabled before the probe is called,
> > 
> > In our case, the component device may probe before the aggregate
> > device. thus the component device runtime PM has already been
> > enabled
> > when aggregate device probe.
> 
> This is always the case. The component device always probes before
> the
> aggregate device because the component device registers with the
> component framework. But the component device can decide to enable
> runtime PM during driver probe or during component bind.
> 
> > 
> > > and there are
> > > supplier links made to each component, so each component is
> > > runtime
> > > resumed before the aggregate probe function is called.
> > 
> > Yes. This is the current flow.
> 
> Got it.
> 
> > 
> > > It means that all
> > > the component drivers need to have their resources ready to power
> > > on
> > > before their component_bind() callback is made.
> > 
> > Sorry, I don't understand here well. In this case, The component
> > drivers prepare the resource for power on in the component_bind
> > since
> > the resource comes from the aggregate driver. Thus, we expect the
> > component_bind run before the runtime resume callback.
> 
> What resource comes from the aggregate device that the component
> device manages in runtime PM?

Here the aggregate device is the iommu device. It knows who enabled the
iommu from the dtsi, then transfers this information to the
component(smi_larb) devices. smi_larb will configure the registers to
enable iommu for these masters in the runtime resume.

> > 
> > Another solution is moving the component's pm_runtime_enable into
> > the
> > component_bind(It's mtk_smi_larb_bind here), then the runtime
> > callback
> > is called after component_bind in which the resource for power on
> > is
> > ready.
> 
> This sounds more correct to me. I'm not an expert on runtime PM
> though
> as I always have to read the code to remember how it works. if the
> device isn't ready for runtime PM until the component bind function
> is
> called then runtime PM shouldn't be enabled on the component device.

Anyway, We should update the SMI driver for this case. I prepare a
patch into this patchset or I send it independently? which way is
better?

The patch could be:

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index b883dcc0bbfa..88854c2270a1 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -175,6 +175,8 @@ mtk_smi_larb_bind(struct device *dev, struct device
*master, void *data)
                        larb->larbid = i;
                        larb->mmu = &larb_mmu[i].mmu;
                        larb->bank = larb_mmu[i].bank;
+
+                       pm_runtime_enable(dev);
                        return 0;
                }
        }
@@ -450,7 +452,6 @@ static int mtk_smi_larb_probe(struct
platform_device *pdev)
        if (ret < 0)
                return ret;

-       pm_runtime_enable(dev);
        platform_set_drvdata(pdev, larb);
        ret = component_add(dev, &mtk_smi_larb_component_ops);
        if (ret)

Thanks.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
