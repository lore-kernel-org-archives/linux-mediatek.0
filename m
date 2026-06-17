Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A226CD98EE
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 02:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xIfiVseohRJOgI8N6Y+Kj1p4rISAysOPz5TsHQvMuzs=; b=WuJGs18NaxzVQvAhDEXLq52Ym1
	bRNMFuCoKop6LzimEbtuhPgg4SDkjJ4j/icILy4YSnpXCeJpHto1XTpr41GKL/lcnqIB5sAaWzkKf
	Cr9dv2f3HZB9VGsp8us+0U1bs6BZSxcWpqcWwBpUkJJRYdPOciGOboxhz9YIqUMzpFtPri1QShA0Z
	QHM91QVFEtZdRF4p6TE+cbEY5Vxpe9qsImU6kg6JJ22n5zXV84Nv5ipy2w64mt7ljuKr1qdQyvTP2
	/39Bj4bjhK1bU5ub24Ga3cnpmwl6XXOHnBw0lX9m+38WR0rZuKKNkNT21vS7iSHDzTIOEt4NmqIQs
	cqTbz2CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZfsJ-0000000GU8L-037m;
	Wed, 17 Jun 2026 02:19:31 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZfsF-0000000GU6s-2Oek
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 02:19:29 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-91562bf6c12so615673785a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Jun 2026 19:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781662766; x=1782267566; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xIfiVseohRJOgI8N6Y+Kj1p4rISAysOPz5TsHQvMuzs=;
        b=BJu4HLbwtYrLE4RrTO4PNn7vQMzvLY5bRwFxuAFwgdKLNGjUy4PvEJh54USH0K1IjH
         IblSebbms8xp3mugAkhklyYGleM+WZZ7wTVFl5Lt5RwUF72W3aBSPf3BD1jmHFDizCEH
         jjFM2KRgOqZyNjiNORiR7iSdFiF+TTCSPlzzyIl8WaaTJ5v3VOc797mI5CnyuCks+k3A
         0N47MzLUAlDWDKy3yJTGJ8QysejzYZ6m7HjiwzrLtFVbBqa5S/0CcS21p1iW8Q/QnD+T
         Rhs4HtvZcxOvIl3aYb9hVfG/Cu+LGlsN33XbIaiS9G/1c4WraFHpHdz4/v5FxjRTVOtJ
         P6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781662766; x=1782267566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xIfiVseohRJOgI8N6Y+Kj1p4rISAysOPz5TsHQvMuzs=;
        b=bqoI9J945PouwtP2XfFF7XB0d6RluLq1qTbzBSHtRhNcVWuNndHfvbnLNW3GMBCZR5
         zsK4Mk3co8Y2xEjicoKvr9F1Ll9uPOWAr4ItNA7E6SpNIim5ksytnGcYh0+6c9VYRljk
         QhvuXSYo04uC/Qk7+TlKa+zA9qlYWvwYYWUoXUJnMnOYRcBjEpv8cd+Ac7MN08To/Ygx
         g8mk/f6qjXP6EneT/BG6r97y1bLjRSt+AxKn8nNs8oWnMfFYgTAvx4yKCF2TYh174moH
         QjFB7iLOYsZtWCuXGVW8X1s2oySZ/4bx3QiwzgyzDbArGa2BW+2e8nDGSAp4yZW/HgD6
         RlIg==
X-Forwarded-Encrypted: i=1; AFNElJ/OLLxgIJCPUZ1GG2SIadE8p7R759rBkA2Aef27Z6RGKE3oWTAVkLXV3AC7jIeGAO3JewloYIKDyY+2O3yx+g==@lists.infradead.org
X-Gm-Message-State: AOJu0YycA+gn2xkw15K3carBUNTT+Icj+hiSN5I4ECCiQ3h+ZI89MCvV
	2Krt3tUHDo7Tu1dTmofbvQEL7jpTfbUP7efWQ5gEK314JWFadJDUC7Vv
X-Gm-Gg: Acq92OG+QAoZkztDICkOnZ+noFGRTHlG5zHZmwpgQtmPNdpps0zJpufwTFo2PBLDXrv
	gvC6C+z48nVyij241OVlO8Y3SRwlm5HI/Zhgvcckt6MxyJjjsrJAsGSN/kuLZrVCu5qlgxpvIc/
	qVpPjBud2KDy35NBx/c0SFEdh1mtDZDTqwm44h2LdKHVT5NyckHA6ZHuf3fObxZ8AIRBSw4UjLe
	OqMrvNUS9pAZGPsKO9ak1y59DY36sQpA7tvL9pa/s9aZzBSEnCoeB9llig03cvkaB8dzvdgLwiG
	ItOW6mY2UXvfn7nJ222gNAtm6a8rmU5qwNdRDacXbCxieO5m2pmzcvDxbsd/QCit8GVsulWLXbl
	4PL8FLK/+4pqbgqqqG+fGeYtFeV628bItGbRlGcmdEoJYkntiycWqfRouMVrcRM+roQUP45HjpH
	AzmnP+6tX5nxhTlQV2XfRsaGQY3sFXS19ae0NtfuZ2sBsi4ZSe/oGd6i5zqboz5jy5sxBBe3lgF
	63UoB7aMbzQ2k3tQTuTr6Uyd//h60CHhbeu3Qijl0g=
X-Received: by 2002:a05:620a:44d2:b0:915:b9f6:718c with SMTP id af79cd13be357-91dbb94528bmr273219585a.28.1781662765542;
        Tue, 16 Jun 2026 19:19:25 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a006e35sm1657646285a.28.2026.06.16.19.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 19:19:25 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Heiko Stuebner <heiko@sntech.de>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/9] media: bound stateless HEVC/AV1 tile counts
Date: Tue, 16 Jun 2026 22:18:57 -0400
Message-ID: <20260617021906.2746743-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_191927_697755_8D4FCC12 
X-CRM114-Status: GOOD (  12.88  )
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

The stateless HEVC and AV1 controls carry tile counts that several SoC
decoder drivers consume as loop bounds and array indices when laying out
fixed-size hardware descriptor buffers. std_validate_compound() does not
bound them, so a crafted HEVC PPS or AV1 frame control can drive
out-of-bounds writes and an AV1 divide-by-zero in the rkvdec, hantro,
rockchip and mediatek decoders.

  1-2  reject out-of-range HEVC and AV1 tile counts in
       std_validate_compound() (one patch per codec). For AV1 the per-
       dimension bound is V4L2_AV1_MAX_TILE_{COLS,ROWS} and the total is
       V4L2_AV1_MAX_TILE_COUNT.
  3    add <media/v4l2-hevc.h> with bounded tile-count helpers.
  4-5  use the helpers in rkvdec and hantro instead of open-coding the
       clamp; rkvdec also bails before indexing the hardware
       parameter-set table with an out-of-range HEVC PPS id.
  6    guard the rockchip VPU981 AV1 divisor against tile_cols == 0 and
       keep the descriptor writes inside the AV1_MAX_TILES buffer.
  7    reject a rockchip AV1 frame whose tile_cols * tile_rows exceeds the
       submitted tile group entry count or the AV1_MAX_TILES descriptor
       capacity, which set_tile_info() would otherwise read past or leave
       under-described while programming the larger geometry.
  8    bound the mediatek AV1 tile-start copy.
  9    KUnit coverage for the tile-count validation.

Changes since v2:
  - Split the combined HEVC+AV1 validation into one patch per codec, each
    with a single Fixes tag (Benjamin Gaignard).
  - Move the AV1 total-tile bound into validate_av1_tile_info() using the
    uAPI V4L2_AV1_MAX_TILE_COUNT, instead of clamping tile_cols/tile_rows
    in the rockchip driver, which would have corrupted the values written
    to the hardware registers (Benjamin Gaignard's NACK on v2 4/6).
  - Add <media/v4l2-hevc.h> with shared bounded tile-count helpers so
    rkvdec and hantro no longer duplicate the clamp (Benjamin Gaignard).
  - New patch 7: reject a rockchip AV1 frame that claims more tiles than
    the submitted tile group entry array holds (set_tile_info() indexes
    it by tile_cols * tile_rows) or more than AV1_MAX_TILES (the hardware
    descriptor buffer), which would otherwise leave the hardware
    programmed for more tiles than the buffer describes. mediatek already
    guards the entry count; rockchip now guards both.

checkpatch --strict: 0 errors on all nine. Patches 3 and 9 each carry one
"added file ... does MAINTAINERS need updating?" warning for the new
<media/v4l2-hevc.h> and the KUnit test file; both already fall under the
existing include/media/ and drivers/media/v4l2-core/ MAINTAINERS entries,
so no MAINTAINERS change is needed. (checkpatch's SPDX sub-check did not
run in my environment -- spdxcheck.py needs python3-ply -- but the SPDX
headers are present on both new files.)

The tile-count validation is exercised with KUnit (patch 9): in-range
HEVC/AV1 counts pass, out-of-range per-dimension counts and an AV1 grid
whose product exceeds V4L2_AV1_MAX_TILE_COUNT are rejected, and the
zero-initialised AV1 frame control that v4l2-compliance and existing
userspace submit still passes.

v2: https://lore.kernel.org/all/20260614155609.3107600-1-michael.bommarito@gmail.com/

Michael Bommarito (9):
  media: v4l2-ctrls: validate HEVC tile counts
  media: v4l2-ctrls: validate AV1 tile counts
  media: hevc: add bounded tile-count helpers
  media: rkvdec: bound HEVC tile loops and PPS id to the array capacity
  media: verisilicon: hantro: bound G2 HEVC tile loop to the buffer
    capacity
  media: verisilicon: rockchip: guard VPU981 AV1 divisor and tile buffer
  media: verisilicon: rockchip: reject AV1 frames exceeding the tile
    capacity
  media: mediatek: vcodec: bound AV1 tile-start copy to the array
    capacity
  media: v4l2-ctrls: add KUnit tests for compound control tile
    validation

 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c |   5 +-
 .../rockchip/rkvdec/rkvdec-hevc-common.c      |  14 +-
 .../platform/rockchip/rkvdec/rkvdec-hevc.c    |   7 +-
 .../rockchip/rkvdec/rkvdec-vdpu381-hevc.c     |   2 +
 .../platform/verisilicon/hantro_g2_hevc_dec.c |   6 +-
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c  |  57 +++++--
 drivers/media/v4l2-core/Kconfig               |  12 ++
 .../media/v4l2-core/v4l2-ctrls-core-test.c    | 145 ++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |  36 +++++
 include/media/v4l2-hevc.h                     |  41 +++++
 10 files changed, 306 insertions(+), 19 deletions(-)
 create mode 100644 drivers/media/v4l2-core/v4l2-ctrls-core-test.c
 create mode 100644 include/media/v4l2-hevc.h


base-commit: e24a98d6884a6e4203a77a94f070a59fcab95208
-- 
2.53.0


