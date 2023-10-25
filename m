Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D30AC0032E
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 17:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0665A9x6QlRYnS9Etes7tT5/Mif1F5zTWwPvutSrAPg=; b=U3zSPnfNNtD6Yj
	LkMLyyyh8dIRd5M5jEK3wTxkHSuk8DE85/Iz/71DZHWJbRrHFmPofOkdMy3zl45SsmVX+BdXezCOP
	Tdl10PwITi0hK22A+bb69kbokjqzHeH+O0elrQiYd6jdoSbywE/lKgyNEuhQWdA8dZ/up71mz8NFs
	oyk5sDNOPyXZ6FnDxflujNFdBwYYd4Gu68Jr4luwt1WJzkUyKext3jv36A147sb7fhR6FuVoKODRI
	MYiSE+7kf7IuuwSexzq7uNurQ5fYJ7MBQRC6dmvCtAcvb2Q5npz32xPLkl4pRlDvt039Js1SeAZTi
	6STc5gvtzBf6rEECf9wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvhNO-00CkwD-2M;
	Wed, 25 Oct 2023 17:09:02 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvhNB-00Ckp7-1o;
	Wed, 25 Oct 2023 17:08:52 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout3.routing.net (Postfix) with ESMTP id E17B4625F9;
	Wed, 25 Oct 2023 17:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1698253723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0665A9x6QlRYnS9Etes7tT5/Mif1F5zTWwPvutSrAPg=;
	b=rvm/NFkLEWSsqXzjols28RiFyiBk3ob7Vu3l+nD0eM5i8ATrLKUYssp+YNqtdh1TCha588
	rMyUaLd8CMGOuKBZHHew6GTy+oisu+5lNgCXvIeXh1qpdZtkDrR0bR1WzCo0txtZX521nA
	tl1P6mEWEdf4N2WqWfL+vbpxwZR3W90=
Received: from frank-G5.. (fttx-pool-217.61.159.50.bambit.de [217.61.159.50])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 1092A3607E4;
	Wed, 25 Oct 2023 17:08:42 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/5] mt7986 DTS Patches
Date: Wed, 25 Oct 2023 19:08:27 +0200
Message-Id: <20231025170832.78727-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 17890061-734c-4475-9c1d-3c0bf0eeb55e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_100849_746694_3289F2B6 
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
Cc: Conor Dooley <conor+dt@kernel.org>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Eric Woudstra <ericwouds@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Hi,

i collected the open dts patches for mt7986 to make it easier for mtk
maintainer to pick them up.

so the following patches/series are superseeded:

- Fix emmc hs400 mode on mt7986
  https://patchwork.kernel.org/project/linux-mediatek/list/?series=761293
- mt7986 DTS fixes (for thermal and sfp)
  https://patchwork.kernel.org/project/linux-mediatek/list/?series=777712
- arm64: dts: mediatek: add dtbs with applied overlays for bpi-r3
  https://patchwork.kernel.org/project/linux-mediatek/patch/20230916083214.7059-1-linux@fw-web.de/
- arm64: dts: mt7986: add overlay for SATA power socket on BPI-R3
  https://patchwork.kernel.org/project/linux-mediatek/patch/20230901072730.13571-1-linux@fw-web.de/

updated the dtbs overlay patch to make it better readable based on 
arm64/boot/dts/ti/Makefile and squashed 2 patches from the thermal-zone
series.

sidenote for angelo: after this series only the thermal driver patch is
open from the list i've sent to you if this goes through your tree.

regards Frank

Eric Woudstra (1):
  arm64: dts: mt7986: fix emmc hs400 mode without uboot initialization

Frank Wunderlich (4):
  arm64: dts: mt7986: define 3W max power to both SFP on BPI-R3
  arm64: dts: mt7986: change cooling trips
  arm64: dts: mt7986: add dtbs with applied overlays for bpi-r3
  arm64: dts: mt7986: add overlay for SATA power socket on BPI-R3

 arch/arm64/boot/dts/mediatek/Makefile         | 27 +++++++++++++
 .../mt7986a-bananapi-bpi-r3-sata.dtso         | 39 +++++++++++++++++++
 .../dts/mediatek/mt7986a-bananapi-bpi-r3.dts  | 12 +++---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     | 24 ++++++++++--
 4 files changed, 93 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sata.dtso

-- 
2.34.1


