Return-Path: <SRS0=IT6v=7J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A4FC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2020 18:25:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1217D2088E
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2020 18:25:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OZUXkBuC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1217D2088E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3sSOI6JNa0l/nPWNUy63JwjrX01wr7i/bjRkLpfY7nI=; b=OZUXkBuCm+scm0
	eTeoBjNCW/1QHiAIHBje5mMJ3POfvVDHKtld9CMX9IrJP9UOpTvEvx2ac59k47xvq/QY4h5SHgSvB
	XFYZURXEyGxvAIcrvZiGjVEqKyXe9z11aFA8hSpunMlDJoTxbjSeC+q+DpOgdbPhOt51gghK4DBIE
	+U/yYS5yzlhclzvsJSk3kE8DlbLo2uc/u56E1NyuZakuZs7Z+ixVkTPzAtr8QS9QymJFRPIHDmMwZ
	Hsg0XlwUIr7IoFEr5FJpRTRQW5d17qS1UO8QmIuT3cVpFoGyE/LzyWlP818uQ6Pxi6yL6wetjSQ11
	YZ7vOXNvKNl4WdMj4nHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1je0k9-0002iG-3M; Wed, 27 May 2020 18:25:33 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1je0jw-0002RE-C0; Wed, 27 May 2020 18:25:21 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 8DC45128B2F3C;
 Wed, 27 May 2020 11:25:16 -0700 (PDT)
Date: Wed, 27 May 2020 11:25:15 -0700 (PDT)
Message-Id: <20200527.112515.1714930146142742523.davem@davemloft.net>
To: brgl@bgdev.pl
Subject: Re: [PATCH] net: ethernet: mtk-star-emac: fix error path in RX
 handling
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200527092404.3567-1-brgl@bgdev.pl>
References: <20200527092404.3567-1-brgl@bgdev.pl>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Wed, 27 May 2020 11:25:17 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_112520_416420_876308DE 
X-CRM114-Status: UNSURE (   7.46  )
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
Cc: stephane.leprovost@mediatek.com, bgolaszewski@baylibre.com,
 netdev@vger.kernel.org, sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 fparent@baylibre.com, pedro.tsai@mediatek.com,
 linux-mediatek@lists.infradead.org, andrew.perepech@mediatek.com,
 john@phrozen.org, matthias.bgg@gmail.com, kuba@kernel.org,
 natechancellor@gmail.com, Mark-MC.Lee@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 27 May 2020 11:24:04 +0200

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> The dma_addr field in desc_data must not be overwritten until after the
> new skb is mapped. Currently we do replace it with uninitialized value
> in error path. This change fixes it by moving the assignment before the
> label to which we jump after mapping or allocation errors.
> 
> Fixes: 8c7bd5a454ff ("net: ethernet: mtk-star-emac: new driver")
> Reported-by: Nathan Chancellor <natechancellor@gmail.com>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Applied, please use "[PATCH net-next]" to clearly indicate the target
GIT tree next time.

Thank you.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
