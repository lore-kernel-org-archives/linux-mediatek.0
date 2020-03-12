Return-Path: <SRS0=9ZOH=45=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06436C0044D
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2020 01:42:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1893D20753
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2020 01:42:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cPbrccUF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dEXMnPsU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1893D20753
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pxXfmA4XZjeMzW3mTWtdJ1dya4+m1yJJg1f0+mGCw7Q=; b=cPbrccUFWQsFLA
	W0pGASZ9wwnSjW4Dz39SJXrLAFKuCwg0wBPrYGI0dg2ARCwlTnyb9+qcn3kmnRx7Cyv0nTfH01Wcr
	IugNYD1cYJpbhb6dD+caYhjxkrxP4THN+e1z+xnpemASXykugEsZ3VTypo2/DBU0lse9ZZUgc5WP2
	lnjTV6AeCRXbzRa6d8Y8UKyRpACeIxkOzR0eRapDxp2WPrJIIuBjk7iBJFRxXZLwv3FCuYPZ1zLni
	w+r+yglWyGGoQbxEd0F+TJXDqCajf+jmsDGOuhRm2FV/81dfZD7/eOR0IyLRFIl/dcD9lH1ecUBA2
	CVb1/VY0dWuj1Wsdxc7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCCrF-0004Jb-80; Thu, 12 Mar 2020 01:41:57 +0000
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCCr8-0004E4-9U
 for linux-mediatek@lists.infradead.org; Thu, 12 Mar 2020 01:41:52 +0000
Received: by mail-vs1-xe42.google.com with SMTP id o24so2694165vsp.4
 for <linux-mediatek@lists.infradead.org>; Wed, 11 Mar 2020 18:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k+2wQEy+NMnEIDcA6S02pCEqP6eFCuK4Z4/8szPajwc=;
 b=dEXMnPsUOVToOowHXjjb6pViv6j7NYO7alRyodmH88IKDJ9teW/utBZ2GV7iOxO+Zc
 BrLj3iTeeQ+MIS6lFh5vpKzqi+cXFhOJrEjLbZciKYQInENdAVdYCjV2c3wwPVIHA+yu
 Z3R+683VAjC18js16mQ/SEe7KXz99FCSaNuSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k+2wQEy+NMnEIDcA6S02pCEqP6eFCuK4Z4/8szPajwc=;
 b=ggPf4glttehcPApZcgYaVl9NgLQ3cCvG08oVkHkqSJT642thDyfyGpK51Yb61ocGPN
 Mp4O/zO55SOC3yLfCx7JbegChqxUBMX86P8/CK1g6ZjLwfhG7WHTq2RUDMaWooHcPUT7
 Q0xUnMVRV90JGw29FRkztuNvbCU3Z0aU+mwleRpJeYk7jEYwYPrG1FzK4KfBF7MFsuFI
 XqStcf50DhAGGtFPYGXAfO+eHlmTP9v2biY8lNGs7fCG07ZBU0q2zCkbZLIn2+OzoR3i
 rw+FMcOLbqbI7ehl0wUCGSjX2B8zMdkSDm/AlAwSf1s79Ez3N4E23CWz25arTNDY1QbW
 hvxQ==
X-Gm-Message-State: ANhLgQ2CYZc85s9haQVb8Gp2vp5ZGIlGL9ptuabAR+Ids+zmUt1dstPj
 hXaSlakyUrdrJI3cAniAOScWGUWPMa2p6iBMlVEC3Q==
X-Google-Smtp-Source: ADFU+vtwixbNza+rk01UttXlhW3Uxqa+sfYsUCDCqXXbvWG6vOSRtdS02syicarawHJ6J0EPqdPba2S1Oz1D1r/xpoo=
X-Received: by 2002:a67:3201:: with SMTP id y1mr4190035vsy.54.1583977308293;
 Wed, 11 Mar 2020 18:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <1583918223-22506-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1583918223-22506-4-git-send-email-hsin-hsiung.wang@mediatek.com>
In-Reply-To: <1583918223-22506-4-git-send-email-hsin-hsiung.wang@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Thu, 12 Mar 2020 09:41:37 +0800
Message-ID: <CANMq1KBdYPiWDHqSUwu86q3Kj=r0PWCoYcj28v5poNKNsB5U0w@mail.gmail.com>
Subject: Re: [PATCH v10 3/5] mfd: Add support for the MediaTek MT6358 PMIC
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_184150_325954_70E83CA6 
X-CRM114-Status: GOOD (  13.48  )
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
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Josef Friedl <josef.friedl@speed.at>, Ran Bi <ran.bi@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Sebastian Reichel <sre@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, Richard Fontana <rfontana@redhat.com>,
 Devicetree List <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>,
 Lee Jones <lee.jones@linaro.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Mar 11, 2020 at 5:17 PM Hsin-Hsiung Wang
<hsin-hsiung.wang@mediatek.com> wrote:
>
> This adds support for the MediaTek MT6358 PMIC. This is a
> multifunction device with the following sub modules:
>
> - Regulator
> - RTC
> - Codec
> - Interrupt
>
> It is interfaced to the host controller using SPI interface
> by a proprietary hardware called PMIC wrapper or pwrap.
> MT6358 MFD is a child device of the pwrap.
>
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>

Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>

> ---
>  drivers/mfd/Makefile                 |   2 +-
>  drivers/mfd/mt6358-irq.c             | 236 +++++++++++++++++++++++++++++
>  drivers/mfd/mt6397-core.c            |  55 ++++++-
>  include/linux/mfd/mt6358/core.h      | 158 ++++++++++++++++++++
>  include/linux/mfd/mt6358/registers.h | 282 +++++++++++++++++++++++++++++++++++
>  include/linux/mfd/mt6397/core.h      |   3 +
>  6 files changed, 731 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/mfd/mt6358-irq.c
>  create mode 100644 include/linux/mfd/mt6358/core.h
>  create mode 100644 include/linux/mfd/mt6358/registers.h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
