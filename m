Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6F0EC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 02:00:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1EE720787
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 02:00:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dNBNUVym";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hCj36RiE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1EE720787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zXOlHnX2OYX6r6JNEl417RrZDV3kXoewhlU55WkRzTU=; b=dNBNUVymWSa8GB2GtO5/6KFQj
	4lA2kMgpfX/6+KRd+pTZlhJN+YfcGlYW7LSW9ODTwWYIVjPa6d9eC3DwYgdlMda2TMzakmfsJaCOv
	r36vppa9rk+T8I4i2pnLfF4sN41F82F8KzjMJrndTBfrTPG6FdN3vA3ACbNKQEWDJS4u0WwVtDYT9
	GQ74FOwEuctIpIGSRSYJfZuEqeXbkB0HPOZ0moVK3q+I/b+7vNyjLXIKNrMVEZbL+wcnjfb7Y9gFu
	ZJCC81wNnUrJSkOKgSmWqwtzA5AzYYPFcel2RzRXB7W1A2bPXc2nr/JPr/iPNow/4fv7prFvN+doJ
	zu+nyUcSg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy42v-0001T9-Bx; Wed, 22 Jul 2020 01:59:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy42s-0001SZ-Fq; Wed, 22 Jul 2020 01:59:47 +0000
X-UUID: 10adcda7c5454cfe99188a54e19e4d91-20200721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=HBs3aJUcIVxX1irCDgPsr1t6Sr5uliFctbO3YQ/k1Z0=; 
 b=hCj36RiEwIWbCdUWFFXm6ZVLELzbf7n6NNUclkHRzM6SZFmO5xaTMdJxTgH3hLLiYPHydUdkMURVM7mxcweXJ15cclEAPYZB8931jNp9Zk48q37kGzSza8GfXZyGpQfmbYCkcZP9UpBjAu9KHYv7wuKnOT8LQ+5yOmWozy6OoB0=;
X-UUID: 10adcda7c5454cfe99188a54e19e4d91-20200721
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 307328422; Tue, 21 Jul 2020 17:59:39 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jul 2020 18:59:37 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 09:59:29 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 22 Jul 2020 09:59:29 +0800
Message-ID: <1595383170.14937.2.camel@mtkswgap22>
Subject: Re: [PATCH v2] usb: gadget: configfs: Fix use-after-free issue with
 udc_name
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 22 Jul 2020 09:59:30 +0800
In-Reply-To: <20200721113353.GA1686460@kroah.com>
References: <1594881666-8843-1-git-send-email-macpaul.lin@mediatek.com>
 <1595040303-23046-1-git-send-email-macpaul.lin@mediatek.com>
 <1595041133.23887.4.camel@mtkswgap22> <20200721113353.GA1686460@kroah.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_215946_674461_A5CF4F17 
X-CRM114-Status: GOOD (  14.47  )
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
Cc: Felipe Balbi <balbi@kernel.org>, Eddie Hung <eddie.hung@mediatek.com>,
 Mediatek WSD
 Upstream <wsd_upstream@mediatek.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Macpaul Lin <macpaul.lin@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-07-21 at 13:33 +0200, Greg Kroah-Hartman wrote:
> On Sat, Jul 18, 2020 at 10:58:53AM +0800, Macpaul Lin wrote:
> > On Sat, 2020-07-18 at 10:45 +0800, Macpaul Lin wrote:
> > > From: Eddie Hung <eddie.hung@mediatek.com>
> > > 
> > 
> > Well, it's strange, I simply replaced the uploader's name to my
> > colleague, git send-email pop up this line automatically.
> > 
> > Shouldn't I do that kind of change. It did not happened before.
> > Do I need to change it back and update patch v3?
> 
> Who is the real author of this, Eddie or you?  If Eddie, this is
> correct, if you, it is not.
> 
> thanks,
> 
> greg k-h

It is Eddie! I just changed the uploader to the correct author from my
working tree!
Thanks!

Regards,
Macpaul Lin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
