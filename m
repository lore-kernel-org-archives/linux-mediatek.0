Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC52C83F07
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jul 2025 10:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WCkV6gDGOoOMF8igB/5H1As4Qg7c4viJIZ8RBw36e10=; b=Al64OtEX5EuHzlXElLJVLeZ/pL
	LsfE2w6dzz2xb4ub+uBooFcOfuA9SujoWWFVMmKBhzqXp0QAxBcHgbnm6GYCjMpsIyxcKy3q3KwSe
	mzR6elgfYl0uCnTW/R8IgasxZ3qkCABRwXcLe3Ig80x4Yyvd+UhI6tpKiLBffoCTnzZEmbP6XugGb
	6L24ui3NXc83pFbX0osxkRtqJDj5/WzfTHo10HX8fDPVTVs4A9Bt6F3Gmi98e8X/PkAC5WSKK8bmK
	KDAhducE6p6Rujx4N291kdtakKMo7lm3AkRJCnguh/2kE7NgKVdnFq/ofZ1UdTCMIuDBhfHUvLN+D
	K3SYlFdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYj8T-00000002ANX-2e5c;
	Mon, 07 Jul 2025 10:31:45 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYiYK-000000023rL-2oOv
	for linux-mediatek@lists.infradead.org;
	Mon, 07 Jul 2025 09:54:26 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4537fdec33bso17427185e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 07 Jul 2025 02:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751882063; x=1752486863; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WCkV6gDGOoOMF8igB/5H1As4Qg7c4viJIZ8RBw36e10=;
        b=cEkKWzfWI0z6kM1kOX02T2sCZ6z0h2TrcKVtJYmh+4PKjcx3umErpMHbxbOtVMIrZY
         iyBmp73qi7Hg/vxkhe8jl0/yYwj/Q7HREq5VK4nlAbACpipMb3XTMPwRvbb+b6Tp0Gin
         mTI+FK6h51XG+kBu35Bpvto5vrm81aXV4evICWKInr/vLBjz1nYpNEA9SZDtGpFvi6dp
         E4OlEmiBsKE1DTcK/GXkJy1nUgZZe8WpkWkfAQ7WlG0aD+iXUBJ8e/X2HPqNKuVcuH2d
         itvKu+7oMctzJB8uKjztGH8IPUyfCPCQKhfQ51cXYLQTK9ZoUu7Iq+GuB/lBjtWqadMK
         neyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751882063; x=1752486863;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WCkV6gDGOoOMF8igB/5H1As4Qg7c4viJIZ8RBw36e10=;
        b=K4TmRTOLfdGjnEIT1TewG6EC6ZZWCohc+tNWWr5EBAifecYIDVotyetOGXawX0m8Hd
         JO0iK6zxS5TKcBE+zzNmgoggtmrFT/UTmkxSyXAmY4gnDWXQ8wq5W2OSVNHy7/nMdlbd
         AexwMr6cDrCRO2VIXQRoMl1O7nri9LI+Rmuzf7QtdumYed6MJmKU1l1g2CSykU23pcJL
         7Oa9YX6yEihVRJ81LXUSmisJL8dEyG7Yoe22vZSJbvxfop8L1bdLuez/5Tt/fKcVikT9
         tTv96/jHBn3VVp3EJa9zqE+BZl9jrLh6U1pmctzMpH18aMCzpue4YURLyuTBFEcUW9aV
         /9cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXW41jDJRNxq0+C3spySKZAlkJuc9Pi9VH5EJ7umE74yT2X1z9lF8cymrfBBY1f+/m3JgGDgLB6BlmA+2UAwA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxbgRFsPbUiapU2TW+snhsja+FK+78e68bSG2PZRgpGgfmCC1d6
	FnBiZ8Px8mX2dIZfr3pxnRrjDluK0mZXFI4v6hYOUIMoQkE9ZX3IOKzCS2Zy/CjrvHc=
X-Gm-Gg: ASbGncs3dRA+bg7gt7kah8ndiLS3t8JQXGt9RYoE8CrE97RFubYRGQWlG5QyKE/o+jb
	sBarGruis52iszkpuqtlVZaPgGM0fdBHEWQ2RGhyMf9+z5j+pVKUP19Lq0WVAts1Q2J1Q9zVVbs
	YbiLvq/O78VN6sR9HwKr84fVKIFtGWr6B8YBfczngXXIFDEGW59LJPfGfA4LzUIuFBXIHGfhZlI
	1jpCNWW6STs0q4vEVmw//QEtk3tDrW7Wt7w0dcSNEGGgESRHGbI2sdtStTWtNhiHeFPAfm8XGPf
	Psi93RkGFuTSf3JAbrpkzdXxCvVe0E1ylR0V17glx/G1Xsj2LHtHM4+72HmMAPgUHFUTQFmnGqa
	Zi9GJBlKTQ0h3oCZD+jvI6pXu
X-Google-Smtp-Source: AGHT+IGNA0zQonP2czf5X1Jge+pwADtgl7Io7cV8JOwQeqN86Oye2fUbW6LvrQW+jILiqb5VBqE7Pg==
X-Received: by 2002:a05:600c:45cf:b0:43d:47b7:b32d with SMTP id 5b1f17b1804b1-454b4eb7f3bmr96048435e9.25.1751882062707;
        Mon, 07 Jul 2025 02:54:22 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a1705ed5sm89436555e9.2.2025.07.07.02.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:54:22 -0700 (PDT)
Date: Mon, 7 Jul 2025 11:54:20 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: wctrl@proton.me
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Sean Wang <sean.wang@mediatek.com>,
	Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v4 03/11] dt-bindings: timer: mediatek: add MT6572
Message-ID: <aGuZTIP3vo9q7MMV@mai.linaro.org>
References: <20250702-mt6572-v4-0-bde75b7ed445@proton.me>
 <20250702-mt6572-v4-3-bde75b7ed445@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250702-mt6572-v4-3-bde75b7ed445@proton.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_025424_709362_DA0C0F6F 
X-CRM114-Status: UNSURE (   9.99  )
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

On Wed, Jul 02, 2025 at 01:50:40PM +0300, Max Shevchenko via B4 Relay wrote:
> From: Max Shevchenko <wctrl@proton.me>
> 
> Add a compatible string for timer on the MT6572 SoC.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Max Shevchenko <wctrl@proton.me>
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

