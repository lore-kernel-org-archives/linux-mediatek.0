Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B900DC38145
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 11:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4EAQ100GUJ4755+8cZ4lBtaSz0v0TFrMx0G0ZmrS6II=; b=zU8S0BBU64pOpV7FM8pd0s1iKE
	gvFMA/5/kXWykNhcg+UlguSSExzC+vKETzY6phCGpoXLDLhXhr+F+Y1laai+IaVfn2etWRUEBQ5Ic
	bwHLkTmoXV8XXm7tHnbG/0L4dqDm6+0kUrvvKgxQGW0TTgwqdvSBE76GIAePhFN0KqJrm7Hs3hNMa
	PUSY6zRMUaxw6soCCdMoDSHtwN5HYa/eShpDqW8+9tSPDJ7b7OKkmjFmK6Nb2nVEMK2ymDnnFCc8c
	nF8W8zE1rSs8aM9OFaq6fkMCBKdOdOpw+dkkAFYpcA4GTYewn9WXXTBAg654atUcKID5dlWMFkpPp
	/UpLNgsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWFsh-002pXb-AN; Thu, 08 Sep 2022 11:39:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWFsJ-002pJG-3K; Thu, 08 Sep 2022 11:39:17 +0000
X-UUID: 1ba7976d61614110a397e78460875303-20220908
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=4EAQ100GUJ4755+8cZ4lBtaSz0v0TFrMx0G0ZmrS6II=;
	b=P2y57cVACONShty2dZ8tzIDBXIIMjXIcAsIdqY/KxkE8eycM8fGvumrhhzTtU6Ck+5uEaT0QRkmofnCv420qG6CcJCipDmIfM5smcv3uV/YlgdAPcQW/YzN5qPq01fH4mHa3CpdwK1yU56weJ1/b0f3U+ibBG3jAJ1lFWkIledk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:31fe0566-537d-469e-a92a-473a9268ee0c,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:c24ccbf5-6e85-48d9-afd8-0504bbfe04cb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 1ba7976d61614110a397e78460875303-20220908
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1445509030; Thu, 08 Sep 2022 04:39:09 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 8 Sep 2022 18:38:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 8 Sep 2022 18:38:34 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <mathieu.poirier@linaro.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<bjorn.andersson@linaro.org>, <bleung@chromium.org>,
	<chrome-platform@lists.linux.dev>, <devicetree@vger.kernel.org>,
	<dnojiri@chromium.org>, <enric.balletbo@collabora.com>,
	<groeck@chromium.org>, <gustavoars@kernel.org>, <keescook@chromium.org>,
	<krzk+dt@kernel.org>, <lee.jones@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-remoteproc@vger.kernel.org>,
	<matthias.bgg@gmail.com>, <pmalani@chromium.org>, <robh+dt@kernel.org>,
	<sebastian.reichel@collabora.com>, <tinghan.shen@mediatek.com>,
	<weishunc@google.com>
Subject: Re: [PATCH v2 2/9] remoteproc: mediatek: Support hanlding scp core 1 wdt timeout
Date: Thu, 8 Sep 2022 18:38:28 +0800
Message-ID: <20220908103828.23644-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220829174021.GA2264818@p14s>
References: <20220829174021.GA2264818@p14s>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_043915_207063_4C1F9128 
X-CRM114-Status: GOOD (  24.78  )
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

Hi Mathieu,

> Hi Tinghan,
> 
> I have started reviewing this set and I expect comments to be spread out over a few
> days.  I will tell you when I am done.
> 
> Please see below for comments...
> 
> On Wed, Jun 08, 2022 at 04:35:46PM +0800, Tinghan Shen wrote:
> > MT8195 SCP is a dual-core processor. The SCP core 1 watchdog timeout
> > interrupt uses the same interrupt line of SCP core 0 watchdog timeout
> > interrupt.
> > 
> > Add support for handling SCP core 1 watchdog timeout interrupt in the
> > SCP IRQ handler.
> > 
> > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > ---
> >  drivers/remoteproc/mtk_common.h |  4 ++++
> >  drivers/remoteproc/mtk_scp.c    | 27 ++++++++++++++++++++++++++-
> >  2 files changed, 30 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> > index ea6fa1100a00..73e8adf00de3 100644
> > --- a/drivers/remoteproc/mtk_common.h
> > +++ b/drivers/remoteproc/mtk_common.h
> > @@ -54,6 +54,10 @@
> >  #define MT8192_CORE0_WDT_IRQ		0x10030
> >  #define MT8192_CORE0_WDT_CFG		0x10034
> >  
> > +#define MT8195_SYS_STATUS		0x4004
> > +#define MT8195_CORE0_WDT		BIT(16)
> > +#define MT8195_CORE1_WDT		BIT(17)
> > +
> >  #define MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS		GENMASK(7, 4)
> >  
> >  #define SCP_FW_VER_LEN			32
> > diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> > index 47b2a40e1b4a..3510c6d0bbc8 100644
> > --- a/drivers/remoteproc/mtk_scp.c
> > +++ b/drivers/remoteproc/mtk_scp.c
> > @@ -212,6 +212,31 @@ static void mt8192_scp_irq_handler(struct mtk_scp *scp)
> >  	}
> >  }
> >  
> > +static void mt8195_scp_irq_handler(struct mtk_scp *scp)
> > +{
> > +	u32 scp_to_host;
> > +
> > +	scp_to_host = readl(scp->reg_base + MT8192_SCP2APMCU_IPC_SET);
> > +
> > +	if (scp_to_host & MT8192_SCP_IPC_INT_BIT) {
> > +		scp_ipi_handler(scp);
> > +
> > +		/*
> > +		 * SCP won't send another interrupt until we clear
> > +		 * MT8192_SCP2APMCU_IPC.
> > +		 */
> > +		writel(MT8192_SCP_IPC_INT_BIT,
> > +		       scp->reg_base + MT8192_SCP2APMCU_IPC_CLR);
> > +	} else {
> > +		if (readl(scp->reg_base + MT8195_SYS_STATUS) & MT8195_CORE1_WDT) {
> > +			writel(1, scp->reg_base + MT8195_CORE1_WDT_IRQ);
> > +		} else {
> > +			writel(1, scp->reg_base + MT8192_CORE0_WDT_IRQ);
> > +			scp_wdt_handler(scp, scp_to_host);
> 
> Why is scp_wdt_handler() not called when CORE1 signals a watchdog failure?  If
> this is the intended behaviour there is no way for anyone but you to know that
> it is the case.  

It's becuase the handler of CORE1 timeout doesn't exist at this patch.
The CORE1 timeout handler is added at patch 7 of this series.

You're right. This makes people confused.
I'll combine this patch with the CORE1 timeout handler.

Best regards,
TingHan

