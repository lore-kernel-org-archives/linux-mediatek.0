Return-Path: <SRS0=6pE3=3C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3911C33CAE
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2020 06:27:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63E7B21744
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2020 06:27:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oSyJoWcx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BesEvaNj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63E7B21744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0PO1QxvFAy2r3XTckmBVIn5E+9x4V/pfxRNlAQMty54=; b=oSyJoWcx0ctC9e
	KJC/4lgEsrg5IIGoLZz25VeOqkpgLv/IUxQo//2pbz0WGZj6+MBpAsj7kX4EnvviUs1C7e7zKxrb7
	PFAyJnQGZTUWJDT3p0mZqff0bC0/3KM459Dlum2RaZJfN2DHPto8nc+0NuCk7cVcnbYLmTO4J6YBW
	BLF6RStckk2gYazKziaakbvDums2d7x0c2VQKGZ4rd1dPrrl1W7bFXQZj+8Lvf1iIgz7VQ/PVQhB6
	XDwQZULc2F7crNHHeUK0oRwpp4Pe1wzRFYHnYiHEaAwZbFJDxt2UijyKKWsyc618Ic5WnaQeWZdgi
	LduDKi/a85XnEQ/U8qlg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqtCQ-0007Bd-G4; Mon, 13 Jan 2020 06:27:42 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqtCN-00073A-0R
 for linux-mediatek@lists.infradead.org; Mon, 13 Jan 2020 06:27:40 +0000
Received: by mail-qk1-x743.google.com with SMTP id 21so7562726qky.4
 for <linux-mediatek@lists.infradead.org>; Sun, 12 Jan 2020 22:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qqU50tJXg4btjktw2VvbKv0T9TvXNsl1InIj+ksOmtQ=;
 b=BesEvaNjkjkIaEKU8s1yXxtetLayewpTzSIxgPAnNIWav0rTK98k3PPyGaPY2ooOev
 PIM5l4QCvCTOXJN9/lV28q95hAXAwCBK0NsqjUnuTxlcAFy50WZaCvEZUAtRr7ZYVZUl
 GjvY+SmcmMu/fBk4T4iGDv10EKa6Rk0lxaUB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qqU50tJXg4btjktw2VvbKv0T9TvXNsl1InIj+ksOmtQ=;
 b=gJWzVIz+T6DRCrvrz3lH+Cil8Lz0e6tDoFZNdoMG8TLdJnAF3KkXqjvzzqBySVC0dG
 rohNpI6hSONdctAbQ/0NVpFQBuDYFME/9FT0ePm50/BOpXiUJfU+h2iA64hkUeWjAfE4
 Rmyp8/OjOD7v5iYyWQZc0p7O6k2dhbSWPcglh1PZYP+Mmr21oTJSvcXHxfumfmDgFZMc
 eKIJachLw92VUCBBkhOB+/CXPGV+1XJJ3RJiDAIrT4sGvh6aQzhxMDD2IbPb+jNV40K4
 5pkE6klQVnSGVWylcC5PJtTXiOdGsArwg38+e/COOoFwt+rKB6iaCKPrzILAiQZqMM52
 WeBg==
X-Gm-Message-State: APjAAAWvHjB5EDlZ5mDncktXbwuyxIK9IwXHDoZnUA0V+Os2+n2Vj3f5
 FxIOQIg6Fm6Nl5sJZckfBYW6Q1UGj7ufHmNBxaxQWg==
X-Google-Smtp-Source: APXvYqzP2GQhgfRONDK0y5ZOBxgMhbBnqFh8jwEdZzw+mIw4d1s/lLCcUIgYHMP8DEVTe7wIzDfiU37pKS7LntYC0ao=
X-Received: by 2002:a37:6551:: with SMTP id z78mr15363934qkb.144.1578896857929; 
 Sun, 12 Jan 2020 22:27:37 -0800 (PST)
MIME-Version: 1.0
References: <20191227141405.3396-1-yong.liang@mediatek.com>
 <20191227141405.3396-2-yong.liang@mediatek.com>
 <CANMq1KD=jAPn4Y7zQZrsg9FB7Cq6tNX0R8OF4qX21Sjy2=0Naw@mail.gmail.com>
 <CANMq1KB4PzAUdp03go0Ur_khi2bM3+oNUhHtMK=--V6DmGXiDA@mail.gmail.com>
 <2bbd8f47-fe68-574c-cbe9-bcc680dd4c84@gmail.com>
 <CANMq1KCXMUP=5ijqLsZ67MvO2ROFkG0vSX64KqmWtYKm7w8f2g@mail.gmail.com>
In-Reply-To: <CANMq1KCXMUP=5ijqLsZ67MvO2ROFkG0vSX64KqmWtYKm7w8f2g@mail.gmail.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 13 Jan 2020 14:27:27 +0800
Message-ID: <CANMq1KCLGx2K5qSVJLFkFqYjghVk40HaZcBeUmSxpBSJQAMOzg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] amr64: dts: modify mt8183.dtsi
To: Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200112_222739_075702_81FEE329 
X-CRM114-Status: GOOD (  15.77  )
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
 Yong Liang <yong.liang@mediatek.com>, linux-watchdog@vger.kernel.org,
 lkml <linux-kernel@vger.kernel.org>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Sj Huang <sj.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux@roeck-us.net, wim@linux-watchdog.org,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

+Jiaxin +Sj Huang

On Mon, Jan 13, 2020 at 12:44 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> On Fri, Jan 10, 2020 at 6:09 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
> > [snip]
> > That's all a bit confusing, I thought we are fine to add the reset cells to
> > infracfg as we have the resets defined in
> > 64ebb57a3df6 ("clk: reset: Modify reset-controller driver")
>
> You're right, we're fine. But at least in theory, we should still have
> the binding documentation that I linked above.
>
> I will try to pick up all the required patches, split them across
> 8183/2712 and resend as one series.

Okay, summary of the patches, there are 2 series:

https://patchwork.kernel.org/patch/11311237/
[1.1] [v3,1/2] amr64: dts: modify mt8183.dtsi
  => Partially applied to Matthias' v5.5-next/dts64
  => Other part depend on [1.2], needs to be applied
https://patchwork.kernel.org/patch/11311241/
[1.2] [v3,2/2] dt-bindings: mt8183: Add watchdog dt-binding
  => Pending Guenter/Wim

https://patchwork.kernel.org/cover/11326757/
[2.0] [PATCH v11 0/3] ASoC: mt8183: fix audio playback slowly after playback
[2.1] [PATCH v11 1/3] dt-bindings: mediatek: mt8183: Add #reset-cells
  => IMHO adding mt2712 compatible should be another patch
  => Depends on [1.2]
  => Tags should be all dropped
[2.2] [PATCH v11 2/3] watchdog: mtk_wdt: mt8183: Add reset controller
  => Issues about tags
[2.3] [PATCH v11 3/3] watchdog: mtk_wdt: mt2712: Add reset controller
  => Issues about tags

Jiaxin/Yong Liang/Matthias: Please let me know, I'm happy to pick up
the patches, clean them up and resend them, if you think that helps.


> > That's why I took this part from:
> > https://lore.kernel.org/linux-mediatek/20191226093930.22413-1-yong.liang@mediatek.com/
> >
> > Please let me know if I'm wrong and I'll drop it.
> >
> > Regards,
> > Matthias
> >
> > >>> 2. Add watchdog device node
> > >
> > > Can we have a patch with just this change instead, since you're
> > > sending the binding with it.
> > >
> > >>>
> > >>> Signed-off-by: yong.liang <yong.liang@mediatek.com>
> > >>
> > >> Tested-by: Nicolas Boichat <drinkcat@chromium.org>
> > >>
> > >>> ---
> > >>>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 8 ++++++++
> > >>>  1 file changed, 8 insertions(+)
> > >>> [snip]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
