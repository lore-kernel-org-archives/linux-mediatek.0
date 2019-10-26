Return-Path: <SRS0=+r2U=YT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5A9FCA9EB9
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Oct 2019 20:31:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6497E20867
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Oct 2019 20:31:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ENid8Y86";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ocEA2/Up"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6497E20867
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ax9rLPyPefGKDDQ4T1IDEXF7xhSq7mnEVhbHMb7un8g=; b=ENid8Y862Gtr54
	urRrA40DgMijkfptHnzuUreuGIl1Ivk1FxdPdNpyB4iQhTeCNrgocD8gFMU3r8fNc/8Duek6+rHL5
	22H21eCOBNPsFrJNRCSJSrnjDA3RC4Qed4KKAzP1qe4eAlkTINyiFDJoYL2zhmG1pjIn6pKAen5AE
	Bx9pw4e5bpcPxSnSC6eR4hZ9Ywykj6VUBiKdrQ+LkpXSHXWibmHmg4qyoIO+FTrYpx7BWBdQYYwqO
	Y1ROwYpofJGsoFbLNVzknMsrmRtYpYdxd/gVvZSD+gmFrMtlA4Mdt7sWH1sA6oS1ULWs0zG47gR/T
	f+NsP7P5IuIvJTzm3VBw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iOSiI-0004p7-P9; Sat, 26 Oct 2019 20:31:06 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iOSiF-0004oY-Tj; Sat, 26 Oct 2019 20:31:05 +0000
Received: by mail-lf1-x131.google.com with SMTP id 195so4807173lfj.6;
 Sat, 26 Oct 2019 13:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C3Bnj79/MdmyOPceI8w6ogw+VOwoEwR2LfbvEH8/Jt8=;
 b=ocEA2/UpEZub4FfzrES/35kLEEgf+iuM14yuJDnzueb3oicjVf5VjH8yPNzykDM3CI
 0ySJFqTK5wy/ITLl5r/AeF199mbKYCUlQe1acfJZ5OhvbURawEi5O+XvdN9rqYmKETtf
 IC4fsanTSIIn0AuZ928OzFys+/+zrqPd7vALXtU348vu0tp9fVZM93c8V5ZMRvOv6k3O
 zF08+RBUuiBLGBuqG0409jY8ynGQnCTTBp7hGXvgGTKWkIWQmOEDqYk2MMIl0mIF7Pld
 TI0erEKwKnwVhZpDN3Se0CJNro3iFgZ84BgBVQI0u1n2a2vvUQ2YIqlEi/FFJJE1r/uF
 9BBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C3Bnj79/MdmyOPceI8w6ogw+VOwoEwR2LfbvEH8/Jt8=;
 b=EDiGyhQUB+7lYJMbTxcI+NhK0r4x8L8kh2WVw7ZAG/n6Xq3WjUUZj+Yf06+TEGmLOn
 2UE5Mg5Pd5Cb+H5BXMoFSc+PB93K04U7oAG9WOCUSUj8LmBETscmOe3PckBbRcnWkGVp
 +4T1QM2TYfdSIy7QzX9l2DdmR5gWN7qq6zkaNjrLoEA2E19UbhWZ1VqoVqkuwYJrFZId
 C0lyTFIAZ0L2U7ldmGIwKx4eenv9Q24ZMZzfff1wqyXZauHo5CuUrEKnGuuceRvKGhRP
 tQSnca1O6n13qXYHSzoFsg9QFBiP/8eL0dCogTaJ91k+ng0nbJjvNwia6jVn1YgmU2lm
 q84Q==
X-Gm-Message-State: APjAAAUbKEGWelNYNfKSoZt73HjzMzeO2vReyRBuQClznY21P6InvTjO
 rx3jXm3RLJN86X1qSUw/RG4TPJEaKSxZfbSQISWcpU7K4uk=
X-Google-Smtp-Source: APXvYqxEG+sO1ju1+zh7t26iFYHaqIQbdb0pBFNYp8W2WOu8r2gmg1A+zmEJq4oiggzRPaPkW5vjk856OE6jCWTnw7E=
X-Received: by 2002:ac2:4c29:: with SMTP id u9mr6709818lfq.90.1572121861966;
 Sat, 26 Oct 2019 13:31:01 -0700 (PDT)
MIME-Version: 1.0
References: <20191026194522.28293-1-frank-w@public-files.de>
In-Reply-To: <20191026194522.28293-1-frank-w@public-files.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 26 Oct 2019 17:31:03 -0300
Message-ID: <CAOMZO5Bb=1CUpw__xxS2N0w+ZP0+LnBBW9+JLVr03x6TC2Z7=g@mail.gmail.com>
Subject: Re: [PATCH, RESEND] serial: 8250-mtk: Ask for IRQ-count before
 request one
To: Frank Wunderlich <frank-w@public-files.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191026_133103_960212_5CAB97FA 
X-CRM114-Status: UNSURE (   7.64  )
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Oct 26, 2019 at 4:46 PM Frank Wunderlich
<frank-w@public-files.de> wrote:
>
> at least on bananapi-r2 we have only 1 IRQ and need to
> check for IRQ-count to fix following Errors during probe:
>
> [    4.935780] mt6577-uart 11004000.serial: IRQ index 1 not found
> [    4.962589] 11002000.serial: ttyS1 at MMIO 0x11002000 (irq = 202, base_baud = 1625000) is a ST16650V2
> [    4.972127] mt6577-uart 11002000.serial: IRQ index 1 not found
> [    4.998927] 11003000.serial: ttyS2 at MMIO 0x11003000 (irq = 203, base_baud = 1625000) is a ST16650V2
> [    5.008474] mt6577-uart 11003000.serial: IRQ index 1 not found
>
> based on Patch from Anson Huang
> https://patchwork.ozlabs.org/patch/1164500/

The solution that was accepted for this case was to use
platform_get_irq_optional() instead.

You could try using platform_get_irq_optional() here as well.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
