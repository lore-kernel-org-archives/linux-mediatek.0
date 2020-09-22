Return-Path: <SRS0=fRkw=C7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB5BC4727D
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 00:29:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE8F723A7B
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 00:29:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jZ7cq6T4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE8F723A7B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:From:Subject:To:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tD2615wATwY5E93uGXOPZ8aWRRZwkCymlvPowgJsRkE=; b=jZ7cq6T4tknB2L/DHNrH2vPL8
	ZI1ol3/XZDtOJalTtU8qPeHRD5J2v7uujWJakxNKoiYGwpIpVoSDSHg9CfqqkqV3S44qzuS1ZPw2T
	0qQJG/OAPrm+IZEF6EgzyzOYLtyXj2th1T9kaqpQvn6oveIB4SyRSumaJlF1elNgL650kz7UnUIrt
	o/K3bO3iv8bVSOX/56+iedvQuWAAMTIvUBg3s4dHM7x5tOBH+reKOsQ78qour91pGosTtfRclqZDw
	dYiR6Tl44LO/hD+IKUQZ3ndt0G83ypaKPbFzSS97AFJ3bbMEcHL4n8Xa4mi8EiBZMO1gnfIhDtmh4
	tJZFiliSg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKWAw-0002Wp-IF; Tue, 22 Sep 2020 00:28:54 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKWAu-0002Ux-1M
 for linux-mediatek@lists.infradead.org; Tue, 22 Sep 2020 00:28:52 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id F398E12788D3C;
 Mon, 21 Sep 2020 17:11:53 -0700 (PDT)
Date: Mon, 21 Sep 2020 17:28:40 -0700 (PDT)
Message-Id: <20200921.172840.49240469777318612.davem@davemloft.net>
To: sean.wang@mediatek.com
Subject: Re: [PATCH net-next] net: Update MAINTAINERS for MediaTek switch
 driver
From: David Miller <davem@davemloft.net>
In-Reply-To: <5d601ae7347d49268822356121d5388739311459.1600729601.git.objelf@gmail.com>
References: <5d601ae7347d49268822356121d5388739311459.1600729601.git.objelf@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [2620:137:e000::1:9]);
 Mon, 21 Sep 2020 17:11:54 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_202852_307013_E8F064B0 
X-CRM114-Status: UNSURE (   9.53  )
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
Cc: andrew@lunn.ch, Landen.Chao@mediatek.com, f.fainelli@gmail.com,
 steven.liu@mediatek.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, objelf@gmail.com, kuba@kernel.org,
 vivien.didelot@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: <sean.wang@mediatek.com>
Date: Tue, 22 Sep 2020 07:09:23 +0800

> From: Sean Wang <objelf@gmail.com>
> 
> Update maintainers for MediaTek switch driver with Landen Chao who is
> familiar with MediaTek MT753x switch devices and will help maintenance
> from the vendor side.
> 
> Cc: Steven Liu <steven.liu@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Landen Chao <Landen.Chao@mediatek.com>

Applied to 'net' as it's important to have the mainline MAINTAINERS
information as uptodate as possible.

Thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
