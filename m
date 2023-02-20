Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72AF2C05027
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Feb 2023 17:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8FGe9Nk23MtKGd2Di6KmMIvhk+QEojQFWCNwRtr+vnU=; b=xXPzRh9xhs5XuiF6BO+VIiWRfW
	xZIKYQB2xInzWRK4rmhubMNJKtyZz8CvVQ+l4H+xjngitaOporolmSoCnzaLxY9UkC/s+O6Z8oiGU
	67jYDC8cv+5WkhK3h5JO2z9azJ6LTvWId237LUrjGxnd8kVFGBqATZJcHUCwtOZHdg4NdhWBBwnQs
	OHqC5AujCgjh8dMmPfVD96MkQy8GohBqUUU61mka1OkqQlRNLywAtUicBfs+r+znD/8o70dNI0J3h
	VnBc8fSwOfKAEnWsFnR4ATaLcKS8Pc0ziVP5dblDxHce+wHKkee2M78doEi3fdyCNw7+cVt42Pbh+
	xlRzzudg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUAIL-0056ho-Oa; Mon, 20 Feb 2023 17:49:45 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUAII-0056g4-Ds; Mon, 20 Feb 2023 17:49:43 +0000
Received: by mail-lj1-x22f.google.com with SMTP id b13so2911461ljf.6;
        Mon, 20 Feb 2023 09:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8FGe9Nk23MtKGd2Di6KmMIvhk+QEojQFWCNwRtr+vnU=;
        b=mvk+TThKU7ubB56YYV+lW4V2BDunzS2i086o9i9QeBoNCeTQQxjbnWeoZ9e/QNqsVK
         Sg5yh34HjWTRZ1fxni4rA6nGR2yiWjplrI+VHSuEHZXoQYA1t8b0s/kJ2q2GmbNrUBts
         uwxMqd2eJEHwtoMKppfRIGQVAYlRUv+sE4mZopglLLjKsSszsTEvawYS2vhQgEingQRE
         yIHkL/EKoYPT1wv3OLG+G4xInbh+zQIBGdUNNJx3DXPD21mBDl/zc5DEY1Bt/ofa0R59
         RM/aBfj6GrXg6SeLGeB1nfiUni5JTNJTrgEe0ThFUO8U2YXMDEB2DZ3mvDOTxD8xkdrZ
         hrCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8FGe9Nk23MtKGd2Di6KmMIvhk+QEojQFWCNwRtr+vnU=;
        b=XfsANuqZlK17ykT9xL6yZAHNX3zTd1GRG5JF7n+gO9gPfl9VRqC8d/x7uC931g6fEj
         cqRtMsycnrJ+CFbhqvg6whZFE79IRztbSj2KTlzEFBupUWsUfGJX8TH50IPneGGI0hjd
         eh6WamyecDNbkKmzNL0oE6tAADiefarMttWGQ7+fREmxdHjZFuqBfg3O0sRfTHT1SXLr
         5/ueqYAPyAleX6p7baDrAvhpa7GL0Fudeqq7w/gJwv9WtHMBNtG/HArReaqHKOq8hJ3G
         671MYdQNIGYJyAGKDZFihicaq9wpmxqCZCO588eAWcFcJBb0wDqC0XK5SbO2jzjADm+I
         rwLQ==
X-Gm-Message-State: AO0yUKXWnOi/hIJfuNASvpNShaNlF5Qi9iwWKL6qu0ktDNjTxHBGNW15
	F0YBOnqdVS8tZbmewqnNjp0=
X-Google-Smtp-Source: AK7set9xxybpVCvBucs1tVZ78OmOAio0JOq4btRXAwdqDX8LKNUvBFuwFLH6Bpkxpupku4UmK1wBSg==
X-Received: by 2002:a2e:9092:0:b0:290:603d:4337 with SMTP id l18-20020a2e9092000000b00290603d4337mr641579ljg.51.1676915378771;
        Mon, 20 Feb 2023 09:49:38 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id u22-20020a2e9f16000000b0029353491df6sm294695ljk.48.2023.02.20.09.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 09:49:38 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V3 0/2] nvmem: add and use generic MMIO NVMEM
Date: Mon, 20 Feb 2023 18:49:28 +0100
Message-Id: <20230220174930.7440-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_094942_519477_A4B61FCA 
X-CRM114-Status: GOOD (  11.65  )
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

From: Rafał Miłecki <rafal@milecki.pl>

MMIO accessible NVMEM devices should be simple enough to allow using a
single binding & driver for them.

In V3 I didn't decide to modify existing Mediatek & UniPhier drivers as
there are some concerns about adding writing support to them. If needed
that can be done later.

I decided to support Broadcom's NVRAM with generic driver though. That
is my main goal right now. To let generic code handle NVRAM access and
let NVRAM specific driver handle its content. That way it can be reused
for other NVMEM devices later (once we get layouts support).

Rafał Miłecki (2):
  dt-bindings: nvmem: mmio: new binding for MMIO accessible NVMEM
    devices
  nvmem: add generic driver for devices with MMIO access

 .../devicetree/bindings/nvmem/mmio.yaml       |  50 +++++++
 drivers/nvmem/Kconfig                         |  10 ++
 drivers/nvmem/Makefile                        |   2 +
 drivers/nvmem/mmio.c                          | 125 ++++++++++++++++++
 4 files changed, 187 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/mmio.yaml
 create mode 100644 drivers/nvmem/mmio.c

-- 
2.34.1


