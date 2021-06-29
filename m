Return-Path: <SRS0=olbE=LX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AACDDC11F67
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jun 2021 12:21:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C97B61D8B
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jun 2021 12:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C97B61D8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L7EHyUsdFIx9p5ev+EguJ4zM3vZ7UvwoMAc7GF4isnY=; b=Sb/QnJIg5W5ajy
	lJClpvEvxQZKLUQbU7CIzLcYqNx8IwhbpUbRxmPCfqZUc1/i72IZZfQNdDgCzy5/YfeFCW79zcNBh
	nXCoqmxopCcFDq1iHXvlhsBfy3tEVpF5q489YLizzWuO8Y4WCrV956H4n+6ohqhR56P3jv7y/NAE2
	xN+10jFnt/zDYBViJWphkLRs/3tfJYXR6TA8paoefRmI7g3en+XUtwM+CQvWU4rnG5Ys3PNq3j4jU
	qu/aKIKbpOv33dVlZDDA9joCwvQb9ONiOc4hsykPbvk/O6KkzXC5neaP63gstTk3ip5YZCpsuhLXR
	AFFDei4ux3bFFNGv+g2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyCjf-00Ao3X-Gd; Tue, 29 Jun 2021 12:21:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyCjQ-00AnyW-Q8; Tue, 29 Jun 2021 12:20:50 +0000
X-UUID: 8296b1f858914a0fb9276ea5d2c322d8-20210629
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=4SbG1vndPjwBWteOUa61pelj+E3Mh/QyjRjIiC1LL3s=; 
 b=kt4DZhFF3c3qEU+rHgUIkRCJ65aiuh9VZPAoBNm0UUHyEc+i9i4qh8107WVX5qavw/gN1w3KZ4XG/XKmEEyr+s5FaRuJiZX8yfeLuny12Bf61yqxQjpk8sJ+pFDV2Mem95Lfi/jUiN5WXQm/YUlI8nEUSOeEq1u8ls5smIZxl4o=;
X-UUID: 8296b1f858914a0fb9276ea5d2c322d8-20210629
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <kewei.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 252339832; Tue, 29 Jun 2021 05:20:43 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Jun 2021 05:12:58 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 29 Jun 2021 20:12:48 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Jun 2021 20:12:47 +0800
Message-ID: <1624968767.5647.2.camel@mhfsdcap03>
Subject: Re: [PATCH 2/3] i2c: mediatek: Dump i2c/dma register when a timeout
 occurs
From: Kewei Xu <kewei.xu@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, <wsa@the-dreams.de>,
 <robh+dt@kernel.org>, <linux-i2c@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
 <qii.wang@mediatek.com>, <qiangming.xia@mediatek.com>,
 <liguo.zhang@mediatek.com>
Date: Tue, 29 Jun 2021 20:12:47 +0800
In-Reply-To: <CA+Px+wU8qqEDU+bV0QpoJssNOxebutzRGgHo6WpC9VFJwckKKQ@mail.gmail.com>
References: <1623122200-1896-1-git-send-email-kewei.xu@mediatek.com>
 <1623122200-1896-3-git-send-email-kewei.xu@mediatek.com>
 <54301510-e0d5-0762-1979-b194b8fd5eb8@gmail.com>
 <1623206624.14050.10.camel@mhfsdcap03>
 <CA+Px+wU8qqEDU+bV0QpoJssNOxebutzRGgHo6WpC9VFJwckKKQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 99D115C5B010B0D7F3D44B52D5ED0835CC3A0712A95D069472FE4D2D1B8632C52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_052048_919511_8D00218E 
X-CRM114-Status: GOOD (  16.61  )
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

On Tue, 2021-06-29 at 12:19 +0800, Tzung-Bi Shih wrote:
> On Wed, Jun 9, 2021 at 10:44 AM Kewei Xu <kewei.xu@mediatek.com> wrote:
> >
> > On Tue, 2021-06-08 at 16:01 +0200, Matthias Brugger wrote:
> > > Is this offset only for mt8192 or also for mt8183?
> > > In any case that should go in as another patch. Either a fix or a new
> > > mt_i2c_regs_v3[]
> >
> > This offset value is suitable for the IC of mt_i2c_regs_v2 hardware
> > design similar to mt8192/8195, not for 8183.
> >
> > The reason for the modification here is that the previous
> > offset information is incorrect, OFFSET_DEBUGSTAT = 0XE4 is
> > the correct value.
> 
> Please submit another patch for fixing the incorrect value.

Okay, I will resubmit a patch to fixing the incorrect value,Thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
