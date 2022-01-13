Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60FFBC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 06:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gV/aAcKH1pV6WNW6QPABu0v4hcH62qo2F46nTVqHGhw=; b=cBDKa7rLMpdtNy
	ycTaedQrV3LBe2F0QUq+Qag1oJujrBoq1wSTqYJMn0ZAb//h2Qy4V/u2pJnZ2Spcd8MPESmEH3/HD
	iraQJcLuizsUN2MbANpNiNOBhxbBff7GNklriLZtuSFx60yYGCCV1A9yUdL05XxHqUSLYCnRDTdDJ
	pHWq9FYr25skYwwbgnkdOOGhKpB1Q6YGsUxfou30JYiWYNz6b9tDiiFw1OxCsoOtFlwgWHFatVD9y
	QoWWyTle97XnoVqqh18cM+oWYZWat3zu/iNwLV8k4yAX3Ty5icdYYaR/O/xt+G51ty0gb4oBhnbdF
	JhiPtTaYW2dyHIV/8Vtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7tiq-004pPK-Jg; Thu, 13 Jan 2022 06:36:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7tif-004pOn-5q; Thu, 13 Jan 2022 06:36:22 +0000
X-UUID: 0e77111760d44e0cbe5c38d8f665fd67-20220112
X-UUID: 0e77111760d44e0cbe5c38d8f665fd67-20220112
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 372125185; Wed, 12 Jan 2022 23:36:19 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Jan 2022 22:36:17 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 13 Jan 2022 14:36:16 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 13 Jan 2022 14:36:15 +0800
Message-ID: <6598ee7223a429d40e9a2f833a189f6d9592f04e.camel@mediatek.com>
Subject: Re: [PATCH v3 0/5] Update MT8192 Clock Setting
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, <nfraprado@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <chun-jie.chen@mediatek.com>, <devicetree@vger.kernel.org>,
 <drinkcat@chromium.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee
 <ryder.lee@kernel.org>
Date: Thu, 13 Jan 2022 14:36:16 +0800
In-Reply-To: <d36d276a-c3be-431b-3636-c313cabda3d4@gmail.com>
References: <20220112115542.10606-1-allen-kh.cheng@mediatek.com>
 <d36d276a-c3be-431b-3636-c313cabda3d4@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_223621_258138_1D230A7D 
X-CRM114-Status: GOOD (  19.30  )
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

On Wed, 2022-01-12 at 17:51 +0100, Matthias Brugger wrote:
> 
> On 12/01/2022 12:55, allen-kh.cheng wrote:
> > From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> > 
> > This patch is base on v5.16-rc8,
> > series "Mediatek MT8192 clock support"[1], [2] annd [3].
> > [1] 
> > https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/list/?series=521127__;!!CTRNKA9wMg0ARbw!y4P6pz_u9M3axQ-m02SGlirjXL2ZKklxIqILLsUy4wXY9bVdhpSWqgRL0Me352sLvBo6xw$
> >  
> > [2] 
> > https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20210727023205.20319-2-chun-jie.chen@mediatek.com/__;!!CTRNKA9wMg0ARbw!y4P6pz_u9M3axQ-m02SGlirjXL2ZKklxIqILLsUy4wXY9bVdhpSWqgRL0Me352vbYrxOog$
> >  
> > [3] 
> > https://urldefense.com/v3/__https://lore.kernel.org/all/20210825011120.30481-1-chun-jie.chen@mediatek.com/__;!!CTRNKA9wMg0ARbw!y4P6pz_u9M3axQ-m02SGlirjXL2ZKklxIqILLsUy4wXY9bVdhpSWqgRL0Me352sfbDoBBA$
> >  
> 
> Please update that list to only who the patches that are not yet
> upstream. That 
> will help me to understand if I can take them right now or if we have
> to wait 
> for something to get applied first.
> 
> Thanks,
> Matthias

Hi Matthias,

There is no patches we need to wait related to this serial.

I will update the list in next version.

Thanks.

> 
> > 
> > changes since v2:
> >   - add missing "clock" at the end of commit message
> > 
> > changes since v1:
> >   - update the commit message
> > 
> > Allen-KH Cheng (5):
> >    arm64: dts: mediatek: Correct uart clock of MT8192
> >    arm64: dts: mediatek: Correct SPI clock of MT8192
> >    arm64: dts: mediatek: Correct Nor Flash clock of MT8192
> >    arm64: dts: mediatek: Correct I2C clock of MT8192
> >    arm64: dts: mediatek: Correct system timer clock of MT8192
> > 
> >   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 92 +++++++++++++----
> > -------
> >   1 file changed, 52 insertions(+), 40 deletions(-)
> > 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
