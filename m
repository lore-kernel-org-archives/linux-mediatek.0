Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAEE606A33E
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 20:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VQbt4vCf;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OtPnrs/n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=dAZBhqePErN5XoE3TjBeSV916TZl6zwKukFpkFOF1YE=; b=VQbt4vCfNo0anU4b7kIvN+QIxg
	7pjhym/CnGjWsg4PmlaCOIXNkFRzpVp6zpMTr03SAP/OZxM5LW8ogwtBZT4YKbgybO9kfLI41fqkR
	hr7JAtaiLtZ+W2w0I7MpImWXEuZ5DessmHwSsP8x0ytfZPn+s2Hz5jsBGfU1p5IpO0WPBNNZiW/f2
	qH7LdcT8WdT4OP9401D+m5ygq3ibYM3TrK3xXJTO9yTlxPoIPyneyhNYu0EFQo9VlzHl8jQIC/bG2
	Qn+sal6ovgBmaOAE0M2d2xZ3GSPDvEdlDGhKU7mNKjwCtn/duSYdTozzL0P921IbTmHqTVBRCKPQ3
	bB6UP/+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJPc-0000000BEmu-2n1a;
	Wed, 25 Nov 2026 20:16:16 +0000
Received: from mail-oo2-x08.google.com ([2607:f8b0:4864:31::8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJPW-0000000BEit-17sn
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Nov 2026 20:16:15 +0000
Received: by mail-oo2-x08.google.com with SMTP id 006d021491bc7-718facffeffso617019eaf.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 12:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795637768; x=1796242568; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dAZBhqePErN5XoE3TjBeSV916TZl6zwKukFpkFOF1YE=;
        b=OtPnrs/n9l0HChAgMpSH23ftPjvkSJtuCKKG1XRVTUf7qpJ4XSQo9i50NWUNzmtnYo
         SeoSmA5UD4o0QtiFDifDPZXQdrFXYH2hH73KMk8GeKDKgXol+ok+1dpdhYVF/lamZ6i6
         s3YbddTDauIfrriV3EhiuUlRoEBlZr/Q50HBxksyvFEcP47f2+SzSRZFJzwamlbGwtV6
         1p7cTRNuGYJA2aoFdFXymwEgGhsozWLSCJLaF7FVe51/aLpqXACGS4BqtBvKDlaIme+6
         +DyDXOdr8e9R5S8f5dDbQChvtn8lkNPfRhoZs1sGitR0QsHk4YGDvSli9lmvn1Cwg3F5
         ijOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795637768; x=1796242568;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dAZBhqePErN5XoE3TjBeSV916TZl6zwKukFpkFOF1YE=;
        b=t/mlRJKxhgjbfSDMH1SkymSXHrM33TwbEOY0EHllnYy2DKHalyDJ+NAwIx6Hk5Hz15
         qeMh9LJttIp3smVu7K9xIPIrqJqRtT0E1g9+HXq04JDId7lB1jvylLGPda8zTfAQ6bGC
         6sP9lG2ojPaIfqbvv+RrTggGfTQzJFYKE4/q6x0JtAPMD7FbIdloQsjjcDU4NKT4AKEY
         TiFSja8CPnyKf6W2H8XN6yCrE4nwggAhnDYrDxCJ8BOZk98aJ7sGdKO9u2ply1N6IiWK
         l4Qqb8rYSfY0Nnqagd6MHAHM0PbSiZir6wq9ruWCELCEWBAZPme8mX26ycNqOI0o5YqL
         15+Q==
X-Forwarded-Encrypted: i=1; AL+hErEDh2FUjzCd/GXm1SitNL399gJE09yCPWOFiGDhJyzkoMcjqsw3W/41DUDZftUbTVaZnxWHG0PbnIrg5ymIsg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8UIg92clkwTHoEZQZUvZi7fo9zuy/c4RIkyjTk6Ks2AgqB5Z5z
	JawCeTfgAUtlfCZKPTXxO+nfxu6yba42GprVuEQ8ICk+Y0+xg/BkmG4t
X-Gm-Gg: AZFdTZdSHcssQoBnjMy86wSHxqVpnom+9RPDikqX4ESeuqdT/8gePPdejF1YhmItvi8
	yLOLjVPtT+bUqFnEsSD9OJjDKii+wpNzYctvhQ3VzDiJHMCyoTcGZwBWk4WhZmknWQHyxb8x0UT
	Re2jaEWOOcw/R6a4oelo9GpoyTIPn6A90laD950qKvPoznU+vqwPZaLXnp7dNknrBsBl/A9xZCU
	wHyAzwk3DV3ooPAH8vTwS9K4Chf7wXCYKTb/LBPuuGYWwcPIasuWy7R9gd4IycHdGT6g8z2iA0e
	cnTEOKLnva5u13nTIXg8Zh3x6Sxdr0dJjLMayNyUtGsCThA4dWWYzOEu0hsmRtLDGfmf6RpZaXU
	vUqX0ugMqeEbIAB4NnfYwLKQF9ddC69OMsZpw0FaLFJ2xRxIDb5SZSDhm9e29yGddCgD73oXLDz
	Oofs4DyCN85HR5g8gITmjK33k5vFx1K4GpRNmEQsitPe7Shkge1aRDpjvWqCyiX7qz7PnOJ6hIa
	Dg2lVPjDV+1UmSoyy1ZKw3qc1zDmdWLBpWB/PRQ0xIrIa+T4Ovb2rz5dSQ48vlx4fJ6c/XzmDbf
	AU73JHtA+cLBhAXFctUPYZVDl3aFNp3uL15nnNoCW2G4Cwu0Cv8HaVL5
X-Received: by 2002:a05:6820:571a:20b0:6de:aeea:5c90 with SMTP id 006d021491bc7-71b39438320mr9788646eaf.26.1795637768381;
        Wed, 25 Nov 2026 12:16:08 -0800 (PST)
Received: from [192.168.0.98] ([50.26.120.197])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm11341859eaf.10.2026.11.25.12.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:16:07 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH v2 0/9] media: mediatek: Fix MT8173 decoding through
 GStreamer
Date: Wed, 25 Nov 2026 14:16:03 -0600
Message-Id: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-0-fdc047cf75a5@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/5XNQQ6CMBBA0as0s2ZMWwxFVt7DsCjtAI2WkhYal
 XB3I/ECbv9fvA0SRUcJGrZBpOySCxM0TBYMzKingdBZaBhILishRImxiythWumN65yWSNq7aUC
 /3DGbYMmgtzP27kkJa1Idv3SqqsoeCgZzpGNAw25twWB0aQnxdeBZfOvPkfwvJwvkWCtlSYuzK
 S2/Dl67x8kED+2+7x+kWw2Y5gAAAA==
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
 Ryan Brue <ryanbrue.dev@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795637766; l=5534;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=70e+oVtA9v6pUdkJvj3m+aYfVUYdPR/nbMSAxA9cKZQ=;
 b=nNtr/9rlKDMFX6JMSeSRjVOYdatf25eVzakwEpG+SSDQJcu6UNbe/djR6lJ3XfHhMH4ZpqiZi
 EIrwIllhk5iA80UPYlKMbf+GwX4U/9n4HMHLbnbGvei9Hc/w/mUyaAk
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_121610_327783_61F0EF35 
X-CRM114-Status: GOOD (  17.95  )
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
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

Patch 9 fixes a resolution change in the middle of a stream (dynamic
resolution change, dev-decoder.rst), which stalled: the decoder signalled
V4L2_EVENT_SOURCE_CHANGE but never returned a CAPTURE buffer marked
V4L2_BUF_FLAG_LAST, so a client waiting for it to reallocate waited for
ever. It now returns an empty one after the event, or marks the next
buffer queued if none is ready.

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

Patch 9 was tested on v7.4-rc3, with an earlier revision of patches 1
to 5. On an H.264 stream that changes from 720p to 1080p to 480p,
GStreamer's v4l2 decoder stalled before the first frame without it, and
decodes all 180 frames to the end of the stream with it; so does the
test client, with one NAL unit or one access unit per buffer. The frames
after a change were not compared with a software decode.

v4l2-compliance 1.32.0: the MDP passes 48 of 48 with the series (47
without patch 6). A downscale beyond the MDP's limits (1280x720 to
16x16) is refused at VIDIOC_STREAMON; a 2:1 one streams. The decoder
passes 47 of 48, with and without patch 9; the failure is in the
controls test, about V4L2_CID_MIN_BUFFERS_FOR_CAPTURE, in code the
series does not touch. Only MT8173 was tested; patches 2, 3 and 8
touch code the later SoCs share, while patch 9 changes only how the
stateful decoder, which only MT8173 uses, behaves. Patch 8 makes the
stateless decoders refuse VIDIOC_S_FMT on a busy CAPTURE queue, as the
spec asks; confirmation that ChromeOS's clients free those buffers
first would be welcome.

This series was developed with the help of an LLM.

[1] https://lore.kernel.org/all/20261111-rfc-v2-generated-v3-1-e49697d20806@gmail.com/

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Changes in v2:
- New patch 9: return the LAST buffer at a mid-stream resolution change,
  the stall v1's cover letter left for a separate fix.
- Rebased onto v7.4-rc4; patches 1 to 8 are unchanged.
- Added r-b, and cc-ing stable on patches with commits in stable
  (Nicolas).
- Link to v1: https://lore.kernel.org/r/20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-0-877dea14c3d0@gmail.com

---
Ryan Brue (9):
      media: mediatek: vcodec: Decode H.264 access units on MT8173
      media: mediatek: vcodec: Pick an OUTPUT buffer size when given zero
      media: mediatek: vcodec: Report the visible rectangle as default compose
      media: mtk-mdp: Round MT21C sources up to whole tiles
      media: mtk-mdp: Do not refuse a crop for the other side's size
      media: mtk-mdp: Check buffer plane sizes against the format
      media: mtk-mdp: Refuse a format change once buffers are allocated
      media: mediatek: vcodec: Refuse a format change once buffers are allocated
      media: mediatek: vcodec: Flag the last buffer before a resolution change

 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c  | 148 +++++++++++-------
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c       |  60 +++++---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h   |   3 +
 .../vcodec/decoder/mtk_vcodec_dec_stateful.c       |  44 +++++-
 .../mediatek/vcodec/decoder/vdec/vdec_h264_if.c    | 168 ++++++++++++++++++++-
 5 files changed, 335 insertions(+), 88 deletions(-)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261113-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-8e7b09b7663f

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>


