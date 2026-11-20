Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BF1606A6C7
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2026 19:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fSm6PMOU;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dvoaGIuU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=e2Fhjnzys3548VUUVrNzALEf5q+GtDOzAxsUfBpsBKg=; b=fSm6PMOU0zMgsKL5OQqKEiEeXY
	X9EWweV/KizJCnhlOLphl0XfuDvkBU4WU/c3fVv7zAC14oRAfPQnrLRPVy6u7+4pVPVFXu0FS2jCj
	Qgh9niHXELKoRRnMgJ6RVsyE9PXSG1iQhKeRuvoiU4WvvHRU82txQ6zPNZW5He/iqWIeeleQu/ywp
	pmaFKK0zf0yu3CTRTj/EfUmWS4GknvKl+Iop9/2V6BTVS6yL4K/s0rObgBPoBtzUK9lHowlQQonOJ
	ka6EsHQ0sP8GgK6tABAc6EpI5dsmrkeQk+kZyeJ5ERychlrS8jKJ5jzh5ogL9F36hBwTlzv0ztqfC
	idUTypZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUi8-0000000G9Ok-0SEc;
	Fri, 20 Nov 2026 19:55:52 +0000
Received: from mail-oo2-x08.google.com ([2607:f8b0:4864:31::8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUhv-0000000G9Ah-2y2s
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Nov 2026 19:55:46 +0000
Received: by mail-oo2-x08.google.com with SMTP id 46e09a7af769-860f0ac44a9so390179a34.0
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Nov 2026 11:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795204538; x=1795809338; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e2Fhjnzys3548VUUVrNzALEf5q+GtDOzAxsUfBpsBKg=;
        b=dvoaGIuU7XzNHjWZr77QwqL0x1CDobgf8x6ZDlL+j5/tcR+Tx8rx6ZMXWeyE0BicDR
         i0HnRb9qXpnASoohnTwFw6STE1q45SgJgcKIf3UleJqPjpoCCqYmSVMfIObZMrz4f2Zz
         ybgy+Abp+NH91B5Rm+xcnC8edASNe6Lp/ruAFtlDZGGqGqo48OyVr+5OYrUzL4c3Llxe
         HEv9muX7YLT/YlljIPp62346pzZ+RkQIbnxvXKs6yqWIY3lEnyPxuiIYe9lmZ40Zz7P3
         Kr8nugd7EM2Gd7cuT96AzFYSioHfHpETQmwz9qIGtP+km+1I29jNRNw3L3C5Whp4jrG5
         tz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204538; x=1795809338;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e2Fhjnzys3548VUUVrNzALEf5q+GtDOzAxsUfBpsBKg=;
        b=jS77bWhLqmvaKN+zDo33H8cB5GMqd13s/qaCTgMHOSh9OROfq1ZDXj12BY1hiZxjKI
         8OXG8xGnojO0GEQ2MCabjYBgFNbu2UQwW0NBt42Ksb1IvsbwnWd2uZJCUmBCUXeDvuF3
         U3IwZNlMJMohzh8+b8g+0FIiHnVfrn+sOqkgaVRgJUBEQpGOJgfBV04W/8v5RQ7kDD7F
         zOMtxRdHYHu9WOa6Qz4xs7fatoVlh0IKIzyF8OshuDon4Bs5qqeFsZfcdIEYFSOADzci
         z6DXIO0er46KTyNc08pxO4KmkIWvIrasYPoSIcV9LydN1bd2HR9+SEcQGZU2QsOW0mIR
         UG1A==
X-Forwarded-Encrypted: i=1; AL+hErE6wLS3kTc4fybycZdAHzYgzqpJpvBtYdb3KDG9hYmUQJmyamAOosgcInawcg1fPUv+peru/i+G6cILLTAgnA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/wGF9Ey9YsS0dJU/Aymy+3iyuKHsOB6NTv+v/XF+w+U2EfshvO
	fecWd6VRPg7jANxgo+qkwEH3x9BVcwgZMKz2TWeqT9ERMyb7wTXZy0JD
X-Gm-Gg: AYBFou1yOj8v0V4rrJYbUBlRiYgQdhWLj6sWOD27CyZjN0zpymjoHP+lsyEoMUugf+Z
	zSVXJJ7x7UHrFZKRL/cQeh8WWJ3Obr3stuTIK6ZmOirrmO8+nXGjGYS9hH2gtQTfXcFyMgGOGdS
	Dv0T0ru9r10sr3QcdVyKm2vwh401jcmOW4huyeFvJLrA3Bh3LPwxQmZkpV5j4Sud4zhz2tqfzdz
	45h1eASjUIjltgPePCRnOJ2LdHNH6Mg+OlcdG1wt+wS2Di24BcUyvwMXeTl4BoJ2+7hlDEQn4Wp
	d4hzu5znmEUMISIPREH6M9UfYX4gkclRtAEI4WTmdJ3jc+womVCxTAu55h0sJDCdwrGg/1j4eSQ
	RBpGljK1imQBcvhAeP9XAvhQ+fBHOmJW4mm2/G9OWXEn30PL3glUBc7VyteW3FhPhDroQxJ6/km
	fOpxPrcHAzHO1Pk+i6hmFgJaOx/pxj5cXF0zlGUA9gf6MwpkmRuM9fMJh5gqAyjxqALjoOtEUO1
	swFiUUy6KL4dGDPaQu36CzbpcK5HrmoKY94bwiRwGUHiow9tIHIz5c+lp4PA3k10kSOywmFwkvN
	Byyu4m+AYRnJUfV8OnCdi5fNwY+5Zp0BJ+1zF4JqaEcO5hU+hFa242qdsxj0tzx7L9IwwFFEWoN
	xb4XekpgZIvwHv7yuZag=
X-Received: by 2002:a05:6830:2642:b0:862:b1cf:cdd5 with SMTP id 46e09a7af769-863159c721cmr4406988a34.22.1795204538133;
        Fri, 20 Nov 2026 11:55:38 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dcf38sm2703953a34.9.2026.11.20.11.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:55:37 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH 0/8] media: mediatek: Fix MT8173 decoding through GStreamer
Date: Fri, 20 Nov 2026 13:55:34 -0600
Message-Id: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-0-877dea14c3d0@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3JUQqDMAwA0KuUfBuwCnXrVcY+bBtdGK0lsTIm3
 n2w9/tOUBImBW9OEDpYeSvgje0MxNdcVkJO4A0M/eCstSNKkEaojb7Yqu5Cc+ayYt7feMQtUcS
 cKi78IcUbTaG/h8m5cYHOQBX6B3jzeF7XDzq/Cz19AAAA
X-Change-ID: 20261113-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-8e7b09b7663f
To: Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Eizan Miyamoto <eizan@chromium.org>, 
 Francois Buergisser <fbuergisser@chromium.org>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Youngjoon Lee <getfeus@gmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795204536; l=4416;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=VP7GxHd6QGZNLfrMHS9rdtlU1bt2rbvg7SOEleywfG0=;
 b=fvrpVhoZFFs4rJ90JD45HwXsof0avahvH6hEyNvlIdbV16QgmoIGzWayhPPUbbuIvfCynr57T
 fhmaHAn3Qr6CWjK6wxuBxZjUacdnHkTsQwJbR6C+r3pqeQVCrh/TgT+
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_115543_334154_BCFBE5E6 
X-CRM114-Status: GOOD (  12.40  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

These fix the MT8173 video decoder and MDP for clients that follow the
stateful decoder interface, found while getting GStreamer's v4l2 decoders
to play through them.

Patch 1 is the main one: the MT8173 VPU firmware takes one H.264 NAL unit
per call, but the interface hands the driver whole access units, so any
access unit that begins with a delimiter, parameter sets or an SEI failed,
and pictures of more than one slice never decoded at all. The driver now
walks the units of each buffer. Buffers holding one NAL unit decode as
before.

Patches 2 and 3 fix the decoder's answers to what GStreamer asks: a zero
bitstream buffer size, and the default compose rectangle (1088 lines for a
1080-line H.264 stream).

Patches 4 to 7 fix the MDP: MT21C sources that are not whole 16x32 tiles,
which the firmware refuses (1280x720 failed on every frame), a crop
refused against the destination size a client had not set yet (the
scaling ratio is now checked once both queues stream), buffer plane
sizes that were never checked, and a format change that took effect even
when it was refused. Patch 8 fixes the same last bug in the decoder,
where VIDIOC_S_FMT on a busy queue changed the format and returned 0.

Patch 1 carries no Fixes tag: the driver has taken one NAL unit per buffer
since it was added, and the change is larger than a stable fix usually is.

Tested on an Amazon Fire HD 10 (2017), an MT8173 tablet (board DTS under
review), on v7.4-rc2 with VPU firmware 1.2.0 and Youngjoon Lee's MDP RFC
[1], without which the MDP writes nothing on this board. Through a small
V4L2 test client with one access unit per buffer, the decoder and the
MDP turn H.264 Baseline, Main and High, H.264 with four slices per
picture, VP8 and VP9 into frames that match ffmpeg's software decode
byte for byte. With one NAL unit per buffer the output is byte-exact as
before, for every stream but the four-slice one, which cannot decode
that way. Through GStreamer's v4l2 decoders, H.264 High and VP9 also
match ffmpeg byte for byte, every frame; 1080p H.264 and VP9 play
through GStreamer as well.

v4l2-compliance 1.32.0: the MDP passes 48 of 48 with the series (47
without patch 6). A downscale beyond the MDP's limits (1280x720 to
16x16) is refused at VIDIOC_STREAMON; a 2:1 one streams. The decoder
passes 47 of 48; the failure is in the controls test, about
V4L2_CID_MIN_BUFFERS_FOR_CAPTURE, in code the series does not touch.
Only MT8173 was tested; patches 2, 3 and 8 touch code the later SoCs
share. Patch 8 makes the stateless decoders refuse VIDIOC_S_FMT on a
busy CAPTURE queue, as the spec asks; confirmation that ChromeOS's
clients free those buffers first would be welcome.

Not fixed here: a resolution change in the middle of a stream (dynamic
resolution change, dev-decoder.rst) stalls on MT8173. The decoder signals
V4L2_EVENT_SOURCE_CHANGE but never returns the CAPTURE buffer marked
V4L2_BUF_FLAG_LAST, so a client waiting for it to reallocate waits for
ever. Stock v7.4-rc2 behaves the same with one NAL unit per buffer, and
the series doesn't change it. That's for a separate fix.

This series was developed with the help of an LLM.

[1] https://lore.kernel.org/all/20261111-rfc-v2-generated-v3-1-e49697d20806@gmail.com/

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Ryan Brue (8):
      media: mediatek: vcodec: Decode H.264 access units on MT8173
      media: mediatek: vcodec: Pick an OUTPUT buffer size when given zero
      media: mediatek: vcodec: Report the visible rectangle as default compose
      media: mtk-mdp: Round MT21C sources up to whole tiles
      media: mtk-mdp: Do not refuse a crop for the other side's size
      media: mtk-mdp: Check buffer plane sizes against the format
      media: mtk-mdp: Refuse a format change once buffers are allocated
      media: mediatek: vcodec: Refuse a format change once buffers are allocated

 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c  | 148 +++++++++++-------
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c       |  58 ++++---
 .../mediatek/vcodec/decoder/vdec/vdec_h264_if.c    | 168 ++++++++++++++++++++-
 3 files changed, 287 insertions(+), 87 deletions(-)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261113-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-8e7b09b7663f

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>


