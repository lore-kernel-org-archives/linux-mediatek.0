Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1605AC77B75
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 May 2023 16:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYH27XjeByMK147O7l5iWiBLALAwyIk0Kk8rARgu2BU=; b=j9PDVdj5oeIjk9TbzZPJC4wqHD
	zVNceGEe1B+Q55cUCA52qAYSpvmaSnaie7fLQdxWWErmmfnShZhU7rOyjyGnEwwSxZirY8kykjG7R
	Ce4C/3/reCLTJHgTGNR+z924R1202f2uWSHSC+cCnWd7O4MbTK3sJHuRXGiKkl5GErVUxcNGfeb80
	rpM980uYS3ZWmxVqaRF1yCuYErQKLbgGSMHs8vwe5GRlm73mb2Qp2CdcXX9jns7kNlwtgn+o+LpuL
	YOruYR/XJlpkMULY7J8EHFK3hY+yR9AxObYvh4ze6FEVfcL8Q9yU0U41GOzVPVx7dngtH47ADt/yQ
	sEJFnppA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyxiP-006VOl-0F;
	Tue, 16 May 2023 16:39:57 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyxi7-006VGH-0H
	for linux-mediatek@lists.infradead.org;
	Tue, 16 May 2023 16:39:40 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-510b4e488e4so461706a12.3
        for <linux-mediatek@lists.infradead.org>; Tue, 16 May 2023 09:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684255177; x=1686847177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TYH27XjeByMK147O7l5iWiBLALAwyIk0Kk8rARgu2BU=;
        b=MtTMNLgm2QTYIu7HCda+89OLhNeGmL5ToN09y1hcPblTMYTB3Y9wHefXmJONXlV4He
         BeuB+V4hBZcS9EIl/iyFn4OgXCB2r/qUWQN5a3uKMVQfjvsecooPesl9/nvJhOmNAP0J
         UmzzqbPoAc/9Ar1Ri6oyy16k5sV/si7wEqeMoZ3+GTxrhhKG0QGH8tkxa8K/oh/0+7l0
         reFHQsMDA0veVe4Q2DCXyJmQK+qaWndYfmrMSy15HfPS01A3cg1yCP6nqqwHK0Qytfml
         iFNnwGsjb4gthyZXbIiRPToB3nhPe6mNFGAYCXrFHLcCSZTYuzOtnomJxw81yp9TB3eo
         vkgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684255177; x=1686847177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TYH27XjeByMK147O7l5iWiBLALAwyIk0Kk8rARgu2BU=;
        b=f5OIZJeh95oT/ueIJqq24Ml62aySY3CjPpbeExUQWJEyqS7vVw63StGFMssqk4h8Go
         C4pnFu4KB/ILZ5Qf/hBkttoak6Kkij/DnqiggVIaDZ2seYE2wPWDtws2VADUwZ3JpZoN
         T6hSBo5ybiI90OqG7IugcbEGALeXTBv7jYlOqYiLDtQfkSTS+rydMITcWUxcwemp4R8o
         bKj8miC46B12rNLA25X2IrgWbKTz4srO+IqHllU+uGv1YEt+V9Gbo52lJTjK5poauMUV
         JXbKGM2Pr3/4+imdzEbF79icOJdhASymjRUmcJgWeZVefzYOIfGl+vVZihteYrMSId/B
         mqKA==
X-Gm-Message-State: AC+VfDxWOJ6M6UYaTijyVdDpPX/cOejYajI8p4JAnvDYoZaozBm0HbQe
	E4P3huvW3kbBTfRLDZpC7jcDzQAF8uRTpw0XlWM=
X-Google-Smtp-Source: ACHHUZ4g5SxFQ9h3D+IzT6shAa8NQEGXekqqXEMXi7KjElkQ2E6HrXamAtp8Axzj9JIoh6WZPzJKog==
X-Received: by 2002:a05:6402:1b0c:b0:510:885a:b4da with SMTP id by12-20020a0564021b0c00b00510885ab4damr1846682edb.19.1684255177697;
        Tue, 16 May 2023 09:39:37 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:77d1:16a1:abe1:84fc])
        by smtp.gmail.com with ESMTPSA id d4-20020aa7c1c4000000b00504a356b149sm8278191edp.25.2023.05.16.09.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 09:39:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ARM: dts: en7523: add missing cache properties
Date: Tue, 16 May 2023 18:39:27 +0200
Message-Id: <168425511041.243008.18082332917063303146.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230423150824.118430-1-krzysztof.kozlowski@linaro.org>
References: <20230423150824.118430-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_093939_120545_89AE3F12 
X-CRM114-Status: UNSURE (   8.15  )
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


On Sun, 23 Apr 2023 17:08:24 +0200, Krzysztof Kozlowski wrote:
> As all level 2 and level 3 caches are unified, add required
> cache-unified and cache-level properties to fix warnings like:
> 
>   en7523-evb.dtb: l2-cache0: 'cache-level' is a required property
>   en7523-evb.dtb: l2-cache0: 'cache-unified' is a required property
> 
> 
> [...]

Applied, thanks!

Please let me know if this should go through any other tree.

[1/1] ARM: dts: en7523: add missing cache properties
      https://git.kernel.org/krzk/linux-dt/c/21f475946d89911e31bccd02f8a7ce40b8f52a70

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

