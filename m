Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF0D5C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 15:20:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EE666128C
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 15:20:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EE666128C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:In-Reply-To:From:
	Subject:Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PYu9Q2uEjuhCkrfflDIca7bwGIU/w8ZVQ8gVJGCre/I=; b=oTlr/1AoyKRrh/yDJ1dfGSH1Z
	ENJe7B4Rb8cxcLBJX8NKwbFwALYxK8tep1OpSIpVHmkf4h8L4WFvUx1DdV+Ls0sIUU2Arz385YX0D
	118qZo7tiKnr5dTwLOnqwCNDuRcYKXIlUhMKDgo/Q+ch9ohbo1pI50TAzUCjjIChqbVma3BxZwCxo
	7ehM5kfAWb3Qs8zBCVr7ZwYgKJR4IwIRmntO43uq08Cb4eD1otMPzKgC7QcvtmR5nRu1Z35voF3Yt
	qqSnA9ZN2pQBwgrcYi5lRVx6GLbRD08akNng0n1JRZjRz0uBbDxRTjyUSL4H7RuOUWfRHjgohXKXt
	n/F3RcbWQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVyLv-0073VX-8a; Mon, 12 Apr 2021 15:19:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVyLt-0073Uv-1d
 for linux-mediatek@desiato.infradead.org; Mon, 12 Apr 2021 15:19:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=To:References:Message-Id:
 Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
 Content-Type:Sender:Reply-To:Content-ID:Content-Description;
 bh=STa1zScpD0qE0yyJabIpNY2dFx+S/ydGyQ+WYYnBwEI=; b=XN1ebPywpWkVexcURytT+Ot2/V
 FTnF4crkUOScPdd0B+/ZaGL2vSEY/NkNSGVECquufHICF+1nvYaRLIwjMHYbwI2iP/9R1SEPHgsm+
 fy5YGZTxvgoFRpExTnsBXSkwg8nV5DNFTn109KjMeLcYa4s6aiYBzHlz9v4REjzptKGtWxPxl/nwH
 93tgdf6SL56wPr4D2ntFqRmsrYCzJ0W3ofgSpxzk4tyhLXXG7x9LdwcqBPX2M7hL5+nJK6cZKRXgF
 TkYb6QtD6DWHqSIUJzDnqFIjgIjuKWpyluQw5zW3AELtg0K7T8TXwts9sKmxFoWuTVWp9ivHv3C6O
 NrRK7btQ==;
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lVyLp-006Kv9-Ew
 for linux-mediatek@lists.infradead.org; Mon, 12 Apr 2021 15:19:46 +0000
Received: from marcel-macbook.holtmann.net (p5b3d235a.dip0.t-ipconnect.de
 [91.61.35.90])
 by mail.holtmann.org (Postfix) with ESMTPSA id 8F143CED17;
 Mon, 12 Apr 2021 17:27:23 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH 1/2] Bluetooth: btusb: Fixed too many in-token issue for
 Mediatek Chip.
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210412150627.31913-1-mark-yw.chen@mediatek.com>
Date: Mon, 12 Apr 2021 17:19:38 +0200
Cc: Johan Hedberg <johan.hedberg@gmail.com>, chris.lu@mediatek.com,
 will-cy.lee@mediatek.com, Sean Wang <sean.wang@mediatek.com>,
 linux-bluetooth <linux-bluetooth@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 rex-bc.chen@mediatek.com
Message-Id: <B118C57F-5A40-4D50-A74D-B81AA8C270BD@holtmann.org>
References: <20210412150627.31913-1-mark-yw.chen@mediatek.com>
To: Mark-YW.Chen@mediatek.com
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_081945_678109_12FBFA18 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
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

Hi Mark,

> This patch reduce in-token during download patch procedure.
> Don't submit urb for polling event before sending hci command.
> 
> Signed-off-by: mark-yw.chen <mark-yw.chen@mediatek.com>
> ---
> drivers/bluetooth/btusb.c | 10 +++++-----
> 1 file changed, 5 insertions(+), 5 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
