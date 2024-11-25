Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C21BD3B7F0
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Nov 2024 08:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V/7BP+eiBJ3tguIkvumVtoPzEUTFOBtF5H0ionm7gQI=; b=gRyb0dQiq+izc5TQ041MkMqmVN
	+Q3/jXfsjgXYokRvPMUBC3EQsrZAYydO0dFG0dUY8nE23zJuwXhB/GCrNTfh3JGjOQds8D82P8YM6
	TI17UUgls12Efw1B68Eb5kuJInpLGIbVLPfWYPywsqQsaxvlEph4eT5ibMNEEkCacZMQGFcl5e3hH
	8yZh9qrt9cDEXAz0+dv9+ry5wAlYSUQJGTt/m98xXcZdirbQuc71Bj3dZ/+37KcLwSG1v3qAawtEC
	2wGZQQbFrQ/yDTGfcjgSvFlHcVCGKV1mqsB95Gj5wL9Tg2RLSsW3vjH6uqgo0RhnMemB9FKDHUq7z
	236ghurQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFUYY-00000007Okv-1Nuu;
	Mon, 25 Nov 2024 08:34:54 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFULm-00000007Mbf-3cbP
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Nov 2024 08:21:44 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5d01db666ceso3788698a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Nov 2024 00:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732522901; x=1733127701; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V/7BP+eiBJ3tguIkvumVtoPzEUTFOBtF5H0ionm7gQI=;
        b=OawZgF8lLm5FNYs0r+o7i95RnMP+LmjsTI9vZNCeNE+8qxX/ytrLWU5myXR6oGWjI9
         0sfajnQdeVMgDOEba2l6Dq1x9H4kx1w2vagNiUvtMO0wQcM7MqVL4XctAZs9uwf/poSI
         WIXoCtPLNT/Si/aYzaZ8J9z/T/LpKFdYDs14Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732522901; x=1733127701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V/7BP+eiBJ3tguIkvumVtoPzEUTFOBtF5H0ionm7gQI=;
        b=waKVAxZeFDzXD4dLmuV1+pxPpJNW0udkYOVpWVmqF33ZeHK5KJp3VDTcI/93pD+aMF
         XjlZr2dA7GkQRplXhTw5zAmi6KHcelWODVc/Oiadhcfc9XuUpWc4oNdfLVWbZAE2pHdL
         OQkZ6SvTk5MU9qkTvlssyaXQtRLXlhA8UtzyXNM0o58Udio8PsOaNf10dUsStignfft4
         LadfP1RtG5RovC4Xwy9Po01HMwAq3BaERi6wFWWchiUv/0SE4NFItUXvH0IlkVYim+3W
         3zwdZicYX0vDTCGpCODCPkhcehB3noXcyNM41eF3YP/xSfHHEfJqbd4uWR2hOq2C8QhZ
         +QYw==
X-Forwarded-Encrypted: i=1; AJvYcCXqjYAbHVJERHPjm2I9SEc3LSVJ5+/kilWlWTeBV9vjk5uOk64TRWt2KYXlvHXOMUEgAC5kVlT44EF83XBeHA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMXCrPP0gzm0ErrKJ1+IP0pxaqq7RPn+oFKFGlGCk6YUEd85r4
	4qWBmy6r/qFz1KsJatdnGXTKQHPITsi10AU7Vw4WWxmGEBu2fz9cRj/n1ANxaw==
X-Gm-Gg: ASbGncsphDPG99eAQDpba9jErVPpoO2iNcx/UFWw79W2Oht1urezc/ARHpOsxy6KhO+
	WfL9cKpZ9TDQp/MwPqOr9NOS+RsTaYbMrT13u6Tprn9R9noztmbECkLayP+Lm45avlirGZFSEnI
	xSILkq35jKCRIvHZ0HeDdmA2uf0W6sDl4f5FtFbyhBXgUpN1Lg0hsCnRjDRFxRyjp23nkxQkIkZ
	RUM4zurPmSNHzmnggujuv78E3SpiekADxRJoX+LB0fZYo+9JFLwQdGQ/4stp4StS2KjVlittbus
	wgG4dXHz
X-Google-Smtp-Source: AGHT+IGY+FX04mfzxmplompk/IW14NqbgJnlcBAfKd6jUF+oXS9F+fBvE0X/zqk8o3s+U3ZXOSneZg==
X-Received: by 2002:a05:6402:234e:b0:5cf:e894:8de9 with SMTP id 4fb4d7f45d1cf-5d0205c6315mr10497739a12.3.1732522900638;
        Mon, 25 Nov 2024 00:21:40 -0800 (PST)
Received: from localhost (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-aa50b28f719sm430537166b.12.2024.11.25.00.21.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 00:21:40 -0800 (PST)
From: Wojciech Macek <wmacek@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Rafal Milecki <rafal@milecki.pl>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Wojciech Macek <wmacek@chromium.org>
Subject: [PATCH v2 0/2] Add Starmie Chromebook
Date: Mon, 25 Nov 2024 08:21:27 +0000
Message-ID: <20241125082130.2390310-1-wmacek@chromium.org>
X-Mailer: git-send-email 2.47.0.371.ga323438b13-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_002142_919903_06168929 
X-CRM114-Status: UNSURE (   9.72  )
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

Add an entry for the MT8186 based Starmie Chromebooks, also
known as the ASUS Chromebook Enterprise CM30 Detachable (CM3001).
The device is a tablet style chromebook.

Wojciech Macek (2):
  dt-bindings: arm: mediatek: Add MT8186 Starmie Chromebooks
  arm64: dts: mediatek: mt8186: Add Starmie device

 .../devicetree/bindings/arm/mediatek.yaml     |  13 +
 arch/arm64/boot/dts/mediatek/Makefile         |   2 +
 .../mediatek/mt8186-corsola-starmie-sku0.dts  |  29 ++
 .../mediatek/mt8186-corsola-starmie-sku1.dts  |  46 ++
 .../dts/mediatek/mt8186-corsola-starmie.dtsi  | 480 ++++++++++++++++++
 5 files changed, 570 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie.dtsi

-- 
2.47.0.371.ga323438b13-goog


