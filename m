Return-Path: <SRS0=WAzV=DX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1BF5C43457
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 18:50:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79195214DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 18:50:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mgu0iNd3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="gcnDSn4Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79195214DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GO6bx+eOgFLxL9WFBX951nh3UFmM6yWqpxKASt6Rmrc=; b=mgu0iNd3yHS7+ZHKBeZG8H8b0z
	ddHIlf+nNCubie4ytDbtVN2cqjWn6hK6tq0fS7PKAOWkb1HThvduX6OhnLz5omYdzne5q9BtbjYxp
	qj+sxq9P+BUI+yOtMEp9JuwSooO0851+ekHJRpS2NN3BmFPiEiAKZJXD8lqlayKy9EVP71EaROfHj
	qtjHuOIcdqroSwIoLBxy7cK7a2crRLgLUkJQxTLSSC2a0mPJQ84/pCg+KfRc9JAQHOvmhRTI8kwP6
	bDbTl3Ye/GFAjS5WX2eeDySCbphZgqc+/MeEpOrQoOq+WdqSRFMub3+QxpGW9osdKceIuPTwmIMGf
	HBsz47ZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTUo8-0000Uy-DA; Fri, 16 Oct 2020 18:50:28 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTUo0-0000RM-J5
 for linux-mediatek@lists.infradead.org; Fri, 16 Oct 2020 18:50:23 +0000
Received: by mail-wr1-x444.google.com with SMTP id x7so4127972wrl.3
 for <linux-mediatek@lists.infradead.org>; Fri, 16 Oct 2020 11:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/qt5rC8TcV9uWJA4Vg3L7tk7wdB1aonBorO6kFYPdy0=;
 b=gcnDSn4ZzO2qbERX22Nz2VEEQJVZZ5T08r149VQhNUsCk5FBniL3aSV/YzqTvZgcVS
 5WZCzZq8QZaXi+ggPmsi7YsQvmnTvfme+TaIvl1UO+YOfuIcrQ7O1R5nUfKOKiJzAC40
 lc1cdWwgMCd7d5nqUbOg8S3xGl7szKH3/rpMkseUy32P2uuMp2BV82yZ9KITzjChIWJ6
 bD9Lyc/DOcu2vWCVJ9ffvj8VLTaQ2S7TG8G2Awjz1I86J9ILtMfGhS4WXmft445ImYbE
 Akw+SNGajMcSqTAwUL68ApblRsPg77LgZURHkU4yedZ/4mX0z/dvscaRK19GKVqSLB4M
 KNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/qt5rC8TcV9uWJA4Vg3L7tk7wdB1aonBorO6kFYPdy0=;
 b=U2G9GWtyS1ODSSoA3VtBLHG/hDNCFc7sKhvPataAaHe+I33qOXafn0dFQohm2vN2hf
 9nl/99iLoxxAYq7Es1pGB4Js9T4HLzIfTszEl0G0TMl01lycA9vqB1EVXxN3w4UMQg68
 3oejKRGjKmKKsGjLZuxxAS8TNE+xz7VmWljCkVthGt1YvQGgwSZdM6c62YO7uxwqXmXS
 IPG8QvbeOuikp+bk24d5HzsSgij1kgfnYNtmh/ifG5+3Dg6qwDsQDuRi0yO50uOWHMH6
 A8lRubRZWUDTK6D0Bw2MzwjwhI8ZKUUbEPtzXylLczD93lywUK7jSYb9BEcbsc4uM7wW
 SqrA==
X-Gm-Message-State: AOAM533xI6OTTG7DAxHmyWBHPo5xJYj396fxgYPRvNHagmQFwh1x+PDO
 d5YvcR1MCGbenpeew2pe//qUrQ==
X-Google-Smtp-Source: ABdhPJy9rogRUbRH4dtXXmQz5trbR1XOCrzg+u3rkfEEELTlf8yrJElPm1RJB7hmwEdivrExNW+leA==
X-Received: by 2002:adf:fd07:: with SMTP id e7mr5295283wrr.377.1602874219287; 
 Fri, 16 Oct 2020 11:50:19 -0700 (PDT)
Received: from localhost.localdomain (211.163.185.81.rev.sfr.net.
 [81.185.163.211])
 by smtp.gmail.com with ESMTPSA id s1sm3727102wmh.22.2020.10.16.11.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 11:50:18 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-pwm@vger.kernel.org
Subject: [PATCH] dt-bindings: pwm: mtk-disp: add MT8167 SoC binding
Date: Fri, 16 Oct 2020 20:50:15 +0200
Message-Id: <20201016185015.3371433-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_145020_711682_495E1D89 
X-CRM114-Status: GOOD (  10.57  )
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
Cc: robh+dt@kernel.org, Fabien Parent <fparent@baylibre.com>,
 thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 matthias.bgg@gmail.com, lee.jones@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add binding for MT8167 SoC. The IP is compatible with MT8173.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt b/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt
index 0521957c253f..902b271891ae 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt
+++ b/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt
@@ -4,6 +4,7 @@ Required properties:
  - compatible: should be "mediatek,<name>-disp-pwm":
    - "mediatek,mt2701-disp-pwm": found on mt2701 SoC.
    - "mediatek,mt6595-disp-pwm": found on mt6595 SoC.
+   - "mediatek,mt8167-disp-pwm", "mediatek,mt8173-disp-pwm": found on mt8167 SoC.
    - "mediatek,mt8173-disp-pwm": found on mt8173 SoC.
  - reg: physical base address and length of the controller's registers.
  - #pwm-cells: must be 2. See pwm.yaml in this directory for a description of
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
