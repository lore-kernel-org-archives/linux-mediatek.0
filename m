Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25FFC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Oct 2022 10:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2FNH5XGwulbmy7DN88MzDK1w46G3Joqy50v9SsajFjg=; b=nncsKN0/ewn5MyQCntEn2HE9vA
	qTRl8SpkXFgsQYES1azZeVVpaAtRI4n6EB/Dg193wyo5uWcMdAPXCQWECkqYu+G7LW0NaYvZMoof7
	nxyFlSW07ArC6i/iszMwNb7c8l6vrX5m8dUqW5Sn7QURPxZzFGKu3V3dF+yvHYrgVo+9m+oqRmu4B
	rP2hByvJ4BJjrkHu4C4vuTR9+zweUgKeb1t/Bv7CPFSJevfMjdZYqaX0qqA1x0tiMVjUUQP8DZjKR
	tRm51is9o3dTDgiIUQ27mChj8U8b9BJSKoXcFAehp9p/LDppWOI3uMQidmoaWVLD3qlE57Nllrpwd
	tSp54mXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiYqC-007dET-Df; Wed, 12 Oct 2022 10:19:56 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiYq9-007dCo-Dz
	for linux-mediatek@lists.infradead.org; Wed, 12 Oct 2022 10:19:54 +0000
Received: by mail-wr1-x430.google.com with SMTP id u10so25559143wrq.2
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Oct 2022 03:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2FNH5XGwulbmy7DN88MzDK1w46G3Joqy50v9SsajFjg=;
        b=KQhcKkZ7B1AVROrjaEN4Bgeir4PYDD3k6K0Fw3hcWFG4Rjadfgcok5jHmecsIP9IfI
         iv7RZhlz2NCkVBaeApx1jxmIE6xiEE9iS3Q6tv82zfw6Sib9OEB/B4kW9OQYPw7muHxR
         L7PEmfN7Mp/1MEVYajBEHVpu3D8nxA3bQrsuFC36Zq6TaW8HYzgfJpn278bjZDOmL2ho
         j9phH5HEqCBhEW3R5GJWKtYLX5dksNPFNTqf5mHPyVTH23meVo/NZRXViycBOLKatcmG
         K7V5ZSeOrbaDd46GizWNP1ERqlt3h8Ggjtlo+h4TShvIsWJX82XTHYfYGKdxQWWi88Vy
         WEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2FNH5XGwulbmy7DN88MzDK1w46G3Joqy50v9SsajFjg=;
        b=3tCHPo4nPYNGq2orFDTlNxINVGW5CZGLbHW+Rsztm9lgze/QJ+kq2zyGBJ29AWByG9
         MNKuFvF5IHAVEMJeLpHVVy+tdLm3ySWvgEjlSWVWz63Walx8YER9mcwvkRmCgoCuZOqc
         6z2d9BeSk+9QbgiXeT8Iy0dVUeyPyQvpk47ECosTJbkXXwbWv6h9RarkcS7lqRBcvJYv
         G8Zm+FFRf42wBe5faeyU+O77Uh9d5c8MxHi9ifS+XSkIp+29FQN4xYa/olQUP4OoTG2a
         S+1rF+2pIHFPmaSwun28YV2S4+m6ok7/BCf8UgtPgib8w4XZLlquTZb6/C6/2pvZS1eK
         FbQw==
X-Gm-Message-State: ACrzQf1sYgf7neMjZoIerVqCoXISTTvoaXsdex5ozozYV5vTZDYZIyBO
	NnSUP4+pfPxjbWkHCZtKYB8Esw==
X-Google-Smtp-Source: AMsMyM6ucvyrxvhZbOWUJypJtM0d7s+0JtdRw4rT9jvREGBJ4kDLqezLV/AX97hNX2wfLvndoAt8sg==
X-Received: by 2002:a5d:6d02:0:b0:232:4070:6026 with SMTP id e2-20020a5d6d02000000b0023240706026mr739456wrq.33.1665569990813;
        Wed, 12 Oct 2022 03:19:50 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id s2-20020a5d6a82000000b0022cd27bc8c1sm17016048wru.9.2022.10.12.03.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 03:19:50 -0700 (PDT)
Date: Wed, 12 Oct 2022 11:19:48 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 3/7] gpiolib: of: add quirk for locating reset lines with
 legacy bindings
Message-ID: <Y0aUxD/te6RAy1nk@maple.lan>
References: <20221011-gpiolib-quirks-v1-0-e01d9d3e7b29@gmail.com>
 <20221011-gpiolib-quirks-v1-3-e01d9d3e7b29@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221011-gpiolib-quirks-v1-3-e01d9d3e7b29@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_031953_503553_F8CC4D25 
X-CRM114-Status: UNSURE (   8.48  )
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

On Tue, Oct 11, 2022 at 03:19:31PM -0700, Dmitry Torokhov wrote:
> Some legacy mappings used "gpio[s]-reset" instead of "reset-gpios",
> add a quirk so that gpiod API will still work on unmodified DTSes.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

