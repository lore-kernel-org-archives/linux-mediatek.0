Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF87C5AC80
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2026 15:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E/WGUkXoZP+UEyJ866t/Krhk68GDNZkyepthpjmm2Cs=; b=NxfdiD6CIPk73U+am284QZ7D3E
	7AOhVMFtb4NzCFlyie0DBAAKM4eTfu7WGiP0r8VpOn6snoHPxafcAWenVS8uXAh6grKhGu3k6AH7J
	G/BTtghOS7HnEIO9yLL1wWvpcb4e/KRWMdvbqv87Ws7Bb+gUDPsUvJTdQcxQF/eF0nrazDlZzFls0
	qh+bzICTh4fDS0thk5sS+aKalDPumeYd+dsOk70y5SiVZYLgCbEPnVzDDtS0nynZUh+b4xMkRlpbD
	uyWDny0ihV+dC+cQUVhK4B0pRaZXLuZhxfc1aec7hu5oBDEeFP1alFfQ4yyMtzrWWNHbzIamfgw5P
	8bnknCpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt541-0000000AQBD-45M9;
	Sun, 09 Aug 2026 15:03:49 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt540-0000000AQA4-19xR
	for linux-mediatek@lists.infradead.org;
	Sun, 09 Aug 2026 15:03:49 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-38f620399a0so900568a91.2
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Aug 2026 08:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786287827; x=1786892627; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E/WGUkXoZP+UEyJ866t/Krhk68GDNZkyepthpjmm2Cs=;
        b=sB2nJb/g1TZF9G/CzUWq4a9S9LJIqfRF5mjoEj1aepefCMIWcCYjg3PVmc6MIeG6K9
         SnJ2yyuBlw+hu5qIzd6T++xhkngU0D+3GrbvLOkai8hm0A6a8QXpxnhxX7YSrUp4HC9/
         KFvkXb4SmsoyPC0TYd9ZLNd5+aIcNkPPN1juz5nWCaQxv2JcYO7qkw/0iL/ItsIM/Nyh
         L5eickqjBmCYSS6c7T5CG4xVy11/BY7I51Ypn9asyaHUyqdvGLYNMDJRqQaCX8a2Rwiu
         6Yao9nGlReu5TBr1MXXAD+J5hNw0Dm3LuIv0OWmh7xyCxgHyk34SeG34yzaZkRJkLRHQ
         GYpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786287827; x=1786892627;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E/WGUkXoZP+UEyJ866t/Krhk68GDNZkyepthpjmm2Cs=;
        b=XXazfqWYQYUROw20HSjhRJDAj6xH/Y8Px1QT5nl2sPX0nyLo0mX10JAWbc8fnAhiUb
         lYIahqAtegj5ToNN90juAz0Eeu78mRgkBYudcX0z2hMNASPR7e9yg1JGE0M8XmsTeWeR
         2BhERJI+sIBw7xKXd3M09ZWFISuzUcuNRjpTLzw8S5UFFn5o5Qh6i00+JReu05LItrsK
         BlMjhof97QWCATDeRLuRBEQwOQQ9DDT4PM2rwajB5wgiCLX06fUULH64oGM2W/eQWV7+
         dSvWYFqBH5Y7UfiQQ/C9AZkF58houkJZ65HEo60OsQDiAm1Ujm0tVq9n9l73UvDl8NqA
         ipNg==
X-Forwarded-Encrypted: i=1; AHgh+RpXYy8+rFFmWFklyuIawCMBRVZOxqjY2mPzOEYVXgfqEBv7JA5poId2TjlkjDqhPkVfNy7+FnJGqJ3xJvN4bw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmH7xLyVr2/mX6p6Jht13NaGTOPNfsPLcpel95qIHgOZX2wIji
	gO4+yyC/m5GlO+nzD0PdkhdrkOxLh3+yRThdMt+DaGw/h0p4Cp0Br8vd
X-Gm-Gg: AR+sD10LYMyCxM9JAYTdAOvTREjIdXCm2yBLvg+HjCYzxtl1r9jp9CqN2fDyU9R+SJ2
	tzqTWS2IGpDeLmNPYLMh8T5Jh0oUTtTdlMUbeVYFqLkG8w29Ye5ALuUh5L96UQqCVxd+IY3rwaE
	gIRaxgYoRJmJ2d8TINhBkr4Tgs4xMmm6SuM2wMoL6nb/5F3yU2FO24I0f3ohqE92SMvEndVJNCC
	Oxw9MY85iFJ4NIO2BNjm5QUPDLs0XhD1TGYP8wHeYCR3D1zHGIMEkmk1AhjI+qth2ewyz08nTUv
	DYPh+sM77OFfdWxrT4yJyKLqa3ebQXgzsXIsHzDCAXsPZvsqadjyYIXQrIcFLf5rHUEeNvmlZ0X
	u8kNjoAcdXNeieBaAd2bBdWHEeIE2CUJV5ztBA9H/KTAfnlLOO4SfQWAa9oPvgkhsGXUEC7d80m
	2dT1XHPrJAF1y23gRfeSyAWsVjwl6FNn4QYGxDwxC9y0JKKhwS0ZeMhQS9n+RaSOEGW6fiE98UU
	HO2w//O34wL
X-Received: by 2002:a17:90b:528c:b0:380:9f17:6df3 with SMTP id 98e67ed59e1d1-3903c5448dcmr37987775a91.4.1786287827273;
        Sun, 09 Aug 2026 08:03:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14101a5ee91sm26113119c88.11.2026.08.09.08.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 08:03:46 -0700 (PDT)
Date: Sun, 9 Aug 2026 08:03:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: phucduc.bui@gmail.com
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/4] watchdog: dw_wdt: Propagate errors from optional IRQ
 lookup
Message-ID: <fe5952db-09b0-4e20-ade8-fb9d28463440@roeck-us.net>
References: <20260807081652.38692-1-phucduc.bui@gmail.com>
 <20260807081652.38692-3-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807081652.38692-3-phucduc.bui@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_080348_311906_77635D3C 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
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

On Fri, Aug 07, 2026 at 03:16:51PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no IRQ is available, while other errors should be propagated.
> 
> Instead of only checking for -EPROBE_DEFER, propagate all error codes
> returned by platform_get_irq_optional() other than -ENXIO, so that
> failures are properly reported to the caller.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Applied.

Thanks,
Guenter

