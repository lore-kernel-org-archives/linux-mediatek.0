Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8679606A32E
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2026 01:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B0Rb3Umq;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H0QcrRIY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ezGP1Yonno3ZtROnLi8FLhe0PdCDx+ACf/Q9hTx5uuM=; b=B0Rb3UmqjLoK4qzx8mrbh41Xh0
	4MbNBZMPxC+CtPM3jmr1IVPwhmS9K3No4bs06mLaTVFwEcTINJOg/v5okXpai8sGxFMPPQuGowkYu
	vGu4sLUKe7FKfXMDtz/EEM107W+LlYLTtV1e+/aT0UMr42OEG7dlUQ5vORyZWiafnKY4j4Wuw1kSr
	zC8ygOz4geknPFM6wO+s9E9jmtJR1aQCPyJQ83FXEai3I3RzUalM8Sdhc2hHkPQU7Kt6I6ZJkthHT
	bFunzUk6Oxrw+5BBvUcCzamoEtLNgipwXaK+36NX5LPUVhkbtJmrlIGQ31UgftXhgqytCREQN7wRA
	HnuoWIsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIyxq-00000008eaH-0WFF;
	Tue, 20 Oct 2026 01:48:30 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIyxn-00000008eZS-3yfB
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Oct 2026 01:48:28 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-354ba08cfd1so4957835eec.1
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Oct 2026 18:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460907; x=1793065707; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ezGP1Yonno3ZtROnLi8FLhe0PdCDx+ACf/Q9hTx5uuM=;
        b=H0QcrRIYuQwghjBhk+C1IjDU9k/GmD3acxRiE0dF2aAHa5rmalvNnVnvV5neHNAnju
         OpgVyCd9LLgl1DtU2c+Z1ilXn9UF3TQ2/NcAQnwSj+eDG7iYjQSdcDTv5pDI315yPvU3
         D0BqIJ42f/RIk58NOcmdFHx25WlZEh+UsvnYoB7ZQ6AhflxfCwVYHrEt9pH48Iv85Bz0
         Jhie+yzRc09OZ1NG/KjKnVmpvn8UWP5EGxk7bnDkcpm1ygElogrB25pWWS7VdFWoAwbf
         wKAxZkEEGzNX6/qsKo7id2HjkMD9Q8KjbZBOKwL5y+Y1HxcOiViXAY6XCisVB8DBp6v1
         yz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460907; x=1793065707;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ezGP1Yonno3ZtROnLi8FLhe0PdCDx+ACf/Q9hTx5uuM=;
        b=B88d6082EEmViAWbTCEQMQTVt18CZx3AEAi3JVuBT6YY8DOzjVk5e4aeeqkFpNjWes
         JqMUc5yUZA0eGdRxFChf6MEqMlg8iwiPDT/A1VGk1obQ/76enNOmrxFOAE/bZYA2jCUv
         sRmFqjJM2byNfaLIRxk8Ni1i3X8CVj9CrQW6fNMfNC55j99hTw81vwykzAP0DTVqwYbF
         HVSEVLCNbi+S7/LB0TjRqp13uVG9V7mxzPVgYA4gEc/fWMQlMWINtGPtmgct7AouhNLa
         tJOQUPC4pAWqcTH3v2LaW/rS5+29//3FT4LE3SboZpFTsSyr3HW+gX3iUaj7fD1GzVCU
         d9PA==
X-Forwarded-Encrypted: i=1; AKwUvBz+bRJlV1oE/Q4prcBZ22nC7diYk2y962MH3eC2/fcsck+2gmFHcaZHPESkwAN/FI3q3OdIAD8K3x/67Yf17g==@lists.infradead.org
X-Gm-Message-State: AFq9FYLIwydahOW4L05103n6eDSayvlRqYKZsj6b5QG1I7ZSwOcPcSrw
	Tn4rfgHxqzxQEiJUrCZjHbIcHwlLZVQdKEVTn7csXLI/hhmATap/bCbk
X-Gm-Gg: AYBFou36mmDNDhTX08xOXbWou5NNbV5r2PUs8Aggj9QQhHlRdmVWfoVv18l2mVkgvNZ
	yHhyYwD2jTjj/rMf4fQye+i2MrDFggqTr0dY3V1yO1M++6mVocB67bHvTUMuHPlhizn3+YExBXe
	I2JYCMk6bXqnFGz5Kjqk0L4K6+dJxPyit8LrBtR3nu2o2R+rV70MtlItuVbyic0IFVIc08YxB/L
	EI57edrvSmvdUMpAOEDUkMiYFiQyDfsY48PeKMzT0aOrayqfiZaIVerZzAq0eeN3SK0baQkvLZl
	EFf24AJGCh5gokGHsB0OPVJwrgBwNc2rg1rtqyoy3Ls4yOuFO8p7tZBYlfTqMDQgf9ObndI4ZPB
	tRtCQ+IKO6t1oiSjdyCcGguUbEPi5Sgr7p3+RmRk8Ycc57cLhIbpTm6+ZSo1hmXceB+adjIJYss
	nmWZwLoMFziIcrGI9QJFBgAeROMawMhyy9lC57geXqsS7LcjXeXfHVbxwvp1D0trwpXlU28y36C
	L8VSIUNyYN8
X-Received: by 2002:a05:7023:c087:b0:156:3684:96d4 with SMTP id a92af1059eb24-1851238b5e7mr13733617c88.25.1792460907214;
        Mon, 19 Oct 2026 18:48:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b37ce3fsm28699903c88.14.2026.10.19.18.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:48:26 -0700 (PDT)
Date: Mon, 19 Oct 2026 18:48:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 2/3] watchdog: mediatek: add MT7629 reset controller
 support
Message-ID: <4606c758-16ca-4fca-9a0c-babf15643b49@roeck-us.net>
References: <20260926-b4-mt7629-toprgu-v1-0-c124bf9ac273@gmail.com>
 <20260926-b4-mt7629-toprgu-v1-2-c124bf9ac273@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926-b4-mt7629-toprgu-v1-2-c124bf9ac273@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_184827_985229_980B06CA 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.5 (-)
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Sep 26, 2026 at 07:14:00PM +0800, Chuanhong Guo wrote:
> MT7629 currently matches the MT6589 fallback, which exposes reset IDs
> 0 through 11. The MT7629 CONN_MCU reset is at bit 12 of the SWSYSRST
> register and cannot be requested through this fallback.
> 
> Add MT7629 match data with 13 reset IDs to cover the CONN_MCU reset.
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>

Applied.

Thanks,
Guenter

