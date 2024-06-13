Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BF6C27C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 11:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RUVmviAFFyRpV6wsk/iZMwYGlufLkdnnaJs4+woFVo8=; b=QbN3oX6rlILg+T
	N420VuwbLiAZWl51Mc5vMVrqNolzKPXJ9Bi/UtHUzfTal+0KJW5Fa2mxGnDOsRRYGw/mMSIMdsgbI
	sbr1yF2HyNiIUpEzltaysOuGVwbrVbSw4pr+lIUFoU5PZzjAzk0wXoCpKBdmEeu3jd7l+gp5opBZ+
	PDWPPvtV88oQlzp4kVgwT7IRBn9GI5Jmjpe//qJjxQqb4gQLXp6QGNUu9zxFgrZ7jFxzG3tCXEceU
	fNgNcM1IiPQWrg9W4I6U2MSrA7BmZ7fiL1KI1l5pIwmavUVXu+5FnZHN+mTI/7vZTrHTUgMnjUH/5
	yHr+Nyvl8tqHFjxFEoqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHj6h-0000000GPMf-16xy;
	Thu, 13 Jun 2024 11:59:07 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHj6c-0000000GPJq-1RsK
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 11:59:04 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2c3051aee3fso745790a91.3
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Jun 2024 04:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718279941; x=1718884741; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RUVmviAFFyRpV6wsk/iZMwYGlufLkdnnaJs4+woFVo8=;
        b=Er0CzBfy+tFcIUFoe3pCElGiR+jEf97j5XibnpvqROBd4ZZgEekjianFOuzIqov4JF
         IleHZDlzqrMkswjgDHKY88EtvlcfybFmtl4vf+4bS0ew5Rr221ZYUhI5p2xJn3LPgl3l
         sj2JN4r5yCIL9HExI4JNEHqN3K7mtwA0tpNfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718279941; x=1718884741;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RUVmviAFFyRpV6wsk/iZMwYGlufLkdnnaJs4+woFVo8=;
        b=ZVyiAiOmghBFFbu+AlMjdQKDiFoVFnuiEXclzvi1/wcRY56wZf2XqCRUdWLgVbIK1c
         m3UsuLU5U75mNc5yUerNzA3/3bDwjBj1xHf0LoDe3rpt0J+viB3OZcOMS3igySMOyO5s
         IhEhvcVRqPZWG/LjCc2h6LaKlDKf/DUFfCUAM6y6lVcmrNB9FZUPjeKpyOq4q/0OL9J/
         ATkD/G5nCi6A0080uksH5+F3KfQ+lHygucjkDghzesR1/OuoaWBcv+3KR+A14R/RlqOs
         y759rlyUr8PtlmzXyIJmA0zm/icMPvTMRTVKCvr6uhsOr63ZPKorAJRBu4ljp+6ntJxe
         PUbw==
X-Forwarded-Encrypted: i=1; AJvYcCWtPEUneatwI3k3pF4O7QLRquxDXmQaV+bWcboM0VWa/zuL3da6GmLtnb69WLL502riv6NjlbzAaavyAvluoiBFGfzJibmaktDgK/6bf0O/dQsN
X-Gm-Message-State: AOJu0Ywppm6mtfp778rTW4Ku6RfHkJsUUnKlevG4msG7FdedufFCSVlG
	VkcvUo3Agm+A7yoFE92MR2AaoaWpqRpWlIRDtOmR5GNW3SqSfqr+RkT2vWPljg==
X-Google-Smtp-Source: AGHT+IEHLpea+Zt5sKXcwFlof4YCHcKNSE0NrMfoPexcEsFoAXB4lMjoBLC+b8lATP0BTCtDNShiCg==
X-Received: by 2002:a17:90a:6b07:b0:2c2:1d0f:3c6e with SMTP id 98e67ed59e1d1-2c4a76d3ac0mr4601923a91.37.1718279941007;
        Thu, 13 Jun 2024 04:59:01 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com (60.252.199.104.bc.googleusercontent.com. [104.199.252.60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c4c466c3desm1453505a91.46.2024.06.13.04.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 04:59:00 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Subject: [PATCH v2 0/2] arm64: dts: Fix the value of `dlg,jack-det-rate`
 mismatch
Date: Thu, 13 Jun 2024 11:58:53 +0000
Message-Id: <20240613-jack-rate-v2-0-ebc5f9f37931@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP3eamYC/23MQQ7CIBCF4as0sxYDiNS68h6mC4LTMpoWM1Sia
 bi72LXL/+XlWyEhEyY4NyswZkoU5xp614APbh5R0K02aKmNtOog7s4/BLsFhTftaXCt9ag6qP8
 n40Dvzbr2tQOlJfJno7P6rf+UrIQSViNKfexQS3PxgeNEr2kfeYS+lPIFs/5GK6UAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_045902_451462_9C9A9B8C 
X-CRM114-Status: UNSURE (   9.08  )
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

According to Documentation/devicetree/bindings/sound/dialog,da7219.yaml,
the value of `dlg,jack-det-rate` property should be like "32_64" instead
of "32ms_64ms".

Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
Changes in v2:
- Split the changes to two seperateed commits
- Link to v1: https://lore.kernel.org/r/20240613-jack-rate-v1-1-62ee0259e204@chromium.org

---
Hsin-Te Yuan (2):
      arm64: dts: mediatek: mt8183-kukui: Fix the value of `dlg,jack-det-rate` mismatch
      arm64: dts: rockchip: rk3399-gru: Fix the value of `dlg,jack-det-rate` mismatch

 arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi                | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: cea2a26553ace13ee36b56dc09ad548b5e6907df
change-id: 20240613-jack-rate-c478fa76ce19

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


