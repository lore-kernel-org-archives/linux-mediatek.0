Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0257DCD98D2
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Jun 2026 13:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W8QN1oqmeXkeOy6RyRuiD7b4Q+mpnATm3FAvEoUlIOM=; b=tqaAxGlsNVQDMBQD3sRfYWo28/
	1MfgL5L7L5pzB0UVnFfGuvXLRZ1/XhOZjkJat1BZ/U5w2TVVKttC0qnEULVMoczCpYSjsjT9d88/c
	b6Jwm+Eyb9ZArqfjle850BH/U5EvUNsdtdBP1HIZsSAnf92U9J6T1oMUmI5B18iUJLSd+XRJ03MQ7
	t41FHAe04Lc7pAS1ifCfUCcxLOQE196QDBf4IGBqxTaBsrnvnFx3oLOzpzm5vWmQ/7c66Xe+/Vk1O
	6Yn0gYybdkdGuFtzvqnUpTVTXGXAdzjk2Uy8roGMD1TCDgprAAHPFjN0Xhm7F/9jsaXngS8Mswf+L
	mkp/Uc+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYkbL-0000000D0An-1HtC;
	Sun, 14 Jun 2026 13:10:11 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYkbJ-0000000D09S-2WcX
	for linux-mediatek@lists.infradead.org;
	Sun, 14 Jun 2026 13:10:10 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-91574384cc2so282532685a.2
        for <linux-mediatek@lists.infradead.org>; Sun, 14 Jun 2026 06:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781442607; x=1782047407; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W8QN1oqmeXkeOy6RyRuiD7b4Q+mpnATm3FAvEoUlIOM=;
        b=XGbT1DVdO7Gb+tf/7YPrmOZqOabmjgJ1W3B7FcEfNT+ixril8ZzoM7928GlVWCvebV
         XPOeVJIAw1ACUl16ZRZC6QI5fvpyX6R0vyJ1or9zilX+RKBtel953a5VYLPCy73SSf+s
         t/k+fzw69QPPTg1NsfUPg6TN5ZThPAwEuBfzY7jW57IHU2cCYXHdR03T1noKL1tTJnu3
         TTvV1Tva1uOJWZEICPCi3V04bo+vLAowEDNNLRnVx+JJbZszWO4nLHVoOhJl3qGgRwNx
         Qs4HWJIXjEUxTOdDnQgx9JxwTHmQUXnRKS6lGieCf7YmDqdE14fhiEVVLZh1/pjAZdSw
         /Qug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781442607; x=1782047407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8QN1oqmeXkeOy6RyRuiD7b4Q+mpnATm3FAvEoUlIOM=;
        b=nUTej2K4nVE51dwQfaFyLcwpZijnM4xlnQbGp2GY27UDAf0ZaWPlTTxXQ5XhyvwcrS
         9um5dbjU5LLbD/ARk3StWGleb+Oudykyq00PTL6ad64LJAC62BjCaTiS6P6jS5GiszFd
         xMlAXguEjCvrz8o2GPqIV9UixlLyN1rUUXXgyn07R6KIz5YOC4DjXABlvNabtyeZt8Sa
         JQtRZHolhmePSJjhblND/w2mD+hbpDhI/7OCCZ2JBnVPeI1PAhOpilUQAVqy2WdxKpn2
         u+B6kcVnK65iQ5s87vm9mHi7LI1oU9QrJeXGHVfSu5oH3YlHSxa8h4WXfLlkZX0qZEj8
         An3Q==
X-Forwarded-Encrypted: i=1; AFNElJ8qUkRkHlHiFKCZsnA7DNh/2seS+xojJh+icGx+C6Myk8ftngIZJo436xixn4YbQaFuQ4nHN5ObRdoUuHirgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx3VzjwfS+F3/cnHu1L23XnAxk6gqnywgwR5J6zzgs33t8v9TD
	RJF8rfVz7ChW3/AD67Gn4fvdJ4slKTAQnW43bggL5eSAs/sd8RhWFnLG
X-Gm-Gg: Acq92OEpz2+NlFDfDFmJle6CU2H5jNFhX1mdCbbXrthWSO7fuMFq9oZAKybI4TeUfsL
	HudXdaZHMK0NIaZ57lrlaWvmkeyFEpvIyDxD+KYmRGyLcge6pW/AXkNa8Vk/c4ZIMPe2zl5vMQM
	XyAZiuh0JKATQqRWaybBA0GsV1DFDYahkd9/zlgAImrnwdn08pQzkdw7i9tUE13GoJT3jf/SyKZ
	TUmX7ZzxUIHMiHRpbTLZy7hsDNglAV3Pmr6d0mRhHTYPXFov+ofSMCUugt1m033aRK8oCsdQCg7
	wfhuR9Rwae+j6edV2ckMtTu1vQGEi3TeTJv0cva94BbP4LaDQ0FFLUc5O+Ic6ajczOFPj+J03V/
	b0rjuGezbHm+BzA1Yb+r+GnzZQ9chiLjz4CuON/OZWZ/Ez4AHNX6oAAyZMQJSdJCHPDwVIooEFC
	8QF7BZg19GsZ/uT5Ic9E6Twc9r73H26jkOGvrQFgRQqsjwZBEB0DwOvEBDzbzyHmHexX/4V++bG
	lUbW4BFk9q6GdvzHZAmCqU+3NEgZ6Pa3Ak7lI7iucA=
X-Received: by 2002:a05:620a:2904:b0:915:9fba:878f with SMTP id af79cd13be357-9161bab4562mr1530615785a.5.1781442607439;
        Sun, 14 Jun 2026 06:10:07 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91619f1b400sm752878985a.15.2026.06.14.06.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 06:10:06 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>
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
Subject: [PATCH 0/6] media: v4l2-ctrls: bound stateless HEVC/AV1 tile counts
Date: Sun, 14 Jun 2026 09:09:57 -0400
Message-ID: <20260614131003.2524025-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_061009_656237_BCC1605F 
X-CRM114-Status: GOOD (  12.27  )
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
decoder drivers consume as loop bounds and divisors when laying out
fixed-size hardware descriptor buffers, but std_validate_compound() does not
bound them. A process with access to a /dev/videoN stateless decoder (on a
typical desktop or SBC, the active-seat local user via the logind/udev
uaccess ACL, no extra capability) can set a HEVC PPS or AV1 frame control
with a tile count far beyond the array capacity the drivers assume, making
them loop past their fixed buffers.

Patch 1 caps the HEVC and AV1 tile counts to the uAPI array capacity in the
core. Patches 2-5 add matching bounds in the consuming driver loops (and
bound the driver-interpreted HEVC pic_parameter_set_id / AV1
context_update_tile_id indices the core does not reject). Patch 6 adds
KUnit tests for the core validation.

I did my best to reproduce these with the hardware I have, but apologies
in advance if I missed something because the soft repro.

Test matrix: patch 1 + patch 6 run the real std_validate_compound() under
KASAN on x86_64 (rejects out-of-range counts, in-range pass, stock and
patched); all objects build clean W=1; the ARM SoC decoders are not
reachable on the x86 host, so the per-driver writes are not reproduced here.

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
 .../rockchip/rkvdec/rkvdec-hevc-common.c      |  22 +++-
 .../platform/rockchip/rkvdec/rkvdec-hevc.c    |   8 +-
 .../rockchip/rkvdec/rkvdec-vdpu381-hevc.c     |   2 +
 .../platform/verisilicon/hantro_g2_hevc_dec.c |   6 +
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c  |  29 +++--
 drivers/media/v4l2-core/Kconfig               |  12 ++
 .../media/v4l2-core/v4l2-ctrls-core-test.c    | 119 ++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |  27 ++++
 9 files changed, 213 insertions(+), 17 deletions(-)
 create mode 100644 drivers/media/v4l2-core/v4l2-ctrls-core-test.c

base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
-- 
2.53.0


