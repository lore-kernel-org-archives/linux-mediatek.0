Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2766BC433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 18:35:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F14462053B
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 18:35:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YrRBZN3F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F14462053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ppkWUnMo1ODCthnnocL4WFxMNKKA2AeISd/sW4dml2Y=; b=YrRBZN3FfI4+3GzLgNmlkqt0D
	O4bc5dkls1tvOtiKbecTjVkzxeyLj+AWzlbsxzdLVzpsLDn959Hf6qLkC2TYEh+CmySNem0nungDy
	ip8Fumg975eFydP496/rW8Mil0HW5wF1bFR2j0jWDNdgpnVeIt+oTbd60kycXc41hLnSKT0yeYaUY
	YFSGefmmJWAMYdkGGdEnYrKkjxzejCm+DvU8wv4gLcIgb4tlSTNEpymsrNzB9r7cb+Mdc+Hhwdggk
	4eGFRpxSRge7Nf4liO34KAt6PZnE40b9TKHqC0vwWQES5UH5dXD5tapwfCQXd5yP2cGa6fAPK0atp
	8w2LHJ86A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7jyM-0007r4-Ig; Mon, 17 Aug 2020 18:35:06 +0000
Received: from mail-ej1-f68.google.com ([209.85.218.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7jyG-0007ok-FI; Mon, 17 Aug 2020 18:35:01 +0000
Received: by mail-ej1-f68.google.com with SMTP id o23so19002892ejr.1;
 Mon, 17 Aug 2020 11:35:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=25dZbMPgS/dtX0tq95S1y5hallw1pJ+BnZq8+l7yBBk=;
 b=aYfeo0aZdkUnxztE13CkLKpC3pSu42vJAM5gRC+bfH3ZEfhuKh71ant+PbbbhV/fOw
 3oCzA0RX6SmfJxRTspW0/2yB+faUF8mq+H393T581p4nObG8hpjg/+oiTCCY6WnpWFB0
 tlW2EJwaJDD+bEsgfJP6IH65inmV9cDBeS6Pr40IqX2NrzaHfKoKS0QAkrLZ519tuzCr
 UTeDkecxNT+xCue9zci0AyDnS6MrqEWAf+mEMxtvUj/jH6FMW8SMYzs83sOetrrzFGN6
 BCKuZ8xDuUA5l3vCMd5JjF2Dgss4NeW8YmXe9nMsZKEG1W5utov/e2sM27oBpkmAP+Af
 OYzA==
X-Gm-Message-State: AOAM533DeqHBZvjbBYp4uZ5B/jVWf//KOaxtU/E+rWAUlap6POBFI+oM
 egIMy1334aBFLKCeOItkTEA=
X-Google-Smtp-Source: ABdhPJyLwBm/IdtA1+1RvI4nnmFl21DUBXRImbwx4HPFsqBpPheiL+AX326IMCdzdk7su3JgiDNiww==
X-Received: by 2002:a17:906:4dc8:: with SMTP id
 f8mr16772438ejw.257.1597689299521; 
 Mon, 17 Aug 2020 11:34:59 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id a18sm14817191ejt.69.2020.08.17.11.34.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 17 Aug 2020 11:34:58 -0700 (PDT)
Date: Mon, 17 Aug 2020 20:34:56 +0200
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
Subject: Re: [PATCH v2 24/29] memory: tegra: tegra210-emc: Fix indentation
Message-ID: <20200817183456.GF3464@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-25-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724074038.5597-25-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_143500_543135_06E5A060 
X-CRM114-Status: GOOD (  13.59  )
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

On Fri, Jul 24, 2020 at 09:40:33AM +0200, Krzysztof Kozlowski wrote:
> Use tabs instead of spaces for indentation.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/memory/tegra/tegra210-emc-cc-r21021.c | 2 +-

Applied.

Best regards,
Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
