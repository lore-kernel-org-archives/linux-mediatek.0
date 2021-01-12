Return-Path: <SRS0=cYlk=GP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11C8BC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 01:45:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDF5922D6D
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 01:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDF5922D6D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3/i59YRjTY1JZlbMj/g7EGBGNwgOdl8NUmZwwg8tlsA=; b=dpc9A8ryQC2HCJ0fl664OWHrS
	qJ3cns8NBNf1JRxYTF7fsHdR2D/dtl4RKdN1nEEC5VDGUMT/Nqf9iGhDLJ8zZwjA7FWYuNQhMYuyf
	2Y9Fzff30KfTsdE/mhm2gBcn5/gq9wagN5x5IUqcSQ59lHwvPoPXoZJ8R/UyS04q3YKztDUuCeZPQ
	sHRda0E1DPSm05I/xNjpQqkWMgy9Ldoyl5+HsKJoLZco8+S8l54CBDeDvkv7ygY79ic8fo97FlyC2
	cHWRV+qvnhnS00E3EacC4kBFlRkg1IvFGdQPibx4nAnSji8suiCivk4Xr9yMjAe/wBbIYA6nRRD57
	wnRkzwTwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz8jq-0002O9-4o; Tue, 12 Jan 2021 01:44:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz8jm-0002Mx-G3
 for linux-mediatek@lists.infradead.org; Tue, 12 Jan 2021 01:44:48 +0000
X-UUID: 2fb55713a72d4b1f8258e047de4c276b-20210111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ZSNLc9PihXO6nuOHATGPf5myu+2eUyDH8fhV6ZmKRZo=; 
 b=T+F4bi2v1/FRrc6dZtq9W6TfUcWdz7QGspkVCEXJ7BWEIR7VQIM59UvjAy3ybTTeploLEeVfUvNDFg5qB8q0+5lfm6Sx50O3ueS791Ho7mhbIkK7BHniLGfhbc2qz+yQjbe7jrZmIYTIWcOTBwQ9Q9WM45PsKE/da6kZh+q3vAI=;
X-UUID: 2fb55713a72d4b1f8258e047de4c276b-20210111
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1231426531; Mon, 11 Jan 2021 17:44:43 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Jan 2021 17:42:34 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Jan 2021 09:42:32 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 12 Jan 2021 09:42:32 +0800
Message-ID: <1610415752.4985.16.camel@mtksdccf07>
Subject: Re: [PATCH] mac80211: fix incorrect strlen of .write in debugfs
From: Shayne Chen <shayne.chen@mediatek.com>
To: Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 12 Jan 2021 09:42:32 +0800
In-Reply-To: <036e334c2a0a2ebaf940d3f7ae03ab0d9f7c45fb.camel@sipsolutions.net>
References: <20210108105643.10834-1-shayne.chen@mediatek.com>
 <0efec65815ff9e26b3da69cb35d503a90086760c.camel@sipsolutions.net>
 <1610345954.4985.7.camel@mtksdccf07>
 <036e334c2a0a2ebaf940d3f7ae03ab0d9f7c45fb.camel@sipsolutions.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2A3869795AF4D62E00F733F95164FA99692B98361A0380456F173D3EC3EA12832000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_204446_793105_8FFD70B0 
X-CRM114-Status: GOOD (  15.60  )
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
Cc: Toke =?ISO-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Sujuan Chen <sujuan.chen@mediatek.com>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2021-01-11 at 13:10 +0100, Johannes Berg wrote:
> On Mon, 2021-01-11 at 14:19 +0800, Shayne Chen wrote:
> > 
> > Regarding the case "10\n\0\0\0\0", both count and strlen() fail to get
> > the correct strlen.
> 
> Yeah.
> 
> I don't think we need to worry about this case.
> 
Got it.
> > # echo "10\n\0\0\0\0" > /sys/kernel/debug/ieee80211/phy0/airtime_flags
> > airtime_flags_write: count = 13, strlen = 15 
> > > > +	buf[count] = '\0';
> > > 
> > > But if count == sizeof(buf) then this is an out-of-bounds write.
> > > 
> > > Same for all the other copied instances.
> > > 
> > > johannes
> > > 
> > 
> > Should we consider this kind of case here?
> 
> Sure, we're at the kernel/userspace trust boundary, we can't just read
> out-of-bounds? Or what do you mean?
> 
> johannes
> 
> 

Sorry, I put the reply in a wrong place.
I meant should we consider the case "10\n\0\0\0\0" here.

Will send v2, thank you.

Shayne
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
