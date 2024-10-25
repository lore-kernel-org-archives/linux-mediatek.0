Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E861CD11718
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Oct 2024 08:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9978JY14w59ULMKg5mN8BKD9mGH4Z1Heuort4L6nsHM=; b=nrNt7GcmwWwY1Z3defqX9hgmgo
	YSdnIFBJ5qmSGh8n79nMrk+p+3nBjK8hPMiFdofr2KIGVI1FctKGoL1YeqPZgoq2eLOcRx+eIMC8E
	mn1iHPv3ZfdnYX5vZMWwftXyt1huS+lT341Dy3xKfWguFijKKHK9t3+KbfZie1xCwXaPx8Y2sXixB
	F/Ph1Xna9fhd7sRcjGco72KCU73LoUbhdI7SbU1j+7VnJd0ACXsJYr+3zEWt6r9kN+u7uKGtVSGJZ
	dMHP137jUkIOW4CUhVgyPtoKTrEjZf+uPVbittAL1L1QkUxoTXc7Ei8sLhCklIowym2n1POuRNMkV
	JnC7kNJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FNK-00000002vl8-2Ckk;
	Fri, 25 Oct 2024 08:08:50 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FIe-00000002u8O-1y8L
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Oct 2024 08:04:03 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-7ed67cfc1fcso1108149a12.1
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Oct 2024 01:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729843439; x=1730448239; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9978JY14w59ULMKg5mN8BKD9mGH4Z1Heuort4L6nsHM=;
        b=ZeNMGb2myzf0VAqprM80MB+4ZwF+pAYhqWcYhuLiw3M3VZlF9ixgiN2B6nDlvIYlXa
         v124oJ7yyATu89E7r+RctzJfZNo9jGWQ43a7b0l3YtkQh7OBoaQ/JD+NmisbfJlnKjUr
         AU9WKpRnFO73qOVSOALRZkQeyGD7iy1fdL2YY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729843439; x=1730448239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9978JY14w59ULMKg5mN8BKD9mGH4Z1Heuort4L6nsHM=;
        b=mOlUX8YMtHnfG6gOABrCafIqm13ihBw3SM/ff5xLvuww+Wiburv/NhHFTQVvN6UVNE
         zZ27W5uVnQe4yueRyyxHZtArdO0IHodhEPimWHBWi+eX3SKgNep239Ykg4FlMr9+RUWF
         +g3NbH/GznGVtjPeeNBK6X1CkzDiwVXgghAb7w30atkTozJGHWL08wm3JY7svhiWOIN7
         ewgAoM6l34hZMVv5IIw8PwFvb0NuCv46kyGu22LaZASAajdHvI6CDrUgV6n6Zxi5oU4u
         hyA9Pt8svdjGEkaXpbst2Qq67xfAbHERCoFblYggB/Y6tBy2MO0jKKLHwf2DDWa/Ud1k
         Xz1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVUOhc3pXcseLuYS7m6nTQPRKmY42iBvo2vyza1t54mwXXHzsoW8Qtdyl92lSe9Clja09l8OvVYy0dSnY6RGg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDoywwzKEaymFXxuPfHlZxqSJ4gIP4WRH27dlelE4YepfJY1CZ
	nfSJeZQS5gva/+LNeaZDhX+p6g3iZasC2RPFUBvNZnjpShsikrRwcX1WhvXy5A==
X-Google-Smtp-Source: AGHT+IHGaBCdJPNmo+1SghxDLBaoYb7vIPUnB9rgksuYDIRKf/Aa/Z1cETZCG6RSrD08cs2t09cZpA==
X-Received: by 2002:a05:6a20:9f45:b0:1d9:4837:ad7c with SMTP id adf61e73a8af0-1d978b1ddcemr10997249637.12.1729843439606;
        Fri, 25 Oct 2024 01:03:59 -0700 (PDT)
Received: from yuanhsinte-p620-1.tpe.corp.google.com ([2401:fa00:1:10:5a9f:16cc:8d5a:55e5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a0d025sm558120b3a.101.2024.10.25.01.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 01:03:59 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Fri, 25 Oct 2024 16:03:49 +0800
Subject: [PATCH v2 2/4] arm64: dts: mt8183: burnet: add i2c2's
 i2c-scl-internal-delay-ns
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-i2c-delay-v2-2-9be1bcaf35e0@chromium.org>
References: <20241025-i2c-delay-v2-0-9be1bcaf35e0@chromium.org>
In-Reply-To: <20241025-i2c-delay-v2-0-9be1bcaf35e0@chromium.org>
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
X-Mailer: b4 0.15-dev-2a633
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_010400_578346_BCD83793 
X-CRM114-Status: UNSURE (   8.94  )
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

From: Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>

Add i2c2's i2c-scl-internal-delay-ns.

Fixes: dd6e3b06214f ("arm64: dts: mt8183: Add kukui-jacuzzi-burnet board")
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts
index 19c1e2bee494c98c0db87308494713a26e304cd2..20b71f2e7159ade7e7d2135aabe6587c8f8d64de 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts
@@ -30,3 +30,6 @@ touchscreen@2c {
 	};
 };
 
+&i2c2 {
+	i2c-scl-internal-delay-ns = <4100>;
+};

-- 
2.47.0.163.g1226f6d8fa-goog


