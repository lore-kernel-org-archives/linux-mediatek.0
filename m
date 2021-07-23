Return-Path: <SRS0=Y38d=MP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F956C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 06:18:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0ACD60E8B
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 06:17:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F0ACD60E8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+D8XrlmmHgpVTAHH5r1DN6ZIbmxIzvzj4YvaG7dXEgM=; b=DFjLyfYWzdS09r
	yazCAHCUYEIbxGe35XbtOCin/1oNrLu29I+icsiKw7TY6xn5IzyO3twoZ48/6FmzAMt7tX5h5Iw7J
	N/kPvRfybY1neqlvsjTV01zNW+MDea0UVnwx4T1wj1ncD0JVML9KLjqmAamubp7s6B+uOQKZi54fM
	oJrvAJnwMohxZFIA6tJreJOMZrnm7zbDfJosBPSyA54ZmDGgPUFdWac2kkvrqqbdjSwWq2oVRNK+W
	b84gYLEWqa142LCGBQ5u0qrTFjY7KXgTpQghs7JgfOMYkCBL1+do0U9Sveko6K5IdqmYLx/AcRrc3
	S65WvEX3YWxZVF6asECA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6oVJ-003Vx9-Dy; Fri, 23 Jul 2021 06:17:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6oV6-003Vvf-5Y; Fri, 23 Jul 2021 06:17:38 +0000
X-UUID: ca37473a73684123aa95bed778572a5c-20210722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=0+OFaZT+V5fX2+7/ZvRj5IJQIdPcmVaOWGckKOtfowo=; 
 b=Lfg6/IB33Lnv7CNJDQOrTzMkuJjNKGhskppDSSNBZ2N30a+7R6wp5/Y8gsNBuAoedyyD2SWKcS+4SYBu842TLsAmbwvT8oJApwpA4+9+XUgXJkGl0ahbv2tPPYd5OGrMcCiQlVzAj8CF/mEogAS1k6jgpMfVknzBlQe5Yb8Umwc=;
X-UUID: ca37473a73684123aa95bed778572a5c-20210722
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ben.tseng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1945032530; Thu, 22 Jul 2021 23:17:31 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Jul 2021 23:17:29 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Jul 2021 14:17:25 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 23 Jul 2021 14:17:25 +0800
Message-ID: <1f92b245537d6390b7b2bde62ce8b99a3df9d445.camel@mediatek.com>
Subject: Re: [PATCH v5 2/3] thermal: mediatek: Add LVTS drivers for SoC
 theraml zones
From: Ben Tseng <ben.tseng@mediatek.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Fan Chen
 <fan.chen@mediatek.com>, Zhang Rui <rui.zhang@intel.com>,
 <linux-pm@vger.kernel.org>, <srv_heupstream@mediatek.com>
CC: Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <hsinyi@chromium.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Michael Kao
 <michael.kao@mediatek.com>, Yu-Chia Chang <ethan.chang@mediatek.com>
Date: Fri, 23 Jul 2021 14:17:25 +0800
In-Reply-To: <06b1804c-4675-2997-8c5c-bcdffbcfc4a1@linaro.org>
References: <20210617114707.10618-1-ben.tseng@mediatek.com>
 <20210617114707.10618-3-ben.tseng@mediatek.com>
 <06b1804c-4675-2997-8c5c-bcdffbcfc4a1@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_231736_259209_FC74F52A 
X-CRM114-Status: GOOD (  15.04  )
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

On Mon, 2021-06-21 at 13:26 +0200, Daniel Lezcano wrote:
> On 17/06/2021 13:47, Ben Tseng wrote:
> > From: Michael Kao <michael.kao@mediatek.com>
> > 
> > Add a LVTS (Low voltage thermal sensor) driver to report junction
> > temperatures in Mediatek SoC and register the maximum temperature
> > of sensors and each sensor as a thermal zone.
> 
> I think we already talked about that. We don't want a thermal sensor
> driver to aggregate the temperatures but create some kindof virtual
> sensor with a property (min, max, avg, ...) which is usable by
> anyone.
> 
> [ ... ]
> 
> 
> 

Dear Daniel,

Sorry for the late reply.

After survey ,I'm not sure whether the patch[1] is the architecture of
virtual thermal sensor which you commented.

Or, is there any existing framework on mainline already support virtual
sensor?
Could you help to provide reference to us?
Thank you so much.

[1] 
https://patchwork.kernel.org/project/linux-pm/patch/1606466204-31657-1-git-send-email-gao.yunxiao6@gmail.com/

BRs
Ben



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
