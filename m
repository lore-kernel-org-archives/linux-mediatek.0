Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F3CFD4F2E
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2026 20:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VJVrvD1HBF3SziwDh/X6OiTy3x6h8raUxjDiyEKbXMI=; b=HRPewbnxvgV49NWUDP+TdyfSvM
	aBfaD5WO8MOCc0ttwV94IoafGrWepCvoeU4np1V1PWbCT0G/FBf0PJRYkCnn/qRUmBy6nxvqlqHL5
	MVXf7YUggRh6UUMZVvVoO0bieMHp5WgOgHVe7J7JUj8O2PWvakzj+1cEpbY8NB2+06sZj1D/zGTsX
	iWd3YeyNdvlI7dq2QkVQs+8gDl/RNFD5ru9M0I9OgfkHwqaWhqOa+QYKiv95SMmi7OPT3QEOEOxc1
	ItIuUMNYynhYrupvKiqs7g/U20snSw7SDJRXnqbexYYiYa9NIq6131iHdBrkrmgog16d+TTHYKPgY
	r+hh3jTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w03Ke-0000000ADX1-1XcT;
	Tue, 10 Mar 2026 20:05:32 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w03Kb-0000000ADW2-0pZb
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Mar 2026 20:05:30 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-829ac8d56c5so3914859b3a.3
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 13:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773173128; x=1773777928; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VJVrvD1HBF3SziwDh/X6OiTy3x6h8raUxjDiyEKbXMI=;
        b=cRFXi11MB1w6zAURIEDMTknvBSGVFtfciyoxq5fqYVHwDNagbnJk5H4ScIzb51ek5E
         hUFgOoOzytOyahS4v4Rk7omBhnxMmbOzQmUP/somGfd4n3SLoSWzok656qvjIZoO/sYS
         dV4+jWiy8hqGyKhqKc3lapJQ71dFmWQjXyrp/bLMhLZZCuM3XRF4NcugKHDLsEIvYGhz
         QwNA9sKtiIRhj9I9WjX0JqVkSTumAsVz8rrzsd/kfxTeOIke4RVH2AZw9gN7vfX/NGls
         qE59CGL/x7PmEXHUfJARuzotUQxg1KUEZMRzfOGDTHRzxQdpsynJnhZkGOtm01TfzSRt
         GITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173128; x=1773777928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJVrvD1HBF3SziwDh/X6OiTy3x6h8raUxjDiyEKbXMI=;
        b=DrsREUpOtCXD2j7gsH7L26azqmbD8yGITap6eCRGYIrs4aez84TpZDPZpap+1wYv7u
         BGySxgdhU4S+2S3vl0pocq14bhrgOUB9mrzBXKX9rhJLzpYuCtMlxv/Q7alqi/c0q0FC
         X75qekbA1ktWDXDbCnZVAs99eQFXHrj6jhkp8zigYUb3NDcmdAPRDdGpahwaK4q/JQnl
         QqKD5+3A2OAvGrY5wSsqYNdxyobXREvd+OmJVVYylMuadDtdPxKMlUwt3atuwb62gH7e
         lACR/KcTat08mmWGeMCAVVjaX1efJvYSDP+HnkTYg2ZNMEksDg3RAn08nARaTqL/XF0Y
         5FJw==
X-Forwarded-Encrypted: i=1; AJvYcCU/MtTExxDwPjAcu3PTcZLuKawXg5otKLpDCNqwqEldEMv0LcTABNTPtsfIT3XFdNtytFArkHeTaZmytvZJQg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/5eiQasa/ZONNreWfSNKz6PLDcGz2wxeoxSmR9lhlmJhHuEKV
	CPuLaMt0Vhm6YqTWfgZjW3MiDc6pqvo+r0Nib8diN5qg2AUYpTL6FlLF
X-Gm-Gg: ATEYQzzUmlwLYnBqP0d3PVIArtsp1h4847JVtTy+JUXbohYTEns1DFUfPoUPBCotoNe
	elMfPD7M1UWRLK4Few0vvEYzz+vHL1MVMUcmiRQH8R7LK+6+njsj60wPXy7qdzerjLcaD5j2+QJ
	Y/3kCt0HhzA6mOA3psFLZWrdoOvL62toeqhGUOqnfDWkTKTb+L1ynuQ9bKWZPx3tibt7NHprJmx
	aDbNHoCRyQkCfw4QDF6EcbAsSTbl5t909MpREcemVZhpBfBOFg6qVyVe+pqNeD+nGrIgwdAB+5i
	Z3/3KNX52tTA5aeg3AfSrRZSjUjUBkfBAd2JAYgi5f9Zql6S25Crg3qP9RM9kjah8H7wbCeFcgw
	u/mgCaPS5wPFQzoaFZwRFtg2+40JQ3ApQsaLzrIi0p4K9Ap7OLVQMBj2d/X6uH2SR2Yq0BXTHO2
	+gZ/MLhJelqjq9VTU9D94M0pmjd33myL4EjEYzz2sex6q76XOR
X-Received: by 2002:a05:6a00:4fc7:b0:829:8bb4:1030 with SMTP id d2e1a72fcca58-829f7104ca1mr127969b3a.42.1773173128160;
        Tue, 10 Mar 2026 13:05:28 -0700 (PDT)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm101660b3a.13.2026.03.10.13.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:05:27 -0700 (PDT)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: jic23@kernel.org,
	m.tretter@pengutronix.de,
	mchehab@kernel.org,
	p.zabel@pengutronix.de,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	kernel@pengutronix.de,
	kees@kernel.org,
	nabijaczleweli@nabijaczleweli.xyz,
	marcelo.schmitt1@gmail.com,
	maudspierings@gocontroll.com,
	hverkuil+cisco@kernel.org,
	ribalda@chromium.org,
	straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	lukagejak5@gmail.com,
	ethantidmore06@gmail.com,
	samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com,
	s9430939@naver.com,
	tglx@kernel.org,
	mingo@kernel.org,
	sun.jian.kdev@gmail.com,
	weibu@redadmin.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	sanjayembeddedse@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH 0/7] drivers: Simplify cleanup paths using __free
Date: Wed, 11 Mar 2026 01:35:06 +0530
Message-Id: <20260310200513.2162018-1-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_130529_239560_6527B60A 
X-CRM114-Status: UNSURE (   7.54  )
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

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

Hi all,

This patch series replaces manual cleanup and explicit kfree() calls with
the __free attribute from <linux/cleanup.h>. This modernizes the memory
management style and simplifies common error paths without altering any
functional behavior.

The __free attribute provides automatic scope-based cleanup, making
resource management clearer and reducing the chances of missing cleanup
on early returns.

No functional changes are intended in this series.

Testing:
  - Compiled with W=1
  - Build-tested on i86_64

Based on:
  <linux-v7.0-rc2>

Feel free to share your valuable input in context of the cleanup API.

Thanks,
Sanjay Chitroda

Sanjay Chitroda (7):
  staging: greybus: simplify cleanup using __free
  iio: ssp_sensors: simplify cleanup using __free
  iio: st_sensors: simplify cleanup using __free
  media: mediatek: vcodec: simplify cleanup using __free
  media: chips-media: coda: simplify cleanup using __free
  media: allegro: simplify cleanup using __free
  staging: rtl8723bs: simplify cleanup using __free

 drivers/iio/common/ssp_sensors/ssp_spi.c      |  9 +-
 .../iio/common/st_sensors/st_sensors_core.c   |  7 +-
 .../media/platform/allegro-dvt/allegro-core.c | 95 +++++--------------
 .../platform/chips-media/coda/coda-bit.c      |  4 +-
 .../platform/chips-media/coda/coda-jpeg.c     | 39 ++++----
 .../mediatek/vcodec/common/mtk_vcodec_dbgfs.c |  3 +-
 drivers/staging/greybus/camera.c              | 27 ++----
 drivers/staging/greybus/loopback.c            | 35 +++-----
 drivers/staging/greybus/raw.c                 |  6 +-
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 13 +--
 drivers/staging/rtl8723bs/hal/sdio_ops.c      | 37 ++------
 11 files changed, 78 insertions(+), 197 deletions(-)

-- 
2.34.1


