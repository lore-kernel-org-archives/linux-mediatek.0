Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55FF1C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 01:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=770v95sUrIlvtNLFG2ZFJPK2miGjPEzCsACcRdRH3P0=; b=IkZEvrQQ5CoXKf/BM8gAWDTd97
	BBKPGkSm5XWsqBv+2jnsvlwO/qs/ICdRN1vjtXmprISdaxs1JaornEdR+XlohffeADxFYjPPllUOl
	/RJ2jcxrXc5maXxXgR0p+287S/61RTWyAKdiIX7N3e4qV0rJCV1kLn05b7btdp8LLYLnIFWRvFEK5
	mzaU0k1KOSDaqw+fYPHmTaf6PxdXL6j72Tp9kT7OSLybAkDZ0sEZo1ulgVpI8zEJQKT8kBLVhk4hh
	/uJ8wmSwvBWsfF/YMgKoXvCdS6eYH+hVUumooRNpvAD2LYXrMLkLCf/5XV7E03+BrBG2o07xAPNER
	a82nfeqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxHm0-001nP3-Gc; Tue, 22 Nov 2022 01:08:28 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxHlx-001nJq-63
	for linux-mediatek@lists.infradead.org; Tue, 22 Nov 2022 01:08:27 +0000
Received: by mail-ed1-x529.google.com with SMTP id x2so18639129edd.2
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Nov 2022 17:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=770v95sUrIlvtNLFG2ZFJPK2miGjPEzCsACcRdRH3P0=;
        b=tDoF3baarEZ/xbXDm7tk2HrsTGWpICgpqIAtSi03HywXzuaphjgJW54N71ewodQGgL
         W3DIwAOD1Z+BTxjyIkWFvBX4mFMnFV6j8xFwuUOGN12ePggI/v+RjoA02TWEeTP2sdUB
         b19ybRxEdtNpRoJbrGhyvTC63KxBZu0QuPH42XbY9BQ6XwdYDpUBkbYG9WVACRZguDXI
         uubWjH05gIC4oZ8NkoFPdw7iGNLrlZVwK13hQWmbYnFDT5k7s9ROcyPaUvx/rR96GmO+
         E3EWKEI7TuP6eoRMaarAKrk4dV5iR2Q08YMiomF6wF98eCjp67l9VMJ6TtBixdO9LbvS
         hztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=770v95sUrIlvtNLFG2ZFJPK2miGjPEzCsACcRdRH3P0=;
        b=iDy6U77kISff3hF75cQzVmLZURbHjqLhBmzgNwE+kR2RYtjbvPrxsKpP9kqzUQ4ClT
         DyJZWXbNjWhozh7Nh0RuE3FQ8afTCwncDHJWs0MZRe7xJMNxb5BGjdxtbevBDJ6yhCei
         115pX4fmadSzMzME1CxtviroJ76nY1KCJ5l6IJWDRZJdU9L1I4iO/PqwzKEbwdqYtNEj
         o5D8IqT5F2zATWQhWdEh+s7HXG6czTuBSdS35pZHj7HoAgortardzc7EXrkzKjTgr5nn
         jZb1Im2nUTnvtOb6sp/33Fs+Cy/7KB9QVk8y1iWGkoqDWuioABUeLf53oiCTTMyKY07V
         NyiQ==
X-Gm-Message-State: ANoB5pkTRzqAWuSgUisTE7WfYn7MZ+viR2yomkzWk/lVx47ItXAjClaK
	vo1m5xFnimrP6RSqknsZEod7Rw==
X-Google-Smtp-Source: AA0mqf6r3Zdf5ruet9qXDuVjd6GpPw7JVMSyJT9jBcH+eBdwhPNkdmCtSnW+kRAmDvWyunfZrvyPYQ==
X-Received: by 2002:a05:6402:3886:b0:463:ab08:2bc6 with SMTP id fd6-20020a056402388600b00463ab082bc6mr2102790edb.143.1669079289585;
        Mon, 21 Nov 2022 17:08:09 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id f13-20020a1709064dcd00b007030c97ae62sm5514683ejw.191.2022.11.21.17.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 17:08:09 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	krzysztof.kozlowski@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	khilman@baylibre.com
Subject: [PATCH v2 2/7] pinctrl: stm32: Remove check for pins-are-numbered
Date: Tue, 22 Nov 2022 02:07:48 +0100
Message-Id: <20221122010753.3126828-3-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122010753.3126828-1-bero@baylibre.com>
References: <20221122010753.3126828-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_170825_266332_26778D6D 
X-CRM114-Status: UNSURE (   8.83  )
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

Remove the check for the unnecessary pins-are-numbered
DeviceTree property

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index cc9472b284047..1cddca506ad7e 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -1499,11 +1499,6 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	if (!match_data)
 		return -EINVAL;
 
-	if (!device_property_present(dev, "pins-are-numbered")) {
-		dev_err(dev, "only support pins-are-numbered format\n");
-		return -EINVAL;
-	}
-
 	pctl = devm_kzalloc(dev, sizeof(*pctl), GFP_KERNEL);
 	if (!pctl)
 		return -ENOMEM;
-- 
2.38.1


