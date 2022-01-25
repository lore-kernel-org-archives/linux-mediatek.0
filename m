Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E36FC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 12:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iNTYD9Gl5+tCptZ1hyuY3ZBo93vFGJYY4O1NtqXllNI=; b=MYRrDhT444i9D1
	8NOLJlR/BXfR19KChPzuDAYv8zUWiR5sbpFjxnISbrjtsnoDz5xQUCv6R/Lb5yiKusLqd9UcRTYsj
	VGpr3GbEQkhT+qhPiPrG7U4DTtfOWrxi6uH58/jq2uushk0TmroxxwAAQYgTdQNCxbUW4hYtQuCS/
	eHse/7Oac1H+PThECxbsUk0MtRRZ+LbcskNCFRWZ8CziP+xtDutUczpWI4lh/io98FEGIDqzQ4zWj
	/RAReWMV0FrMGRPD9syLkskrdIxzWOBT1OBvpxGD73t1oKl4YsNrTHRWJEAXbhByGtRq90urLe0my
	sc4q+u7FkjZ1vFOwQR1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCLI9-007p6J-9U; Tue, 25 Jan 2022 12:51:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCLI5-007p5F-J9; Tue, 25 Jan 2022 12:51:20 +0000
X-UUID: 4ebe23caa52940d88531d533c0d642b2-20220125
X-UUID: 4ebe23caa52940d88531d533c0d642b2-20220125
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <johnson.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 56266618; Tue, 25 Jan 2022 05:51:12 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Jan 2022 04:51:10 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Jan 2022 20:51:09 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Jan 2022 20:51:09 +0800
Message-ID: <cb048ff99e4bd20eb8b3b70de13baf5a27f52138.camel@mediatek.com>
Subject: Re: [PATCH v2 1/2] soc: mediatek: pwrap: add pwrap driver for
 MT8186 SoC
From: Johnson Wang <johnson.wang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, <robh+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <angelogioacchino.delregno@collabora.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 25 Jan 2022 20:51:09 +0800
In-Reply-To: <f5486d12-b048-c062-e571-cf39da7e4c1b@gmail.com>
References: <20220107104633.7500-1-johnson.wang@mediatek.com>
 <20220107104633.7500-2-johnson.wang@mediatek.com>
 <9949a1f7-1ed5-a137-c7b9-2ef8d8e1caf8@gmail.com>
 <544f5085fc8597ce9ce3eb7dc1b5d08fb1ac8755.camel@mediatek.com>
 <f5486d12-b048-c062-e571-cf39da7e4c1b@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_045117_677031_8B783A0C 
X-CRM114-Status: GOOD (  40.07  )
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

On Tue, 2022-01-18 at 14:17 +0100, Matthias Brugger wrote:
> 
> On 18/01/2022 10:25, Johnson Wang wrote:
> > Hi Matthias,
> > 
> > On Fri, 2022-01-14 at 16:46 +0100, Matthias Brugger wrote:
> > > 
> > > On 07/01/2022 11:46, Johnson Wang wrote:
> > > > MT8186 are highly integrated SoC and use PMIC_MT6366 for
> > > > power management. This patch adds pwrap master driver to
> > > > access PMIC_MT6366.
> > > > 
> > > 
> > > It seems this new arbiter is significantly different from the
> > > version
> > > 1. Please
> > > explain that in the commit message.
> > > 
> > > > Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> > > > ---
> > > >    drivers/soc/mediatek/mtk-pmic-wrap.c | 72
> > > > ++++++++++++++++++++++++++++
> > > >    1 file changed, 72 insertions(+)
> > > > 
> > > > diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c
> > > > b/drivers/soc/mediatek/mtk-pmic-wrap.c
> > > > index 952bc554f443..78866ebf7f04 100644
> > > > --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> > > > +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> > > > @@ -30,6 +30,7 @@
> > > >    #define PWRAP_GET_WACS_REQ(x)		(((x) >> 19) &
> > > > 0x00000001)
> > > >    #define PWRAP_STATE_SYNC_IDLE0		BIT(20)
> > > >    #define PWRAP_STATE_INIT_DONE0		BIT(21)
> > > > +#define PWRAP_STATE_INIT_DONE0_V2	BIT(22)
> > > 
> > > That's a strange name, does it come from the datasheet
> > > description?
> > 
> > Thanks for your review.
> > 
> > No, there is only PWRAP_STATE_INIT_DONE0 in MT8186 datasheet.
> > However, it's the 22nd bit in MT8186 and the 21st bit in other
> > SoCs.
> > So we changed its name to avoid redefinition of
> > PWRAP_STATE_INIT_DONE0.
> > 
> > Could you give us some suggestion on proper definition naming?
> > Do you think PWRAP_STATE_INIT_DONE0_MT8186 will be a better choice?
> > 
> 
> Is this a difference that only will show up on the PMIC-wrapper of
> MT8186 or 
> will other SoCs include the same IP? If not, then
> PWRAP_STATE_INIT_DONE0_MT8186 
> should be fine. Otherwise we would need a better name.
> 

In fact, we don't know whether following SoCs will include
the same IP in the future.

Can we just replace _V2 with _MT8186 this time or
please give us some suggestion on it. 

Thanks for your response.

> > > 
> > > >    #define PWRAP_STATE_INIT_DONE1		BIT(15)
> > > >    
> > > >    /* macro for WACS FSM */
> > > > @@ -77,6 +78,8 @@
> > > >    #define PWRAP_CAP_INT1_EN	BIT(3)
> > > >    #define PWRAP_CAP_WDT_SRC1	BIT(4)
> > > >    #define PWRAP_CAP_ARB		BIT(5)
> > > > +#define PWRAP_CAP_MONITOR_V2	BIT(6)
> > > 
> > > Not used capability, please delete.
> > > 
> > > 
> > > Regards,
> > > Matthias
> > 
> > PWRAP_CAP_MONITOR_V2 is not used right now.
> > We can remove it in next version.
> > But this capability will be added when we need it.
> > 
> 
> That's OK, we should add capability definitions once they are added
> to the 
> driver, not before that.
> 
> Thanks,
> Matthias


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
