Return-Path: <SRS0=EvOn=LM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75987C48BDF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 07:52:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45332613B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 07:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45332613B4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hSctrJL0+FmR/84z/M/+d2SaaPXRgtxwaXaFTZrfmqE=; b=EDWuJHffCp/uik
	UZbfd7qitecwD5rufPcply35/18nQWlO9Pf1yBpRcoMc+sS3+nTXP7CVHEWScLgrAJyp7UT+rCu0R
	xAxI0m1A7vFCSGp9kzRrM7FnQo40k1vphFM1UcbndesJYMk0VLiRTTfLJIXdPjwGpeBN8mz5+7b+C
	ktRix+8zMFp+6qGaW3vH1SG4qOMAm9LaZ+GH+BsoXzmUL4IzACCPKOAM5MDtPNHhACLFAu1bwq+sW
	dlA+22CiQ2hbA3gWJpXncJEkOJAkJ7F5Yc556ZM4NVbsyuwv0DVvPPlKzbC8LI1Z9W/SWHVqUfhm1
	mwB0tgVCSM9Rb3qrw6Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lu9Iv-00D8he-TM; Fri, 18 Jun 2021 07:52:41 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lu9If-00D8cl-0c
 for linux-mediatek@lists.infradead.org; Fri, 18 Jun 2021 07:52:27 +0000
Received: by mail-pl1-x62e.google.com with SMTP id 69so4270876plc.5
 for <linux-mediatek@lists.infradead.org>; Fri, 18 Jun 2021 00:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TWKeVClJkZsu4I1NG/srDbtbqbk6CdxTWMa8/auvrQI=;
 b=Di3abQbPqjpkNWI3bRYbeAUWNX0ZsMYqIQhd3Nw+i1sVO8GDClkuQiT30M9Ac/KrSI
 DCWoq9PM/rq5tb232t+pqzX+4VQ75LVXZPu5t78ykMALxsvmoBefdVyfeUCMjUk83zAK
 jvntmYbEYV9aLSzod9xcsIV97l3zg6heb8Gxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TWKeVClJkZsu4I1NG/srDbtbqbk6CdxTWMa8/auvrQI=;
 b=GI33+CxiF1zrk/+z89rsb7nE/RmRIskHAdF/2VDOcLffzYaulYZe/JEA3Gwd7SMaaA
 ZToGB3N9JIZzECiz3U+B/hM7rwFC7S2JAg3mvfMYx6IId9snXmmYi1UkVVCNb/tpuzrW
 phK7yRHxT3x68UhuBDKEZstJ76gfaPqYLgorG3TLUo/fubFXcK9o7yVTSsrUk5LHeArX
 X2q19tPvP3L0t72hWPDYmBRuD45QbU+nxXuHbTjGilTtHjwrJOhTJPTZQBSyVDnSNIsH
 yOvWosvIMQAT9f4vy1CzI+uK/A8BQdY2Xyv3LgiGZ8eRtq8e7iJHuKu3AV0BODs9uDTD
 ZWRA==
X-Gm-Message-State: AOAM533GZtQ1wPh78P4G7wjUellLZRJGNAyGeVTC4+W7F2GURFwTrUW3
 Z9oaWv0g0BqF4uBLzvFnJtLndQ==
X-Google-Smtp-Source: ABdhPJwUHDTcPL/rQBD6it7FZK81z/Im0JEmx5fE8SmQkeR3/isJbPHDAXRl7sASTh4NTIXFVcAD3g==
X-Received: by 2002:a17:90a:a592:: with SMTP id
 b18mr20970932pjq.178.1624002743104; 
 Fri, 18 Jun 2021 00:52:23 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:3e8:19ca:3d8a:e112])
 by smtp.gmail.com with UTF8SMTPSA id 194sm6966360pfb.139.2021.06.18.00.52.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 00:52:22 -0700 (PDT)
From: Eizan Miyamoto <eizan@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: yong.wu@mediatek.com, houlong.wei@mediatek.com,
 enric.balletbo@collabora.com, chunkuang.hu@kernel.org, wenst@chromium.org,
 Eizan Miyamoto <eizan@chromium.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v3 0/8] Refactor MTK MDP driver into core/components
Date: Fri, 18 Jun 2021 17:52:01 +1000
Message-Id: <20210618075209.1157766-1-eizan@chromium.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_005225_090192_EF99F1D9 
X-CRM114-Status: GOOD (  12.71  )
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

This series has been verified to work on 5.12.

It has been rebased on top of the series
https://patchwork.kernel.org/project/linux-mediatek/list/?series=464873


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

Eizan Miyamoto (8):
  mtk-mdp: add driver to probe mdp components
  mtk-mdp: use pm_runtime in MDP component driver
  media: mtk-mdp: don't pm_run_time_get/put for master comp in clock_on
  mtk-mdp: soc: mediatek: register mdp from mmsys
  media: mtk-mdp: search for vpu node instead of linking it to a
    property
  media: mtk-mdp: propagate errors better in pm_suspend/resume
  media: mtk-mdp: use mdp-rdma0 alias to point to MDP master
  dts: mtk-mdp: remove mediatek,vpu property from primary MDP device

 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |   1 -
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 258 ++++++++++++++--
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  35 +--
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 281 ++++++++++++------
 drivers/media/platform/mtk-mdp/mtk_mdp_core.h |   3 +
 drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c  |   4 +-
 drivers/soc/mediatek/mtk-mmsys.c              |  20 +-
 7 files changed, 466 insertions(+), 136 deletions(-)

-- 
2.32.0.288.g62a8d224e6-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
