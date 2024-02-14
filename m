Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7537DC4829D
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Feb 2024 06:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RnNCrv7ZbOWP1fIz2vfcI4PrAv6LiZGSm+ggFT58wVc=; b=w+6QSpWn1+FkHEcA0IwGIki/5f
	vM5qPU/bXkZhlBfhwkHaZmlpx4a9jKC12ahm1ll8i9Bvm2X6mv/EeEkYnbg0AHjcJRFIZBkCBOvk9
	OjauXYZL6UCDVTBSaIRkYnxrSqAWja7YqYLAlMsLC1lFhDQFELqzqbrZe0bewuU98/8h0bCQ8gYZU
	Wbzb+GEOpXQpQxPosd9goTKhoIEjfdyMzV2bw0/IkMG7zZBRxBHfc1DvCMgtLI7ykzdd4k1TeEWmo
	ka8g2NyXPmGXXnoZLJwjhWpL8GtXfgK1xw6gRYfFEZlDFkdO2w6dKazoI0uV8g4eY6Jpq+MfJg0gs
	RvyzqLUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra8WL-0000000Bvls-1NkN;
	Wed, 14 Feb 2024 06:13:25 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra8WG-0000000BvkY-2ra2;
	Wed, 14 Feb 2024 06:13:23 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a3d159220c7so153031666b.2;
        Tue, 13 Feb 2024 22:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707891193; x=1708495993; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RnNCrv7ZbOWP1fIz2vfcI4PrAv6LiZGSm+ggFT58wVc=;
        b=OkT9nR6il+/RVVgBUU4eFZ8siS1mVtAYt2oI+B3GEjjmgUGnl8uDgEfT3p/RxNYF+e
         wrBtw4NbCV6y0/3PqlO/ykFADQrF4SXGyeEDFVkPGJLuv2zzsbaGbeui6dqSGb+vUprf
         owfnf02+soFMN8npCv6BFiaAnstyB+4SdPXF07D1XLRw1NCBRLR0rzCQrUdcq738E0Il
         s2hnI3LJ+GbjB0iJerrDQRsqG7UrnTZPgnHcfVxDDU1i9yUeCF8adj57KquVvrQ+s9lI
         5QSanCPMRIpH9e20b+wWyMQvkMDX9gkdVg40XOJPxmGFge4RG8a+iVAdauFgNu89Th6s
         Omow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707891193; x=1708495993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RnNCrv7ZbOWP1fIz2vfcI4PrAv6LiZGSm+ggFT58wVc=;
        b=R7KSJl8pDVA9XqYBGExG7/bgWo+N++/KFbbKHd4HowotklE2Ru92l1yFcUsmggTJzV
         TrhQ1wMyz1QGU0f1um2mW6xu1KB8oRpDL3YdAorMvdaYbSqRtvrQwvRuwmi89bhj6b7Y
         Pq4EDE5Uecn4HfuvM+ivVlXIhM0vV7ftqS4QP9FzyIZzCP8O/iIAak/HrPqwxzLXKDT7
         CzW9HxJIWkbb5FEz2Lh1IijppIDsNILrbK0iTTEXN9bKJamjU7r1gowJ8188b/VL//wZ
         G3b5LFaSnkZiD5i7+Z4LoPqXLFA+qeE6BXBnMHI4uI8YsTHCoQVchXt/PfEvk5U64ciE
         izdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiqdjLhJrvH7lgGylStE0B9z+H23ueBzPNA2R8UJoFqfHkld7AXrbP99y0BqkZPUb0L+NqIKLXGbKfblUPqHtkrcyeFNRV/lN0pt1CPRCkiiTSMo+Iph957128m0EM5z413xkT+A1ZS5siATtMsYau0Kg7asSWpKQ=
X-Gm-Message-State: AOJu0YzL27UU6+ArNYnUmRVq+/quF4f1dN8iUM7b5xqnBdoWDepzIdp3
	nMbejtPiO5j+yZ7byi3AStKpRaX5TY6HSJXbkfmWf31MmUAmSQ4k
X-Google-Smtp-Source: AGHT+IGtPX37JYV5kM5O1SmKeozWVK6PqGYRhd1jozFU7jlXt8xqzmH3Q6m+kVq6dlwn3Ej5MDo1lg==
X-Received: by 2002:a17:906:56c2:b0:a3c:bfcd:bed2 with SMTP id an2-20020a17090656c200b00a3cbfcdbed2mr941828ejc.31.1707891193342;
        Tue, 13 Feb 2024 22:13:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXN0uKAweA5H+rNvQuNJvpZiek0Sy5TsEDjXpufOSG1llQF1SgDxoOZ2B8rY4Y4umzFVaZaihgHYLqjYhubf6a9mlKOoydC4oRyRUhZzWaNesZgoG21hU8y7tkMnv70RJPQNsFYtteoYGlOT0eSHTQzdOUK6ifMfGhGyrJVLFT7qmtk1KzTf5VEiIpKdMWWfrQBo/9Ehq2nIUFn6nf49bYhNZSmSSikwKmPWxnaFE/PycGRqyGpZeQjkJ/YBuCXbwbHZLAgYOaWFd9AziCcy3ET4W7jIJrss26XKj4Fg+oVgy8d9Up1py+UpPPnEn7l6hc94ZmovlXt3gmque/MaHD8IiBcZi3icgXcCj7HhM5qmKaupSGrNyv0eMzwuHPMycsgIO0Qfk2OPnBZEh5aS2PG/k4eeumlkUNC1LRrJ9b2GORy2BVG/C6ETgTGg9C/GPCh+BSXprk3/OWKKiqxDEHwDvCQCggDFrFmTvsyQ5tbDOQv8nuHGx0XwRDw+J7YrwMOCEVLS4PFTpcZXhQE7eFsQYwa3A6YvJXP1cK3OGEQ/N3+o8eHHG6n4g==
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id ca23-20020a170906a3d700b00a3caccb8f66sm1980163ejb.44.2024.02.13.22.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 22:13:12 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V4 0/3] dt-bindings: clock: mediatek: convert MT7622-related bindings to the json-schema
Date: Wed, 14 Feb 2024 07:12:30 +0100
Message-Id: <20240214061233.24645-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_221320_751497_C9C64C9F 
X-CRM114-Status: GOOD (  10.34  )
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

There are more MediaTek bindings to convert but for now I focused on
those used by MT7622.

V2: Move bindings to /clock/
    Use clock-controller@ nodenames
    Drop incorrectly specified "syscon"

V3: Update titles of all 3 bindings
    Simplify HIFSYS compatbile (drop "items:")

V4: Use "clock: " prefix in subjects
    Send including clock maintainers

Rafał Miłecki (3):
  dt-bindings: clock: mediatek: convert hifsys to the json-schema clock
  dt-bindings: clock: mediatek: convert PCIESYS to the json-schema clock
  dt-bindings: clock: mediatek: convert SSUSBSYS to the json-schema
    clock

 .../bindings/arm/mediatek/mediatek,hifsys.txt | 26 ----------
 .../arm/mediatek/mediatek,pciesys.txt         | 25 ----------
 .../arm/mediatek/mediatek,ssusbsys.txt        | 25 ----------
 .../clock/mediatek,mt2701-hifsys.yaml         | 50 +++++++++++++++++++
 .../clock/mediatek,mt7622-pciesys.yaml        | 45 +++++++++++++++++
 .../clock/mediatek,mt7622-ssusbsys.yaml       | 45 +++++++++++++++++
 6 files changed, 140 insertions(+), 76 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,hifsys.txt
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,pciesys.txt
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,ssusbsys.txt
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7622-pciesys.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7622-ssusbsys.yaml

-- 
2.35.3


