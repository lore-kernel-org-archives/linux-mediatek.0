Return-Path: <SRS0=EvOn=LM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9BE9C48BDF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 07:56:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA68B6101A
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 07:56:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA68B6101A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pInnWZ1QBf4sVpZ8jWNjc3+XtqNRdQvnB9NyCKgqvj4=; b=ml9j+Sg/CIUWeN
	uCWyQRFGJ890a+HO8NnzuAReQ8DD4kvVqh5fKh7gomPirHdbkccTJwWZqgu4Mrorp+4JYItKDjsA9
	69G0OBkpPwYGe/tEqHF8NY3VjClQSDhx2s0iSQv2F/XlyJnO6UIsldlVK1pv/P1Gv7TzzA6T1cDCq
	EVrtExrjvYzDQ6siR4EEzyAuy32LZpAL9XJdTsKt8+FM7aX+XmWuOqLCme3u9q5YIqidjcAQQc07Y
	d4niv+ZPPrB1M32PaLnxdySlUDvSFhsaKGfd+pHV0cRTbYubx/cL0qV1l/BH9ws3Zo9hHUMM8dbHq
	4M5+/IT9Lg4biiCwiGFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lu9Mb-00DAhr-CM; Fri, 18 Jun 2021 07:56:29 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lu9Ja-00D92i-Q7
 for linux-mediatek@lists.infradead.org; Fri, 18 Jun 2021 07:53:24 +0000
Received: by mail-pf1-x430.google.com with SMTP id x16so7044170pfa.13
 for <linux-mediatek@lists.infradead.org>; Fri, 18 Jun 2021 00:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vi5aaeGs0Jp5TUhXs/yHmc/VtnCiG/O5q5AcK+a/X+o=;
 b=dPbJMCtAP92m+az9E2KUVJ5QmmcxaGWaLiEMzeY+A4KZdT7ri4OiyidJH5tVgfZ5sx
 ha7JMrMR7N2/+48vuq9CqITc9/jldqwYid2TkFLo/I4JTKmS2L5Qzgj1cbw7Gs4VgbvL
 sKs/pKLDshM2kQPpjQ2wheprYOAmm1dpmyclY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vi5aaeGs0Jp5TUhXs/yHmc/VtnCiG/O5q5AcK+a/X+o=;
 b=rTxZoJK/BOGznCBeioWKeZoCVQ01EG8aVlrqlagmBOOxafH7fawD6GzzzU8c5fcd9z
 bXGBXB/lBc4MCAdj8hmSo+Px/OtJHLqC8AtNGna8VS71gmphFOP/mEwJO7v/Utoyg3eS
 87dqVzzcjIHUzce2tZk47a2Cpe4mphU2csNRiJELnYsDxcbFwZ3mcZ+LrUnT4sUiVUYb
 jcVVUJnAcZBRhnBzfccCyB15yQ04cKROOYZ50Q3GMnjqI40XELfUpDNcJFXVNoWNO/X+
 uSF1Uu+hGdz2CSEnGOxJIIJrDxwFU908JwnqGvkrw3JA3/zdydB3kkrwlB8VX1sCPjeK
 rMjw==
X-Gm-Message-State: AOAM532aYW4Q1rXvPmdoVZtVI2DgZmR85KLK+/e1ZaxZj3Ud1poEd55L
 LHcEdIU7oT0UgoM8lutwgnWc2A==
X-Google-Smtp-Source: ABdhPJylBEPC3a908/Xh3ysKf3+CdjrNp9JtF2KZhy0pHzubG/04CCm511Z8TiYWqIK44tgtCAhc+w==
X-Received: by 2002:a63:2f05:: with SMTP id v5mr8756251pgv.449.1624002801724; 
 Fri, 18 Jun 2021 00:53:21 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:3e8:19ca:3d8a:e112])
 by smtp.gmail.com with UTF8SMTPSA id g8sm7761729pja.14.2021.06.18.00.53.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 00:53:21 -0700 (PDT)
From: Eizan Miyamoto <eizan@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: yong.wu@mediatek.com, houlong.wei@mediatek.com,
 enric.balletbo@collabora.com, chunkuang.hu@kernel.org, wenst@chromium.org,
 Eizan Miyamoto <eizan@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v3 8/8] dts: mtk-mdp: remove mediatek,
 vpu property from primary MDP device
Date: Fri, 18 Jun 2021 17:52:09 +1000
Message-Id: <20210618175059.v3.8.Ib681f06d5189351b7fda0e3dcd6b15f3863a0071@changeid>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210618075209.1157766-1-eizan@chromium.org>
References: <20210618075209.1157766-1-eizan@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_005322_890825_B5C3AD33 
X-CRM114-Status: GOOD (  10.08  )
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

It is no longer used by the mediatek MDP driver.

Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 814f56d59e2f..4020748ae446 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -1055,7 +1055,6 @@ mdp_rdma0: rdma@14001000 {
 				 <&mmsys CLK_MM_MUTEX_32K>;
 			power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
 			iommus = <&iommu M4U_PORT_MDP_RDMA0>;
-			mediatek,vpu = <&vpu>;
 		};
 
 		mdp_rdma1: rdma@14002000 {
-- 
2.32.0.288.g62a8d224e6-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
