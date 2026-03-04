Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F13EFCE39
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2026 19:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zOuIkmgeu30O4yBUUR0bUaK0PmNnE0z/sa5+7m6TQAc=; b=cxXwCwL2G9e66J7s5zWPrWw8re
	R3yG4POWBuGfHEXzH27PGnCpMK7TVceQhy3hPgTinkElCpom1Y9SGWYKibUXHm/lrpzBsB4ZF130L
	giW2mHUP90bFUXazlVVkecp1LVdS6V5LRqYdm9pPaVfRb00omQ18Y4AtXlP4fwM1cSAwooH3uA7Lb
	n3w9dNT4uXVr8heEOefeTzUuAe3v2QAsq5K8zdbV6qQ66r2U/FgACVEK7GKWQvLHuZhEu1uJ8HdRq
	FeSXnm7IukgXTLYuJe5CONG/DT86h9bId1f8IMx7+pqjNZxViopSY8vwYXSo6VWtdaLLwe599IKzT
	bbVDbAiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxrpq-00000000OWR-2Y7c;
	Wed, 04 Mar 2026 19:24:42 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxrpo-00000000OVG-0xQj
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Mar 2026 19:24:41 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-82418b0178cso4117407b3a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Mar 2026 11:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772652279; x=1773257079; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zOuIkmgeu30O4yBUUR0bUaK0PmNnE0z/sa5+7m6TQAc=;
        b=inNSkhGqV9obm5AW/3KT2zSMx2OXyYXe9OJOVvn0kACB779Ec689ZiPy2wQWIPkJiV
         Fil1dCbsrqJjiG4CSth49e/EtU8LPLSQWBTpwl9bWXPvl4bD7HmYOz1NBEyG2JW3XyNA
         aTQPBM8nO9LMTO4dky04BC1kQml8ffrN01fUi0TkvCd/vDYcL5lDnNywBDQoO1l7Ev7G
         VCqO5b3d1EAihmdXESg6wTQkzN+E2ZUZi3Ar8ro+oDtOWSHuGPYiYB+0k+KwDm9Xzszb
         iYx1DGTa+0TUvmtinAGR7AN6I64THs9rzNjmAkhIo8wQXhkTrocd0sZ3dH6Otkg/w311
         BMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772652279; x=1773257079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zOuIkmgeu30O4yBUUR0bUaK0PmNnE0z/sa5+7m6TQAc=;
        b=BvEwMc+vs6rr4GGUEVoaUbp7Mz4ZHRPmwMEjh9JKdZNt44hxtGbIGfuP9XLZ3GWbfm
         3CeTnayHYiCdQEwPAF0HwdLVwSv7vVVUxwVbCiC7H3wtB/Xf9Y3ZxqXKRgUUmXCwWhzh
         3cq2HbniIfECLiC6FUmoNCxnjQ/NzAuKV4SHhoRi5+L+Eyov5gOqy/E/L5IU/XLkdu1d
         6otjuv3b+EbWkJnA7Vw6daJWsTama5BO3SjcpyO5YbXUNBzPjp/QWivZ8TFlotDl32V3
         601jujdbYh70MCP7qmDdUTCw7e2iz7fjQHgVUc3uNCJCsqcqKpPJxV9y4uEBR1NKpKzl
         lHeQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2Dh+5PCbD/4HBTHL3IWErTA4HXNgNDDVGtGHMXeOGTKs+YsvrnjiQMWmTFJghNmS9vMlcw32uheCGVgV5Pw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHC+PvaY6DXf3neYmcwc3Kjc2h+3pElFyfQTgbb/zc/6Z6ioKZ
	Xv05aWdVkJi/yW1YyN27WBkZqhsszJvRYAqthHYNkg3SUATf/ytycdoj
X-Gm-Gg: ATEYQzwvmAX4kCbZPvgi7CjhbCzr6pUdIPNbnjM7dSsGJ3hKejdYXLuCg9Fz5Tqi3YD
	rd2hQsevrBqrmFcXD8URnxKyiJAqZZQXk4jv7n/yrUMjPEx41XOJMF3nKhC5WaqJ12P654hB/aJ
	dtx6BynKMfL8Mxe/L8Ca0Xp5jGbYy/W92xkWPdka0Y4wOdz6Rame3t4io24GToidW9rSEj7yV+6
	/wjyA0i7a8ogKE2O8tp7mOcfJOerONslLTsXRI80mZpotgij0RyKmJBFstfnc+pMDvDgiTTTkva
	Vdw+OCaNX5WOZ7hXQbUISVRLFHuMlwpgjHu0kqvgcupHmFy+XHvb00MdMk2ml1tuNSpAwupuCcs
	FCI+I7DGd6mEji47d+OguK3EAo/ZZSdWGNZgitG85aaxkHgfU/OvudP2EuMrb4H6D+VA2bPC88W
	U1D25IOLb1wJ1DTuAE3EkelqmlDXF6dWs1CIe78IV8HrnDPNGe6WR/puLXNNFc4mZi8zc5WyudG
	SlBVFA=
X-Received: by 2002:a05:6a00:22c6:b0:81e:8e66:38d8 with SMTP id d2e1a72fcca58-829728f0c2cmr2388151b3a.10.1772652279202;
        Wed, 04 Mar 2026 11:24:39 -0800 (PST)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d8805esm20233563b3a.16.2026.03.04.11.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 11:24:38 -0800 (PST)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sean.wang@mediatek.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 0/2] Add initial support for Lenovo YOGA Tablet 8/10
Date: Thu,  5 Mar 2026 04:24:15 +0900
Message-ID: <20260304192417.818211-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_112440_263868_58C702A1 
X-CRM114-Status: UNSURE (   9.13  )
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

This series of patches adds basic support to Lenovo YOGA Tablet 8/10.

Akari Tsuyukusa (2):
  dt-bindings: arm: mediatek: Add Lenovo YOGA Tablet 8/10
  arm: dts: mediatek: mt6589: add basic support for Lenovo B8000-F

 .../devicetree/bindings/arm/mediatek.yaml     |  5 +++
 arch/arm/boot/dts/mediatek/Makefile           |  1 +
 .../dts/mediatek/mt6589-lenovo-b8000-f.dts    | 15 +++++++
 .../dts/mediatek/mt6589-lenovo-blade.dtsi     | 39 +++++++++++++++++++
 4 files changed, 60 insertions(+)
 create mode 100644 arch/arm/boot/dts/mediatek/mt6589-lenovo-b8000-f.dts
 create mode 100644 arch/arm/boot/dts/mediatek/mt6589-lenovo-blade.dtsi

-- 
2.52.0


