Return-Path: <SRS0=pvhC=NQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D11C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 06:34:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B59A61245
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 06:34:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B59A61245
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VSan26M6/DgyFSqhMFsV+Tb5TJenYk/9IHmJy/BOmMY=; b=R/Yax17MJpa9/j
	tuPqLODbPND6R3/s06j9vD1vSOnhgynumZCBKdEZg1piK1HkXZJLAlm4vdCaFPahaWDgQOCiYkB2m
	MudPle6Q1JFFtuvDQXPmyceYhcDmSwOru3hnRFxL3cWKs4pO38idztZwLEPRiFzsieliwGDegqMKq
	J+prOFNosFPvVBBfoZJlacjGZhL9toLDyxu9sxrsgf3wC0fgpKlz1UtKsuW0OI+dgm29EWXJOJBuv
	4jQ3VYuKOqiWDK/1u3G/lwDnSPrca+T7ze4Ek736/fTFejw+/0fXomFGGBFk6dqYuLDXHKQsahk44
	f436DjwNkgHgbgGmuPcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mImTz-005fTN-GW; Wed, 25 Aug 2021 06:33:55 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mImTu-005fQu-9z
 for linux-mediatek@lists.infradead.org; Wed, 25 Aug 2021 06:33:54 +0000
Received: by mail-pj1-x1031.google.com with SMTP id fs6so2405115pjb.4
 for <linux-mediatek@lists.infradead.org>; Tue, 24 Aug 2021 23:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9K6fTrQKg0eyCvlXAdZKTTOOHMG9DmPNgjH8VJOHFo8=;
 b=OAIQQotobDg4VABTCD5AWF/CvuSWI78aJCtku35mN5kwCsHPAPuVCyWObgau2soem1
 X2ePrCNej9Mw4S1woXgMFDEbk8tBXUM2eJ5ekjiEWOxEc9TCHIN8qqCUCXl10Z1k9840
 FtRakX60dRrKY51lMM27LI22UhIbGbjxolcp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9K6fTrQKg0eyCvlXAdZKTTOOHMG9DmPNgjH8VJOHFo8=;
 b=Ly7Bot/qYAEUNTaEpcUE+r3sos+akzOsAUllZOTLdS6tBA1BvZNkkMQTiiUbLTK4b1
 2Zf/6f21pEnSy/yKAZYtV/mN4QR57uSgi5p2wD+lSIxQl75kpLf3r5SaHnm1Ytq89VAV
 LRMbFZR4p1RF4mcowdurIQA1V1HVMBAIi1rgIOnenh6iBOiM3Tn6SSYNxJ9nJVidS0HQ
 71sVxT2CEm9KuoCPbuVRDRu68huekj23cVFX649ndtALKiSqlrur9pfd2ZKBxyhx1AWI
 e1KpKO523hfZgVjhzIFdm8CXFOuLeG2iVQgErC5je7zYxpF8TW8VA6EN2+zUyWHFJmJM
 H66w==
X-Gm-Message-State: AOAM533dyas+hYgpJfWkfZ5b9Ke1lv/HXC4B+3HcIF88CdCqXzKn3oXw
 iW2v3Q+NlYIyFg67XRKajdtJGg==
X-Google-Smtp-Source: ABdhPJy6BUtCkuLNfAtdL49wqU7oY8b44Pfo4jXe6sTGJN63fP452tlucKgY3vXS2lkAPzDdi2aPOQ==
X-Received: by 2002:a17:903:248f:b029:128:d5ea:18a7 with SMTP id
 p15-20020a170903248fb0290128d5ea18a7mr36874180plw.83.1629873226793; 
 Tue, 24 Aug 2021 23:33:46 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:3f2f:9e23:8a5:952])
 by smtp.gmail.com with UTF8SMTPSA id f9sm4356953pjq.36.2021.08.24.23.33.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 23:33:46 -0700 (PDT)
From: Eizan Miyamoto <eizan@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: chunkuang.hu@kernel.org, yong.wu@mediatek.com, wenst@chromium.org,
 ck.hu@mediatek.com, houlong.wei@mediatek.com, enric.balletbo@collabora.com,
 yongqiang.niu@mediatek.com, Eizan Miyamoto <eizan@chromium.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v7 0/7] Refactor MTK MDP driver into core/components
Date: Wed, 25 Aug 2021 16:33:16 +1000
Message-Id: <20210825063323.3607738-1-eizan@chromium.org>
X-Mailer: git-send-email 2.33.0.rc2.250.ged5fa647cd-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_233350_376011_90F3EAFE 
X-CRM114-Status: GOOD (  13.77  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


This is an update to
https://patchwork.kernel.org/project/linux-mediatek/list/?series=283075
To address some comments and fixes.

This series has been verified to work on 5.13.


Changes in v7:
- Drop last two changes from this series related to removing the vpu
  property from the mdp_rdma0 device node

Changes in v6:
- Don't propagate errors from clock_on/off as an afterthought.
- Split apart modifying mdp driver to be loadable from mmsys from
  actually loading it from mmsys into two changs to make review easier.
- Update devicetree bindings to reflect no longer needing the
  mediatek,vpu property in the mdp_rdma0 device node.
- Some stylistic cleanups.

Changes in v5:
- rebase and test on 5.13-next @ e2f74b13dbe6

Changes in v4:
- rebase and test on 5.13
- don't depend on https://patchwork.kernel.org/project/linux-mediatek/list/?series=464873

Changes in v3:
- get mdp master from aliases instead of strcmp against of_node->name

Changes in v2:
- rebased onto Linux 5.12
- 100 char line length allowance was utilized in a few places
- Removal of a redundant dev_err() print at the end of
  mtk_mdp_comp_init()
- Instead of printing errors and ignoring them, I've added a patch to
  correctly propagate them.
- Use of C style comments.
- Three additional patches were added to eliminate dependency on the
  mediatek,vpu property inside the mdp_rdma0 device node.

Eizan Miyamoto (7):
  mtk-mdp: propagate errors from clock_on
  mtk-mdp: add driver to probe mdp components
  mtk-mdp: use pm_runtime in MDP component driver
  media: mtk-mdp: don't pm_run_time_get/put for master comp in clock_on
  mtk-mdp: make mdp driver to be loadable by platform_device_register*()
  soc: mediatek: mmsys: instantiate mdp virtual device from mmsys
  media: mtk-mdp: use mdp-rdma0 alias to point to MDP master

 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 268 +++++++++++++++--
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  34 +--
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 282 ++++++++++++------
 drivers/media/platform/mtk-mdp/mtk_mdp_core.h |   3 +
 drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c  |   4 +-
 drivers/soc/mediatek/mtk-mmsys.c              |  20 +-
 6 files changed, 470 insertions(+), 141 deletions(-)

-- 
2.33.0.rc2.250.ged5fa647cd-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
