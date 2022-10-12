Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD493C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Oct 2022 18:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a1QuByy3mBbuxnxi+ZelOO8l1V6nIE6lgljg4uEZ8zc=; b=yo6TOIHG080KJ9OnkihcHPXn7z
	YPw+MmwvcaH9sNqpOhqq+OKRRfGpSFCGbIJGr1HWKVdNVUQGwtzd6IgdXeOyPRFLd8uqkReV0nz23
	BneVNoL2NGKZAdFn9dee9GkcR758lSoZRFQr0bMq5llByeMCzGqrHyAjG7L/i7ubInJ0BCt6F6kOR
	aqvEt4uPiSzeMu5AktCthIG6jaHQ7blL/GoWBblBXF/QSqGkDHTZiIaHqsVxrgkRJdhN7Gvz/YmGN
	AWnm4S99uV8bYYnOc95CaSMzklNCO2vu25OKjPgZZUWg7b5FsDlGZr2JQGBA3nVw+WHyPUhsh7L/f
	JoRgItNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oigj9-0090wc-Hy; Wed, 12 Oct 2022 18:45:11 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oigj5-0090wE-3a; Wed, 12 Oct 2022 18:45:08 +0000
Received: by mail-pl1-x62f.google.com with SMTP id z20so17037232plb.10;
        Wed, 12 Oct 2022 11:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a1QuByy3mBbuxnxi+ZelOO8l1V6nIE6lgljg4uEZ8zc=;
        b=mmW0qFQW8rEUgJkkXny1n/W8R9zqhrMWTMwaQYsSSo0pr1O5cxowLAUQAnr/mrMP3E
         vAWhOdcUf4J8qEqb8tsRloChymkmDwt9jm89mb4vFMsOa5QHJnU5SjCqYdYV+mAYyIIg
         NuJEqOpi1QK5uTsYRjTxrTrq7/S+3NHyHDHT2YtOFPD7EAGzAaUyPG9/osiANFtNAhMW
         S047/1HNZyZ7fLZZ+gmjR4J1ScYA11lNAJDLIcS2Qq08hZjeHszk1NTo5tem45GhFp4Q
         feZV/o4ye0v4KnaKCFSzNZrzWpzHw3klaLDbr7882bgcSUdRUSPr3J6/706Ut0J6UfyE
         V9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1QuByy3mBbuxnxi+ZelOO8l1V6nIE6lgljg4uEZ8zc=;
        b=noC6AjPJY7pkADm8q51jKPF//Nxd08FZNasvoxNccVvPmhD+23KPMiQT9H6XtRNAPw
         uGYk7JNVpWwkNZ9GbobdK0TMAMIJbmw5nb2ITKqNv0TCw0ml8GrBdpgm8nENe5ejo6YS
         9bR0F+DRHaMlIjafJ9t+lHN7MmbcDgN/v24rzn5oDGK+cu5QbR5GYoOy3LX/2DXpo7Ke
         PmZ0r/jDwE9ZWJrZwO9yDm62mWv6o+0YvwXripfFB3d9jP0Kko4W7Rr/MzZjLRjaH42j
         /is/+RwPldZPdKhs0DzdNGhbrLeGFBGyf3crhvj1rxFQZZHGk09wy9ZjS5t4ORm/B4lr
         HxSQ==
X-Gm-Message-State: ACrzQf0/THTIzXB2a4L/pE76/M2MQw/aQsTewcS9dbM7NmGYT8fDJepk
	ijK6yhRjTKY5ngF7a0SYEpU=
X-Google-Smtp-Source: AMsMyM7JJXMal6i4KDxQk5AXM8OrkXhvd2rY0XhwetB/JNmiYl+IqjfWrjSPFyqe60y/8mYUuLz7fQ==
X-Received: by 2002:a17:902:d2cf:b0:17f:7b65:862f with SMTP id n15-20020a170902d2cf00b0017f7b65862fmr30482331plc.168.1665600305991;
        Wed, 12 Oct 2022 11:45:05 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d4c1:686c:5489:5df9])
        by smtp.gmail.com with ESMTPSA id m14-20020a17090a668e00b0020aedddd3cesm1765941pjj.5.2022.10.12.11.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 11:45:05 -0700 (PDT)
Date: Wed, 12 Oct 2022 11:45:02 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 4/7] gpiolib: of: add a quirk for reset line for Marvell
 NFC controller
Message-ID: <Y0cLLraNFVXtD2/k@google.com>
References: <20221011-gpiolib-quirks-v1-0-e01d9d3e7b29@gmail.com>
 <20221011-gpiolib-quirks-v1-4-e01d9d3e7b29@gmail.com>
 <Y0aW7vDxfNa/8bAk@maple.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0aW7vDxfNa/8bAk@maple.lan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_114507_207619_287A3AC4 
X-CRM114-Status: GOOD (  17.40  )
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

On Wed, Oct 12, 2022 at 11:29:02AM +0100, Daniel Thompson wrote:
> On Tue, Oct 11, 2022 at 03:19:32PM -0700, Dmitry Torokhov wrote:
> > The controller is using non-standard "reset-n-io" name for its reset
> > gpio property, whereas gpiod API expects "<name>-gpios". Add a quirk
> > so that gpiod API will still work on unmodified DTSes.
> >
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> How/when has/will the DT bindings documentation for this hardware be
> updated to describe the new bindings?
> 
> Delivering the quirks ahead of driver updates is great for avoiding
> merge conflicts but it also conceals the rename from reviewers so
> risks neglecting to update the bindings.

I was planning on sending binding updates once driver patches land.

> 
> Other than that:
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

Thank you for your reviews!

-- 
Dmitry

