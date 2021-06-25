Return-Path: <SRS0=Skuz=LT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0117C49EA7
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 06:26:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99DA561404
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 06:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99DA561404
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+dzaeP/TEULtjZueDhauXvyyVNDhTS4CoBRJmCAjpt8=; b=vRw73Th4FfLSZC
	C54rcYfn/Nyk1e4qw9wqTkRwLgu9NwSgbCQxmnAHpVR99qlF1kjbGHWKraVLEYIGi8cavvQR5I1e3
	tVQH+zgxLPqWFM6H54BPb2DddjWvsCuTJZcrxkuR4Y9D9g5jNVn7vLmX1NNoALNdv0KuGav/a4XKU
	UDgKVp++MbSi5qH9SPwd83nG+ogU6xR01fsdYc7QctO5/RTTInupqEOaTW6+iYzHjl7dKbb+T6RBq
	s9gmU8oPx370Pbr2w0O0QnbPbJOq6asd6jHg0uz6vxbJr04oxmhjbWGaA0uJm/Mu4tKkDjaitBMJY
	OU4s2Atdm3rxGK7rZMsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwfIE-00HP4Y-LD; Fri, 25 Jun 2021 06:26:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwfIA-00HP2R-HK; Fri, 25 Jun 2021 06:26:21 +0000
X-UUID: 33fe199a7e2e4ad19e3b25717ebef6bf-20210624
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=gbrYq07dAzm8K9NW7hLU0ClCxJK/K27I+6hS1itqntk=; 
 b=pxmKFZmpK+BQ2dXidfedmrPCvyfG9pDbGcFDbxviG25ip6+JE6SLUCdKP7KY+n+pJUFQZYVhZNscokw9fuR4hh+cMPfHew0L97ZTSbOx9tTbMzCyN7fYX4JPVs4BvTfGt+oCHy4nUwB/JPcbnhduT8ZNJGnGaK42h0+HV9wdsjo=;
X-UUID: 33fe199a7e2e4ad19e3b25717ebef6bf-20210624
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 267249273; Thu, 24 Jun 2021 23:26:13 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Jun 2021 23:16:10 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Jun 2021 14:16:03 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Jun 2021 14:15:55 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Hideaki YOSHIFUJI
 <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Felix Fietkau <nbd@nbd.name>, John Crispin
 <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Mark Lee
 <Mark-MC.Lee@mediatek.com>, <netdev@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <bpf@vger.kernel.org>, <wsd_upstream@mediatek.com>, <chao.song@mediatek.com>, 
 <kuohong.wang@mediatek.com>, Rocco Yue <rocco.yue@mediatek.com>
Subject: Re: [PATCH 1/4] net: if_arp: add ARPHRD_PUREIP type
Date: Fri, 25 Jun 2021 14:01:07 +0800
Message-ID: <20210625060107.14098-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <YNSDQbp/h/aadpmV@kroah.com>
References: <YNSDQbp/h/aadpmV@kroah.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_232620_093224_928804FF 
X-CRM114-Status: GOOD (  15.18  )
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

> Does changelog mean adding these details to the commit message ?
> 
> Yes please.
> 

will do.

> > > And are these user-visable flags documented in a man page or something
> > > else somewhere?  If not, how does userspace know about them?
> > > 
> > 
> > There are mappings of these device types value in the libc:
> > "/bionic/libc/kernel/uapi/linux/if_arp.h".
> > userspace can get it from here.
> 
> Yes, they will show up in a libc definition, but where is it documented
> in text form what the flag does?

Judging from the changes of ARPHRD_xxx submitted before, I am sorry
I could not find the corresponding doucuments to describe their 
respective behaviors in details. Perhaps the best way to understand
their behaviors is to read the code directly.

Thanks,
Rocco
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
