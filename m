Return-Path: <SRS0=ZZ2m=JU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDAE4C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 04:19:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C026611CB
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 04:19:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C026611CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pZhB/lSqbWFDKUOffV0bO5fiiJkVNL005sy0swCAv7Q=; b=eDpGQ429BipzIxtxGOgqKeQQ8
	UxsdnUgoDIr+38RshcW6qwgjB+Ai5yWr98SKc3U/V6mJnk+iWKkMQauTzibkWUu5SyRhD6Y+AZ/XJ
	c5M9ai6QgkaYQ8UPRZZdEFj3xJswwDVdKiQk1JAFFWak2RNGTl5tXybY0kyKRFnbBPvBcYCJ7SFrh
	pmwHcXORkBKTDYTRHOBBlqw8Ij/BjnEyLVTqzqlFLi9kB9q4z9fDVOHq5/RBboiCcnfB51MMqLc1x
	bMuUyUt+T2LfYhQHleWjOLF1v/ORG3Zz7XxiSXLOINZjZnn2N30kD6Z/BHvpX//Hw74Q67IeKau4u
	wcQUTdAzg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZnHf-000ZW8-Ns; Fri, 23 Apr 2021 04:19:15 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZnHE-000ZPo-3G; Fri, 23 Apr 2021 04:18:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=9rzZYVq39OR6Qkj8gqXLwD19tpWV3cWzF0YtPe2dTjM=; b=o4KFRDUxejy/S6fk7q82RrNT6z
 7btIf+iGVFMxODhpSkNPhL4LK3B0T4Y+Hst6WYbz4D74VJxJzJzH66VQpGgJXsnaa1uDFXUld5c63
 F5HsBLHpIt3jDWRjX5njnEUxC5c9IU4UxiEePSSTquLTUy5nB0AVLjyrap4ri0PRvzJs8xY2C3RKt
 3YwYCaR923WCVaE/k9F0VyI9Cm4Namz6Cegs/hjxq+iK/dV+tQ6jkjtxd3yxIZMr/B61GJQ+KOYST
 eq12esXwccJCUmDk+omIICxk54H0Sq6nNM0kFaRp7PuXPCntPAl9fxb0BNxk48E7WTfxBIk/CZbO3
 vc411iQg==;
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZnHB-00E8bK-L3; Fri, 23 Apr 2021 04:18:46 +0000
Received: by mail-io1-xd31.google.com with SMTP id k25so4713349iob.6;
 Thu, 22 Apr 2021 21:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9rzZYVq39OR6Qkj8gqXLwD19tpWV3cWzF0YtPe2dTjM=;
 b=gfiLm60zKUk0E1zjwnRq9DTjBqTOJGkVuT/xyApI/WUJtQsSoVgNpWkk5muLdXHtPZ
 iaxN97bnFWE5dYHZVhlwtuOXyi5h+3dngh5nOFHQSxnVmxIPQCYtPSD2bNKQnmbTU6Cs
 tiumUx7v+M2AFRxhO896b5HRTtk44zo/gPNtONClSTt+W7seilUxqpED7411za6x3RZn
 CO8v9NP6J1XUmiFmwzlIIHAfRx51hm7CJSv+D3BRHiAzfWfVdtzhiC5r7mlaNagv6rOv
 QN5dEgkIISngYr3eVGAECrZXyuV6o2HYZAnwIZ9Xf2Mr4yH237OkGinM/kIW7KuhNlHY
 DfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9rzZYVq39OR6Qkj8gqXLwD19tpWV3cWzF0YtPe2dTjM=;
 b=Bw1KUbT/qRp9hjPKAXvEnuqwe4Cs5sWcz+Nf2s9qzYZN7ckQE9GNE6LbxqGT5/0d4n
 qdljc94pGpoIX5cjibPJAHS/eVDF+MCPfdfVQ2LVh6YiKMNiuP4Do21bMBkPCVPPrX/m
 W7iptaz7vooWnYeaz2tpdib1DFOjd1cMlEXJ2CX6xRTZHRbjANk+ztHI0qa6a74jI5XL
 R4OvTAdxw3IXof3qw50PLR8AqelVs/ZAuVcsHGw4A02pbAWthMbsqPuGj8pu4OIqSCpd
 qQfpjkQnaCuU9Tfrb2x/I/zaRCyZhOvWDM8irfMga9W2RqQK6gJ0vn5BHLmMHuZJDvYb
 sU0A==
X-Gm-Message-State: AOAM5318P+5csfTPsOxCKPuqaNZujM31bvb+K4zpFg4MenfFEXTMP9Bz
 QSlBbeQ5j41VO5RWU2TKfs80gvyfFnVNoK02dEg=
X-Google-Smtp-Source: ABdhPJyvoO2pw2VSnbVSN1Ed7gAtROTBAk1433lH3abSM0SN9hl7oYq1cfZ0OGgovzbh24m6f97C5qqpgJP+XR0Eh+E=
X-Received: by 2002:a02:662b:: with SMTP id k43mr1903647jac.139.1619151522887; 
 Thu, 22 Apr 2021 21:18:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210422040914.47788-1-ilya.lipnitskiy@gmail.com>
 <YIFq2NIhdMWTDshX@lunn.ch>
In-Reply-To: <YIFq2NIhdMWTDshX@lunn.ch>
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Date: Thu, 22 Apr 2021 21:18:31 -0700
Message-ID: <CALCv0x1k+Bi+nCY+yJ-n+EYbRW1keRgF35QDNPe-WCO-z8qxBw@mail.gmail.com>
Subject: Re: [PATCH net-next 00/14] mtk_eth_soc: fixes and performance
 improvements
To: Andrew Lunn <andrew@lunn.ch>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, 
 Mark Lee <Mark-MC.Lee@mediatek.com>, "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 netdev@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_211845_714555_59C2B658 
X-CRM114-Status: GOOD (  15.98  )
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

On Thu, Apr 22, 2021 at 5:23 AM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Wed, Apr 21, 2021 at 09:09:00PM -0700, Ilya Lipnitskiy wrote:
> > Most of these changes come from OpenWrt where they have been present and
> > tested for months.
> >
> > First three patches are bug fixes. The rest are performance
> > improvements. The last patch is a cleanup to use the iopoll.h macro for
> > busy-waiting instead of a custom loop.
>
> Do you have any benchmark numbers you can share?
No. Felix, do you have anything handy?

If needed, I'll run some tests before and after the patch series on
OpenWrt against v5.10, but I only have an MT7621 device - should be
better than nothing though...

Ilya

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
