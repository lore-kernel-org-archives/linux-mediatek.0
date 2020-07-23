Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F461C433E4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 17:16:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 456FD2071A
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 17:16:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sEpO3XdO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="K+SnKxwU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 456FD2071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NAkpCnx9Xk/FA4/aVSa/BRDyT5uavzY/uSMbZDN08ZI=; b=sEpO3XdOnccqI6hghZNKLdHOr
	EUGGoAgtseE8Zp9x/n1f3VSqeuWCUr0FKUP77h94QsrzX7o/FOdBzL5V61xCSC7LV/OCykvH3IDgb
	8RyTl9AWCSMMR41DRIAELLAvr4lJ7t1tCFEk7NqFMe2+s/AAPHxlmrMmyg28qKNpGYaMX5GhiMjy1
	cPzFjEjlpTWbB7j6tsuO5qsVxhVm+cEtVCzMeaSa4WdoIwMWhbgclfUnJga07vP6t2I++TRFTThWF
	8yqeodT1v0KeovuNdSGRxY+cbr22C+zbiHyk/e+nFcUrDreasp0AAgnOVQORTYV7rEsfVO5SoU+X7
	DbZuzrL6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyep0-0004PW-V6; Thu, 23 Jul 2020 17:15:55 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyeou-0004Mx-Rj
 for linux-mediatek@lists.infradead.org; Thu, 23 Jul 2020 17:15:49 +0000
Received: by mail-qk1-x743.google.com with SMTP id b14so4362690qkn.4
 for <linux-mediatek@lists.infradead.org>; Thu, 23 Jul 2020 10:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JXiuwKSxH1v6t1t/ryYYU7zLgRgpgLMrl8o3usa+ml4=;
 b=K+SnKxwUrjhMdkKMznvv0/mSZpVVpR59yG77Q31rc69sjsc1uY1h2B4N81OGYgZcS1
 fsFtjzCQh4qQJSYBpVJxnJiFdI0biFvC+sGyjDB0cDY0hG11MHJBwW2SK2RI7m2/rwyS
 v1bd5wbArHaOuX4jaoWOMdBC00HeEJmfUwO1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JXiuwKSxH1v6t1t/ryYYU7zLgRgpgLMrl8o3usa+ml4=;
 b=ZoM3BB6h3tin1LDKrG0QDpRVMu7zfes7HeB7IQWCMaEyDKLmnm5L34o2Kev7+18zlR
 ApLvX6lL8nGjWmmXY0Q7/F03YnY1nerFdfa8k6GrOK13OD1BhScrtQ6UUE2enUfwwL86
 joZhYBup/8D8NkcjHxrxEdKDeeg9HqHqqyK31Q2RwVzZFatj/14QEASESODx6brP2Q4j
 ZdOuOXzvFfFY9v7alSAbw/c146skPIcFmFifvAF79qjPzlwUHBcjLXd6zDn9+awSjk3I
 URwVanTZ0k1o+/Cj8AWEXrlX9/joJ16YaAq5D8AarpEjJFZpRF5V+ddAT0aAgTGV4EIm
 ZKYw==
X-Gm-Message-State: AOAM531SGbml0qxe3q6379sKPcgvANlxHL8ds0uKxdQtB25/NYPgG7jI
 sNno65CedQx4Av+lfVmGJXVBhjCnxWvg1RT5Cu4rhg==
X-Google-Smtp-Source: ABdhPJxTfnoxWQUWdTg8raMcFvzXp1cWiOq8kQMMi+BDEmI/sCV1IYxPpZLXjsosKPeDkbkDYTHj+k9jFHSSpLw6ss4=
X-Received: by 2002:ae9:e857:: with SMTP id a84mr6649837qkg.100.1595524546846; 
 Thu, 23 Jul 2020 10:15:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200723073744.13400-1-krzk@kernel.org>
 <20200723073744.13400-17-krzk@kernel.org>
 <b9519b7f-9cf0-3715-bca9-05905035eada@gmail.com>
In-Reply-To: <b9519b7f-9cf0-3715-bca9-05905035eada@gmail.com>
From: Markus Mayer <mmayer@broadcom.com>
Date: Thu, 23 Jul 2020 10:15:36 -0700
Message-ID: <CAGt4E5v3mbY_S2Q=Tq5ZKSY450weu9kFZ9R3bkJ1=3VPobZGsg@mail.gmail.com>
Subject: Re: [PATCH 16/23] memory: brcmstb_dpfe: Constify the contents of
 string
To: Florian Fainelli <f.fainelli@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_131548_922815_044C44E2 
X-CRM114-Status: GOOD (  10.19  )
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
 linux-mediatek@lists.infradead.org,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, soc@kernel.org, arm@kernel.org,
 BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, Olof Johansson <olof@lixom.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>,
 Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 23 Jul 2020 at 10:11, Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> On 7/23/20 12:37 AM, Krzysztof Kozlowski wrote:
> > The string itself can be made const for safety.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Acked-by: Markus Mayer <mmayer@broadcom.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
