Return-Path: <SRS0=G+wW=HE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B03C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 08:13:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F395D64EE9
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 08:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F395D64EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9OE7145K25XDq+l9cFdIndKzEp7HaFZfuEDs03Pbm64=; b=sbhcUlDnOp1vJMvfqhzPINvR7v
	qdMAgBFn8Tek7WJeyC8HF6YAskmLTm/uikWtDkmFgvqt7quoBooWJu1HM7v+fQR88c2X8ReWce2bG
	+wr5W7tADSAcrkMSsFmtAJ9Hp8RMNCN0XKUzn/ujS6mF+6mJ6VLXaKl4lXcsgrph0vQ8zuESM+KGg
	fMfWtA7rkAoozZD7eOsQ6gWQlPrAUPa4q/ntgEncMQUy1msFXyWFDXdKqSCLRSsCsGtfrBWWqf0Od
	2PkiXkDTpTHf4IEkLTLIAMjOZuQkw6WSV9IJ6YExjgTUYi0COujST54wY0k9MMOG9x9sLY/OlQk4c
	t/nNjz7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6qny-0000PS-DH; Tue, 02 Feb 2021 08:12:58 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6qnq-0000KB-W6
 for linux-mediatek@lists.infradead.org; Tue, 02 Feb 2021 08:12:54 +0000
Received: by mail-pf1-x42f.google.com with SMTP id y205so13816322pfc.5
 for <linux-mediatek@lists.infradead.org>; Tue, 02 Feb 2021 00:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y+cMOXMiJhmN+BhMWGOCZ1mGQnNvZ1HLYwA10LUk+qs=;
 b=BE7+LLk41j5m1eELGRoOKzZpOyZhdKiTFcK4TJIWMv79mn6AOaVvhj5IrKMgLIoNO2
 Yo/GV8+n5rFxI6xgYlyjq1XC3z5pn/8bj3GSO8hFplB6ElygbiKiT5A0Efb6BbLVfHgQ
 XNxFBpDG5Xpv/852PpyOFg8QXk4fymYm7pA0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y+cMOXMiJhmN+BhMWGOCZ1mGQnNvZ1HLYwA10LUk+qs=;
 b=TVqVkuamJVIB7cE4T7NupjNGz8DU8EdkcdK/iynBBiI7ONjHzrwFRJGECSgRms72c+
 uSmzXFQ+PfEN+sFug6DHJWDMvzl3Q7aL+7xOP45xnTtZbSgaqBvsC/bSzoHSwrbWYSj9
 OhP5uS7Hkq1JNeGmQCoPIVtUuHP1F7sHn0fyeGMz2NnttTSJRmWSc9FVIUKmcJHHhyvk
 Y8LttDYmCX3d+BsnAIJPcbnfrUbOz2epHpDGzGbGgfL3RnkG6Nz5mOi9VGYvuHoWi9St
 Vjrg2CO25L+Ri/uvTYzZsq9t7G3KohR4IGcjtnDAEqCRyBShAdSQ6xy4jqem4ADxew5f
 su7w==
X-Gm-Message-State: AOAM533KI7KDxTecwy+qtstb5HvimG33W+kBExUhpD7i+XpPdOxlaNer
 0bpKAlpOArV6dahc2ZKCd1RCKw==
X-Google-Smtp-Source: ABdhPJw76yjiccRfuMor3XXLd3rnpk4IlwGPyv9gDv0sKW+2j5Rjt4voUr1UMcCID3auXrXGcyIIpg==
X-Received: by 2002:a63:c743:: with SMTP id v3mr20558822pgg.316.1612253562732; 
 Tue, 02 Feb 2021 00:12:42 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:743e:7944:50c8:ff72])
 by smtp.gmail.com with ESMTPSA id c8sm21343325pfo.148.2021.02.02.00.12.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 00:12:42 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v6 0/8] drm/mediatek: add support for mediatek SOC MT8192
Date: Tue,  2 Feb 2021 16:12:29 +0800
Message-Id: <20210202081237.774442-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_031251_081716_DA3BD518 
X-CRM114-Status: GOOD (  13.20  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series are based on kernel/git/chunkuang.hu/linux.git mediatek-drm-next
and following patch:
("soc: mediatek: add mtk mutex support for MT8183")
https://patchwork.kernel.org/project/linux-mediatek/patch/20210129092209.2584718-8-hsinyi@chromium.org/

This series also depends on component support in mmsys[1]:
- [v4,06/10] soc: mediatek: mmsys: add component OVL_2L2
- [v4,07/10] soc: mediatek: mmsys: add component POSTMASK
- [v4,08/10] soc: mediatek: mmsys: add component RDMA4

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/1609815993-22744-7-git-send-email-yongqiang.niu@mediatek.com/

Change since v5:
- move postmask driver into mtk_drm_ddp_comp
- fix review comments

Change since v4:
- fix review comments

Change since v3:
- change several function to rebase to mediatek-drm-next
- drop pm runtime patches due to it's not related to mt8192 support
- fix review comments in v3

Changes since v2:
- fix review comment in v2
- add pm runtime for gamma and color
- move ddp path select patch to mmsys series
- remove some useless patch

Yongqiang Niu (8):
  drm/mediatek: add component OVL_2L2
  drm/mediatek: add component POSTMASK
  drm/mediatek: add component RDMA4
  drm/mediatek: separate ccorr module
  drm/mediatek: Fix ccorr size config
  drm/mediatek: add matrix_bits private data for ccorr
  soc: mediatek: add mtk mutex support for MT8192
  drm/mediatek: add support for mediatek SOC MT8192

 drivers/gpu/drm/mediatek/Makefile           |   3 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c   | 229 ++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   9 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     |  20 ++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    |   6 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 187 ++++++----------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  50 ++++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
 drivers/soc/mediatek/mtk-mutex.c            |  35 +++
 10 files changed, 421 insertions(+), 120 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c

-- 
2.30.0.365.g02bc693789-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
