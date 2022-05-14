Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54E5C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 May 2022 02:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=paPR9O+rYczQxXpnVivtw+Deu+GzewGuoyZd67TWOrk=; b=nmpnOGNxfVAmTU
	HxoojfFckvlKxe7OKMCTi9/8l4djezahfjhkEvOGuB1tBUNDfQBBqhynbrxcmfmq0Xx+31XBPCPpI
	p0rusRoEeEjl7D2j56UxjZ2O4T4HZoP8FH2FXCHx/2WS0hYq1r1f8a91r0Czoi42kWTtSB+hnShhP
	Hp0h8wL0s3XCuKZJ04N9Zh5cAmUr7XhZh3R+bi/niuet6xqGykGqmfvbREnu8E99ufnBl86agtjBr
	f2GyrdIgvJxpDCmr2tGyikp4DibSs04sveDN4GIci/EJGOlVsiszP8QMKrbRom7bHKurogv/Iz5Dl
	P/NIMlj7Ab69c47EEu0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nphE6-000XpS-Q9; Sat, 14 May 2022 02:09:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nphDv-000Xop-CX; Sat, 14 May 2022 02:09:40 +0000
X-UUID: fa229108ad7d4e4e9dbdbba3b5874a45-20220513
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=9teMcagqsxAXKChtQkCxA8NEt1nHB6bNrTJieh4lJd0=; 
 b=H+VRJiPXXR9bzqpj1cbwsnd8VGdottz0B4/1NRTzXC9WRdi73F5qKODM7QAb6NcTw0jKyrOgekfIqIKNFUlMB6thppuQXm5vfTkW/U6R0IoxQGtTRvsSgD5whQLJTKn8D0ga6glPoCbSOt3zsj6T//oLgvv/Tuozh1cAmRijuAQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:f7146bfa-7f42-48e4-9327-d4c560d15b3a, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:9,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:14
X-CID-META: VersionHash:2a19b09, CLOUDID:991c43a7-eab7-4b74-a74d-5359964535a9,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:3,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: fa229108ad7d4e4e9dbdbba3b5874a45-20220513
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1036240584; Fri, 13 May 2022 19:09:31 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 13 May 2022 19:09:29 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sat, 14 May 2022 10:09:28 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Sat, 14 May 2022 10:09:27 +0800
Message-ID: <65a0a606e5a53a4ca8dddbe59388c78280d60dd1.camel@mediatek.com>
Subject: Re: [PATCH v3 0/2] MediaTek TTBR up to 35bit support
From: Yong Wu <yong.wu@mediatek.com>
To: <yf.wang@mediatek.com>
CC: <wsd_upstream@mediatek.com>, Libo Kang <Libo.Kang@mediatek.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Date: Sat, 14 May 2022 10:09:27 +0800
In-Reply-To: <20220512144557.18025-1-yf.wang@mediatek.com>
References: <20220512144557.18025-1-yf.wang@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_190939_477916_8CCA8E36 
X-CRM114-Status: GOOD (  14.57  )
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

On Thu, 2022-05-12 at 22:45 +0800, yf.wang@mediatek.com wrote:
> This patchset adds MediaTek TTBR up to 35bit support.
> 
> 
> Changes in v3:
> - Add version changes description, there is No new code change in V3.
> 
> Changes in v2:
> - Update patch and commit message
>   - Add Level 1 pgtable PA up to 35bit.

Why add this for lvl1 pgtable? Did you get real problem?

lvl2 pgtable is allocated/freed dynamically, it may be allocated failed
in ZONE_DMA32 when burning test. But the lvl1 pgtable only is allocated
once after bootup. I think this is no need for lvl1 pgtable.

>   - This is new feature, remove stable@vger.kernel.org
>   - Update commit message.
> 
> Ning Li (2):
>   iommu/io-pgtable-arm-v7s: Add a quirk to allow pgtable PA up to
> 35bit
>   iomm/mediatek: Allow page table PA up to 35bit
> 
>  drivers/iommu/io-pgtable-arm-v7s.c | 56 ++++++++++++++++++++++----
> ----
>  drivers/iommu/mtk_iommu.c          | 29 +++++++++++++---
>  include/linux/io-pgtable.h         | 15 +++++---
>  3 files changed, 77 insertions(+), 23 deletions(-)
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
