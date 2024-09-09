Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45985E6FE49
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 07:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DVFOmtfgNYZTMylGXkVJ1SESCtmEefxlCEbYo1wTLz0=; b=jTz/5gv0J749aV
	Qe+oSpjGWlIeOmVpffsim4xAVlpwThyvBFpxbgB0hAUqA1S/pbzyKqdjvfMelqQpi0iFeN0rla5MA
	7hMTum0aWcu7KEW1wDJe27HoYrG0ztZRjBhHerqdOLfRKJvNw2grZ4/mJyhPDoLGJATWPOuSwlcAt
	4WjmNOq+qJe6VB8LC0gSZ+clsPAqT/KeFpuWcGbe9vkdQ6CZhEB/RI2FixHArihYvEiRgxJQghBAC
	NxfbXNzv4HBC19vVo63QJ7GL7w/Fex6NSmw5yynmjaLEGWi9U/Un91H8te7GyyS5BlNvjUDbK5lIc
	H2Ss5yT6VeTkIbScZW+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYpm-00000000pFN-3BFh;
	Mon, 09 Sep 2024 07:29:14 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYpi-00000000pBA-2myx
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 07:29:12 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-6e7b121be30so2567554a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 00:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725866949; x=1726471749; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DVFOmtfgNYZTMylGXkVJ1SESCtmEefxlCEbYo1wTLz0=;
        b=FtalB6UXYeivbxTI7srpFtSko/X2YMLJchwd5HWnB/IwVJHlXXLg1tCmH5ISb9QhYj
         mKxYOzKjCskcoZcePZ48EXbR07Hvf9DhHdPeau86XFlV6WSQVNIT82bdzLknhcAnep4R
         czcZ471m/swEaPO8/QEwlyO8cJ6GOxQFbv5Tw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725866949; x=1726471749;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DVFOmtfgNYZTMylGXkVJ1SESCtmEefxlCEbYo1wTLz0=;
        b=j5kZn2ghd5hd9yMk1oT9gc1jUD5wkPQkQ9QT/L1pOOWx+RZbt53Cx0RwUncC0N85h8
         VY2AWUQldagZAMw/dkFMTW/wdEpL4B/XKZhbJ6Cw5zBCseTHyljGJVtYF0ZXzu7AYzCS
         XVmztczi0h1nn4IFrSH0IOf1jrGTElkOXWFBuoAjb+GQAAKzormeRpljqDWEn0nmcYy+
         ei8ch0KyQCeUbMQkQLTLNiLtpYRGGo97AiImGjnGRu4JomSmI+9lW6vKOaecyidtUiFZ
         nussb1uVltTRaURjeMinQohSN9C7K+mkn5mznihuSz5JOmKD2BVQMBxBnvL49I0KIGVB
         7OGw==
X-Forwarded-Encrypted: i=1; AJvYcCXMt4Zdyf4UUbsdgjrLnDxUT1RSgnMNwp2VgJ+LhDcIVB6DdDR023y24p3A7HCfa4wyakbzaIBGLiAL5WdTGg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxqhmOu6cf3SghhyFH98iuVXVMfjOx4cTZTN3/QUzlr2txdzjNA
	jRDsFt4VEL3hDOUIwlphAMFCGU/gl/5/5jAtEyp+NAExeYCkoOlW0IWI3LW8Dg==
X-Google-Smtp-Source: AGHT+IH5sLd+IkfBZnv7xdaGZ/tdqLmxM4M42CSvGfTJj9yeZEZWbHzCNvQ/4Occt7qYqQn7yQJusQ==
X-Received: by 2002:a17:90a:e651:b0:2d8:f99d:48d2 with SMTP id 98e67ed59e1d1-2dad50fcd09mr8435397a91.29.1725866948695;
        Mon, 09 Sep 2024 00:29:08 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com (30.191.80.34.bc.googleusercontent.com. [34.80.191.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db043c3c51sm3841065a91.21.2024.09.09.00.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:29:08 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Subject: [PATCH 0/4] arm64: dts: mt8183: Add i2c-scl-internal-delay-ns
Date: Mon, 09 Sep 2024 07:29:02 +0000
Message-Id: <20240909-i2c-delay-v1-0-4b406617a5f5@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL6j3mYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDSwNL3UyjZN2U1JzESl2zFKCgpaFFaqpBmhJQfUFRalpmBdis6NjaWgD
 vuKmQWwAAAA==
X-Change-ID: 20240909-i2c-delay-6d202918ee0f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>, 
 Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>
X-Mailer: b4 0.15-dev-7be4f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_002910_771049_EB5EFD72 
X-CRM114-Status: UNSURE (   7.57  )
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

Add i2c-scl-internal-delay-ns for each device.

Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
Daolong Zhu (4):
      arm64: dts: mt8183: fennel: add i2c2's i2c-scl-internal-delay-ns
      arm64: dts: mt8183: burnet: add i2c2's i2c-scl-internal-delay-ns
      arm64: dts: mt8183: cozmo: add i2c2's i2c-scl-internal-delay-ns
      arm64: dts: mt8183: Damu: add i2c2's i2c-scl-internal-delay-ns

 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts  | 3 +++
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts   | 2 ++
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts    | 3 +++
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi | 3 +++
 4 files changed, 11 insertions(+)
---
base-commit: ee9a43b7cfe2d8a3520335fea7d8ce71b8cabd9d
change-id: 20240909-i2c-delay-6d202918ee0f

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


