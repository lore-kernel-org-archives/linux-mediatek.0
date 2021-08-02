Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE188C432BE
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 12:12:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1F1760FA0
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 12:12:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A1F1760FA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EZCXtYB2Fm0yLQK+3Gv+Zc9V1m+5R4gy22lT9eykrLs=; b=OhxywpewML4OAB
	M3pvCvcNhhtBfkirCg9Oiri0L472ls+9xDbJHRlZPqX6W95JHgE6aHU5cSs6aBonzu3P3Ll6kG5MS
	0uCadQfmY95Zx2Mw3Y+3PWRXWBRZe9vpIgnOsSSkKlt1TANSbx5VZSbwNJFaxWEz5Z6bklRHDTNjj
	T3adHOwee0A0Cq8UAL4O6CwMz/fyQD8BJfJDFYL+1n0P/QliFsimB2bPQZehm21+aCgrL54VAJz+v
	QBqgDuhrHiddJbqwDrq/YdUiPI77DSURLW4aelioD246P545GpkZvWOj0o0rY2g9AOE2wOZF5M3Ht
	IIsHUCTwZY8M2Uy7OqZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAWo6-00G7fY-0t; Mon, 02 Aug 2021 12:12:34 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAWo1-00G7dO-Nt
 for linux-mediatek@lists.infradead.org; Mon, 02 Aug 2021 12:12:32 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 u9-20020a17090a1f09b029017554809f35so31305718pja.5
 for <linux-mediatek@lists.infradead.org>; Mon, 02 Aug 2021 05:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yhCy+jdg2z+Eckz1yvxcPdL/SuIBQamgSG0Pchby1eE=;
 b=IHFEat4kyp7BJrcnOYKhWyx2BgxojQqKz+Q69zBBnJ9SF6H/hSn+HkbWOVx8/ye6ir
 b/2N1/CLAwC6wSGNYMbfA6QLp/HMduvyqpQv0/r+QOCJNRawHSLCsegT5OYBch2dGAZt
 vFsHXxQKt0chTg+3kP4mAeEs6RBwjb0C5OEag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yhCy+jdg2z+Eckz1yvxcPdL/SuIBQamgSG0Pchby1eE=;
 b=Y/b+KYGZBdiFXx8fA0HkluiYfRWEO2ziAhu+ssqs9mEqPU6NfoVy6XiOpnOdKdefgK
 VLOyHXCeQiAWlPqX5LutFNkEPH5k8mI/Z2fQHhRp/X+w5Aq4Ocu+UvjS2vQhhmR7Cb4A
 J3AetX92fwR8XrmeoohhnEk45avwUJOm8840Mx/p6724At9swPd9sgkhGv8cdriRqUza
 M9jvWAwAyQm/15hj2gTPd6rggxAgXClDxP4sEur7kRb+/3N+TfzNnk+VhdgRl8UuaH7O
 3tgWrC/TMd1wH65SDAvCgVlCgTbxudnXIG/lDuZPai9FeKNu+FOpSEQaXcizaXNAbHEJ
 9YyA==
X-Gm-Message-State: AOAM530KtusYLZ49Zx1IrhWWRcXQ8b8ECUbkANGKTmefdMbSfUxo+O0F
 5eEUtF9CwXPqLSf1sLAt1Ymlnw==
X-Google-Smtp-Source: ABdhPJw9D3QYvpfQwiLiGcde+JTyAT/xpxneIagpGhWlhr9nQI9AqvoEdzzBW/YWozCp7VcQCEgNIw==
X-Received: by 2002:a17:90a:de18:: with SMTP id
 m24mr16795133pjv.78.1627906348032; 
 Mon, 02 Aug 2021 05:12:28 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:cd34:e942:c094:baef])
 by smtp.gmail.com with UTF8SMTPSA id w134sm11685775pfd.124.2021.08.02.05.12.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 05:12:27 -0700 (PDT)
From: Eizan Miyamoto <eizan@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: wenst@chromium.org, houlong.wei@mediatek.com, yong.wu@mediatek.com,
 enric.balletbo@collabora.com, devicetree@vger.kernel.org,
 chunkuang.hu@kernel.org, Eizan Miyamoto <eizan@chromium.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v6 0/9] Refactor MTK MDP driver into core/components
Date: Mon,  2 Aug 2021 22:12:06 +1000
Message-Id: <20210802121215.703023-1-eizan@chromium.org>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_051229_824102_3FD7D551 
X-CRM114-Status: GOOD (  14.07  )
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

Eizan Miyamoto (9):
  mtk-mdp: propagate errors from clock_on
  mtk-mdp: add driver to probe mdp components
  mtk-mdp: use pm_runtime in MDP component driver
  media: mtk-mdp: don't pm_run_time_get/put for master comp in clock_on
  mtk-mdp: make mdp driver to be loadable by platform_device_register*()
  soc: mediatek: mmsys: instantiate mdp virtual device from mmsys
  media: mtk-mdp: use mdp-rdma0 alias to point to MDP master
  dts: mtk-mdp: remove mediatek,vpu property from primary MDP device
  dt-bindings: mediatek: remove vpu requirement from mtk-mdp

 .../bindings/media/mediatek-mdp.txt           |   3 -
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |   1 -
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 268 +++++++++++++++--
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  34 +--
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 282 ++++++++++++------
 drivers/media/platform/mtk-mdp/mtk_mdp_core.h |   3 +
 drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c  |   4 +-
 drivers/soc/mediatek/mtk-mmsys.c              |  20 +-
 8 files changed, 470 insertions(+), 145 deletions(-)

-- 
2.32.0.554.ge1b32706d8-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
