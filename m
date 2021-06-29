Return-Path: <SRS0=olbE=LX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43700C11F66
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jun 2021 04:19:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D861661CD5
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jun 2021 04:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D861661CD5
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OwwPYh34YjP9wMzqvxYLv99JbhyHDT5NgTYvnek4FqM=; b=zEihP02xM5W/L/
	Wl5R/aCxxRfYdqDR1wbpL3uBar3RtTBrxphZzALO9G6ONKCZU6R/wxLixt5RJgb4bj+sLdi0Cbdrz
	UvQCsO8a28IzCebCoDIuzzNFAih6U9WS+gJyFtg7OraB2sxKrrBCOobkrh8hiDgKHYr6E9r7lc3K5
	M7TQIcVbw8wYP+IjFohGoXFqTHmbrbelPPB50AKW1GQylvE/ikjDwzNqmmP2A0lTiI/MLflhxdEAn
	q2w2/n13N+R1JeumymVq5tFnRD0I/fmhbpVMX3/cf3uXSV0ipTWxjZzuL9EdEaGet/82erSjxPnTV
	CZ73j82vEaZxF4FtP3qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ly5Dl-009ksl-3x; Tue, 29 Jun 2021 04:19:37 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ly5DY-009krR-Jn
 for linux-mediatek@lists.infradead.org; Tue, 29 Jun 2021 04:19:25 +0000
Received: by mail-io1-xd2e.google.com with SMTP id f21so9425454ioh.13
 for <linux-mediatek@lists.infradead.org>; Mon, 28 Jun 2021 21:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T3qE6ClclvZmXMsxggvUPTF0EehyJNL1Noojj5cr7UM=;
 b=O+eMyEdFQjVux0r8wDwpu0udj8DZYWYCef7lAmU3YwXnc0LzhjgXT7eHEEi/YS1Dvp
 StYthzrnf98eK+oTs6iKE0z66wKcgEEHIZDfe0qN9/0aSNFtPa8HgGXrXkivh6TOVcYt
 zj/iOjHElIuXXzh2P1CyYaYleLk1y2cKQXFX5EikvDgVTG29Y8Vxfdq7qeKytI2whPF4
 D49m2aDYYpDVt7VeNwCks+P7IYbqzo9m/EN49ps21v+Me6CTsfY7nDr2OOGneMzWeTQ1
 mb0EICF11wX4gmOfu3SbZsQvIdEtgq/EvLcrKyOSBRyiXCzIZq/1kv9vSHv8YPwbRAUp
 +dMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T3qE6ClclvZmXMsxggvUPTF0EehyJNL1Noojj5cr7UM=;
 b=KjLTAxelEWCDWxmU0yZlb9csdF5nNYRldgr+u9xtBE9d+xvg3RL+SiobPAp+34OFGU
 t8y+p548qmqBvvuokcTKvML2ZWbnqUBCn6nmGpUpmUIXTB+gIX0L2af2QFO7xYmR7PRU
 vKz+B8sVxB7SP+fp9Ffc9qDyTXrnuGO04TX5OokPE4rQsMclFwnXnaQFvLciVUduZt0A
 tdlPMa018anoEpMgFGQtn0tIe53Yd4nFfnKTiRP9JR9AOKACPGtrZDsKuDLOODJyBbDK
 w4VZOyEKtHY1hmUrEASF+FcMsWpgEWJszFrOPHJ2Sy6okMFFjpASzig4v6hF48gXuWH0
 yMng==
X-Gm-Message-State: AOAM533/O4RSVUOxifckVczennArZ4rPvgxPyiDpz2NuWPnfRKXtCNEX
 +35TE/Yn7H1EqYNRS61H/VukDN6KgIdA1y6fqv2rfw==
X-Google-Smtp-Source: ABdhPJwQrGwDnkfRKF30NiG2OP/q/WmFBZnXNe9cvWBWTWVauL3qA3P0SA2hl7b3R+aSH3FjlH67uaVD3PF4G+XG/oI=
X-Received: by 2002:a5d:840c:: with SMTP id i12mr2208007ion.185.1624940363410; 
 Mon, 28 Jun 2021 21:19:23 -0700 (PDT)
MIME-Version: 1.0
References: <1623122200-1896-1-git-send-email-kewei.xu@mediatek.com>
 <1623122200-1896-3-git-send-email-kewei.xu@mediatek.com>
 <54301510-e0d5-0762-1979-b194b8fd5eb8@gmail.com>
 <1623206624.14050.10.camel@mhfsdcap03>
In-Reply-To: <1623206624.14050.10.camel@mhfsdcap03>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Tue, 29 Jun 2021 12:19:12 +0800
Message-ID: <CA+Px+wU8qqEDU+bV0QpoJssNOxebutzRGgHo6WpC9VFJwckKKQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] i2c: mediatek: Dump i2c/dma register when a timeout
 occurs
To: Kewei Xu <kewei.xu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, wsa@the-dreams.de,
 robh+dt@kernel.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, 
 leilk.liu@mediatek.com, qii.wang@mediatek.com, qiangming.xia@mediatek.com, 
 liguo.zhang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_211924_715719_55BBD850 
X-CRM114-Status: GOOD (  14.27  )
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

On Wed, Jun 9, 2021 at 10:44 AM Kewei Xu <kewei.xu@mediatek.com> wrote:
>
> On Tue, 2021-06-08 at 16:01 +0200, Matthias Brugger wrote:
> > Is this offset only for mt8192 or also for mt8183?
> > In any case that should go in as another patch. Either a fix or a new
> > mt_i2c_regs_v3[]
>
> This offset value is suitable for the IC of mt_i2c_regs_v2 hardware
> design similar to mt8192/8195, not for 8183.
>
> The reason for the modification here is that the previous
> offset information is incorrect, OFFSET_DEBUGSTAT = 0XE4 is
> the correct value.

Please submit another patch for fixing the incorrect value.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
