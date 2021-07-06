Return-Path: <SRS0=SroS=L6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A1BC07E9C
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 02:09:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DF7F6195A
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 02:09:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DF7F6195A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=twBinTulvIpK9/VCTkenbCJ9c4r0fGdvkWbmpY5h464=; b=hsrszD4nqJvOJE
	6qDwQiep+E/Acu/TnmzjQFy0heMglInW70NMvs8rSRUMEz0WQQOPBCzE1Tk+k2fWsxBdd3r35O9/U
	XxxxDifaOMtyVEcvO02220m/M3PxOkZDMiJkpJL/KhgGeXkqoxaz/BPYgF1K62/5O7v+nbthHFk4w
	RJ8PkqauABletyuG8R9KUW2XA6lpenHY8P70cExg2WdDcfyP+vSZ9x5kMt/OFLfd9zeAhkAFahHjR
	0+0w45HtgGT2/FGYZGjZKpNzmuJHYcXuQ+8Y4QZkw8Yszn8gDVqzofXlKbzLnpvBiQK4W7ss624dd
	wY9mRBa2E5xa/A7pVoZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0aWJ-00A903-6p; Tue, 06 Jul 2021 02:09:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0aWF-00A8zc-Ar; Tue, 06 Jul 2021 02:09:06 +0000
X-UUID: de126fbd04f941e684f7497bd1bc80da-20210705
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=rM/FDzGlB2uXisLxyE0DK9a6bsODNzTQuW4tR72IG4M=; 
 b=jeCiLS2C66R2mdNDwZZYVLRHWvA/5tAbywjdK1stt9cqztSizA/Sj1hTeWZ/Yi7EtNijctvYuEceNOSjsY27eIia43tY47Y8W9QABcg2/9lMm9A+51IrMAEuoTOOQGTpc8uKByW3taiTbyX9xScsrdAykaaVAMqOUdXQVs3gV3s=;
X-UUID: de126fbd04f941e684f7497bd1bc80da-20210705
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 442557642; Mon, 05 Jul 2021 19:08:32 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Jul 2021 19:05:59 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Jul 2021 10:05:57 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 6 Jul 2021 10:05:57 +0800
Message-ID: <50ff125023425b58ba86eb50df51c34cea5ab7d8.camel@mediatek.com>
Subject: Re: [v12 02/20] dt-bindings: ARM: Mediatek: Add mmsys document
 binding for MT8192
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 6 Jul 2021 10:05:57 +0800
In-Reply-To: <15d27282-54b2-2cfe-7f44-2df3be11dd40@gmail.com>
References: <20210705033824.1934-1-chun-jie.chen@mediatek.com>
 <20210705033824.1934-3-chun-jie.chen@mediatek.com>
 <564fa3c8-1d85-5e98-f3f9-f83cb17e905a@gmail.com>
 <15d27282-54b2-2cfe-7f44-2df3be11dd40@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_190903_423640_2ACDF880 
X-CRM114-Status: GOOD (  18.38  )
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

On Mon, 2021-07-05 at 17:45 +0200, Matthias Brugger wrote:
> On 05/07/2021 17:40, Matthias Brugger wrote:
> > 
> > 
> > On 05/07/2021 05:38, Chun-Jie Chen wrote:
> > > This patch adds the mmsys document binding for MT8192 SoC.
> > > 
> > > Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> > 
> > Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> > 
> 
> Of course, that's not what we need here...
> 
> Now pushed to v5.14-tmp/dts64 until v5.14-rc1 is released.
> 
> Thanks!
> Matthias
> 

I see some discussion in [1] and check the implement of afe
driver(soc/mediatek/mt8192/mt8192-afe-pcm.c)
The audsys shoud be documented in mediatek,audsys.txt
I will send v13 to apply it and update dts [2],
sorry for the inconvenience.

[1]
https://patchwork.kernel.org/project/linux-mediatek/patch/20210630180652.1.I88a52644e47e88b15f5db9841cb084dc53c5875c@changeid/
[2]
https://patchwork.kernel.org/project/linux-mediatek/cover/20210616011551.29654-1-chun-jie.chen@mediatek.com/

Best Regards,
Chun-Jie
> > > ---
> > >  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.txt         
> > >  | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git
> > > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.t
> > > xt
> > > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.t
> > > xt
> > > index 78c50733985c..9712a6831fab 100644
> > > ---
> > > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.t
> > > xt
> > > +++
> > > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.t
> > > xt
> > > @@ -16,6 +16,7 @@ Required Properties:
> > >  	- "mediatek,mt8167-mmsys", "syscon"
> > >  	- "mediatek,mt8173-mmsys", "syscon"
> > >  	- "mediatek,mt8183-mmsys", "syscon"
> > > +	- "mediatek,mt8192-mmsys", "syscon"
> > >  - #clock-cells: Must be 1
> > >  
> > >  For the clock control, the mmsys controller uses the common clk
> > > binding from
> > > 
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
