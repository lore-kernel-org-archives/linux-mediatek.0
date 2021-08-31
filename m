Return-Path: <SRS0=bg5C=NW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9A36C432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 08:50:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71F536101B
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 08:50:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 71F536101B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w0P9Qj4WX496JfG671GNiurokVkeDmXzYRvdzqD7Ot4=; b=pP5gJjojZp6RvK
	xTbkL9N2mDlZGJuFbvAHiMsHyQFIETTiTxWzMEvUPvKvNjeVJVpXi6VcvWzhUHY5NTkHCep3HqHk1
	BlS5QCBoBgpaZplGqqfw/+AV4h4QjH9IQmKhv+eiFCRrtYi9gIDNlHRG1m2MZFMtXbFAJp79qfbiN
	Q42PQryBuTBFmS68yWCFW44D1caZoVpTFymPlWHbWKM0zX6T6dImLexitRZd9+7lvHeNNEepXk1z5
	fGrSINT6IfdJ19mYk+ltei+eiPfMM86/10lGfeC7lZooYWCWmNNHdBUsn36nMllL6Hl+EqQr7v2sY
	0ryir18VCKB5ypYeOivA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKzTV-001peC-3y; Tue, 31 Aug 2021 08:50:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKzT4-001pbT-CE; Tue, 31 Aug 2021 08:50:10 +0000
X-UUID: 6d0964bc7c7f4403acf0968761397b7c-20210831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=sZFVav08zwMRGHECP5b0bRmeLPWcxHvBk2pMalHXz0k=; 
 b=LOt1ereSFfWZ00qyMF8RyI8pn87xXO/hqHGi+jgxr8qEH5U5gT1paYWZjTL12yUuU7e5UZoHZ54N6IS+Feqtb6OIko2o9kt5HZN8kuaNizZbojyrVe9jnQudrL8r0b9GxOqjfsp4gtAufzJojsUoS6nghFXYiBcuW7oRojIwKLc=;
X-UUID: 6d0964bc7c7f4403acf0968761397b7c-20210831
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 587093507; Tue, 31 Aug 2021 01:50:01 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 Aug 2021 01:48:12 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 Aug 2021 16:48:10 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 31 Aug 2021 16:48:10 +0800
Message-ID: <0d73ada63c3c2949a283ac6830ab9cc84a5e4a41.camel@mediatek.com>
Subject: Re: [PATCH v5 07/11] dt-bindings: mediatek: mt8195: add audio afe
 document
From: Trevor Wu <trevor.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 "Stephen Boyd" <sboyd@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Linux-ALSA
 <alsa-devel@alsa-project.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <bicycle.tsai@mediatek.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>, "Jimmy
 Cheng-Yi Chiang" <cychiang@google.com>, Li-Yu Yu <aaronyu@google.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 31 Aug 2021 16:48:10 +0800
In-Reply-To: <CAL_Jsq+bLVLqqVKfYuXDVYexMojMgZ5p34Pcx7_7LwU40b-2dA@mail.gmail.com>
References: <20210819084144.18483-1-trevor.wu@mediatek.com>
 <20210819084144.18483-8-trevor.wu@mediatek.com>
 <CAL_Jsq+bLVLqqVKfYuXDVYexMojMgZ5p34Pcx7_7LwU40b-2dA@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_015006_473308_377366AC 
X-CRM114-Status: GOOD (  19.44  )
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

On Mon, 2021-08-30 at 07:35 -0500, Rob Herring wrote:
> On Thu, Aug 19, 2021 at 3:43 AM Trevor Wu <trevor.wu@mediatek.com>
> wrote:
> > 
> > This patch adds mt8195 audio afe document.
> > 
> > In order to support dynamic clock reparenting for ADDA and ETDM,
> > PLL
> > and MUX clocks are requested even though they are not consumed by
> > afe
> > directly.
> > 
> > Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> > ---
> > This patch depends on the following series that have not been
> > accepted.
> > 
> > [1] Mediatek MT8195 clock support
> > 
https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/list/?series=501923__;!!CTRNKA9wMg0ARbw!ybm7E80DLLYXs8OujO46SUKYFOUx8gsLZPTE6VDFrGTQ0rAYlJJHOUKhL_ZUSJSLkA$
> >  
> > (dt-bindings/clock/mt8195-clk.h is included)
> 
> This dependency is still not applied, so the example fails. One of
> the
> following needs to happen: the dependency needs to be applied, this
> patch reverted, or drop the use of the defines in the example.
> 
> Rob

Hi Rob,

I send a patch and drop the use of defines.

https://patchwork.kernel.org/project/alsa-devel/patch/20210831083956.9804-1-trevor.wu@mediatek.com/

Thanks,
Trevor

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
