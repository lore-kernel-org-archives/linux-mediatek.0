Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D995F606A335
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 07:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0HLaK8N1;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eil38Y9+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=nbjokYsP/PPktFQVGK4/4wc40PIaNaNW8MewYjdMp20=; b=0HLaK8N1obKgJv1ymX+8iEL4S2
	UYhAU5vgN4o9HI2EewL/OIdfTGWHVTzzspsApa6qFYNUvxkiczeTEYJyP4muO8/vGGrpw/QUaI6Rr
	AziXKuX/WFBurckTPan0DtY+i77t0ldK8jUiQV22pbfJzZDCdP4QUceSi13gLmyK68MY0yqcW1KBz
	CtGGW8Ffgt0nmsIQqz0ctKBZZrcfBKFc7g8OZIWEYjAzJC6Clq/X3Uo9fs5NKS6rUcPqIV476/vzu
	9GWMXdy+7zFNuVEGAUL3v+sx1JuvLOmckuI7L2WSbf6oNZxwURJ88HoJzW+7mI/3fFJIX5JLvF2bn
	0Q/EAIgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg7M-00000002pVX-0lQw;
	Tue, 10 Nov 2026 07:18:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg7B-00000002pKm-2Yrf;
	Tue, 10 Nov 2026 07:17:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 48DE943E80;
	Tue, 10 Nov 2026 07:17:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295077;
	b=jxEk+a+bGQf28d6haf5zSPEZ1CgtB2E+7vFFvWjNK4h3Ilp2mtcTCE+Hw27Ou6fdCSMa
	 sOkaBedb4Ozm+DNRzGabcyTGNJkmO26DA0tgOSyk3ueis/e3Ga+OC1FUHcLnJr7uB+UGX
	 HbRrPcFm3i5xch3H1SBS51JKsQuL545fUty7S0+9HS13edFZNl8zssWpkmvedo1iUnWyC
	 kqBdR2sEF/be4DfbDocxDdEijWwMxUh9/zGR50BChVHHlDGHsBP1PBb4mD7GBKUWflG54
	 1LJg7FZ9gvCL+KoltBzxibp/Cyo6SutfU040MErr8LeS3PvPKTS/hOwLQX/m1X1CP1A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295077;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=nbjokYsP/PPktFQVGK4/4wc40PIaNaNW8MewYjdMp20=;
	b=a/9cnt2nisc40GX1jw5ZTGC/ZJusOTl/yxOo9XtUAf3vBWCW4llb1d6qfxxlaZX13f6W
	 8VRiHZ7Ep+E2PBDbF49TNn/Lq5Sj/qE9qKUTyGHy71XLTHptPxnrD14DDF8xXtAr+yKK0
	 B//zWmDWkPxdiX1UrF0gVk0c86f4lbSUVzxbDyZsLQvQVdXHYQAlshkpxDkxjZ/7DvSAc
	 o5Wmx497HZCugvsv9LLR1zGA7HmTDRzvDJU1oZZMP0UmdYCjMMG7ne/drtoSG5qCMPx19
	 w99qg+ZCeCJOspT+DujJT8eui+eJU9y29iBxMqqVjGRO4VwNvSSSRPTI+UALYB4rIew==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 70D2F1F008BC;
	Tue, 10 Nov 2026 07:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295077;
	bh=nbjokYsP/PPktFQVGK4/4wc40PIaNaNW8MewYjdMp20=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=eil38Y9+30QF29BTbzBGmFogArMmWe+npbRIa83Ka6PT33SjLvQd74ja7qvC+Sqem
	 m72N0nLvS2ZEBG1gZSYEeJNOjg3nRW2e4xSjlFpdvwHzfngHTDLonEee4gxIMU2tew
	 jSk4C6FYHU2Gy6xi3/5k1XHFB5fD0fxLMX6hMIPW2tTviSUwuevK5PFdBdAaa5Nhaf
	 Ko9S2427DUtpt9irG0iIAEGF7s6q2SvXmIs4dJJSXnKH/lZkjaAnK6OShzjZeQQhJk
	 XXldjhXASO78rlK9lFcAhRQ1k69A0jTf13r6FB6ObW4b2FolNT6jzT7WWei4diTmQB
	 UBaL/J7peLGsw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 04F8E4896C;
	Tue, 10 Nov 2026 07:17:56 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH 0/6] media: verisilicon: Fix the JPEG encoder format
 handling
Date: Tue, 10 Nov 2026 07:17:55 +0000
Message-Id: <20261110-hantro-jpeg-enc-fixes-v1-0-fc4dc7e985d2@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMwQ6CUAwEf4X0bBNKDBF/xXiA5xbL4UFekZgQ/
 t2qx5nN7E6OYnC6VjsVbOY25wA5VZSefR7B9gimpm5aEak55FpmnhaMjJxY7Q3nTvUyaNufO1G
 Kdin4DZHe7n/21zAhrd8zOo4Pg5Gx2HkAAAA=
X-Change-ID: 20261110-hantro-jpeg-enc-fixes-9ff8bf6a491f
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295075; l=3705;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=l9EdD9HrzhlWt2Mxz7G0VDbz8OEfjBCsYmrzJUDKy3g=;
 b=pi/yod5JmjP0rOoxwnmNHQb0ZQ9V1eeK6lS4pqG836wIV8uK2VFJ0ld9b0TW9Sn74GkP4W7tE
 RWNvxT+f1D5CsFH+e3+Jq+ye8xhJODewYuTAGrk7Fy1Bks++w55aSky
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: aiyengar1990@gmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series fixes the format handling of the Hantro JPEG encoders,
found with v4l2-ctl, v4l2-compliance and GStreamer on the RK3588
VEPU121.

The encoder accepted a CAPTURE sizeimage far too small for the selected
resolution, and setting the OUTPUT format never updated the coded size,
so the sequence mandated by the stateful encoder specification (CAPTURE
format first, then OUTPUT) left a 96x32 coded format under a 1920x1088
raw one. The JPEG encoders program the hardware from the OUTPUT size
and use the difference as the crop inside the last macroblock, so this
ended in IOMMU page faults, a frame processing timeout and a wedged
encoder. Patches 1 and 2 fix the two ioctl paths, patch 3 refuses a job
whose geometry or CAPTURE buffer the hardware can't be programmed with,
as a last line of defence, and patch 4 reports the fixed colorimetry of
JPEG instead of propagating whatever the application set, which also
fixes a v4l2-compliance failure on the encoder.

Patch 5 fixes a CAPTURE S_FMT that v4l2-ctl --stream-mmap issues after
the OUTPUT queue is set up: it failed with -EBUSY but left the raw
format descriptor reset to the default (three planes) under a
negotiated two-plane format, so the next job read a plane from IOVA 0.

Patch 6 limits the advertised frame size to 8176x8176: both Rockchip
encoder register layouts hold the size in 9-bit macroblock counts, so
8192 was programmed as 0 macroblocks.

Tested on an Orange Pi 5 (RK3588S, VEPU121): with patches 1-5, an
explicit CAPTURE 1920x1080 JPEG plus OUTPUT NM12 stream gives 8
decodable 1920x1088 frames, a requested sizeimage of 1000 is raised to
4178544 and a larger one is kept, G_FMT on CAPTURE follows the OUTPUT
format, v4l2-compliance passes 49/49 (58/58 with streaming) with sRGB /
ITU-R 601 / full range on both queues, nine GStreamer v4l2jpegenc
pipelines reach EOS, and v4l2-ctl --stream-mmap no longer faults. Patch
3's checks are not reachable from userspace once patches 1 and 2 are
applied; no run printed them. With patch 6, NV12, I420, YUYV and UYVY
encodes from 96x96 up to 8176x8176 (including 8176x1080, 1920x8176 and
a cropped 8168x8164) decode back at 53 dB PSNR, 8192 wide or high is
refused at S_FMT, and a probe with the reserved bit above each field
set showed the hardware does not take a 512 macroblock count.

This series was developed with Claude (Anthropic) as a coding assistant:
it wrote the code and the commit messages, and I reviewed and tested
every change as described above.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Arun Iyengar (6):
      media: verisilicon: Enforce a minimum CAPTURE sizeimage for the encoder
      media: verisilicon: Keep the encoder coded size in sync with OUTPUT
      media: verisilicon: Refuse JPEG encode jobs with inconsistent geometry
      media: verisilicon: Report fixed JPEG colorimetry on the encoder
      media: verisilicon: Don't reset the encoder raw format while OUTPUT buffers exist
      media: verisilicon: rockchip: Limit the JPEG encoder to 8176x8176

 .../platform/verisilicon/hantro_h1_jpeg_enc.c      |  5 ++
 drivers/media/platform/verisilicon/hantro_jpeg.c   | 37 +++++++++
 drivers/media/platform/verisilicon/hantro_jpeg.h   |  5 ++
 drivers/media/platform/verisilicon/hantro_v4l2.c   | 88 +++++++++++++++++++---
 .../verisilicon/rockchip_vpu2_hw_jpeg_enc.c        |  5 ++
 .../media/platform/verisilicon/rockchip_vpu_hw.c   | 11 ++-
 6 files changed, 139 insertions(+), 12 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261110-hantro-jpeg-enc-fixes-9ff8bf6a491f

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>



