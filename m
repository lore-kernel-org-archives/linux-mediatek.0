Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9285A1093187
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 08:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iLEs0e2qJIlqfw8fHUZzPP3Wzmar5tmvZs6TyzNUS+A=; b=LXQ6N2qMV7krmITyiLEQFsgplS
	oUP7niB/MioEelKqOMCE3jyJRb71mohkQdae1jclSDM91zxtrk/m7gKorT3heeSqQ30Pc47Grca8E
	2hCRLx02/6L8Aflio5rBABykz+bLWTxtV4qS7+m0O4cRM4jUnYy/3DoufcxRlXt6T1Go1uF07D2mq
	2ciLemYgsscJ1i6kvazFgMR0kWbBo1b1KVvobCWGU2iPvn+2g/6oZXSa77PyXtN6fN2MwtmVDaoNC
	x51I/qH4247K8bzyN0WNbO151QHcQ9GcqJpILwy5kzq20DEQ/WsxEYBwn4PYm4oqIqrWrJFbUmX7q
	4tpHnaRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VHI-0000000CMFm-27GA;
	Fri, 20 Mar 2026 08:32:20 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VHF-0000000CMEM-3ObN
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 08:32:19 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-82c2239140aso5391b3a.0
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Mar 2026 01:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773995537; x=1774600337; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iLEs0e2qJIlqfw8fHUZzPP3Wzmar5tmvZs6TyzNUS+A=;
        b=bG8Xrf0Fib6X1XsyLjbd2DWcxvxprbG9r6jYrUHkyC15w3GrKFc7goSWWOz3tZ+Cmo
         d0nAKbbbz6q/3oMPaXx7XWhNDQQndKaIIzmm1oIsec0tcCSRbpx6y9r8Xn9zcZaLeL3Y
         IV9zpEytA9OqO0ryr93WDFskecCC9tIhIfaDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773995537; x=1774600337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLEs0e2qJIlqfw8fHUZzPP3Wzmar5tmvZs6TyzNUS+A=;
        b=G7rYqMjWJoQgMwmFkKN+aoE/QgUKbLR+exaj0JBI0c3F9PBiTeeu5aG7kHN70uezaY
         5a7BOUaZGouER3rMSCP0NoqAxERPgCybgK21JMArnzBs8ncFItCDBRfs4xM9h/qlKPPS
         uYMpQF39gg7mS5KTcU+8i9ips08TMFrFDW0T00R/izhi/0o0V+1BHxqUv4Hkow9iXVPC
         7WfNpB0wyg0CgM++FUD135Or00DBcc+4X+bsU7vF20K5SYNp2OHl4opy9s2NtyDGpo+k
         32ru3tLuui+mi4NE5p458oZ0y/36Y85V6+GB1P4MHikCDgWzA5hq6IYCUnJD+qTUXgn5
         lX4w==
X-Forwarded-Encrypted: i=1; AJvYcCWU9lvZIcU7881mQW5pnHor5BGSsyAg1SaOJbWS724jJDpFoTITOV8h35B3eyZgoKRx0Fo1CWfT8xyqSbOECw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6XA+SZrlBOgFBLv++lyTvhTJWHszE0x9M8RyJ1WJ/Iii/sAM9
	amyJwmM6Vav4pXGKUsob/GtjYeAXaHprHov9O1xn92RDXItIFU74tduZ8yWNx0RqCg==
X-Gm-Gg: ATEYQzxRKz42pNnsTYK5aqOO4cy13B7TubAQVxnPIVa5WwOuW2ur7n5+WL3ZmiKzsCs
	MmXf5WVM0TA2MgyGUsM/wAqRqutNiZ5jsLvBrnWWJAQ7eV23EewHHGkdUipCw6BpalNy+Vjc0yS
	AumrIwdcIt/29pbzhD7mGTAcBZbu8uSgmvH+VZa3fSqXzTfLBBD/fsaHHINAQfUyl7IcbKidFHL
	C4gxH7jYm7pgATViv2+2IV4RhGKG315fy9k7Utt4uzu7t1eVW3RvqlvGlVbSVyt70ZKXqOhLEI+
	ooucWfTsYJTGd4HqdcnfifNZ2uImEJSBtamG9XPqs8qOIUfKNW/75R/0ZZdLNWyUZLXYO3/tm+d
	6enOGeDaLGmPhS6ETQBPXZeVeIGBfK2C6jdzk6Rdo7IgWdDEgBEsfuV8GndyRBV83Yzu2B4stsP
	XnnrfOdsQQJcemW+lGQy4dn9Wsey/rYr5ERREcQ3rzap6EuGH1uLFkVfWdZv0y3mfqkxPifIE3O
	yI+RgQke5ThNw/CuoQ=
X-Received: by 2002:a05:6a00:1a89:b0:829:9fa3:5c8b with SMTP id d2e1a72fcca58-82a8c3b91fdmr1755152b3a.55.1773995536642;
        Fri, 20 Mar 2026 01:32:16 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b040debf9sm1408816b3a.47.2026.03.20.01.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:32:16 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH 0/2] regulator: cros-ec: cleanup and add supplies
Date: Fri, 20 Mar 2026 16:31:31 +0800
Message-ID: <20260320083135.2455444-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_013217_911096_CDB3D12E 
X-CRM114-Status: GOOD (  11.99  )
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

This series is part of a broader collection of regulator related
cleanups for MediaTek Chromebooks. This one covers the regulators
exposed by the ChromeOS Embedded Controller.

Patch 1 adds the names of the power supply inputs to the binding.

Patch 2 adds the supply names from the DT binding change in patch 1
to the regulator descriptions in the driver. This patch has a
checkpatch.pl warnings, but I wonder if it's because the context size
for checking complex macros is not large enough.

Device tree changes will be sent separately. The goal is to get the
regulator tree as complete as possible. This includes adding supply
names to other regulator DT bindings, and adding all the supply links
to the existing DTs.

Please have a look.


Thanks
ChenYu


Chen-Yu Tsai (2):
  regulator: dt-bindings: cros-ec: Add regulator supply
  regulator: cros-ec: Add regulator supply

 .../bindings/regulator/google,cros-ec-regulator.yaml          | 4 ++++
 drivers/regulator/cros-ec-regulator.c                         | 1 +
 2 files changed, 5 insertions(+)

-- 
2.53.0.959.g497ff81fa9-goog


