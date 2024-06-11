Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D84C25B76
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jun 2024 09:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KeCu3tUjEx028evCXdGN5tv9lNYriQ2BwgD04jiD6GQ=; b=dEiBxa5lRGVdiq/uCLvvgnxmYB
	w3aExdbhYCralH46HGhPyhGYPAM+iB+S8GgMMCuFxf/DXGZbP7okYfzA9lxb1+9ANAsQO3ERAbx6G
	+ikc6btfNGfRjKlmheSUVDZ2t8Pv7pKbL5zUZrl9vyIaw1M3de0PwHgvApfpSCpp+4az4DV5opMTZ
	JIl9wbVmFtU8xyVAyIu9p8EUTMTCmjTGF7KLE+KUysK+yWN9kMyEH2ML2ZvGg4KES0jYAc4RD0YQq
	jS2fnx4WrnUJgzwyaGGs5sWRzwGIcTfxsNMiEJPAsMHs/7Tk+Tfq55b2+9mi7b3oeNOlzTPx7c6Q+
	gKLHgNhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGxpX-00000008HtH-1xHo;
	Tue, 11 Jun 2024 09:30:15 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGxpP-00000008Hna-2G8k
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Jun 2024 09:30:10 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a6ef793f4b8so355293666b.1
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Jun 2024 02:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718098203; x=1718703003; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KeCu3tUjEx028evCXdGN5tv9lNYriQ2BwgD04jiD6GQ=;
        b=OtupeuQCJ4ljwfDG/ZYo8+ZhFYsXjsFhN+pfjOhXvoqAEPRBiThF5fG5ddx8bbzhfN
         +6e/j1GWVAGH2eI90WfFiP++IT72eeLWW0Nojz/DgLqNYE6mcxz0KstIP2DsbIPjWElu
         a7XAJid+xj6OwaxVf0rNqcnwSQH/w+wRo4w+JjRFcRQHbc3L5uqrom4tmT0GfQm4YufW
         3DRiapQWuuOeekg0TjqVdx9+/jKB/96aqdJYyYSGnYy0GiheZkaHSv/9RJf1krranrdF
         bIHLYybOFle9saxLbxldERydrlvFAhhtq4o9s8KgmMBZwf8/JDoIstKbWkzahQadaTEn
         HeFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718098203; x=1718703003;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KeCu3tUjEx028evCXdGN5tv9lNYriQ2BwgD04jiD6GQ=;
        b=gyHlwyl+teqtjaR0aZxTPydOznZiAZqMduIfCYyagb0CQ2DlWbXPBlC7bkwB7Q7UMM
         3ID51UlaDIU0kWBEYo/UWMhoxppixPEmO4nggKLIxnXMm5uyzRkR8cU68uzXnlRMslDT
         Xpk77d+PDBT87xS8A3mcKiTTKndq9h+xcDZSE541N6iKpWrOunBUfCK7juhr0r5Mf7l6
         aM+9NQiJHhlGYzT6yPVL/IWKGoDtexAbrAVk2ETPo5JKa/JYOLmrp9aap6eBlb/T16b5
         IJE0jIEtGwqJTmvbyJh4Y/GFYXbE6q29oZBHDf+A2JDsVmf3h0UGCgXlxvU1B8ybRjv+
         i5gA==
X-Forwarded-Encrypted: i=1; AJvYcCVMzkvUY4pYHNdkBqty3dHJJP3y7sG59OZ8TAlsHRjKB8LhEBlP8NTuEFQ3ODsG4lo71J97LS9IXPxnnKrRw9HqdiGamXIT3B2vP3E/b5ViKLfO
X-Gm-Message-State: AOJu0YwD+rEWw1VyS2Ua7pvUvOuXWByuGydqdCn2fv7gAo0Iy4wkEB+3
	2b3KPX3xZWLbKjqefvBsq/RyAmFBi+sWYDfV5nPULifke7/mp/ce/98lpLbDMDs=
X-Google-Smtp-Source: AGHT+IF/a9tIY+1kNTK+eTlCUTe/xV7Dy6PMwjWOMtUOljMBVy53RU0KReMSvMV1AumLKJAx7f0mlg==
X-Received: by 2002:a17:906:fd86:b0:a64:722f:4051 with SMTP id a640c23a62f3a-a6cca20a6cfmr887290766b.0.1718098203060;
        Tue, 11 Jun 2024 02:30:03 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c806eaa4dsm735715966b.110.2024.06.11.02.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 02:30:01 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Lala Lin <lala.lin@mediatek.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
In-Reply-To: <20240514015154.11206-1-zajec5@gmail.com>
References: <20240514015154.11206-1-zajec5@gmail.com>
Subject: Re: (subset) [PATCH V2 1/2] dt-bindings: nvmem: mediatek: efuse:
 add support for MT7981
Message-Id: <171809820148.51273.11471279174963512172.b4-ty@linaro.org>
Date: Tue, 11 Jun 2024 10:30:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_023007_613882_526852FE 
X-CRM114-Status: UNSURE (   5.14  )
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


On Tue, 14 May 2024 03:51:53 +0200, Rafał Miłecki wrote:
> Add compatible for MT7981 SoC.
> 
> 

Applied, thanks!

[1/2] dt-bindings: nvmem: mediatek: efuse: add support for MT7981
      commit: 89ca7c2d13bfa566ea000c5515b1943d30d44311

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


