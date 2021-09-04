Return-Path: <SRS0=vCgL=N2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF0E3C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Sep 2021 23:52:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5823460F5C
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Sep 2021 23:52:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5823460F5C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QCF1IAOkGVZ/M4YPYxzChAGS+IrlYjNjr7/K5u7LS4w=; b=jKHOZceIKY4oGj
	chZT4LRxfuGFxa8MH5S7NferPxj7Z1PjsWqe9y5JDMNyJzcppEw15Sslh1KHEoTnrp2ECNdMAl7UD
	fvV9qfcm5f23dbenFCN6SgkC11n2Io8ZCL9qFkMfvDutkdgo20TRJNhXAH9i5UlvkDOrSPLTykMXX
	nshiKXdpKMjgdoETu/LNTn8uZs513TVgNcDJcVG0ugR6+M5JhnPHANfzekleXZ2DcPVtXksEY+ts+
	eUXmLHgVTzXXM76LSVOtNAaaRMkmWNm0rLDNFhN1oTkXHO5o+1Sq1F1dhYBNexad+UY17iU5yaYkN
	Y7Ja7zVm8eWLEmYcrvRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mMfSM-00Esyj-MS; Sat, 04 Sep 2021 23:52:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMfSI-00Esxv-FM; Sat, 04 Sep 2021 23:52:17 +0000
X-UUID: f3206ff1d9d541cdae32866a46e63a04-20210904
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=GHSmuj3Q2BVj+Q8NFNRDWDer66bC//EsTOenC7igQ3g=; 
 b=fmM2XeN1PGPsjX/Mz1mqw/yPE1dlHjQVUDkJVe2R9ac9TOsTDTvCHmdO11uH7GVDfJObb1DXVRDCBtBR4TDKSQc23Xl3w2dR5ZOGBlGeneCEkKnkvBCIXe+SeG2AomV6Fy4PCeJoCaf/Ecd71EMGcm7CCLUXFnyOHYIzjL077VI=;
X-UUID: f3206ff1d9d541cdae32866a46e63a04-20210904
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1488025834; Sat, 04 Sep 2021 16:52:07 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 4 Sep 2021 16:52:05 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 5 Sep 2021 07:52:04 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 5 Sep 2021 07:52:03 +0800
Message-ID: <0d6740ab1c40f32188881b55b06c62b28a179402.camel@mediatek.com>
Subject: Re: [PATCH v2] clk: imx: use module_platform_driver
From: Miles Chen <miles.chen@mediatek.com>
To: Fabio Estevam <festevam@gmail.com>
CC: Abel Vesa <abel.vesa@nxp.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>,
 linux-clk <linux-clk@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX /
 MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <wsd_upstream@mediatek.com>
Date: Sun, 5 Sep 2021 07:52:04 +0800
In-Reply-To: <CAOMZO5AE4uGXk47uhWKLch8RDmUrvvw0zDPM+wxgz4uWJD6eGA@mail.gmail.com>
References: <20210904152946.32042-1-miles.chen@mediatek.com>
 <CAOMZO5AE4uGXk47uhWKLch8RDmUrvvw0zDPM+wxgz4uWJD6eGA@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210904_165214_568554_A37D8C4A 
X-CRM114-Status: GOOD (  11.09  )
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

On Sat, 2021-09-04 at 13:43 -0300, Fabio Estevam wrote:
> Hi Miles,
> 
> On Sat, Sep 4, 2021 at 12:29 PM Miles Chen <miles.chen@mediatek.com>
> wrote:
> > 
> > Replace builtin_platform_driver_probe with
> > module_platform_driver_probe
> > because CONFIG_CLK_IMX8QXP can be set to =m (kernel module).
> > 
> > Fixes: c2cccb6d0b33 ("clk: imx: add imx8qxp clk driver")
> > Fixes: 1e3121bfe51a ("clk: imx: add imx8qxp lpcg driver")
> 
> The correct Fixes tag would be:
> 
> Fixes: e0d0d4d86c766 ("clk: imx8qxp: Support building i.MX8QXP clock
> driver as module")
> 

Thanks, I will fix the tag in next patch.

Miles
> Thanks
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
