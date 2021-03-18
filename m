Return-Path: <SRS0=MDpP=IQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 119CCC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 02:34:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 831A664EFD
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 02:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 831A664EFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qSIL8pNs8rZ0f0CRcRA1aQ7pXIoWDM01yHOk9U0faxA=; b=a5ShzxBjCX9nNDVacn3uvfd+X
	ZOwSv3BWC7Gw6elTKdtIBxpKVSKX+bc8MPm8Q4nvthwlLzw1cLY9nUzB+6cARP0GtzpiaL+lThHGv
	ZHcHxEuHAGFN47r4jhqstT86pOf+siA1md8azXp2uj89P1qNsCocDuG65IhRGK0InOoZBeDUZrVpu
	S87+yw3mqPe0PP4W2jJjqLrfHYByySAzgjk5VNJlXA5z0ggTBPtiaPp8rap4F5muK8r8w/GV1HPRr
	VImlktoWk48AwkNgqOOg9ocNLU/Gb70eQIBpppbqy9dw/xs258k10EIJhztbJZ8Bbi54mMbNnVaw2
	TjcKpbWCQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMiTz-004Iei-HU; Thu, 18 Mar 2021 02:33:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMiTu-004Idu-Vi; Thu, 18 Mar 2021 02:33:53 +0000
X-UUID: 824f7eb73dea4c23bb288da039e00fe0-20210317
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ncyiACvRA/jFcclY/OBN/Yo/pl71fDIdCQA7DujzOC8=; 
 b=XYhGoq/CpMHo8XKNejxBR605lcE+RjHKjVd4lE0CxDqJjrjMiPkvZ4UuTUhDjDbbFtt1gvEruX6bHHsvK6/YetCi0VahhWAgu1RUbQ9ki313C05Gdf1umRYZ2gmE0R2Madmu/6PImMV0o2Zw0CmjgN3kCXRNG8U0reAlgaaFDiE=;
X-UUID: 824f7eb73dea4c23bb288da039e00fe0-20210317
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 370406481; Wed, 17 Mar 2021 18:33:48 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Mar 2021 19:33:46 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 18 Mar 2021 10:33:42 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 18 Mar 2021 10:33:40 +0800
Message-ID: <1616034820.25733.15.camel@mhfsdcap03>
Subject: Re: [PATCH 08/10] dt-bindings: phy: Add compatible for Mediatek MT8195
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Seiya Wang <seiya.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jonathan Cameron
 <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, "Peter
 Meerwald-Stadler" <pmeerw@pmeerw.net>, Ulf Hansson <ulf.hansson@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Mark Brown <broonie@kernel.org>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fabien Parent <fparent@baylibre.com>,
 Sean Wang <sean.wang@mediatek.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>, Wenbin Mei
 <wenbin.mei@mediatek.com>, Stanley Chu <stanley.chu@mediatek.com>, Bayi Cheng
 <bayi.cheng@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-iio@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <linux-watchdog@vger.kernel.org>, <srv_heupstream@mediatek.com>
Date: Thu, 18 Mar 2021 10:33:40 +0800
In-Reply-To: <YFGkQq1J0g4AKTNZ@vkoul-mobl.Dlink>
References: <20210316111443.3332-1-seiya.wang@mediatek.com>
 <20210316111443.3332-9-seiya.wang@mediatek.com>
 <YFGkQq1J0g4AKTNZ@vkoul-mobl.Dlink>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2A914A0A68FE97BF815737A03C347727B59FF0E01BB1CD724B858EB4526684EB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_023351_530149_564A60E5 
X-CRM114-Status: GOOD (  10.76  )
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

Hi Vinod,

On Wed, 2021-03-17 at 12:10 +0530, Vinod Koul wrote:
> On 16-03-21, 19:14, Seiya Wang wrote:
> > This commit adds dt-binding documentation of UFS M-Phy for Mediatek MT8195 SoC
> > Platform.
> 
> Applied, thanks

Usually, we expect the dt-binding patch is acked or reviewed by Rob
before it's applied?

Thanks a lot

> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
