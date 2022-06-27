Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844D8C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jun 2022 11:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o2g5Ldg/I/cSNmt5LyWh3PGUjmhi+xrQzjDLIO63cF8=; b=Yt2RJXis9OS4NrF++dW9MYVrKa
	27q5g+SFLnD4SjOFwtL67+K8qNh4WMGhp6WZSAEjOJEUGpbhF6DzdvmG6+QyMtL8yD9Zg7OOC+ZEw
	fBPkZSOU6APTbkyUeSE6LXdSYKN3X99ujXPmqfTzf56xtGICQ4L+jpN6omkUms7gMIJaU8yGBNQSS
	YUCa9Pz+L4xtHWdbF7qsCFllvabcx1dJkto/qRK9gzngPewtTBMaFAJlvcEIOBilCNS2rMWiWLb8X
	W4wTARffEJLfiY9N3tnrQS8hjCJzf1Hj6pAuFXmLBIvFu4obc6CJWyjS1TQJ6fEoGuJAZg7PLbdm3
	giGpb5yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5mrV-000TVr-KW; Mon, 27 Jun 2022 11:25:01 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5mrS-000TUN-NO
	for linux-mediatek@lists.infradead.org; Mon, 27 Jun 2022 11:25:00 +0000
Received: by mail-pj1-x1036.google.com with SMTP id n16-20020a17090ade9000b001ed15b37424so9109334pjv.3
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Jun 2022 04:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o2g5Ldg/I/cSNmt5LyWh3PGUjmhi+xrQzjDLIO63cF8=;
        b=KnHwizho8n+ujcf81Nq3ubS+lXqtmMZXdNk+CtXA9EkbySLxUMsT09fsicneCRucZ+
         CzgVqIQEqhnE217otouh10UJFRl52KfWnEL6IOtfO7OierpB2srQRGfDTytvfHGKPLWM
         xghGsj4d/WRlrfrYApPlEWga7mixLW5pX9maA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o2g5Ldg/I/cSNmt5LyWh3PGUjmhi+xrQzjDLIO63cF8=;
        b=NQ/l5JibIIsXi+jPxK1DHo10ZW8j1BVaVFtQSnYKhzX/FsoO3fWTZoUtmuA9xHsjKW
         t2cDQDpp+tol9aTJzP8utVGpvTXLHwuSI96YTrc2qFrXQgOEPt3AEWT3jicyE1ux1oVe
         mssKgdwkM15lm3aV/ryepdSQyFOom6bAj12v0XcLqR1BqTdB6sHzbfwLE6yE2vLG5DaV
         JC1HKT4rwgRctBzHyRa5lERMwFNqIEvCG6+Z15v4aPxpu/FlYrU5LvW/2ez65hWAIyT0
         JTU5LlTrmRdgWzRQU9Hh9TNi7wLJbrEypnJOfL6PBVJjQGRyKX4UADPKHARRfKCtx6QM
         vBbQ==
X-Gm-Message-State: AJIora+KhGHLshtQrv5LyUB17J4aQrANQqTcKW5VJtDkogmCMNt43yCS
	PXVttu/YcP6JX7Kol1y40kvKDw==
X-Google-Smtp-Source: AGRyM1saXkC/duFsfRvk4UdfX+kVIKUM9JPJ761lPsGD6drYEJ/WKXgV9kTcrRtAEWz7H6k3TspbHg==
X-Received: by 2002:a17:902:988a:b0:16a:7f1b:552 with SMTP id s10-20020a170902988a00b0016a7f1b0552mr10307483plp.60.1656329097453;
        Mon, 27 Jun 2022 04:24:57 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2dc1:c31b:b5ed:f3aa])
        by smtp.gmail.com with ESMTPSA id lj4-20020a17090b344400b001ece32cbec9sm9246889pjb.24.2022.06.27.04.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 04:24:57 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>
Subject: [PATCH 0/4] media: mediatek: vcodec: Fix 4K decoding support
Date: Mon, 27 Jun 2022 19:23:58 +0800
Message-Id: <20220627112402.2332046-1-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_042458_842143_33889946 
X-CRM114-Status: GOOD (  14.08  )
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

While testing a backport of recent mtk-vcodec developments on ChromeOS
v5.10 kernel [1], it was found that 4K decoding support had regressed.
The decoder was not correctly reporting 4K frame sizes when queried,
and ChromeOS then determined that the hardware did not support it.

This turned out to be a mix of different bugs:

1. Frame size enumeration on the output side should not depend on the
   currently set format, or any other derived state. This is fixed in
   patch 1.

2. The default resolution limit was not set according to the default
   output format determined at runtime, but hard-coded to 1080p. An
   S_FMT call is needed to override this. This is fixed in patch 2.

3. TRY_FMT on the output side was incorrectly clamping the resolution
   based on the current maximum values. It should not. Fixed in patch
   3.

The last patch fixes an odd error in the bug, where the maximum
resolution restriction could be lifted to 4K, even if the output format
doesn't allow it. In practice this wouldn't cause any issues given the
other fixes in this series and other existing checks in both the driver
and V4L2 core, but it seemed easy to fix.

This series is based on next-20220627 with media-staging at

     d8e8aa866ed8 ("media: mediatek: vcodec: Report supported bitrate modes")

merged in.

This was only tested on the backport kernel [1] on MT8195, which is the
only currently supported SoC that does 4K decoding. Hopefully the folks
at Collabora can give this a test on their mainline MT8195 integration
branch.


Regards
ChenYu

[1] https://crrev.com/c/3713491

Chen-Yu Tsai (4):
  media: mediatek: vcodec: dec: Fix 4K frame size enumeration
  media: mediatek: vcodec: dec: Set default max resolution based on
    format
  media: mediatek: vcodec: dec: Fix resolution clamping in TRY_FMT
  media: mediatek: vcodec: dec: Set maximum resolution when S_FMT on
    output only

 .../platform/mediatek/vcodec/mtk_vcodec_dec.c | 45 ++++++++++++++-----
 .../vcodec/mtk_vcodec_dec_stateless.c         |  7 +++
 2 files changed, 41 insertions(+), 11 deletions(-)

-- 
2.37.0.rc0.161.g10f37bed90-goog


