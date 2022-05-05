Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC30C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 12:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+a0WKE5PIbmHRWC7SwjLAcCpb3iat9W19IErRJq67bM=; b=Xjd014CDgIqF+c
	I1KDkYskWaSGlKdeOTPWKhO9YM7PFysjAS7FlQW0jBhzdaA4YMT0GPA2nRtSi1pihpEorMECYx8yt
	F/gk9xoDIsOE/SFSvH6DhkRVS5J00VNsJqTJ9R+FSXOusJOeB/GGXlDOk7pbMGMOkhawr9mbV8Jvp
	5IHHwEawsjcFr/6VUPpA4rySLnndRrp9Tm4pza2zm3nBjmSZEoVkLXHBWPnJ3GISy7hQU8ZcK+smp
	gZpyID8Wer91J5VDRMew9JfxFTQNi/qTLnnajcRJ2xVxiBvlYvS3diIXDbY+cTGwDrCcyEqiQSRFf
	BBDevmliq8vFThFyDzCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmaL7-00FjGn-Gh; Thu, 05 May 2022 12:12:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmaL2-00FjDB-DV; Thu, 05 May 2022 12:12:11 +0000
X-UUID: a39654655816493aa1ade73466eb4110-20220505
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=9InUCIjH53RNAgxIe88Zm8ZVGpeN3UPxElsoLUC9bzA=; 
 b=chXrvaA7JQ7RtZjFw1W57ek/eN1wKOLzeZisX0n91EBo1jgdW6VrTrNoSMW9h5BSv35Sp6MZTzZo9wFS1IED0jrb6Tzg/72heaA8KhfO3zHIi0saxGl+d+Y72YBT+RM77J7riM2tkXNBvomZfWKUnSBIH8F+kQpu6d4+N2a2elI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:59890fc8-7388-4be8-b805-0408d7a16852, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:8
X-CID-META: VersionHash:faefae9, CLOUDID:3b4d5216-2e53-443e-b81a-655c13977218,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: a39654655816493aa1ade73466eb4110-20220505
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 546856815; Thu, 05 May 2022 05:12:02 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 May 2022 05:12:01 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Thu, 5 May 2022 20:11:59 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 5 May 2022 20:11:58 +0800
Message-ID: <d017583a2472e7d4bf4684b1aabeebd93c80c68b.camel@mediatek.com>
Subject: Re: [PATCH v7 2/2] phy: mediatek: Add PCIe PHY driver
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Chen-Yu
 Tsai" <wenst@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>
CC: Wei-Shun Chang <weishunc@google.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <rex-bc.chen@mediatek.com>,
 <randy.wu@mediatek.com>, <jieyy.yang@mediatek.com>,
 <chuanjia.liu@mediatek.com>, <qizhong.cheng@mediatek.com>,
 <jian.yang@mediatek.com>
Date: Thu, 5 May 2022 20:11:58 +0800
In-Reply-To: <bad44be8-abc7-169f-bc7a-cef3692c9a71@collabora.com>
References: <20220422142331.17173-1-jianjun.wang@mediatek.com>
 <20220422142331.17173-3-jianjun.wang@mediatek.com>
 <bad44be8-abc7-169f-bc7a-cef3692c9a71@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_051208_518575_E9B4E750 
X-CRM114-Status: GOOD (  18.59  )
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

Hi Angelo,

On Tue, 2022-04-26 at 18:06 +0200, AngeloGioacchino Del Regno wrote:
> Il 22/04/22 16:23, Jianjun Wang ha scritto:
> > Add PCIe GEN3 PHY driver support on MediaTek chipsets.
> > 
> > Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> 
> Hello Jianjun,
> there's only one last bit to fix, check below:
> 
> > ---
> >   drivers/phy/mediatek/Kconfig        |  11 ++
> >   drivers/phy/mediatek/Makefile       |   1 +
> >   drivers/phy/mediatek/phy-mtk-pcie.c | 267
> > ++++++++++++++++++++++++++++
> >   3 files changed, 279 insertions(+)
> >   create mode 100644 drivers/phy/mediatek/phy-mtk-pcie.c
> > 
> 
> ..snip..
> 
> > +static int mtk_pcie_read_efuse(struct mtk_pcie_phy *pcie_phy)
> > +{
> > +	struct device *dev = pcie_phy->dev;
> > +	bool nvmem_enabled;
> > +	int ret, i;
> > +
> > +	/* nvmem data is optional */
> > +	nvmem_enabled = device_property_read_bool(dev, "nvmem-cells");
> 
> device_property_read_bool() returns device_property_present().
> 
> I would prefer that, instead, you call the latter:
> 
> 	nvmem_enabled = device_property_present(dev, "nvmem-cells");
> 
> It's the same, yes, but this will increase human readability, as the
> function
> name clearly states the intention here.

Thanks for your review and sorry for the late response, I'll replace it
with 'device_property_present' in the next version.

Thanks.

> 
> Thanks,
> Angelo
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
