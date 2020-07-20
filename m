Return-Path: <SRS0=A+tK=A7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADBC4C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 08:32:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A4F521775
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 08:32:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OTYk4gt9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Hn7L9TKG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A4F521775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=845/CVaHzcg3yJ9w4f4GUIY8HFrIZH9xRy9mUbMq2sg=; b=OTYk4gt9j39ITyh18kkbNeMA2
	dvxNhedkOgXjd+JlJEc8OE0ZlzRhFrxypIQ5yqTRSE9OCWsoMU1f++6thKcB3wzILSbkVsT+FCxBk
	9Rg4X0J0nA4yHyIPhCeMJaIsPpaQaXtu6OHX++gNCuBW0W8hbugP79mwhd0yJ3o40eY24IrKCHOzx
	2VZ7VAbY9MkS8dK8kGigzNIaZlbVjibb6GF+6DCawjnRJoyitwj/5vT2XhYIo6IkBR7M9FjLBH0GY
	NN7O9KmC2U8ord6/QuYGwn368rBb2qZg7ZbZrDKucOfOFnzldzAJPjZ/L8hlJzuh6yLmj3FQiP91N
	sk/6x6z7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxRDd-0005OC-Ji; Mon, 20 Jul 2020 08:32:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxRDZ-0005Mz-8K; Mon, 20 Jul 2020 08:32:14 +0000
X-UUID: d2eddc246a69462392df891d5cb5fdab-20200720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=285cYG2iqzW7JM+YaxlEFLWkof6vbGVDHLL5H5Gv2zE=; 
 b=Hn7L9TKGVR1o56RHutxVfg3280JwsO1wYyiJ0FZkkwq8xPNOhhnncTXPcyB4FXQcHqAeRJPuJEefR+oHwNSzVkCdoFv1b3rPSvma9qJSVJw9fRzwrzm0oxEDdmO9ZVaXgHc7unwgz9wSbHP+Rsc/xcfMSCudm4xrgpRhJNeyAbQ=;
X-UUID: d2eddc246a69462392df891d5cb5fdab-20200720
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-hung.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 134612891; Mon, 20 Jul 2020 00:32:41 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Jul 2020 01:22:05 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Jul 2020 16:22:03 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 20 Jul 2020 16:22:02 +0800
Message-ID: <1595233323.9207.4.camel@mtkswgap22>
Subject: Re: [PATCH v6 4/4] dt-bindings: mmc: mediatek: Add document for mt6779
From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Mon, 20 Jul 2020 16:22:03 +0800
In-Reply-To: <20200617210247.GA2800817@bogus>
References: <1591665502-6573-1-git-send-email-chun-hung.wu@mediatek.com>
 <1591665502-6573-5-git-send-email-chun-hung.wu@mediatek.com>
 <20200617210247.GA2800817@bogus>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FAA44C5AFEB3ADB5AE3AD9DFD9EA8E0D572B16A99EA2473801BAAC905D13DFC02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_043213_512401_39FD7A1A 
X-CRM114-Status: GOOD (  18.58  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kate
 Stewart <kstewart@linuxfoundation.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Al Cooper <alcooperx@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Andy Gross <agross@kernel.org>, "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 Chaotian Jing =?UTF-8?Q?=28=E4=BA=95=E6=9C=9D=E5=A4=A9=29?=
 <Chaotian.Jing@mediatek.com>,
 "kernel-team@android.com" <kernel-team@android.com>,
 Pan Bian <bianpan2016@163.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "mirq-linux@rere.qmqm.pl" <mirq-linux@rere.qmqm.pl>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Thomas
 Gleixner <tglx@linutronix.de>,
 Stanley Chu =?UTF-8?Q?=28=E6=9C=B1=E5=8E=9F=E9=99=9E=29?=
 <stanley.chu@mediatek.com>, Allison Randal <allison@lohutok.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kuohong Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=8B=E9=B4=BB=29?=
 <kuohong.wang@mediatek.com>, Adrian Hunter <adrian.hunter@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-06-18 at 05:02 +0800, Rob Herring wrote:
> On Tue, Jun 09, 2020 at 09:18:22AM +0800, Chun-Hung Wu wrote:
> > Add compatible node for mt6779 mmc and HW cmdq selection
> > node "mediatek,cqhci".
> > 
> > Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/mmc/mtk-sd.txt | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.txt b/Documentation/devicetree/bindings/mmc/mtk-sd.txt
> > index 8a532f4..d4d20b9 100644
> > --- a/Documentation/devicetree/bindings/mmc/mtk-sd.txt
> > +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.txt
> > @@ -12,6 +12,7 @@ Required properties:
> >  	"mediatek,mt8173-mmc": for mmc host ip compatible with mt8173
> >  	"mediatek,mt8183-mmc": for mmc host ip compatible with mt8183
> >  	"mediatek,mt8516-mmc": for mmc host ip compatible with mt8516
> > +	"mediatek,mt6779-mmc": for mmc host ip compatible with mt6779
> >  	"mediatek,mt2701-mmc": for mmc host ip compatible with mt2701
> >  	"mediatek,mt2712-mmc": for mmc host ip compatible with mt2712
> >  	"mediatek,mt7622-mmc": for MT7622 SoC
> > @@ -49,6 +50,9 @@ Optional properties:
> >  		     error caused by stop clock(fifo full)
> >  		     Valid range = [0:0x7]. if not present, default value is 0.
> >  		     applied to compatible "mediatek,mt2701-mmc".
> > +- mediatek,cqhci: HW cmdq selection
> > +		  If present, hw command queue is enabled.
> > +		  If not present, hw command queue is disabled.
> 
> 'supports-cqe' does the same thing.
Change to use 'supports-cqe' in patch v7.
> 
> >  
> >  Examples:
> >  mmc0: mmc@11230000 {
> > -- 
> > 1.9.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
