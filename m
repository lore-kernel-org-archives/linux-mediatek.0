Return-Path: <SRS0=PXBb=2F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA8FAC43603
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Dec 2019 11:57:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF874206DA
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Dec 2019 11:57:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a06+FoTO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF874206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hM41CLvbzTFcKD6dP8GD+lgyirFAxxiB28sI1lbt4EY=; b=a06+FoTOsar9o1
	P1bm7UzUS4bUmPCq6aVVaHCiz1CjuB6jvtSIG4rmhJ24I+DP/Nhio7tDLHsg2CF9l1uYF5bGQQnyf
	SA3kpN6i2hTNxOMvqUVdVipspBxCKh9bs+2QBaCwK/CzUlvOvFVjlo5P3YpuJWBH2IFfeEnUEHBzg
	ujbdA3a8oaVRbzVguryl8914Briqnn/RYWC04ew8IUg3EE6Q5qfvkpRY+TtGGWWFOFAbOhfcZm3jf
	ccBzUKrfL+x7oAN6HRqk9Ygewi+CPbuFsobkqe6wNICO6rya1BBag3A20czmq3UF1VqvTZosiRoPW
	7F2OW9/9IFFUWDXNVbuA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igSWv-0001IN-Cr; Sun, 15 Dec 2019 11:57:45 +0000
Received: from mail-ed1-f65.google.com ([209.85.208.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igSWi-00016s-9I; Sun, 15 Dec 2019 11:57:33 +0000
Received: by mail-ed1-f65.google.com with SMTP id r21so2788004edq.0;
 Sun, 15 Dec 2019 03:57:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3bFRjA9UFM72dx5MZDZ0tLg6rOZz8LMmXjc51eyWHQw=;
 b=Jd5omKNAEbdzRoLRBSesG4YIFt9XY7XkJWQ+J33TenIMsF6yDNaPjrmr33ONsf7bGq
 LAjpSkqLcsu8oHLJdyQsHCU81+naVIrwF6vRokHrxvYeOA9jIYnXHv7JQZ68kkqRNreb
 ZsrAeQYrNIOHLDjxUsVCUd2L3bLuq/LAvL9OpL7U2sUBNNxB+r+0qY8+6NSaEnfCcwQx
 F3b3L2pFbqusIKgieNNJn+H6OvOUkx52qvQodVDADhNDYquKGdptopf1U1IIQ7MUAwZ1
 WGUKfsx0ZGZ1eg5ynE0TYBqW9CfBsrXIq96j0bU7y517o2743TRNsemOT4aQt1M5FOFE
 oNLw==
X-Gm-Message-State: APjAAAXNlkzWoVrvx/3MezBZn+feuUMapGj+6a8mUwqpXOEAbUxpsDvx
 KRB9pOdkefBS0V+LbAqEEvU=
X-Google-Smtp-Source: APXvYqwZaqP3BPfUD1WWLgwtYw1XJJ7Zy4zkrjF1M4qRiNjNshTKEWnoyc7zscsZ5R0wuEWiJvnvIw==
X-Received: by 2002:aa7:d306:: with SMTP id p6mr26042390edq.72.1576411050586; 
 Sun, 15 Dec 2019 03:57:30 -0800 (PST)
Received: from kozik-lap ([194.230.155.234])
 by smtp.googlemail.com with ESMTPSA id l18sm663825edw.59.2019.12.15.03.57.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 15 Dec 2019 03:57:29 -0800 (PST)
Date: Sun, 15 Dec 2019 12:57:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yangtao Li <tiny.windzz@gmail.com>
Subject: Re: [PATCH 02/10] soc: samsung: convert to
 devm_platform_ioremap_resource
Message-ID: <20191215115727.GB30973@kozik-lap>
References: <20191214175447.25482-1-tiny.windzz@gmail.com>
 <20191214175447.25482-2-tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191214175447.25482-2-tiny.windzz@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191215_035732_380405_417ADEFC 
X-CRM114-Status: UNSURE (   6.95  )
X-CRM114-Notice: Please train this message.
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 khilman@baylibre.com, linux-arm-msm@vger.kernel.org, ssantosh@kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, leoyang.li@nxp.com, linux-samsung-soc@vger.kernel.org,
 wens@csie.org, agross@kernel.org, khalasa@piap.pl, kgene@kernel.org,
 john@phrozen.org, matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org,
 jun.nie@linaro.org, bjorn.andersson@linaro.org, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Dec 14, 2019 at 05:54:39PM +0000, Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/soc/samsung/exynos-pmu.c | 4 +---

Thanks, applied.

Best regards,
Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
