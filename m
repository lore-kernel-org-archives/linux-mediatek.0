Return-Path: <SRS0=fhAu=QD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BBD3C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 02:27:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31ED361B97
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 02:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 31ED361B97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KZfDwZw3Q2lERWOJMBcEDBoM4PVd/5HT+YqaoS1UETU=; b=V5+5+Sb4q8eB+X
	Z1KwDBUkdf7M/hzO3HyKSl2uEbKLJ6m6hI0WnaIpin7UOmpbPNmwxpKzIwm+j3BJpYieI06518MqZ
	+ilJyMGF3G045vTXxVoar4OTZUbmTB0/9wiJhESq9AdgAevriH8uON31vUPDR06bUkO3KFbrJJZz8
	iQ9PC73/OoB7c5XtDIiFDuWBYhSnYPsMPuQctnOwGgzDczKeH8V+nPllleLOmdoQ7xw5bRjnMF7le
	QfJIDHZ5QPVClsn4IXSClN1i+R2ddO09i76EBCmS6ALDPD3fwnJLzGMChE6OQFthOIwFyd6/PmAnE
	NBhba1kY2Td//EGthRGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmoBR-000431-Ju; Tue, 16 Nov 2021 02:26:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmoBM-00042H-En; Tue, 16 Nov 2021 02:26:51 +0000
X-UUID: 5432c786d45840a8b9899a64c1955db9-20211115
X-UUID: 5432c786d45840a8b9899a64c1955db9-20211115
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1974669310; Mon, 15 Nov 2021 19:26:36 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Nov 2021 18:26:35 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Nov 2021 10:26:34 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 16 Nov 2021 10:26:33 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: <dsahern@gmail.com>
CC: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Hideaki YOSHIFUJI
 <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <Rocco.Yue@gmail.com>,
 <chao.song@mediatek.com>, <zhuoliang.zhang@mediatek.com>, Rocco Yue
 <rocco.yue@mediatek.com>
Subject: Re: [PATCH net-next] ipv6: don't generate link-local addr in random
 or privacy mode
Date: Tue, 16 Nov 2021 10:21:45 +0800
Message-ID: <20211116022145.31322-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <de051ecb-0efe-27e2-217c-60a502f4415f@gmail.com>
References: <de051ecb-0efe-27e2-217c-60a502f4415f@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_182648_520660_202056DE 
X-CRM114-Status: GOOD (  16.14  )
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

> On Sun, 2021-11-14 at 00:34 +0800, David Ahern wrote:
>> On 11/13/21 1:46 AM, Rocco Yue wrote:
>> 
>> Gentle ping on this patch. :-)
>> 
> 
> you sent the patch in the merge window; I believe it has been dropped
> from patchworks.
>

Hi David,

Thanks for your reply.

Due to I can see this patch from the link below, I'm not sure why this
happened, could you kindly tell me what the merge window is, so I can
avoid such problem next time.
  https://lore.kernel.org/netdev/20211113084636.11685-1-rocco.yue@mediatek.com/t/
  https://lore.kernel.org/lkml/20211113084636.11685-1-rocco.yue@mediatek.com/T/

> Also, you did not add v2 (or whatever version this is) with a summary
> of
> changes between all versions, and you did not cc all the people who
> responded to previous versions.
> 

ok, I will resend a patch that meets the above requirements.

Thanks,

Rocco


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
