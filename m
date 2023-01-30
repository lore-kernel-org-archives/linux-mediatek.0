Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3027C54EAA
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 15:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OtnZbZJn7qNpx2WFbnWyJjOFxWWoyjTJRNSLs8byDPo=; b=w5AaDfJfEX2UyfEcJIhlyhrJFP
	DYpn1aJWl2H4WSDTHDn6stQpILVVOeX599E7HneRfPRJCJepZgHnjUQ4I7b+bnG180e4E6BYrsIjP
	fr9OBYx/u+T2Z2gTYlzF4kpkg/dEMcYyRP5HilieRgCghf1RmlG/3l7bnmOCyObKNJ6Bc0n9YJ9uk
	KHU+aFC/s3eZPTIac6F9JlXslSPAO0hmqBmHACZnjYepYXHBkpOl8qxx6KuSu2VvJkzKSn6s70isD
	ROqJfdtqyYYXSBxwoIoTvrB0KmclHAiQFN2VvwwBUpTz3jmDUBdVjwsIgOd+KkxzowMgvnBX0r0ac
	z11+p8bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMWNE-00460x-K6; Mon, 30 Jan 2023 15:47:12 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMWMB-0045jX-V4; Mon, 30 Jan 2023 15:46:09 +0000
Received: by mail-ej1-x632.google.com with SMTP id mc11so10479054ejb.10;
        Mon, 30 Jan 2023 07:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OtnZbZJn7qNpx2WFbnWyJjOFxWWoyjTJRNSLs8byDPo=;
        b=NiJunNOyCwnkCJjG0thYBSqZO7dQZMrPwN2Tyb8r1J+U6hjCLrVhiLiUFxzA0D2aFS
         dLMgtLsw8t3DA1b0UJK9eU9e2Hl6EeY81QmYS6t1WU1JBmNDWMY3BLdYZhSttYwvBkBU
         BEkXWdTBzeMtWby+7O30J8wCrf6CLxp/HyJK9owgQ59tjIP5PMC2SUMqbhEnxCw1r2IW
         eZZ/YTKZT3NTpNMRkdypVNzuL/QEivLh3GaTb3SRlGiOIHUCil2FbXQrg04+icYa4+/r
         rxRAO/i3JxrStsLkzpdmxoDbyLdmki9UjX18YLyA2zNw08YcjrICZ9HVvT4Ro/1lXwhy
         Yfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OtnZbZJn7qNpx2WFbnWyJjOFxWWoyjTJRNSLs8byDPo=;
        b=mM/EsdMgEbSItyGQZXvVXUiGRATfUTzxbu9Z1SK8dp2C/oakuikfAEDCww2OE8ik6c
         wHhzFft3WyIs1krKz3tE7tN6p6hhmZAG2GISVz5c5O+luQx2ZBmnlCNkY2LtCOf3Nhg1
         iRPZ2z8dTOpVHi71R/ZR1n8GO34KaXag8lKAtgrxUYxoNYcd2/gd/OrHEkljgFgXZAFO
         00AgvLU/xX49CBKuTuL02hg2NwgcE3WcCaKxa8A0gXzP/VXjw54pqT1Ccal1sxy6Cjg1
         emFjvCLj1HDu7afY7WypzaxZOooiWIWDhRWRJD8U1x1GqWHTJ46SlIGLiujLso8goSc+
         eWSw==
X-Gm-Message-State: AO0yUKXLIWUUYlF1qyWkpmH5FBY6RotWQl29DZlOJxwyX5nulU7H7DZW
	BOuAexQNF/cS09BkN85c3o4=
X-Google-Smtp-Source: AK7set8ONfiRFGonYBPV38i9/CXf+w/8U8FKS/LlLh/w/m8eq1UeosyR0ypAdVBUjF1v1S2NnK7q1Q==
X-Received: by 2002:a17:906:2704:b0:887:dea8:b025 with SMTP id z4-20020a170906270400b00887dea8b025mr4786278ejc.65.1675093564226;
        Mon, 30 Jan 2023 07:46:04 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id p17-20020a170906b21100b00886c1a02d20sm2719108ejz.47.2023.01.30.07.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 07:46:03 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: krzysztof.kozlowski+dt@linaro.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org,
	john@phrozen.org,
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	robh+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	u.kleine-koenig@pengutronix.de,
	linux-pwm@vger.kernel.org,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v1 0/2] pwm-mediatek: Convert to schema and fixes
Date: Mon, 30 Jan 2023 16:46:03 +0100
Message-Id: <167509354269.581356.8213728106190442559.b4-ty@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20221128112028.58021-1-angelogioacchino.delregno@collabora.com>
References: <20221128112028.58021-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_074608_041431_F9FF8F26 
X-CRM114-Status: UNSURE (   8.47  )
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

On Mon, 28 Nov 2022 12:20:26 +0100, AngeloGioacchino Del Regno wrote:
> This series converts pwm-mediatek.txt to schema and fixes
> mt7622.dtsi to declare the needed #pwm-cells on the pwm node,
> required to not trigger a dtbs_check warning... and to make
> that node actually usable.
> 
> AngeloGioacchino Del Regno (2):
>   arm64: dts: mediatek: mt7622: Add missing pwm-cells to pwm node
>   dt-bindings: pwm: mediatek: Convert pwm-mediatek to dt schema
> 
> [...]

Applied, thanks!

[2/2] dt-bindings: pwm: mediatek: Convert pwm-mediatek to dt schema
      (no commit info)

Best regards,
-- 
Thierry Reding <thierry.reding@gmail.com>

