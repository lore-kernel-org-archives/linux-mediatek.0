Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1955FC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 11:33:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94BFD61396
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 11:33:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94BFD61396
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jrZGXlbGNIzh59tno8KFOwnd/JLCLSJwCsWy6PcnvD8=; b=NYQDjFP0XU3dXa1kgZ/Hpd296
	UZj3cHdTmpSk1yNSLnyRFBfYv1+ust2QJFEI7vcuQYE7z34Vqe4gPGdFN4brk+npEyWLFSsNXGocx
	f4cKyn/TVgkGk77hW91kj/VE6h1WQl5ld526Ssnnbhhc5MgcYGihSwmxSX+dfiS0i06FMujEE/eRg
	Rd+VnEvhbwib1w1cwOkiwVTh4zDVX//TPGiOsAv4Wj5At+hARldsqf0ZoPd6LqNXh3HZ0OPWItCWE
	NhZClAy39uBMpqBKXtodMV7Jb6h0y8z/MmSxBtIiwZR3wjPYV56c0TTRO0NgqK6BSbdc/dttT624u
	Nk943psGg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTjx7-002Khx-Vk; Tue, 06 Apr 2021 11:33:02 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTjwu-002KeR-LK
 for linux-mediatek@lists.infradead.org; Tue, 06 Apr 2021 11:32:51 +0000
Received: by mail-wr1-x436.google.com with SMTP id a6so7832342wrw.8
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Apr 2021 04:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B78AvIQPTuA3l0I3nLNmMUo3amV0ILeS2vy0UzeA6L4=;
 b=u7n2cx+mCvs3EGNR7IWh8V5vzcykWoEiaHrhDlO06ILrrjUaIARIpvQLLN3JdyT/e4
 ijVXmdy+hAXuVHS+L9sQpakwXA/PGvbj46pkt3v/e2MhUCf5+dYmfQOu3yg4WvPx6LfB
 nSXlJRH9X4SVt7SwWo6AWSyO9zl5w0HwdzNV/lhNpbxwZxkjLQXQA578nqIZ4bp6sddo
 JsK5qzsMQCqwo4FqsmcPWxXac+lwL4bh1gA3PTgfss9HleFf5pcdVkFyOeOBv2NibOp3
 kbs48/bh+PPICnHJAjd4ad6WuXUcyemElFGwhvdIAgnetJAM4V0IqPEgR7lyZXOzX6J2
 m6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B78AvIQPTuA3l0I3nLNmMUo3amV0ILeS2vy0UzeA6L4=;
 b=nzrGmJQPRmk9Zip6m9AfyUR01A3L8j4Okr3H7Ld6jBRcRkCG6VNdhCr8ZNiZT/5ug1
 zYmb9kFalsrPi+k4ppzgP5/rcqZF1kqi/UVbKbPSO6CTCXJnhQY1BuhzYJkLrXpp2C/L
 FrjPehaG/+hvrnnakGSioq9FGrzFI3SCfiTA/l/Q5dG72Z35DkVPdaxDh+aRZ4ugNFTK
 c/ZSNUPoIIT9pVGYcTyAjZ8e7TbVdhxk62G+NfSe4v+8dNof9pnugBdtP6L4qcpXt+xN
 GxEd1nmIom9gmAUtj+GmTmKQSg0ogw1FoN45tHsFXYfJ9mcfdJqX7JChBz4EAtoZkM2r
 ja5g==
X-Gm-Message-State: AOAM532XpI2C9dlAjVkaIJNM8SpsujwADqHM5a07lPWrzB5IE0apaKPk
 84TCWY/qToUQ+bWLApQwjt4FBA==
X-Google-Smtp-Source: ABdhPJxY199dcKmICZi49GxfShfRAikMdicOk2ggDqvXYLtcCRH1yvdjM9A1IJTgiSOGnHW+aOF4/A==
X-Received: by 2002:a05:6000:544:: with SMTP id
 b4mr5641500wrf.352.1617708768363; 
 Tue, 06 Apr 2021 04:32:48 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id j6sm2424229wmq.16.2021.04.06.04.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 04:32:47 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] =?UTF-8?q?=F0=9F=93=A4=20arm64:=20dts:=20mediatek:?=
 =?UTF-8?q?=20mt8167:=20add=20iommu=20node?=
Date: Tue,  6 Apr 2021 13:32:41 +0200
Message-Id: <20210406113243.2665847-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210406113243.2665847-1-fparent@baylibre.com>
References: <20210406113243.2665847-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_123248_873942_2F418775 
X-CRM114-Status: GOOD (  10.27  )
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

Add node for the MT8167's IOMMU.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
Note: This series is based on https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/log/?h=v5.12-next/dts64-2

V2:
	* Remove unneeded cell-index property

 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index bbddd4b22d3e..9029051624a6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -170,5 +170,13 @@ larb2: larb@16010000 {
 			clock-names = "apb", "smi";
 			power-domains = <&spm MT8167_POWER_DOMAIN_VDEC>;
 		};
+
+		iommu: m4u@10203000 {
+			compatible = "mediatek,mt8167-m4u";
+			reg = <0 0x10203000 0 0x1000>;
+			mediatek,larbs = <&larb0 &larb1 &larb2>;
+			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_LOW>;
+			#iommu-cells = <1>;
+		};
 	};
 };
-- 
2.31.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
