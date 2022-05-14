Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6C5C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 May 2022 17:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gOWdjd+gOOyxlWncDbb517yC/VYMqRvuKInoy467TiA=; b=gxlYRSpsBs4p+D
	VYDJToIYpMZBvUIjWCacNO5K1Mu4XMyCYjXK6bR32swpoZ8+80A08WYEtJYm77XMZRnR1Mx1sqa7O
	vI5wv7Ou3vWUq1CXXRWznTb0QzuGi2GpjtKipFgJoqSlWelM+xUEErq8Uw+mwpP2sIYnkcR8z+KSz
	K9Vmr0QeRgcu45/VR6EL6N3oijcH1ZLnoCwDZeH4pbbUTF+Ny/q72QDqg877IoXzsADZmcU7RYGPd
	qSlDrev9XNQw+VTjAsFGqZ6bn0UCfCVCIlOZK+qlwM064lZWyEIt9yiiqyktjhnpJ2wsZvw+zAYHT
	IsLegIXJpYMcaAe3Oi1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npvLD-001uIR-RZ; Sat, 14 May 2022 17:14:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npvLB-001uHF-EG; Sat, 14 May 2022 17:14:06 +0000
X-UUID: 0fc43e1f74cd4568ac39aec0833c7973-20220514
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:8e0e199d-0d99-4f2d-8149-6484fd6c0817, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:08f237f2-ab23-4aed-a67b-f96514452486,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,IP:nil,URL:0,File:ni
 l,QS:0,BEC:nil
X-UUID: 0fc43e1f74cd4568ac39aec0833c7973-20220514
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1044985582; Sat, 14 May 2022 10:13:59 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 14 May 2022 10:07:54 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 15 May 2022 01:07:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Sun, 15 May 2022 01:07:53 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <wenst@chromium.org>
CC: <angelogioacchino.delregno@collabora.com>, <chun-jie.chen@mediatek.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <miles.chen@mediatek.com>,
 <mturquette@baylibre.com>, <rex-bc.chen@mediatek.com>, <sboyd@kernel.org>
Subject: Re: [PATCH v2 11/11] clk: mediatek: mt8173: Switch to clk_hw provider
 APIs
Date: Sun, 15 May 2022 01:07:52 +0800
Message-ID: <20220514170752.30825-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220510104804.544597-12-wenst@chromium.org>
References: <20220510104804.544597-12-wenst@chromium.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220514_101405_535675_F5C7F824 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
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

> As part of the effort to improve the MediaTek clk drivers, the next step
> is to switch from the old 'struct clk' clk prodivder APIs to the new
> 'struct clk_hw' ones.
> 
> The MT8173 clk driver has one clk that is registered directly with the
> clk provider APIs, instead of going through the MediaTek clk library.
> 
> Switch this instance to use the clk_hw provider API.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Miles Chen <miles.chen@mediatek.com> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
