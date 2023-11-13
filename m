Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AA0C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Nov 2023 12:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=py+4SutQqV3+4rqQPYSiHKI4gA9eXI6g2jeOqoYb50s=; b=1BCLWoqF3u/7Eg
	anWUh5hqqU9BrXj0OslrLOn8kxCyd6jmDTHKDDkxdmBt8Bihr6VXrw1gtZjAvEBuSBSyFEKcF1qJs
	xo434qOnpvOF1rX7R82n5zU3vWnnequ09WnuKqTNSHkNbNYPOLDWGzsG4yjyt9Rek3qc96hDZHXE5
	CSM585Vyfg/hWbtXlnCdnOg5aLFd6xIndskOcKKjCAJUcR8H6bphWPxNI+0QdzCHyJZ0lbQLoi3d/
	eXfObDkYcS3n+kTG/pwc6KirtDFH/3oWIzAH5I3h8eyFCik1g0L64ZAsUmWbIA3aAMmLDcJpByz6v
	7VeA0oCtUcffpFqXvm/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2W6w-00DxpO-2E;
	Mon, 13 Nov 2023 12:32:14 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2W6t-00Dxke-2n
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Nov 2023 12:32:13 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1cc5fa0e4d5so38861415ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Nov 2023 04:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699878723; x=1700483523; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=py+4SutQqV3+4rqQPYSiHKI4gA9eXI6g2jeOqoYb50s=;
        b=j3tVTHQFBuIPbyafjNYjE9ggu+DgqBOQU/4iANt6xvTdIUqyyGNces1J/Kw9RAylr4
         UJaFr+R0VLii/L/w5wYz8lmmFVsUKU6qY9mLlqOkOiuwLYu8ApNSX/O4x3Lwu7bOj6US
         2M/Etdj/RcqGGk541ljThQK0Tq3pxkz3Zn+G8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699878723; x=1700483523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=py+4SutQqV3+4rqQPYSiHKI4gA9eXI6g2jeOqoYb50s=;
        b=b7S+LmjALZWhq2TC+r9pbgQNOSgd4XH2ZXbsXG6IZdmiqGXjLMSSeq7NCznf7IB4s2
         e3rC8A4Il0LEKRyZvFz7pllT/UTeXuCVIuCf8F0MhciCck5CYQbef3WOy+t4Cjhkal6X
         lCdArqGADu9gRZXgF6dXIdBqbGx55XLhTldJqWvhGwce301bKa07ZYTY2cz/2GGMqjs9
         btmYNKwvwSwPvuanDmvHBqQPndT81xXnSNekO/TsL/S/4HVOw7YcWbxtS6zb5UQQzRjg
         On+XDMRZs+wAo4QZArRlBnjXjYyTzflDFkUc7Mq4QcHE3wYK+tu+IkLEAGswK9O7rp7I
         H1sg==
X-Gm-Message-State: AOJu0YzP5osykGUNKkkNMTLYTbkCErA5512eeZ+Dh/7uJZ1ilD+tTmSN
	wGaeGBiwPVQTOl61rhvGpAkqSg==
X-Google-Smtp-Source: AGHT+IHEgiuNFFVDdx270O6Oa6UBDR2x3iAow64arQ4fbeLxoenvFolURDN435oi95jJKjzlfm9Imw==
X-Received: by 2002:a17:902:f686:b0:1ce:19cd:b9c4 with SMTP id l6-20020a170902f68600b001ce19cdb9c4mr5539445plg.3.1699878722789;
        Mon, 13 Nov 2023 04:32:02 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:bc9:4777:173:8be3])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902d38c00b001bde65894c8sm3924104pld.268.2023.11.13.04.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 04:32:02 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/4] Improvement around mtk_vcodec_mem_free() logging and usage
Date: Mon, 13 Nov 2023 20:26:48 +0800
Message-ID: <20231113123049.4117280-1-fshao@chromium.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_043211_942896_602806C7 
X-CRM114-Status: UNSURE (   9.04  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>, Irui Wang <irui.wang@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, linux-kernel@vger.kernel.org, Tiffany Lin <tiffany.lin@mediatek.com>, Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series includes some improvements around mtk_vcodec_mem_free() in
mtk_vcodec_util.c.

I noticed that mtk_vcodec_mem_free() generates a spurious error if the
target DMA buffer has been freed previously:
  mtk_vcodec_mem_free(),69: [MTK_V4L2][ERROR] 18000000.video-codec
  dma_free size=0 failed!

It's actually harmless, but it brings some confusion to our developers
and testing infra so I'd like to fix it. Then I found some checks around
mtk_vcodec_mem_free() usages in the driver that can optimized together,
so I wrapped both into this series.

The first two patches are for aesthetic and style improvements, the
third suppresses the error mentioned above, and the last removes the
redundant code for optimization.

Regards,
Fei


Fei Shao (4):
  media: mediatek: vcodec: Replace dev_name in error string
  media: mediatek: vcodec: Drop unnecessary variable
  media: mediatek: vcodec: Fix mtk_vcodec_mem_free() error log criteria
  media: mediatek: vcodec: Drop VA check against mtk_vcodec_mem_free()

 .../mediatek/vcodec/common/mtk_vcodec_util.c  | 23 +++++++--------
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 18 ++++--------
 .../vcodec/decoder/vdec/vdec_h264_if.c        |  9 ++----
 .../vcodec/decoder/vdec/vdec_h264_req_if.c    |  9 ++----
 .../decoder/vdec/vdec_h264_req_multi_if.c     |  6 ++--
 .../decoder/vdec/vdec_hevc_req_multi_if.c     |  9 ++----
 .../vcodec/decoder/vdec/vdec_vp8_if.c         |  4 +--
 .../vcodec/decoder/vdec/vdec_vp8_req_if.c     | 12 +++-----
 .../vcodec/decoder/vdec/vdec_vp9_if.c         | 15 ++++------
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 29 +++++++------------
 .../mediatek/vcodec/decoder/vdec_msg_queue.c  | 15 ++++------
 11 files changed, 54 insertions(+), 95 deletions(-)

-- 
2.42.0.869.gea05f2083d-goog


