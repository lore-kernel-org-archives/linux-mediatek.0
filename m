Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6675CC07E96
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 04:09:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36B1A61289
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 04:09:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36B1A61289
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VERmP/srncZpKjOvaHb1RHU2flYrFnwFvL7NE3BJuq0=; b=jLz3Osp8D9rlQT
	eQt7zqf+TOEx5MOdqdAOVkVyc2oU76jRlInDytpZ6dPshI8KwANuWXeJ/NsdsMQ/lnkXjmQ1YycQS
	Cn37590av1Z6FBAnQZDOgHrM7HGbCsK8Gp5Qez4ME8wd14qU31GF6Pkg9F82cMOvOvH5DyjdNEA2W
	joyP2U1hF6UO/1LWXcKNqpYNb72tD3bLKcxq4eclY5Oxe8sN9sY+pMR3cIs8bUmLl42EfIe9gtWSF
	Jp0ixqkyjPiLVFGR1f/RsA6euPijGgifXuWDBfZ/MiY68EbzmRyFtC5jLY9z7DgxPGoeOESwlR4Ap
	xMvaNmEvfgxz342L6XNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3sgq-00H44a-8c; Thu, 15 Jul 2021 04:09:36 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3sgm-00H43c-SG
 for linux-mediatek@lists.infradead.org; Thu, 15 Jul 2021 04:09:34 +0000
Received: by mail-lf1-x136.google.com with SMTP id v6so7411757lfp.6
 for <linux-mediatek@lists.infradead.org>; Wed, 14 Jul 2021 21:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CEt6lKkjHocGT1UvacGfqPdf29QklnGYfkIPIEqqVHI=;
 b=F4VTmhkSwveM3DHG0/pF2zRjpCYl+mduFoZTP7r5v7JaqMeXp+57FIOQ1JCSeEVkGN
 2y9cZXVKVgEwQHl4N4mh6X5qTHRvl28V4wc32a5bulIQe7eiH1fu87aAlDoLsNqDeadl
 75YwBiOnP7AT8XXyAuR7ZAB5PlUuKf1gaLRD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CEt6lKkjHocGT1UvacGfqPdf29QklnGYfkIPIEqqVHI=;
 b=NayIZYQK1zbgV+XOF06FNKjKJ33aEas04HmHTkmw2je5oVCz0599pxFy/xJ10ejt+l
 7GWRtuZRr9KUywbKuxySdZzsMo2tKXTbGYiXPjuMtl4KSLxhTGC8bIt8dZA9e9HBft5V
 aDg6kKrRkcMEAyL1Yj6ioy0xHOK4fLr1+90WZY2KzJYUw5vlVezb+d/vaiR+Zwxb4FBF
 zP24w8Hc+PcHD421pKcY+cz80z7Tp7wtx7La8hxOxU78KTkwJDljzyuwZpcNc9U9oJ5E
 pZ5R/AAZ2TOXN7cujkPDXj8bIssnIKVd7k/q72jpkWKDAnTL2sgpgc618qUx4fQhfPHi
 4Zjw==
X-Gm-Message-State: AOAM533O8INnkAD/5RShgeAokzZNMCnd753r+e4Ppw7gc+4KcTXW5nZ3
 0s+ZH6SnYU943S2IW76AGy0UW0kRHHLFSSpNt+SyRQ==
X-Google-Smtp-Source: ABdhPJwqCmyH6ZnTwT5c8CV8V+cNkvnOuCmcEV/TVgLIgrOJW28DIUFEhAkgyKrDovGADulwZVXMXJKsCJyWIiiu69Q=
X-Received: by 2002:a05:6512:1303:: with SMTP id
 x3mr1441515lfu.276.1626322170104; 
 Wed, 14 Jul 2021 21:09:30 -0700 (PDT)
MIME-Version: 1.0
References: <1626316157-24935-1-git-send-email-kewei.xu@mediatek.com>
 <1626316157-24935-2-git-send-email-kewei.xu@mediatek.com>
In-Reply-To: <1626316157-24935-2-git-send-email-kewei.xu@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 15 Jul 2021 12:09:19 +0800
Message-ID: <CAGXv+5Gr_PSw4XAe9VkdAH=JnJXe=yeH0Gu16qSheuJbmWgi+w@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: i2c: update bindings for MT8195 SoC
To: Kewei Xu <kewei.xu@mediatek.com>
Cc: wsa@the-dreams.de, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
 linux-mediatek@lists.infradead.org, 
 srv_heupstream <srv_heupstream@mediatek.com>, leilk.liu@mediatek.com,
 qii.wang@mediatek.com, 
 qiangming.xia@mediatek.com, ot_daolong.zhu@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_210932_993159_4CE13211 
X-CRM114-Status: UNSURE (   8.04  )
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

On Thu, Jul 15, 2021 at 10:31 AM Kewei Xu <kewei.xu@mediatek.com> wrote:
>
> Add a DT binding documentation for the MT8195 soc.
>
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>

Please remember to pick up tags from other reviewers.

ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
