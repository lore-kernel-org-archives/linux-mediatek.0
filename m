Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1EA8C433EB
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 08:18:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AD9220759
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 08:18:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cpuCeYVJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AD9220759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9C2eVNdqRq+WGYIyfwcoFENhTreOC8zIoClgOwRN0Uc=; b=cpuCeYVJMzsE+wetsv8dlW1gy
	cSPFcm26+eCYp4nba2SzAeZmi0TZ2bkW4SP//cmLgbz9SadUwgaQDXmyULom/yFoUmrXus0IY8sZR
	fdKhbDKhSmBpq//KVKJKKnFp8AVn1ZwzEQMFTzv33o1vE9cv+gpZL1hS8Befu/J0PFiZQs5Moqg3X
	c1q345IGzAmoXWtQIGDBIBn8NQh6/tZJgG3HA5sGlj3l24bzvkaMd9Zn0YMAmsJjgExiW/u/N0959
	l6OpV9fmLhKiwHCYfZlEVokT8s8zo3h63wc35bQ/hS1FmlLSVu9lquNkehsvKEPZ4UH5pdtgwHY9G
	q5aWeLYlA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzyKj-0003Uj-I4; Mon, 27 Jul 2020 08:18:05 +0000
Received: from mail-ej1-f66.google.com ([209.85.218.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzyKX-0003Ot-3O; Mon, 27 Jul 2020 08:17:54 +0000
Received: by mail-ej1-f66.google.com with SMTP id o18so16108443eje.7;
 Mon, 27 Jul 2020 01:17:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=E7aGMVBbgko2tboKSW/8bzhPgYImOO4fEvxr87lyS2k=;
 b=NdRqvCAJ8nNLfmsg/nlU1VDatjzrgGadtYb1dCb0fyZxa+JrRmnU4ugn+Qlhs0tudp
 R5Of11dphTm43dqZ04MJfCxEI6AxSO801A+WaXDkCt1GsRF2vDaEThXpEIG6z4v9dFKg
 N8OTH/z9KHPJKp1njjJwFoLVrTEGZoZLwZTOmJHQniR6AwT/DKr/45XPE8ndO62vyLLj
 cQnBytXGYwj9p5J1pgp6+8/0GAOxlGdBLoqHXBZalfjYhSMFGHKaTBGK0RmfE/i+DhYj
 wJwE+cMpPSu2cLj0Pjdc0aVbsDYvJrOYJVu7nSUhcMIwDr9Zm9RHkZjmuX+CjCVlqDzW
 ZXiQ==
X-Gm-Message-State: AOAM530ZMpVU2lCIWFHRXdhcAafxX8cNC4FHyepfqGtDajaGH9fq81a3
 FWSl1eD9voMFUU14G66MNwk=
X-Google-Smtp-Source: ABdhPJyrUVPjTHJCuMko8x4nzu7fSRmtm7c0iNZkzOhX7RgpOsciUH/ZRpt1cPE3kLgP1O6OOhXiWQ==
X-Received: by 2002:a17:906:82d4:: with SMTP id
 a20mr19026277ejy.165.1595837871933; 
 Mon, 27 Jul 2020 01:17:51 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
 by smtp.googlemail.com with ESMTPSA id dj22sm6931988edb.54.2020.07.27.01.17.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 27 Jul 2020 01:17:50 -0700 (PDT)
Date: Mon, 27 Jul 2020 10:17:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Markus Mayer <mmayer@broadcom.com>, bcm-kernel-feedback-list@broadcom.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Roger Quadros <rogerq@ti.com>, Tony Lindgren <tony@atomide.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Kukjin Kim <kgene@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 06/29] memory: Enable compile testing for most of the
 drivers
Message-ID: <20200727081748.GJ17644@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-7-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724074038.5597-7-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_041753_213421_99CD21DB 
X-CRM114-Status: GOOD (  15.72  )
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
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jul 24, 2020 at 09:40:15AM +0200, Krzysztof Kozlowski wrote:
> Most of the memory controller drivers do not depend on architecture
> specific code so can be compile tested to increase build coverage.
> 
> When compile tested, do not enable them by default.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. When compile tested, do not enable them by default.
> ---
>  drivers/memory/Kconfig | 39 ++++++++++++++++++++++-----------------
>  1 file changed, 22 insertions(+), 17 deletions(-)

Applied to drivers/memory tree.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
