Return-Path: <SRS0=9UGu=ET=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03BB6C388F7
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2020 08:27:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74E8920936
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2020 08:27:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="webBt8MC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="EPiaua46"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74E8920936
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5BvtOdyN0odlb3ki2UFjf7iyDUl+6cYO1Eh3dn9M9zw=; b=webBt8MCWlrhc1E1mdic2EH4s
	H1bHmLRdMwOJKjjR/ABqat4LzcxMN6a4TLt4VXpYOqn0QDtnGqxu0i1Cbz0x+0BZF5kLf7KqZQkkS
	qsSb0Gt4vgq5e6ll+sEKm3xivrNDWb5f2XUsZtW827QzqZYyg8Z4qXFTmHcbjSRNVeOoGNbXkjswd
	3qCD6uZshKJJKepUGZkgDYAsNiZFYfAmEjrP7Dl7cwAQfjPSggS3gAnoLsUCmZmB7px2esKd4L6PY
	pN/nzcOsX7Fi6ODjJrflm8+nUibfubPSufIIGTUd5kC7rNVoLNCu3bhG3tITpmtTxkMEHEbSXbY8L
	4OZQXGkRg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdUQ8-0002cP-6n; Fri, 13 Nov 2020 08:27:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdUQ3-0002aP-GJ; Fri, 13 Nov 2020 08:26:56 +0000
X-UUID: 9a8dc7cb751e4dd59a535eef1ad9e71a-20201113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ZShn+dzBZrjkCnF7peuUmT+UVHHS3a90GpKlN9nJIjE=; 
 b=EPiaua462hSIfPfeZPO1WkwCzYt06jWxWBF8pfOmr9IDmQOWiezjBOH6PGsPK0z2VjMKRKrd5p/xZacPwU5F/of3a1EMIcnhk56Q3eNxTaSf3jObHu1cNUVdEoEyqF7ElBlCjLIPBAOBcMD/9Bo80YwGoKLUAFqs0N+EoG/Ur90=;
X-UUID: 9a8dc7cb751e4dd59a535eef1ad9e71a-20201113
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 996187859; Fri, 13 Nov 2020 00:27:05 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 13 Nov 2020 00:26:47 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 13 Nov 2020 16:26:43 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 13 Nov 2020 16:26:43 +0800
Message-ID: <1605256003.31607.26.camel@mhfsdcap03>
Subject: Re: [PATCH 7/7] usb: musb: convert to
 devm_platform_ioremap_resource_byname
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Nov 2020 16:26:43 +0800
In-Reply-To: <CAMuHMdU8ow7J-Db_v3HUM8MmPfYcNpirzpUFmjUQrneeaVGFoA@mail.gmail.com>
References: <1595404275-8449-1-git-send-email-chunfeng.yun@mediatek.com>
 <1595404275-8449-7-git-send-email-chunfeng.yun@mediatek.com>
 <CAMuHMdU8ow7J-Db_v3HUM8MmPfYcNpirzpUFmjUQrneeaVGFoA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5899ECDA3DC868B0B5D4BFAE4960474BA86ACCF81DC48B0440F0F167947F43C42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_032655_701452_7847445B 
X-CRM114-Status: GOOD (  20.04  )
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
Cc: Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, USB
 list <linux-usb@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Bin Liu <b-liu@ti.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-11-12 at 15:08 +0100, Geert Uytterhoeven wrote:
> Hi Chunfeng,
> 
> On Wed, Jul 22, 2020 at 9:54 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> > Use devm_platform_ioremap_resource_byname() to simplify code
> >
> > Cc: Bin Liu <b-liu@ti.com>
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> 
> Thanks for your patch, which is now commit 2d30e408a2a6b344 ("usb: musb:
> convert to devm_platform_ioremap_resource_byname") in v5.9.
> 
> > --- a/drivers/usb/musb/musb_dsps.c
> > +++ b/drivers/usb/musb/musb_dsps.c
> > @@ -429,12 +429,10 @@ static int dsps_musb_init(struct musb *musb)
> >         struct platform_device *parent = to_platform_device(dev->parent);
> >         const struct dsps_musb_wrapper *wrp = glue->wrp;
> >         void __iomem *reg_base;
> > -       struct resource *r;
> >         u32 rev, val;
> >         int ret;
> >
> > -       r = platform_get_resource_byname(parent, IORESOURCE_MEM, "control");
> > -       reg_base = devm_ioremap_resource(dev, r);
> > +       reg_base = devm_platform_ioremap_resource_byname(parent, "control");
> >         if (IS_ERR(reg_base))
> >                 return PTR_ERR(reg_base);
> >         musb->ctrl_base = reg_base;
> 
> On Beaglebone Black, where each interface has 2 children:
> 
>     musb-dsps 47401c00.usb: can't request region for resource [mem
> 0x47401800-0x474019ff]
>     musb-hdrc musb-hdrc.1: musb_init_controller failed with status -16
>     musb-hdrc: probe of musb-hdrc.1 failed with error -16
>     musb-dsps 47401400.usb: can't request region for resource [mem
> 0x47401000-0x474011ff]
>     musb-hdrc musb-hdrc.0: musb_init_controller failed with status -16
>     musb-hdrc: probe of musb-hdrc.0 failed with error -16
> 
> Before, devm_ioremap_resource() was called on "dev" ("musb-hdrc.0" or
> "musb-hdrc.1"), after it is called on "&pdev->dev" ("47401400.usb" or
> "47401c00.usb"), leading to a duplicate region request, which fails.
> 
My bad, I didn't notice that, thanks a lot.

And sorry, I missed your message

> I have sent a revert:
> https://lore.kernel.org/linux-usb/20201112135900.3822599-1-geert+renesas@glider.be/
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
