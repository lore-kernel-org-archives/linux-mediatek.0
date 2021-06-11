Return-Path: <SRS0=puoQ=LF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19912C4743D
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 04:02:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE4C86135C
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 04:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE4C86135C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4dP8EgxYPIrPE2JHHxK3DEj5rlwmVsKJKfOWw6XoFNM=; b=ZCantKkIRetC1T
	h66BDFFmwBCNR06wwDDcxCJs2p9YwVanvRHG2JsK7pY/TuKREnt5HkDQcTFx3cODUmOxSbhfDdu60
	dSJF6Wb76AvsdgOiCNrpW05/Xr+Ezp2/Xc3wV2K7nk/BktdcmXqib26xlo8QLRZh1FJgDTiwnvY9N
	a87jPw2yXbtYZZpbHwUgx7KVZfp0w01ri5Yg/sLSsug2z5WAFyyQ5FYeFaSNjMe+0dFkmzMShbdSx
	HiFgr7g8MUVqEnFH5ylJBsPauuzIA2NvYtdYsUxkAwVMB7SGnW2pcgUfnwxC2H79+K4U4/+azstiJ
	QgiovxY9cQgzRiddCYVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrYN0-003RSN-AT; Fri, 11 Jun 2021 04:02:10 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrYMw-003RRE-9o
 for linux-mediatek@lists.infradead.org; Fri, 11 Jun 2021 04:02:08 +0000
Received: by mail-pf1-x430.google.com with SMTP id c12so3379202pfl.3
 for <linux-mediatek@lists.infradead.org>; Thu, 10 Jun 2021 21:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dHnvb/5q4pu/qIeAJnS0gxEaPn/2BF/h/mnBeFWe2kU=;
 b=PBAd9qhBUf6V1LfObAM2a5Ujj6S2jZogVGzCMmDl2YCnqpM1JqJ/Kib/ArqLJd6+Z8
 4JDc9yxn0C4wfZS9Pw4XzSzfWKpy9yCUh/8AiGqWMEXChrFL9vxYEaNzU+LF8NnBnnNO
 u/CHBjGciUSPtTFYkJQDdHnGWJL4MjzYCnDuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dHnvb/5q4pu/qIeAJnS0gxEaPn/2BF/h/mnBeFWe2kU=;
 b=YF0cMrxw1rTkhcmjN1OtG3Cy2/JhquNEXB/4nsgKAzMA7td64wWF1nDMR9Be0nxAnu
 9wgw9aS49d94gLUh3nU+33U3crg9ATCLihc0RcaMP6Rxc/3yWfWWqhvvmqPVYDHWaT5X
 HdigvIfMM3P37Ofalb3Z83CPeUhst0eZ2FYGkgg0/T3fIfandceyrBDgfkmuQlPXZ7jd
 H1TLSFXzQBRDYUBAA7ZohPcPTnFLQCv2GHQ8ocIMVNWVFORmcCt42/OQywCY3iewfGys
 Y/GuHVQtgt2Sd9xralMziNQCSwmwWdmWs8nZ3n3Jor9q3QDNjJt1IqShn5LNQf30Dw8g
 hr0g==
X-Gm-Message-State: AOAM532buGiJWnGp2f6DUnBn7aVRdPNSFlmAg5Wkcb5tHoPx45p7h6BW
 alOnBWF1yViQ+ry/ZtQhI9g9VQ==
X-Google-Smtp-Source: ABdhPJzGwVIh6XECxvR1OvFsqr6SKN92gztMweR8qLNeCrhI/7Kq+py+jyKomDkaXiMr8686emmtLg==
X-Received: by 2002:aa7:8892:0:b029:2f5:33fc:1073 with SMTP id
 z18-20020aa788920000b02902f533fc1073mr6219778pfe.79.1623384123780; 
 Thu, 10 Jun 2021 21:02:03 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:db52:e918:e5f9:9e14])
 by smtp.gmail.com with UTF8SMTPSA id z185sm3927781pgb.4.2021.06.10.21.01.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 21:02:03 -0700 (PDT)
From: Eizan Miyamoto <eizan@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: houlong.wei@mediatek.com, enric.balletbo@collabora.com,
 yong.wu@mediatek.com, chunkuang.hu@kernel.org,
 Eizan Miyamoto <eizan@chromium.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/8] Refactor MTK MDP driver into core/components
Date: Fri, 11 Jun 2021 14:01:37 +1000
Message-Id: <20210611040145.2085329-1-eizan@chromium.org>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_210206_351801_BCA73C5D 
X-CRM114-Status: GOOD (  12.21  )
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
  media: mtk-mdp: treat rdma@14001000 specially when probing
  dts: mtk-mdp: remove mediatek,vpu property from primary MDP device

 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |   1 -
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 226 ++++++++++++--
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  35 +--
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 281 ++++++++++++------
 drivers/media/platform/mtk-mdp/mtk_mdp_core.h |   3 +
 drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c  |   4 +-
 drivers/soc/mediatek/mtk-mmsys.c              |  20 +-
 7 files changed, 434 insertions(+), 136 deletions(-)

-- 
2.32.0.272.g935e593368-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
