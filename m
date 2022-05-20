Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3C2C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 11:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=stOu0vV75hjqKIHmX6qQ872xQFa7faQYrwtF6v3KqHg=; b=zeevyuYI8OI2sP
	pLKQYspdMRj0m72mxM4FaE4fxXFPPtus6cj6bNnuTvNY64WMutOdlCUxtrPICauukvf20KGcmX2uo
	78SzoxOP98YnMXZWgZrvwm2+NWD67qpxa7X6B5wBFPZc8U5HfXcIs3Xqu8KgZ+OjQScJoV/ChTprN
	vsK85BPAIyam+OQTm7RkD8g/KSWKEhXNpU4L/xiMf3Lojh3hdm0t7HPQwKXLt5jfD5NSPme8cx+5d
	uTPu6DZ7Mx1xkEAshhupFh4IxR3fphPt6CWbEcJB/lkIR/XViDorSR0g/H2PlZdHeRzsVjXEossnF
	7/c1DmtB5V4/VnTV0AYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns0O0-00Bx4B-7s; Fri, 20 May 2022 11:01:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrzJM-00Bi6D-D2; Fri, 20 May 2022 09:52:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=8w6Ffk7p0BzoP+iDHRNhypGp9sYRj/f/AaiEoduI6Co=; b=XZyhPK6Z5PyMjYfUyf0Clqv7iy
 zK9A4iquETiO/RBYDPo5LCuAYgRE/82vA7DnvG7+k7EFbzNCQXSiTIsGcIx9ekBD2Laxn+/vp4DEU
 rCHV6drHg+EqLfzx4W5rpGMoqdb1KSK24UJ7w3GfBiMqX/FsV0OLYZYofE8Lo68o+fzB6RGpGMYyW
 5uGz+reUDUc6C/4UzHeWwAUOyJztGpjFVNSMbJl/ELq/1BoVkA4bk1a/XTX4Luy7fZRtoNX+t+Ges
 ow6O+2RuNIjyGU4ANAdOPEoRgQaw2NbL5V4ZPywPa1KnwxrqC99aQcMcw5ybkVfN/jgew3n0GaAkw
 rLdnScJw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrz8r-002IAt-Gl; Fri, 20 May 2022 09:41:56 +0000
X-UUID: 1598df6fca5e4780903691137aaac686-20220520
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:a658dd5f-89bb-40f7-a3ce-e8f2c0948e1f, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-META: VersionHash:2a19b09, CLOUDID:1f91f0e2-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: 1598df6fca5e4780903691137aaac686-20220520
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <johnson.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1382522339; Fri, 20 May 2022 02:41:39 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 May 2022 02:41:37 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 20 May 2022 17:41:36 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 May 2022 17:41:35 +0800
Message-ID: <47da3ed20b7f3c082a6bf38de2ba291b7dd67ecc.camel@mediatek.com>
Subject: Re: [RESEND v4 2/2] PM / devfreq: mediatek: Introduce MediaTek CCI
 devfreq driver
From: Johnson Wang <johnson.wang@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: <cw00.choi@samsung.com>, <krzk+dt@kernel.org>, <robh+dt@kernel.org>,
 <kyungmin.park@samsung.com>, <djakov@kernel.org>, <khilman@kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <jia-wei.chang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 20 May 2022 17:41:35 +0800
In-Reply-To: <CAGXv+5G-88zWSnic-AY2ANF9BYWCsZk29CeLxp+VuFKE_LH5Ug@mail.gmail.com>
References: <20220513032832.17645-1-johnson.wang@mediatek.com>
 <20220513032832.17645-3-johnson.wang@mediatek.com>
 <CAGXv+5Em2eq8g8phC7MVcEP-sCsSsKa9FQjOra2UN3pib_psLA@mail.gmail.com>
 <7eec74e32bb482ba6984c6789f598ee9965f49b3.camel@mediatek.com>
 <CAGXv+5G-88zWSnic-AY2ANF9BYWCsZk29CeLxp+VuFKE_LH5Ug@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_104154_210727_58963B7E 
X-CRM114-Status: GOOD (  38.80  )
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

On Thu, 2022-05-19 at 11:24 +0800, Chen-Yu Tsai wrote:
> On Wed, May 18, 2022 at 8:19 PM Johnson Wang <
> johnson.wang@mediatek.com> wrote:
> > 
> > Hi Chen-Yu,
> > 
> > On Fri, 2022-05-13 at 11:54 +0800, Chen-Yu Tsai wrote:
> > > On Fri, May 13, 2022 at 11:31 AM Johnson Wang <
> > > johnson.wang@mediatek.com> wrote:
> > > > 
> > > > We introduce a devfreq driver for the MediaTek Cache Coherent
> > > > Interconnect
> > > > (CCI) used by some MediaTek SoCs.
> > > > 
> > > > In this driver, we use the passive devfreq driver to get target
> > > > frequencies
> > > > and adjust voltages accordingly. In MT8183 and MT8186, the
> > > > MediaTek
> > > > CCI
> > > > is supplied by the same regulators with the little core CPUs.
> > > > 
> > > > Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > > > Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> > > > Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> > > > ---
> > > > This patch depends on "devfreq-testing"[1].
> > > > [1]
> > > > 
https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git/log/?h=devfreq-testing__;!!CTRNKA9wMg0ARbw!zzOSoso9udvDV3h6kYlmizFtbn3ACA5aS2jCAjKyvtu4z0fobv1mD5uF9YbPSme8l_NnR05unTxkZfDdzohu8asWZQ$
> > > > 
> > > > ---
> > > >  drivers/devfreq/Kconfig           |  10 +
> > > >  drivers/devfreq/Makefile          |   1 +
> > > >  drivers/devfreq/mtk-cci-devfreq.c | 474
> > > > ++++++++++++++++++++++++++++++
> > > >  3 files changed, 485 insertions(+)
> > > >  create mode 100644 drivers/devfreq/mtk-cci-devfreq.c
> > > > 
> > > > diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
> > > > index 87eb2b837e68..9754d8b31621 100644
> > > > --- a/drivers/devfreq/Kconfig
> > > > +++ b/drivers/devfreq/Kconfig
> > > > @@ -120,6 +120,16 @@ config ARM_TEGRA_DEVFREQ
> > > >           It reads ACTMON counters of memory controllers and
> > > > adjusts the
> > > >           operating frequencies and voltages with OPP support.
> > > > 
> > > > +config ARM_MEDIATEK_CCI_DEVFREQ
> > > > +       tristate "MEDIATEK CCI DEVFREQ Driver"
> > > > +       depends on ARM_MEDIATEK_CPUFREQ || COMPILE_TEST
> > > > +       select DEVFREQ_GOV_PASSIVE
> > > > +       help
> > > > +         This adds a devfreq driver for MediaTek Cache
> > > > Coherent
> > > > Interconnect
> > > > +         which is shared the same regulators with the cpu
> > > > cluster.
> > > > It can track
> > > > +         buck voltages and update a proper CCI frequency. Use
> > > > the
> > > > notification
> > > > +         to get the regulator status.
> > > > +
> > > >  config ARM_RK3399_DMC_DEVFREQ
> > > >         tristate "ARM RK3399 DMC DEVFREQ Driver"
> > > >         depends on (ARCH_ROCKCHIP && HAVE_ARM_SMCCC) || \
> > > > diff --git a/drivers/devfreq/Makefile
> > > > b/drivers/devfreq/Makefile
> > > > index 0b6be92a25d9..bf40d04928d0 100644
> > > > --- a/drivers/devfreq/Makefile
> > > > +++ b/drivers/devfreq/Makefile
> > > > @@ -11,6 +11,7 @@ obj-$(CONFIG_DEVFREQ_GOV_PASSIVE)     +=
> > > > governor_passive.o
> > > >  obj-$(CONFIG_ARM_EXYNOS_BUS_DEVFREQ)   += exynos-bus.o
> > > >  obj-$(CONFIG_ARM_IMX_BUS_DEVFREQ)      += imx-bus.o
> > > >  obj-$(CONFIG_ARM_IMX8M_DDRC_DEVFREQ)   += imx8m-ddrc.o
> > > > +obj-$(CONFIG_ARM_MEDIATEK_CCI_DEVFREQ) += mtk-cci-devfreq.o
> > > >  obj-$(CONFIG_ARM_RK3399_DMC_DEVFREQ)   += rk3399_dmc.o
> > > >  obj-$(CONFIG_ARM_SUN8I_A33_MBUS_DEVFREQ)       += sun8i-a33-
> > > > mbus.o
> > > >  obj-$(CONFIG_ARM_TEGRA_DEVFREQ)                += tegra30-
> > > > devfreq.o
> > > > diff --git a/drivers/devfreq/mtk-cci-devfreq.c
> > > > b/drivers/devfreq/mtk-cci-devfreq.c
> > > > new file mode 100644
> > > > index 000000000000..aa8c37eb4a06
> > > > --- /dev/null
> > > > +++ b/drivers/devfreq/mtk-cci-devfreq.c
> > > > @@ -0,0 +1,474 @@
> 
> [...]
> 
> > > > +       if (IS_ERR(drv->sram_reg))
> > > > +               drv->sram_reg = NULL;
> > > > +       else {
> > > > +               ret = regulator_enable(drv->sram_reg);
> > > > +               if (ret) {
> > > > +                       dev_err(dev, "failed to enable sram
> > > > regulator\n");
> > > > +                       goto out_free_resources;
> > > > +               }
> > > > +       }
> > > > +
> > > > +       /*
> > > > +        * We assume min voltage is 0 and tracking target
> > > > voltage
> > > > using
> > > > +        * min_volt_shift for each iteration.
> > > > +        * The retry_max is 3 times of expeted iteration count.
> > > 
> > > expected?
> > > 
> > 
> > Maybe "the maximum" will be more appropriate?
> 
> 
> I was merely pointing out a typo in "expeted".
> 
> Looking at it again, I'm not sure why retry attempts are tied to the
> voltage.
> 
> 
> ChenYu

Hi Chen-Yu,

Thanks for you reminder.

Whenever the voltages are scaled up/down one step,
meaning that there is another iteration in the while loop.

Thus, our thought is to use times of the voltages step up/down to set
iteration limit.

BRs,
Johnson Wang 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
