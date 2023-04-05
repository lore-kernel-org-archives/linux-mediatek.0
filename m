Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74773C761AF
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 08:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hcK2E3trf1X3fQu2pfYafCoNlkzzMbic53P9GU9YSjg=; b=Lvw0M0yhYMxrFg
	nt72vCJLpJY31fbdAuYaBn1PQPCRa4XX0kRQUaTNjKuQ+9ceItWKhINuN8DByeKj/WhuHaHbZI5IT
	K9NehlFdlIL9lg16601KVMbzes+45+YmhdZeUmlT5S9YD1duPPCyBq2iXYBT++OPtNCQcVkQ0tIPd
	omGPOwpPK/i+vao9jlwSOZwxCllS70ER3arzrXQntXhrdwbh5gSkZEEMvVtDOq2bri9JsqUWOY/cK
	ycJ8852+MeHftsDyoKy0I8J98TUZ4yVShF2hZevLYkL6KiOc5/qj1GjbdrOEMtGpjyQnNottw/p1H
	SBqe39Qsp0xNZc/0uaDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjyBo-003j8c-2q;
	Wed, 05 Apr 2023 08:08:20 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjyBf-003iuQ-2P
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Apr 2023 08:08:15 +0000
Received: by mail-wm1-x32b.google.com with SMTP id he13so755653wmb.2
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Apr 2023 01:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680682068;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hcK2E3trf1X3fQu2pfYafCoNlkzzMbic53P9GU9YSjg=;
        b=QH6GLIo9yx62qG0tuORpKBwGUzWxhT0CHl/Rn852+qO3xDg0uj5D7j37JDs87xEZHk
         cS8W+HvI4yqTHzBhZh5NfSu2cG13pUUNh4g8c6Yz1iw73iG0sb1drqZJTpVJSAfGWPkh
         3CmYMuSj3zbJecpst5FwiKE+IrNmutBUk03pp7/M5poTeLu8V6Y0I4kYJyuue/nO1evC
         58mM1Cq4O4JoRoyqp831DK3qUxVng0nsmuLQkGjOuakQMcnY9VD5hvZiJt+VwmtdiSYw
         AyDHF5V7G3nUiqscdTmci3IFQfn0U4ww+ALaMQ2GYUvkzQSZ4FJFi8f8WjUtEkEv0WW0
         WTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680682068;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hcK2E3trf1X3fQu2pfYafCoNlkzzMbic53P9GU9YSjg=;
        b=NVcBp+wfBp7uro5xnlCimYtjwWt3OTTebPlKhMIwgk+UU1E4DmFkNCih/7RlsqHDda
         K9ewGD+gOxTlEurQdegB/Lq5YYo3nTvrzF0fnNUP3bi/DdGKLn/dtCgAW1d+TORHOjPz
         WpY+ZXHMAxrDVYa/7eptf5K6g8uA2KVWasKH0EmILDW0ELFbC7BIzRVFX8BYtBD2uBq1
         zhVuHbA0s4jYa0nfHEKUGL28jInw+8D6SdU30aoskBQXfJ8xGfXKv3dkSnxniytZwV0O
         CvBg+WoOq8DAiG/Zj/n0BXYEsZnvL5mQA5946SFqw1NQF71GgsHtvd5Jb/HX8mD599xM
         HvgA==
X-Gm-Message-State: AAQBX9dc/r3KOA21mSIyILv2Ea9d3dmOn1JLax9Q9MmSPDaWn3ESUz0W
	WrMg1gsICVHmGD6mCuoMA94CTQ==
X-Google-Smtp-Source: AKy350blkAH8sowKFtZnLwupT5xq0atAtHaN/FP2kuzZTraWnNrbQeAcuKZIoSgMD4p/C7FxIeKQWA==
X-Received: by 2002:a7b:cb50:0:b0:3ee:6d88:774a with SMTP id v16-20020a7bcb50000000b003ee6d88774amr1092045wmj.14.1680682068474;
        Wed, 05 Apr 2023 01:07:48 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d4-20020a05600c3ac400b003ee8a1bc220sm1378395wms.1.2023.04.05.01.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 01:07:47 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v2 00/10] Add IOMMU support to MT8365 SoC
Date: Wed, 05 Apr 2023 10:06:42 +0200
Message-Id: <20230207-iommu-support-v2-0-60d5fa00e4e5@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABIsLWQC/3WNzQqDMBCEX0X23C3JVu3Pqe9RekjiWhc0kUQFk
 bx7Q+89Dd/AN3NA4iic4FEdEHmTJMEXoFMFbjD+wyhdYSBFF0XqihKmacW0znOICzbckrpTyzU
 xFMeaxGij8W4oll/HsZSDpCXE/fex6RKvf3ObRoV1r9xN911DTj+t2Uexkc8uTPDOOX8BWaq0b
 7IAAAA=
To: Yong Wu <yong.wu@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2098; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=7OqtyGysS4GG8JoZFWoQINnDDmOHA1NIaDmgqK4G2u0=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkLSxSEfi6DpmkrTcfu8EAkLqx/FnCXgucH61zc8uS
 LoOkNnWJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZC0sUgAKCRArRkmdfjHURcG1D/
 426AWvKMTLV61TfBg9mt3vins/UspbZm0eGa5/SA7HHPiR/3xrwvx3nwlSB9dO+P1kBWRUk2eK9H2H
 mAJWhCKzy3mFgG4vQDXxr2K4zgWgVlWVNpRl88aPjnAm5U5c56JkltJk43xrGtSv+oMjQ1TcYPACEO
 zrDX0Qs/KvBCMLOuQmT/Ss6+LxR+E/Ahr1CsaxT/63SiThhstX6kW6XbXmvnEqcFVQyX0mQwu01jNm
 DUOZBGrRER9nEHO0lRiGTSWhlZGaHaLoG1tTGdoljjzjSZMiHBKlcxkRi0ib5Vedw2eR1bA4DDFZED
 nw45G8gjgcRfpwMx36RHMuirOpnvgpf6B/bg8ohFXBb+xZ6H0EBec8+/R8EHayB4RKycF7O+6vHxHY
 KwMx0P8RYx6ddhAmFXIfOPQW+yqzZ9CbXqCgJ0HjejLnTJvpyc01t1YO3l/ItWBsa1RpGF65qluVoz
 YW3PoLVUAia90XP6pefaM+rGWd8/hUnj/dXpvkj7r4by3stW01dk0KG6NtjJ3c6pzmGs3BVap/jFda
 OwybXhoePVi5ojezT3iNUic9mivieyOGGubj6z78TYLS5OGgFehz+7G0mqQgipamhghQIYPXhMIle1
 cw7yN1TBdDFD6mZkFYTmNZ6o84FNUOHjYs/Z0+wdA8OlCUCo5ldOgDYDcXkw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_010811_811833_9F911066 
X-CRM114-Status: GOOD (  11.20  )
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
Changes in v2:
- Split power domain patch (3) in 4 patches to explain in the commit
  messages the added subsystems.
- Add an independent "mediatek,mt8365-smi-common" compatible to have
  its own LARB bus select.
- Link to v1: https://lore.kernel.org/r/20230207-iommu-support-v1-0-4f0c81fd52c1@baylibre.com

---
Alexandre Mergnat (10):
      dt-bindings: memory-controllers: mediatek,smi-common: add mt8365
      dt-bindings: memory-controllers: mediatek,smi-larb: add mt8365
      arm64: dts: mediatek: add mmsys support for mt8365 SoC
      arm64: dts: mediatek: add camsys support for mt8365 SoC
      arm64: dts: mediatek: add apu support for mt8365 SoC
      arm64: dts: mediatek: add power domain support for mt8365 SoC
      arm64: dts: mediatek: add smi support for mt8365 SoC
      arm64: dts: mediatek: add larb support for mt8365 SoC
      arm64: dts: mediatek: add iommu support for mt8365 SoC
      memory: mtk-smi: mt8365: Add SMI Support

 .../memory-controllers/mediatek,smi-common.yaml    |   2 +
 .../memory-controllers/mediatek,smi-larb.yaml      |   4 +
 arch/arm64/boot/dts/mediatek/mt8365.dtsi           | 210 +++++++++++++++++++++
 drivers/memory/mtk-smi.c                           |   7 +
 4 files changed, 223 insertions(+)
---
base-commit: 1db7fc94e6e116f43f7bf3adb33407f21bc29fd9
change-id: 20230207-iommu-support-5e620926e42e

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


