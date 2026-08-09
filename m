Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80712C5AD4E
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2026 15:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f2Ph1N2YXDcF/EsJKreKtP+YQA5yS18iu0pKlYJPT7E=; b=ZZN6SDOuIYxMj9Kxzsr2kV8LWp
	HjbTMTJAruZuwQfKNu894kCZvq24gTCP2L2NaUiRPi8f8H7Q+OMPHOBqo1nnjaIqMoEZDh6m0wcvn
	mpG3q95Iar+7iAlkQEnYdBDUW+wd6CSWcCbzvX10an9qxcd3b11cuu6zIPYU5Dj6uwIcp8hQgueVM
	1x3pyNPpvNXaQN+1gMVFuxCqi42sILSeAgeScyrxuEOBMCX95BhCADXxWveufDV9Nw0NJFvixzCks
	PsVN3bBUdp8JRNFOce6iNht/Wz+Wtih0ylOCakXNaZkhsNN5e7oJaWZ45CDbx9u7yXD8jl6p9uklv
	0cmL/bGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt533-0000000AQ46-2kQZ;
	Sun, 09 Aug 2026 15:02:49 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt531-0000000AQ33-09NN
	for linux-mediatek@lists.infradead.org;
	Sun, 09 Aug 2026 15:02:48 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2cca0c5799eso9528145ad.0
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Aug 2026 08:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786287766; x=1786892566; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f2Ph1N2YXDcF/EsJKreKtP+YQA5yS18iu0pKlYJPT7E=;
        b=UqrKWrNSTCx5h/QsnmeEZoinFqKt7lGlrb2wGLYMW2IV76/mdxlVUnk0+jbrh93SON
         UjVuRX39wHwKtqkxyL7C23WAEQYvmejzkQ6QFCW8CBh9DzzUp/AG04hszJX5RNpTaGUv
         XePuiPUqduylky3rO5tO7Dfxu/RklhsU7nPRpPaNAT3wl15ckkahIatgl4FHxdFU5fg8
         GD6jQwbsieTqlRw7AHJ6fTZ7WYvLnk6U0nbEeBFAh65GHkLDQx13dW+wZVLblLxkvL+t
         f1wbucCroOh4VCQ7ih0trP4sSHjYb84/sbw2IGMYkx+TtpCevC2aq3SsimHCi3rWJ9hf
         mmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786287766; x=1786892566;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f2Ph1N2YXDcF/EsJKreKtP+YQA5yS18iu0pKlYJPT7E=;
        b=OHQxM56B6nswyUSoZhhVmJ5fabiG3JHHU4Z837sw/v/iraJnQQHltCOr2OYISi6oyM
         JHwKu3TGYk80M102G2EL76JfEoYY2W1DFxYZjMS+JUJeuun8+C5cyfnRh/yF8eLZ8fCp
         rQ+dOTHmUIe4hAiKniHQJMbVEgEL6uvTsmO66owLOGM8GYX7MMbaF93dnvU0SWo0yry7
         Pxj9G0XEY8W2+07ouTCSdI4g0woYPb81bejtaMQR+I1vuYoqp5tK/ZV5otLuPdfWf7kb
         gRT157BRODCqMWOFdSZK7ATDftC7WV1vN6Ha083Ul87JanyqZnM610gvS52Qsp+quJlR
         iWkg==
X-Forwarded-Encrypted: i=1; AHgh+Ro1Fon2u/vzVLjdkKUgphIhbhOPsR0OF0r57ezh3jnURC12guyrpF+YYh0FR7CpEVJn7JDOlWU2rhCzuSkxwQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzao6eVzGbBuyvss46PEGkNPtRNkFpiOokIgTWKI82FEAV5QNft
	nx/NT49k5OnsAZVV/z8MD4sRqseZntLGMrY0H6l9XnLwUky2tGE8+C+6
X-Gm-Gg: AR+sD11VlmzYfv+TX4SJEspOjzdzG8xU8e/zotPcqo1MLXd6J2VyOcOyrMvE0Y81lQ4
	aL9mATFX7qQ3QnIcmdScGVyiNfOVBx4/N3sCTte+aHdcO3xLazHsqNvPot68ipToUVzoRKtnsgc
	u6PebknBaI2etaWeGFKJzus1zChOJXOFiww0w+dfhf/92bjBHGp+DFVkiuVrzaatwWZ2IRJlG17
	57IH6Kvc8wCzlOOrKOVe6bvT6+hA7B1G3MnApzY03gYmGZt+8iru2eEIr1QHTnbBjdgo6Bj4Fmk
	U5/PyUXl9cvSytAtbDmP5DkocUKigr1PVs3pJr+2z3X/2EBnKXpcZobUMkutZ9unhifKOb/GWau
	47ofCx+DN7Hz4ZrVsmX/3R4/UWfCHnUJeBXUSoFVIc0xI1tYwhx6NwBWj7pqKKTT9lSPm7absgL
	z496z9IUSOWwPqclAbGZSeWCICE6VPhUQ837iGPZdojHYHl9hrlj73qi6kkxfJibX7tCALPuz0r
	/Pbdlla3SMQ
X-Received: by 2002:a17:90b:258f:b0:38e:c232:9d3f with SMTP id 98e67ed59e1d1-39282247ee9mr14215543a91.5.1786287766154;
        Sun, 09 Aug 2026 08:02:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b41d9sm25594852c88.5.2026.08.09.08.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 08:02:45 -0700 (PDT)
Date: Sun, 9 Aug 2026 08:02:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: phucduc.bui@gmail.com
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] watchdog: mediatek: Propagate errors from optional
 IRQ lookup
Message-ID: <4a875307-19ea-486c-923d-78a362651f60@roeck-us.net>
References: <20260807081652.38692-1-phucduc.bui@gmail.com>
 <20260807081652.38692-2-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807081652.38692-2-phucduc.bui@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_080247_076607_122E7A88 
X-CRM114-Status: UNSURE (   9.89  )
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

On Fri, Aug 07, 2026 at 03:16:50PM +0700, phucduc.bui@gmail.com wrote:
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

