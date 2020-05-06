Return-Path: <SRS0=yMRY=6U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F76C4725A
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 08:41:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 234F42075A
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 08:41:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kf75HcCC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CIpRiYea"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 234F42075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9DuYGPlhbIMXubxoVdeHNlziSheNpM3f4WsMW9Jp6xw=; b=kf75HcCCwQ0hvG
	m0KXtv37+Wx38zq9BxG/xvpt9VJe5a2jPMhHll3rGDNcw0ftnE7DM515t3NywUerX3zs7Tm27z5e/
	qsHWB7bU5T1V/woKUiww3LvCsGyqrzXvYmAP2AUwf6KYiqvnb1Nu8O1NwpBXD1rqlNWlouRylxlGP
	ZmoeJUKqfT+oTSgkst+6ePHpj+RdcJMjkFOXhHvhbYqCMpSkK0W42uGQ6wWDu2/qZGVsesIfk19Zb
	ofU8yr4j4X3lQ946Z2vcHjt/YdUhXrk2oRUALLRoZ79qJ/YB5V0R8I7h521yLZv4vNS3mdUCbiFTN
	34Zavd3u6g7G25au8FKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWFcJ-0003Ir-0T; Wed, 06 May 2020 08:41:23 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWFcC-0003He-3g
 for linux-mediatek@lists.infradead.org; Wed, 06 May 2020 08:41:21 +0000
Received: by mail-pg1-x541.google.com with SMTP id b8so466634pgi.11
 for <linux-mediatek@lists.infradead.org>; Wed, 06 May 2020 01:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VkoYcVU7NbBeJg58Zqc5BWaG09vaVe4UBMU1LZjqb/g=;
 b=CIpRiYea9WavKCCzFUX1KcmqQRqXAUfnUOpK6kYBI47aHAW2q68iHkQwQ9a53C4+mm
 bfI2CWK8Yr2OJlemlrTiq2q/w0fUesykOuoV/uPt11BXPFji9lBmU5tQeBjrbr3Fe8QU
 3U+D2JeKqnISGbxkYsJdYFDrdMSz6AMv3TTmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VkoYcVU7NbBeJg58Zqc5BWaG09vaVe4UBMU1LZjqb/g=;
 b=hoMvhpj2SC8VUuDkEtTWqIWj/Ow7NoFvuZTjQfWzc0ZyB9WjBFA72/rhBAZBK/8h9C
 XcgOmGnvcnvvCIer3MCtnRcaxrUBmFrB75yh4iZ64cIM/s0u8PJ+qYRgPXmaePb5gW0w
 S1wnHszqajB8MTngTheYvXX9NmhKtZRPDHIGS4d3BOpQtYsf8CLxZwYEp8hRbXtUE6mI
 WnFZJ1ujGNQskGuEKt3KUFCjn824ZnYO/+5Rwz4pVcn6+3ZsMhpVXm4J1JgORYe79mvh
 WBV4DK1sTv38HY0PNaNFUqnHWHMkAmHGXdr4XS3KlPSEJKwzKrmFunfHSvrqZQAflPYv
 VEkw==
X-Gm-Message-State: AGi0PubarmMuxdgW1ntxGVpWbpI9kvKIixfB8QgQWGyZNoS4BMdSpVCP
 rKKYryfg+HGoiocnuWvuzEqtRg==
X-Google-Smtp-Source: APiQypI0J1HwXbViVLlYWXD2Y2yI1V6k6VKFQ9zvlAicFXalpNwCJAXSFHp0zsOyvBrN9HZalI3SBw==
X-Received: by 2002:a62:7f07:: with SMTP id a7mr4606572pfd.34.1588754475570;
 Wed, 06 May 2020 01:41:15 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:a92f:c47d:76a8:b09e])
 by smtp.gmail.com with ESMTPSA id o21sm3986931pjr.37.2020.05.06.01.41.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2020 01:41:15 -0700 (PDT)
From: Eizan Miyamoto <eizan@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] Refactor MDP driver and add dummy component driver
Date: Wed,  6 May 2020 18:40:37 +1000
Message-Id: <20200506084039.249977-1-eizan@chromium.org>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_014119_847192_F93207EA 
X-CRM114-Status: UNSURE (   7.53  )
X-CRM114-Notice: Please train this message.
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>, Eizan Miyamoto <eizan@chromium.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


This series depends on all changes in the series:
https://patchwork.kernel.org/patch/11530275/

We are adding a dummy MDP component driver so that all the components
are properly configured with IOMMUs and LARBs. This is required for
us to get hardware video decode working in 4.19, and possibly newer
kernels.

Changes in v2:
- remove empty mtk_mdp_comp_init
- update documentation for enum mtk_mdp_comp_type
- remove comma after last element of mtk_mdp_comp_driver_dt_match

Eizan Miyamoto (2):
  [media] mtk-mdp: add driver to probe mdp components
  [media] mtk-mdp: use pm_runtime in MDP component driver

 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 172 ++++++++++++++---
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  32 +--
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 182 ++++++++++++------
 drivers/media/platform/mtk-mdp/mtk_mdp_core.h |   1 +
 4 files changed, 286 insertions(+), 101 deletions(-)

-- 
2.26.2.526.g744177e7f7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
