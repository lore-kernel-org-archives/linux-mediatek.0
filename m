Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16FB606A322
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2026 11:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Pq6vJpEN;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bfTYF8yk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/TXd5dPmQW/FdjoYQcFG1PodSXgdJZsvkRdQUDNsOjE=; b=Pq6vJpENb2/+rd
	K6mwOZKpullK7hG3DQ100p4HRqIhxvhYBGGkJp0NCEuApeEYQVSqfos9poWjxM9Ydi2Q6YL9gqING
	ip449Zllm5rKl/pRDaaZNe5h4gpnBInZGepnGkEvh7BamO+lr4aivVd5cgZZ4nK1XrUXSb5OTT+9U
	FzVC6jIQgcP9mtsyurVmVYh0TsB0iTEINsdugd1XPmpuCWJDbVGNxMXAjt4qVh72QYzE8dfzcTi0o
	vBFp/GcaP2niEAFW40AYm4WSQ5eYtXLAw7dW9B25ADyLTW6HV/UlGe4Yj9CRzck2UAwxyFwPcLTLN
	HEISaUG3ryAdfMGfQPIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJrKV-0000000E2CD-1315;
	Thu, 22 Oct 2026 11:51:32 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJrKR-0000000E2AN-3oIU
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Oct 2026 11:51:29 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48afbd2c386so1203760f8f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Oct 2026 04:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792669885; x=1793274685; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/TXd5dPmQW/FdjoYQcFG1PodSXgdJZsvkRdQUDNsOjE=;
        b=bfTYF8ykGgxZKSphZBaMKhqTmdSZBzCCZw0TyfTfRtu5Tu1tHcO0+wTT3fPuar848o
         Xp1kTzHnvs/pT2ysHnLHlcNBowjEkjEvDRdoX4Of/qU6T1B/xNTSjm9Tyo6Doppg9cTs
         e9eorlHC0CisaM0j0M5TNbYjuswj1cJ0P3JXppeUxvyVAmkTYzs5rZlte0PZtFrJu81k
         awIFV0VhOoZ3RqVGB9J+mCFtupctdaUg/6snA+WcpH0Q8G8WhuKJIKQjEzvWG7npJJ0v
         1aMy7UiZHx3Zt8eHMS8fIEqyqUyd3QxE8nJX0nIiZisq/+ci5WBkkMdtNfHFbf17ybD1
         Up1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792669885; x=1793274685;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/TXd5dPmQW/FdjoYQcFG1PodSXgdJZsvkRdQUDNsOjE=;
        b=z+SDddHcQxfrEtNjGrnLicvBsgaKlCR61vYyfod/NLDDSf8dJ4KLALNWYzKAAK2fYz
         WicDJhhWDlRob5C/jvlvn8tTkgfOBikRA2NRJI785gnL9Dx5+nONh3yqZXONUsQBkprF
         8Aee1dwQW5q6krrSCizR6Uq7WuVMWHZ7h/M8CM9JNqxmxvj8fmEYd4QduXnzKbidpJIo
         2VoXzB+Dk5IYUYUlhdWwMTDY4fXcxW1lcuts8uTBG6ZKWo5xq+sFuocP068NBaElJvpK
         Z1i2EraSE4Hq73MoNiMxUvoLTIhyB2ZJKRBHrJvqvrrOzwIKqWcM+CL0RYVskK9oTjbl
         RXRg==
X-Forwarded-Encrypted: i=1; AKwUvBzheuJXxKEOo4O3jzVY7IpgEKYZdgTA9BDkM39AOerzr5T9NM/N3T01qRVngtymSPLt65nudyLszwjd+OWifA==@lists.infradead.org
X-Gm-Message-State: AFq9FYLpPPmq3rfOtxcX3IXmFsTGbEPZme+yF4vA0kQv8c4Jrn5cNhyB
	82di+Mxp73tgJdZqkc2g/wB3QMBLo5DD1wtKwt4mys46xr92W3v73YKc
X-Gm-Gg: AYBFou2yub6fGaj55tP8mfT0HNpK2sG+w5Ndwz5jZG/v+0Q36VF3p9r/ievLq5t278V
	MeFzZ+JaSRGlzyTLob4Tlcgvc1fHu3oqkFj8+MlH9WQ6hO6v0/QtEQp1GBKok4ZfY0/BTCvvMY3
	4gTzxF7/RQ/UptXX9n5pqOCajVUjYqWzjL8qI6TEt3IflzThDuPdj26zBrzCx3dCSaNW5Y61xKC
	Y9DkMFxdhxJ54R2KkGgNsp2pYVkbA0QK0dcxPtSdYh6kTGFUqrHsZuk/47muaqij8DoY1Bm5j/w
	c6s2eYJHsINNlJRmhGM/OhF0v+kAN0+emTs41D0G/1qFbHemUS5hDQtOpFo4Eas56qZtPPkJdt0
	XLlA7uFuKsuJPgzXVoPxrXjThd21QaSxaHjTcDGzX5xJn597iW7BUoFh3nPihQGMWS5PAnl8WjL
	xjF2q241v/ISVWsFKlb3o2MylhhJ1Maf281+KJ+YCN54ESVjx3jlvsusPwRrp3aH7flmJJJmJPa
	giTD1MU2rzJx8YgY0vmigwZ3DxGJICsAOJ086A0gWIkn4XcjRa6lQyThdK9ERbvzsDf3LaTGSsc
	ZfCdJB6hsdE1eHcx
X-Received: by 2002:a05:6000:1864:b0:48d:f4b2:b29d with SMTP id ffacd0b85a97d-48e264e8a10mr10554202f8f.53.1792669884742;
        Thu, 22 Oct 2026 04:51:24 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254f0bc2sm11722358f8f.1.2026.10.22.04.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:51:24 -0700 (PDT)
Date: Thu, 22 Oct 2026 12:51:22 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ninad Naik <ninadnaik07@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: mtk-snfi: use min() in mtk_snand_read_page_cache()
Message-ID: <20261022125122.75a0d528@pumpkin>
In-Reply-To: <20261022102020.107609-1-ninadnaik07@gmail.com>
References: <20261022102020.107609-1-ninadnaik07@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_045128_327057_6B4BE8C9 
X-CRM114-Status: GOOD (  17.13  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 22 Oct 2026 15:50:20 +0530
Ninad Naik <ninadnaik07@gmail.com> wrote:

> Replace the ternary case with min() to pick the smaller of cap_len and
> req_left.
> No functional change intended. Compile tested only.
> Found using Coccinelle.
> 
> Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
> ---
>  drivers/spi/spi-mtk-snfi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-mtk-snfi.c b/drivers/spi/spi-mtk-snfi.c
> index 6e96e50fedad..bbb65a21a684 100644
> --- a/drivers/spi/spi-mtk-snfi.c
> +++ b/drivers/spi/spi-mtk-snfi.c
> @@ -1017,7 +1017,7 @@ static int mtk_snand_read_page_cache(struct mtk_snand *snf,
>  			if (req_left)
>  				memcpy(op->data.buf.in + snf->nfi_cfg.page_size,
>  				       buf_fdm,
> -				       cap_len < req_left ? cap_len : req_left);
> +				       min(cap_len, req_left));

If you are going to do that then join the lines.

David

>  		} else if (rd_offset < snf->buf_len) {
>  			u32 cap_len = snf->buf_len - rd_offset;
>  


