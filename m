Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE8AAC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 12:18:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8561260EB2
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 12:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8561260EB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YRaD7j10tukF0E5V4CziDMI+un80hzm8RSkSsJqzymI=; b=IMNMNwozclQea/
	Zcwy7w5oLDe6gFVXl6mgucdUkpFW3Bel1yxmHBmUKOtNYNbpIolaSs1N8KwjiZHQPddetTsjn8XiB
	rzSUJ0qaq+sQHn3aCiZ3EZeC2QZ0hL+EM4Yvc8ZCotAJjLkzNRz2F1uhjyiiJGCfRJLpeP5ao7hzf
	oh4wxnQRX0fE700ZWOk42O0uaIjlqpCXcwODujLftNO+pENFfLg0VPfpqOyd3o5qUlaLqk8xYPAOp
	QzWIZ6+ySOmLsqzPHVuyfD8m5R0/22jwyJ8B2ho+4AfmdBncEM+pHg8YLR+v6vSOfI10v15qH5CsO
	PFtqAoLGyctha+DbVf2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAWtP-00GASg-FR; Mon, 02 Aug 2021 12:18:03 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAWp5-00G8F7-7J
 for linux-mediatek@lists.infradead.org; Mon, 02 Aug 2021 12:13:38 +0000
Received: by mail-pj1-x102a.google.com with SMTP id a8so1882580pjk.4
 for <linux-mediatek@lists.infradead.org>; Mon, 02 Aug 2021 05:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HDPzoYjZtoVX4U5Es17iDsWrlk5dXQdhxxWK8WvZJKk=;
 b=HameHyIb+/s0EEF3wfW+k+xsNePhdcg72nrFLgZfi6a40siVuJWf8qwoRWpsdNhUol
 Ot0L6yQ0sC4+nuiyK5KdSz5PYaBFbTveqjyYaj4yu/BAffYZwt3Ibn0bzzo22mteK8Ll
 hPjOeb0pswAwia42lc1i8yZt+8XLUYFZiEILc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HDPzoYjZtoVX4U5Es17iDsWrlk5dXQdhxxWK8WvZJKk=;
 b=ELqAVvtbAeXbHepRLeb5LlHijx0bV4++AbSYL1YAxAJObUU4imjqMDPe+alU7hfbNG
 JWz13XE7/0Surc43gmPNAMgJNV0iGJkcejsY5SFS9gAE/FgOEKcZNYBPzxF7t6lyEnjA
 Rx6bAEgdo6s9gPZUsjFsci5+G4oqUGDy8Duhl8pMy33gUv3MSPCvKLxkCok6DEQMBq2T
 dOkkNDv/evDbDaVy3uCotGNQKZvOtTa6u9YHargeckcQzRJbYKp6vPaaLkp6gFzNSPjc
 RRcN/39eFr5SPz9KPBhbGX5NHqDNLYfzJ+AzZYjr2pQIgZACxbOecQFUnFb4ep/lqSd6
 8QEg==
X-Gm-Message-State: AOAM532Uooj/PurFmhkWnpYg44JfO4V5k/NkENf4enXLo6lDkZsf2QDF
 61kukYBTeSHXtU7EUNHNsoAkhg==
X-Google-Smtp-Source: ABdhPJxNe95Bvo0uxDfI4w/MLwItpJuNHSmDwr9PfTqtnF5875XwqVD2aRlV7qfPD4tT31EMdTqkdg==
X-Received: by 2002:a17:90b:33ce:: with SMTP id
 lk14mr5959359pjb.118.1627906414646; 
 Mon, 02 Aug 2021 05:13:34 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:cd34:e942:c094:baef])
 by smtp.gmail.com with UTF8SMTPSA id i24sm11931639pfr.207.2021.08.02.05.13.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 05:13:34 -0700 (PDT)
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
Subject: [PATCH v6 9/9] dt-bindings: mediatek: remove vpu requirement from
 mtk-mdp
Date: Mon,  2 Aug 2021 22:12:15 +1000
Message-Id: <20210802220943.v6.9.If10dbdfade9f48710e485efe79e53e6e65144a2f@changeid>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
In-Reply-To: <20210802121215.703023-1-eizan@chromium.org>
References: <20210802121215.703023-1-eizan@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_051335_368376_ACFEEF62 
X-CRM114-Status: GOOD (  10.19  )
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

It is no longer needed by the mtk-mdp driver

Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
---

(no changes since v1)

 Documentation/devicetree/bindings/media/mediatek-mdp.txt | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek-mdp.txt b/Documentation/devicetree/bindings/media/mediatek-mdp.txt
index caa24943da33..4c325585f68f 100644
--- a/Documentation/devicetree/bindings/media/mediatek-mdp.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-mdp.txt
@@ -4,8 +4,6 @@ Media Data Path is used for scaling and color space conversion.
 
 Required properties (controller node):
 - compatible: "mediatek,mt8173-mdp"
-- mediatek,vpu: the node of video processor unit, see
-  Documentation/devicetree/bindings/media/mediatek-vpu.txt for details.
 
 Required properties (all function blocks, child node):
 - compatible: Should be one of
@@ -41,7 +39,6 @@ Example:
 		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 		iommus = <&iommu M4U_PORT_MDP_RDMA0>;
 		mediatek,larb = <&larb0>;
-		mediatek,vpu = <&vpu>;
 	};
 
 	mdp_rdma1: rdma@14002000 {
-- 
2.32.0.554.ge1b32706d8-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
