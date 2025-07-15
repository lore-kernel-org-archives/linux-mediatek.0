Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 401ECC83F17
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jul 2025 11:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ZsnxPQOlzjyNW6a1iVcFG50PC2MlOpTArybpzvfKj8=; b=UlBivie+D+ESZDtMpHsj0Q39pb
	BghUFkq0Hj5pY/rP/vs0hGd+UVFNrkFMDJHs6jXQ9EtBMVrn0gO0U3nQhNR8J/pgzdUF1ZDEXn2nd
	YZ3bxnmMOqzjyalXoxOeUBxw475A4/RRyMAAAlGK1VHlKqcHu0+vTUybir/jnlgK44ZhT8fDL+mpi
	vEARWS2LJ8+mJxcLCoJoFbJ52rN8w1g7uPlbLj/9aVkK+CRcbfwYmIfLagR06YearYux4VeXyzTKe
	ttR2gVFk7DHTLy4gl4tEnbLiSz/J6qmzifmvMxLFGV/GawDyIF15t8wwyJTL7pF1uF2v921rFmTi3
	Ol0eK96w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ube8X-00000004yt7-2I4i;
	Tue, 15 Jul 2025 11:47:53 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubdst-00000004x0w-2Kk2
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Jul 2025 11:31:45 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso38989675e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Jul 2025 04:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752579102; x=1753183902; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5ZsnxPQOlzjyNW6a1iVcFG50PC2MlOpTArybpzvfKj8=;
        b=Rsv0XhbGnV140uTOHphDYPc1WJQMmo6Ruz8cWt+nOiu6HnzrGv7R11389nTHUa/kRl
         5uu9woV/8uqZ80VDMEkcDLsFUH1BNdA6gi5DPjJjmkBBneWsNYjLGs/FKqujA2cix/6/
         jz63Bbgtery0QjMn2y6rBOsV+qnQehSBDa9ISeze8+0abPwpOzkbv/ddKURiIJM1mIpN
         VCELavDuKmS97ETP7yMhW7mVFUhx5m3SUd2pPty+pbLXZE3JErvN2EZuIdUUHlNtPTDl
         izPVNZlbH5MdOW4XSAddcyeWmtFpVWvjNN4ggYbSx9rTWbzsUQhbE5AKkaFGj9TLPkvP
         bJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752579102; x=1753183902;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZsnxPQOlzjyNW6a1iVcFG50PC2MlOpTArybpzvfKj8=;
        b=rUx6DishZQMO/gej0HanVH99banD78DyLu6OwLvhbFFy0n1VW3o8rNtorGeKbaOt/J
         cjEPX8Z4Y8JYRrv7qrK3XwZT8K3u033LCXUeGTa7HJInjU3kebVUiu9JtK7bxCubG0Q0
         hw57Nmg2Hh/1MaDV6XURUuKY/QkBFrL3UaTHGifUi7rbzyNRhIdN4jq9LDha+dhaRpMC
         uKwCs+9m3dfPozs/o1etsQjJBJeXx5XnJS/Bg+PidxmEBkOu0SMuBUavGZe/zYn9mOuZ
         NcHrtrsf5UYvoigcCH8Bt9aj0gYfMfSMOy7GZY7YQyD4Hgafy4Jr9BY0LmpZv4RNBS3l
         AC6A==
X-Forwarded-Encrypted: i=1; AJvYcCV+UDswR7wUCvR5kYpXJsbz1QYJk4sTEpmSMCN5mm/ds4eed/ue9iI4D+i/66bkOGQ2XR2UvQFN0NJ81gcNWg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwiuTvMf0wrbFokzmXqtWok/tAz5Su68SBKYaYnzHGO/T6zKDfG
	Tu2oS23xHlrDUvB3L8wwXiSfptjShBkoMJmli5ODEZN56107GYcXXEyy//0i/tSqQxw=
X-Gm-Gg: ASbGncuGEJekcTg26hoIzTEZQua+Wb0tJuA1hiBmajcopButLjUlOoimZA6pcLdeuJj
	vTYNgQO1JIS9YytlSOPcWv9Id1ARvgzZg4cGeZRwlUAfT67vWpFAByejZz72m0SXb7rvED37LFJ
	O5eE6orepdDB1qokCDVke/z9FcSmxoDeR3z9BCOGQ0JmITM5tY0O5T5FPZ/ZaB3xjyO0swshIUS
	3kZUtJPQaSO4flvB61zZnX8/xa9iwDkTls7raP2vHZQiUj+CQiKhkwAisJx3QRT+RKLFRDRhKmT
	uZSsEeZ903peJ2dUAHgWoo3AeHU98rl96SIY4b/Jm6cy6q7IRvUR/fsGk08iUjBVrZEJ6FROJEd
	m8cuegjdnB2enqIjPh3hYayayXfm+WXSkvOCOuYrGRG8HJsKweQJ13vs23jcX
X-Google-Smtp-Source: AGHT+IEKhxXOiGy+rRPRZDHvcFkEUJsQ0d14+0tBKDdlW4a1Tc6Bru+r7zuXvqC8THzAs7ZRIPDvKg==
X-Received: by 2002:a05:6000:1446:b0:3a5:2465:c0c8 with SMTP id ffacd0b85a97d-3b5f187a4b4mr14608177f8f.7.1752579101919;
        Tue, 15 Jul 2025 04:31:41 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc2025sm15173960f8f.31.2025.07.15.04.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 04:31:41 -0700 (PDT)
Date: Tue, 15 Jul 2025 13:31:39 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, qii.wang@mediatek.com,
	andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	gregkh@linuxfoundation.org, jirislaby@kernel.org,
	tglx@linutronix.de, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH 1/3] dt-bindings: timer: mediatek,timer: Add MediaTek
 MT8196 compatible
Message-ID: <aHY8Gyo5uy8P6VP1@mai.linaro.org>
References: <20250611110800.458164-1-angelogioacchino.delregno@collabora.com>
 <20250611110800.458164-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250611110800.458164-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_043143_596124_598E3E5E 
X-CRM114-Status: UNSURE (   8.53  )
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

On Wed, Jun 11, 2025 at 01:07:58PM +0200, AngeloGioacchino Del Regno wrote:
> Add a new compatible for the MediaTek MT8196 SoC, fully compatible
> with MT6765.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Applied patch 1/3, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

