Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47A7C6FA8B
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 09:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:Date:From:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YlOaZ6C3yAJ/aS44zIKSNojaTSxqANNH+S78zy9aQaE=; b=frAW2+NcI8Q7gv/UQgS1z6lOoZ
	ZSdkCqob6H9M5lW2bwKMsNhCwzkkcVkwTHx/fQJOD2l4M/9a4v4uDrU4uQypJG7ZjjqUkSloYKa2r
	o4p1G+Mfpe0LgF4ECQAde+MppDZ5x4zYjBqKRy06Ck73GbMpoyYQ2Xb9vnXcWEqz+KXZ15ilcsU8o
	Ikav6RlWN7eJD5T/zal4+nCZbAd1cq0GJz5oR5cQGwoPv5Tng1KJlztFWHflQ1Jl2sDwSA037hohV
	aYAHHY49SoIBfsiTcQ0drViQDqbqZUyAqcEDGfUwtOhxBiCqGuCkstk8/LxggQ+AUxoE6cQURIC2u
	IOsGtvwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaviw-00AFj0-9F; Wed, 21 Sep 2022 09:08:54 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavgD-00AE7g-1j
	for linux-mediatek@lists.infradead.org; Wed, 21 Sep 2022 09:06:09 +0000
Received: by mail-wr1-x431.google.com with SMTP id c11so8696727wrp.11
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Sep 2022 02:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date;
        bh=YlOaZ6C3yAJ/aS44zIKSNojaTSxqANNH+S78zy9aQaE=;
        b=TuWsxRhKIorV+7QTvrJDsrcLrBFdKo92O6JaZd68/TjFSsk76qqTpKH/I/6k9IEduh
         IJzMQAlm6SGgZruIFfzYIHAQAF1yaIasb0kcmFlRAdAHsQwfqXA2/n6f8iPeBmJxq9Rk
         VHB907OKAn6fiOPHgA9cStNY29hVxrD98RxkuqZDtG2Iiafk1NGFxRqpd84JjYpwaD44
         iGisoLE+/OOxf+BxmPI4HrLBdO4cRYeWuSz1U2RmZ0E7vx2+yAolwG/2bzHWO4S1VftB
         HHywW/UW6m7s4PFCJzBbrOh0mAJ79avRiOgqbdXV/pY9NIKt0oQw6CkdSsvATRsDfAd1
         7ghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date;
        bh=YlOaZ6C3yAJ/aS44zIKSNojaTSxqANNH+S78zy9aQaE=;
        b=NpaM93uTy4FTvkLmwHzGihtOQfl0L2UQsg6wUWcfg19fJEKnwOtWBDNpGsD7GLUqK6
         CXGmvIjjCYwsOhfIAL3UOixkBjGIeSAAWmvxJG2ZgE+cy1FrnYLqnpUMnEoJLY8BuDui
         QktByTulAmExXIdkx27ofu7t6nVXBp2BSVF4uqYBEmxhBlCf+AP+c7rRH7owJWegwBjY
         2Jn4bJImjqA/AoqWmRQhmESUDuiB68c/UfLDn1bzv8gzjRWr2gixjnzw2zarm+//BeA7
         a88VyyKuex4/xxqt5QDhyRDjLl8NISXgg/Vy0ZcqYKGYpNFeqaMY/SXr1JRXU6DKe0Hf
         zAeg==
X-Gm-Message-State: ACrzQf2sEOABz+nUP75QccTZiXlGrPbN7xR83OuYkTy2NqxstNeprCDt
	IM0ylPLnRwkvtKUPNgkBkAGfDg==
X-Google-Smtp-Source: AMsMyM42NavANSTAghtyxj3MYsPr2GmPZ07dDOBdJPIoYd0shxRMkSBgdEVFh25V7jOgraUEmSjlMw==
X-Received: by 2002:a5d:6d09:0:b0:228:d897:af3c with SMTP id e9-20020a5d6d09000000b00228d897af3cmr17030766wrq.78.1663751162644;
        Wed, 21 Sep 2022 02:06:02 -0700 (PDT)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id p10-20020a5d638a000000b0022b0064841esm1975482wru.59.2022.09.21.02.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 02:06:02 -0700 (PDT)
Subject: [PATCH v2 0/1] arm64: dts: mediatek: mt8183: disable thermal zones without trips.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIANzTKmMC/w3MwQ6CMAwA0F8hPdtklKDo33Rb45qMYlbwIOHf3fFd3gkuTcXhNZzQ5Kuum3XQbY
 BU2N6CmruBAlF40ojrvozLhFmdYxXHvUhbueJvs67jg3dODwo8hTnP0JvILhgbWyo9sqPW6/oD5i+5 iXcAAAA=
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Date: Wed, 21 Sep 2022 11:05:32 +0200
Message-Id: <20220921-mt8183-disables-thermal-zones-up-v2-0-4a31a0b19e1e@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Amjad Ouled-Ameur <aouledameur@baylibre.com>, daniel.lezcano@linaro.org
X-Mailer: b4 0.10.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1663751161; l=665;
 i=aouledameur@baylibre.com; s=20220920; h=from:subject:message-id;
 bh=S7JAPzoUeXRvMPnCB2alosR6eDyieqz4xvRnHA5NCuY=;
 b=odNUw+Emjf+xXwX3bR9Day0u1Ui6ErZ2Qcb7uwlnF81tAHCJZx3R4ZtBqJLKiJU5tfZf08tTiydr
 o0p2IYTLDFg50ovDicFI4xTm7PUsH2cM+bcYaOje1HFyQOeK2Sns
X-Developer-Key: i=aouledameur@baylibre.com; a=ed25519;
 pk=HgYWawSL4qLGPx+RzJ+Cuu+V8Pi/KQnDDm1wjWPMOFE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_020605_186768_9C279B82 
X-CRM114-Status: UNSURE (   6.07  )
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

Thermal zones without trip point are not registered by thermal core.

tzts1 ~ tzts6 zones of mt8183 were intially introduced for test-purpose
only.

Disable the zones above and keep only cpu_thermal enabled.

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
---
Amjad Ouled-Ameur (1):
      arm64: dts: mediatek: mt8183: disable thermal zones without trips.

 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)
---
base-commit: 60891ec99e141b74544d11e897a245ef06263052
change-id: 20220921-mt8183-disables-thermal-zones-up-6ac720a305d5

Best regards,
-- 
Amjad Ouled-Ameur <aouledameur@baylibre.com>

