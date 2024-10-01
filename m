Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026CDCEB2FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 06:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZZ9vGNAt5u/4C0MxsgZzleHQqz1x9Kb0YcmVd2T7II=; b=zQFdRe43ITejW7NiifGCBkO44u
	9TmoblK93b+Mms5sRMzmIjVC+MuLQN9s2Pry7yIogXiXFWpnKgGR9gPT7RFoAMrjHCmJKkOn16rn5
	CNefWw6A+9wOfld6uEdf8YYbcoce9bB1uowCrIENoQqRxneKmJVCK/yuPjR6gZdqDfW7BUfpq1fS2
	C6IzFi0bgUxFpjWpVQDR4QmNF2IE8HwnzTnz4uzdmdRXh383Zqj4ftE09GgvAolCh26UlJuyQVMaO
	V/TIx6UmRgNCC1xI/7iLzVaEA7ImceuG/n0G/Ah7cQRGvHvEzZOECy+ZmDTX79hN/Go96PNEhlJUt
	6Or0vExg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svWYq-00000001mfY-0BxO;
	Tue, 01 Oct 2024 06:40:40 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svWXa-00000001mXx-3nq2
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Oct 2024 06:39:24 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-20b5affde14so21150045ad.3
        for <linux-mediatek@lists.infradead.org>; Mon, 30 Sep 2024 23:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727764762; x=1728369562; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SZZ9vGNAt5u/4C0MxsgZzleHQqz1x9Kb0YcmVd2T7II=;
        b=OiuGgD4CokAJe+LlpgVgRClxlrkCVL6CNamfd6aZruImxUaqkZwcO+OXjlU0nI9HcE
         igsFCWAyl21e07mKFvzVSPqXn0pmPg8TSk3BAnZVFI2KPzhTvZxYL8h9Fl9xcRE+Fvff
         RdICFbDtCQW4yJpf1fQWpxjoF2uj9IxiF/8AHWk8pwSaRJiu3AdYwf1NewnAg3GpNlAC
         kNiTnZNkA9Gc4YAGzatf3Wqnz01MAcgbQC7OFrQNpEGxv6C1xucshT5UQTSmA7A40rit
         Ezg11KJT/UMByV2aQ9Vnh1od8UuRC0YKPXrTb1xynCXhOGdA/iNnTUX2a5eyM8Mu+1N8
         bYng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727764762; x=1728369562;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZZ9vGNAt5u/4C0MxsgZzleHQqz1x9Kb0YcmVd2T7II=;
        b=N7jzCx3ZP1RMfU2t5UZMhagT1KVmnpMqe7ef6cFNuLiea+pQx2wqBAeRlcxligiGHq
         /EqHkbe9rLa2uKtcVyMNPttypBDj1KWlHFgxtGSaMULedst+Au6+IQ+we4l6vpbMSFY6
         VsnWSCmE8maiEU5gR/FDOel794OjFrGM6oRgKYUAsRFua5/YuN/RsoniGF22awYgXUm7
         tN7Y01q0o6kW5yQX1xeWBS6rx6Z9zlwCcZvmTQ0+3gFe3mvgks2Dp9DI8OH+Qs2ROauw
         ZKeUSyrTIkrPvUa3PVjxPdFs4f5fAbCEQ/ZeZH0Zh5rDcLohgNJ/tXJcTA+Qyek6P6hi
         IPYg==
X-Forwarded-Encrypted: i=1; AJvYcCWRySrdUgeMz46uUvWFO2aOs3qeQzV06I4DAg50LwKx6/Ix6VTiI7crXNFw9Pq8nKRmlfrdUPAcQi7oceaL5g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxquLo9tKHqPZwcQzTpgsn83P28GSX351gO++0hzBqfst7TWS5M
	Y9yCEtROr7HL4USYHLdr1HpdrHxm0H9geMGT6GkBPi+/b/q7fyfN27zKnSr2Mqo=
X-Google-Smtp-Source: AGHT+IEOWqZzG8Ei19f42OBORnd3BwYUOQNDduKM+xXWWDwe/VJfk5IdBqLsuddvXismy7R+pVb62A==
X-Received: by 2002:a17:903:2445:b0:20b:6624:70a7 with SMTP id d9443c01a7336-20b66247298mr134389545ad.21.1727764761891;
        Mon, 30 Sep 2024 23:39:21 -0700 (PDT)
Received: from localhost ([122.172.83.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e4d67esm63482095ad.229.2024.09.30.23.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 23:39:21 -0700 (PDT)
Date: Tue, 1 Oct 2024 12:09:19 +0530
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
Message-ID: <20241001063919.ekqfd4epcefh5eci@vireshk-i7>
References: <20240913103933.30895-1-chun-jen.tseng@mediatek.com>
 <20240913103933.30895-2-chun-jen.tseng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913103933.30895-2-chun-jen.tseng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_233922_974485_B7307A53 
X-CRM114-Status: UNSURE (   8.82  )
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

On 13-09-24, 18:39, Mark Tseng wrote:
> mtk_ccifreq_target() & mtk_ccifreq_opp_notifier() is re-enter funtion
> when cpufreq governor is more than one. It should add global mutex to
> protect OPP , avoid get wrong frequency & voltage.

I am not sure I understood the problem well. Can you explain clearly
why the current locking doesn't work with details call chain ?

-- 
viresh

