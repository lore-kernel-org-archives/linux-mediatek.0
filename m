Return-Path: <SRS0=puoQ=LF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B6CAC48BD1
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 21:50:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31F24613D0
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 21:50:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31F24613D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9mchUnYHv1iyf+Lhyix746N+PJaVZGVeIKl+pFVKoH0=; b=Bnqz36dJpbDhxZ
	eGe80m4rc9baTVFxF9z2va4iMQcfqLW5ekLRQot44o9ndCKnFl/FubOBv0CRhig7IHGD++nBezDZe
	WME1SF/uY6Nn3geUSV00EpvG+OFW1GsHwo3bIQ8LXKG/n91gftZUhs750bVfX4GF1qTLniH6qSlQx
	NVge4SWB0kOvaxHqOEPgNY0CgR9UsLNJ8YGkG3noUgo+663rATntiCQ+LkbC0griA7ZaYbdwAAKCj
	mEghf3EKAgtekyKA4K/hbz0Z3elxSBt3bv6Xj9ETH6isvg7PBqXvt7DsOSqdFHO40mcml/Q8LFHA3
	p+MAjjrDr+OXPFpAOIBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrp2x-007FA1-Fl; Fri, 11 Jun 2021 21:50:35 +0000
Received: from mail-wm1-f44.google.com ([209.85.128.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrp2v-007F9I-5p; Fri, 11 Jun 2021 21:50:34 +0000
Received: by mail-wm1-f44.google.com with SMTP id
 k5-20020a05600c1c85b02901affeec3ef8so9466445wms.0; 
 Fri, 11 Jun 2021 14:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=FhdlQOs8218L6C1WKAPZ8NIT7azafYcWg3ypPA+F0qk=;
 b=blFJgmXvns61TkW3h1lP7L5PCLy0nmd1IjK+a7jueM8N+Ii082jg9EkiI1p3v2ztOO
 rmbCvnGOnemuoByjc6mo+BWzQWqobs9IIULvNLDq0059ABYoh2O+8kHj1iJ7btlHNFks
 mgb1VAwHdLOSoehbdLad0x5OCRjORBeSEfXjq8STvn8sHW/Kk1u9vWVCM09DjNikVq06
 uJgOAS6m6NCiKa5LzwZAF56nTr54WG7eHfjTrCQT598fxvn6xAqJz45+rape9dSdSBhQ
 m0hAVMWUV86JJ9GDyGXHnCz+NQuZXQc2mgtqiAOiT6gT4B/UPhbtAD1Muy+vESzosbRR
 /qyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=FhdlQOs8218L6C1WKAPZ8NIT7azafYcWg3ypPA+F0qk=;
 b=fuXrbWr2KWbR0kp8YM7RsiKs5Bq9Y9N4eLy4eAEsfYneu3Yrz4FBTuOTw8xSoY4Js8
 y/bZHLIdMV5g2kP07Ft5kJ/FARSo/VskfLupyDQ+HJyXwOJtNeP68ueYZDigs+elQot0
 Fz9lYw7SncsknRULBRZNfPkD8IJ9gfdCauMmXAKlxtSscXvWlDr7odVgcW+bHE6Nw1cF
 kstqrnP28qgaleg4PFmbrUB881CBxNdCLE48ilOrI7oGwWdUYy6Y7dCmmsXy+8inVGrE
 akSUQs1W1csSP352dclCF+Qqldu1BCIgrpCWgw8ZS8Mv0u0QdOKjmrRLV3LuPMDpuE3c
 iB2g==
X-Gm-Message-State: AOAM532ZMA20dw+/a7847m6zCg8fQS8QAtdISUTQMS7/ymM/T6rBTPTF
 tPeL+BR/dKzHb3+LrlNA1zE=
X-Google-Smtp-Source: ABdhPJwaF2nqG3494Aa1pe/CMXELzEstWNyCEYwUeXHYt9hs9E4pjJMD8GhTlxkMHwkzjG0tzWl+Bw==
X-Received: by 2002:a1c:b783:: with SMTP id
 h125mr22400117wmf.182.1623448171193; 
 Fri, 11 Jun 2021 14:49:31 -0700 (PDT)
Received: from pevik (gw.ms-free.net. [95.85.240.250])
 by smtp.gmail.com with ESMTPSA id 89sm8564612wrq.14.2021.06.11.14.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 14:49:30 -0700 (PDT)
Date: Fri, 11 Jun 2021 23:48:56 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org, Collabora Kernel ML <kernel@collabora.com>,
 linux-mediatek@lists.infradead.org, drinkcat@chromium.org,
 hsinyi@chromium.org, Arnd Bergmann <arnd@arndb.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Guido =?iso-8859-2?Q?G=FCnther?= <agx@sigxcpu.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Max Krummenacher <max.oss.09@gmail.com>,
 Michael Walle <michael@walle.cc>, Nishanth Menon <nm@ti.com>,
 Shawn Guo <shawnguo@kernel.org>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Luo Longjun <luolongjun@huawei.com>
Subject: Re: [PATCH] arm64: defconfig: Do not override the MTK_PMIC_WRAP symbol
Message-ID: <YMPaSD45DOFMsNFW@pevik>
References: <20210423075201.2616023-1-enric.balletbo@collabora.com>
 <cb9c85d5-3467-c235-93cd-be23fb6e0a03@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cb9c85d5-3467-c235-93cd-be23fb6e0a03@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_145033_242151_B5A8E779 
X-CRM114-Status: GOOD (  15.23  )
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi all,

> On 23/04/2021 09:52, Enric Balletbo i Serra wrote:
> > Commit 'fbbe38309d56 ("arm64: defconfig: Allow mt8173-based boards to boot
> > from usb")' added the MTK_PMIC_WRAP config built-in. It needs to be
> > built-in in order to be able to boot from USB or the MMC without needing
> > a ramdisk, but that symbol was already defined as a module so now we are
> > getting the following warning:

> >   arch/arm64/configs/defconfig:996:warning: override: reassigning to symbol MTK_PMIC_WRAP

> > Remove the MTK_PMIC_WRAP=m from the defconfig to remove the error.

> > Fixes: fbbe38309d56 ("arm64: defconfig: Allow mt8173-based boards to boot from usb")
> > Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

> Applied to v5.13-next/defconfig
I'm sorry, please ignore my useless Reviewed-by: tag.

I was searching in arm64 git [1] and overlooked the date.
I see it was merged into Matthias' git tree [2] month ago.

Kind regards,
Petr

[1] https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?h=v5.13-next-defconfig&id=f0e70d4946332c681ceaba940652f30c7c33473d

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
