Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D573CC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 14:13:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 936BB2063A
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 14:13:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xUOD9VO7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 936BB2063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LGfUq8NBqjOZKBUNcWRmMRMEZAIS+vEE4L7iZKwi4Oc=; b=xUOD9VO75WuaHBK3Anw8cG6oW
	9O0tI6gHg+XfbnYV/qS9yo7PqNVlHJ1Kusnx16GtFsphU72BHW5FEUBPHL5mhNMS3GPVDgFv+BKgo
	77z6QWVjxLjFa8C6ZqjcPbfQ930TWdvhv5W/TOpW6Z8ljmoY0cA2RyF1Rw7x4cWGAVnG0dccT9n2w
	jMTWkjz1Z/6iNhD4LNy+zOkCHLaDcVUbhMsMLEkLp4Xe8YdHSdHp8r5HWT3/sBPCXyL7qgSClSr09
	AXCRVQUMN8D2oRcYxqSTbcGlvXIhX52bEh1t/WC7kyuKugTn4KoPWGUAFQE/uP8QUZsoj/kjc1Vqr
	ZgLa5Jqmw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyySN-0004dK-HY; Fri, 24 Jul 2020 14:13:51 +0000
Received: from mail-wm1-f66.google.com ([209.85.128.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyyS7-0004V2-2p; Fri, 24 Jul 2020 14:13:36 +0000
Received: by mail-wm1-f66.google.com with SMTP id c80so8098504wme.0;
 Fri, 24 Jul 2020 07:13:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IOGzJ6cY2FjYdFpjVdtQFQ2yTS4SILz/gGUSj1jCM6U=;
 b=q7rb94IS3UEWj70DTbyl4Fq0gyekx4iDVQ/B9AWx6DspCNnngJhl1EBqsv0tlGjNlQ
 xOWLZhG1fno8Hh9rBT8wghwwxV5U+4TRqMVxEuok1AIpXs9hCW31OHkuo5h6gSnfsxa6
 odSEMizjJuSbND7F02hSTFOr4NHgi+6c0G6+NATKzo4ZfqyXqBPWWHXj11Clq8xiAtEx
 /Qzx9WUtXp2bJdLszMGxWw5vfSvMJTAYw0+bOkDuvpPeNAbW/VQE7XQxeShsv8fraP8O
 /mdHzHVEgKCyDSVcVd9/x2dfj1TTeRM0BLh6qGb5oc0YeOY6KKMFuhxgYsp6Uojbc7RY
 NLMw==
X-Gm-Message-State: AOAM5313PsLJiVqxaiere+66yhj9/ssGh/AjpM3DEj+FXPrZJXlbqUsg
 XQ22o5aL8AHxuI2S03JtY/k=
X-Google-Smtp-Source: ABdhPJwL+QeVZyCxyJDZBcmgW5Pvgk096UsvgpB8okMSIFclx8Xu4901fsQGaQOHTWUHjjTjXaZfBQ==
X-Received: by 2002:a1c:8094:: with SMTP id b142mr8846186wmd.122.1595600013959; 
 Fri, 24 Jul 2020 07:13:33 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
 by smtp.googlemail.com with ESMTPSA id g126sm7375209wme.16.2020.07.24.07.13.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 Jul 2020 07:13:33 -0700 (PDT)
Date: Fri, 24 Jul 2020 16:13:29 +0200
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
Subject: Re: [PATCH v2 19/29] memory: mtk-smi: Add argument to function
 pointer definition
Message-ID: <20200724141329.GJ14851@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-20-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724074038.5597-20-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_101335_174454_21C0346A 
X-CRM114-Status: GOOD (  12.51  )
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

On Fri, Jul 24, 2020 at 09:40:28AM +0200, Krzysztof Kozlowski wrote:
> Fix checkpatch warning:
>     WARNING: function definition argument 'struct device *' should also have an identifier name
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/memory/mtk-smi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied (and part of pull request to arm-soc).

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
