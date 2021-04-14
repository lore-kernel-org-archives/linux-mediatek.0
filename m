Return-Path: <SRS0=Strr=JL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37AC6C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 01:43:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93CBE613C3
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 01:43:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93CBE613C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KrWc/IxkkT2sW7YmGDV4ZcsCYFZkmYUNZsMvHUtN3s8=; b=O6Z+4Pns9+pJPwwnTr2SyV85J
	RTVRlj1Ex9JETRYfvnuRxvtI3O3DcKsjEf7mG3RFkBsAdJbJnXF72w11eHXv6DuhfD5jovKXWKHMc
	CLNSHbdJkHixpmr1CHnwC3UO+2R3sJJMjiepVvUQM2nI/K46oUq8ItKGEpaUcEDn0Mr20LLRyAclN
	7Kjcwd7ev8W21p6TLsDZ6/2fzA9NNdkKEsAL9HXLHycixxZTFZ7RR0J1SbffGz+1XQgsd0zqi67+4
	3zc+My2PivXHqD/pYPFVmPE2kY+mSjpv8BbfJmGxCS1W180bQHKmjgffuM98iXpxwDJebcWFlfAx4
	hxZI3vHpg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWUYI-00B5ZS-42; Wed, 14 Apr 2021 01:42:46 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWUXp-00B5XZ-2p; Wed, 14 Apr 2021 01:42:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=ERZ0727hmIntUzrC532APuxYAnO+KGvUIEmZ+WhJ4bg=; b=I5y4T4mAYKJoAt5JFTQLd7d/f5
 T5Mfnes26AUozcgMkVweYY++HycwLDALctFMz5jR0Pb5pUAozk+e29lMG/ZsKsKVAPR06O17Ekth1
 ugsPu6q8UdKbSbPcjk+FyuFtWz1afFrL2RS7gtI4c+96agllahTyzO0VINdi5uHGhdum3rnXBKzWE
 C2c7gFBw0Jl4GXMSGDE3vSdYa1b5jX3AToZOt19UtJ/iuwVsa5zAAaWK9HnM1HyLtNfdyz3A1ORpR
 E9oD4zAzGIPYNubilQV1LHM/ebR6q5j9ATZ8wU3jMJjFlvSdo+sOXRuI9ge/9SXl7fBFSFjdLDhFF
 0qYwZM+g==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWUXl-007QNn-7l; Wed, 14 Apr 2021 01:42:15 +0000
X-UUID: 8c46093832634cf0a0a81af12b98d392-20210413
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ERZ0727hmIntUzrC532APuxYAnO+KGvUIEmZ+WhJ4bg=; 
 b=V0IxJGNu79lCmEr+yS4pCIiSLXo2p/RunrDC6CBO/RGt0jJ76sABb5ffxEurcNJaruzI9czfNSvqs4yU4GVBqR1F6BBBbSZUIoElHCMC3Ag41nsAljeGHAmIMnzEopTWKmJ7nv+yvMcyKpsOGIaEPDW2XrCCJk20bJJ21POT5jc=;
X-UUID: 8c46093832634cf0a0a81af12b98d392-20210413
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1407997332; Tue, 13 Apr 2021 18:42:05 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Apr 2021 18:37:29 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 14 Apr 2021 09:37:26 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 14 Apr 2021 09:37:25 +0800
Message-ID: <1618364244.32225.21.camel@mhfsdcap03>
Subject: Re: [RESEND] i2c: mediatek: Get device clock-stretch time via dts
From: Qii Wang <qii.wang@mediatek.com>
To: Wolfram Sang <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>
Date: Wed, 14 Apr 2021 09:37:24 +0800
In-Reply-To: <20210413201740.GC2751@kunai>
References: <1615622664-15032-1-git-send-email-qii.wang@mediatek.com>
 <20210406194856.GF3122@kunai> <1617797706.32076.1.camel@mhfsdcap03>
 <20210407181936.GA1614@kunai> <1618228994.32225.3.camel@mhfsdcap03>
 <20210413201740.GC2751@kunai>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: BDCD7573E06B32ECD29F8904F8F2797A0FA403DEDB2F512640FACE4A5C84AC0A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_184213_299725_D082BD36 
X-CRM114-Status: GOOD (  17.37  )
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

On Tue, 2021-04-13 at 22:17 +0200, Wolfram Sang wrote:
> On Mon, Apr 12, 2021 at 08:03:14PM +0800, Qii Wang wrote:
> > I can't see the relationship between "i2c-scl-falling-time-ns" and clock
> > stretching, is there a parameter related to clock stretching?
> 
> ( you wrote "i2c-scl-falling-time-ns" above, didn't you mean
> "i2c-scl-internal-delay-ns" instead? )
> 

I am sorry, I have confused your comment with lkjoon's comment in the
last mail. what I actually want to say is "i2c-scl-internal-delay-ns".

> Not yet, and I wonder if there can be one. In I2C (not SMBus), devices
> are allowed to stretch the clock as long as they want, so what should be
> specified here?
> 
> I suggesteed "internal-delay" because AFAIU your hardware needs this
> delay to be able to cope with clock stretching.
> 

If there is not a maximum value for clock stretching,
"i2c-scl-internal-delay-ns" should be a good choice for our hardware,
although it maybe not for clock stretching.

> > If you think both of them will affect the ac-timing of SCL, at this
> > point, "i2c-scl-falling-time-ns" maybe a good choice.
> 
> Do you mean "i2c-scl-falling-time-ns" or "i2c-scl-internal-delay-ns"?
> 

"i2c-scl-internal-delay-ns" is better.

Thanks for your review.
Qii


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
