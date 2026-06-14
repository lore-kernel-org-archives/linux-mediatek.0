Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B68CD98D8
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Jun 2026 15:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U0kPJubfXi7k53ak7UhChAyiQgIHcIYyeOvCqkt9GAU=; b=F+lSxL4Ey3fi1kEpuW9f+Wt2+K
	1lyb97WX3zVFdn/2jVTatlDgvd+qEjZFq0uExZ2Ceg3Nn1SBFW+TERUNT14UW0Qy4VkM9Le++IY3k
	uYUiy/K+rSXr3iBKmjOvRmwVkgb6b9xVnNWsFNrauzk7ORZjo2r5UgqReYDdlSdxN+5rP6ijmODfu
	cyjkyPJFXb6Wys0HZazF9MOaIt2j/Aq9QgSMUl8fOwP6MK4aNY2EIu6UC16gvocOr9rKMpRrDq1un
	ZGTy+0HqLOf1kxz4OEAohyXqE7at0c9E1wET/YSZtXqZF6CP6QSoDA9lEKlqokY7+JDdI/j1BVZ1q
	ShwPcd6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYnC5-0000000D9XM-44v5;
	Sun, 14 Jun 2026 15:56:18 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYnC2-0000000D9VO-3tmp
	for linux-mediatek@lists.infradead.org;
	Sun, 14 Jun 2026 15:56:16 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-8cceaa6f75bso41054016d6.0
        for <linux-mediatek@lists.infradead.org>; Sun, 14 Jun 2026 08:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781452573; x=1782057373; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U0kPJubfXi7k53ak7UhChAyiQgIHcIYyeOvCqkt9GAU=;
        b=CjMHP/xyeOvhFMnUSlgcXkMr5C2YKGmJlWm9vY/cEVLpT19dLUR/Gt7n+3BMLt66OH
         RYNGM3cGX1QwVncAOdl+vY3TIylEuNOxObHwIFuFgiUItsx18ZV6Y46ej1rirX0B7Jag
         CUmIKDPGzg0Rj6vq9JgIaSmWTsstPsFlR5pmmkYNkkTSR9gKZhJXQ267E4BftGvee2Km
         xlTUOrUdF0zJtXuxw24aSYU2/MUtdu0TOalDEx9Q92WTqOI2gqflSCjHB/HgGSxZdahs
         OYg9u62hxb/bETPcVAcYQo0IClOITJyxXSGh3flN6ptYxYo3f+in+D8w9B2KvSSXfSkI
         3pkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781452573; x=1782057373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0kPJubfXi7k53ak7UhChAyiQgIHcIYyeOvCqkt9GAU=;
        b=dlPPd1WjM9RORTdfSYkDOSuoREPTaqlXqvwmg5aNjlPP9/PCOm16u5NVblW8DB+jP3
         kVyFc8I2HBYzG992rxbKcwqioDIaUfYdvxqajoHzexR/N0XKwBbhNNXVVy6RTqh4WdkW
         gweOk/LkrFH4xRJx4YdDVJ4u3o0SA4WY6GVXjGGjD8uK5Dd97TIozacQCbd/8doGyGmO
         XgBgAorRUSkBVAsYOtXMLAKLpgGGnt6KX90Cnq6MRFng438BTdYV4eydggq5tiK7lgFJ
         0pf1stcDmuOug6QZsVcaLTa/DXjmc7ejzewqaV0rxeE+CqfOPW60mfCqOiNiPRY98U69
         LAUg==
X-Forwarded-Encrypted: i=1; AFNElJ+OGEtfN5dvPPgvJ+hLrnyK5DA5m5A8aBxRHzlKmVt1mykRynMCsWa4pjKXGWANx9OBpX9eTwtLeXO7uxYgmw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyP4xnoDrYgvfBgtbMBXDJNFv8vCAFsEWiKPpyHHB8DglJgF0Og
	N4GaNGVLSYthyrvHPeU9YEyrekuSSPaEWVaYt6q6Ez74WxD9h0jVxTv8
X-Gm-Gg: Acq92OEBiMU+O50eUQNyvCJnph6KTG2HkBwPxgmlCstUBZceBM8dWL7rattnaIWui+8
	tl7JA1zYXbfBolyLMOVF4s8Z7g5VAUddh/KcPPcMkj2XO7DRIicvE8ud49fUG8mMoqarnhLIL20
	z5ZA/uRTP9p9EKqBTWFpnSHmOx6tdeoFUJy8pVBVKiQL/aGb4qOAE+uo7cx+Tn9FLuK4HFqdZ+m
	hFZ0OcuglwbxDCcXxS0eH1hjHI7VCeMn1O7fIdT8Jk1pb88rPnqinf4fvEd7t2o8kF0i609kVvi
	+Yb/yDDI/0oWXmLChhBfm+F55ivURyOJtrvkDBzsPy/HvjauJyYtN4EewEJC5UdYq9eGzRv3MV9
	aST7Z8Z9pMjJW8efRmgx0w7XWrcSEQtmyNTix603Yrz6j6SHY0ip/448CEpR6Y98NmMLaRq0Irz
	J+cvgY8VyYpnpoRFCrIaN8P00XWZgGQ7lTZh2rwk8laTi6OCWFkB5q2Gp60goWw35t77w0t05Yh
	ikaZarVkz/7Qvgj3Fk9xuxBDfVwVpXgv+uV67x0Su4=
X-Received: by 2002:a05:6214:1c4a:b0:8ac:a6a5:1f41 with SMTP id 6a1803df08f44-8d44e97d5d1mr119072016d6.27.1781452573124;
        Sun, 14 Jun 2026 08:56:13 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d30522cbeasm82008446d6.44.2026.06.14.08.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 08:56:12 -0700 (PDT)
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
Subject: [PATCH v2 0/6] media: v4l2-ctrls: bound stateless HEVC/AV1 tile counts
Date: Sun, 14 Jun 2026 11:56:02 -0400
Message-ID: <20260614155609.3107600-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_085615_007520_6B17213A 
X-CRM114-Status: GOOD (  14.74  )
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

The stateless HEVC and AV1 V4L2 controls carry tile counts that several SoC
decoder drivers consume as loop bounds when laying out fixed-size hardware
descriptor buffers, but std_validate_compound() does not bound them. A
process with access to a /dev/videoN stateless decoder (on a typical desktop
or SBC, the active-seat local user via the logind/udev uaccess ACL, no extra
capability) can set a HEVC PPS or AV1 frame control with a tile count far
beyond the array capacity the drivers assume, making them loop past their
fixed buffers.

Patch 1 caps the HEVC and AV1 tile counts to the uAPI array capacity in the
core. Patches 2-5 add matching bounds in the consuming driver loops (and
bound the driver-interpreted HEVC pic_parameter_set_id / AV1
context_update_tile_id indices the core does not reject). Patch 6 adds KUnit
tests for the core validation.

I did my best to reproduce these with the hardware I have, but apologies in
advance if I missed something because the soft repro.

Test matrix: patch 1 + patch 6 run the real std_validate_compound() under
KASAN on x86_64 (rejects out-of-range counts, in-range and the zeroed
default pass, stock and patched); all objects build clean W=1; the ARM SoC
decoders are not reachable on the x86 host, so the per-driver writes are not
reproduced here.

Changes since v1:
 - Patch 1: only reject AV1 tile_cols/tile_rows above the array capacity;
   do not reject a zero count. v1 also rejected tile_cols < 1, which made
   std_validate_compound() return -EINVAL for the zero-initialised AV1
   frame control that userspace and v4l2-compliance submit, regressing the
   visl compliance run (reported by the linux-media CI). The divide-by-zero
   that a zero tile_cols would cause is guarded where the divisor is used in
   the rockchip decoder (patch 4), so no functional protection is lost.
 - Patch 6: drop the "zero tile_cols is rejected" KUnit case (no longer the
   core's behaviour) and add a benign case asserting the zero-initialised
   AV1 frame still validates, plus a tile_rows upper-bound case.
 - No changes to patches 2-5.

Michael Bommarito (6):
  media: v4l2-ctrls: validate HEVC and AV1 tile counts
  media: rkvdec: bound HEVC tile loops and PPS id to the array capacity
  media: verisilicon: hantro: bound G2 HEVC tile loop to the buffer
    capacity
  media: verisilicon: rockchip: bound VPU981 AV1 tile loop and guard
    divisor
  media: mediatek: vcodec: bound AV1 tile-start copy to the array
    capacity
  media: v4l2-ctrls: add KUnit tests for compound control tile
    validation

 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c |   5 +-
 .../rockchip/rkvdec/rkvdec-hevc-common.c      |  22 ++-
 .../platform/rockchip/rkvdec/rkvdec-hevc.c    |   8 +-
 .../rockchip/rkvdec/rkvdec-vdpu381-hevc.c     |   2 +
 .../platform/verisilicon/hantro_g2_hevc_dec.c |   6 +
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c  |  29 ++--
 drivers/media/v4l2-core/Kconfig               |  12 ++
 .../media/v4l2-core/v4l2-ctrls-core-test.c    | 130 ++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |  27 ++++
 9 files changed, 224 insertions(+), 17 deletions(-)
 create mode 100644 drivers/media/v4l2-core/v4l2-ctrls-core-test.c


base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
-- 
2.53.0


