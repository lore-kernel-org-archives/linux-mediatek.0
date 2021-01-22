Return-Path: <SRS0=vrrm=GZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4079C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 06:29:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54FFD208C7
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 06:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54FFD208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8Sm2nzSgKXSZJu74aRCrLvzAx2fhKd96Yuk1tuVQVLU=; b=RSPi7ynyT0TcIXtDWuqOhJL8s
	rNYSbHuy/dCVXfC8j1uzgUj47BH8QqmMC4bPbPBa209y91r2WOuWG2wCXC31e9PMzWPnb8uquYcUo
	1MocGSnqBckQ4/IkNoyCEJHSmTlH4r3P7+AXNPaNWZBtZCHRZ6U1fdUyUIs+jR6oHr4rZiC2AFXtE
	xkxh3py0koGsM0XUOsMciZUPjPT7oL+tN7xmNp5kUMahMrN5X3xj85BidqQCnMJX6YLmnPiqnVL4T
	prfXzbXjaEDJYlanHl+3BjIYXMJjrMnpeIxCDEUxA08/Te80/23VnXN05sVxzB6r44kyOBj7PKc12
	y3jmY00bA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2pwD-0006TZ-9d; Fri, 22 Jan 2021 06:28:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2pwA-0006Sb-24; Fri, 22 Jan 2021 06:28:52 +0000
X-UUID: 170e0503f8e148b9a68829c88c564878-20210121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=a0rTMIFWNhk4fs2TtcDCGY9yzd82v4FlQ9IFV80sxHw=; 
 b=Il7W/ucbP1OHYnXzi60rdLK32oxay9k6OKlgCbgRG7QOB/nUgbDKLrAGQMmvuByNEtl0kwY1EIoVGW71GioORoBnkcKBXTB4RxwIv4jJ5VarWgbkVbZQs+f8kK7zq2uIYh7CHX2j+uT5v5pUEliKvIx9KlclH25PUsitDKd0dK8=;
X-UUID: 170e0503f8e148b9a68829c88c564878-20210121
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yz.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1144221698; Thu, 21 Jan 2021 22:28:41 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Jan 2021 22:28:39 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Jan 2021 14:28:31 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Jan 2021 14:28:31 +0800
Message-ID: <1611296911.30262.5.camel@mtksdccf07>
Subject: Re: [PATCH v3 1/2] dt-bindings: nvmem: mediatek: add support for
 MediaTek mt8192 SoC
From: mtk23264 <Yz.Wu@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Fri, 22 Jan 2021 14:28:31 +0800
In-Reply-To: <20210103162540.GA3983563@robh.at.kernel.org>
References: <20201221061018.18503-1-Yz.Wu@mediatek.com>
 <20201221061018.18503-2-Yz.Wu@mediatek.com>
 <20210103162540.GA3983563@robh.at.kernel.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_012850_839756_CDA9B9E7 
X-CRM114-Status: GOOD (  21.31  )
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
Cc: devicetree@vger.kernel.org, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Seiya Wang <seiya.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 2021-01-03 at 09:25 -0700, Rob Herring wrote:
> On Mon, Dec 21, 2020 at 02:10:19PM +0800, Yz.Wu@mediatek.com wrote:
> > From: Ryan Wu <Yz.Wu@mediatek.com>
> > 
> > This updates dt-binding documentation for MediaTek mt8192
> > 
> > Signed-off-by: Ryan Wu <Yz.Wu@mediatek.com>
> > ---
> > This patch is based on v5.10-rc7.
> > ---
> >  Documentation/devicetree/bindings/nvmem/mtk-efuse.txt | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> > index 0668c45a156d..e2f0c0f34d10 100644
> > --- a/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> > +++ b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> > @@ -7,6 +7,7 @@ Required properties:
> >  	      "mediatek,mt7622-efuse", "mediatek,efuse": for MT7622
> >  	      "mediatek,mt7623-efuse", "mediatek,efuse": for MT7623
> >  	      "mediatek,mt8173-efuse" or "mediatek,efuse": for MT8173
> > +	      "mediatek,mt8192-efuse" or "mediatek,efuse": for MT8192
> 
> No, "mediatek,efuse" by itself is only for MT8173.
Is it should be modify from "mediatek,mt8192-efuse" or "mediatek,efuse"
to "mediatek,mt8192-efuse", "mediatek,efuse" ?

Regards,
Yz
> 
> >  - reg: Should contain registers location and length
> >  
> >  = Data cells =
> > -- 
> > 2.18.0
> > 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
