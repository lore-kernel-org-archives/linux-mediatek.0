Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AD3D2125F
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 08:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qmmjYCeB18CbyqQJcVn0ADXJ6qrNFmHuW7KL3HqRqgo=; b=cc0WgRw+P98uSm49cfTAljzuE/
	1wikjJSLZRTmDyxr1duQfSkbZNWknMxDjz0K5PcF0KTMozs716DY4WhyRDiL7ehYFfvAnV6Ezir4n
	2n+UxGH4Cwii8rKqjzH/QztxouiJdSizJGhjZdUHIzg3UOloUKe7ggNbxEijG+44pmxHbSfC/lqig
	n7iCntScH6lvdlkz0FAmYGW1PvgG2LQKt8/D9Rq4LxsaVKd8L/PhxS9BqrJaoH8/sFb7XRFvP88A3
	vWh2TGb5w8mUIOilgW/tI+SL2YREguDNJov2vziKjFCLp8zCirEU7xhFY/+cLZHC2LhcLazmtxouw
	lhZqCaZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1MGA-0000000EF0q-2pZr;
	Thu, 17 Oct 2024 08:53:30 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1MEd-0000000EEmJ-38s3;
	Thu, 17 Oct 2024 08:51:59 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a9a0474e70eso89237166b.0;
        Thu, 17 Oct 2024 01:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729155114; x=1729759914; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qmmjYCeB18CbyqQJcVn0ADXJ6qrNFmHuW7KL3HqRqgo=;
        b=Xdll1S60GWKmGUTZqdh6dtMrUBSuNTyI/LUEfgPyw7Lc/lGj+RTd2NbJtA9ZZwbUn4
         xKvA4lA3HfP5UC6pzoxmDEMJhZjDLYuMn5wLiuxEHI3Dren16LVdNTYielZOWsCTpEFq
         cBJROlCA2YnlCLovgNzTcScib1UlqzQvVUC7GSGqBgntwW/LJBqVvluUAOdSvF6OTUri
         42G36FwQq/k1I3AMSlNeXRmv+arGqxui18vRQglX5mMrpnfE6OAfCBLO/RpBoqF1vG2I
         4F7Brqhkisoep+3KmfIqhbAYzfEK8ZhVi6n4tOiKflu2V3mFsT0hWm++WeCvug/vCzAA
         uNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729155114; x=1729759914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qmmjYCeB18CbyqQJcVn0ADXJ6qrNFmHuW7KL3HqRqgo=;
        b=k2bFQ9zbY3+vkvAt4PKSwi/cjjvMV6DDU1BclGjQ5r9G7Grhp3F0J1vILVUsVkh4wJ
         2nZle6rNoGETHL3t/CEo1ArlqV3a06RO9uFS61izk0alcF9L2a9JXM4LOaL41FT53I0m
         BVmlqzMZJiIKDD2h/9uV4dmnNf5ZqXVZt1RP1C12GUkRZX4EHLZCFVNayIy+q82gs+dC
         cek65+ECxUY1b8TTtxjuZM7ggVrIPoc57gOVVUzO6717hD6B7D9KGV8kFfQWlGMPf9j2
         VzMjs5NL+4F5NEiCLLM6oGNkAEGdZtXrH1urfpvae5c4KvnfJWttR3C31jTEPY6ORp0o
         4TEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXD9pqhyz2uKfyiNGS28OvOqYG/lTw7dHHAmtaxuFYiQLealNlT8EYlG03FyPlioIJ70K98fKhuAR1ZVAzxHQEz@lists.infradead.org, AJvYcCXTSK9M+q3+n/BeqUEay51dtwTCZwtV9hbCkvhoKhFXnVRILHiGnP42LyLeDNQy6mxjL01kDyt6qwXWLDLPzPg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwVqXfVlbDK/o/4QucAZUuSHxd7pDLrM2bXFFvJCS107c2jz19A
	iBr8LS51eYhvrjqOcZfSdVLtqwnte+HzqyIaxRRFfUQcWmyuwof+
X-Google-Smtp-Source: AGHT+IHvrx94gDRBDzTK1SQ1fRhoIwm949VyNvL5+yIRliyURYMzRlOD6rRrQPmQzzu2BY5fCvgDow==
X-Received: by 2002:a17:907:86a3:b0:a9a:522a:ba70 with SMTP id a640c23a62f3a-a9a522ac213mr175985466b.32.1729155113699;
        Thu, 17 Oct 2024 01:51:53 -0700 (PDT)
Received: from zenbook.agu.edu.tr ([95.183.227.32])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a29816c24sm267045266b.110.2024.10.17.01.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 01:51:53 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Fabien Parent <fparent@baylibre.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Alexandre Bailon <abailon@baylibre.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	MandyJH Liu <mandyjh.liu@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 0/2] MediaTek MT6735 SCPSYS support
Date: Thu, 17 Oct 2024 11:51:33 +0300
Message-ID: <20241017085136.68053-1-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_015155_813790_51CC024E 
X-CRM114-Status: GOOD (  12.40  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

These patches are part of a larger effort to support the MT6735 SoC family in
mainline Linux. More patches (unsent or sent and pending review or revision)
can be found here[1].

This series adds support for most SCPSYS power domains on MT6735. See patches
for details.

Changes since v2:
- Rename DT bindings header to mediatek,mt6735-power-controller.h
- Remove comment citing header from DT bindings
Changes since v1:
- Squash DT binding patches
- Dual-licence DT binding as GPL/BSD
- Switch to mtk-pm-domains driver
- Add MFG bus protection bit

[1] https://gitlab.com/mt6735-mainline/linux/-/commits/mt6735-staging

Yassine Oudjana (2):
  dt-bindings: power: Add binding for MediaTek MT6735 power controller
  soc: mediatek: pm-domains: Add support for MT6735

 .../power/mediatek,power-controller.yaml      |  1 +
 .../bindings/soc/mediatek/scpsys.txt          |  1 +
 drivers/pmdomain/mediatek/mt6735-pm-domains.h | 96 +++++++++++++++++++
 drivers/pmdomain/mediatek/mtk-pm-domains.c    |  5 +
 drivers/pmdomain/mediatek/mtk-pm-domains.h    |  2 +
 .../power/mediatek,mt6735-power-controller.h  | 14 +++
 include/linux/soc/mediatek/infracfg.h         |  5 +
 7 files changed, 124 insertions(+)
 create mode 100644 drivers/pmdomain/mediatek/mt6735-pm-domains.h
 create mode 100644 include/dt-bindings/power/mediatek,mt6735-power-controller.h

-- 
2.47.0


