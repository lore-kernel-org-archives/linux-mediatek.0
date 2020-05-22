Return-Path: <SRS0=9rwW=7E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1549C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 21:37:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97A0920679
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 21:37:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bexNyvFe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97A0920679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M+JFyaQ0yABArbTSnyPJgpdkR0Qb4JpPbv/JSZJb8SM=; b=bexNyvFe7cORjU
	fhvgIxt8reGKAJjWgoUP0Qz4ODUHAh3T7yyry0pSTQCwC+fsdFcAlUUGfArmYkXkaIa5VR4kyg6g9
	q7zGT1gj0pbRbSoQh1qrInveSvfVM4bGA3yQfJz9Yl9V4ge+OpIspqdxIBBfUStYyhy9+RXSJX5dh
	TH+zqYnieATShE6cDoSiMq7eh9dqhYJPrm1TWIigUmnP4/GMHiO4pd42HN5+ni1DZGe86JOFleJc+
	sMr0s0AyG5398m/5xk53+14969U4t2GAu3ycuiaFv5STEdpC/UzkVhf3+4juQkD3zZ6b4WT66fvHA
	gOUr4h0AcoDRNE+CTUYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcFLl-0006KX-Ka; Fri, 22 May 2020 21:37:05 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcFLe-0006Cm-AD; Fri, 22 May 2020 21:36:59 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id D6961127298FB;
 Fri, 22 May 2020 14:36:56 -0700 (PDT)
Date: Fri, 22 May 2020 14:36:56 -0700 (PDT)
Message-Id: <20200522.143656.1986528672037093503.davem@davemloft.net>
To: matthias.bgg@gmail.com
Subject: Re: [PATCH v5 00/11] mediatek: add support for MediaTek Ethernet MAC
From: David Miller <davem@davemloft.net>
In-Reply-To: <1f941213-7ca2-c138-3530-85c34ebf0d53@gmail.com>
References: <20200522120700.838-1-brgl@bgdev.pl>
 <20200522.142031.1631406151370247419.davem@davemloft.net>
 <1f941213-7ca2-c138-3530-85c34ebf0d53@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Fri, 22 May 2020 14:36:57 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_143658_351158_B4B0595B 
X-CRM114-Status: UNSURE (   9.79  )
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
 netdev@vger.kernel.org, brgl@bgdev.pl, sean.wang@mediatek.com,
 linux-kernel@vger.kernel.org, pedro.tsai@mediatek.com, fparent@baylibre.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 andrew.perepech@mediatek.com, john@phrozen.org, kuba@kernel.org,
 Mark-MC.Lee@mediatek.com, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Matthias Brugger <matthias.bgg@gmail.com>
Date: Fri, 22 May 2020 23:31:50 +0200

> 
> 
> On 22/05/2020 23:20, David Miller wrote:
>> From: Bartosz Golaszewski <brgl@bgdev.pl>
>> Date: Fri, 22 May 2020 14:06:49 +0200
>> 
>>> This series adds support for the STAR Ethernet Controller present on MediaTeK
>>> SoCs from the MT8* family.
>> 
>> Series applied to net-next, thank you.
>> 
> 
> If you say "series applied" do you mean you also applied the device tree parts?
> These should go through my branch, because there could be conflicts if there are
> other device tree patches from other series, not related with network, touching
> the same files.

It's starting to get rediculous and tedious to manage the DT changes
when they are tied to new networking drivers and such.

And in any event, it is the patch series submitter's responsibility to
sort these issues out, separate the patches based upon target tree, and
clearly indicate this in the introductory posting and Subject lines.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
