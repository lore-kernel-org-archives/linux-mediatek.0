Return-Path: <SRS0=Gkfw=YL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD96CA9EC8
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2019 00:02:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D91C21D7C
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2019 00:02:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mz/BoRXg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D91C21D7C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LGqw10EbbrC7m3vBCjf1WUzugpO/G2E28+vkzUMFHGI=; b=Mz/BoRXg61qp98
	9Xm9KXXCrjDze0XEfkzUlp9jHuoG1lBZIUGkfRXXOYeCO4JycstJEvKwm2pCo9PEaG1/qbZZYeJ0o
	VLVhLLUjDVIMPjrs745yenh4GzpC5kWWJyjvZal2of0RA65mhT4HniigS8lEUILRY5D4B0DqWGme0
	zWEDHMc9SKtDKxhCU8EPp/o+pGb711nV9XevpU+aOCXJ11xzj/W1ZVbP+/qA1ph8lRnmCDddjqN3M
	4kXdXxVeWvwCQv/5IyDE317r3awS58f4R/GVlmAA/qNMOhyPMo9JOyDRbcZz8QiRtQTryvT7hr8cy
	hht2/uPx7xEv2zkGvj6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLFiN-0002E2-Fu; Fri, 18 Oct 2019 00:01:55 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLFiK-0002Dd-J4
 for linux-mediatek@lists.infradead.org; Fri, 18 Oct 2019 00:01:54 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:1e2::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 4026E1433FC59;
 Thu, 17 Oct 2019 17:01:50 -0700 (PDT)
Date: Thu, 17 Oct 2019 17:01:49 -0700 (PDT)
Message-Id: <20191017.170149.2131317490793787816.davem@davemloft.net>
To: sean.wang@mediatek.com
Subject: Re: [PATCH net-next] net: Update address for MediaTek ethernet
 driver in MAINTAINERS
From: David Miller <davem@davemloft.net>
In-Reply-To: <fc0692002216a32b045a69f910e95c83c1ff559c.1571260085.git.sean.wang@mediatek.com>
References: <fc0692002216a32b045a69f910e95c83c1ff559c.1571260085.git.sean.wang@mediatek.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 17 Oct 2019 17:01:50 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191017_170152_628009_E21425FD 
X-CRM114-Status: UNSURE (   4.83  )
X-CRM114-Notice: Please train this message.
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
Cc: nbd@openwrt.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, john@phrozen.org, Mark-MC.Lee@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: <sean.wang@mediatek.com>
Date: Thu, 17 Oct 2019 05:14:08 +0800

> From: Sean Wang <sean.wang@mediatek.com>
> 
> Update maintainers for MediaTek ethernet driver with Mark Lee.
> He is familiar with MediaTek mt762x series ethernet devices and
> will keep following maintenance from the vendor side.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Mark Lee <Mark-MC.Lee@mediatek.com>

Applied to 'net', thank you.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
