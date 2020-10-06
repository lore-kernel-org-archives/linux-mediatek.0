Return-Path: <SRS0=UyV0=DN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CBFCC46466
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 07:54:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0F3A20866
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 07:54:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vKbLTWC4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jnrqiy+P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0F3A20866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4grerU89/r74PZIOnXPNkI/mnRX3C4ScxTNYH0i0hM8=; b=vKbLTWC4ianVth/XvGBJrzqokf
	/OT7xKLJkW4qjW8udMjvUmHliitGGsG8tyyZtPEi0dsmKJrdwx6UfG/4ANI8ah+nIQsN0zikLidwr
	yGMt5ERO/qflPOX/BoALnQrt0KIpJMQW1uOkKraMbYRhoJCR5UzkaYmDbIQ2Zm9rlMfQtBr6sQrEF
	QXHatS81fqBa5hxIT8TyS0qPV2HX6/1GA/NxtmgTn0XDKffY0P8KnQxfZKJdyomz0rd36Xbo1RM+0
	EcfoGEA978Cs83qrerbw62N3S6YGlp8osdk7TXH72XGh0eNfxtSWbPeuRZs6qxY/r+1+UiK+OSZuv
	O3KbI29A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPhnn-0002Pk-A7; Tue, 06 Oct 2020 07:54:27 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPhnd-0002JP-46
 for linux-mediatek@lists.infradead.org; Tue, 06 Oct 2020 07:54:18 +0000
Received: by mail-pj1-x1041.google.com with SMTP id j8so1216483pjy.5
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Oct 2020 00:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pn/wc+bv9MvSQdOJW1Jb3BA5CiEn9SyA0DgRDMi+3Ec=;
 b=jnrqiy+PEyHmqOdKQpRiNZc2B9pj0yNj+q0J+7yu6pjJe84nEEIajU6P/iv+lcG2ps
 taqxtHaEfZK3j9uFREtuzmFl9eapXiQoVBg+/2BKtvE+Jv32UnZbwSdg+tQhYilVE1pB
 N9LaZlZ+o0439ZNk6c5/WIr4MphQ9cz5+AFXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pn/wc+bv9MvSQdOJW1Jb3BA5CiEn9SyA0DgRDMi+3Ec=;
 b=FOPLfaQSX9VNTtgiTIfKShgo9gnjL0+kSh6eC012+5MGm5hWW5kC3VvFAzV1OMq2oB
 17w8eOonrehPbeinc7lO6+vfEl4Tyv9+VfhTJ6hZav0TnZjoDruYA/z4BvqccNi50VJd
 Z7az1CzXphfOJIjg4igSptj0BIYe2ggfr617GleNTo53ZCRAut3TK883MCQcmvjAe11s
 JFT/RpBv+MlLW6Tmxyg/hk+wqypXCHSmMFQLBuNwhyvp/y8YVNey6FRSVHUiBSNcDuzQ
 HAjg27Ws/Q7amfVLaI1pWO5QUuMn+5ClfRFk8oBaDRQVa7myZZbgMIcw7lUiqPd607UE
 qsRg==
X-Gm-Message-State: AOAM530p+CkSYS6SISDcJvplDLJHbXm2o6G7ioxh4r64jnk8d6HfFgca
 5eQ7MOqQRH1ww/iCIwQiSMOCJA==
X-Google-Smtp-Source: ABdhPJx5OPq6K6XkaaIZsYsK+H0mb4/hLwZpnh5ySm23bU5vcYbJ2YvYJEYeLvpJ7zXkxVXimWHMpw==
X-Received: by 2002:a17:90a:a101:: with SMTP id
 s1mr3014013pjp.220.1601970853389; 
 Tue, 06 Oct 2020 00:54:13 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:10:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id r6sm2545147pfq.11.2020.10.06.00.54.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 00:54:12 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH v5 0/4] spi: spi-mtk-nor: Add mt8192 support.
Date: Tue,  6 Oct 2020 15:54:01 +0800
Message-Id: <20201006075405.11658-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.28.0.806.g8561365e88-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_035417_182056_F52CD617 
X-CRM114-Status: GOOD (  10.35  )
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
Cc: linux-kernel@vger.kernel.org, Bayi Cheng <bayi.cheng@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Chuanhong Guo <gch981213@gmail.com>, Ikjoon Jang <ikjn@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patchset adds 36bit dma address and power management
supports for mt8192-nor.

Changes in v5:
- Rebase from merge conflict

Changes in v4:
- Drop two patches from a list, addressed by an another series
- Fix 0-day ci 'shift-count-overflow' warning

Changes in v3:
- Fix a bugfix of v2 in checking spi memory operation.
- split read_dma function into two (normal/bounce)
- Support 7bytes generic spi xfer

Changes in v2:
- Add power management support
- Fix bugs in checking spi memory operation.
- use dma_alloc_coherent for allocating bounce buffer
- code cleanups

Ikjoon Jang (4):
  dt-bindings: spi: add mt8192-nor compatible string
  spi: spi-mtk-nor: use dma_alloc_coherent() for bounce buffer
  spi: spi-mtk-nor: support 36bit dma addressing
  spi: spi-mtk-nor: Add power management support

 .../bindings/spi/mediatek,spi-mtk-nor.yaml    |   1 +
 drivers/spi/spi-mtk-nor.c                     | 211 ++++++++++++------
 2 files changed, 148 insertions(+), 64 deletions(-)

-- 
2.28.0.806.g8561365e88-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
