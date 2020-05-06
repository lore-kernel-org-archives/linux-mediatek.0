Return-Path: <SRS0=yMRY=6U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E81C28CBC
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 18:21:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC21720747
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 18:21:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZRaNpW8U";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="JaXZicmL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC21720747
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=siSUze6fUzqh52Zl9CTB7kkoaZS1vFA4Y1aS/x6pKEY=; b=ZRaNpW8UH+L7vC
	HwEcyrm174YDtaIJbfWwbIDm3kDuDRwkC7GOK3K+lTw9hLjOt9/MrP5KCMVYG9eD/u0l48Sf/sz/G
	99U5ejPTJb0hnNbdU9DBvmP9wtvSWJEwLXvt0hm2fhuYLxcQ12HHtgBP627TOhCCvkAXugjBBtE22
	MFDM8xsIIDWOXCjhrry5bA5tVVYRyCK7JH3sjdqF4LqNqirVlxWtUYBTa9Ya8goevkyRRGzYGNNiK
	YiEouvuuKp0GLaln5mVB7J206cuk7tc9cGReY2EDqHKh/qVlc1faoG/vk72EGZjDJAEphAqxMfK14
	QXQLdHJNq70r20as2u8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWOfU-0001mD-Np; Wed, 06 May 2020 18:21:16 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWOfR-0001lN-0R
 for linux-mediatek@lists.infradead.org; Wed, 06 May 2020 18:21:15 +0000
Received: by mail-ot1-x341.google.com with SMTP id 72so2185608otu.1
 for <linux-mediatek@lists.infradead.org>; Wed, 06 May 2020 11:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D2taJJRTg2UNCEqvPUHeisc7wYhhWEOMV6TUWaPz7kg=;
 b=JaXZicmLPCbQ1s4wEPLd+sV+a4q0wnzPoifqdGpBSL8D7Z8GrydmvQGqC8UT22nL2I
 WZa/znMpgXW+q41TZVo9zK6nCks5GJUhUduUAyuXBbeNVH+4lSu2c8TsdwQTipW46XE8
 2YvlAWllyGrBAxfyw+wCC3p4SEMWY6eYou+Co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D2taJJRTg2UNCEqvPUHeisc7wYhhWEOMV6TUWaPz7kg=;
 b=Cf4QHDojhtc0BDe1owc3DjIjJp9EfSkl3ZbP4c/H+WES6WW23dbbsB3cx1Ku9DZPYO
 L75J6Aa6MrLjzNNO04Sh4tgRDyuwnsO4DJn/HDnHo38mwA2U4BsGsFtrZInpuY0Q8M+G
 9Ee97IIyHshUu7lgoID320qAPjHrHOn+vyrX13iniArzdw6ObQxSfJgFR//R+wxqbIwf
 IIsoBiOc1Z5S1BJnQ5vpS+m+eifbdXBjHphxNsH8JoYhIgnz8GooxvvW9FK+YGm5RJOG
 /uk3PoXj4CnWAALRLN+/3bHYDb7bvZiwdnRQcOOYBCffrobrRLxo7A2aELguMF/M5K+b
 dYQg==
X-Gm-Message-State: AGi0PubyB4fXstGnLkWz8xAR4wS0rn4e2XHYmF1RoP3aTy4QxgHgkSXb
 A2JMQtu9J4OVXIyjtdvCXfluGDJ2H2Kf7xoGqcr7wQ==
X-Google-Smtp-Source: APiQypInw39ygS3P/++U3PAE3LlMt925jYmNYdu8cvU7nnL+hmn3yH1R3d09MJ5VoLDPJl2XHnEM/8wYsJ8wMTKfCVI=
X-Received: by 2002:a9d:490d:: with SMTP id e13mr7509661otf.356.1588789271980; 
 Wed, 06 May 2020 11:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200505140231.16600-1-brgl@bgdev.pl>
 <20200505140231.16600-6-brgl@bgdev.pl>
 <CAKOOJTzcNr7mc9xusQm3nCzkq5P=ha-si3fizeEL2_KJUOC3-Q@mail.gmail.com>
 <CAMRc=Md7gLMThfGF-7YLqW17MpMhU=UFbdTvfjbr9fFHTLir8g@mail.gmail.com>
In-Reply-To: <CAMRc=Md7gLMThfGF-7YLqW17MpMhU=UFbdTvfjbr9fFHTLir8g@mail.gmail.com>
From: Edwin Peer <edwin.peer@broadcom.com>
Date: Wed, 6 May 2020 11:20:35 -0700
Message-ID: <CAKOOJTxkcaq0bF34bcz3HZzqsNgfmJH=Hd+odNNMX5gDq4to=w@mail.gmail.com>
Subject: Re: [PATCH 05/11] net: core: provide devm_register_netdev()
To: Bartosz Golaszewski <brgl@bgdev.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_112113_781091_439CA7E6 
X-CRM114-Status: UNSURE (   7.00  )
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
Cc: devicetree <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 netdev <netdev@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Fabien Parent <fparent@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, May 5, 2020 at 11:46 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Re the last bit in priv_flags: is this really a problem though? It's
> not like struct net_device must remain stable - e.g. we can make
> priv_flags a bitmap.

Fair enough.

Regards,
Edwin Peer

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
