Return-Path: <SRS0=3B0C=5F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EDFBC4332B
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2020 01:06:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 112CA20740
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2020 01:06:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XH0SbFYK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i6AR+D3j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 112CA20740
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fppyUh7sbNu/uciWqYMh/Q6CAhGMDIir2VeM7HqCHOE=; b=XH0SbFYK9vs5Xi
	mnYoc3GcBdm5fZo7u5O529ynI7O7h6awATVEAeU8edtgTDF6xql0iN21ZeSbiqzADswiRQTk66wrk
	B30ry8agSIMFzzRhZGTkG7E6X8ChNpZWYgNCP6xo+rxOhBj/U8FvtsOODnvySKsWUW2MIx9pyK1yl
	3Kc7KYKGv+CtCqyHAZdJvEmmfTWumYvKbRxe04aVZcNc2wNdiNESJF/tEF6NG3oKPRAW2uLSBOZ/Q
	OngK4Kqv4SHPI6Z0b1668cLdVX6W+67j5VxSBc1aUavmPRWpOZGv1Ndzhioos9WUEFFKD1IIwiEMn
	vHp7xtjj3o64DZW6ghOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jF66h-0004eA-DN; Fri, 20 Mar 2020 01:05:51 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jF66e-0004dI-LL; Fri, 20 Mar 2020 01:05:50 +0000
Received: by mail-il1-x143.google.com with SMTP id w15so4132595ilq.6;
 Thu, 19 Mar 2020 18:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pIKmKtPK9inyHBgOdGiW1cUuusmeVK05PlwwC7X+p5I=;
 b=i6AR+D3jHyppvVrFUj442iIkudhoNOYo5aGJ+CNFj4M/c4ChNUL/eyGofj6hWNHBuY
 4P5MAkxAR1/5Xr1GPtYHWDK8fooG4Eg0/nh4cqrwaKcwhHE83DU8URq9JUcY7FBq86ng
 Vt124ONAuGsAl7gw8EKfp4oYNlMq73CH1Kxszez5Mh6pTu6dFBmXZiCJtqgpEgooOJDx
 KgXJSjHjsuscAUJZZsQMV60PVMH5V77m5x48qnL1DHE9FGkbNGCDZ7AJpgWJYieESVsU
 U0ZGI+6jQT7vCtloA+JY0ChZq4krmDE97EP5hRb7DEKbqDtb3GxDbLrpJex67SaSbs8R
 4e5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pIKmKtPK9inyHBgOdGiW1cUuusmeVK05PlwwC7X+p5I=;
 b=Blo6CMHXO3N9NSAHb6L/GRaEO8vUoWr+gABd62r/LPw78s4TWJSC3KHnWT3uYdNVc/
 33efIjO2ZmCxoRJBV+4niOv4EZlG7+OSPk3B0N9IItdwWei1zyIo5YxMhakrfLYZKUIb
 mssfxeX33cINyXwNSdDuTWl//C7RZbQJT/bdnS6qkHfJLSq+pm2LFspxrOv3nkKGFgaa
 jKTsMvP4GvyWxh8l4qrg13cwHKz/Vpdr5LLhB9AOfMDd7ICYVGg0HFygPgCTSDPzUbG9
 lF3baGhh7Nn+amgt1pesLnFkxA9wZ4rYzBlcv3TDIq3j9oaguP/0c6928qG6ZTMEiggw
 g3UQ==
X-Gm-Message-State: ANhLgQ2Vprg1/yZRAo855MTQ18gQm7EdwfkMrIKIk2x6FVciz3+UIuxb
 Hse8feA8mPVi4IUkCXKNzIjp8EVxK4GkvzeWBDk=
X-Google-Smtp-Source: ADFU+vsXyzyi+qYF7P30xEdl3SKnMs0e3iLkESTh2BBQsMZWVdzJW5b85BdQP4rcWeSVIDarW3qIa5gY6lsuDO93L54=
X-Received: by 2002:a92:5fc5:: with SMTP id i66mr5814798ill.303.1584666344631; 
 Thu, 19 Mar 2020 18:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <1583664775-19382-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1583664775-19382-3-git-send-email-dennis-yc.hsieh@mediatek.com>
In-Reply-To: <1583664775-19382-3-git-send-email-dennis-yc.hsieh@mediatek.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Thu, 19 Mar 2020 20:05:33 -0500
Message-ID: <CABb+yY04NbSvHkQ0sVHd+KjU3ZFZSZD=H99OSNjoeu+Qpk7R8g@mail.gmail.com>
Subject: Re: [PATCH v5 02/13] mailbox: cmdq: variablize address shift in
 platform
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200319_180548_724472_79B6E871 
X-CRM114-Status: UNSURE (   9.30  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wsd_upstream@mediatek.com,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, HS Liao <hs.liao@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Houlong Wei <houlong.wei@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Mar 8, 2020 at 5:53 AM Dennis YC Hsieh
<dennis-yc.hsieh@mediatek.com> wrote:
>
> Some gce hardware shift pc and end address in register to support
> large dram addressing.
> Implement gce address shift when write or read pc and end register.
> And add shift bit in platform definition.
>
> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c       | 61 ++++++++++++++++++------
>  drivers/soc/mediatek/mtk-cmdq-helper.c   |  3 +-
>  include/linux/mailbox/mtk-cmdq-mailbox.h |  2 +
>
Please segregate this patch, and any other if, into mailbox and
platform specific patchsets. Ideally soc/client specific changes later
on top of mailbox/provider changes.

Thanks

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
