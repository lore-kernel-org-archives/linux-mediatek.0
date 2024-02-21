Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A98C48BF6
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Feb 2024 07:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8M8/d2Svm/+PW4IDvaS8Rs5nXrVhcfBCXs/zLlxxKUw=; b=x5pJKt6B+KMga4zvaySAoMtRKE
	ifZpSAEVWjfxNZKURhc/HRJcM0tJeDijFmseiu5maU3ON/qtHPg/YY2YHOTtV+/TuOB0KAnT4wHZC
	OcL+dJdPj+uNDLX7J2phdgrctkN2dYM0CgeKIJn80d1aPpkrZNBq10kuBTljWm4P4VX1gl9Ig6epE
	6FYgtGOrRAFiW6nnI3oGWnt19xfAD71AEiDFDZdbrKKBozx0w4suJ7mJvL8kFbM2s0+v07IfYMEhV
	HQLevjtNTYMeKDXlA3qGUFVnSLm/RZYvRclfWiOxvtmjsw8pRmUaoVqfxtnGHrX9HsHwSPNqmHtf5
	s3Tb+42Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rch9E-0000000HVcP-3oXJ;
	Wed, 21 Feb 2024 07:36:08 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rch9C-0000000HVaU-06ny;
	Wed, 21 Feb 2024 07:36:07 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2d220ad10b3so55826661fa.1;
        Tue, 20 Feb 2024 23:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708500963; x=1709105763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8M8/d2Svm/+PW4IDvaS8Rs5nXrVhcfBCXs/zLlxxKUw=;
        b=NV2cu+9wUqaBrhevne9daEKHGfiMHcrj0VOU6jDu51zQnzDvAokGdPQKo2MkWtooUc
         eNuCI8R//qDTldy9HKLXpxdjgxXkW78vWDerFVLkhdJ8YuZGhtLLz2ddxzKP7IdLPZg5
         o94Ay2MBGI/eIrOdRMtexyzOYHh5YBfjXmosLSbldePKsx/Il3PDZUsBL17upWyig44i
         Tae9nE+crGjKCwbf8pDoTK93fZYQAidvaC3gj4IAMM2XAneIV/t0r3B8+jQxASau6PaU
         2Eh8UK/PnAXtNCRdtcRtDxJeEqS09+gYZ5x1NWfyMK51iDiIhA6WLUvq0vfIMwUJD9OP
         HamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708500963; x=1709105763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8M8/d2Svm/+PW4IDvaS8Rs5nXrVhcfBCXs/zLlxxKUw=;
        b=ohQh9XKIK4Pc8TRHyLMkuIQWIhnYZyDRHG4RLikC/uJwulWbnLSlfHHxrpaMnDg/AT
         xxwTdl7CMamMYMLa2m5SwOqFl7pgR2t4Nc+/YqHyslyGKHTVhGJfdz6cLUulRYurutIc
         RFeYqrR+VJdd5YN+2nLDZFLEY49RUMyPOPvGuaLVsSkgRMwk3auL8Ricck6qdjYSCb9N
         MXqKTsxSxmPU3TcPE3LWaAOSEDKIwYaQbYGd+2pyQWDVGUefpOMvFveRSUcsLhay9IpQ
         rR5d6pTPQxul68kYReKhaH+flxnZRYkHytPmfkVATA6vocuXxCl3VezBn+A/UCPm4HKI
         /eHg==
X-Forwarded-Encrypted: i=1; AJvYcCV37IjzhfT2WYNUNGjzX6SOz9ugH+onW9+FWCvd8Qqbq/wJ0+ihc0qqlH8/p3fjG6McSVJGCH4ifGfHyPPm925lyGzXksigTPelsgKxXFHtUVJtD0V9VW59ykCs6P92gKFNhuyEpvg91b8BzDnEGLvNMY0gRdd3jCA=
X-Gm-Message-State: AOJu0Yxp6nMH05hhGF1lD5M7FNJqoSDStGdt9Zb8AYceNTi0j2bvyTpr
	5YMxwhH+zUMFKM1AvHiUf+pzBXJyYJ6A/mM38iSVG/b8QVQVSS8u
X-Google-Smtp-Source: AGHT+IFE6VuOfV8rlKed7pgakLr9/jErXT6huX7tGt/A7H+Xjl8Zbc3QW5Xe879Z7XUiPdk5AR8aUw==
X-Received: by 2002:a2e:980e:0:b0:2d2:40c6:b7d2 with SMTP id a14-20020a2e980e000000b002d240c6b7d2mr4278968ljj.26.1708500963176;
        Tue, 20 Feb 2024 23:36:03 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id z3-20020a2e7e03000000b002d0f99a7fc4sm1722330ljc.79.2024.02.20.23.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 23:36:02 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 0/4] dts: mediatek: add Cudy WR3000 V1 wireless router
Date: Wed, 21 Feb 2024 08:35:20 +0100
Message-Id: <20240221073524.20947-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_233606_097664_30CD3413 
X-CRM114-Status: GOOD (  10.49  )
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

From: Rafał Miłecki <rafal@milecki.pl>

Cudy WR3000 V1 is a MediaTek Filogic 820 based 802.11ax wireless router.

https://www.cudy.com/productinfo/1637722.html

Rafał Miłecki (4):
  dt-bindings: vendor-prefixes: add Cudy
  dt-bindings: arm64: dts: mediatek: Add Cudy WR3000 V1 router
  arm64: dts: mediatek: mt7981: add pinctrl
  arm64: dts: mediatek: Add Cudy WR3000 V1

 .../devicetree/bindings/arm/mediatek.yaml     |  1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 arch/arm64/boot/dts/mediatek/Makefile         |  1 +
 .../dts/mediatek/mt7981b-cudy-wr3000-v1.dts   | 74 +++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi     | 37 ++++++++++
 5 files changed, 115 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dts

-- 
2.35.3


