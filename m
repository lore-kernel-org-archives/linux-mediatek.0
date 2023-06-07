Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 898CDC77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 09:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TTpdalqtCpBT/NwoTNyl6O7DvunXs5YAm2ongGgRBJw=; b=0oCQVOmEINUCPkj9Bd9gCYXmwL
	TLv/KE9PlASEGFLTlgYkwYHp0dAdMMog3coWqt2MhzQqFFeair90PYBNnaeX+gHpe1QF1R5QSR/fs
	XHmb0DCgP8thcMfnKuoFAWhZdLyzx+LnQgGWKObuYlwx4yeqDAxTTZvoFN0wjg8f+xSOoWPSrdm9g
	MMxnd9tZt5xOq6c4+VkbiLzD8bzIIhqcE5We7zwIcOJS8LqxpRSEYkW9mJShyhg9V2LLMt0d1yC4W
	n5n3xP4vF+NZKlNIR95zrAtcXYo+Vq7bI45pH9J4nbF5aLxqXB8oHv7TQnTjKZl49iVVemk2wMa5t
	qlyOQhPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6p8H-005ABN-22;
	Wed, 07 Jun 2023 09:07:09 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6p8E-005A8W-1l
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Jun 2023 09:07:07 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-256712e2be3so6110472a91.2
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Jun 2023 02:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686128820; x=1688720820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TTpdalqtCpBT/NwoTNyl6O7DvunXs5YAm2ongGgRBJw=;
        b=DXDkfPevfwjc0edifXxFdNpLngA5Bsitn9gV3nuP9WLIqA55+9us1u+CqDkdx0fuem
         K+4yKUgwQ9SzzpcjdRg4prVxZ8TmXOzk4+Yg1tCx4M+BO6NeWfpbmpoK8zN3Tro1Bkp5
         nxNC3hB4Aj/9tO90wJqjTqYvg8YWpoNClAiR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686128820; x=1688720820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TTpdalqtCpBT/NwoTNyl6O7DvunXs5YAm2ongGgRBJw=;
        b=S6KFefBOnEf8qVQdTB9xokaxNb8gtQDHk3sTUaVrgWuKnWoVQVzh+BKZKaeJCW8aOp
         G/M0eqyR13NmYg2ygkw0JYOeyTfaHya1lRaoH1tec5A0BhQOLz77toaM+nT3/+QYnJu8
         E2vqYg1xUjYW8RRrBXF67ZVvQZwBeASmZzuh+gHrdl+RVcudsd144+Iz/S0g2xMKDAjJ
         rniCrlP50HBFI1lvQ3fBj0+Hm32h9VCtRtMR12soU63ySmEgOzADYIhLmEKcxQwaShJd
         ps7dHLXwcfZEUK73kV95X6MKhqSpO1qiQTp6vPrwQ4+FK6+3Zrx7lzlgi/BhEN1Ik3eo
         mbrQ==
X-Gm-Message-State: AC+VfDxk+uJuvEqZbhLRxkXw4ojQAotQAKGnic77C6uoR3omS2e5ilw2
	phHANeYPNHwMIQR2hzmyqABq7Q==
X-Google-Smtp-Source: ACHHUZ6VZYacMCDoBxnVNPrIRYQZUOXjx7NZRAus4oWzskwTQViwej4z93EXTX5fHBxnAHcCeorohg==
X-Received: by 2002:a17:90a:30c:b0:259:476:b318 with SMTP id 12-20020a17090a030c00b002590476b318mr4542787pje.2.1686128820332;
        Wed, 07 Jun 2023 02:07:00 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:443b:29bb:b677:185d])
        by smtp.gmail.com with ESMTPSA id b38-20020a631b66000000b0051eff0a70d7sm8505732pgm.94.2023.06.07.02.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 02:06:59 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 0/4] arm64: dts: mediatek: mt8186: More DVFS nodes
Date: Wed,  7 Jun 2023 17:06:48 +0800
Message-ID: <20230607090653.2468317-1-wenst@chromium.org>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_020706_583941_F9C78A0A 
X-CRM114-Status: UNSURE (   9.74  )
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

Hi,

This adds more of the DVFS stuff at the SoC .dtsi level. This includes
the CCI and GPU.

Please have a look and merge for this cycle if possible.

On another note, I'm still cleaning up the MT6366 regulator's binding.
We shouldn't upstream the boards until the PMIC is ready.

ChenYu

Chen-Yu Tsai (4):
  arm64: dts: mediatek: mt8186: Add CCI node and CCI OPP table
  arm64: dts: mediatek: mt8186: Wire up CPU frequency/voltage scaling
  arm64: dts: mediatek: mt8186: Add GPU speed bin NVMEM cells
  arm64: dts: mediatek: mt8186: Wire up GPU voltage/frequency scaling

 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 538 ++++++++++++++++++++++-
 1 file changed, 537 insertions(+), 1 deletion(-)

-- 
2.41.0.rc0.172.g3f132b7071-goog


