Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 628B5F47CB5
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2026 18:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0eRVptHtpjhyZI71FfT0Vrndbtw4GySKW+NrEZWIDWQ=; b=lEUE4guEpsAzbwf3R2bMYdZbRC
	KNO4PohikIbycqoaAB1fQO9NZAH6HdanRSO5i8Wx2Lb/v5aU1TOLfFIxaPFglYBXVDE4WzPDNJrEu
	QT6Xc/KXHwEK7aQCIPlj+cRA6OvhXqA4PBdpjH+nk8tLUU/CdV3ssnwsGDOxdwvLYsHqdg75j1SHq
	PDhrp4sOpClrfFtk4fue7hZJOObDuRRs5nA7i/hMx/X/Ff80SWG0S4o6ZLsvFktSonW51ZA/JelIY
	rKOyUc5/cRV1Xnqb+nXegPBI46KUAiLMIJ2XYUlT00NIOVptWfHj1Bplq7Fd/GCqbu5fb0iwM230e
	zEUjfEKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyDnY-00000002PiB-2Xij;
	Thu, 05 Mar 2026 18:51:48 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyDnW-00000002Ph4-10E4
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Mar 2026 18:51:47 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-358d80f60ccso4042161a91.3
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Mar 2026 10:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772736705; x=1773341505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0eRVptHtpjhyZI71FfT0Vrndbtw4GySKW+NrEZWIDWQ=;
        b=JjgjET3ROC5/t43JtRmH3NMiF4DvwYh0hFeGx724PbDXWGMQfwZMq5ZUWT7FfVkXWx
         A2wYdiBTM41I+gvrmhyDmctV/jGCAa8Eo5LWRVM+6QDfO7X4nc79LmfEQOeKvKn+pbUN
         gPtL3FQjPAqWtawyXIZvVi+adJ7cms1WipsQfUJynWJPuNZyWvYcpNYP42ORkqjhoKG+
         0N6QbZU8Wly6NFP2RkFP5BF/wh32mekNJRSgCxkCZPLA8+Y6GSANI1u/qEIgvxKRJXBx
         u+t+SQq/E0ruuSEpp7t+V2mQHZakiBH0OQATy4oKfYWghR8W6aSI0Ivlxh1GAsk2BP2/
         aQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772736705; x=1773341505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0eRVptHtpjhyZI71FfT0Vrndbtw4GySKW+NrEZWIDWQ=;
        b=AM59KRI8y0OB23gnL/JXANEfim46197CWMY74WNymYXJ/HJ1xTUiEeNN+O9d1/x9f+
         pn0EaK3kaLWb33QWcNqFoCJDSbfUp7iWFaqTrBZTXfMEBR6NDq918grfFDDa2u9f6P1m
         3EfeFzqLYUHGgWULWgJkZyOf98y7WIz5SIfELmnnoMo9Z2FbqcDVRFCo7sl3hLTsmC/r
         xJT8bexmOgFYiEFkRpUy4O0cVRbK7juJF+JpWYjhL0+8ZxhyJzipBmhjfuG5dclMtnq4
         Gkt31/NOFTtLslbUnGZUXsfGpDqEUSosR/I5Q3jy/hf/cjbzDYrlMfRaBBim+OwulF9g
         TCIQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4na9agXy9kJtYs8zEfpS+EraJA/Uw38bq2yiND4TCUcX/LfI2bLgE853lBIbHiSfkbJGF9frBK8AYKYLlIg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDx8qlgsuay3QWFoacoL/U4+TnwRoH4wmJINEaC9rTrHns/Px6
	9nkI7jaCsdVm6gG8U/jrkWtOnxM16sFPDRrTC7yrcvTwpjeCZt1wlfQM0VC2W7TT
X-Gm-Gg: ATEYQzw1A7MqLslm+VjzfQhFlDIs4UJr/KtI2OJwdzS8hsJ+FUYPyPMzhPqo0Ezi2WE
	XCKzAG8A9eWygceRZ980EEUiOBavkeV/jOeYmF22cPnOIIHdY9AtkCQJzuq5LfZofHOKp2OJFtk
	fDLHTx2QK7tV8CKCc0W2HWpiy85llaTTF8CHJb53DT4PXXyVjUPx/hDQO2cxlgVuikJexvDLogB
	Di18oVF9z5Dec9GeUg38tv5fJIpQnUdwpY+rxH1pgi9NG+hnfqEBoHtegyoWSeqn7SAJ1TTw1cn
	DthwoTx9TgaUNDpiDuyJWAU7tx6AcZDoqi3H//FyB3MKZ+3U4SC1J7MbANCKGk1MOjhi3dPd2kh
	3+jKtAP/DXLAUW4tfDtgq38sm7xqWmjSD2FEwS4fznyLJnI+QleAPpOTkYwIUL/fX1tfFj27COp
	bN1K/jRz7/zph53G9pF0b4tWekKMF/76AzkElNJTigHymw+KnnYNwZGbUFXHupU1NFpyFmX5zlY
	qJmJ08=
X-Received: by 2002:a17:90b:2683:b0:356:7b41:d348 with SMTP id 98e67ed59e1d1-359bb3dd804mr401448a91.20.1772736704777;
        Thu, 05 Mar 2026 10:51:44 -0800 (PST)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2e14821sm2769158a91.17.2026.03.05.10.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 10:51:44 -0800 (PST)
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
Subject: [PATCH v2 0/2] Add initial support for Lenovo YOGA Tablet 10 (Wi-Fi)
Date: Fri,  6 Mar 2026 03:51:14 +0900
Message-ID: <20260305185116.781184-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_105146_285801_D50DEEC0 
X-CRM114-Status: GOOD (  10.40  )
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

This series of patches adds basic support to
Lenovo YOGA Tablet 10 (Wi-Fi).

Changes in v2:
- removed lenovo,b6000-f, lenovo,b6000-h, lenovo,b8000-h, lenovo,blade
  compatible strings
- remove "0x" prefix from memory Device Tree node
- remove "compatible" property from mt6589-lenovo-blade.dtsi
- dt-bindings commit message explains this product family in detail

Note:
$ make CHECK_DTBS=y mediatek/mt6589-lenovo-b8000-f.dtb
says that

  DTC [C] arch/arm/boot/dts/mediatek/mt6589-lenovo-b8000-f.dtb
/home/akku/tmp/linux/arch/arm/boot/dts/mediatek/mt6589-lenovo-b8000-f.dtb: clocks (simple-bus): dummy32k: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
/home/akku/tmp/linux/arch/arm/boot/dts/mediatek/mt6589-lenovo-b8000-f.dtb: clocks (simple-bus): dummy13m: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
/home/akku/tmp/linux/arch/arm/boot/dts/mediatek/mt6589-lenovo-b8000-f.dtb: clocks (simple-bus): dummy26m: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
/home/akku/tmp/linux/arch/arm/boot/dts/mediatek/mt6589-lenovo-b8000-f.dtb: clocks (simple-bus): $nodename:0: 'clocks' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml

These warnings originate from existing mt6589.dtsi definitions and are
not introduced by this patch series.

Akari Tsuyukusa (2):
  dt-bindings: arm: mediatek: Add Lenovo YOGA Tablet 10 (Wi-Fi)
  arm: dts: mediatek: mt6589: add basic support for Lenovo B8000-F

 .../devicetree/bindings/arm/mediatek.yaml     |  1 +
 arch/arm/boot/dts/mediatek/Makefile           |  1 +
 .../dts/mediatek/mt6589-lenovo-b8000-f.dts    | 15 ++++++++
 .../dts/mediatek/mt6589-lenovo-blade.dtsi     | 37 +++++++++++++++++++
 4 files changed, 54 insertions(+)
 create mode 100644 arch/arm/boot/dts/mediatek/mt6589-lenovo-b8000-f.dts
 create mode 100644 arch/arm/boot/dts/mediatek/mt6589-lenovo-blade.dtsi

-- 
2.52.0


