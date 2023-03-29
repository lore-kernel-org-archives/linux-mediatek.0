Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27391C6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 11:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QP7I05xe70jVSB1QevUo3ItTmkkaasYyLn2NTliYSvU=; b=frqYMuPP+o2G1l
	ElkMwHjKEoJUF/QwwQZT9ZvTCcDenVRuUCNOvf6jOsaHkXHi9eMxaZZQPkKH6d+LmADj8HCSnhxCg
	A5IYfJGTt2EFCunBmqlcRVyzgcGIE5/uN/pEG2tjiLJYevPqk3TvA0dPRZaLzPsz84yl1p+X6yTfw
	QikyZsltsRucXKcCm7eKMs9nMgyD6Efk52f2iH33LF4obhAjkoVH/0Q9Us/DQ4cf9C7zNTiY3kDFO
	xkG4CaUHKpx7csLy/yAdZp/BG4K9hah8RaR8trlhqIMJYBnln2XWELx/+J0dhoVdB8tOXabIKmnXU
	tE4/XuRF1h0imYwg8BVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phTXe-00HXr0-29;
	Wed, 29 Mar 2023 11:00:34 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phSTq-00HN3C-1k
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Mar 2023 09:52:36 +0000
Received: by mail-wr1-x431.google.com with SMTP id i9so15023943wrp.3
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Mar 2023 02:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680083552;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QP7I05xe70jVSB1QevUo3ItTmkkaasYyLn2NTliYSvU=;
        b=atzVxpI8GEB8gm5g11uJpDSamSw7m5l2Jb2gktKhjqSnEPTUXyuwdcj6bcJswvcEjd
         3P1nGdyMbGaRALyVgM5Zz/Ue4OSaFoaqZySP/4Tnar/fvfNQ2CUM+CmDjvrxHX1wakZN
         a9Q1ERG6XbGyjH+JTsnxw3OM5F7Y5RCqYm0evl/aYa9oBBxdw9MzZmRsO/2At7tSzY7H
         XtRMQ17E+z17D/gkUqMBBkfaxZKGitD4FdaCmAJ1guLBqPi+ez9dIBMbg1B5IzhOJSr4
         rtm9MpcV90RBhILrJBPsoJyB0RySuQpAzzGQeztVJGst4Vk7DG+3n5Y06/cDWwF8egDP
         MEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680083552;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QP7I05xe70jVSB1QevUo3ItTmkkaasYyLn2NTliYSvU=;
        b=Z4W2Sl0tEYsGIsvVS7ixlK1UO/1bUiiyryKe2zdvLeLmkAqLcgLer+jFsgXI8rofJb
         4iwuj3f1fsXnPiG/ErE0ZP6GiUSoOzBbipwX7vv6RKIdY1Ec2Eq36+5QtZXFJcoU8kkL
         glezUPiKhPVu328Hrr0j6SEH6eLbY49VaEqGXOFXS6XxN5batmiB3FYlnKfyKPT1gJku
         4LfE5BHmhZIaFy2AIkVYdUQA3AOliVUVu55XGiezdyrJMnTSF3tOZB72NSAbnra5MwH3
         OZ0MU4lHaiOa/IVaYwrkXaU5H+R7Xyyv3rvgB1mXWyMvYOG4PxnjtSnhOsyNaaCs5Aon
         sMgw==
X-Gm-Message-State: AAQBX9dhVjQT2AKzhxvMxGw49kqTh3ga/ByQ+aDw4gmSR3gEZkW5X+CH
	C+27MrEjUwrP+6FX8UFsrpESWGbU/SVbSp4gkPA=
X-Google-Smtp-Source: AKy350aZi5UrBH5UKgpATnAonVuE25oSWIchhuM9c6JzusQ6e1+Pj0BrguFi+K5Xz7HKNthrYD7Hkw==
X-Received: by 2002:adf:eb8c:0:b0:2ce:a8e9:bb3a with SMTP id t12-20020adfeb8c000000b002cea8e9bb3amr13364022wrn.4.1680083552457;
        Wed, 29 Mar 2023 02:52:32 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id a18-20020a5d4d52000000b002d1e49cff35sm29667158wru.40.2023.03.29.02.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 02:52:32 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH RESEND 0/6] Add IOMMU support to MT8365 SoC
Date: Wed, 29 Mar 2023 11:52:19 +0200
Message-Id: <20230207-iommu-support-v1-0-4a902f9aa412@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Yong Wu <yong.wu@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1483; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=+MCjkFE0VqVcHeHS1WtIefZoTsrmPvOHx7BnXXT/Qlw=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkJApfr1/SHi7OubRQWiKNxuTB5I62tKyq/5VwOY+P
 NJX4OBaJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCQKXwAKCRArRkmdfjHURU+TD/
 0dO7RC76+8JTfMGKJn7IIdqFMzrDsSdcN/Ws/JLku31n4A+eUHnI3JYToxEbccpwDAXTz9/B3SkqrM
 b6hoJmjCM7vHpb9ApN7Nh6VSpFi7CS0NCafl5keEWCAmJRbWLrRIOvVHY0tWOPNnvxwJ25o/gLeEfL
 6UBBrHIXqi8w7v2lX6cIcQxJVbbndFs7dQcSgdwJPVzApZ5IQx0JS4HdVWr6yS6OUHvjlbNRhwE6RK
 3zQdBFBd+Vkxy+Qft1xYAjzNJgbcIFsgghU5A3QnO6eNyOegPjANhxo2j9XpjGnpORWPMi0pxTkIjb
 oDX/OZ3R7DC/RLziyHxFi1dKpYRwbiQikHShSn7j7PE/adoSLD5d0A+T2ut01SDCT2fbz9xFxgM/kG
 QPd3WZ//kzqkhUZKzyY3UjghUF44SCkROZeUPr8reKMG2n6lbFzqrdtNj+WwtTynUTt89m69anqrbc
 4c45UsY2Ti29nRvrM4jr3mz6CP+Nvlx/lQqvypfG4Ecp2XcmHo9ctqTS8lI65NQSCBP1vRS6gsz+ys
 brVOVq5y89wmlKdrGVtuyXvXt0nA5XS7nagPFT6HWmzYrQwqX6dWkob4Ictfg8Y1PjOrQts3mUQqT4
 W6jhAxFX4AxZM9Fvc7rPlNwGtHsghUPMWC5D8seLDSdvM0beFfGGZ9G31fzQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_025234_574549_3A2AA645 
X-CRM114-Status: UNSURE (   9.31  )
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

This commits are based on the Fabien Parent <fparent@baylibre.com> work.

The purpose of this series is to add the following HWs / IPs support for
the MT8365 SoC:
- System Power Manager
- MultiMedia Memory Management Unit "M4U" (IOMMU)
  - Smart Multimedia Interface "SMI"
    - Local arbiter "LARB"

This series depends to two others which add power support for MT8365 SoC
[1] [2].

Regards,
Alex

[1]: https://lore.kernel.org/all/20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com/
[2]: https://lore.kernel.org/lkml/20230105170735.1637416-1-msp@baylibre.com/

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Alexandre Mergnat (6):
      dt-bindings: memory-controllers: mediatek,smi-common: add mt8365
      dt-bindings: memory-controllers: mediatek,smi-larb: add mt8365
      arm64: dts: mediatek: add power domain support for mt8365 SoC
      arm64: dts: mediatek: add smi support for mt8365 SoC
      arm64: dts: mediatek: add larb support for mt8365 SoC
      arm64: dts: mediatek: add iommu support for mt8365 SoC

 .../memory-controllers/mediatek,smi-common.yaml    |   4 +
 .../memory-controllers/mediatek,smi-larb.yaml      |   4 +
 arch/arm64/boot/dts/mediatek/mt8365.dtsi           | 211 +++++++++++++++++++++
 3 files changed, 219 insertions(+)
---
base-commit: 1db7fc94e6e116f43f7bf3adb33407f21bc29fd9
change-id: 20230207-iommu-support-5e620926e42e

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


