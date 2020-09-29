Return-Path: <SRS0=Ekst=DG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF80C4727D
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 13:32:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 160922075A
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 13:32:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TbB4vsOJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RBYVwF6a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 160922075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zXQDkhGK2lS2AgDWDXno46zBhAWc1MWTq2n/445BVRs=; b=TbB4vsOJQsZ4ymlQPiIPulfpQ
	dr0QKEDzJYAMraJnA3legGsguMCwTb0/1UJP/QooXWT0D4s2CI9AiH0mUVYnvkmhyL2jwbKPtT5Uo
	0Zf6r5kCVoLLitRyv6lzHsA/I3a+XgWB1R5otk/DLwTDVl+ChNQbsrp77am6Ec6ON6msOTm1eY8nL
	cyQJ7lun6jcVpca5s23JNmgF0NxEOHxIZ/y9f4ZW+A4dQ0KNeUqk3KUkmwpahKNYV8kVelV39tG9Y
	km3V7cW+dTDFNLu04RCh8aUEXg/WpuNwCrmbdn2UcTgliLtAd14ZGOc1opeeNRalxl8yhteQrMIHw
	SqCcHOItw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNFjw-0001Qk-44; Tue, 29 Sep 2020 13:32:20 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNFjt-0001Pm-Fw
 for linux-mediatek@lists.infradead.org; Tue, 29 Sep 2020 13:32:18 +0000
Received: by mail-lf1-x144.google.com with SMTP id y2so5489870lfy.10
 for <linux-mediatek@lists.infradead.org>; Tue, 29 Sep 2020 06:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QiP2xLvE7su3A/3FbohxFPRtFwP7RAJmpP6Gapqry4I=;
 b=RBYVwF6a/VEJ2emfv0iKSm7f03uWBll6TI/Ihmggul87n6xJXwZu0n25FdDz6QgJcz
 BdJzD78O/nSe3aEKvFAv9aDtxHulrnUh4tx+o7zrlORi4FDh2Uvj4kP4oq2aYkGVIXmn
 7W1AF+8lTv09LNYvpoStdzCVsF3Qwjd5Il+4zRmHWAHSI3LNtiyK/DUttJ3Rp225401b
 9Sf0HAHsObntboFoCKqQlkw3oiowAFbwbEI9qKtf2D2Ol11N/TpjXu+o2bDSquAPLPq8
 Up2XdmkjZyKTqYeagrotyOF15pqeKXcLoc2P7gyx7VSa2kG4TLD1FsdO+eu3b4BVf/gK
 ktzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QiP2xLvE7su3A/3FbohxFPRtFwP7RAJmpP6Gapqry4I=;
 b=NZ2u4uE4OPivuuHFD46njq4lS6Lg2hcaOGkyNHhwFaeVCWe5z8f0PLhjHj4Almac4I
 liS0NJR5QcCOsViKnj70ACblqVysr3ofulyePR00VT9UUQudsdsZsaEyLntI5ENueI16
 NwOlbRzPHP3Qfb45WDFbk27s2CyhfpYSEFzxlksyKtioBe+TywrO/bLC/5b8Ggjs+Rdn
 hfs0CVPBo1NAbkoXgH70P8lWlyiiy1lxNLlS2oSKryI9VHRtN8iWhbqKQvETTMF/X/NA
 rhoxOQbY6JyJaouLAdv5qtbVkElEretKz2xJ7oudrepZRSDlhJPMgLIFwFdH7ej5wybI
 n6jw==
X-Gm-Message-State: AOAM530KLT42OrBnrUKIgLFMWu5Lwh/HBimkhyMShiWmupi8JImhcyQd
 7bmQwtJxF0/+eBFYKwpP808y2hsC5oMZ8SOmZCUG4A==
X-Google-Smtp-Source: ABdhPJxV6tzl4CoUKZUPVH5Q+lX2c9SMwKjF0vOjrfiQ6kGvPMd7WkrS3uyRYrORNbOEQpj+B7cXluO4Pny91ZJTCI8=
X-Received: by 2002:a19:1c8:: with SMTP id 191mr1146645lfb.585.1601386336170; 
 Tue, 29 Sep 2020 06:32:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200922164159.120920-1-gch981213@gmail.com>
In-Reply-To: <20200922164159.120920-1-gch981213@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Sep 2020 15:32:05 +0200
Message-ID: <CACRpkdbL+d5cwNAk9YA8oMN27b9dzH3tkReh3yiuBmPeAJu3-w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: mt7622: add antsel pins/groups
To: Chuanhong Guo <gch981213@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_093217_571076_1FEC2E0F 
X-CRM114-Status: UNSURE (   8.47  )
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
Cc: Sean Wang <sean.wang@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Sep 22, 2020 at 6:42 PM Chuanhong Guo <gch981213@gmail.com> wrote:

> These pins are named ANTSEL[0~29] in datasheet and are used by wmac for
> various functions.
>
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>

Not much replies from the MTK maintainers recently, so patch
applied.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
