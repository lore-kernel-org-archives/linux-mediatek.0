Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE8AC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jul 2022 01:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=114OqbIilIYk/ZG9bmz/EEZRgQi1ArBsDYcFor9cB78=; b=GJ00X4kaMdhewigU34A0qwOYcr
	+d3BzpSaV3e1X/uBZlJs5/ApF5RUGDPBybB54RSWIclDn3gNTJtDuMnsu8dx+32uDsNYZI5m00eh/
	jtk8lCgmY/sBk4M1WWeIQSjS6oV7IInkFYFd8aEQCt0K/o2NFWNgmAuUCt14xSidTDALLokKAgsgy
	nXjbirShs2RumEIN5sx2tBP1+rcXXGUlxV1+ZMIAo0pbbb5HAyITTDzTJn43N39IeqOTbGaja5vf8
	Dd+1yUeqTpMU21T3kdLfjCDGik4ae7vof3PLj35ndai4QDz1tNDA3a5vjs3KRNGttwpVq4wt/M6LM
	TYyUBKjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB4l0-006TRr-0i; Tue, 12 Jul 2022 01:32:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB4ko-006TNP-QU; Tue, 12 Jul 2022 01:32:00 +0000
X-UUID: ced79dc842a243af90da624f2e767270-20220711
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:89e43eb0-1175-4642-89e3-103cf2e93794,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:87710264-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: ced79dc842a243af90da624f2e767270-20220711
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <stanley.chu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 212407511; Mon, 11 Jul 2022 18:31:32 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 12 Jul 2022 09:31:22 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 12 Jul 2022 09:31:21 +0800
Message-ID: <338a8290e79c4ca1a061d6d3a38385ce76f2510e.camel@mediatek.com>
Subject: Re: [PATCH -next] scsi: ufs: ufs-mediatek: Fix build error
From: Stanley Chu <stanley.chu@mediatek.com>
To: Ren Zhijie <renzhijie2@huawei.com>, <jejb@linux.ibm.com>,
	<martin.petersen@oracle.com>, <matthias.bgg@gmail.com>, <bvanassche@acm.org>
CC: <linux-scsi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Date: Tue, 12 Jul 2022 09:31:21 +0800
In-Reply-To: <d1474fc0-3eba-f1c3-6e63-0db8ce4ab07f@huawei.com>
References: <20220704025632.235968-1-renzhijie2@huawei.com>
	 <d1474fc0-3eba-f1c3-6e63-0db8ce4ab07f@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_183158_895425_58813113 
X-CRM114-Status: UNSURE (   6.77  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Ren,

On Mon, 2022-07-11 at 09:23 +0800, Ren Zhijie wrote:
> Hi,
> 

Thanks for this fix.

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>


