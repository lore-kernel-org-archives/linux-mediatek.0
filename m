Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088F1CE837A
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 06:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MrlCI6gDMqjjvh07SpujHzw4G0hvOwNj3Og9A77/EN4=; b=y4vmUvgTKxpnqhIL9MiyXPN59A
	cbspwCUjJTL3NNZl2W7oymghxjtghOgtROBNMEz8cCSO850+K/8dZDeuRYoOIe+aj1/JrnFlhtOeK
	cEDeIkvkMtHDhY9vV5YiU2bkXxZeiRnWlOwVLIfq6EWj25BZZqLEw1ycFIvz9xbV+qk0uimatkANq
	FX6ORA23H6KzxFw1Jfl2crxJtI9K1/hXDxUcBNI54XzsKTWFZy8+6sdxjgBB2lxPx+pbK2ZmjGNI+
	V888Wb+IiJctj080DeCvcx2AmOMUndl1+dRvw9Z8pzQfUjDPPS5qkwNv9wF/ms6yHCvZJapme/mt0
	sM0IJswg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svWZz-00000001mmG-0i38;
	Tue, 01 Oct 2024 06:41:51 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svWZw-00000001mld-1rDs
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Oct 2024 06:41:49 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-20b1335e4e4so47149205ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 30 Sep 2024 23:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727764907; x=1728369707; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MrlCI6gDMqjjvh07SpujHzw4G0hvOwNj3Og9A77/EN4=;
        b=whAXJQ7VguZj/+ibAqc03dif+Tm6/2aTp7BM6NGNbAQh6t9zDPVHzKjNGRT5xRn+HF
         qr3IepxZTPEmhYJeC2jjMmlPIW2I5o65YqdVKeYaGJI/wspfkhXbyyYO7AqZELdbnYR5
         vlCEKJmlph869FphLbYBVdlz6X/pwUpWcgtZvH7luOj2CpAl4D2bRkZf8/AoTSUtMrW/
         NKSYQALFwTkbZegV5RSqdUu6RcJsd2pqcc64CGYg/15IvjiviUhGoV2ayGS2mg04E4rw
         HUXIQc9Yz6mtjiFNQynDnsIRHabtH6NUjkDgm1adwzz2IcN59j3fQ2bgOLq2O2GuYbF7
         /GCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727764907; x=1728369707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrlCI6gDMqjjvh07SpujHzw4G0hvOwNj3Og9A77/EN4=;
        b=tsX42BFcGSWSAKS2eN5dFh29wpkivhB2/VcNRrs/SqCD0B1tXRI5sVzu3gbo+I9Yeo
         /KaLMmtir0JK3cwees9t8TAzXosqEhoESIgKVvwRYYOj6wQ/QKgv+w1WNQxRp1B/GKt8
         uujjIrCqtO18syGoWn4R3IV7mR76dQJmhAorCtVi/qmlJHMAJOym9e1vRcQ8RoBzVSNM
         uiBGU6g2/7F/jSRWScP6aRllEoQIAjGJqduUcLHVGoF+YyyZz7r7syZfBn5nTX5eGPpY
         kVU+uyJX88QhUHrt1isI8PThQKC2uHjOmy0jdueB2ukjjt/v1+pz4CKCimnlpUqU86VZ
         GTtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHOEZlUXL2fOVK+h0fJ0pDeaKYG0vp8X0SVVEKHjdzlqdO8MpL5Jur/EW9XF37/id9gXg4I0kQCRJTvPCkyA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxayGPQfpzR3SiTP5f+DBU88BRtwvyJC622OIFpjmhaCGS1fXt5
	+4i9hgDVsTZv6VYuozt/X+uucBI+57BCzf8onk3K6QRAR2ZWKghU1E4vEZaXebg=
X-Google-Smtp-Source: AGHT+IFP3u0mkHLILfVEb/4G2eiUN2Rl9g69lxh2r/A1UnM0/qF+U9h+WXBSTr/0YXwcXLpcsRJ+KA==
X-Received: by 2002:a17:902:e80a:b0:20b:58f2:e1a0 with SMTP id d9443c01a7336-20b58f2e394mr152709015ad.18.1727764907712;
        Mon, 30 Sep 2024 23:41:47 -0700 (PDT)
Received: from localhost ([122.172.83.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37daf85dsm63772875ad.113.2024.09.30.23.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 23:41:47 -0700 (PDT)
Date: Tue, 1 Oct 2024 12:11:45 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Mark Tseng <chun-jen.tseng@mediatek.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v1 1/2] PM / devfreq: mediatek: protect oop in critical
 session
Message-ID: <20241001064145.fnnzcsrewz6pttoe@vireshk-i7>
References: <20240913103933.30895-1-chun-jen.tseng@mediatek.com>
 <20240913103933.30895-2-chun-jen.tseng@mediatek.com>
 <20241001063919.ekqfd4epcefh5eci@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001063919.ekqfd4epcefh5eci@vireshk-i7>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_234148_515317_4477D2CE 
X-CRM114-Status: GOOD (  11.80  )
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

On 01-10-24, 12:09, Viresh Kumar wrote:
> On 13-09-24, 18:39, Mark Tseng wrote:
> > mtk_ccifreq_target() & mtk_ccifreq_opp_notifier() is re-enter funtion
> > when cpufreq governor is more than one. It should add global mutex to
> > protect OPP , avoid get wrong frequency & voltage.
> 
> I am not sure I understood the problem well. Can you explain clearly
> why the current locking doesn't work with details call chain ?

Ended up replying to the wrong email. This comment is for patch 2/2.

-- 
viresh

