Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F61FC43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 08:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GqB+pMEeOX9h0udH1mNyDv5eJ9rhofvXzOhjJhiuvEo=; b=jgMsjge1jZuD4mI3MN/u52nxzB
	zFCT1qrYxW/ZNhiLTZXZ077B5/scHjLuMbH83G9cVIZB3JcGLzu444m/H9qHvK3x0AcIk2gvu1jDX
	oiRqy7dxl7O5xyWokerhqea8BrYbHRp++BKSJ++dnYM1Bt+PvTR8LdDlMlhQ3wL/GjkJkVpPXaCHn
	yZjs8xqqLD5Hv84rdSOY/X0/Hr/62xFfrrFZdI1aKj6cWhcZaRxtOMtAFUx9zniUYYK8/seEAwfR6
	l/gWH+pIjTpsvBih/AOhah2ZMSYIzhhQq31wFL+kf1h+T+4qOk8gguxoRN2tF6ayQgaALqKozYXGy
	tPfKMc8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o90IO-007LOR-S4; Wed, 06 Jul 2022 08:22:04 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o90IL-007LKG-5A
	for linux-mediatek@lists.infradead.org; Wed, 06 Jul 2022 08:22:02 +0000
Received: by mail-pj1-x1031.google.com with SMTP id g16-20020a17090a7d1000b001ea9f820449so19578033pjl.5
        for <linux-mediatek@lists.infradead.org>; Wed, 06 Jul 2022 01:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GqB+pMEeOX9h0udH1mNyDv5eJ9rhofvXzOhjJhiuvEo=;
        b=f861gyIxenkTm+IPNvjX90TJpK8xwY78UPnvHnHpBQkEmmP3Pakp40vpyQs76NTHSq
         Rh8X4FpXt9QVv7u8+RGbIWr8ewjvWoTYUnuwD2ZAWkWD0BLeIUh1pMmIN/JW4Qat1dwS
         0t3cPjwJA+b3yyScwzC2WyIGy/SjfidVMC9h4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GqB+pMEeOX9h0udH1mNyDv5eJ9rhofvXzOhjJhiuvEo=;
        b=m5l+1KOaBHRdE0XP9yaEXVLDCPsmtY722SIZUwgXFEx9FhkEHcxIn61FgeVoTlwLA5
         WDVWF43RhN3yv+rxUfwI8g/aQn43C+9pLygUzLoVxr8v3clJWeLIPfBdLGoBDsQD3Lr2
         8MS0a6wv2TIQV83rt8PyYXSRhmU6GBCZMm8lueMqSK4tp3rlTdLMixrP1BbI6eD7Kmnq
         vSmftIknXX/TE5u04OZcd/CNBc1WOvLNcScMlfEn2muGJ4Fer3G6YvMBJ3sgTVkeGoIa
         o8ZP8Wnw3Dl8xDFRx9EVlSylfq9ReTOdcZpJypL3mu/dMskmkuiwg+FYfzleQVpfz4IQ
         wrdw==
X-Gm-Message-State: AJIora/divk5IlDYocFYgo55yMliomLz3XwpJoPeO9fwAQGPtIAuOSVJ
	JuTaRXN4pKi+67AsKQr3bfeDtA==
X-Google-Smtp-Source: AGRyM1tsd4xWLnRQhFWsHSq5ng2txHr8cKx03t+O3C5k4KZzMRDXo6+93OUir8+OQCbeF7eGyCMN2w==
X-Received: by 2002:a17:902:b586:b0:16b:ec53:a660 with SMTP id a6-20020a170902b58600b0016bec53a660mr11343900pls.24.1657095717673;
        Wed, 06 Jul 2022 01:21:57 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:74a3:a7a4:af57:d7f])
        by smtp.gmail.com with ESMTPSA id rm1-20020a17090b3ec100b001ed27d132c1sm20767040pjb.2.2022.07.06.01.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 01:21:57 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH v2 0/6] media: mediatek: vcodec: Fix 4K decoding support
Date: Wed,  6 Jul 2022 16:21:32 +0800
Message-Id: <20220706082138.2668163-1-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_012201_281208_ED997D9E 
X-CRM114-Status: GOOD (  13.05  )
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

This is v2 of the mtk-vcodec 4K decoder fixes.

While testing a backport of recent mtk-vcodec developments on ChromeOS
v5.10 kernel [1], it was found that 4K decoding support had regressed.
The decoder was not correctly reporting 4K frame sizes when queried,
and ChromeOS then determined that the hardware did not support it.

This turned out to be a mix of different bugs:

1. Frame size enumeration on the output side should not depend on the
   currently set format, or any other derived state. This is fixed in
   patch 2.

2. TRY_FMT on the output side was incorrectly clamping the resolution
   based on the current maximum values. It should not. Fixed in patch
   4.

3. The default resolution limit was not set according to the default
   output format determined at runtime, but hard-coded to 1080p. An
   S_FMT call is needed to override this. The instance resolution limit
   is rendered useless after patches 3 and 4, and dropped in patch 5.

Other patches:
- Patch 1 makes stepwise_fhd constant.
- Patch 3 drops redundant aligning of default resolution
- Patch 6 moves framesize inside mtk_video_fmt, making it easier to
  access and removes a list search that was added in patch 4.

Changes since v1:
  - Added patch to const-ify stepwise_fhd, as Nicolas requested.
  - Dropped old patch 2 (media: mediatek: vcodec: dec: Set default
    max resolution based on format)
  - Dropped old patch 4 (media: mediatek: vcodec: dec: Set maximum
    resolution when S_FMT on output only)
  - Made max resolution lookup for TRY_FMT return stepwise structure in
    patch 4, which helps with the last patch that moves framesize
    stepwise into mtk_video_fmt.
  - Did some style cleanups in patch 4

This series is based on next-20220705.

This was only tested on the backport kernel [1] on MT8195, which is the
only currently supported SoC that does 4K decoding. Hopefully the folks
at Collabora can give this a test on their mainline MT8195 integration
branch.


Regards
ChenYu

[1] https://crrev.com/c/3713491

Chen-Yu Tsai (6):
  media: mediatek: vcodec: decoder: Const-ify stepwise_fhd
  media: mediatek: vcodec: decoder: Fix 4K frame size enumeration
  media: mediatek: vcodec: decoder: Skip alignment for default
    resolution
  media: mediatek: vcodec: decoder: Fix resolution clamping in TRY_FMT
  media: mediatek: vcodec: decoder: Drop max_{width,height} from
    mtk_vcodec_ctx
  media: mediatek: vcodec: decoder: Embed framesize inside mtk_video_fmt

 .../platform/mediatek/vcodec/mtk_vcodec_dec.c | 54 ++++++++-----------
 .../mediatek/vcodec/mtk_vcodec_dec_stateful.c | 29 +++-------
 .../vcodec/mtk_vcodec_dec_stateless.c         | 30 +++++------
 .../platform/mediatek/vcodec/mtk_vcodec_drv.h | 20 +------
 4 files changed, 41 insertions(+), 92 deletions(-)

-- 
2.37.0.rc0.161.g10f37bed90-goog


