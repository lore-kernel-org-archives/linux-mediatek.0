Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496C7C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jan 2022 07:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2gueK2XvOxzMVKmW0HNGvJEduFdFeVFXHMmVhZ3GV4Q=; b=0c2+c+KGBGw+O1
	S1wDfPJz7m/mGnao5ozHwGn7cB+qSCNhIEs5Tlqp8JcqFV2AqWIm2Bh1EDaZRnxrNSLKM7OOCDXiH
	tK6xSWP2MkE+AdtAaWPU5p9KJILdtXHn3gVFfhGzLXghnl+sRvOtJaIQTtNWn/L14zbY5dYccIKB6
	S9AQFW5JPXW6KbfXukiBHBOabowHmyS1Va0ZpUUEOrjLabljUPC3dXuXwKp9wM9cXJyVserECe8Fu
	ir+o3UVY3BIgfTJot50z6yqiIg1lSss6qgXhXbAnP82VKtpfaDmbIvTlYwp/IEV67mPpZvr700XgG
	M4QMXGXwJbpInjNiDaFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4I1K-008UvR-W0; Mon, 03 Jan 2022 07:44:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4I17-008UuD-OS; Mon, 03 Jan 2022 07:44:32 +0000
X-UUID: fd28c64dd4c14f4cabfe9d871a5a31c5-20220103
X-UUID: fd28c64dd4c14f4cabfe9d871a5a31c5-20220103
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2029731569; Mon, 03 Jan 2022 00:44:25 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 2 Jan 2022 23:44:23 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Jan 2022 15:44:22 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 3 Jan 2022 15:44:21 +0800
Message-ID: <8d0b14c93f98d97ed1c1147b785738baf7dfc117.camel@mediatek.com>
Subject: Re: [PATCH v20 0/7] soc: mediatek: SVS: introduce MTK SVS engine
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
 <eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 YT Lee <yt.lee@mediatek.com>, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin <Angus.Lin@mediatek.com>, 
 Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Guenter Roeck
 <linux@roeck-us.net>
Date: Mon, 3 Jan 2022 15:44:21 +0800
In-Reply-To: <fff75b65-51ab-cafd-a55f-137c0b7c2dc6@gmail.com>
References: <20210721070904.15636-1-roger.lu@mediatek.com>
 <fff75b65-51ab-cafd-a55f-137c0b7c2dc6@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220102_234429_833781_A291D7F5 
X-CRM114-Status: GOOD (  13.21  )
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

Hi Matthias,

On Thu, 2021-12-30 at 16:13 +0100, Matthias Brugger wrote:
> Hi Roger,
> 
> On 21/07/2021 09:08, Roger Lu wrote:
> > 1. SVS driver uses OPP adjust event in [1] to update OPP table voltage part.
> > 2. SVS driver gets thermal/GPU device by node [2][3] and CPU device by
> > get_cpu_device().
> > After retrieving subsys device, SVS driver calls device_link_add() to make
> > sure probe/suspend callback priority.
> > 3. SVS dts refers to reset controller [4] to help reset SVS HW.
> > 
> > #mt8183 SVS related patches
> > [1] 
> > https://urldefense.com/v3/__https://patchwork.kernel.org/patch/11193513/__;!!CTRNKA9wMg0ARbw!1SsvfMF2dN3uBcTxgzllNcmZ0yWfXvvAKdKlWRVgaEm69mvIZUYLBf27o_UqdhsH$
> >  
> > [2] 
> > https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20201013102358.22588-2-michael.kao@mediatek.com/__;!!CTRNKA9wMg0ARbw!1SsvfMF2dN3uBcTxgzllNcmZ0yWfXvvAKdKlWRVgaEm69mvIZUYLBf27o_10UEyP$
> >  
> > [3] 
> > https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20200306041345.259332-3-drinkcat@chromium.org/__;!!CTRNKA9wMg0ARbw!1SsvfMF2dN3uBcTxgzllNcmZ0yWfXvvAKdKlWRVgaEm69mvIZUYLBf27ozqhhMBj$
> >  
> > 
> 
> Comments made in v16 actually also hold for v20, so please take them into
> account :)

Sure. Thanks for the reminding :)

> 
> Regards,
> Matthias


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
