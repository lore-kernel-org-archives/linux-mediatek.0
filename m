Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B309CC74A5B
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 03:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7wIVvQtQ08+FVB3HGLgmbrB6tpQAlVSF3Q+hrEVxEwI=; b=t2e8ujvZFKxdoRI3I63/veIAky
	lAi2SYnqf6y95hAS9CzYsPdBhFZGKnk7PdOoMnwca57Cxv4ie6fPkSM3ljO91PCkTWhAJtnU4698o
	qid7eYituW5Pl/jGXIxeygugcmFTNwpLfVBsBajFMPjtpRbk6TG/npSbvlAv6cbFD7doa5F6YS+MP
	ei1Ywff/Q62B6gQx+iIAvjA/3MuZkDPudWkN6gPJZjDI3L5EgTtJg70aNU9KJCljuQqRzaUoWJDcZ
	xwlEKHAu11k/A8izRjGCRXPbb2mGfVk653RE+e00F0O+zeGqhVGYpuqF8sJPY2QKCWQZpm/xmUqnW
	ZhclZyTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phjIz-002SX4-0m;
	Thu, 30 Mar 2023 03:50:29 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phjIv-002SVH-0i
	for linux-mediatek@lists.infradead.org;
	Thu, 30 Mar 2023 03:50:26 +0000
Received: by mail-pl1-x631.google.com with SMTP id o2so16906929plg.4
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Mar 2023 20:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680148223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7wIVvQtQ08+FVB3HGLgmbrB6tpQAlVSF3Q+hrEVxEwI=;
        b=YMrzUH7rMqsk2Up5hh+tIWNrKWgJ09TihZq20qz7HzyjHnxggL3oUgZwjXqHSWH0QN
         tYfwNhVOf1ZS+iuj6L5kZmIggV94/BjBmC6/9IIzwMNA5fd4AEWMmIERa/DwuUFFGM6+
         Z1soQolxg+mo7ssaruZd6bEp+dgS5CPO8ljj8YTG/hwOm2EIA3OpCTmoS4iyHWJnlZeq
         W61nWDQ73daylvIQtvtxWqSFJDHSBj8+ht2yUgjQyazRvbIh3YnAEIlrGpRrq/bbL8WU
         2JCHuotqwHb9LM787UoVI46joOAKNUoMZaWkW6LHeg6SHhAyU+EaPgXrzrUwfZBPTwu+
         SeEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680148223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wIVvQtQ08+FVB3HGLgmbrB6tpQAlVSF3Q+hrEVxEwI=;
        b=o0o/TINkBwkCq4X1Q1lZgjoK/NaOf5SbmuFuh/mb34iOn20KeWaLXMTg5Ny2IYjZXY
         DTQGneSqiD9sIEkrLXklJU5mqe46MJtjsYUwHpYZ6Rw3pBkbbj1eyEd+HtI765aY6pqe
         ReYyK8t+l9fKOymnEaRoHAwipZfYFJVpizPhMAqDShkfV7yjxWZPy3m0DulYRqHAI5Nw
         5IlQTFkS2+eAghZO2rzFga78SLIejs5SGHhvlN3G/WGaPpVJq10m3tB7WnukSb7cDOFo
         ickUI/ZaFqoLj9tK0SStSQECwQXbSZCcOOKboDrLNnj/Eq4NcdHC2RMT4p0gn8Od0UA/
         MkkA==
X-Gm-Message-State: AAQBX9df2t85aI+ZxLMaYGxfikup8RdFBEmOvikl2tcmRwot2lrmKI8C
	pyngRaySoAVWtcnllLsf9UJ1Og==
X-Google-Smtp-Source: AKy350aTCyMrKSx/cz5S2VoYDvkCUgu5K7A2N8Pm0iKJMr2eouVILR1PVbIXGBRLTJ279qHhz8eGQw==
X-Received: by 2002:a17:90a:31c:b0:233:f394:d83 with SMTP id 28-20020a17090a031c00b00233f3940d83mr21464512pje.48.1680148223614;
        Wed, 29 Mar 2023 20:50:23 -0700 (PDT)
Received: from localhost ([122.172.85.168])
        by smtp.gmail.com with ESMTPSA id cu12-20020a17090afa8c00b0023086d280c5sm2191677pjb.3.2023.03.29.20.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 20:50:23 -0700 (PDT)
Date: Thu, 30 Mar 2023 09:20:20 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "jia-wei.chang" <jia-wei.chang@mediatek.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Rex-BC Chen <rex-bc.chen@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	hsinyi@google.com, Nick Hainke <vincent@systemli.org>,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 0/4] Enhance mediatek-cpufreq robustness
Message-ID: <20230330035020.3dctfdlnnk2cvxzr@vireshk-i7>
References: <20230324101130.14053-1-jia-wei.chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230324101130.14053-1-jia-wei.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_205025_278869_E4F61CE8 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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

On 24-03-23, 18:11, jia-wei.chang wrote:
> From: "Jia-Wei Chang" <jia-wei.chang@mediatek.com>
> 
> MediaTek cpufreq driver has some reported problems required to be fixed.
> 
> Change since v1:
> - Fix error handling in patch [2/3] in a way of "Free the Last Thing
>   Style". Refine its commit message tag.
> - Remove the change for MT7622/7623 platform data in the patch [3/3].
> - Add the patch for MT7622/7623 platform data [1] in this series.
> [1]: Message ID: 20221202095227.167492-1-angelogioacchino.delregno@collabora.com/
> 
> Tested on:
> MT8186 Platform (kernel v5.15)

Applied. Thanks.

-- 
viresh

