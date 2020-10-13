Return-Path: <SRS0=564r=DU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1094C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 09:06:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45601208D5
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 09:06:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dRNPQfj5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="IZZqgx3X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45601208D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RGI5u875Ga3KO4RD0ysQ3J+Kkv3fXfG7WWsYBuivrvw=; b=dRNPQfj5S7BHMSjqmMbyEJAI/
	1a4GoauJ6Iu34dUCh21Oz1aeE52lNzonBqy40uN+o9+UcH8oyQ1inWLWK79S7zsmPK/GwDIpyttwc
	nKTLbczAtCpaN+To40uZ4nGSNSGuFKWQ2f9/Pwbhra1829kUxzcgHoXduFNrswwxgKM7hXmxn6cWt
	D4LANTYWneseCGU7R/y3rT5ffbYOaa0dy4zNOINgZQq1OROma0W4FO38ywcpdQyZmzm9BZHVJ3+PH
	jMU6NOEz8n3oGuNR7ATQAxEBvEgIaDE5qNW/BLzhXHsWZT9o9tlYYAwkGVtuMfwGwZAsSxjv9YVlT
	YD6rWh7+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSGGR-0002kf-At; Tue, 13 Oct 2020 09:06:36 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSGGO-0002jo-PX
 for linux-mediatek@lists.infradead.org; Tue, 13 Oct 2020 09:06:34 +0000
Received: by mail-il1-x143.google.com with SMTP id p9so3110866ilr.1
 for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2020 02:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h1Kn1e9l6DefK7UeWxKl0RXZdndEdV2fl2mFTDouCI8=;
 b=IZZqgx3XirUM6a1686Gvw+XBThwLkKU+a3xuShyhmkoSPZ48SquqAhA9Z4BnAarFXW
 LbYClxfi0KkhUIMPl6p7oUskobKyJBDmxaNC1tMv5jCC8F+6jlPzqVK4nlk+wVMAGHKD
 Rbie1+mSpsusVDCdqjdjG1a0lCsUrJCic3Q/A732XhRB70efFDFvORaQj6cfdFKixTIt
 v/OrAGeLC+uM+zSSDmm5J5VRLoj3lncu7aMNBB5UgwIQYW47UnuiELot0tiOBG6bPFkG
 h2O63hEybPIWYxcPm/yFySfGBtoS4rpSzspXAHPEG4LfbD0KWzY/BlhYv1VTR8hUMCr2
 DiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h1Kn1e9l6DefK7UeWxKl0RXZdndEdV2fl2mFTDouCI8=;
 b=Qn8KQFo2+SCAgPSYSaBNpb4Fiok0TAGAjJW5XDNoMwKijPRCOz59lHHgnA56ghQ3sE
 YqdlgTvFHenLjyrWiNZLdUt/SRjanq039K0Gv4Y3FPZN6LPjc3YskTuAZ4VkND5rXUO7
 GOlY99rHT5b8XaVeR06v/cGmJ9U1Ae5/95PpRcyyEkgVEiAe/4ooyUjXAbkHLFjKdbEa
 69VBD2gM0QIZLWUQxDCRBPTR+vrocftIhYk/sg+34ny3Vxp5s/gV2URgEWmm1m6r4xMZ
 YGLqB6J39BZT2rgxfVDYrksQ6ttCvjh5cKjORkfYKQbbYAJs3BnDLXFUiI1cj1n19PIL
 EpqA==
X-Gm-Message-State: AOAM531bBNC5c92fz9DX2U3KGRmFq+lKOQERwQFOy9B+L8fZrfzxvSXP
 5DTJF/bw3xutihxxu4kGuF0KezvB4kpSVw9qjRy99Q==
X-Google-Smtp-Source: ABdhPJwk5H+Z635Qt/KH04jq7L0usmATbmKO3VNhzThntbBFHaS6R0l7HMM0l/U1X1TkdfOiSYVqKCKcJHL7SaOdHCc=
X-Received: by 2002:a92:5e18:: with SMTP id s24mr2067841ilb.48.1602579990710; 
 Tue, 13 Oct 2020 02:06:30 -0700 (PDT)
MIME-Version: 1.0
References: <20201012205218.3010868-1-fparent@baylibre.com>
 <20201012205218.3010868-2-fparent@baylibre.com>
 <81a12664-639e-20cc-8b49-6bcb53822a3f@gmail.com>
In-Reply-To: <81a12664-639e-20cc-8b49-6bcb53822a3f@gmail.com>
From: Fabien Parent <fparent@baylibre.com>
Date: Tue, 13 Oct 2020 11:06:20 +0200
Message-ID: <CAOwMV_yqK+yLZH1tOSeUHP7qz35k-bYmWf7jg6qQpvhO9LeJ6g@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8516: add auxadc node
To: Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_050632_917609_AAE000E9 
X-CRM114-Status: UNSURE (   9.58  )
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
Cc: DTML <devicetree@vger.kernel.org>, lars@metafoo.de,
 linux-iio@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 jic23@kernel.org, pmeerw@pmeerw.net, knaack.h@gmx.de,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Matthias,

> Any reason you don't enable the status in the pumpkin dts?

No particular reasons. I looked at what other MTK SoC did for this IP,
and half went with the status to be disabled and the other half went
with an enabled status.  So I went the mt8183 way since it is the last
MTK SoC to have been merged and disabled by default. If you think it
is better to be enabled by default, I can change it, I don't have any
strong opinion about this.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
