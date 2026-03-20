Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07C8108B8F3
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 10:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3D1quXe5qk7PQDdd6d34BRnWIV3Fq6CvCxgOKw7t4LQ=; b=wxCEUCb+x23HrzhMhkYILJYDSS
	LfowD9th4TwbhvHLEbEwEoYzoeq057EYiLlv26pcbzQ4rKiqiXDiKI+hPxvfQRT6BmSrLOb2uIfDw
	sUHxcwPtP8UvJBdvQwQ2gxeGivJJ4YDrgAjqkRUv7s/O/yK1cJmqOQvp9qbO8m4pAQbJwoU6lyrFX
	7iV1VSc+4ZKqZiJrEbNocfTNcM1ELNFsgBHZH1rU1SoMDD3Sd5l+8fJfYcBV1RpAdD3sSm2v/Xg0G
	07IwryZM92GUzHpVn99yYvuliNkVXXW+eSAN2YGsgakCDRq1Xs+6YbYZfge4rm3fyGcKVErV4bKzZ
	TYKpDIZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3XYu-0000000Cexe-0VD9;
	Fri, 20 Mar 2026 10:58:40 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3XYr-0000000Cew5-0oGs
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 10:58:38 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2ad21f437eeso16192365ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Mar 2026 03:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774004316; x=1774609116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3D1quXe5qk7PQDdd6d34BRnWIV3Fq6CvCxgOKw7t4LQ=;
        b=V53vYMGioOj0PeQLVov4sUZgEnRMowpa7g+rHpBO+lWMFNWT1q4JaGn//L59q4DzVB
         pDiOpLAp6E4yCq33xdjjpg3yeT993Cle525kojMKjdcL9LytLNjClfElvXsOmI0VkvM+
         ZlNokzpe3a6lLljxpE7y0VJmH6gUsbLp1wnSZT984VplWeXi+kUSop9MoJLcOG3+7NTp
         tCSUpaf/+l9a6jNE8AgaF5Y3KVf9yEkBvRuIJS/nYqIh5i4k7Xk+z4SxWE5Vo5N1RcM4
         4khOPjJ+cdmfk1W3EC3tk2wONt3q5FZ9XOs03UyDmQ6M3DgRgHcbNdfMYA96iagF6wj4
         ToVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774004316; x=1774609116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3D1quXe5qk7PQDdd6d34BRnWIV3Fq6CvCxgOKw7t4LQ=;
        b=hUoTlZMiCkDY2EXdrDBs8Deu3wpbYlKgNfcKJszkPuGVn8eQGaFZRySqro9KzJgnUh
         4+nm9/pj8LXw3Rc5J3U3C71TTSUsgU8Hvn3EJmHldo4vrUTzylvMuM/UrcEugqi5faXx
         R2oefGoySFVO5RwvVJ/WkLAvsjc6IOFQrDjoNTrEs8H5pTv1UT1B4GHQFH3VYXiKa5z1
         VUP8Ox/4i1c7zu+JeeVwMSveBhMEQD/sKej+L/n6AhkDY/vhzzVqR6Aq7Mir1J7cjkjR
         l+07ULne6xaFhJCnf7Y5ToLyGLbmHIyTJnGe9+BNertD3XPIXkUGxtadthIMU1v8XKbZ
         NYKg==
X-Forwarded-Encrypted: i=1; AJvYcCWnDfyW/zMUzUY1kUg4jpwGR2Z6Jm0Qa0Izuxyw6xVkd3LCwLvpIJKpoEFMfpT1wC0d5cJuPlLCYseG/H1Xzw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwvFwundimheJ5eeOt012sKKJV/FXceSVa7xEFvgi23ToF3tY8H
	mTfVjHfPqYK1bXxhnnUYohUjsXwxAXqbg34oTtKgYV6Y9x/uvqwE1Q1/
X-Gm-Gg: ATEYQzywdp0khO2ZvCY5lALXYVTAw8F2eEp7kNGXx1uSWQYF/Io5dDVm0XZCKL15WYk
	Mk+xlk3viHXU35YlHCyHUOD6zPLObJvDR13BViQJtRbCnfzfoHztO54yEyqoCXEKZqZSGZyya6m
	0itr47GW0HnC0UgfiIfwtuYXTkQj/oiLTyKDSkYJfGSLB0cBqNfDMk0lXposzTm3gW9ExF/baJw
	Fd5lfqOBPIDc8xjQVOwZFX6bfoKs9joQ7sFB8oYrU75Vx1e3h06IMhku7Tg7gNQrpVsuhtmIro1
	Iagysf5nDb/Bfd9mtBwGEjsMxk+NYXwJU9EPz+Pfv3n720x7IxdxG/+wPeU9ZAaNryg38n8Mjdp
	vTGTdKcIGE864fbgqQAC8uS0h7iz0mIT8asSUHp8/US7VCKyNjzDdwVBApTfbdJpKVQhBvpncBP
	+REBchIN53hOjzQCjV138UiUW/U2O0TumX7cz0XFAQw9iqNoEoUM7tPXWgon49RS0LLo2RDwjaZ
	5+89wI=
X-Received: by 2002:a17:902:fc43:b0:2ae:5628:a180 with SMTP id d9443c01a7336-2b0772186bamr52147315ad.25.1774004315676;
        Fri, 20 Mar 2026 03:58:35 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516eacsm25636405ad.15.2026.03.20.03.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 03:58:35 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sean.wang@mediatek.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v3 0/2] Add initial support for Lenovo YOGA Tablet 10 (Wi-Fi)
Date: Fri, 20 Mar 2026 19:58:20 +0900
Message-ID: <20260320105822.447337-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_035837_229531_86EF3275 
X-CRM114-Status: UNSURE (   9.13  )
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

This series of patches adds basic support to
Lenovo YOGA Tablet 10 (Wi-Fi).

Like v2, schema validation still reports errors in mt6589.dtsi,
but this series does not aim to fix those pre-existing issues.

Changes in v3:
- Add "Acked-by" to dt-binding
- Remove "mt6589-lenovo-blade.dtsi"
- Drop UART node

Akari Tsuyukusa (2):
  dt-bindings: arm: mediatek: Add Lenovo YOGA Tablet 10 (Wi-Fi)
  arm: dts: mediatek: mt6589: add basic support for Lenovo B8000-F

 .../devicetree/bindings/arm/mediatek.yaml     |  1 +
 arch/arm/boot/dts/mediatek/Makefile           |  1 +
 .../dts/mediatek/mt6589-lenovo-b8000-f.dts    | 40 +++++++++++++++++++
 3 files changed, 42 insertions(+)
 create mode 100644 arch/arm/boot/dts/mediatek/mt6589-lenovo-b8000-f.dts

-- 
2.53.0


