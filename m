Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2460EC5AD5A
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2026 02:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6DGwzvD9/IQFl9yYfrwzS70k4e8kTkJHKmvyNHmKPbc=; b=1W6WtVzbqKBSsxql4MvHL4U7qi
	R3TgoHQ2Y5nI9Hb1nUegY5c8MRgbdpkNFowzH9fGDyRbriOOqE5VKgMHtix733W1iVZPkA7orX4kw
	w4I5jCThgUls+AdYNVZUlimT2UonfSzcUThzrD3NOFBBqy+Bzz6yEEmpB2fllxFj864l1dvr+vikH
	rCHB0K5Udtl/SCWgOtScZHyczRVgO0Or4d2KmqILxrs8IMvWS+Ea3Y4ziFVp2HTnhhaF2MgK+UPjp
	ABLlPO9KFloJbWXzUr7hMQrdXcD4YGDfBuPpnqXD5VXsX05XOWMVy5/hb7MFdr1f0Gn72ZBTupYRD
	d8yvsfug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtFuK-0000000AvG1-15mb;
	Mon, 10 Aug 2026 02:38:32 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtFuH-0000000AvFM-407b
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Aug 2026 02:38:31 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2cca0c5799eso12632245ad.0
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Aug 2026 19:38:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786329509; cv=none;
        d=google.com; s=arc-20260327;
        b=PBRqX2G06vHHcASdeQx98VQ8MEt9ar5NTLa15DksaNBliqkf9GEHlc6c1oQTTlE3f+
         XQIzfGVDp8qA56w/QIeMjZGz9wECMgu7IXKAvjVHJ1tboyASYqBXq33E5Z1wuQHqyxJG
         1cJ0EyPVsuX5rqRjQl594VCzLMxDazlgElISVQhttMIVSoJvalI/V4biIQlMi/uggbfJ
         qUFeG23N3CXohirXcVVeMNGbwpAsH3dWGQJbkSvWFhqc2FapT6GdoojWZ0SQR0r1XF7b
         WQUos3ZlcXdCYlJYQSnGTqxlpYFOB7oHQ1asVkdZUh75gW47K/DoxQV5W9TvnEOBSD1A
         5t6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6DGwzvD9/IQFl9yYfrwzS70k4e8kTkJHKmvyNHmKPbc=;
        fh=YEoP5iboGeSh+4EEzmUtCk9SCDROhekLU+6s4JltLJE=;
        b=lPfm7IoUZD9wB8qgFxGMP9BeO9PZnC7xTioFHZv1gg3dZ0BxhgOCOWCYYlVYTzBXUz
         I+Hl541U7Caq/V1qzVVvLkkR7yNUVCJ5ReEMxr+ZNbUkMf8U0Qo0ewdF+xJKCCsLWihj
         h09QFoVrerECEuXyIbee/sFmgNOr9XKNr1dCAcEGUONuKmmWHLpENx4rG+bHER7hW2fi
         fz3fiDUYhCAJQ+tQ/LU0Dx6dMM/+o1EoMEcDUJnQuOL7ETfvnWS6D86mX0Ks01VBcj1u
         jG7m9+f8rPcd3yP2ngwIlvWNVUahz22LTci5mIgWkphfpalruHkSpXdsTAcX0bxpXq0e
         pLsA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786329509; x=1786934309; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6DGwzvD9/IQFl9yYfrwzS70k4e8kTkJHKmvyNHmKPbc=;
        b=RBkwn0Pq30OA9wFfIZa8TSbY/TDGCKdYGQS1pH8xChP5CeEqPBSv8HDO6XhSzVamMz
         rbDZZnBv9zwTeeNCH+YWWtUdr6lOiVhRS3E+5SqYAPd9CP6+OjaIsuxcRahRVlU0TsNa
         Fgb4uXgbN+72mdqJXkTPI375eYmxi/hoh1cI7fUKPcQQuCqVkiPXNEIlply/pfwrwJgd
         m71n6leYGTdYvV/kHutdPrMTUw6A42/xTP1t9XYk5AXE+mgElf3MGP6tpwVNFO9RNo+1
         E6/9wqhE38rDXlEsK8founPvO6zMlhXB4Ut2uyki3W9lhtvT0y6ZaNbCHgfGzboBGtzM
         8GmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786329509; x=1786934309;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6DGwzvD9/IQFl9yYfrwzS70k4e8kTkJHKmvyNHmKPbc=;
        b=QCr507ZSbqRIDd+V3bFjrQN///J2pJgSyrmhhJtB2WwyXCrSX/lgrqQ1yjsWd70PSA
         Vk1BTEWSJCj2d066vfP4nIXpnOO2v/YGggdyzz9vZhuKE5td7IvyfZDpdlhSCGZgxoYH
         fxVxyZPq5sg3dGbx4fiMUqU1emDbmRXtVVNmO3DyalrBbx8X7tiDFSSVZVeblz754W0l
         ClRtTB0tM1dCL/gYYeNnz6YbaMAw/d2h/dUkfomxfOjIuTUUrcuK90RE5SuOnXSZYaHw
         ++SO92KXvmExBYqCFOBj4opE/lshB5QjEFc2Z85eem5Ucgo4wg+M+l83rSTvUhTeM0CS
         gczQ==
X-Forwarded-Encrypted: i=1; AHgh+RruJM2SsfC54brwV04iicTkFx+ib3Hna2An3DiEA2NjqOySTzcKqlOaD4JOJC2R9qRzdhTM4kgC5oJZzl7kDw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/6S4sM13v5Wo7EdRhgUSvPnQwaW23bhD8LvXMMC7Hcf6tAfP3
	xKhZFuz+RHb/6XP5lmK/qh37BC9ExnbLM9HL62HyWVdfwAzPvsFBV2qHGHatdWPfvew0lShNC6E
	WCh5F034oZ4Dc+ndRwyH2V3lAQhK12cw=
X-Gm-Gg: AR+sD12qBOiQrDpyXQeXEZupS1cBHHAW46LQUFcRTntG+1g0eokCo3pg7KbgFdY139g
	ZE6QguYvlimqgIjvM5buqyaFiJzlhGVKZ8QS3boabigvt0oWwd2CGjhf89EfGk/Vd/jm7qRfB5k
	drq4CTTdv3M+u7Kj4qWxI+W+bmhHXMvF0u3nqhwpDoyyeLbsrQe6Uaooj5MLd7CdryR9pAcdn8I
	yNJjatklcsO4d57riSmGJgTPowNfhhxQXfw/CHHNJGDqMUTbWe2HLyLvCB/K4X6k9BjmWfhDMon
	+ib067NENcUQJ19/VLXnv5Re5Z/weOJeVMn+9p4BPEqmYhSK8IfQ/NtKDZ4T55OACF5nfdBqaJT
	/hKkS/D2jEvuuao+Zg56T7AkMfteX0r6NhVUMVGu7tA25LySGFuHsjNL8
X-Received: by 2002:a17:902:d58e:b0:2bf:27b2:4b80 with SMTP id
 d9443c01a7336-2d2a8d1d97dmr211697695ad.14.1786329508803; Sun, 09 Aug 2026
 19:38:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260807081652.38692-1-phucduc.bui@gmail.com> <20260807081652.38692-4-phucduc.bui@gmail.com>
 <1f26fc28-da13-4ca3-990f-676b53d23630@roeck-us.net>
In-Reply-To: <1f26fc28-da13-4ca3-990f-676b53d23630@roeck-us.net>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 10 Aug 2026 09:38:17 +0700
X-Gm-Features: AUfX_myaPy--xKkkil0mfKwIudM0kq93jPRIr1aFF5iubyuHeV4xAEUrCHwB2E0
Message-ID: <CAABR9nFy=GD4afdDxzsbp31Sq=smGVFf+HvqsrJKh_FjqdUrJA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260809_193829_989086_50BAD3E1 
X-CRM114-Status: GOOD (  10.86  )
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

Thank you for your review.

> > +             if (irq < 0 && irq != -ENXIO)
> > +                     return irq;
> >               if (irq > 0) {
>
> This if () is no longer needed.
>

If we remove the if (irq > 0) check, irq can be -ENXIO and would be
passed to devm_request_irq().
I see that the irq argument of devm_request_irq() is an unsigned int.
Would it be safe to pass -ENXIO to it in this case?

Best regards,
Phuc

