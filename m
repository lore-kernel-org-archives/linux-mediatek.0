Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F35C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 14:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:Date:From:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y0nOdBdH/FiY2jfQvMH95VKpuAO3BFQhEGGb8OIH85M=; b=ts/OITXBjd7+dGWjo/1oZQJMtP
	hyAiJAmZv15boGggPAFp/34zbiemt7s6auw2B9p3Cmr7ckuHXSRxGxuH0o7my9izXD2m+m+QdFiT6
	K+RXeIsnc5LgDT/iDHXbCWe0pKbtSTc3Mrz/M4fxt/o0SLjZKcGIMdFgqxNVvKiykWPrP0wpL+We4
	helw3UmRVmGcOI61oSBYCdUR/xHLGgcxjpUzjyXrRLFkrXA8hHtRuUeLJmUpKox+LutnXoxg8/BK0
	p1u6+Lu6i+kvYFm4lrKvhjgtuDP+TQDkg5bloEL+SOOVBHOSv+O3yB+OVF6g0GJ+9bnHOstPg0Kru
	zucrKIRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEB1L-0075hC-VK; Wed, 20 Jul 2022 14:49:51 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEB0F-0074d8-AC
	for linux-mediatek@lists.infradead.org; Wed, 20 Jul 2022 14:48:47 +0000
Received: by mail-wm1-x334.google.com with SMTP id p26-20020a1c545a000000b003a2fb7c1274so1518666wmi.1
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Jul 2022 07:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=subject:mime-version:content-transfer-encoding:from:date:message-id
         :to:cc;
        bh=y0nOdBdH/FiY2jfQvMH95VKpuAO3BFQhEGGb8OIH85M=;
        b=yI2UwrXOi3+iAjbP6Ub6fisppNUVUrxVmdsq3fNJv+N1wsO60lcIG0WM+ItxOyv4Rp
         J0pUF3pyFpUzkdwL8Q0jOkNMphJOCg4N/hrIQy5AjQ37nU3pVu6iemD41WcW+fRHW+/s
         jaPCYzpz13OTcIxMzKeVd/YZ5rDKvd7lmW3y8O1oZP/SPBqo8z51egLC6Dnr0TQSsGGe
         liZNw/xHmAIH6C2eGologqz4OCE5zYmpsvArnvvfcrI1OuHxNqPkSPrL5KPsWRaGMvnk
         PQ6MCEAP3UGVGSIDP+NM9cKT1dXQPid6xBLrqZPa2VtgMYUXDNdLTEkvRiwZXpRNI66V
         uUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:mime-version:content-transfer-encoding
         :from:date:message-id:to:cc;
        bh=y0nOdBdH/FiY2jfQvMH95VKpuAO3BFQhEGGb8OIH85M=;
        b=onsrxYmeODoqcV1Zmn4o7PEsY3XUBMuDeywIbXu9wX7c4J/1tgmDuSwzRancKElzGv
         xtqjdef7m8zsFNS5H4/4Wz//SfBm9MKcrxwhYpwjJIm4pwoePmqviG+xUBFdU+3r09gq
         YnvykSwqCh7b7x91eHaB11fI40jQwUWRKiUMV+pzcf7kahVeAjlVApe23dh4U0kaWTux
         lKg8v2zWtApDcsWpFHJQte3vU8fYvidnMN4iItdyCgX7DJLfVW0Y7yTqiuAzOJ2+vC+A
         iJCrymVzsb6bclHRw2NRZjPZfLQ9PA1jtVapZDlAac6OERQ7+6XIENn6B4pGRYR2Yq9q
         YU3A==
X-Gm-Message-State: AJIora+H02onHwWRjLpS6eCzLsl9mUtLPJlfSIFetsMl7TlR5bvUVQgx
	fSd5SNIsYwKHTCkGFGntZLZA4Q==
X-Google-Smtp-Source: AGRyM1ublPYAEei2qfPJouysredFf/CYLPH5v96mYBkQf2Q+0TkflmcBuDnsIT97NTApdhrn+fK1vw==
X-Received: by 2002:a05:600c:34d0:b0:3a1:a05c:b523 with SMTP id d16-20020a05600c34d000b003a1a05cb523mr4189886wmq.94.1658328518916;
        Wed, 20 Jul 2022 07:48:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb19:85e6:1900:c639:22f8:bed9:44dd])
        by smtp.gmail.com with ESMTPSA id f8-20020a05600c4e8800b003a31673515bsm3321121wmq.7.2022.07.20.07.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 07:48:38 -0700 (PDT)
Subject: [PATCH v1 0/6] Input: mt6779-keypad - double keys support
X-b4-tracking: eyJzZXJpZXMiOiB7InJldmlzaW9uIjogMSwgImNoYW5nZS1pZCI6ICIyMDIyMDcyMC1tdDgxODMta2
 V5cGFkLTIwYWE3NzEwNmZmMCIsICJoaXN0b3J5IjogeyJ2MSI6IFsiMjAyMjA3MjAtbXQ4MTgzLWtl
 eXBhZC12MS0wLTY4YzE5N2MxOWYyY0BiYXlsaWJyZS5jb20iLCAiMjAyMjA3MjAtbXQ4MTgzLWtleX
 BhZC12MS0wLWUyYmI0MjcwMTI3MUBiYXlsaWJyZS5jb20iLCAiMjAyMjA3MjAtbXQ4MTgzLWtleXBh
 ZC12MS0wLTc2OTM5ZmM0MTRhZkBiYXlsaWJyZS5jb20iXX19fQ==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Date: Wed, 20 Jul 2022 16:48:36 +0200
Message-Id: <20220720-mt8183-keypad-v1-0-ef9fc29dbff4@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, Fabien Parent <parent.f@gmail.com>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.10.0-dev-54fef
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_074843_664309_0991E1F9 
X-CRM114-Status: UNSURE (   8.65  )
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

The MediaTek keypad controller has multiple operating modes:
* single key detection (currently implemented)
* double key detection

With double key detection, each (row,column) is a group that can detect
two keys in the key matrix.
This minimizes the overall pin counts for cost reduction.
However, pressing multiple keys in the same group will not be
detected properly.

On some boards, like mt8183-pumpkin, double key detection is used.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

---
Fabien Parent (2):
      arm64: dts: mediatek: mt8183: add keyboard node
      arm64: dts: mediatek: mt8183-pumpkin: add keypad support

Mattijs Korpershoek (4):
      MAINTAINERS: input: add mattijs for mt6779-keypad
      dt-bindings: mediatek,mt6779-keypad: use unevaluatedProperties
      dt-bindings: mediatek,mt6779-keypad: add mediatek,double-keys
      Input: mt6779-keypad - support double keys matrix

 .../bindings/input/mediatek,mt6779-keypad.yaml      |  8 +++++++-
 MAINTAINERS                                         |  6 ++++++
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts     | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi            |  9 +++++++++
 drivers/input/keyboard/mt6779-keypad.c              | 17 +++++++++++++++--
 5 files changed, 58 insertions(+), 3 deletions(-)
---
base-commit: 3b87ed7ea4d598c81a03317a92dfbd59102224fd
change-id: 20220720-mt8183-keypad-20aa77106ff0

Best regards,
-- 
Mattijs Korpershoek <mkorpershoek@baylibre.com>

