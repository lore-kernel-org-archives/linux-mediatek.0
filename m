Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48A0C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Nov 2022 07:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/PkiaqMA4pruVICxaOXfAOMV97w0GDIaiLIs6DhGNM=; b=jKJgDWkkNx/YewLuRfvAdmzJl/
	znfgbpRx16P6BWyQGAIQ8Jzu2PSbnnGaixXgwyUUuq08Y2TZickedrgUs/s+x06SrcYC48JsaOBWE
	NXXVY3S8vHuralLR0kQXyZ7u4Zgk57KYBuqPNiREsx5wvxGFdiKwqWRyTsVeOO5OGXK6gANIuETGV
	wArtRw69njbKXHqRTDYpiFNO+Uj0quL09YtAoXuXhOZk5niUXJ9CclHlyo8wUOwNfp6KszLgxcV0E
	NaIrxW1oa8I4087F2TTXy2hkmlx2j/JifI36A5YWE+icCuy2jTcWs9yvm/wwRHvbHM7iOGX0X2OJu
	csVBnp3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozufN-006lP6-6T; Tue, 29 Nov 2022 07:04:29 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozuey-006lEn-Cr
	for linux-mediatek@lists.infradead.org; Tue, 29 Nov 2022 07:04:05 +0000
Received: by mail-pf1-x42e.google.com with SMTP id a9so9371952pfr.0
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Nov 2022 23:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/PkiaqMA4pruVICxaOXfAOMV97w0GDIaiLIs6DhGNM=;
        b=nGI3f7XP/n/CdTE3+JdBxX2OdJBGXnOdwKBO6a3E48X5d8smdFtn/2hxZbNUtah2Dd
         cxfTDN9eNDTMnCC+BqSWW/mm+m4DaMosJHySTssipXXk/Nb/bfIyqJPD86rEPMMep4X5
         pJ+oy0ybnSOkPyPSHFNlXabUR0+LCM5JaA5UU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/PkiaqMA4pruVICxaOXfAOMV97w0GDIaiLIs6DhGNM=;
        b=nZAkmWlWBt6WCiwuCUjmvoUZ6q6hvT9f/NzxqUPs0yL6A8ydISHHNyo6PYIJC5lT9Y
         DObl3dtH/u6gALW2suDNGSjv8fSO6n833oNd3jfPX2Qf2RvJBs3F4stEpFvpFIwPI3+D
         xKPwBmQK02V0neeLStKg8SKVwrBArTyZ3teA8uKKsh+A237uDsAT3WGbtqzdum5U61Hs
         R3KH0p2etWuP3vfi47KHcrZTaCxG29YeAwwjaWh2TlYrrlHVwSMIhpPtbBGF2idGjTil
         hxMTZkDrcdkCw8iBSu3FOWEJtP0OoKR4Ez2g1tMQlfRSEI+SLZu95l8h0AQ3SQrxUZ2X
         5pIw==
X-Gm-Message-State: ANoB5plmcIgwhEY1c+R6S7PiyWep81AIGAeES0suW6CgzosSNv32GKLb
	t/sbewn1vp8h57VK7OFTXs+3vQ==
X-Google-Smtp-Source: AA0mqf7s3IK+L7jg0NoOsZxFQ3QK1mU67M0nikga25/eRo5XmoKdR7cZJQKNoYU72QRaWfGTGksv5Q==
X-Received: by 2002:aa7:8b56:0:b0:56c:6f8:fe14 with SMTP id i22-20020aa78b56000000b0056c06f8fe14mr57113596pfd.75.1669705443377;
        Mon, 28 Nov 2022 23:04:03 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:ac4a:f96:259:b58a])
        by smtp.gmail.com with ESMTPSA id y69-20020a62ce48000000b0056d3b8f530csm9140261pfg.34.2022.11.28.23.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 23:04:03 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: sboyd@kernel.org, robh+dt@kernel.org, angelogioacchino.delregno@collabora.com, johnson.wang@mediatek.com, krzysztof.kozlowski+dt@linaro.org
Cc: linux-clk@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20221121122957.21611-1-johnson.wang@mediatek.com>
References: <20221121122957.21611-1-johnson.wang@mediatek.com>
Subject: Re: [PATCH v5 0/4] Introduce MediaTek frequency hopping driver
Message-Id: <166970544127.607733.12688735757301419553.b4-ty@chromium.org>
Date: Tue, 29 Nov 2022 15:04:01 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_230404_448951_B0D2C6E9 
X-CRM114-Status: UNSURE (   9.88  )
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

On Mon, 21 Nov 2022 20:29:53 +0800, Johnson Wang wrote:
> The purpose of this serie is to enhance frequency hopping and spread spectrum
> clocking feature for MT8186.
> We introduce new PLL register APIs and some helpers for FHCTL hardware control.
> For MT8186 PLL driver, we replace mtk_clk_register_plls() with newly added API
> to support frequency hopping and SSC function for specific PLLs.
> 
> Changes in v5:
> - Add the reviewed-by tags.
> - Move binding document to bindings/clock folder.
> - change some coding style in clk-pllfh.c
> 
> [...]

Applied, thanks!

[1/4] clk: mediatek: Export PLL operations symbols
      commit: 029c936ae7e14ce49d043527087abb5f4b0ea48c
[2/4] dt-bindings: clock: mediatek: Add new bindings of MediaTek frequency hopping
      commit: cfcefe36bf939107eeba7b1114e3d82e31f92893
[3/4] clk: mediatek: Add new clock driver to handle FHCTL hardware
      commit: d7964de8a8ea800910fdd4e365c42a9e7d5c54aa
[4/4] clk: mediatek: Change PLL register API for MT8186
      commit: 633e34d0f46ed36f1de15ede00e4b31f4d7cccae

Best regards,
-- 
Chen-Yu Tsai <wenst@chromium.org>

