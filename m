Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A94C678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 11:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U6fMgeLah4uWf7JxDNW3+CyJWyyIcQsO6jtmPeeVMXE=; b=issfXWykcJz6BEbQuEf0LLxA+W
	3XPGgf4OImXgMz3ii/bXJfqVTHhsfj962i+tMK/m8l7/iXB57I2EO696uYCod9XPFnK29kmtlwGVc
	T9ZvTPxdv7HryxethQbmSXuesx2L20ELmbk7s5iPzJPgxR+rgIxwmuV2d6PwZi5UgBAqX+3rvZPj0
	ysG8ON6hNX0M00dh9Xg1Ph9P9mr90Vk+kjT2FfKacO6GvX/B7vhCbEI70XIoR8eSi8I0qbV+cD86f
	2kvQ8VMfCs9l71UVzb8OFBOMFJEsXKssJ0BaUCE1G2+RSDMK5pcmRPQDPfEI7eX1LPEuN0SIxjoZF
	QzhLM8/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZVDs-00HQIs-7b; Tue, 07 Mar 2023 11:11:12 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZVDg-00HQEt-Ib
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 11:11:02 +0000
Received: by mail-ed1-x535.google.com with SMTP id i34so50674750eda.7
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 03:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678187457;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U6fMgeLah4uWf7JxDNW3+CyJWyyIcQsO6jtmPeeVMXE=;
        b=HXC9XxzhKSMdrTPzwjf9lq2IDksgr9rg04okGQMA7Q4ukF0ZDAxBlwI6d803C1NN5S
         PkIzeN5C2u/wrZ1vsuA2LmZU+7q8Z6WZL8Jwbc++j4jwhj1BY4vYz5bT2jmxZxUVR6+c
         GmFCfUpkNPSO2Rem5YTzz7u5hmwD4EFeFtSJyITd7ej+lzx44ZA6iP73GxUF4USlm2Ox
         UEm0cbjsaFjFe5sUSH/jkSYn2oQV/YsKRUFWbOaPtqFiKe/Z9jDJN2Xb0gL75sMRpzc0
         5eYVCJOWzbg+DFkXE2eS4qDkTqCV5b78h2YO0R6ZGSd9GrhQXHnFjxlB/SftxEQZFE5S
         ZZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678187457;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U6fMgeLah4uWf7JxDNW3+CyJWyyIcQsO6jtmPeeVMXE=;
        b=1ThBCpgiLYSv5kxZH6A3vUf4ZucWJ40iP+8rxaYSLDiFGaIiWAbKEZ7KadHltw9XWD
         q54W9ccREYoQeXAY2a/ROP3/GsvLFigbKAAOcVW8Kt+YpTi8U1gm3EDsxAZ5n+hGTeaL
         8aZJ+S9fWcHv211GXW2MN6dzWoZ/tJTsY6tChT7AdzcKU/PHXDtcGZUgO/m3d+P8adWU
         0egUsdbb+s9AvHm55cAJM8rF25XAs1NfUCcWX+1mWm0srNCoHRATnXpFs1WtfWb0Brdk
         acLfZB9BcKq3AMbBHF2RdPmlKDKwere0JOcCsTHtYl4zCNLUb9N3AYDuUe/L3AMoCE0O
         d/Yg==
X-Gm-Message-State: AO0yUKX17wWTFFvCM3ydmDArcqnDzhBU0YIT46nwIQrv02IENDykDrqy
	h3A761kCauuuS7QGVAIm1Q47pdm1QWjzviS6Crfstg==
X-Google-Smtp-Source: AK7set8bWIdU0Z9WjvqcfThqe44SRQhx/Kh+doUBNgk5VvVi/rKjJ6ufHAlp/UM6cMm28XzgIpWJfxz7RAbqcEenhkY=
X-Received: by 2002:a50:aa95:0:b0:4ad:7439:cecb with SMTP id
 q21-20020a50aa95000000b004ad7439cecbmr7738574edc.7.1678187457726; Tue, 07 Mar
 2023 03:10:57 -0800 (PST)
MIME-Version: 1.0
References: <20230209105628.50294-1-bchihi@baylibre.com> <20230209105628.50294-7-bchihi@baylibre.com>
 <CAGuA+oqOgprdu0dVcmB=qJd5HJjada3d8ZazMpoG-SBPizzuPQ@mail.gmail.com>
 <80c60f09-56eb-cb84-43f0-7b055ea4b32c@collabora.com> <CAGuA+oqJVTXE5YHm6rSv4pPWsGxR8nZD-T5EM7LS9gPtdcu4HA@mail.gmail.com>
In-Reply-To: <CAGuA+oqJVTXE5YHm6rSv4pPWsGxR8nZD-T5EM7LS9gPtdcu4HA@mail.gmail.com>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Tue, 7 Mar 2023 12:10:21 +0100
Message-ID: <CAGuA+oroM1XmLTDZcFx5F+tHvbOJXUGuj8SnZnUxD56+9XAb2Q@mail.gmail.com>
Subject: Re: [PATCH v14 6/6] arm64: dts: mediatek: mt8195: Add temperature
 mitigation threshold
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: daniel.lezcano@linaro.org, rafael@kernel.org, amitk@kernel.org, 
	rui.zhang@intel.com, matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org, 
	ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	khilman@baylibre.com, james.lo@mediatek.com, rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_031100_824759_3EA5266F 
X-CRM114-Status: UNSURE (   5.28  )
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

Hi Matthias,

Is it time to apply those last two patches of the series "Add LVTS
Thermal Architecture"?

[v14,6/6] arm64: dts: mediatek: mt8195: Add temperature mitigation threshold
https://lore.kernel.org/all/20230209105628.50294-7-bchihi@baylibre.com/
and
[v14,5/6] arm64: dts: mediatek: mt8195: Add thermal zones and thermal nodes
https://lore.kernel.org/all/20230209105628.50294-6-bchihi@baylibre.com/

Is there anything that I could do from my side, to make it possible?

Best regards,
Balsam

