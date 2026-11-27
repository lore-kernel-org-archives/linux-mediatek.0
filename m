Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9360A606A31E
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 01:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Dt8amlnM;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qwkidSyh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-Type
	:References:In-Reply-To:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wUIsqG8/RLQKsMia7zi438qJ97LPDSYrylra1EdJHEY=; b=Dt8amlnMd0FIqq4hf1eodN8c8v
	X++oO3SCt9Z5WQ9qEyxRD+6BOLwzTCT3FsaQ1krk3uOxKxjPxnnrtQ2687tinAQQ55iMnYWV12hzC
	xPgtUFEAmGa9hOaDuOxet9Lw3W2mjFOW/CRHX4IM+78fBkrH57xNMsDm0TssAr5Rub0J9YQV2BS6z
	VlDnKTbzzCnJQ2ToESsG3yJ3x8mN1QGHSiLWAHqN2ddZIsZI6WGMTNMmDur2sBCnB7DGATK4DbeLr
	JFuslhJLv7jAl/RB6hCoWc0f+/V90NeaaGPWMYBhZkG2EKx9sY+luwe0/OwlGlR+glUErMg/dGBkf
	hrqXHeNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWklw-0000000EjXB-180W;
	Fri, 27 Nov 2026 01:29:08 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWklt-0000000EjWE-2wCl
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Nov 2026 01:29:07 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8b2382bf051so4061512b3a.3
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Nov 2026 17:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795742945; x=1796347745; darn=lists.infradead.org;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wUIsqG8/RLQKsMia7zi438qJ97LPDSYrylra1EdJHEY=;
        b=qwkidSyheyG6pgtcJ4HVH8nii7XqC9r/9Md0gvAPuAkdoSUjNfO3ZeZwlUMPm401i7
         CI5Lec/+2qqNCAyY68ohCZcN85uFlvtxXxOZCsLCSz9llpZKrf1GcV9GO2QzNEwqrS7o
         ZUqr9Yz2GU5v7iWmfVVtoYRXmqaz4W71wFTRPhU7qB7ePF8LzVyL+dsY6OSpNUfyFpk6
         hWuK/vjqXyBA0J8BtoIlvptjqV3wgokM5nAvpR2qIiGrsy3gjQpFtLHOSakkWMfaAKfX
         1w3JiDJz7gCE0pX9/kxYK/hGvAiJKbqtakoB4UqGpuRzUdhwfX6quIlmd5nOMkI98lAb
         CRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795742945; x=1796347745;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wUIsqG8/RLQKsMia7zi438qJ97LPDSYrylra1EdJHEY=;
        b=CqxDokYgRUWXpWYHa47jIUNteJiNDt//xwD28rsyH7nRAacVem+fVjTsqwe1/X3P4B
         Yf0tpjrvBwDuCfIj8z8tHNG1RZkFMXnTj2KpyWIzxuAHGAzFjzFoOz1aiRs3nUBZFKYv
         TfRUS89XbEazW0aZKyu5uIK1KJnl4ZJvwNkWM1f9MIwWQr2RM9kLR/g4aaCRer07ENfa
         PKWtBIaKXOfNUI9IbCXovPNCIAuiB7uoqJzMxhbhKr4Sx8Rz+QbaCfFlg9lTOlt2/D7U
         Zmxe1IEFORentGoY68nYKlY112Dw6ZhUa7uGJqLyA7Klf9vCSz4UBr0WlbpqLLfUdyZ3
         s0qw==
X-Forwarded-Encrypted: i=1; AL+hErHBIvf8A88M9AF3URjWuwWAAIQOIZ3zqP8uAKEUAqo29aeMzbJb4NG2v4Yg0xclClsXGWui2t777+IwEd0KfA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/OZ82+RpW2FE+jtmn7zGfxZ/tbnbvRjxKkUNzfvwXCQVAQaep9
	gt2v4jkOJDb+JDguVWh5AyaXOaM+5kFDgFBKRJu1gdKh8wW8zeeDbQtn
X-Gm-Gg: AZFdTZcVdOazZsDYmj9wnddxNt12CZq9BetEhbT1RaPUmQFHSZKKIieJ/swuGw6MCAv
	N18QFzV6aSTpqhViqAQsZsiPvgNcPz7TLNJI+HlQksxFh44gpKc6QzMnIIHw9RhevJpleGatuss
	RvBhAIex0iM7bFdyJL4zNVzG/GEXr1YmVfvpBQDUwoKgVRXAoMxEzW3eVTdPvmc9/xeONe7K3R5
	IOhJOsChpnz3dFrvwrH4extUiR/PPvBVP9RIE1Y7DwgGSA2Lw4CcN+zWlXVBEUwFiPTPG650pwA
	zq1mgRAsMcZVEPzu0bTZDm+FsFE1DMaHgdojUVQqlf4VqMxI9Qqut58/Ifh06LNOfHX8jzRObgY
	/+1JX2Xlxmc2iHCM0xYZzaLuElVYtSyYFOQlFk3N5aJDa8iXbKuqeXVvKI9R0VCj8uZNfYt/NMe
	fh70ugfXM8/V4xOwmrYO7l1YDcLdLIIlQlYIpxGQ6YLsHA71Yh+WM3uUuVpuHA5/2h74l4c4fWN
	OHbnysfGgiD8lsCBZcZbr8o09YV4nznHEuZYhRP1rpCQcccs8tncRGjAstu2R6ekPBkEHW+Bo1E
	3jUUpCiyEekWk/pwhOCF7VFcqlXS8iROmGMKeF9mh/moDdEuf7m0ByTKRPBxhW/N1XLEen5RH8K
	F
X-Received: by 2002:a17:90b:3890:b0:3b3:8094:3221 with SMTP id 98e67ed59e1d1-3b41c981a3cmr21244869a91.59.1795742944639;
        Thu, 26 Nov 2026 17:29:04 -0800 (PST)
Received: from mac.lan (114-45-165-38.dynamic-ip.hinet.net. [114.45.165.38])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c07sm35760912a91.13.2026.11.26.17.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 17:29:04 -0800 (PST)
From: Ilia Snezhkov <iasnezhkov@gmail.com>
To: Roman Vivchar <rva333@protonmail.com>
Cc: broonie@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-spi@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: mt65xx: avoid division by zero when speed_hz is zero
In-Reply-To: <UsigaM3gd0dy3bL2g5S_b22RuZ_wwX5dQycDFYjkyLdeI1wdx_2divHB0qOXJaSQF54AZXolxH84aoupe8F27HQomLvpAuoMWhehxOFk7aM=@protonmail.com>
References: <20261126003314.49090-1-iasnezhkov@gmail.com> <UsigaM3gd0dy3bL2g5S_b22RuZ_wwX5dQycDFYjkyLdeI1wdx_2divHB0qOXJaSQF54AZXolxH84aoupe8F27HQomLvpAuoMWhehxOFk7aM=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 09:29:00 +0800
Message-ID: <179574294061.64665.17856396829842029470@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_172905_887203_7C0918D2 
X-CRM114-Status: UNSURE (   3.52  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 2.2 (++)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-1.9 required=3.0 tests=BAYES_00,CTE_8BIT_MISMATCH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Hi Roman,

Good catch — I missed the second division by mem->spi->max_speed_hz in
mtk_spi_transfer_wait(). Setting host->max_speed_hz = mdata->spi_clk_hz / 2
in mtk_spi_probe() lets the SPI core populate spi->max_speed_hz,
xfer->speed_hz, and op->max_freq across all paths cleanly.

I will respin v2 with that approach and move the AI note below ---.

Best regards,
Ilia

