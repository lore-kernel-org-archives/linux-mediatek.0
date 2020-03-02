Return-Path: <SRS0=QQ5c=4T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B81B5C3F2D1
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Mar 2020 11:22:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80EC82166E
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Mar 2020 11:22:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OjI9PsDb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NPzYl0+C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80EC82166E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vfTWe6tl2jRgoDS0LTkIMpkS/CbdrPr0UPq2tcQl4p8=; b=OjI9PsDbZ3TdQ1
	8w2htYMCw1UGBIlPZu50HduHXAnWPQmJ8cSSpm1d7mJxzX6091Lfta4Nf/0aon+9MeHgcBAqb05xv
	tWsgTElCh1g2htbDNbR7PJsfnPTVVe1Z5ZsQg0xSAKUdZ/VwIKVFCPCMQpujoo31925lkgIgoK/Y/
	27ClekKc/eHHkvjxSQqdUUWg5iEr8AAy/iJK5s1XNofvz3kzmINod/ShKWFawW1v8WQmaAVEL4stZ
	PMgKSNh7mYhCwOUQXCq7ilO7gvdXa+Rds2Pwan0WPT4z540frkclSU17ow3TSDNsNyx2G9XaSsnxr
	h9tHsug3MtnjwuSG7e9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8j9C-0007wn-59; Mon, 02 Mar 2020 11:22:06 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8j98-0007w9-Ry
 for linux-mediatek@lists.infradead.org; Mon, 02 Mar 2020 11:22:05 +0000
Received: by mail-wr1-x444.google.com with SMTP id t11so5679136wrw.5
 for <linux-mediatek@lists.infradead.org>; Mon, 02 Mar 2020 03:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eHZJoauDU3YCd4oo6H8UkUj4vcKpuKTOVNgGI3sKcA0=;
 b=NPzYl0+Cj9Bodz62CFuc/7zeYsqpkh13Et0PpWoBeAy0TS2FC5OplEhDkxAYsc7Uvp
 GkkjKKcMZX9GWQNuJ5iT4Dq6TigXqR+mvYZZJpZyWpiCVEjb9PJ9fvCRFFGTnOQ4LZkO
 YzxSjml2OP392/Scf5dO8G7l4Kmh5NyMy/neFvB5mwjAoWkrkHhTs/jdvRjF9gs4KE8M
 kyZFxBfe6c7nR6gxQNu1/BoVNv9QgAajUc8QZpwFJUc4A11WKRDG7YBLYwsOMd2im58i
 CO7l/S5+9YSI9y0Ts7mQtTlB+k0k2jRGaGJRBOLGJ/oGOpWl2+2d566XLfXw+zwRHKS3
 jmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eHZJoauDU3YCd4oo6H8UkUj4vcKpuKTOVNgGI3sKcA0=;
 b=SIJ1oAxcYhQwcrclH9cBh0NYjgeJEG7FjQy9+9MrwiVXiVN+ujDm/+OATow+CEGHNS
 fmwww0drRORQfrPdSdBzGojcJ/JD7kwhZbJwDhwbqk7DqbtajX6vI/pH20zHY+6w6HaF
 lCahhbkfkp4x3ojAekk0obKubW2myg4S8kWj5dNKfONroSijkmjyiqOpJicA4a/9Np8q
 MTILqZFWMNKFF09uKGXcQ1fGIzYD6Cyxys/pkbIwISrnZe4Nkq3BW3c69oBDLyusKV0p
 MPhxfP7K0qdVgD0qFjq6kOm0UdojBSV3hPHRx3ZHWegohgCZpXfMydwDd+zso8EWBaOZ
 5+Qw==
X-Gm-Message-State: APjAAAWycf3dQ2Ix8f18yZ14X4VUsJCI/cKRLur3mbsCy8ER3bGP9MVk
 quaalBmVGbmahei7XF7nl7n8b1RvH0o=
X-Google-Smtp-Source: APXvYqyZlRonNGPN6OZje8r6g98mgNwbkojbpYskc2y6mkeqC9MkKpFwp4Ipsn5QsmRq8gTVXPpHag==
X-Received: by 2002:adf:dfc2:: with SMTP id q2mr21397636wrn.209.1583148120855; 
 Mon, 02 Mar 2020 03:22:00 -0800 (PST)
Received: from localhost.localdomain ([2a01:e34:ecba:5540:6f5c:582a:cc84:32f5])
 by smtp.gmail.com with ESMTPSA id j14sm28398441wrn.32.2020.03.02.03.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 03:22:00 -0800 (PST)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 iommu@lists.linux-foundation.org
Subject: [PATCH v2 1/3] dt-bindings: iommu: Add binding for MediaTek MT8167
 IOMMU
Date: Mon,  2 Mar 2020 12:21:50 +0100
Message-Id: <20200302112152.2887131-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_032203_048349_3891A3F7 
X-CRM114-Status: UNSURE (   8.01  )
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
Cc: Rob Herring <robh@kernel.org>, Fabien Parent <fparent@baylibre.com>,
 joro@8bytes.org, ck.hu@mediatek.com, matthias.bgg@gmail.com,
 yong.wu@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This commit adds IOMMU binding documentation for the MT8167 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
---

V2: no change

---
 Documentation/devicetree/bindings/iommu/mediatek,iommu.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt b/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
index ce59a505f5a4..eee9116cf9bb 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
@@ -60,6 +60,7 @@ Required properties:
 	"mediatek,mt2712-m4u" for mt2712 which uses generation two m4u HW.
 	"mediatek,mt7623-m4u", "mediatek,mt2701-m4u" for mt7623 which uses
 						     generation one m4u HW.
+	"mediatek,mt8167-m4u" for mt8167 which uses generation two m4u HW.
 	"mediatek,mt8173-m4u" for mt8173 which uses generation two m4u HW.
 	"mediatek,mt8183-m4u" for mt8183 which uses generation two m4u HW.
 - reg : m4u register base and size.
-- 
2.25.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
