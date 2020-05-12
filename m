Return-Path: <SRS0=Mjju=62=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8922CA90AF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2020 19:31:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C4FC20731
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2020 19:31:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C3wIapxa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C4FC20731
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WMW4kp2Zib3ZYGNUgN73N6tL+vlsTEHzKFVBkWmNBBc=; b=C3wIapxan+54uN
	zX8kDSy/6qS18erM04wmmHWVVzmEpRstzLqBCgY5UODURpW3Gk4kB8XEpw8haG/UBRZg0fXC7h8zE
	e5var40byovOE2y5+DFlgHuShFIRiC2lhUNBjJvItMoIYHMQuSF6ryp1X4ezrlAEPYcq+1t+mcJT3
	KzCDHcXLXIkzoazc5ePXj2leP0y5m44h6WgIju7dxuUp2I04uyw70yGq1/iRinX92WnuMOPebESVm
	LOxHbRx/J+Rba/QEGzmAOp/GwiRnt3v19CjrkeGy0+5tDLKJ9tedUfV6zAmAq1yQQO4iT+R5o9DjA
	iMKraFcA4f9tzhftq8OQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYacH-0007p2-VJ; Tue, 12 May 2020 19:31:01 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYacA-0007fA-34; Tue, 12 May 2020 19:30:55 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477:9e51:a893:b0fe:602a])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 8452F128325B0;
 Tue, 12 May 2020 12:30:47 -0700 (PDT)
Date: Tue, 12 May 2020 12:30:46 -0700 (PDT)
Message-Id: <20200512.123046.2245363690581586050.davem@davemloft.net>
To: brgl@bgdev.pl
Subject: Re: [PATCH v2 05/14] net: core: provide priv_to_netdev()
From: David Miller <davem@davemloft.net>
In-Reply-To: <CAMRc=MdUCkgCo8UndDbhQRZt_tXJJjtR4uM2g05N5ti7Hw1f2w@mail.gmail.com>
References: <20200511150759.18766-6-brgl@bgdev.pl>
 <20200511.134117.1336222619714836904.davem@davemloft.net>
 <CAMRc=MdUCkgCo8UndDbhQRZt_tXJJjtR4uM2g05N5ti7Hw1f2w@mail.gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 12 May 2020 12:30:48 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_123054_133020_6AEA8613 
X-CRM114-Status: UNSURE (   5.40  )
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
Cc: edwin.peer@broadcom.com, devicetree@vger.kernel.org,
 stephane.leprovost@mediatek.com, arnd@arndb.de, bgolaszewski@baylibre.com,
 netdev@vger.kernel.org, sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 pedro.tsai@mediatek.com, fparent@baylibre.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, andrew.perepech@mediatek.com,
 john@phrozen.org, matthias.bgg@gmail.com, kuba@kernel.org,
 Mark-MC.Lee@mediatek.com, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 May 2020 08:04:39 +0200

> I will if you insist but would you mind sharing some details on why it
> was removed? To me it still makes more sense than storing the pointer
> to a structure in *that* structure.

Flexibility in implementation of where the private data is located
and how it is allocated.

And yes, I do insist.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
