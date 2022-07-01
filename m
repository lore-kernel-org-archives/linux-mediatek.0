Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA086CCA479
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 10:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3ab5IJ5FlC2arzoi3kWfdSjGdGoRkJfvUHhC4m41OOk=; b=r5TwIk6IujOllMm1qfvU5n566m
	CMhA7QY0Rrg0GOaPEz8ABoh/reFAw3s5hEiImC5JRe5I4XhARXxewbEkYMUVI3K8tChnhSU00GxOd
	NKwedvtNMyAvEZBY5XJ9tzdzJhRZprcGYyzr3mCIedmYzgaXfAMI+KtARoueQDIVl2jL5dBqCCrGo
	lP9OoX8nQNzF4IL2idGyBwkWNaZPv63kZh1XEgbJk2Fnmvfg+gasof1cqye6s0VdIPXugUGjBQbwR
	wuP7R70L5UOSgeV9ewD3QgkcY+qKSQ5f6lyho4E2RY6sIL4qHFdYv/slti/tNnMzsP0jOqMsVp4Ch
	SG5h08nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7EGu-004Crd-2o; Fri, 01 Jul 2022 10:53:12 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7EGq-004Cp7-9M
	for linux-mediatek@lists.infradead.org; Fri, 01 Jul 2022 10:53:10 +0000
Received: by mail-pf1-x436.google.com with SMTP id x4so2123185pfq.2
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Jul 2022 03:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3ab5IJ5FlC2arzoi3kWfdSjGdGoRkJfvUHhC4m41OOk=;
        b=mtddHLkVMqoogqM4lpgfmAsgGkue45P41hAbtARlD5IRzAri5JNDDXCGek+WlUZmVD
         d5zVOxLl2wnQqzA64eAvtCy0Q7wwOAzx6pAlpCImQerZmioHoWR9LwdNy2Po1fcbfwST
         HDcUXTpvpNx3TYOrPITxyVh91ll+sYpBigJg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3ab5IJ5FlC2arzoi3kWfdSjGdGoRkJfvUHhC4m41OOk=;
        b=w/HOi+jCZAbUbiZuuYA1K9AbbuebF2ROF8WlnRlfn9EPoAbBjSYs9eqBpDOyZxFPvS
         DsMMluXHs97M1jI7Yogo+Zo/C6432lW3U586uSvBszX0IKl76anfubBVmzR3nItsAxcd
         wG8LZLTZfEpWB8eaUQpmbn6PwPKf7f59cZ7rnQW0WhO8wH2poUu33/jEqQUDZzHCFz3S
         Md7hz1KnhWCH6gvduivV547mRQF5JTKXsUE/WBmJO3W+e0J7uw+Fpl/y06X4eIwnwryz
         BJZKc71mmgdmQQUyV46QK3U2+Feo0TBXMYyzr6nyhGxMIvvigenBVcLIN+o6GcT3IFa1
         eA3A==
X-Gm-Message-State: AJIora8otewqWK9eGYyMZzs8o+gR3CUSBp6zVkv/WH2ZI+E/rEJGMuMr
	O/EzxSNAW965FFCy7mzSI+5Wig==
X-Google-Smtp-Source: AGRyM1tw7DbaCi+C/xp94ptdl0n14kYLKVC7KPloTo8sA9w65Gkvnag6DLdW1HXoS6xysBJhFC/7RA==
X-Received: by 2002:aa7:9911:0:b0:525:1bb3:965a with SMTP id z17-20020aa79911000000b005251bb3965amr19804013pff.79.1656672784933;
        Fri, 01 Jul 2022 03:53:04 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:59bf:8b47:50a0:b04f])
        by smtp.gmail.com with ESMTPSA id j2-20020a170902758200b0016a058b7547sm14906670pll.294.2022.07.01.03.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 03:53:04 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 0/6] media: mediatek-vcodec: Fix capability fields again
Date: Fri,  1 Jul 2022 18:52:31 +0800
Message-Id: <20220701105237.932332-1-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_035308_406793_50FD83A2 
X-CRM114-Status: GOOD (  14.77  )
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

Hi everyone,

The previous round of changes to the mtk-vcodec driver's returned
capabilities caused some issues for ChromeOS. In particular, the
ChromeOS stateless video decoder uses the "Driver Name" field to
match a video device to its media device. As the field was only
changed for the video device and not the media device, a match
could no longer be found.

While fixing this, I found that the current info used for the fields
don't make a lot of sense, and tried to fix them in this series.

Patch 1 reverts the driver name field change. It also makes it
explicit that the field really should match the driver name.

Patch 2 changes the value for the card name, making it a free form
string that includes the SoC model.

Patch 3 removes setting the bus_info field, instead using the default
value derived from the underlying |struct device| as set by the V4L2
core.

Patches 4 through 6 do the same as 1 through 3 respectively, but for
the encoder side.

This series is based on next-20220701, and was tested on mainline on
MT8183 Juniper, and on ChromeOS v5.10, on which we have a whole bunch
of backports pending, on MT8195 Tomato.

Please have a look.


Thanks
ChenYu

Chen-Yu Tsai (6):
  media: mediatek: vcodec: Revert driver name change in decoder
    capabilities
  media: mediatek: vcodec: Use meaningful decoder card name including
    chip name
  media: mediatek: vcodec: Use default bus_info for decoder capability
  media: mediatek: vcodec: Revert driver name change in encoder
    capabilities
  media: mediatek: vcodec: Use meaningful encoder card name including
    chip name
  media: mediatek: vcodec: Use default bus_info for encoder capability

 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 7 ++++---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h | 1 +
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c | 7 ++++---
 3 files changed, 9 insertions(+), 6 deletions(-)

-- 
2.37.0.rc0.161.g10f37bed90-goog


