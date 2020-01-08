Return-Path: <SRS0=HKXf=25=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA30C00523
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2020 08:57:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 701F020692
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2020 08:57:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e0HDByM6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Fmu2+rMd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 701F020692
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bbjc8KI2LGitA6Qmvot5qBMkpf9UU/riI/oJyHg4kgg=; b=e0HDByM6aLATBM
	g+6RlUA9Hio9W1bpsb8iIhCacxgHOeAT/syPEXV5ssUjd0FQxopVX059ZG69cVsv+0PvQ4v9/842y
	Txe8E3lPMmYdQFZKGNV+YXV2Lhk3SnGLdmP3f9MNitFfi10VLvCwIlclOyWkc4L+iouxy1BVelqNv
	VxyXTQAfwQuHJqBTitXi+SctD0hyRhh+bE4ZKaaLF+AStc9IQnT2A/p5XpDv2+w6ARtPCqQoxRkn0
	15OmYZy+IeivanK9KfBM4Eenn1qIgVKKMMWPbFny/d18LqVnpFTBoDZGTa5cW9fRWOJ/DBeg55qpE
	AdDD8fgej4QBX5cLQQGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ip79w-0002H5-GC; Wed, 08 Jan 2020 08:57:48 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ip79n-00028V-MZ
 for linux-mediatek@lists.infradead.org; Wed, 08 Jan 2020 08:57:41 +0000
Received: by mail-qk1-x743.google.com with SMTP id k6so1966889qki.5
 for <linux-mediatek@lists.infradead.org>; Wed, 08 Jan 2020 00:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=txHGvTmn6wHXPp2oQOJpqKQj8noXhF4VbGKRGRI9/tU=;
 b=Fmu2+rMdGH01pAOFv9xENu9HKyrQuitINAws5ePHXdMU3xruGlysnG5rLwZfvug1bU
 dvirjyp/LKV7X2OHq9BL2qNsJ1a4/Y5qFIHU4vq3gZwbU8TZRVu/ba5u0Xzk3Ec5Q0Ds
 WW27qghCc4Qi/QUT/ch/sBr5K/mGcq3oOsx10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=txHGvTmn6wHXPp2oQOJpqKQj8noXhF4VbGKRGRI9/tU=;
 b=ZqHpHGw8sUcqEnMYa283aX0XkOli+yTPPs4l/G1JZo4He4wyiv8CDCjb/7HB8aOGO1
 afWSqLPFDLuxJnVY3lerRiz99niUdeo98ukPW1H+nHHKnEXMdfDk08gOWxCXIbMbdOUF
 FHjQUPSTf0bR/21FTxGXQ+mfh1hwVJMOX3EeNuTXsiJXPup+8aakGt/uDmnpRzbFomnw
 sZeHnpOUKu4FZ5dOENyOu7e2r6LcIt9nA9jBBEZit5hTC3CKKO1F55LSjPSvxn/gJIbk
 uQZSZwZAZ2XfRhE5jQiTsMxW8HEnUGOIlMinSXrhhcQqJoIckS4wnRx2u81CQTgjAdmD
 7Ktw==
X-Gm-Message-State: APjAAAXf7V0+Be7wfZftFAqSdY1kayohzeWtb5It3gZ6R/k8AbF1djEt
 FzOELPUhk1IsltuvOM0w72wo6+PJcIBxF3uPH6HU6Q==
X-Google-Smtp-Source: APXvYqyxg+WXfWADIYH7mp/FamID6msEFLooGtjXHNkGMJ3b/HHH7fES5RiF7qjZJrTUVIs9ZocSgYGBXQI6iIPX6GE=
X-Received: by 2002:ae9:f003:: with SMTP id l3mr3269467qkg.457.1578473858520; 
 Wed, 08 Jan 2020 00:57:38 -0800 (PST)
MIME-Version: 1.0
References: <20191227141405.3396-1-yong.liang@mediatek.com>
 <20191227141405.3396-3-yong.liang@mediatek.com>
In-Reply-To: <20191227141405.3396-3-yong.liang@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 8 Jan 2020 16:57:27 +0800
Message-ID: <CANMq1KBaE0OimRaa2tiQQYS2irsaNQR_7O8RCWYMpTGnnYNYEg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: mt8183: Add watchdog dt-binding
To: Yong Liang <yong.liang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_005739_741553_A9A5DA61 
X-CRM114-Status: GOOD (  13.56  )
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
 Devicetree List <devicetree@vger.kernel.org>, linux-watchdog@vger.kernel.org,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux@roeck-us.net, Matthias Brugger <matthias.bgg@gmail.com>,
 wim@linux-watchdog.org,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Looks trivial.

On Fri, Dec 27, 2019 at 10:25 PM Yong Liang <yong.liang@mediatek.com> wrote:
>
> From: "yong.liang" <yong.liang@mediatek.com>
>
> This patch add watchdog binding documentation for
> watchdog on MTK Socs.
>
> Signed-off-by: yong.liang <yong.liang@mediatek.com>

Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>

> ---
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> index fd380eb28df5..3ee625d0812f 100644
> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> @@ -9,6 +9,7 @@ Required properties:
>         "mediatek,mt7622-wdt", "mediatek,mt6589-wdt": for MT7622
>         "mediatek,mt7623-wdt", "mediatek,mt6589-wdt": for MT7623
>         "mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
> +       "mediatek,mt8183-wdt", "mediatek,mt6589-wdt": for MT8183
>         "mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
>
>  - reg : Specifies base physical address and size of the registers.
> --
> 2.18.0
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
