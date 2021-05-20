Return-Path: <SRS0=cSMM=KP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D0CC43460
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 12:05:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 095EB61059
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 12:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 095EB61059
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/sfIjJ5Ghb8czJMjBJEt1r/T3r5kURdB6SkY6slwYc=; b=Zg1yfQUnKTz7EXfpxJU/r4XGyU
	ZloCtEKfueiUhgXkZpMX8GICIKTQiSQosUZMfLdhdQTUmLVFTroRYU76QvDR1jkpvgf9fRt8OhsCX
	P9l1MeaCFnEpzuTfmHOI5ZAxnUT3aDZwIPc/BQkhk78tLwY2Vkh7oIAmMvJViqBrdkS8d3Xjvf5DI
	tMevGjOUXyfUWJmipigAD2YDPzJfYqS2eNe5a+G9IggCA0YVLwPtHKtEBWjaHmCoQfrs07+wFaxvs
	nqtHOP21I9hlC+wcKRImFI+N2HAygU7uN9+r42jxKgUahAPhlmOVkz0yq5zpcSKBSS03Qg61QUZY9
	YhOEWfQQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljhQS-000hwQ-Rm; Thu, 20 May 2021 12:05:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljhOG-000hE3-BX
 for linux-mediatek@desiato.infradead.org; Thu, 20 May 2021 12:03:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=M9bRhyWuFVpQrG3EHXZKnG7o8XLPNhfRhn1oXXk6SrQ=; b=Bs5qmjIeAmPqGiTba3Wx3r3hIX
 xuzIdX2bepWR9gaFu1btIx9AgeFxkhI5oSZVDXF6gQNYpuklomd+VToLv6uMQfMwNIhgyrrtpLDVH
 AjGSi+fHNzx6hs4g57s8Uo+oGDc26KeDUgra1BzIxZTioQjqTGdz785eHdPRgh9bz8s7v5s8CTVuf
 mvrdb6fDzv8Tgq3RjQwzBEs29Z3lsK1uLiDHBGk1H2EjF21N/QagM7Wad18Mx96SGJLuCqq635mkP
 Gb5Z7GYP4vbHHmyea0YBOA5QwX5UjOUN9Dmf3zu45Hy+7hyNxR/Q/ouyZ897LjBU5zy8Z6tb8Owgm
 /c1eGVww==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljhOB-00GHmu-TD
 for linux-mediatek@lists.infradead.org; Thu, 20 May 2021 12:02:59 +0000
Received: by mail-wr1-x433.google.com with SMTP id q5so17382726wrs.4
 for <linux-mediatek@lists.infradead.org>; Thu, 20 May 2021 05:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M9bRhyWuFVpQrG3EHXZKnG7o8XLPNhfRhn1oXXk6SrQ=;
 b=QaDnKQSjqkn4QePQ0kTBrTEKLV+PNzIkhCzxkhxaW35b4yBqqXr3JAf9xItUI0vKWe
 Js3oOcCnYQiz4GqAqe9hxOEemuXQTEDmd/znBNGSK59deuLoC7nthIUoc77gmSCawcJ8
 320dOYQ0xsXbI26zQTnXM/IQwZp1H5ab4Ry+t+x7/JIFfzx3oWi1H39yjMALjl2izvFO
 4LnRKWtHelBgXlRfdi7r8PnDSlhr8TIPOav+gTWfognB4aetD9mqEwjrz3m7b2vMRXCb
 RDe+COrlBT2sTQqzbMwIo/xev3HvQp7tpU4xct1F1FwqKvRwUFm81cxoIs0rIbIlc5gD
 ZNDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M9bRhyWuFVpQrG3EHXZKnG7o8XLPNhfRhn1oXXk6SrQ=;
 b=JFOyN+kNuVpjJh4Lls3vsSkHW4Os/WvC0sFprCRtn03U0WhAEHz/csoeyoy1LVPw6i
 2X6adzAuwhsymVbpCZuz3SDsw2kglo7CduaHRKFY0nhKbZ2E3oQMnjos4pfscwUU6yob
 6X1Pz0OOe5NBRRgUcEVOHZ1DGRWRLV/gQPajEwsZ0Vhw6YNae3F32U18pD9ESGx/eXJK
 +yB3j2jo3a6E099A+gl/7ox0NY/l6IPUurJy5nL3jFXtoaNZ7FlslpgrG3xmNyMG3VN+
 S2hLVy4aZSmiHax8KnfYO1Lu383LtNgr9pZYahpocitaKsJ8KP8ImOTZHoEVr2tfCAs3
 0WYw==
X-Gm-Message-State: AOAM532ldb8WdlDPgRoZUqA32WY0RJGzbC8mWIdON4hhRrfRkcpAvtvd
 WqP/vcr55LGcTr1zBf5YgGWQaA==
X-Google-Smtp-Source: ABdhPJzX6gO6eOjIxe2DAvFcz7ewe9ss6bBrbbFuU+mLxlW7zGh+iN0tC3I42VZoxeDplwiMFfSTxQ==
X-Received: by 2002:adf:9cc1:: with SMTP id h1mr3818529wre.135.1621512174148; 
 Thu, 20 May 2021 05:02:54 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:02:53 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 02/38] drm/mediatek/mtk_disp_gamma: Strip and demote
 non-conformant kernel-doc header
Date: Thu, 20 May 2021 13:02:12 +0100
Message-Id: <20210520120248.3464013-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520120248.3464013-1-lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_050255_948645_70D72563 
X-CRM114-Status: GOOD (  11.89  )
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

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/mediatek/mtk_disp_gamma.c:42: warning: Function parameter or member 'clk' not described in 'mtk_disp_gamma'
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c:42: warning: Function parameter or member 'regs' not described in 'mtk_disp_gamma'
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c:42: warning: Function parameter or member 'cmdq_reg' not described in 'mtk_disp_gamma'
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c:42: warning: Function parameter or member 'data' not described in 'mtk_disp_gamma'

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 3ebf91e0ab412..3a5815ab40795 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -29,10 +29,8 @@ struct mtk_disp_gamma_data {
 	bool has_dither;
 };
 
-/**
+/*
  * struct mtk_disp_gamma - DISP_GAMMA driver structure
- * @ddp_comp - structure containing type enum and hardware resources
- * @crtc - associated crtc to report irq events to
  */
 struct mtk_disp_gamma {
 	struct clk *clk;
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
