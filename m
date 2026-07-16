Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8003DC44515
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2026 17:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GrO9yku15Nd4atEWaEXkVKcrXj8oZipRV1TYhFxDaxE=; b=I+wAykxsB6iDlxPDEFrEkvRiCg
	onIbQI2VNqPdJrBWChYO0HtPkaJq6MriUGVAZjAIfNxxaJkZoloDCW+wclYg5H/7kXTbWkBiVKKtk
	79LsQ2Gw0Vn9AZW6i1/d+3mTfOMvLNXz8UYx818d4ib+NOvlyexbj2ovufyfxaVIpqa5ppEAtW898
	eOBuFz3M68nArNLb6asMFk7gb9grrFlfLtLGjmQB7qBoOlJkePVJU2wrWl183KMuJSA6uQ4AnGLCO
	6g8qt6XyzijsjJZ1x3+Y4Pmk6hEnOkrml3tg4hCLYsdWkp+MoS8+sbt79UjEKC7lUGGky8/d4cmXd
	LvHqWXiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPib-00000000Fp9-0pVQ;
	Thu, 16 Jul 2026 17:17:53 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPiZ-00000000Fnr-0SQd
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Jul 2026 17:17:52 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2cee9b74ee1so34694145ad.3
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Jul 2026 10:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784222270; x=1784827070; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GrO9yku15Nd4atEWaEXkVKcrXj8oZipRV1TYhFxDaxE=;
        b=aFeEaCywu75bGxOmllWBLcG0ADeZS2+bFDtaD1K57W6vqPZSQ94zU8GvBLBYDhuyy4
         /5hV1I2eN90/eA8zdCKaKgtx4usaL5YuGZ0YRoharXWFNWfbXVGBadSIQYG2ITw3BARm
         2DlAOcJFcdEwwPZiZCtqGwpbtNiIswb9CASBTNoILellyDzVuAmAFQH8nOfjvefE0aLg
         6SBdwICDEuRFzopFv2sK8Lz1gdMF02Te+0RWEnZ4Q9rFKGXrCxCF8jdmtrsqsp3yW1eJ
         LNS5ghFwwhCG0m9j96SJ99/z57inXWm6XvWiK4zUzrWe/N1KKCD8cjZbvbdax7eRIb0X
         1LSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784222270; x=1784827070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GrO9yku15Nd4atEWaEXkVKcrXj8oZipRV1TYhFxDaxE=;
        b=RcGDS62Yvz2ea9mQitkpv8K+IpFyTv4znPW4f8A9mBL+T0EJM4rCLh7dm2ituq8oOI
         0a8I+ziRBPIzRP1uowbgrFQ4C5AXKmi0vX06sbSVhmnorVCVyNuUfppusNnvsADbm5yQ
         Y8ZA82FRni9krGo192AdXfgtZ7R6M8z2tTvfObx2i3fm5nieFvxKaPH1+vOYbLPIcxV5
         7waloejVAW4UDSfIvdlFBRnyQ2Wrn7OfK1dupoS5EHx28bvDVcZz+TI/nWKZ7rmuIHgK
         Xn/4gkgh+aeX1rMXs+B+u8jEH7NMwrBc2ICSCa8Sx47AblgZHbvsc3MMcI6sIWUtCzyA
         0Mng==
X-Forwarded-Encrypted: i=1; AHgh+Rq+d0VseCBZQfzLR0EUzXwB4CeuHGnSVMsInRoh5Ha3Ztzct+JHMECSqrSN4VLnArhkJJEMhX2GljsVnNMT8w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxhVHASqF4wQjKryPFBHxCLQtcNlDArQxQcyhNd7JECMpTJN8OF
	xUcfPjb/zuS9+FpBI5nmhDxbg1I7r7BW6MGTcWT9ExkQSAfCFqGoFBwT
X-Gm-Gg: AfdE7clF3TSYNJfGGGs6Nv3b3e6dLzQLFqWwZNID6tLyq+j+LS0IqnjLMqGmW95kX3h
	fG6/2CctmvOLW1zgO2SvRa5I6BNaSP848+km95V+EHZa7SXvUFTEMwSmmzuYBGyoU310A4VPn7A
	fWbLxW8/PwcdmgEofMa/W8PXiACtzXfMayTWIu24q90CDLNmeNzASS54Zq2bNZCRQR5fvQvpdAE
	hc58Yctn5P/GdvhkcDr0O/chnHyOsVOI1OC/I6cOuOiTOPErFKQIlzIsQLKp7YjkR1tE7b1xYer
	+JEZjuJ5NquY38nhYuci8sS4g0W2wFO4+FYXGjKIYydHyqISw+05h6t0FLHhexM6ZsEC2S73HVo
	jcH4UkOzhNEtB2YIsbyQmais4cbLbwLyAoIARHPOKucDQaQgj45sqKVD8Z2/IyNjX3bC6P05rPh
	3F6vC2ClxMXTOifFNSAlYQjFSAvgSEsIaV7A==
X-Received: by 2002:a17:903:2ec5:b0:2ca:17e2:2acc with SMTP id d9443c01a7336-2cf03cef19amr85530865ad.21.1784222270259;
        Thu, 16 Jul 2026 10:17:50 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1055de44sm22917255ad.51.2026.07.16.10.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 10:17:49 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-pm@vger.kernel.org (open list:MEDIATEK BOARD LEVEL SHUTDOWN DRIVERS),
	mfd@lists.linux.dev (open list:MULTIFUNCTION DEVICES (MFD)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 0/3] soc: mediatek: pwrap: MT6589 + MT6320 support
Date: Fri, 17 Jul 2026 02:17:30 +0900
Message-ID: <20260716171733.300885-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_101751_147336_CF8C2D82 
X-CRM114-Status: UNSURE (   8.15  )
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

This patch series adds support for MediaTek MT6589 PWRAP and MT6320
PMIC which are used together.
It also adds minimum compatibility string for MT6320.

Tested on Lenovo YOGA Tablet 10 Wi-Fi model.

Akari Tsuyukusa (3):
  dt-bindings: soc: mediatek: pwrap: Add compatible for MT6589 SoC
  dt-bindings: mfd: mediatek: mt6397: add MT6320 compatible string
  soc: mediatek: pwrap: add MT6589 PWARP and MT6320 PMIC support

 .../bindings/mfd/mediatek,mt6397.yaml         |   1 +
 .../bindings/soc/mediatek/mediatek,pwrap.yaml |   5 +-
 drivers/soc/mediatek/mtk-pmic-wrap.c          | 292 ++++++++++++++----
 3 files changed, 239 insertions(+), 59 deletions(-)

-- 
2.54.0


