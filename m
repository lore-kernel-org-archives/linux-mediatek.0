Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81164C35FFC
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Mar 2025 14:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xCOJMUq3PK0BMYSqiQtkKUDSLdvCP0iZpv4PhLigFj0=; b=0GqeeBm6YHhBhz4Y8Rtx/xIc5+
	Uqr4e6fZOU4tXN1Cc5yDgMSHRP7Hyg9xYbSjemDVlye5uHGSx61b0wc7edAE8hMGP/UHBgxxYK0wX
	M+IWoI+sYRSyVbuMOSH3j78bURiWVd8wpXJezZVyFY0MhaRqsfpU82MtaFwKgA0Ul30snRGRsUb4q
	g/CJvYNP11pwQKVBkyonlfM8OxWtcLtpeDmlfO/QYhN4wYiOERm4RLiLR0dhnSviPuGU6oykSPjDL
	MQef5fmuDBJRj2yE1aZYKZoY/xGYoF9I6BKwPie/SCMxbVm6M2mGvehS9fZlfSaZ0JgngBO+FBj1g
	XynebUQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tutxe-000000098wA-2aut;
	Wed, 19 Mar 2025 13:59:58 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tutxb-000000098vc-1ZTs
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Mar 2025 13:59:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742392793;
	bh=APDZVFnLzsCbVAurBzbu6VmJnhYacC7o2vLBpdbSa40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o5tbF23tF06gFDPAa6RJMu+tK4yfW37huCK6y9VBM4UPbJ7U2PAJ+eHhY64lpOVQq
	 C9g4+ut1oPEzsupuhxJjJdz1Up/jCUH+LovaoS7VHvsYmnsGbOaA3dLneUguoL2xZY
	 d3bf6ln/jjo5nYpvsvVfqLeuY8uh/pqy5yPunVagLPJcrJ44AdMGIHS604OxTV+sTh
	 FV9JKZHMXnZTqQTeqP9SxYhCL/MXaq4JUmugQ6PtlZPUIYC00VZs/Qu6REjEsB49L8
	 aljlKFpvuU1bBr7Zaftdzpn872UiLRmUuOn68fJmonbvcx8BJeYA4ucKssUbsa98a4
	 7h/lqvvowwxUA==
Received: from notapiano (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7665A17E0F9F;
	Wed, 19 Mar 2025 14:59:52 +0100 (CET)
Date: Wed, 19 Mar 2025 10:59:49 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jason Chen <Jason-ch.Chen@mediatek.com>
Subject: Re: [PATCH] mediatek: Add MT8188 SCP firmware
Message-ID: <8049a2ec-b5fe-440d-9704-c3b0e2d610c7@notapiano>
References: <20250319065243.3775352-1-moudy.ho@mediatek.com>
 <20250319065243.3775352-2-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250319065243.3775352-2-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_065955_560824_051809F0 
X-CRM114-Status: UNSURE (   7.81  )
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

On Wed, Mar 19, 2025 at 02:51:56PM +0800, Moudy Ho wrote:
> System Control Processor is an RISC-V processor in MediaTek MT8188 SoC.
> It supports vedio encode/decode, MDP and CrOS EC host command.
> 
> Internal version: geralt_scp_v2.0.27748+eb0d73d0d
> Release version: v2.0.27748
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Thanks Moudy.

Indeed I've verified this firmware has working MDP for format conversion and
stateless video decoding, and that it works with the dual core SCP description.
I've tested the series in [1] and [2]. I'll attach results below for
completeness' sake.

There's some color differences with some of the formats on the MDP (particularly
RGB->YUV), and H.264 decoding doesn't work at all, but otherwise results look
good. Glad to see this firmware going upstream.

Thanks,
Nícolas

[1] https://lore.kernel.org/all/20250318-scp-dual-core-mt8390-v1-0-8733e192cc73@collabora.com
[2] https://lore.kernel.org/all/20241218105320.38980-1-angelogioacchino.delregno@collabora.com/

SCP boot snippet:

  [    2.811141] remoteproc remoteproc0: Booting fw image mediatek/mt8188/scp.img, size 636548
  [    2.812230] platform 10500000.scp: IPI buf addr 0x000cfb40
  [    2.866395] platform 10500000.scp: SCP is ready. FW version geralt_scp_v2.0.27748+eb0d73d0d
  [    2.866395] platform 10500000.scp: creating channel cros-ec-rpmsg addr 0xd
  [    2.867483] remoteproc remoteproc0: remote processor scp is now up

Stateless video decoding:

  fluster run -d GStreamer-VP8-V4L2SL-Gst1.0 -ts VP8-TEST-VECTORS
  Ran 57/61 tests successfully               in 1.856 secs
  fluster run -d GStreamer-VP9-V4L2SL-Gst1.0 -ts VP9-TEST-VECTORS
  Ran 254/305 tests successfully               in 46.863 secs
  fluster run -d GStreamer-VP9-V4L2SL-Gst1.0 -ts VP9-TEST-VECTORS-HIGH
  Ran 0/6 tests successfully               in 2.158 secs
  fluster run -d GStreamer-H.264-V4L2SL-Gst1.0 -ts JVT-FR-EXT
  Ran 0/69 tests successfully               in 115.867 secs
  fluster run -d GStreamer-H.264-V4L2SL-Gst1.0 -ts JVT-AVC_V1
  Ran 0/135 tests successfully               in 286.906 secs
  fluster run -d GStreamer-H.265-V4L2SL-Gst1.0 -ts JCT-VC-RExt
  Ran 0/49 tests successfully               in 21.856 secs
  fluster run -d GStreamer-H.265-V4L2SL-Gst1.0 -ts JCT-VC-MV-HEVC
  Ran 6/9 tests successfully               in 3.129 secs
  fluster run -d GStreamer-H.265-V4L2SL-Gst1.0 -ts JCT-VC-HEVC_V1
  Ran 142/147 tests successfully               in 35.726 secs
  fluster run -d GStreamer-H.265-V4L2SL-Gst1.0 -ts JCT-VC-SCC
  Ran 0/15 tests successfully               in 28.171 secs
  fluster run -d GStreamer-AV1-V4L2SL-Gst1.0 -ts CHROMIUM-8bit-AV1-TEST-VECTORS
  Ran 11/13 tests successfully               in 1.542 secs
  fluster run -d GStreamer-AV1-V4L2SL-Gst1.0 -ts CHROMIUM-10bit-AV1-TEST-VECTORS
  Ran 22/23 tests successfully               in 0.899 secs
  fluster run -d GStreamer-AV1-V4L2SL-Gst1.0 -ts AV1-TEST-VECTORS
  Ran 237/239 tests successfully               in 6.598 secs

Stateless video decoding with single job:

  fluster run -j 1 -d GStreamer-VP8-V4L2SL-Gst1.0 -ts VP8-TEST-VECTORS
  Ran 61/61 tests successfully               in 8.476 secs
  fluster run -j 1 -d GStreamer-VP9-V4L2SL-Gst1.0 -ts VP9-TEST-VECTORS
  Ran 265/305 tests successfully               in 169.501 secs
  fluster run -j 1 -d GStreamer-VP9-V4L2SL-Gst1.0 -ts VP9-TEST-VECTORS-HIGH
  Ran 1/6 tests successfully               in 2.813 secs
  fluster run -j 1 -d GStreamer-H.264-V4L2SL-Gst1.0 -ts JVT-FR-EXT
  Ran 0/69 tests successfully               in 143.806 secs
  fluster run -j 1 -d GStreamer-H.264-V4L2SL-Gst1.0 -ts JVT-AVC_V1
  Ran 0/135 tests successfully               in 244.404 secs
  fluster run -j 1 -d GStreamer-H.265-V4L2SL-Gst1.0 -ts JCT-VC-RExt
  Ran 2/49 tests successfully               in 60.082 secs
  fluster run -j 1 -d GStreamer-H.265-V4L2SL-Gst1.0 -ts JCT-VC-MV-HEVC
  Ran 6/9 tests successfully               in 11.999 secs
  fluster run -j 1 -d GStreamer-H.265-V4L2SL-Gst1.0 -ts JCT-VC-HEVC_V1
  Ran 142/147 tests successfully               in 119.169 secs
  fluster run -j 1 -d GStreamer-H.265-V4L2SL-Gst1.0 -ts JCT-VC-SCC
  Ran 0/15 tests successfully               in 48.755 secs
  fluster run -j 1 -d GStreamer-AV1-V4L2SL-Gst1.0 -ts CHROMIUM-8bit-AV1-TEST-VECTORS
  Ran 11/13 tests successfully               in 6.151 secs
  fluster run -j 1 -d GStreamer-AV1-V4L2SL-Gst1.0 -ts CHROMIUM-10bit-AV1-TEST-VECTORS
  Ran 22/23 tests successfully               in 4.718 secs
  fluster run -j 1 -d GStreamer-AV1-V4L2SL-Gst1.0 -ts AV1-TEST-VECTORS
  Ran 237/239 tests successfully               in 45.509 secs

MDP format conversion and comparison to reference using avvideocompare:

  Command used:

    gst-launch-1.0 videotestsrc num-buffers=1 ! video/x-raw,framerate=30/1,width=1920,height=1080,format=ARGB ! videoconvert ! tee name=t \
      t. ! queue ! videoconvert ! video/x-raw,framerate=30/1,width="$W_IN",height="$H_IN",format="$FORMAT_IN" ! v4l2convert ! video/x-raw,framerate=30/1,width="$W_OUT",height="$H_OUT",format="$FORMAT_OUT" ! videoconvert ! video/x-raw,framerate=30/1,width=1920,height=1080,format=ARGB ! cmp. \
      t. ! queue ! cmp. \
      avvideocompare name=cmp stats-file=mdp-stats.txt ! videoconvert ! pngenc ! filesink location=mdp-output-$FORMAT_IN-${W_IN}x$H_IN-$FORMAT_OUT-${W_OUT}x$H_OUT.png >/dev/null

  Results:

    mdp-output-RGB-1920x1080-RGB-1920x1080.png
    n:1 R:1.000000 G:1.000000 B:1.000000 All:1.000000 (inf)
    mdp-output-RGB-1920x1080-BGR-1920x1080.png
    n:1 R:0.711601 G:0.999968 B:0.665514 All:0.792361 (6.826908)
    mdp-output-RGB-1920x1080-GRAY8-1920x1080.png
    n:1 R:0.523243 G:0.623202 B:0.537468 All:0.561304 (3.578367)
    mdp-output-RGB-1920x1080-RGB16-1920x1080.png
    n:1 R:0.999621 G:0.999665 B:0.999600 All:0.999629 (34.303583)
    mdp-output-RGB-1920x1080-BGRA-1920x1080.png
    n:1 R:0.711601 G:0.999968 B:0.665514 All:0.792361 (6.826908)
    mdp-output-RGB-1920x1080-ARGB-1920x1080.png
    n:1 R:0.711601 G:0.999968 B:0.665514 All:0.792361 (6.826908)
    mdp-output-RGB-1920x1080-UYVY-1920x1080.png
    n:1 R:0.976468 G:0.775003 B:0.976679 All:0.909383 (10.427914)
    mdp-output-RGB-1920x1080-YUY2-1920x1080.png
    n:1 R:0.976468 G:0.775003 B:0.976679 All:0.909383 (10.427914)
    mdp-output-RGB-1920x1080-YVYU-1920x1080.png
    n:1 R:0.976468 G:0.775003 B:0.976679 All:0.909383 (10.427914)
    mdp-output-RGB-1920x1080-Y42B-1920x1080.png
    n:1 R:0.976468 G:0.775003 B:0.976679 All:0.909383 (10.427914)
    mdp-output-RGB-1920x1080-I420-1920x1080.png
    n:1 R:0.978219 G:0.775121 B:0.977282 All:0.910207 (10.467595)
    mdp-output-RGB-1920x1080-YV12-1920x1080.png
    n:1 R:0.978219 G:0.775121 B:0.977282 All:0.910207 (10.467595)
    mdp-output-RGB-1920x1080-NV12-1920x1080.png
    n:1 R:0.971726 G:0.773995 B:0.972451 All:0.906057 (10.271370)
    mdp-output-RGB-1920x1080-NV21-1920x1080.png
    n:1 R:0.971726 G:0.773995 B:0.972451 All:0.906057 (10.271370)
    mdp-output-RGB-1920x1080-NV16-1920x1080.png
    n:1 R:0.976468 G:0.775003 B:0.976679 All:0.909383 (10.427914)
    mdp-output-RGB-1920x1080-NV61-1920x1080.png
    n:1 R:0.976468 G:0.775003 B:0.976679 All:0.909383 (10.427914)
    mdp-output-YVYU-1920x1080-YVYU-1920x1080.png
    n:1 R:0.987354 G:0.989508 B:0.988062 All:0.988308 (19.321067)
    mdp-output-YVYU-1920x1080-RGB-1920x1080.png
    n:1 R:0.928199 G:0.993958 B:0.844533 All:0.922230 (11.091892)
    mdp-output-YVYU-1920x1080-GRAY8-1920x1080.png
    n:1 R:0.448041 G:0.540839 B:0.474512 All:0.487797 (2.905581)
    mdp-output-YVYU-1920x1080-RGB16-1920x1080.png
    n:1 R:0.997089 G:0.993692 B:0.996848 All:0.995876 (23.847107)
    mdp-output-YVYU-1920x1080-BGR-1920x1080.png
    n:1 R:0.928199 G:0.993958 B:0.844533 All:0.922230 (11.091892)
    mdp-output-YVYU-1920x1080-BGRA-1920x1080.png
    n:1 R:0.928199 G:0.993958 B:0.844533 All:0.922230 (11.091892)
    mdp-output-YVYU-1920x1080-ARGB-1920x1080.png
    n:1 R:0.928199 G:0.993958 B:0.844533 All:0.922230 (11.091892)
    mdp-output-YVYU-1920x1080-UYVY-1920x1080.png
    n:1 R:0.991598 G:0.642711 B:0.991576 All:0.875295 (9.041151)
    mdp-output-YVYU-1920x1080-YUY2-1920x1080.png
    n:1 R:0.991598 G:0.642711 B:0.991576 All:0.875295 (9.041151)
    mdp-output-YVYU-1920x1080-YVYU-1920x1080.png
    n:1 R:0.987354 G:0.989508 B:0.988062 All:0.988308 (19.321067)
    mdp-output-YVYU-1920x1080-Y42B-1920x1080.png
    n:1 R:0.991598 G:0.642711 B:0.991576 All:0.875295 (9.041151)
    mdp-output-YVYU-1920x1080-I420-1920x1080.png
    n:1 R:0.997424 G:0.644937 B:0.996892 All:0.879751 (9.199194)
    mdp-output-YVYU-1920x1080-YV12-1920x1080.png
    n:1 R:0.997424 G:0.644937 B:0.996892 All:0.879751 (9.199194)
    mdp-output-YVYU-1920x1080-NV12-1920x1080.png
    n:1 R:0.984776 G:0.641210 B:0.985780 All:0.870588 (8.880271)
    mdp-output-YVYU-1920x1080-NV21-1920x1080.png
    n:1 R:0.984776 G:0.641210 B:0.985780 All:0.870588 (8.880271)
    mdp-output-YVYU-1920x1080-NV16-1920x1080.png
    n:1 R:0.991598 G:0.642711 B:0.991576 All:0.875295 (9.041151)
    mdp-output-YVYU-1920x1080-NV61-1920x1080.png
    n:1 R:0.991598 G:0.642711 B:0.991576 All:0.875295 (9.041151)

