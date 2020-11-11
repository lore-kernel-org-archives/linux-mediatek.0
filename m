Return-Path: <SRS0=/0MH=ER=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 210BDC5517A
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 21:34:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3CCD208B3
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 21:34:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gr1nbrW6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3CCD208B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kgVfviV0kO9sxcaebcH6w/PZ/aHlmSytU1Q342+efLk=; b=gr1nbrW6koJ6H4A6k4ximBMP9
	doAzT7nmiUdRfDVVyRQEladNWaT5pjI/2xZT1/ODg9VVZfTVfrVTZujXbqpvHz9Dh9hu9c9NNZo1j
	x2qtG/1EhTzkZVxTCsYMrJ0/N8PcWh46xL7DDQgpPJKYFKVOfki60V0QxcNXrVIfNnnJkUEyYFSK0
	2vYkJU4tZYMTGxCidu3eZQnF5UR9qAu0jO7+N9f1PtknKyQyyIOd4YoxM26SArs7viaMThc2fEQEV
	5Tu86eS6EfNfN6fGkzTBUZ4MILzpW3l0WUY4/MKfHUzLEavKYqUlMFf6rL16gHMqxSR7tEhk1l+4o
	9La9ZCJRA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcxlB-00026Y-Bh; Wed, 11 Nov 2020 21:34:33 +0000
Received: from mail-ej1-f65.google.com ([209.85.218.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcxl8-00025Q-HQ; Wed, 11 Nov 2020 21:34:31 +0000
Received: by mail-ej1-f65.google.com with SMTP id dk16so4734655ejb.12;
 Wed, 11 Nov 2020 13:34:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cbSPGqSoajDdzgBXkcQ9pceYyj1fwUocImvC8LVuhnA=;
 b=BtP+QI6eH5jYeG8AsdHPnEAZzYGyY+EWg4Ht0FzBPHsUzmUHDvtwExa5r2ANxOx/5j
 hEhJoe6/ytWEW6lK/HmFJF5JDKheMbG9oV0qc20roFcdyU5fNqQrDCSrFApQW0JEg356
 WL+yqzkiXJaa6jduQjR2eOLmVaWNJIyIYmShQcwLkRMKB8ET3PNJYAB5gaku1h5Qbcr4
 GXqv+m3qnA3QptifI/W19q2TOFU3lznhJBtUmfXZ1H/rxTUR3snS2MzxJx0U2catM8mj
 Rl4PxSYhQnOS2MRAWarJCPIT3mXuFxGL1vv45U9R1TtPQbZqJi13K6Vp9NfQ1JIkm105
 upgg==
X-Gm-Message-State: AOAM530UKkJ33CXiw0PKheLEYKLNQsn5bgGmVKQribQyp7h0hXEh3c1r
 NY+Sz4H3/zKHoU1HO8awf68=
X-Google-Smtp-Source: ABdhPJxZ1WBxXRo++KtU6Sg0+JLnVf2CzzVbv4KmTREyVVotlVP7TjUvZ7DBVgSFoHPvAHxci/+JFw==
X-Received: by 2002:a17:906:d7b7:: with SMTP id
 pk23mr28400140ejb.214.1605130469179; 
 Wed, 11 Nov 2020 13:34:29 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id x1sm1437867edl.82.2020.11.11.13.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 13:34:27 -0800 (PST)
Date: Wed, 11 Nov 2020 22:34:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v4 18/24] iommu/mediatek: Support master use iova over
 32bit
Message-ID: <20201111213426.GF287176@kozik-lap>
References: <20201111123838.15682-1-yong.wu@mediatek.com>
 <20201111123838.15682-19-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201111123838.15682-19-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_163430_727025_87CA123D 
X-CRM114-Status: GOOD (  16.05  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Greg Kroah-Hartman <gregkh@google.com>,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel-team@android.com,
 anan.sun@mediatek.com, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Nov 11, 2020 at 08:38:32PM +0800, Yong Wu wrote:
> After extending v7s, our pagetable already support iova reach
> 16GB(34bit). the master got the iova via dma_alloc_attrs may reach
> 34bits, but its HW register still is 32bit. then how to set the
> bit32/bit33 iova? this depend on a SMI larb setting(bank_sel).
> 
> we separate whole 16GB iova to four banks:
> bank: 0: 0~4G; 1: 4~8G; 2: 8-12G; 3: 12-16G;
> The bank number is (iova >> 32).
> 
> We will preassign which bank the larbs belong to. currently we don't
> have a interface for master to adjust its bank number.
> 
> Each a bank is a iova_region which is a independent iommu-domain.
> the iova range for each iommu-domain can't cross 4G.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org> # memory part
> ---
>  drivers/iommu/mtk_iommu.c  | 12 +++++++++---
>  drivers/memory/mtk-smi.c   |  7 +++++++
>  include/soc/mediatek/smi.h |  1 +
>  3 files changed, 17 insertions(+), 3 deletions(-)
> 

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
