Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD5FC25B6B
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Oct 2023 22:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4SxxJeIJ67UJRuWmX2lMM5UOUmBZb18yNZTZPQByIAc=; b=ANgCtjKHI+PHY1mgBIN3Zth62p
	ZIvlGLsE+J9fXwHtwc5HbtLQbyV/gESg/wFKacQLsLFueCe2xS1WyCCb4qW/skWa76/f08YV9pg/K
	iw92WV88tJbYoPa3gv7xNDRNtRYFpElXxGjoYWOMvvKuTYsVfOaS2doaTQjWDVZYTqve0hPDT69eg
	Wvv+XxWLhrmMfoIMr2yW97QNT4UFC5YLrbiuAP8Uoxi5llcWvJOc+Ht9C1UdFsZ600VWWcy1BgzPA
	PF5Hx5C0Uw1AGFWYHgxHFFCRL6WWhLWkleO1Pw6sC0dQkdn1a0ob+b4qnzAcIuGAmK89mLnpw42Zi
	dwOs2eBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw8ug-00FGSy-1n;
	Thu, 26 Oct 2023 22:33:14 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw8ud-00FGRL-0b;
	Thu, 26 Oct 2023 22:33:12 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-508126afc88so2178448e87.1;
        Thu, 26 Oct 2023 15:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698359587; x=1698964387; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4SxxJeIJ67UJRuWmX2lMM5UOUmBZb18yNZTZPQByIAc=;
        b=lAwMgoeoogNGew4kVLaE8qpIqo827f1N1mHAatu2h0A0S9AAA1bere1OpYktG+2ae2
         HXNPt9+NXtH4FfBt5HUzZQ5xm2S3i25UUqYXPDeg0ttO4N1WwmgaIM1M0nRHtj5BcOUM
         H+B2+avtLm+65rRk+KmhKHnPxlIKCFOTokhVbYCqZRpNnXN4UyTcFbyNn1W49+y+AG6J
         1edbwPf1r4clKLnJ1fNsK73UzUZ8TXRQMr4vpantOxVPES97eb9E4JXYZtiQGqxeth+z
         aAcVRCp80rVh/TzJ99mjs8Z0eOd7l7x/Rty2OmPNAt4dfI71yC9MvaxrM4mg0cSao53m
         ovgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698359587; x=1698964387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4SxxJeIJ67UJRuWmX2lMM5UOUmBZb18yNZTZPQByIAc=;
        b=AC+vGblb2tNyQmC08Dv8JkrGe9RE65OMjUh9R/a1SHpLB9wfsOpI/foin4uMOlhVGq
         Q6nBvVeHYLB9600BekDb9bcyzpTnA1VyhTV8VTXPXNvN995UYAs8hjKTQMB5R9s6NhvY
         6USGNzbVHFZwRm4OhsGSIjY6m46MVYPWJ6CceaVsBhTDcl+2rBOyMVrlcTdqxTuovDym
         E0VYEaV7SSqJChu/B+KsWqDbz4Q0ucg5bQldPK5jEp1nOrGpWiB4fh3zaE6lAk+NBPho
         1T53dyc1m8qBFM9aUyjDlyJzDQGpYGovNqQw9RvPMdLyTdYPELHvahvX7/5T2tU3Gt/u
         iCgA==
X-Gm-Message-State: AOJu0YyCPMqtHRMDmdJESYLLW7dkJkdH3gvolR/rKLBk28Nl8AbpfPnK
	6kSM0fFCOql5dlk2WQk/oBg=
X-Google-Smtp-Source: AGHT+IHiJGPvEvNoYxUZFXdVNhDBLZImmPXHiZgnA1Uzd3w0qnIN0A97ELhuaXAvDjdWP1gQ5bRUUw==
X-Received: by 2002:ac2:4a64:0:b0:4ff:7004:545e with SMTP id q4-20020ac24a64000000b004ff7004545emr494644lfp.4.1698359586744;
        Thu, 26 Oct 2023 15:33:06 -0700 (PDT)
Received: from skbuf ([188.26.57.160])
        by smtp.gmail.com with ESMTPSA id f24-20020a1c6a18000000b004063977eccesm3534864wmc.42.2023.10.26.15.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 15:33:05 -0700 (PDT)
Date: Fri, 27 Oct 2023 01:33:02 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Justin Stitt <justinstitt@google.com>
Cc: GR-Linux-NIC-Dev@marvell.com, UNGLinuxDriver@microchip.com,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org, oss-drivers@corigine.com,
	linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH next v2 2/3] checkpatch: add ethtool_sprintf rules
Message-ID: <20231026223302.4gjjeh7inn3a3llq@skbuf>
References: <20231026-ethtool_puts_impl-v2-0-0d67cbdd0538@google.com>
 <20231026-ethtool_puts_impl-v2-2-0d67cbdd0538@google.com>
 <20231026221206.52oge3a5w4uxkkd5@skbuf>
 <CAFhGd8r-u193pBk2+WWF+sHWEo5ixxEiT=fcSYiuy5W+aWDsbg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFhGd8r-u193pBk2+WWF+sHWEo5ixxEiT=fcSYiuy5W+aWDsbg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_153311_226577_5B5A8D72 
X-CRM114-Status: GOOD (  10.92  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Oct 26, 2023 at 03:24:54PM -0700, Justin Stitt wrote:
> There was some discussion here [1] but AFAICT I need to use EMACS
> or configure my vim in a very particular way to get the same formatting
> 
> But yeah, look around line 7000 -- lots of this pattern matching code is
> pretty hard to read. Not sure there's much to be done as far as readability
> is concerned.
> 
> [1]: https://lore.kernel.org/all/137a309b313cc8a295f3affc704f0da049f233aa.camel@perches.com/

Hard to read because of pattern matching is one thing, but your
indentation is unlike anything else in this file. There are inner curly
brackets which are less indented than the outer curly brackets. I cannot
read/review this, sorry, I hope somebody else can.

