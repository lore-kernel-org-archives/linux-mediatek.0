Return-Path: <SRS0=+xT1=ZE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12660C17440
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Nov 2019 07:56:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB86C2196E
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Nov 2019 07:56:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KB013OwG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WVdrF/Lb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB86C2196E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cTLKeV1Z6QtsqPlp9ucbIQzyTajNdAB4XW2QIS5qDXA=; b=KB013OwGNRJF6a
	+rEVwIF/eKpqb6PX1tC4MDnXMjh7Z1lFz3TZm7NQcAuQvBXSynhFfd3ldEx0o4RvChKJJQiL7Qdb6
	zJTTLlp9RniJM4fNLv0j5PAUDxxTELJsdz6XR2W7XV/P6QaQxrBZW8iJKXSDKuvwkK3VFxSg5+6TB
	U1uaEA/lqLvt8QXNATOyCS4/TtHwq1rzQayKIkwf5V/bU1cIUytnvLXsEcX+DSg13Q/EXG4ZE/swg
	QmnSniGJXCd98gVEAjjKM4Vn5fItZgTMP50mbftMqWes2qKfRM9lTMmyx61G9Vc+dYfsrR2kXZ9bV
	B7abm4cTQbIJgl2QALZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUR2B-00013o-CU; Tue, 12 Nov 2019 07:56:19 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUR27-00012h-QE
 for linux-mediatek@lists.infradead.org; Tue, 12 Nov 2019 07:56:17 +0000
Received: by mail-ed1-x543.google.com with SMTP id w6so14122705edx.10
 for <linux-mediatek@lists.infradead.org>; Mon, 11 Nov 2019 23:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d9CMSdwYc+0bvqNY3bj8MTiXUzC4S4T1DHmbw/hjbNU=;
 b=WVdrF/LbuxNK+RZNB4qelNBp/e4iwRucvZrfay5MYioNfC69yEfkiq3mEKN7+QocMA
 +ngIf7oLH3g4EnilEip1f0heRVINC3xqFE6iutRFJUMUuXRepN6qv6Ogb7eeXtq+437w
 VySjdaJ+YGZ4xajTgloZcmw/30nVqMmAXL1jo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d9CMSdwYc+0bvqNY3bj8MTiXUzC4S4T1DHmbw/hjbNU=;
 b=t790P41tg92LSNjPCQP8bvLfzl+23h6FYvBg3YIG2kKnfjXRnKJFPgLVYrTszKtVSC
 OcfhjgsQxTXkt2cACK6L1hBrT7RfhLyYoSrzhsaryuYasmty3sKOSvVjTR3SnPazBq9u
 MR5P/9XJglqKJwUhcgc22jC0GN9JgbPa4k5vRLVbgm5YfHW8BRCvW3YG9n/SgFogvHJq
 U+RqdWYsCEHxOSotfMg9Z8qkqUalMIdz282poQZflpG79yhbotkFxlKWyDePPdrPKQZ7
 MpKvPVqUV9G2vEKUF5f0vdWkYFaqtllKQfPNL7N/t8cXLxz878QP3ThArJ3lSOMMtI/e
 Xkqg==
X-Gm-Message-State: APjAAAVYhhOWZFYmcsH6R+db3Odgf8Unde0pi4GbH60YtEAM28Vpr2au
 ii/ZOHrn5bVa8r9K1HWDlZODch73G3tsdjRWQPHH/A==
X-Google-Smtp-Source: APXvYqykVU2DO/Wmg+8yGSGg8XpY3WapNGgB/334lOZGqtD4Ac7vjW8R99gzzSZakZJfvmlK2D1L57s3QPnfDwLf6zI=
X-Received: by 2002:aa7:c694:: with SMTP id n20mr31255461edq.87.1573545374058; 
 Mon, 11 Nov 2019 23:56:14 -0800 (PST)
MIME-Version: 1.0
References: <20191014075812.181942-1-pihsun@chromium.org>
 <20191014075812.181942-3-pihsun@chromium.org>
 <20191111225316.GC3108315@builder>
In-Reply-To: <20191111225316.GC3108315@builder>
From: Pi-Hsun Shih <pihsun@chromium.org>
Date: Tue, 12 Nov 2019 15:55:38 +0800
Message-ID: <CANdKZ0ecgLjhnL9CawW+pPerTtPhnMkaUSmjxcB10OoMBzQaGQ@mail.gmail.com>
Subject: Re: [PATCH v20 2/4] remoteproc/mediatek: add SCP support for mt8183
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Erin Lo <erin.lo@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_235615_878313_83E865D0 
X-CRM114-Status: GOOD (  17.43  )
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
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Nicolas Boichat <drinkcat@chromium.org>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,
Thanks for the review, I'll address them in the next version. Some
inline comment below.

On Tue, Nov 12, 2019 at 6:53 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Mon 14 Oct 00:58 PDT 2019, Pi-Hsun Shih wrote:
> > diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> [..]
> > +struct platform_device *scp_get_pdev(struct platform_device *pdev)
>
> I'm unable to find a patch that calls this, but I assume you're only
> using the returned struct platform_device * in order to call the other
> exported functions in this driver.

Some more information:

Patches for drivers that are using this function includes:
https://patchwork.kernel.org/patch/11126059/
https://patchwork.kernel.org/patch/11134913/
https://patchwork.kernel.org/patch/11135073/
https://patchwork.kernel.org/patch/11138511/
https://patchwork.kernel.org/patch/11140755/

The returned platform_device are used either:
* As a pointer passing back to the scp_ipi_{register,unregister,send} APIs
  # This is the case above.
* Use the ->dev field for either passing to dma_alloc_coherent
(11134913, 11138511), or logging
(https://patchwork.kernel.org/patch/11140755/ mdp_vpu_register).
  # Probably would need to export another function for mtk_scp* ->
device* if going for this change.

A particular problematic patch for this change is
https://patchwork.kernel.org/patch/11135073/, which stores both
platform_device from SCP or VPU in the same field, but it can be
changed to two different fields.

>
> If this is the case I would suggest that you return a struct mtk_scp *
> instead, as this makes your API cleaner and prevents confusion about
> what platform_device could/should be passed in.
>
> Note that you don't need to disclose the struct mtk_scp to your clients,
> just add a "struct mtk_scp;" in include/remoteproc/mtk_scp.h and your
> clients can pass this pointer around.

Ok I'll change to this.

> > +             return -ENOMEM;
> > +     }
> > +
> > +     /* Reserved SCP code size */
> > +     scp->dram_size = MAX_CODE_SIZE;
> > +     scp->cpu_addr = dma_alloc_coherent(scp->dev, scp->dram_size,
> > +                                        &scp->phys_addr, GFP_KERNEL);
>
> Don't you have a problem with that the reserved memory region must be
> 8MB for this allocation to succeed? If so, consider using devm_ioremap
> or similar to map the region.

Yes the reserved memory need to be large enough.
There are other drivers (https://patchwork.kernel.org/patch/11134913/,
https://patchwork.kernel.org/patch/11138511/) that also use
dma_alloc_coherent on the same reserved memory, so we need to use
dma_alloc_coherent here too.

It seems to be problematic if this dma_alloc_coherent is not called
before the other two dma_alloc_coherent, I'll check this.

> [...]
> Regards,
> Bjorn

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
