Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86AACE7AB9
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Sep 2023 18:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lo5CmJ7j45LMzfOTVuYeJkWSf+ItxDRDqPNzngv56Dg=; b=coHgzrvKdSf4kv
	vkgC4dpSRCaxqTAsAFJ6J1hxCzjwQ45yygF2d8apTkxng7NtOIxS3sT6hcjJwOot/e3BvWXF4vtL4
	/Oo8UfuVu87i3T0TScSNnq77AZaMWJBDBgaHltu8EF8jOC1CZVTcPDbxKMXX81q4vYM1JQNaGQZv+
	twUb97iTodqltKhSoBHWTuvd0lJacL7N5ei/94sKuzdnsblwhLgLHsLUv1R/9SraWlN8bp5Zl4uIu
	bgg/5E4rifYNPNxWu5CMroUysj3uw7e8Hz2eGqGishY7KQjnPFdOLOyTbrWC5D4JnyiXLvpVZIVQW
	NJFi0FSqioujUZLmPAwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkq9U-00EoYb-0A;
	Mon, 25 Sep 2023 18:17:48 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkq9R-00EoXM-0l
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Sep 2023 18:17:47 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9b275afb6abso683660166b.1
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Sep 2023 11:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695665863; x=1696270663; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lo5CmJ7j45LMzfOTVuYeJkWSf+ItxDRDqPNzngv56Dg=;
        b=iH2ObFMz/0vIeTVBXdrwaO5/kQWgDBfS6GUDgnUDXPCaQUz53n825nTDG8hyzaNKQ1
         LARTdTKgNwdwssxpSJj8K62BEFMyzFJghMtuvgEJ5OBppu061aM6IDwixESeAJabRqu6
         HQzoOJbw5oDsYMJ7Hw/Io5OIJTvAKhumnewPmhEwwmgLdr1HADw0Tg4iFbm9T/WmMhoT
         TGtUJEIf/AKeXfqwBTKphhFRq/Y/7AymKmfusqG2ZLgc+T+37EgtW3ZxrBnu1NVnU7rk
         VU7+AIQkFYbmTg9REZcUOVIWPvFI+3THncTNGdrkF96yVlZ3WwAGk40hl/BaAuBelPV4
         +pXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695665863; x=1696270663;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lo5CmJ7j45LMzfOTVuYeJkWSf+ItxDRDqPNzngv56Dg=;
        b=HJil9+y+jK93uSisbD1MWQ45QPlIb+SNPIOZlo5/te32NY0QirK8aLlUsAHksDCzqC
         gIF41Qa3crXK784xsX5clN2K2QFE6W4lGbQAcABIPuoD26S4kFEDqamR6iJLn5WAKMkP
         ezJtl3MGUbu/W2s5eoKHBeuh0WGkxTDtEmR/Cd3cPtLWjMCuCDMliUEAQF3Qywyv4b35
         au4ts+5WApf9MjQB7O2HqCZUGKeGE+3rzIAKHQZ4SCDqhcakhyq6V3dmz0q/wAYUkk62
         QF+1mCdveJGTdl+4hNsX3gaHuF1rg5HRFvuvJmKnRD+CxGQBZ4VJZE7lfE7y3szXpdJU
         B9Yg==
X-Gm-Message-State: AOJu0YxS0kOwVB0QAJ33rJsGWzgRP/aJNp/0/yX4QywSm87gwLFJLInX
	zMkMEfe1xxK/Au6peIBfI4z6Dw==
X-Google-Smtp-Source: AGHT+IHq05umxlWx+E0z9Sd6VJqdsjz1GGLwKvLo3q0XHdysMl2QoqO299axqEC6a1SRLA4tCeZIXA==
X-Received: by 2002:a17:906:101a:b0:9ae:4057:5c81 with SMTP id 26-20020a170906101a00b009ae40575c81mr502560ejm.35.1695665862880;
        Mon, 25 Sep 2023 11:17:42 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id j26-20020a170906831a00b00997d7aa59fasm6793962ejx.14.2023.09.25.11.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 11:17:42 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v6 0/7] Add IOMMU support to MT8365 SoC
Date: Mon, 25 Sep 2023 20:17:34 +0200
Message-Id: <20230207-iommu-support-v6-0-24453c8625b3@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL7OEWUC/33NTWrDMBAF4KsErasy+rWcVe9RspClUS2wrSDFh
 hB89wxdFter4T1437xYw5qxsevlxSpuueWyULAfFxZGv/wgz5EykyAVSOh4LvO88rbe76U+uEE
 roZcWtURGm8E35EP1SxhptazTROWY26PU5++PTdD5/o/bBAeuEwQnUjQyiK/BP6c8VPwMZWY3w
 jZ5CkgCLESTPABqNAeAOgUUAX2HovdRozPxANCngCbA6a531nRBCzgAzClgCEjeJlDWgVPyD7D
 v+xv3FmpOtgEAAA==
To: Yong Wu <yong.wu@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2527; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=2VrBRVw7hSEZdQZNKl5eN9fbQ+qaJWa/C2dhMkcyvKY=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlEc7F/R8a2dg91I4rS+9QAqXfyCLm6qoGsE40le2+
 Mvr1tdSJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZRHOxQAKCRArRkmdfjHURYbNEA
 DHZRLv+8z6hKMJHRu5gGepaQHb2lJzP7V0vQekuINuMxPYuLNeXDPUNCeUY99FkVkNVKDBSm8TqASU
 MSO/n4LkVeIe2HgE8yYN6/MvHI66jTn3xMKgDTnMHRuOobXtqZ4eAHvRpM0aupGXAOKbObUMer4i/f
 BuDYz0O0nbI1OcpMQpf0paZ+jJUc/oI44QbR6COOqBmHgCjAtE7TLrMRgexFmo1Dz4B+v2KfquRirf
 XZeIyNNEIfeiDkBZrqMvjtT7w2e2hJ/bWhlgKybBJ755EPR4AQ6LFgTeIANDE0THJUnunm1BURsMHr
 CyIb9UWcBXZIssZVYOMEE1soAEaCt1Ptc+w2HbIXsIrsYCdJMuD1lAGp6vy1ZdLB5NQR9cOPMB/CHp
 YuiQpv5m+HA27qZw5Fm0MSezEygh/GmZY21eVdT9XyHf4ZJP8eWAnV0aMYju46ci3TiDsvwglxZ3ky
 XavDic1/+wx+Kf2gwCTpWo87T9BtYMZlG8GHxq5LILM2tOQJpS3StNlnLR5cR4oQr84kqdTP2lHznh
 uy3sk/MIvrHcZIxZiXIGKruRSCOO4mlb3AZGfJCvM0+eooJ7uVyy7Ov9tDR1Z+4l4+IMN1pn3ziO3b
 Y1+NAR45oOLTomSZQPKcaW3BYdEI1f1UqR5yiOiT83x7zqLiPi7QwYeexM/Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_111745_301529_C8298C2D 
X-CRM114-Status: GOOD (  12.24  )
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

This serie depends to another one which add power support for MT8365
SoC [1].

Regards,
Alex

[1]: https://lore.kernel.org/linux-arm-kernel/20230918093751.1188668-1-msp@baylibre.com/

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Changes in v6:
- Reword "AIoT" to "IoT" in the commit messages.
- Link to v5: https://lore.kernel.org/r/20230207-iommu-support-v5-0-fa6f03680832@baylibre.com

Changes in v5:
- Rebase to v6.6-rc2.
- Link to v4: https://lore.kernel.org/r/20230207-iommu-support-v4-0-84798657c410@baylibre.com

Changes in v4:
- Rebase to v6.5-rc1.
- Link to v3: https://lore.kernel.org/r/20230207-iommu-support-v3-0-97e19ad4e85d@baylibre.com

Changes in v3:
- SMI driver support and bindings patches have been removed from
  this series and sent it in another one which should be merged before
  this one.
  - "dt-bindings: memory-controllers: mediatek,smi-larb: add mt8365"
  - "dt-bindings: memory-controllers: mediatek,smi-common: add mt8365"
  - "memory: mtk-smi: mt8365: Add SMI Support"
- Link to v2: https://lore.kernel.org/r/20230207-iommu-support-v2-0-60d5fa00e4e5@baylibre.com

Changes in v2:
- Split power domain patch (3) in 4 patches to explain in the commit
  messages the added subsystems.
- Add an independent "mediatek,mt8365-smi-common" compatible to have
  its own LARB bus select.
- Link to v1: https://lore.kernel.org/r/20230207-iommu-support-v1-0-4f0c81fd52c1@baylibre.com

---
Alexandre Mergnat (7):
      arm64: dts: mediatek: add mmsys support for mt8365 SoC
      arm64: dts: mediatek: add camsys support for mt8365 SoC
      arm64: dts: mediatek: add apu support for mt8365 SoC
      arm64: dts: mediatek: add power domain support for mt8365 SoC
      arm64: dts: mediatek: add smi support for mt8365 SoC
      arm64: dts: mediatek: add larb support for mt8365 SoC
      arm64: dts: mediatek: add iommu support for mt8365 SoC

 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 210 +++++++++++++++++++++++++++++++
 1 file changed, 210 insertions(+)
---
base-commit: 2b4f840a1de65d77644236c72b3f252aa2725a42
change-id: 20230207-iommu-support-5e620926e42e

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


