Return-Path: <SRS0=9FsO=BR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F4BEC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 01:16:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DC92206B5
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 01:16:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sSntAcSm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZRLmt8au"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DC92206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nC2jtHMuB42wPIzzEscHyZ9nSzIK6nhHD2Gs055XQXA=; b=sSntAcSmpREnrRMSJpy6uWXis
	i59O1cA3YOyFlXkNT51pWk7+fbMmiZMhLSb72ipekbzs2D4bNfcM0szdHdvwndwmDlnZQ6yJIDyge
	FekqooZNwZ50ZVWD3uzA+ONQupmgl6P9Pc/b92nkIlEQtfj2+d8x2EENKyixpSYUEDRtCgeg/oNkK
	h6B3z+6DPQQF+cfETMMtgN0N+BKHwfAVTT2DiKZsnXVHU2jmCrGo+34oll7zuRBX7YxywJbduap7K
	l+q6vGnU54jON5l/IUVTZyZiObkEmEDEe9RqaMNGMywYEjWuA67xRfHr90gFwa3IBpEDJU6t5kc5D
	jzrcoj/FQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3qzW-0003I4-6V; Fri, 07 Aug 2020 01:16:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3qzQ-0003HT-6c; Fri, 07 Aug 2020 01:16:09 +0000
X-UUID: 26db6d71d9d34bcca563d3e60940decc-20200806
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=G4GxAPQqpd+NBS9oJCQUn487GFr6GbmdKg9Au8QZObs=; 
 b=ZRLmt8augMyTp+c3jXYI99SYRnMzNRYCfUmWSn/6LEyobabvLguovX6N5LEAH3PotQSYszq6ie+3oI1lXoDcUzSB4wg5t4o1nyCPT8nVX3RWcuhHg+18Kwa/7/K2e3oAmx7YNdWTWaLxKWqHSAz2VXbIKJRs0jaVfdH24qhnToo=;
X-UUID: 26db6d71d9d34bcca563d3e60940decc-20200806
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1974809056; Thu, 06 Aug 2020 17:16:00 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Aug 2020 18:05:58 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs02n1.mediatek.inc
 (172.21.101.77) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 7 Aug 2020 09:05:56 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 7 Aug 2020 09:05:55 +0800
Message-ID: <1596762313.8263.9.camel@mhfsdcap03>
Subject: Re: [PATCH] i2c: mediatek: Fix i2c_spec_values description
From: Qii Wang <qii.wang@mediatek.com>
To: Matthias Brugger <mbrugger@suse.com>
Date: Fri, 7 Aug 2020 09:05:13 +0800
In-Reply-To: <6e029d96-6171-0006-a5bb-01d0d5a7391b@suse.com>
References: <c410f784-7b51-0d65-7a41-3845214dd273@gmail.com>
 <1596712005.8263.4.camel@mhfsdcap03>
 <6e029d96-6171-0006-a5bb-01d0d5a7391b@suse.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_211608_487896_A3AE6AD5 
X-CRM114-Status: GOOD (  20.49  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: wsa@the-dreams.de, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-08-06 at 15:35 +0200, Matthias Brugger wrote:
> 
> On 06/08/2020 13:06, Qii Wang wrote:
> > On Thu, 2020-08-06 at 11:48 +0200, Matthias Brugger wrote:
> >> The struct i2c_spec_values have it's members documented but is missing the
> >> starting '@', which leads to warings like:
> >>
> >> drivers/i2c/busses/i2c-mt65xx.c:267: warning: Function parameter or member
> >> 'min_low_ns' not described in 'i2c_spec_values'
> >>
> >> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> >> ---
> >>    drivers/i2c/busses/i2c-mt65xx.c | 8 ++++----
> >>    1 file changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> >> index e889f74703e4..f51b35fc400f 100644
> >> --- a/drivers/i2c/busses/i2c-mt65xx.c
> >> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> >> @@ -253,10 +253,10 @@ struct mtk_i2c {
> >>
> >>    /**
> >>     * struct i2c_spec_values:
> >> - * min_low_ns: min LOW period of the SCL clock
> > 
> > Can you help me add a description of min_high_ns. As
> > @min_high_ns: min HIGH period of the SCL clock
> 
> Right, I forgot about this one.
> 
> Actually I don't see any code which uses the value, so I think it should be 
> deleted from the struct.
> 
> Do you have any thoughts on this.
> 

That is right, it is used for internal test before. You can deleted it.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
