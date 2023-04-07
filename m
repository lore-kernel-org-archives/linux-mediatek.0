Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792C5C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 10:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YHYOqnIdeZEQQSsG6kV/waTEgcH9AADMsfaYGJviNTM=; b=OPR8oowT/QNnJaIzK5c2FxJIE2
	LTNkaE56mXRBkts/WUk8Xcrkr4z301ot2tOtxcQeJXXhgX8dxY9FWUdSz2VxWa3bZroAh+cO97KP5
	W/qvQaxunVwhAKmSG0ejjjbc9hloO2EE/cq3IP9JJ1/G1Moj03RKFmopDjIWKkwnkAuFFLxqEhuOm
	edx3q/vbIR2Lu65qDprNzxdULKheI+aaCU51qPkF/k1HFsUiqwPInk2uIuYAZFbvvq318c1mAe+aq
	+5OZfY762qxjSj11LrQnnrNFk9JMao2dhNBWKpDV+cFkGGnrp69yVwYReqzymqlYHp9JvWhx37XSs
	G/fA6Szg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkjdL-009tMT-1K;
	Fri, 07 Apr 2023 10:47:55 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkiUI-009g0A-0B
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 09:34:32 +0000
Received: by mail-wr1-x433.google.com with SMTP id j11so2177951wrd.2
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 02:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680860068; x=1683452068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHYOqnIdeZEQQSsG6kV/waTEgcH9AADMsfaYGJviNTM=;
        b=k3pIR4x5+wOfjx9lQEO60im9hZ96rrj0z+y5eKQBUKc/aMLuxUQhk06d4qr0J8cT/o
         VACKgdXzQIcO8Ww8V7/xqWlii5sZPH3YZ+ZFDurV2Qo99iqovpiMl5fjBn6p7hLCa61v
         loD9wxBbUmYRITQL6OBUyTTIrCG0/b0AEYF2HeBHAbrtfafFLPuthhR1xM14m5opHcJR
         GTG0DO3ErDPWNbNYiXkEf5H14rqlaBSuIVM38LSA80uKssCVELYsFVlMHeilpmK68etI
         9sDeHmIS++xnJyJREr5ZkpaLXjQra4tK235i7NqDEqarbObSt9HIYH62uw4uQKx35ukF
         KUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680860068; x=1683452068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHYOqnIdeZEQQSsG6kV/waTEgcH9AADMsfaYGJviNTM=;
        b=zGxymI7xM6Bk1ew73zzlzsSuuwoBlehTcIXdsdE5FwB4GoyghPzkpvVGla6BjKx+8h
         /nZ/8LQVv/DWEBwU6QmaxvxL7LCzrCNJsZb6tWtqRmAHEckCTqJQ3STOb5fT51K+DBN+
         fvlZ2yDCU4lyCmWJCWLN88NJDgYUzt5tBxB6v0/g1mDGvBsY7qCaLjg5oY3J+WXknnJf
         BErhS2Bq3JsRkB3xDySJXZrK0ZA8buITS0WjvsWGddSx34hObULTF86qC9oNoRXc5zfc
         gF269L6TAHv+LsGcPw6QE56twHsUJ0dfZq8behTluZK1OQicagrsG65YXzKv3aPLouKf
         NWVQ==
X-Gm-Message-State: AAQBX9em/4btsGwi1xupGt43wPAGfujslaqW/cwm1SzcIiyf/YG3s3GF
	mnE8gFoMSZZPuX0C4v2QIO/RPQ==
X-Google-Smtp-Source: AKy350bHUE4UFLR7A4HheArzii7UQVzEmxq9wP+ITj9W2OkfjTYRlR/FG24WqK5tgspb8CbPkQ9txg==
X-Received: by 2002:adf:e846:0:b0:2ef:b052:1296 with SMTP id d6-20020adfe846000000b002efb0521296mr879884wrn.22.1680860068577;
        Fri, 07 Apr 2023 02:34:28 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id s13-20020a5d510d000000b002d64fcb362dsm4020432wrt.111.2023.04.07.02.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 02:34:28 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 07 Apr 2023 11:34:13 +0200
Subject: [PATCH v3 2/7] arm64: dts: mediatek: add camsys support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v3-2-97e19ad4e85d@baylibre.com>
References: <20230207-iommu-support-v3-0-97e19ad4e85d@baylibre.com>
In-Reply-To: <20230207-iommu-support-v3-0-97e19ad4e85d@baylibre.com>
To: Yong Wu <yong.wu@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1044; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=x/wu+Gg/Z7J2I0F/gXx6zOm7KvojSbz4OytIRAJsBIw=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkL+OhucnBrd49pvMbqIMlZUY8dvmyomr+x4uYi4vC
 eh+C3bKJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZC/joQAKCRArRkmdfjHURVdHD/
 0WCP0DZQ+UKoyCD95Yd9rE6bg3Nr9C4CfmZyQ4806NHa1KO0J+tOvhXn8krVpWU8wXS8vY0148LXmI
 WBB18zc5bk/nSrYOhxr/05jCdr2f+KkAqZtUTx8qc4xMZ8K+DF/cxtya0LkFuVSUOTvSSBZf1501fZ
 nQ+eifAMYStNJPvkjSbUEkQ2lTf0rVgo5Alvz+5ZJPJiqJF7XLGAHNNgHGpg3BTqKBdE5j9OBkNRMg
 vAoyIXXlx2K/f5vFFXqAP+PVhyl8DibiL1a5W+kwZFZbba3NpoKbSayJWbJnXPBTGIpmkcW5tVoCox
 GqMOlGez00z8ErE8MDtZMdaBzMwCyp8aRjcGmtRn0DHIlQWFEgir1Sz4ow8zdRsiTP+CaJyMmkyJBe
 UQjxorXX//VMZbzrzFEf4cIX5LRE1Yg1RhPXHW8ZXPc7cGvA9SLSTK4ebAhj4a72vq+fx7+YfKSJEb
 3mNeo5KugG+2EizgVze7CNOrVEBu/y6iQdQsY7uvpiO36sO6A7pgQ6/PiyeqWtTd77/sfFGKxYpqmz
 ywTYXzT638j/UbhN4VKvlI831lI+1uvrISiXTmE25cPzhG/2iWNXx9hIyYhKFzCeT5VUywB1LI1fKf
 rJHMAoek+0yGDMKNiQDj6zP6P5hMOZf4HP5n1mQ9W6X49hhRjeIkVGbh9RYQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_023430_103534_86DE992A 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Camera System (CamSys) incorporates an enhanced feature based image
signal processor to connect a variety of image sensor components. This
processor consists of timing generated unit (TG), lens/sensor
compensation unit and image process unit.

For more detail, ask Mediatek for the MT8365 AIoT application processor
functional specification.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index db9ab538c34d..73cb10d296fa 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -598,6 +598,12 @@ mmsys: syscon@14000000 {
 			reg = <0 0x14000000 0 0x1000>;
 			#clock-cells = <1>;
 		};
+
+		camsys: syscon@15000000 {
+			compatible = "mediatek,mt8365-imgsys", "syscon";
+			reg = <0 0x15000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
 	};
 
 	timer {

-- 
2.25.1


