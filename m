Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B2CC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 12:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0NptUo6NGxbj7smkihge9/kGBtcVmebMBGOlZBaWWU0=; b=asPFEXrXJNjSSd
	ErpF+e51cS2g61ZO2psF0eUhByVch9Cux1CI4sGkJ2jQFuEGrTvmjHkvq7SWIyo/rULWq+gy5M5OW
	kV6T9+KqJ6XNQFQj/5DfwSWBvFcyO7B+W3+SstXYRMmPDPnRALL3ktq8w8P1P9TW62LeIwN7ICDpU
	CsrrHDo+l9FVX5I7ym4fIJL4lnfIBPfErtXabVb+izFUCHPG8i98SZqbs2jns6tPKXkEdo/Vqqf1I
	Fh2+61PiHpDiXGJgAmp3JuQxUc0zcr4gRU7QROj9y6A/7IuAGJVUudWNo1DipsuIiLClgvmgyT8tB
	9QfPeC3f3MGeH2ShbdKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAAKN-005Sut-W3; Wed, 19 Jan 2022 12:44:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAAKL-005Stc-I8; Wed, 19 Jan 2022 12:44:38 +0000
X-UUID: 4c8159cd1f874510869ca92243fe7905-20220119
X-UUID: 4c8159cd1f874510869ca92243fe7905-20220119
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1104809331; Wed, 19 Jan 2022 05:44:33 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Jan 2022 04:36:46 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 19 Jan 2022 20:36:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 19 Jan 2022 20:36:37 +0800
From: Sam Shih <sam.shih@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
CC: John Crispin <john@phrozen.org>, Ryder Lee <ryder.lee@kernel.org>, "Sam
 Shih" <sam.shih@mediatek.com>
Subject: [PATCH 0/1] Add clock support for mt7986
Date: Wed, 19 Jan 2022 20:36:23 +0800
Message-ID: <20220119123624.10043-1-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_044437_636226_A0EDC349 
X-CRM114-Status: UNSURE (   8.52  )
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

Add clock controller nodes, include 40M clock source, topckgen,
infracfg, apmixedsys and ethernet subsystem.

Sam Shih (1):
  arm64: dts: mediatek: add clock support for mt7986a

 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 68 +++++++++++++++++++++--
 1 file changed, 63 insertions(+), 5 deletions(-)

-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
