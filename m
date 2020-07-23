Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C55C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 08:55:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F72D2071A
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 08:55:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yQPAOflv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F72D2071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W9vsIUQTTtWzXv8Db75IZ7K4s5gOPuoGDjZSB7zn/D4=; b=yQPAOflv8zlyVddTG26mIUksA
	gFY2K7t/FagyVujqwXTEqp4cVbw4aoFsAt+YNiv0R5boKXeJIepyhFs60WkJ3v/qmrqaVzlKq4NTl
	HKypzdtA89khf+Xf/mrW6qJsbk5f1/xpIjjA7TuYH/wH+/KRz1kY7q1HY7JamQPmbinxpdpa4LHpk
	QQbCNyv7Hn+MmVVFHv1DwH10dtCbS3VXOdLbQwKfrPID7OLsJrJ/r7PjX32pYZJrSHNZs8guelIdW
	/FVYYV9Mfan+Z2xFg7AYLQtsEp8xJraD11ow3AQanH69ciTmnK/CefNcUgwXB14xWfQ75RDzQC3A1
	IWv72aMuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyX0x-000052-0k; Thu, 23 Jul 2020 08:55:43 +0000
Received: from mail-ej1-f65.google.com ([209.85.218.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyX0t-0008Vm-Sn; Thu, 23 Jul 2020 08:55:40 +0000
Received: by mail-ej1-f65.google.com with SMTP id l4so5490413ejd.13;
 Thu, 23 Jul 2020 01:55:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Xt5+vxpGC9nM/ZHsj3r5gI/nmTDmk9F2oBeOZtyGPQM=;
 b=DoSzAvcVTFWMPkR/JxHdLpoY1zj4J+N+W7xgbIYxRK6c2qanRGlgTMFqwGpj8d4k75
 nfDnBpOEj5zdra/+Vr0gu8LMpRIrQvynBwexX4TJ/FZ0q7jD1okemKyWaMKJE8/Dft5x
 anBaR9iP80em+N8ZnB3tyQi+btIZLZKQnzJ7ngP/60XdeR2vKhowMpQuMuDSOx/sw5tQ
 dzhw4sYcXr/aE1jqiZocHcf4irOtn/EpRH7UaPH87ph+FYR8o2A25g/EvNUHb8EysX00
 i5mvSjSa+IzaM6IkviWvZPv9Tz62+05lvz1BeF51PzrSWSckrdhc3PLugUJK5bFMXXnl
 2qTg==
X-Gm-Message-State: AOAM530+sr2ZukCKb5WJOZlBOz6r6EGPXYFWPCwznX59NVelYqb+hQ+d
 k+uPqDJsecaBbh+sDW0vVmU=
X-Google-Smtp-Source: ABdhPJwRP+wjzC0Ys2mHygLb4mxZAtf0iTg0JkShIGi/qXx7US6BV7vrg2I5N8csKyuByvVrRm5SwQ==
X-Received: by 2002:a17:906:414c:: with SMTP id
 l12mr3469617ejk.417.1595494536809; 
 Thu, 23 Jul 2020 01:55:36 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
 by smtp.googlemail.com with ESMTPSA id
 jo25sm1541668ejb.116.2020.07.23.01.55.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 Jul 2020 01:55:36 -0700 (PDT)
Date: Thu, 23 Jul 2020 10:55:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 18/23] memory: mtk-smi: Add argument to function definition
Message-ID: <20200723085533.GA25935@kozik-lap>
References: <20200723073744.13400-1-krzk@kernel.org>
 <20200723073744.13400-19-krzk@kernel.org>
 <CAK8P3a1TSTX9ATUuyWyqJ1xtd6GP13JM-RQkhGCi1BSTiM9X9A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a1TSTX9ATUuyWyqJ1xtd6GP13JM-RQkhGCi1BSTiM9X9A@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_045539_941340_3D198CF9 
X-CRM114-Status: GOOD (  16.09  )
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
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 linux-omap <linux-omap@vger.kernel.org>, Tony Lindgren <tony@atomide.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vladimir Zapolskiy <vz@mleia.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Markus Mayer <mmayer@broadcom.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 Olof Johansson <olof@lixom.net>, Thierry Reding <thierry.reding@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 23, 2020 at 10:50:08AM +0200, Arnd Bergmann wrote:
> On Thu, Jul 23, 2020 at 9:39 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > Fix checkpatch warning:
> >     WARNING: function definition argument 'struct device *' should also have an identifier name
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Is this a bug in checkpatch? I don't see why it should warn about this,
> as there is no function definition here.
> 
> Your change is clearly harmless, but I wonder if we should fix
> checkpatch instead.

Good point. If this were not a warning, I would ignore it. However still
the common practice is to add arguments to such type definitions as it
helps to describe the type.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
