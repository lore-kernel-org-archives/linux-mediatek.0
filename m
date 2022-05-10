Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8BDC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 03:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nLnvksd188Pbt15lDWIVharCbFCyJMzkPTvar55M43o=; b=iuwT/U0P29aufW
	780i+yyD55rh03B2jniVZF8uoEX7Fo9rXsVPSrnd93iHZ10+OOPrAqS9uib2DkYgMDoKBgkhu2BkJ
	gO/rncf2cBVJ6lpP9ryOUDLa7dBPUEq/8zp49kcBxceiyp+P25GIidc879xPUsTA/K7S82matThdR
	WdPozqoJHQ9vTNmKPb6RtAmzTSDevFVhZw8zbo3L6aLX2d+Qf1pzNBMomMi+Fw0gglcetlFMUhbka
	tASGCYlVxHeLESJDiWRPoPXZ2rfCaLN/PdRCU0TEnABmdnb1xRYemipH9UNCX7LXAYtzJwcFe4hpC
	MrFUT+B4y0jBCPG20WKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noGpN-00HO7L-PC; Tue, 10 May 2022 03:46:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noGpB-00HO6B-CC; Tue, 10 May 2022 03:46:16 +0000
X-UUID: 908ff7ab726d47e3ae1f29d252579560-20220509
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:1f2d58a6-7eae-4926-bb19-a91bad741891, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:8
X-CID-META: VersionHash:faefae9, CLOUDID:38dc34b3-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 908ff7ab726d47e3ae1f29d252579560-20220509
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1496512861; Mon, 09 May 2022 20:46:07 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 May 2022 20:36:04 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 10 May 2022 11:36:02 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 10 May 2022 11:36:02 +0800
Message-ID: <0fed7d2383c1b8367d22fe4f2cccf91b207e14e5.camel@mediatek.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: mediatek: mt8195: add efuse node and
 cells
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Fabien Parent <fparent@baylibre.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mathias Nyman
 <mathias.nyman@intel.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tianping Fang
 <tianping.fang@mediatek.com>, Eddie Hung <eddie.hung@mediatek.com>, "Linus
 Walleij" <linus.walleij@linaro.org>, Macpaul Lin <macpaul.lin@gmail.com>
Date: Tue, 10 May 2022 11:36:02 +0800
In-Reply-To: <6e26f483-f4b6-0d0f-7cca-cfa19a39b10a@mediatek.com>
References: <20220128062902.26273-1-chunfeng.yun@mediatek.com>
 <20220128062902.26273-3-chunfeng.yun@mediatek.com>
 <YgY3qvAy5lW1tEdG@kroah.com>
 <6e26f483-f4b6-0d0f-7cca-cfa19a39b10a@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_204613_453713_AB00A5B9 
X-CRM114-Status: GOOD (  20.08  )
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

On Wed, 2022-02-16 at 17:38 +0800, Macpaul Lin wrote:
> 
> On 2/11/22 6:17 PM, Greg Kroah-Hartman wrote:
> > On Fri, Jan 28, 2022 at 02:29:01PM +0800, Chunfeng Yun wrote:
> > > Add efuse node and cells used by t-phy to fix the bit shift issue
> > > 
> > > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > ---
> > > v2: use hw auto load for u2phy which has no this issue
> > > 
> > > Note:
> > > 
> > >   depend on the reviewing patch:
> > > 
> > > [v9,3/3] arm64: dts: Add mediatek SoC mt8195 and evaluation board
> > > 
https://urldefense.com/v3/__https://patchwork.kernel.org/patch/12711296__;!!CTRNKA9wMg0ARbw!0Jg8kLN4kBw0LcbiAH1HYTq2uQ5VwiD-CE8yoFBD7oApn8YNSdmVpwSdY1q2C7LvY6c$
> > 
> > As I don't have that in my tree, I can only take the first 2
> > patches
> > here now, thanks.
> > 
> > greg k-h
> > 
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > 

Tested-by: Macpaul Lin <macpaul.lin@mediatek.com>

This patch has been
tested with:
 - "for-next" branch in MediaTek tree [1].

https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git 
 - added more debug log to confirm efuse probing status at my local.
  -
If probe success, it won't show any log.

Thanks
Macpaul Lin


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
