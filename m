Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56956C7EE24
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 22:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hpVJsmC3hyyCOV39d1XA4fZrHLIG7rwi+xqTsa1S20U=; b=ffGyjsUCbOufFGbTlBK/XgjGyh
	YY+DhE5uhzHAB8oLFQS2XZ/h9l1G8EzdX0tI/gnUZwcobel1zTJ53LtJ+oh3wmxUHhTMLDTOxxunM
	iqOAabre97kHMhkBvqgVxU03rtGDVFD2xG+/h70xKE6S6LPyCLPme3Y5LvGhFy8v+BurUz1OBiuWQ
	SirPOkn12oftHWb8HTPrliHDOhznxiM+RsAQBEXhsw5SruDQPMgB0jWvLmH4GalbQJrHR2882x6Hn
	wyfBBvmJFrRJxkZKRVCPQHELoJ30lMKZ49DThsQhDFy3wujIbcpg01XNL5Mo/lFG3QV6jAgrRm1X1
	snxTK1bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxERY-00A87D-10;
	Thu, 11 May 2023 22:07:24 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxERT-00A85N-0O
	for linux-mediatek@lists.infradead.org;
	Thu, 11 May 2023 22:07:20 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1aad55244b7so70839715ad.2
        for <linux-mediatek@lists.infradead.org>; Thu, 11 May 2023 15:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683842837; x=1686434837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hpVJsmC3hyyCOV39d1XA4fZrHLIG7rwi+xqTsa1S20U=;
        b=apOp6wOIiyc0bM0pbLWmLbNrAH8nPimt13/Fe40g/kkmqv/jTh+cIfvOVS/TOb6lzI
         5tkY/eBXIzTBk4pnxTf0HCjbbXF0A3BUsNBN8s57G4ArflMx2Tgqmn4NmHKNBtXvfrtM
         Z2MuMp7hMMkWDAATMFaTy931zIfY4ioVVbcuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683842837; x=1686434837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hpVJsmC3hyyCOV39d1XA4fZrHLIG7rwi+xqTsa1S20U=;
        b=f0ef324JMPkOafTpykJYV36SQXOpbHDMyZtTpSnTJam12uqP0MIWgMc9gjDqt3QsPo
         beDJ4V7qtebtAsW4zIge5KUrMKKuvzebhUtrOZeBRr58ynvb0Ov8X7n1FQGmY1ELs8YF
         Bu4nemTKwHDB96qslXvC2eChnH7CWyiCEMw/HV3Al5R/Oaq91AcwBaKcNH/jOPk+6xJh
         luINMleqtd+s6MhFFx4jfRM9/XXTd7svNXV7iQbYRJ7lLw5zY5enbsHKTTythdZYvdCZ
         yq4a6S8gKyNhbK04jrE3zxBls7cmX3eTCBqvxWqhu+c+MNBSADcCUNLBgo1n07Kf9CGI
         +cPQ==
X-Gm-Message-State: AC+VfDwnvjeZUkJUbGpdbOt0NytxoWEiUG53w4u52cA8Ni934joGmsaN
	kRZCRuiyxNGn7B1hjkUW5h/l3w==
X-Google-Smtp-Source: ACHHUZ7htthqYNJPkIn8G76ac+QLPwd63qP/ae8YFkTLrs+TGcxXUGw4ufIpDY5W75ZqdaFBfXVS3g==
X-Received: by 2002:a17:903:191:b0:1ac:aaf6:ee48 with SMTP id z17-20020a170903019100b001acaaf6ee48mr11781934plg.67.1683842837318;
        Thu, 11 May 2023 15:07:17 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:b96a:d776:ee3:e572])
        by smtp.gmail.com with ESMTPSA id h24-20020a17090a9c1800b00247735d1463sm17589457pjp.39.2023.05.11.15.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 15:07:16 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org,
	Eddie Huang <eddie.huang@mediatek.com>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	Ben Ho <Ben.Ho@mediatek.com>,
	Weiyi Lu <weiyi.lu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	jwerner@chromium.org,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
	yidilin@chromium.org,
	Seiya Wang <seiya.wang@mediatek.com>,
	Douglas Anderson <dianders@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] irqchip/gic-v3: Disable pseudo NMIs on Mediatek Chromebooks w/ bad FW
Date: Thu, 11 May 2023 15:05:34 -0700
Message-ID: <20230511150539.6.Ia0b6ebbaa351e3cd67e201355b9ae67783c7d718@changeid>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_150719_236079_89ABAF89 
X-CRM114-Status: UNSURE (   9.92  )
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

As talked about in the bindings patch included in this series
("dt-bindings: interrupt-controller: arm,gic-v3: Add quirk for
Mediatek SoCs w/ broken FW"), many Mediatek-based Chromebooks shipped
with firmware that doesn't properly save/restore some GICR
registers. This causes the system to crash if "pseudo NMIs" are turned
on.

This series makes sure that we never allow turning on "pseudo NMIs" if
we are running with the problematic firmware.

The patches in this series can land in any order and can go through
entirely different trees. None of the patches are harmful on their
own, but to get things fixed we need all of them.


Douglas Anderson (6):
  dt-bindings: interrupt-controller: arm,gic-v3: Add quirk for Mediatek
    SoCs w/ broken FW
  irqchip/gic-v3: Disable pseudo NMIs on Mediatek devices w/ firmware
    issues
  arm64: dts: mediatek: mt8183: Add mediatek,gicr-save-quirk
  arm64: dts: mediatek: mt8186: Add mediatek,gicr-save-quirk
  arm64: dts: mediatek: mt8192: Add mediatek,gicr-save-quirk
  arm64: dts: mediatek: mt8195: Add mediatek,gicr-save-quirk

 .../interrupt-controller/arm,gic-v3.yaml      |  6 ++++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  1 +
 arch/arm64/boot/dts/mediatek/mt8186.dtsi      |  1 +
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      |  1 +
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  1 +
 drivers/irqchip/irq-gic-common.c              |  8 ++++++--
 drivers/irqchip/irq-gic-common.h              |  1 +
 drivers/irqchip/irq-gic-v3.c                  | 20 +++++++++++++++++++
 8 files changed, 37 insertions(+), 2 deletions(-)

-- 
2.40.1.606.ga4b1b128d6-goog


