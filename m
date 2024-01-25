Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEDDAC47258
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jan 2024 04:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tpo7S81Q6e7picJzGDOqqGEtmvErnEcq2Z13Hltk/j8=; b=1zuUtj+U5/BYvGJ38jwp9ZEERB
	zGvDvyqLwIzkPueA74Gz3AspuLKri8znTQWs14go5BhqhD1mghSdg1tqKloEuh6SFvBZZRSxiQS3e
	8l+87b3IeQpPGqBwQ9JEz2h04kctLf782pKJN/photmzMYB0c0AD/GhLskcBJQptwErPilETRbeBY
	p4zemSLLffpNtl+wPg6uZSsaIcjizhEh3P9FDzaPa62tz4Ra/mPJq8ecSw2MZUF92vS63v9w2miWp
	yj5Z+pkE93WAx7M2PPr2XXJZQ8Wmz0rO255wQWZwV66xJp+vKYAPXEV2eVRDNpMFIO0YAvqbiGe0H
	oU41I6ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSrpQ-006N5m-35;
	Thu, 25 Jan 2024 04:59:04 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSrpK-006N45-3D
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Jan 2024 04:59:00 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-6dc8b280155so2866548a34.0
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Jan 2024 20:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706158735; x=1706763535; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tpo7S81Q6e7picJzGDOqqGEtmvErnEcq2Z13Hltk/j8=;
        b=Ejbj+DYhKUR7jT1jQcstD+cWtcYK05YtsH8/SXbxVZiib9Naa4td6hVztJK2fHfgoq
         KBW9SkGx/sZ08GzL7Cd/2SEVV+P/oVahWzSflOg+TItb40LQqewlfmLaLTdlDkHe0cqe
         T6lUMMUucmOCx29CJ5xXxGkwd57yIot9cX1yzI/9tvpfROSnTqKSy5EeInH0dRaiIUj/
         R6Mnz/yAZ1WMKbZJb7/0xKw7LM+/ZEoVaB1FEIjxzAwYD6S9TUX2/NXXSDY34G/fbmoi
         Rgc2TNotrWxGkQMvH+ENnuJfMOOFpodpj0AcKAwNhzFe6X48hA9z55Qb8RXKGhhEVC8h
         AXlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706158735; x=1706763535;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tpo7S81Q6e7picJzGDOqqGEtmvErnEcq2Z13Hltk/j8=;
        b=Pb68/K+8AhLaL9Q+h5XqCFgoJEQWpSyHn8C/zzniRl2LSCtq20fsxMNDeMWiIyUSOa
         xYT4AfFczCNGLzialQCh0xCS3hvS2L+71SLTeFuodAvv9qcBFe+5fGKj3U+OM1BquHf6
         vR4s2f0nvnH/AGR1zIZlLsOQRD2px5Nh5ebBgrzGoqqiGPaZ3LZc/HvWXITNJtMfKV9y
         Q305OfD0JTs3+pw5l+F5IuhE/+tDHdiIZwbF6vyjH84T6XpUYy3ZS9HryIJjHoXKCDOs
         5kK9M4BTi3r79/1lzajA6XJNScPpBZNqrpa2fLHXdn2HOMC4do+His7V2DsvjxvIrder
         vR4Q==
X-Gm-Message-State: AOJu0YzBtkTDXeOWyCGJ4GxM5GJSNZUWV4VsMOb+joThsxKfvI3Nf+Zj
	sJZWuaF/A0WiVmGTm1VtcEusDmRi8wE2XAO24AsSV05YRoO2SVtLRyODedtxL8s=
X-Google-Smtp-Source: AGHT+IH73ljD+tyH98GgQeFlyFzdp++7wNKTqWqkYp/Jj3Cf3NjheYdC9xQZhkIOcBEa0yaqPJi7jw==
X-Received: by 2002:a9d:7842:0:b0:6e0:e0e2:9e2d with SMTP id c2-20020a9d7842000000b006e0e0e29e2dmr209980otm.41.1706158735392;
        Wed, 24 Jan 2024 20:58:55 -0800 (PST)
Received: from localhost ([122.172.83.95])
        by smtp.gmail.com with ESMTPSA id t26-20020a63955a000000b005d5a7ddd656sm1109237pgn.36.2024.01.24.20.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 20:58:54 -0800 (PST)
Date: Thu, 25 Jan 2024 10:28:52 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	"kernelci.org bot" <bot@kernelci.org>
Subject: Re: [PATCH] cpufreq: mediatek-hw: Don't error out if supply is not
 found
Message-ID: <20240125045852.urocd3yzts5ajmbh@vireshk-i7>
References: <20240124-mtk-cpufreq-hw-regulator-enodev-fix-v1-1-6f9fb7275886@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240124-mtk-cpufreq-hw-regulator-enodev-fix-v1-1-6f9fb7275886@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_205859_044137_881555B1 
X-CRM114-Status: GOOD (  13.61  )
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

On 24-01-24, 17:31, Nícolas F. R. A. Prado wrote:
> devm_regulator_get_optional() returns -ENODEV if no supply can be found.
> By introducing its usage, commit 788715b5f21c ("cpufreq: mediatek-hw:
> Wait for CPU supplies before probing") caused the driver to fail probe
> if no supply was present in any of the CPU DT nodes.
> 
> Use devm_regulator_get() instead since the CPUs do require supplies
> even if not described in the DT. It will gracefully return a dummy
> regulator if none is found in the DT node, allowing probe to succeed.
> 
> Fixes: 788715b5f21c ("cpufreq: mediatek-hw: Wait for CPU supplies before probing")
> Reported-by: kernelci.org bot <bot@kernelci.org>
> Closes: https://linux.kernelci.org/test/case/id/65b0b169710edea22852a3fa/
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  drivers/cpufreq/mediatek-cpufreq-hw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied. Thanks.

-- 
viresh

