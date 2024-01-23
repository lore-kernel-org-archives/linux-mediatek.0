Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DA5C47258
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jan 2024 06:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gH5uJ9kMxbNgHS2YfX23GkOHBxHF1R2S8Ddt4Z+/Q6A=; b=h5EpvRzAPQ2hX3+9k0uBahePmC
	vvU50UMMC2gRN6ZUt+wC6pknwBMIkNYL3VQ2kHqyTk/UHC8W11q/xtJYKJwFNgFKDSOtb+ziBrJiK
	xkzzUSgQauv7sO/54pYjoYbDQauV+rknV+REYfLQuibqocAebvgub7b2vTGH8zs+gbBZbSRy2BWT4
	dLTBkJVJMOktCDpFp4UTj83+trNXfW/BJXoXCyAcS6afUqDm/teoBBxuUiIqa7Fm6rMyHjVOkYkO6
	hjmidMxIl1hRrAyYMcfBHR3YXSQh4+YiOcYvW4T1gTw4aeqxWu9DB0tP4cuCMqyouS/558xH7Z0Yl
	5N0uPBMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS9zv-00FDrL-2E;
	Tue, 23 Jan 2024 06:10:59 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS9zs-00FDq9-16
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Jan 2024 06:10:57 +0000
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6dc83674972so2164176a34.1
        for <linux-mediatek@lists.infradead.org>; Mon, 22 Jan 2024 22:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705990194; x=1706594994; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gH5uJ9kMxbNgHS2YfX23GkOHBxHF1R2S8Ddt4Z+/Q6A=;
        b=AErsET41xTdlMeo5a2gsN/4avEnq1gR/Dx5qaXTxpjyu2/8NLkdkYpcOG1C2XRTSWs
         kUL8kNxMvuMOKlTgAut5dF9dRK4F1yK1ijqBoCxSnj/Fwb/5r0sGsFqrqHkGQpOCmm/V
         c4neMmteHGlI++aPVLPAU/BbAWh980gRDMjoqb+ADCX/rophIsXkyx4aALLw8hJ7Lz1d
         OgbK2tiJYODcImhwZbcE/dQEk0t4iED7tPEt0Gp5ntbcevGFhq2HAGo5kNKauElcwDlC
         Tx+pcqvEaA6SQrLF+7t4Y4eYFy1/OIz2ajqGMKK6ZYnjGY8SvJt9tLxyMaSwnw0b+H2O
         OSzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705990194; x=1706594994;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gH5uJ9kMxbNgHS2YfX23GkOHBxHF1R2S8Ddt4Z+/Q6A=;
        b=niyfHoy5Cs37f7byEun0Onrcoa5VLfzvKfqcL4P3MCVEgOWdsFSpNRFWUpj5qtIgW8
         jUummOl7Qh2U8Oz0e/n7lWHUzc9qWwF6SHED4o18JtdLqepDjHIX3U7PvaObUcDEVzyQ
         NTIpnDchJHuXWnFs49iSBaQwklqYEHzsJB2+0jqbmP4kBenk8dFoFt0NQvG4EUp4psig
         aDWDMDtXlG987c1jutQDlzZ9zUcY2aTX4ltgOR27v870CYQISk1ezAUVeWDUlLvucmbg
         BiQGuwl+8KC0QXgwN9b0TwX/PV6yCtmx0MRQHMlki1idkoypdRSN4+ZE4g0Xx3nQUkPI
         mPug==
X-Gm-Message-State: AOJu0YzUvvPmC/nqfJJF0EUAvA1tbmnFNe6cLckbhwXe14W5nTIqhYxW
	YVnr7GIOdoME6n8DIlRr7fV1NF8kZzCbD1yomJ7+MQGqdRJyA+FUfokKl2vXaTE=
X-Google-Smtp-Source: AGHT+IEa6u4y25PmtAOJIzMLZ7kuLsaH6aiw8FXp0uievkuh4/VBS03zIAsrfkYHzALHuHoy/WXCXA==
X-Received: by 2002:a05:6358:281a:b0:174:f664:e477 with SMTP id k26-20020a056358281a00b00174f664e477mr5037598rwb.60.1705990194606;
        Mon, 22 Jan 2024 22:09:54 -0800 (PST)
Received: from localhost ([122.172.81.83])
        by smtp.gmail.com with ESMTPSA id s4-20020a62e704000000b006dbd59c126fsm4198271pfh.11.2024.01.22.22.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 22:09:53 -0800 (PST)
Date: Tue, 23 Jan 2024 11:39:51 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
	"Hector.Yuan" <hector.yuan@mediatek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 2/2] cpufreq: mediatek-hw: Wait for CPU supplies
 before probing
Message-ID: <20240123060951.2m6h6t537bu27ois@vireshk-i7>
References: <20240110142305.755367-1-nfraprado@collabora.com>
 <20240110142305.755367-3-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240110142305.755367-3-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_221056_379656_CA9E75CE 
X-CRM114-Status: GOOD (  11.94  )
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

On 10-01-24, 11:23, Nícolas F. R. A. Prado wrote:
> Before proceeding with the probe and enabling frequency scaling for the
> CPUs, make sure that all supplies feeding the CPUs have probed.
> 
> This fixes an issue observed on MT8195-Tomato where if the
> mediatek-cpufreq-hw driver enabled the hardware (by writing to
> REG_FREQ_ENABLE) before the SPMI controller driver (spmi-mtk-pmif),
> behind which lies the big CPU supply, probed the platform would hang
> shortly after with "rcu: INFO: rcu_preempt detected stalls on
> CPUs/tasks" being printed in the log.
> 
> Fixes: 4855e26bcf4d ("cpufreq: mediatek-hw: Add support for CPUFREQ HW")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Applied 2/2. Thanks.

-- 
viresh

