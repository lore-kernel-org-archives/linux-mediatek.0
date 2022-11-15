Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A261C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 02:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EtuML3tGwSGmmDRG9aMITAp3PQr3a8UP4pyk5lBaBpg=; b=FhrhW3/s2/tsYejuRy0oECN5O9
	UcuSFXkmHuSOfdcbm/eZPpE5f6UQSmsKwcKtd/LC+HkjozSRFPjDoUhu74/Zd8Bq218ngwlWLoIoZ
	vYF7OLEypaI7VzPjKKpClKivdamVxlUAS+UyLiUITDgyCW4tMTVvR4nyyh0rloVGOlAJNsGUnvn9L
	GAe1io/KwSK9W0FmV62bysSTdAoBajlxeKyTuM6rpj/qrHh7Z0gAKoZHFwkY2BuZBKZql5hc9F6iq
	5iM0znoC7c7Bhu0+TZLwiO9Zj4wkqQbJEu8Si4Rs1oPIapObWxgtK/nh4oESJbWMnPNkjdpashVis
	4wWM98ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oum62-006yRF-Sq; Tue, 15 Nov 2022 02:54:46 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oum5o-006yJ5-2Y
	for linux-mediatek@lists.infradead.org; Tue, 15 Nov 2022 02:54:34 +0000
Received: by mail-ej1-x62b.google.com with SMTP id kt23so32921490ejc.7
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Nov 2022 18:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EtuML3tGwSGmmDRG9aMITAp3PQr3a8UP4pyk5lBaBpg=;
        b=GgP0Zp0zjsAIFXrQ6da8g6B9L/OXMWFPHE+YUFNZwThbPtkKbnrAE4OoQFe6i7ZTRQ
         IZOY3ZPSup9IYoLFdTTLhla7sooUk5ThkYhTAkmDB+PJw24Ak4s5JceC4IBfDnFfcXlr
         1h26PQs5avIH69kaa6SQBwTetFLFw/sOqfwaFs/htHNnWdCdIqFnj44Szr3Uq4KGEPdU
         pm+tEt+78fUoPCC+B8ICETIzPB7M6lT0KM8PVxT9KrZiS3BSQ2EQWWNKuJ2AtEw9gEU/
         9ICc2HqbQEVIJcP+u3gcvV0BWRpRGEKOSKmXorRgRoP8RJmfQCVb/c13UF9Pwb2IORzr
         kJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EtuML3tGwSGmmDRG9aMITAp3PQr3a8UP4pyk5lBaBpg=;
        b=rjOlirslBxmd77tNj+a4WBTijqg2WV9aPVtECRKPQ9Rp7CtsEFjY9PwHm1FZR8DRSd
         zZQg7gKMecebruw9Xqe3AstNHTnzzlnzP62GmhsBQJRboSVq/25+w+pMprAI41rtolM0
         wGCrjvieKtlWRC6eM/GI7byQjUuSrLJbiMZML0BBRO/HDpQ0J/a0dlUyqLNYEL+M8s21
         /0pzgqh6Va/G65TuWXIl6fugzJH+G+EZDIvyoaoBL+F8jjUHAWiWG44NjHivdZaXjzOY
         BXNntHr+FP4xanlNgTipOc4nQ8+nDXUN+LBaEze7+Er5/NQjDP3JmwOKIPckwvTpYg61
         E9Jw==
X-Gm-Message-State: ANoB5pnQC4DJBDyQkpUWNT9tR4c75UlxpJ/oGuQp8cdnJUlgiRjcPe35
	kOe0g0ZlEX0EjQzUDtSxqJNv90yrIXgfUR/M
X-Google-Smtp-Source: AA0mqf42ZULz5pw3hCAwedpvdQHrwUAFq1eHXZkhWsu44D5bmTznoQdRFNLYDYRUpOkRTJ726ekt/A==
X-Received: by 2002:a17:906:1cd0:b0:7a1:6786:4566 with SMTP id i16-20020a1709061cd000b007a167864566mr12225821ejh.433.1668480868948;
        Mon, 14 Nov 2022 18:54:28 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id l9-20020a1709063d2900b0073d9a0d0cbcsm4861177ejf.72.2022.11.14.18.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 18:54:28 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com
Subject: [PATCH v2 00/15] Initial Mediatek MT8365 SOC and MT8365-EVK board support
Date: Tue, 15 Nov 2022 03:54:06 +0100
Message-Id: <20221115025421.59847-1-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107211001.257393-1-bero@baylibre.com>
References: <20221107211001.257393-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_185432_133410_E60B301F 
X-CRM114-Status: UNSURE (   6.86  )
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

This adds minimal support for the MediaTek 8365 SOC and the EVK reference
board, allowing the board to boot to initramfs with serial port I/O.

GPIO keys are supported, MMC is partially supported (needs the clocks
driver for full support).

v2:
  - Add missing dt-bindings documentation
  - Small cleanups addressing issues in v1 pointed out by Krzysztof Kozlowski



