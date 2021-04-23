Return-Path: <SRS0=ZZ2m=JU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4FE0C43460
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 06:02:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A027161404
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 06:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A027161404
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rWccQgKObbgHMSfx0XLQes4bvz3WPbj1f5VLcFPzeNo=; b=qXcp5qwQnGPlY8yVJeb8VtYlWJ
	jM56q1+ISeBNzMZ29sUeBO0YesFISG/Sa4rOrt9KQNZ6sPbMZ2oOAUIEYB83shb+GrwSuWm6sjkA0
	z9sb6BBRD1N2cfznfjc4qr9Q7iXVuZAvA0MA/nSHap9ggrc58AYFrcQn8TYnhKbL/FkrxZ6gpGYAR
	TZyciRSuQFSGJgmvfWV1Rjpwm9xZtzq9MZT1EX6o9N8bVgktWxuZ98+3+LiIyt95QeGR06xPKenhX
	JTWpGkftFZkDHIKbiyIpUJgElExDP19rbcAzdwdvSWHG0oDt+mRP49HRC1erc53Y3LPot++a+GxSG
	TytP3g7Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZoth-000nKh-6N; Fri, 23 Apr 2021 06:02:37 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZor6-000n51-TB
 for linux-mediatek@lists.infradead.org; Fri, 23 Apr 2021 06:00:04 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 gq23-20020a17090b1057b0290151869af68bso602313pjb.4
 for <linux-mediatek@lists.infradead.org>; Thu, 22 Apr 2021 22:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WojFyUuBmlCNfO5VcU3mpAXT/QOV485quirzDWuFiHI=;
 b=nEn0d/cITJwCov5cPnJMctSmaLJUrt8L/kVGZa3Mly7ka+SlPVJ9hl5z5Npj6PQ8lm
 CHRZZ1dcQyvoWw0dUVqcLAkJrOb5kJO/cxJQCNA7xsQQi/5Th52yb4YUn0RAoGq3lnAJ
 G+mr9b7dgd2/9zEotik+afdfzYS1OvLXhLluU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WojFyUuBmlCNfO5VcU3mpAXT/QOV485quirzDWuFiHI=;
 b=GleoM1Xv7ahMhggyRYbNRIf92m1T0ab17GVw5uzsS99nFEJlmWMnsYA9NxJ+N843ti
 Tu1wRXzU+EeFOmsbDjqBsCjyprdrN7DBDXE+EJn0xZsgJmGMslNztpKE5OPv7zD2oGVO
 tXmcQtcKUJZwUW89/CO/M5joviQkSrwk/sJTCSKdciKt/g14xzglqSnZKzdKD+TuKzjH
 1wWGznPnUMD3coL9GHvcgy3NPEl3DoNxnxM+MM5VJUyCf6Tbqa/wdfA1EncsMwkQBxen
 TKw02zk7dTxiR3Hhj7pMhbl1P/3mpEpN0VOieTUG0e+zXmQvapN+WBg/AEGj9a16gIu/
 Syww==
X-Gm-Message-State: AOAM530pOGBb1ruxeQ5yZo7R+H+GHDOK40IG1V+3KNjyVBxIePG19kVp
 JmDTtADvvnxBmarVNTHxUDUYSg==
X-Google-Smtp-Source: ABdhPJwYbk0jpbFk5VmmfOeLYVgcuWObCMUM6VNScD01vj0LdoNVakoEYINA9YdZxs7LcXJ3tQFLag==
X-Received: by 2002:a17:903:244:b029:ec:9666:9fc6 with SMTP id
 j4-20020a1709030244b02900ec96669fc6mr2176469plh.63.1619157530312; 
 Thu, 22 Apr 2021 22:58:50 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:308c:235d:f7a2:53a1])
 by smtp.gmail.com with UTF8SMTPSA id m11sm6254433pjs.34.2021.04.22.22.58.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 22:58:49 -0700 (PDT)
From: Eizan Miyamoto <eizan@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: enric.balletbo@collabora.com, chunkuang.hu@kernel.org,
 yong.wu@mediatek.com, Eizan Miyamoto <eizan@chromium.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v1 0/4] Refactor MTK MDP driver into core/components
Date: Fri, 23 Apr 2021 15:58:37 +1000
Message-Id: <20210423055842.2490679-1-eizan@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_070000_566077_2E465101 
X-CRM114-Status: GOOD (  10.07  )
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

This series has been verified to work on 5.11.

It has been rebased on top of the series
https://patchwork.kernel.org/project/linux-mediatek/list/?series=464873

The first two patches are unchanged from the previous series submission.


Eizan Miyamoto (4):
  mtk-mdp: add driver to probe mdp components
  mtk-mdp: use pm_runtime in MDP component driver
  media: mtk-mdp: don't pm_run_time_get/put for master comp in clock_on
  mtk-mdp: soc: mediatek: register mdp from mmsys

 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 191 ++++++++++++++--
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  35 +--
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 214 +++++++++++-------
 drivers/media/platform/mtk-mdp/mtk_mdp_core.h |   3 +
 drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c  |   4 +-
 drivers/soc/mediatek/mtk-mmsys.c              |  20 +-
 6 files changed, 345 insertions(+), 122 deletions(-)

-- 
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
