Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B49C5AC82
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2026 09:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lEhjsMWG90vKMNIv0q/NvqRJMIZC5Z2HAc5jYXUw3Vo=; b=WTAXG4z4ukWDaiMCJnKXLRI2nZ
	ulDPNTNn2B/mh6IQyTXTyQr94LRYSpHqwbcddwKEVC42VsR2kFwAuSkPjLHVkyajVP7qj7pDPv8FU
	HeIFTUHa7Y3L+sRi8rGL/m6C/+O0cSAUDMn96rj2NH7VblENAwJ4k4M0ip0We3tL/yvsJ3/gX8XrP
	CaQi9HPf6q4Cpaqlh57Stplzmt1xbmA89D0TzqDHXRMbSeA8gRe1gvLFqhvllH667mZW0WUnUacJ3
	MEHztnCEqEQUDH2lvLBVbyLqF7dTA0Xp/lau04/y0QSohAyRHCx36mW5u6Ic0T3A93NyZ8kzJE7Fu
	5PH/HiJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtMZO-0000000BQfl-0DXA;
	Mon, 10 Aug 2026 09:45:22 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtMZL-0000000BQeq-1znx
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Aug 2026 09:45:20 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-38e88b60121so1371586a91.3
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Aug 2026 02:45:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786355118; cv=none;
        d=google.com; s=arc-20260327;
        b=XEgRKtYGe1+sVzkb42Y1J6vhe4JrbemJ7yNuz3G1teN5bdDujCKWQD6+Uqij7LDxFw
         t0y8QZXwHejehYZYVK5Km1db7vk+BqdgtFcSRNLG1Ae5RZmLtyIuLlLWkeYXE4WQV+rx
         oP8MCzHvzf217YJRwyoeveaPQbQHU/VSiV+9lUgQxy8Dcq6ZR4fyeDu1PU2/GwJSGqHB
         To9kb16HOqNVBjpoqHT7URxTQueMnWW7JTIoRncaQYMYtkV+Sz2dl3QoupQ3UPeBoMQ6
         VM5tcPussMOZNFAXtWhYg4JZQr0+87k3gMkyjZmmzgH3L8mWo26jXNQ3m9s4etD3cfPp
         wABg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lEhjsMWG90vKMNIv0q/NvqRJMIZC5Z2HAc5jYXUw3Vo=;
        fh=a0ACxKwiojgUDApYeJq2PAcWkuQ0LuyUA7hxFAX2VrA=;
        b=Q7HVNXbl3OODe5kve69A89+Hdolnyfv8T+HIfnOTpku5TpJBKkfgv9mIF0oJAd7Z2c
         g3LcjG9hnqu4apzoSABuoMo+kFoDqE6lofQ3+HiaB+Q4ik1fvgVl7NBrWy85q72RcZqS
         6JP48vK/QmL4UR5uFJ2OPMGDlP+pQkAlKbeVB2MQhFaKw71/JRYrdlWruP7G1PmTB5ej
         Jit35cQqKuo9cAUbrrktunBfcWzjREA/Q9OwG+G49rD6RPfjAxx5+7iadcUOa1rkvrX3
         NXNZ8MKgErEd5ReDEJvNwTF53NYpEwSmfNo+WzoqVv4iECm9qLfzEYFw4OOslLvZsz2n
         Az0A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786355118; x=1786959918; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lEhjsMWG90vKMNIv0q/NvqRJMIZC5Z2HAc5jYXUw3Vo=;
        b=p97jRWjCrO0CvpoP7fUZoTypY5tVMEy4cPCmq8bXxdkhmUBHbk9ceitVpvd1Nd0AIx
         2cZWgWevwCLUyCdNDRQsLkFP/eWX9/V2Iwgrnkrlo2vmTASIC0rsjMG9Gtv2um6GQ2hD
         mljF3aq6qki1EkU230+GIUuqnxppnjYi1aBlJVIv/E2vrIRTNtS58qG0Q9kDevgaMInb
         p87aSOXvQ9Aqe6M8xBe5VBLtU/3asFB/hwLOjF/uQtC7z1GWr+m53yWHZ/hyUbFTJ6Ld
         Oxr++Ex93E79lPw1GQ2dwhb/1kWm41JpgdqZzcH8mKezPu5dZ59G8YF85AQ0euKcjsme
         W/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786355118; x=1786959918;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lEhjsMWG90vKMNIv0q/NvqRJMIZC5Z2HAc5jYXUw3Vo=;
        b=QiKQBMMaQJRNVpq869ulHdSgSBcCTh26L4iK0OaTNpfs5kXW3Lp8A++kccxN529WGP
         C7M+5ohTtRwGdXZYq3ZHpB8K1+UCRiWLK6KSHEQg+I7M3sFLBlgol2CSIXvvq2fNYrtg
         m3o9rOmpz8HKkmKfowE0yZar0sSi9VyOcSXItFcY6eMyOZj9yM0H5Em/HxC3jiY5UvIw
         7A3TtMj7pVWZlwtNLVy/PJIPHnGFNj02RGt9aSPiyqIyIe5bFwL/dAcytWOX8oKcQBK9
         UZoLftDFkjeBCTiCetJCiDUEYzo2eqHP3xPEC93GacyjgzD+80bZuYXlZFhwg5d+IWww
         4sEQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr364v+4kw8+BD0akAbH7a1vO6jnPXQx+zcZKmBKrqE53qZMYe5XA/eC+YjoUFzfzapXa1hrqp4AeSYd32qfg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxqFFJR2SwYMJS8S3ahozDKqhQrEnXJbMSU5M1TqVq1K1ROq73I
	so2gcqV4/Xe5OXYbCgsa+tKlMjpxgngSzQuMv+w+y7tn9dh2vwDisAfEKzLtKBV1OulADDs7uE7
	CCOLPYikgDA4CrZZXFqwAefKInXxsCk4=
X-Gm-Gg: AR+sD12aX1KlhcU9ErtEAMulJ/HVMjmfvP+HO9VW8QYR48bQMaA7UPv9wwyG5+cD8lh
	jY+oUjzUg9Hdzz74hqR11LtoBGPIcKPu6EDunVx6exp8Fw6Z/HuJNv1vC066bMgdACBKyIJPj8m
	z5HCyz7ygg050G9K5fDaVHOyFFBsI9iCxLjqyQNPFGZPCr50xICoX9+N/o4lVSltT0q/dbtQPC8
	cIsHFxKse0jCn+0gGTdQl9wc7G8E5MC4HU20iJ4p8ROPMbKNfBI5ND/1BpqxkRq1nYG/YsBmen6
	UJkhyXz4wgz65Y8LbQZHdQrvEGdlwDhKU1SRxcoLjBdj/ffgZoybc3u+NYdZaZU/G+GLYXvepUz
	uLZZUQa9hRo4/w9XBmKJhZ7jTiYTq4uOsQA4l+IRHzXOuW+/mhquAkNvA
X-Received: by 2002:a05:6a20:4309:b0:3c4:48da:8102 with SMTP id
 adf61e73a8af0-3cbce930129mr18884836637.29.1786355118398; Mon, 10 Aug 2026
 02:45:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260807081652.38692-1-phucduc.bui@gmail.com> <20260807081652.38692-4-phucduc.bui@gmail.com>
 <1f26fc28-da13-4ca3-990f-676b53d23630@roeck-us.net> <CAABR9nFy=GD4afdDxzsbp31Sq=smGVFf+HvqsrJKh_FjqdUrJA@mail.gmail.com>
 <3a9b7b85-e6f8-429a-91df-f674479dee58@roeck-us.net>
In-Reply-To: <3a9b7b85-e6f8-429a-91df-f674479dee58@roeck-us.net>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 10 Aug 2026 16:45:07 +0700
X-Gm-Features: AUfX_mzy3FMnWBW1ZRsEZF6RiTcGKaOh9JEcD_RNAR4jnG-Nka5rge-6f-tSjWo
Message-ID: <CAABR9nFcitFyS_xZUkreHWp822iVsoEg6ONFwU9JwPaBqm2MTQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] watchdog: aspeed: Propagate errors from optional IRQ lookup
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_024519_516717_384C7F3C 
X-CRM114-Status: GOOD (  14.97  )
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

Hi Guenter,


Thank you for your feedback.

> >>> +                     return irq;
> >>>                if (irq > 0) {
> >>
> >> This if () is no longer needed.
> >>
> >
> > If we remove the if (irq > 0) check, irq can be -ENXIO and would be
> > passed to devm_request_irq().
> > I see that the irq argument of devm_request_irq() is an unsigned int.
> > Would it be safe to pass -ENXIO to it in this case?
> >
> No, sorry, I was wrong.
>

So this means there are no issues with this patch.
Patches 2 and 3 have already been applied by you.
I will temporarily resend only patch 1:
" watchdog: qcom: Propagate errors from optional IRQ lookup "

Best regards,
Phuc

