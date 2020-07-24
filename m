Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75987C433EA
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 07:15:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46C5020748
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 07:15:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d9aptrJM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46C5020748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X2lt562Bw51LHZpR0mAqMnppz+vBUrAXjcHoH+6veUk=; b=d9aptrJMWR5R8TG/KWFG+pNqg
	RK22pOQQ0fHBiYrYAuoAcbpqCgSlNU8godwVYVTjX9WrsCUyTWodHSrwNu5ZYp21z7xRCh3zf8WFC
	VdkovoLTa43LOerNF1TKJA8sv52Zo9cplR/LqOPv7tXWB2MfFw/KPRIVmW5NUbZrKYonTY2aLp6V3
	ZmGVpE96JwtVmCuJ2L34RQm/zXiG7wDiETVxvWN6dIoUBEUHcW8dM+h+PCERX0L2+mg3/l/qQdwrn
	Xtqt1YUaNx3+9E4JVYg+0pBzpPE/RS+kSi9X7QWGrCqzUZspvQqn1YVmaHwPvrvAM89YhCDRoJbE1
	7a3ImoWTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyrvq-0003EL-LT; Fri, 24 Jul 2020 07:15:50 +0000
Received: from mail-ej1-f67.google.com ([209.85.218.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyrvd-0003AE-Ut; Fri, 24 Jul 2020 07:15:38 +0000
Received: by mail-ej1-f67.google.com with SMTP id ga4so8901841ejb.11;
 Fri, 24 Jul 2020 00:15:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kb0NMIWA8NMC9OCkXCwQpZanLpUA9SPrAHge49T1PVs=;
 b=bnLApaaBX6QgOz7yESRHIadPvyfGjdGU0oySkYjIB2Uthi1kZqxUKhfObe5VAmv2og
 SfcAbKjTFW2vOeG5b/U7Fgw5iyrQIZtty+nemiy8Bk7Yl26pGT2kpNhAan+DGwcxaBlo
 DNX0CIqsMs/8He1O3z5EQvfNCHqN9nF+zMQthmvsTS9duXwJpxndkY8HF/y9BYS0XWdC
 KlKXJ78jwB7ejbsKy5dqALCBlgUgrsJyCE1SrDhaF5hpNXPGuk7fAS7YkmV3E53d3HWq
 r9DgoXDWwEdp/q0FinaTkuwl6unJAUfnDXwsUqOViitWwXkbg6d8qyNyhSn0251BxXSM
 HJaA==
X-Gm-Message-State: AOAM533SfoAxAW1xgwOfrEUWcodsEZGu7CqPwDIB+J9YzdBhsymiuzY3
 6VgljbjE3IpbXU+/xO7JqwQ=
X-Google-Smtp-Source: ABdhPJzqgO6qxeTTZTDa89MI0CgYxEaP3SeQEudnyocZKpAeuj1R0CEq2QVJrGBSwuvtwplZBmRarg==
X-Received: by 2002:a17:906:1a16:: with SMTP id
 i22mr8067074ejf.439.1595574936524; 
 Fri, 24 Jul 2020 00:15:36 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
 by smtp.googlemail.com with ESMTPSA id fi29sm90068ejb.83.2020.07.24.00.15.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 Jul 2020 00:15:35 -0700 (PDT)
Date: Fri, 24 Jul 2020 09:15:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 23/23] MAINTAINERS: Add Krzysztof Kozlowski as maintainer
 of memory controllers
Message-ID: <20200724071532.GA3087@kozik-lap>
References: <20200723073744.13400-1-krzk@kernel.org>
 <20200723073744.13400-24-krzk@kernel.org>
 <afee0362-e9b9-26da-04e2-136a8599bc79@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <afee0362-e9b9-26da-04e2-136a8599bc79@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_031538_049673_F1EE38E6 
X-CRM114-Status: GOOD (  15.30  )
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
Cc: linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Vladimir Zapolskiy <vz@mleia.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 soc@kernel.org, arm@kernel.org, bcm-kernel-feedback-list@broadcom.com,
 Markus Mayer <mmayer@broadcom.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 Olof Johansson <olof@lixom.net>, Thierry Reding <thierry.reding@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 23, 2020 at 10:12:36AM -0700, Florian Fainelli wrote:
> On 7/23/20 12:37 AM, Krzysztof Kozlowski wrote:
> > The specific drivers in drivers/memory usually go via architecture (e.g.
> > ARM SoC) maintainers but the generic parts (of_memory.[ch]) lacked any
> > care.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> 
> What does this mean for specific drivers? For instance I tend to send
> updates to brcmstb_dpfe.c through the Broadcom ARM SoC pull requests,
> shall I continue to do this, or are you going to send memory controller
> subsystem pull requests including that file in the future?

If that's okay, I intend to take the drivers patches as well. I will
rephrase the commit message.

Thanks for the feddback.

Best regards,
Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
