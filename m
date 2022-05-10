Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C3CC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 11:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZhFuZtpnf5MuWf1qqXmaI4EebpHBqimDI6nuiBKbpxk=; b=ZqVsmBHNn/8es0
	JPEN8BG3jAvLWtFD3nwo0IMzFDJk9akqjgNjTH/pgPO/Hy35U9EtRsHUUaYMF/RDTHEiIYABV2zc6
	T6vEpSysT3URyEu6kxw874tAuJw1yr+6YWXH1yhBuvvcYkJqi6XoHy+IiVQLZKQyAQwMr7BAWiiyp
	keSfCmmVORw4qF9DDEcp1J/y2nULnbE8l9goOLMXocNrKCJRisKBR5XPSTTU4V615lnjWhEx6KtWS
	OoicQ8Jf5qf0damsfbyOUkpbFffEMvTJ/WSYwFDuV2we6jTgqRmZnaAg619CYKOcH4J0YInvuE/J7
	FiNc30k/4Xms0F40nFcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noNez-001OlA-IH; Tue, 10 May 2022 11:04:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noNem-001Oem-0H; Tue, 10 May 2022 11:03:57 +0000
X-UUID: f09fdebf0f0c46c9ba20dc7c39560dd0-20220510
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=6OxFz0g9u+YzOSW36SUqzu7pbeU+IChmobMWiJLZg54=; 
 b=u5hCJx/2j0NBjS0ylEuHEO7yRt12kWaKnBZVWsElRV4VOooJC5NhKTBosaVTaCBHxe2Dwuhi46EwJ4hrmZhZUn0wSuyfImZgkQqcL2YQQUljvBQ3TN90egWLw72XY69uolWRc9XUiHF/T8kTDPZD8yqNq9Fgox5moEZdlIyxDtE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:3eca3a05-20b6-4e46-a337-fd3b59ccfe33, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:8
X-CID-META: VersionHash:faefae9, CLOUDID:520f47b3-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: f09fdebf0f0c46c9ba20dc7c39560dd0-20220510
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 747072813; Tue, 10 May 2022 04:03:40 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 May 2022 04:03:38 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 10 May 2022 19:03:37 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 10 May 2022 19:03:34 +0800
Message-ID: <b1dc5dbd2f84b068bde5c49b25026b5756841fd2.camel@mediatek.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: mediatek: mt8195: enable usb remote
 wakeup
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Rob Herring <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, 
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Tianping Fang <tianping.fang@mediatek.com>,
 Eddie Hung <eddie.hung@mediatek.com>, Fabien Parent <fparent@baylibre.com>
Date: Tue, 10 May 2022 19:03:34 +0800
In-Reply-To: <1f2ed3a2054c4ab707beb48aca4f3d6e7c601218.camel@mediatek.com>
References: <20220128062902.26273-1-chunfeng.yun@mediatek.com>
 <20220128062902.26273-4-chunfeng.yun@mediatek.com>
 <6707a581-b42c-de13-c8d6-0528955d0218@collabora.com>
 <1f2ed3a2054c4ab707beb48aca4f3d6e7c601218.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_040356_100549_7B334C57 
X-CRM114-Status: GOOD (  11.74  )
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

On Tue, 2022-05-10 at 11:47 +0800, Macpaul Lin wrote:
> On Mon, 2022-01-31 at 10:59 +0100, AngeloGioacchino Del Regno wrote:
> > Il 28/01/22 07:29, Chunfeng Yun ha scritto:
> > > Enable USB remote wakeup of all four xHCI controllers
> > > 
> > > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > 
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > 
> 
> This patch doesn't apply to 'for-next' branch to MediaTek's repo.
> 
> 
https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git
> 
> Dear Chunfeng, could
>  you please update a new version?
Ok, I'll send it out this week.

> 
> Thanks
> Macpaul Lin
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
