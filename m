Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B04C0CFA466
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Nov 2025 02:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XHhGackeQZNLcCor96DwGxo3AqRJ51Bn6ZLuvQL8wF8=; b=lA7+A+WaSNDNrTMYiGjBHxs2dd
	BOQhhzaEThxDrEI1GZcwBS+/7633mXF9KASH//zZd/3LGrT1LFE8xcsRJro15IuHR9fNXsekbKPw2
	MLPgXZiYpUHHcvRl31kEnPXB5Uih5AozkJkZfB80VufVZ/ErmUxB1PdohErm2+Y3iCu/b6FCpMFUB
	cLq4kUtfRqAWs2d+wlCTGAu/ynFvJfLjcciB9xQSHqI91ETU8dLVaAhu0n3mH8qZnp2YgBNvf0CWo
	IkrXF8CkPk9s+BDjvearu/AhohII9JCT7xtcrnWXNGQGVwQecYZrvNakUWt7eExzlVs/JMwEpU2UG
	ckWqOCRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMGSF-00000007fIN-3Jyh;
	Fri, 21 Nov 2025 02:00:56 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMGSD-00000007fGh-1fJ4
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Nov 2025 02:00:54 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-640b0639dabso2611797a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Nov 2025 18:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763690451; x=1764295251; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XHhGackeQZNLcCor96DwGxo3AqRJ51Bn6ZLuvQL8wF8=;
        b=ehumOpLqCLLoJo7C7GU1byxmoBl0wS2+EpSdVAqYWuLR9mhxMTIk7VweIgHgDVb4BQ
         5HlaQ2oKZzvBpBnNGSCozoRZzVXsXXByMEnuNZ79DsB8GiADIp56Qf6+pSK6p+xrfFpm
         xu1CK5Ipi2ZIL/YACkHFHZelH7c7zqlDXnJ4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763690451; x=1764295251;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XHhGackeQZNLcCor96DwGxo3AqRJ51Bn6ZLuvQL8wF8=;
        b=KsJviLVHTLlCLflYSu+DaFib1T6cNQGOtMRmJXwsdBFZKshGzNm/CJogoPKb+AS4IE
         AjbXGpT/yvSn2+caBCVljYRV6WGCDeik6czabWLCVCRe8l/Gp/kDDRUH1Q0xWEIw7ixf
         k6sPLzf73E97WMOscJa+vqGOMlvkCKx11T62lddoUcRZXzM1ivtBbQGro6U/RhfRX2qQ
         xV0ptWztzgk7b5tJyJqlvQgOAtGjPNeuPxrzSo5YRB+8mNbR4JHK4JdZWDvOU/5+oPjD
         pBVd+sg/IEI5B2e50O3NkRiabM/GS+Llz7MCDzs0AfXKY+6cRAUwVRd67GNWRK+enGBG
         DZdg==
X-Forwarded-Encrypted: i=1; AJvYcCW5aCiBosCbG3IY4H57FlZo3BFfzl2QR2nrCtSnm/Du/zdqsZbp9pTG4UDwGDFnHLD5m8gG40dhqyWPHq22tw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7OGmo6o/knUclcHt7p5sbm9IIMrqXmOjo6j9sBBxMewLaFRwY
	4lxDWXkfxus15SdZQfPzpXYdaas0T1FRJ5Qu9JbqtWp4GlyYdS5pgYnZJF8abvO5CsvU1gb/sxi
	nSDEvmEjxMMQ=
X-Gm-Gg: ASbGncvoJ5xj2bt0GNGbv9dcyIAPqHffAwJJNuV8bNj0s979wWhD+Jrhm8MrmtlWw3/
	lcr0L/VjhpPqaVTRegcjRBYEk3tjNwC+ghinCFj7vBLnvqMiLU+r6Kp1udGA/DraBMchVIwSego
	KElTMaUijCvybqkHlxYyX9386fvVj1atLNgEDP2HicK0Lh9TxTqdclDfuoXNrIxB+0D+RpBrrMF
	ANVg8mah35P9YRjc2SOTyaIP+YLVBwI3znmQn+lM2Ebz/+poKT6nJgvdoR4t+pr9am0WlsYoKXt
	Xtm0cOcWJJgzjqJfRqU3MmbxNOxpJJXwsCTgCh9PUmyefdh+jOGq5ni3nt/eoTSgyOyru+Hg3FB
	G+HUnykB52BPfDQZ+EUanZXQ9qdyByNLfp/sePCXmoGbWawSUAQE5EUGg9ckEcFl6ssuOYmSUwd
	7jF1/Mppa2MsZVz9O4Phvy5P6c3Cp+MCVitbJy2RW3sezk8A==
X-Google-Smtp-Source: AGHT+IH7EqLkzKkAHBlsVzP293avS9x1Qd0LV7EGawGoHDNjEvmIhI8qLiQmVmFE6RUgO9dT3kDitQ==
X-Received: by 2002:a05:6402:210d:b0:640:ebca:e682 with SMTP id 4fb4d7f45d1cf-64554674c2bmr658934a12.21.1763690450948;
        Thu, 20 Nov 2025 18:00:50 -0800 (PST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-645363b6012sm3374250a12.12.2025.11.20.18.00.49
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 18:00:50 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b7633027cb2so284297366b.1
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Nov 2025 18:00:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUfFWpS6ge7RF1kBRB7Pgd0MHcWRjX/DMpJoUdJqBnl7NRySh6AUsjH3c6Ww8QHdKLTJ1gLjD9roCM1oiUWlA==@lists.infradead.org
X-Received: by 2002:a17:906:fe47:b0:b76:2667:7717 with SMTP id
 a640c23a62f3a-b76718ab19cmr45430066b.56.1763690448985; Thu, 20 Nov 2025
 18:00:48 -0800 (PST)
MIME-Version: 1.0
References: <19ec8e4465142e774f17801025accd0ae2214092.1763465933.git.quan.zhou@mediatek.com>
In-Reply-To: <19ec8e4465142e774f17801025accd0ae2214092.1763465933.git.quan.zhou@mediatek.com>
From: David Ruth <druth@chromium.org>
Date: Thu, 20 Nov 2025 21:00:10 -0500
X-Gmail-Original-Message-ID: <CAKHmtrRHzPu86EChf26bjtS5MhBr43HMy0HZuz-CbxG9xnckLQ@mail.gmail.com>
X-Gm-Features: AWmQ_bldX_c3C0xpRYDcjXcT6aDbcuq45-EF31DVWmvsk1MZZXs7zq5Cuc5QVr0
Message-ID: <CAKHmtrRHzPu86EChf26bjtS5MhBr43HMy0HZuz-CbxG9xnckLQ@mail.gmail.com>
Subject: Re: [patch] wifi: mt76: fix wifi init fail by setting MCU_RUNNING
 state after CLC load
To: Quan Zhou <quan.zhou@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
	Deren Wu <Deren.Wu@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, 
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, Allan Wang <allan.wang@mediatek.com>, 
	KM Lin <km.lin@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, 
	Shengxi Xu <shengxi.xu@mediatek.com>, Eric-SY Chang <Eric-SY.Chang@mediatek.com>, 
	CH Yeh <ch.yeh@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, 
	linux-wireless <linux-wireless@vger.kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_180053_473250_4C9280FE 
X-CRM114-Status: UNSURE (   5.71  )
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

Please add a FIXES tag. It's clear that this fixes a race condition,
and likely should be back ported to when the race condition was
introduced. I think the error was introduced in [v3] wifi: mt76:
mt7921: introduce Country Location Control support:
https://patchwork.kernel.org/project/linux-wireless/patch/5ee00f581cc108b606656a9e7cdfe32e47c0b6bb.1662549232.git.deren.wu@mediatek.com/.
Otherwise, LGTM.

Reviewed-by: druth@chromium.org

