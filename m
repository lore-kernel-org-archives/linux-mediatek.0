Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E73C433EA
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 14:11:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2B2A2063A
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 14:11:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WqAxiInF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2B2A2063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2UL/CLNQrNuyq8vrEdCRBL7/Y716cxOcNy4SXyAOZJk=; b=WqAxiInFg52lR61Ru3ia3v3zA
	W2ei/WXbpcubvbo6R2rYhX6uloXdQCq0FbOuLAS53Y8zZjT2zs+DyqIzmAx0spwy4CJiyjq345iN8
	XfshAKWLbqzRhotS2ppg8uXPN5pVyYut+TrCm4KPTsGMQR+ca0hvZvYuZB9ifkM+Flzw0reidq2Gx
	F2d46BBLAEQhQCEEwVXNfrZUyogg6XxxNRBp7+ofivvDgs9Q+f2EzW1f1nFMyCljkr98mquoMZWFT
	Po2SsCW0PsFBvX/f2s5atTpRZPxw8B0uOqqagFqb1v7D8BaezEZmsos5tjq6hgAtv4LBTYq5DCqcn
	yKsBJIiSA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyyPx-0003Ya-S4; Fri, 24 Jul 2020 14:11:21 +0000
Received: from mail-wm1-f66.google.com ([209.85.128.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyyPn-0003Tq-L9; Fri, 24 Jul 2020 14:11:12 +0000
Received: by mail-wm1-f66.google.com with SMTP id j18so8079642wmi.3;
 Fri, 24 Jul 2020 07:11:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=A9vjVNh+Xzd6zKN6RvLmeY0dNVwxU7fOoaRRb6t5xa8=;
 b=MYQQH1cdhJ/8GOSAx6joKeZ1rhu6H/+HOCsfj2Q+XbdDEhbwSOUhG+KSgu22sVSC2M
 1MKaLZPMYSWdURaKLE5EJSeR+Hvc6wM8z0+vobzXD0OcCLthPzDVgsM0eFWluihDwDnM
 BQJFd1uCekHcbuqd8GrQZeMgnXLylxLld2E3tLNzEn96pCa6tHrv8K8+T/uEF0kS9GKQ
 c2MjXJI3aX4zp1WCNhxFmnaI9jCiK6YFgS8+lwvOpCWUUjXIaQHEBtWlJLIxMTXPRLPW
 GC79akeQxOFX56RqSY3O2/l0AoO4lvMkjVImf9kPVn58n7OZ5FBpDxcpXtnUItId90LQ
 rtzQ==
X-Gm-Message-State: AOAM531ppIOwtpju2MFHe/D00dJnyPwk6IKUxVPJjCmUYUlzYz5RAwqz
 hWnKQx07ujrV5kmrW+Zu0Ls=
X-Google-Smtp-Source: ABdhPJz3aD933VZnlcL2lyFXk2MIAVE5alwfIVb1d+ILWvaUq6pkspzSLCjLp3FksVGQR+JIWdH11g==
X-Received: by 2002:a7b:c936:: with SMTP id h22mr8449055wml.114.1595599870112; 
 Fri, 24 Jul 2020 07:11:10 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
 by smtp.googlemail.com with ESMTPSA id z15sm684433wrn.89.2020.07.24.07.11.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 Jul 2020 07:11:09 -0700 (PDT)
Date: Fri, 24 Jul 2020 16:11:06 +0200
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
Subject: Re: [PATCH v2 13/29] memory: emif: Fix whitespace coding style
 violations
Message-ID: <20200724141106.GE14851@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-14-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724074038.5597-14-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_101111_748478_BBF39D34 
X-CRM114-Status: GOOD (  12.98  )
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

On Fri, Jul 24, 2020 at 09:40:22AM +0200, Krzysztof Kozlowski wrote:
> Make the code and printed messages slightly more readable.  Fixes
> checkpatch warnings:
> 
>     WARNING: quoted string split across lines
>     ERROR: space prohibited before that ',' (ctx:WxW)
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/memory/emif.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 

Applied (and part of pull request to arm-soc).

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
