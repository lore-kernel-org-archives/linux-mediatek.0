Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6A21C433E3
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 18:27:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8E392053B
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 18:27:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="11Lx5BY6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8E392053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M53hesSUhOt5AFL5sHkd4N5o31V1WquWtuqNhYaKpzg=; b=11Lx5BY6yGPuB0v/vi7Cl3UOy
	FD0HWsCYs2fsgmyseKXnXOdB21ukle0akONKM0KI/kuIkWp8miqEOLR6EcNXyeetjP4VUqsGdKnTR
	KcOo463iv0pAcTZVOyeu56SN+/7qqP7kXaTp1XaNdCY7FKy+QNCamNoeZAGTXVRp5IBDyH0QRivcP
	kWrDQDa/PBNaK++pxXuLSio2psw3zThVSHKWYdaT5Do36XJH/jkD6ZnAsDqUNJH4ls6v6VfspVbM3
	VOB1TXpsB5j7jw9RrqOiKtEhHj1e2zVwFxoO/3lxVuz+8yQIERmhOpthwMPVWDEyrjuMTKBW3lKaC
	dMWlWuvHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7jrH-0006iZ-Ma; Mon, 17 Aug 2020 18:27:47 +0000
Received: from mail-ej1-f41.google.com ([209.85.218.41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7jrD-0006hb-Jm; Mon, 17 Aug 2020 18:27:44 +0000
Received: by mail-ej1-f41.google.com with SMTP id o18so18932584eje.7;
 Mon, 17 Aug 2020 11:27:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=In/lRzRecPXlJCsCXOUKVII8Zjza+KgDgAZ3qlg6NBY=;
 b=ON433uGTyz/nzyZv3mRYmzMTQmohSmFYSJZRPle9YvQtuaRKhRBdrq7fKq0Q4gS6Sz
 UGQkMgttp0P5bTgN2rGKsHuuuMKAtSuSSMnAEAPZxhUhFxV+7VDYoVYRdi54IPfBLKfQ
 znTlGiYZIgiWCmDjw1RA+wPhKBr7ukzkq2VS6tznn7TRqw5eDruhv8Mj0Xx5oFCJH68d
 vM+JQpLlV8hB2r5smSf/ZRC5wyFI444DE4HGBJ3b76RIGKruWEdBW+/oUm1VEgBkcbk+
 IRLQj/nKKaoRMdugwk7YApqWJTiWhYoGa1E7EN1O/mOe6QpPnm3TmQTglfuJq9r/dW66
 /kHA==
X-Gm-Message-State: AOAM5333WQIeVOuzFLJQrUcWCGh4ox0hwbSUL41qfxi+8/HJxOrrZOHH
 FLJQyBgffWf7gg2MwDyAul8=
X-Google-Smtp-Source: ABdhPJzlp7hrM7e8yK6q4U5Xo1UPtQg4hALTTyDbMtxYuqmsunf77TyReaLSnblPdWrAoapQvk48kw==
X-Received: by 2002:a17:906:54d3:: with SMTP id
 c19mr17313272ejp.408.1597688861304; 
 Mon, 17 Aug 2020 11:27:41 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id p12sm13037482edt.27.2020.08.17.11.27.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 17 Aug 2020 11:27:40 -0700 (PDT)
Date: Mon, 17 Aug 2020 20:27:36 +0200
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
Subject: Re: [RFT v2 01/29] memory: omap-gpmc: Remove unneeded
 asm/mach-types.h inclusion
Message-ID: <20200817182736.GA3464@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724074038.5597-2-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_142743_739243_90D43B79 
X-CRM114-Status: GOOD (  14.42  )
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

On Fri, Jul 24, 2020 at 09:40:10AM +0200, Krzysztof Kozlowski wrote:
> The driver does not use macros from asm/mach-types.h (neither MACH_TYPE
> nor machine_is_xxx()).  Removal of this include allows compile testing
> on non-ARM architectures which lack this header.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/memory/omap-gpmc.c | 2 --

Applied to drivers/memory tree.

Best regards,
Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
