Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEDACCD1292
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 06:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLnJA47z8azdtWivfiw3NkDC9nYPcr/CXIl1SITNREU=; b=KMMLanVcA/okQzW03NdlSk39Zr
	4z+oeejGk00l2N4Nwv0mvYxXYAfS6BzxkwPgJ2J7nh01/3KaVtP6GJQ68v0wMs/LdhslcxW/ewRlZ
	Au9EeUehQGhOF4+eU9nVlNBilp4pVMXuOOmwDwlqoPZvE/xJcUPqKXYjAXuivcySplA7SocCP0/Bv
	AnzNIRlJf9oHlRp3eApXKWQCinzeELhQUsGLxplbRKwdemKWHvvT0v6k6My45IrS5u+66xynaclFj
	qDnkMZbf/WGHPQ3Ts0v48g1P4z65pK13HEUqHJd6H9GRPRW4/ZeAEQGbg83tn0RqMLpfdQ/YPis5R
	q1/zvT5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1runqI-0000000Aar7-20mD;
	Thu, 11 Apr 2024 06:23:26 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1runqD-0000000AanE-48iL
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Apr 2024 06:23:23 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-343f62d8124so4058029f8f.2
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Apr 2024 23:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712816598; x=1713421398; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mLnJA47z8azdtWivfiw3NkDC9nYPcr/CXIl1SITNREU=;
        b=bMqVBFJdPfGnlXl6Hhw8NmnphtJgQyJUXInkFKZK3PRmZwIYB5Jl1h2WKJ/GbXd8MH
         r8yK93zxHh+ClkfYNDaWl9EmQt1CyrSwcEWCqbnJ+PQ/t3thgu1uSOAqUuRfneBOLPjt
         jUXBIrBl7QNOvVJnD1AnU7uZlYMrbtyEU5N+e5NsP7PyfHsRxoJwGU1ujt114vT1KCRv
         RjWbCNk12hYzMx/gLBictqKc583rqOr/JUjA7/N2rORu96dNFP1ETYbcDVlfyxQKJ18r
         jsbCA/l8TppZi7d5/waxEMYbRgIhyygbazoPiK9Ot8r8lJugTyM8E9/DCCGQjbZJxTTF
         EC0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712816598; x=1713421398;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLnJA47z8azdtWivfiw3NkDC9nYPcr/CXIl1SITNREU=;
        b=fHJoSoe/0GYiKlblbmt61b+AKP5BfuYev+k7BxtTzEwjOAi75lGW2WhW9rma2vEABn
         ojXGnGcshQFxs8bH59kHbBtEb5YKdSopijPet+MgCIOrhNGR/PjBzw5JfvXWZyvuh2xl
         GGpyfX7A4/ffM+JKsRBLgZpxJN8LKYx1HmSwcPKeXfO/T1NAqoA60vOVb94IRUsKyHmb
         hQoDX6gb7a8JdS3doPpvu13hwlXtFlRzGx/bxDTkub1Q9eiTq2Mjf5NQ5z84XWEXudq+
         TIZ3sHB5xiL7EgYWvD4B4SO0Q3RF+A2406J4IdKdM/8OeGZvHyDS63HI4KtTeiCgAnTx
         YASw==
X-Forwarded-Encrypted: i=1; AJvYcCWq6N5HS19WcVC7RUenFVB3zUOQPZrQ2Z3G3gINSjX6/7R+DwMFm9R5CDfWn+pfMH+nmcJEjAsXa8wyzpyUzc/4dmLWF4qe9aMpJJET74m2V7t6
X-Gm-Message-State: AOJu0Yz9nf+a3f2OMUruZ3wSZp/bpSKVb6yPeXdvidBCpf0q+NZ0TaEq
	aSS7U0ZS4oEfOvCF9CxzMMNZ+HJUCSpCI/qd1uZpV/Rzx6yHTG9vMeF8aHoVH/9z0qiTAdTN2As
	a
X-Google-Smtp-Source: AGHT+IHYK0GC0YQ5Own4ljJ7YwxqbYW05iaBzbBI3E/Z+vVUtSD4qyMdwUhdsufUVcvveWcPuZOevQ==
X-Received: by 2002:a5d:628c:0:b0:343:ad7e:5bc5 with SMTP id k12-20020a5d628c000000b00343ad7e5bc5mr3139611wru.57.1712816598656;
        Wed, 10 Apr 2024 23:23:18 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id df10-20020a5d5b8a000000b003437799a373sm966959wrb.83.2024.04.10.23.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 23:23:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240409204615.83928-1-krzysztof.kozlowski@linaro.org>
References: <20240409204615.83928-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] memory: mtk-smi: fix module autoloading
Message-Id: <171281659758.5078.1440563785835747624.b4-ty@linaro.org>
Date: Thu, 11 Apr 2024 08:23:17 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_232322_075109_D7628A66 
X-CRM114-Status: UNSURE (   5.36  )
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


On Tue, 09 Apr 2024 22:46:15 +0200, Krzysztof Kozlowski wrote:
> Add MODULE_DEVICE_TABLE(), so the module could be properly autoloaded
> based on the alias from of_device_id table.
> 
> 

Applied, thanks!

[1/1] memory: mtk-smi: fix module autoloading
      https://git.kernel.org/krzk/linux-mem-ctrl/c/bf11908757eeab716536d16a32693b5dcd6990de

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


