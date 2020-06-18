Return-Path: <SRS0=U17p=77=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE6ECC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 14:22:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A02C3207E8
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 14:22:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c0Xa8yfH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="SIUCH/QL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A02C3207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nXHTexisJmbn/U9njjXTy/xJBv5M4dOXvNxZ4gBovYo=; b=c0Xa8yfHpENhBX
	vlZtXI5ZbYc/KAm8GqRg5sHviomjvMd/NHlKzuRmYX1mVEFoTiWoeKgvYe/E9LuxzNzgR7Ncs3kvg
	EDbxMUnrOOxeU22gJWtQmM+Um3IdJjd37ADHvPWkd2EQ2DVAY/TshblC5fZPG/twrJ8AEpD9OJjPL
	Nm8Qe3EVuQXedr5mV7VlgS+Sk0UsNrRgGEjY73ekcvqD86IJkLi/XoWXHRt2+ex2yl1TkWCGxYGpb
	s1lKRONML+p55g44q9F9V7PqDh9xxW6qDEiRAYNmon8Clbd1hf76BSJpGIsuQH2hJf8Wj7bM5+mZM
	vbWE6g580YLNOxcTcqmw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlvQy-0005yD-D3; Thu, 18 Jun 2020 14:22:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlvQo-0005pa-9a; Thu, 18 Jun 2020 14:22:20 +0000
X-UUID: 2fff64a025194e8f9e39ee20d0efb1cd-20200618
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=JaNv1xRYZuJqMSR6WYFAxOUzdkvOslEtw5hvRm5QTu4=; 
 b=SIUCH/QLBqHdKw2L/40jis4UUCHdUXrFWHg2gRpxUUiA77XYMVoPpgvBab0I7Qaj1lQnIlRD0cOvFk3uefAcx0NKueO4a12vvKZykA+3O5gbJzdF66hS09x87UX9xKlMbWfPR9JngIgq3XrIs/k94MnefO7Tt3UZ+ihAqGLG3kI=;
X-UUID: 2fff64a025194e8f9e39ee20d0efb1cd-20200618
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 780583709; Thu, 18 Jun 2020 06:21:58 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Jun 2020 07:22:08 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Jun 2020 22:22:02 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 18 Jun 2020 22:22:02 +0800
Message-ID: <1592490123.10773.16.camel@mtkswgap22>
Subject: Re: [PATCH 1/1] irqchip: Add config MTK_SYSIRQ and MTK_CIRQ
From: Hanks Chen <hanks.chen@mediatek.com>
To: Marc Zyngier <maz@kernel.org>
Date: Thu, 18 Jun 2020 22:22:03 +0800
In-Reply-To: <f47e8a1e70c982ecf6245db573630f51@kernel.org>
References: <1592483471-14806-1-git-send-email-hanks.chen@mediatek.com>
 <f47e8a1e70c982ecf6245db573630f51@kernel.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_072218_338850_92B39486 
X-CRM114-Status: GOOD (  22.02  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: CC Hwang <cc.hwang@mediatek.com>, Jason Cooper <jason@lakedaemon.net>,
 wsd_upstream@mediatek.com, Loda Chou <loda.chou@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-06-18 at 13:41 +0100, Marc Zyngier wrote:
> On 2020-06-18 13:31, Hanks Chen wrote:
> > Mediatek sysirq and cirq drivers as-is were bound together to the 
> > config
> > of ARCH_MEDIATEK.  These two drivers should be able to be configured
> > separately.  For example, on new Mediatek mobile chips such as 
> > Dimensity
> > 820, the sysirq driver is not used since the hardware module is 
> > removed.
> > 
> > Add two new configs to sysirq and cirq drivers.
> > - config MTK_SYSIRQ for the interrupt polarity controller driver: 
> > sysirq
> > - config MTK_CIRQ for the low-power interrupt driver: cirq
> > 
> > Signed-off-by: cc.hwang <cc.hwang@mediatek.com>
> > Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> > ---
> >  drivers/irqchip/Kconfig  |   12 ++++++++++++
> >  drivers/irqchip/Makefile |    3 ++-
> >  2 files changed, 14 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> > index 29fead2..cc9aa18 100644
> > --- a/drivers/irqchip/Kconfig
> > +++ b/drivers/irqchip/Kconfig
> > @@ -572,4 +572,16 @@ config LOONGSON_PCH_MSI
> >  	help
> >  	  Support for the Loongson PCH MSI Controller.
> > 
> > +config MTK_SYSIRQ
> > +	tristate "Mediatek interrupt polarity controller"
> 
> How do you expect this to work as a module?

My fault, I missed some patches.I'll add them in next patches.

These should be three patches:
1. break existing configurations and create new config for them
2. Change Kconfig to be loadable as a module and ensure all platforms
are executable.
3. Make the irq-mtk-sysirq driver as a loadable kernel module for GKI
and flexibility.
.
Thank you for your comment

> 
> > +	help
> > +	  Interrupt polarity controller driver to swap polarity for
> > +	  interrupts for Mediatek mobile chips.
> > +
> > +config MTK_CIRQ
> > +	bool "Mediatek low-power interrupt controller"
> > +	help
> > +	  Low-power interrupt controller driver to monitor IRQS
> > +	  in the sleep mode for Mediatek mobile chips.
> > +
> >  endmenu
> > diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> > index 133f9c4..30421d2 100644
> > --- a/drivers/irqchip/Makefile
> > +++ b/drivers/irqchip/Makefile
> > @@ -69,7 +69,8 @@ obj-$(CONFIG_BCM7120_L2_IRQ)		+= irq-bcm7120-l2.o
> >  obj-$(CONFIG_BRCMSTB_L2_IRQ)		+= irq-brcmstb-l2.o
> >  obj-$(CONFIG_KEYSTONE_IRQ)		+= irq-keystone.o
> >  obj-$(CONFIG_MIPS_GIC)			+= irq-mips-gic.o
> > -obj-$(CONFIG_ARCH_MEDIATEK)		+= irq-mtk-sysirq.o irq-mtk-cirq.o
> > +obj-$(CONFIG_MTK_SYSIRQ)		+= irq-mtk-sysirq.o
> > +obj-$(CONFIG_MTK_CIRQ)			+= irq-mtk-cirq.o
> >  obj-$(CONFIG_ARCH_DIGICOLOR)		+= irq-digicolor.o
> >  obj-$(CONFIG_RENESAS_H8300H_INTC)	+= irq-renesas-h8300h.o
> >  obj-$(CONFIG_RENESAS_H8S_INTC)		+= irq-renesas-h8s.o
> 
> In general, this approach doesn't look right. As it stands, this is just 
> breaking existing configurations
> 
> Do you really expect users to know exactly which interrupt controllers 
> their system is going to use? This seems like the wrong assumption. If 
> you really want to save the handful of bytes these drivers take in your 
> image, then add the relevant dependency information in Kconfig.
> 

1. This patch will add a dependency on it in Kconfig, which ensures all
platforms are executable.
2. We want to follow the Android GKI and according to the requirement of
GKI(General Kernel Image), all SoC and Board Peripheral drivers are
loadable kernel modules.so I need to breaking existing configurations
and create new config for them.

Thank you for your comment
>          M.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
