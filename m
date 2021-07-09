Return-Path: <SRS0=yaqe=MB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D5C0C07E96
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 02:28:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D3C56145C
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 02:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D3C56145C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YwxxYYTP9ymZtKSveTaU/AUkQG2k4HuytOZsbRiy850=; b=fjuo8gAZYJEiIa
	YyRuPQk01RhefclEsLEPczAtnODlx7cUzywIXjYrBlzZPeKgPaudQEWMSPH3GCmFJ3LdNHGbG6QZc
	c/EATuIlP8MySMi49gA6V1oGX1A43Qe+Y+odTKL43Yo1D4ZAyA4rumz8MMhDqqzCwm6YGIelmdp6O
	UpCkkUooaW4So3WyR2aiPtsHS+rCfUArXOB6z+/C3QTNXttwULWIzMF//DBDTcXAzSqwln/JBRiWW
	aBD4NRI/6RIDCfZWngVIMwEx7YFnk8BWLyLGN9N06X1eWFX1/JxRzut8zffK2W+mKuuVElG3sh9Ez
	qdpBleXJddBI0xSgFExg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1gFW-000bX1-4K; Fri, 09 Jul 2021 02:28:18 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1gBv-000ZXh-R5
 for linux-mediatek@lists.infradead.org; Fri, 09 Jul 2021 02:24:38 +0000
Received: by mail-pg1-x531.google.com with SMTP id h4so8423226pgp.5
 for <linux-mediatek@lists.infradead.org>; Thu, 08 Jul 2021 19:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xa1QT/xqQMd9LJuGZv9EOkrq3F7P8S0t9twyB2ttUeY=;
 b=Ih95Vv7sGBr3BHG6ejkyqiWc4YDQyURZhb3iXOesOn/6nVRUGD02x3zezztxDSoXIx
 /blNBqXk6teH1HU4a19/wFKgte5ugaHIjoIJ/D5hjezzmyzoh9gyzR69lbWcotcReOtE
 uyXgu7sa8Vcqj7G+hDzfGwLazos/WY4PQO3+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xa1QT/xqQMd9LJuGZv9EOkrq3F7P8S0t9twyB2ttUeY=;
 b=Q+TpqsLXCAmd0+CqDvOW+zQLZTZFCz7p0Dnkzz3oagw1WwLcgE6+zCR+WTJAT0/teC
 CtrWs82i0Hu079RnzlO/ern7xihwHAtxpkRfDm5Wlb7EgWUjR7/MiEhEQKrPO8XEX1Dy
 lyPMHfqberc6tHqTrUisN8/iAhd7VqOO0ZP6SnCQWWtwg3tu5cflsFvHR4edcztyHDbB
 JAncUeFzURCn7Pc96qo5GCtfixkMD363+cNw+kPQ0qeACRX0nP4XtmlnwBEvNN/mbaER
 97kCbwIu8HuTIJD4VbzqGatZlTDHxt5SH6Oqb8XrQflDMq69ckUHoi2VDI5yAbp6yqHv
 pQeg==
X-Gm-Message-State: AOAM53113d3XJBSNvB7CWZjzt+Y59DxjWH/BrlsbZ+36kw5lg8H8RALC
 +6fOyGo1SB0rqCMUFEwyhfvR6g==
X-Google-Smtp-Source: ABdhPJwZbjcIIk5gkbelY5NVALNeX+vFLNHPUdir3ykq4PvaBeBKBcrN8a8sMY7S44A1UhZJpupjmw==
X-Received: by 2002:aa7:9436:0:b029:30b:30ba:5942 with SMTP id
 y22-20020aa794360000b029030b30ba5942mr34190104pfo.47.1625797475039; 
 Thu, 08 Jul 2021 19:24:35 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:d956:2966:7910:2bd2])
 by smtp.gmail.com with UTF8SMTPSA id z15sm4791808pgc.13.2021.07.08.19.24.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 19:24:34 -0700 (PDT)
From: Eizan Miyamoto <eizan@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: wenst@chromium.org, chunkuang.hu@kernel.org, yong.wu@mediatek.com,
 enric.balletbo@collabora.com, houlong.wei@mediatek.com,
 Eizan Miyamoto <eizan@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v5 8/8] dts: mtk-mdp: remove mediatek,
 vpu property from primary MDP device
Date: Fri,  9 Jul 2021 12:23:24 +1000
Message-Id: <20210709122040.v5.8.Ib681f06d5189351b7fda0e3dcd6b15f3863a0071@changeid>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210709022324.1607884-1-eizan@chromium.org>
References: <20210709022324.1607884-1-eizan@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_192435_954604_4C24CD6A 
X-CRM114-Status: GOOD (  10.45  )
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
index d502073b551f..872427748110 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -1010,7 +1010,6 @@ mdp_rdma0: rdma@14001000 {
 			power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
 			iommus = <&iommu M4U_PORT_MDP_RDMA0>;
 			mediatek,larb = <&larb0>;
-			mediatek,vpu = <&vpu>;
 		};
 
 		mdp_rdma1: rdma@14002000 {
-- 
2.32.0.93.g670b81a890-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
