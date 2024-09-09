Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C69CD4F4C
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 02:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3jsBoK6osKU+9RLD62g9RUso5s5R8d15TnY03wmQ6c=; b=HuoCZa9dKHJQzCqOIZsKYtm5hQ
	XTbiQZxE9SpiPS+dbirNCcUdcmkqS3yHeTPoAUX45T90MsQLE7MhFpKOoP+QiA4YLeFvNZuENZFP9
	u60gEs4q98krW1v6YVloLC1hUhXJ6d7FP8+emRJhbZ9+vp6TEIEoZ4bv4jI5c4dngqtyVePDV0s2Z
	S3niKgMhW1d1XOlZq9P+ztCqsEA7jFEoAVnjF2ZNbNhrRgNXH6Buv4D6ljmKwce8iMe5X4Y1vyMNZ
	jIWK7eN4+ML9EEpXsQ8lGagExB17HX0eE7++lIN4o8lAInm9ViVgzFDvazWx2n5ikvPVdeqa/TQ70
	SbeDC4Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snUCF-00000000HdP-0OoQ;
	Mon, 09 Sep 2024 02:32:07 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snUCA-00000000Hck-3Be1
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 02:32:04 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2d889207d1aso2697103a91.3
        for <linux-mediatek@lists.infradead.org>; Sun, 08 Sep 2024 19:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1725849121; x=1726453921; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h3jsBoK6osKU+9RLD62g9RUso5s5R8d15TnY03wmQ6c=;
        b=zC6cbeP85MrkIsRWU8oL5DS6Xph1q770DVQ9/CKe+qNuJz2lIVbgixcGbgWsvIu7WV
         ZEyxIv65F3aPQj4OjrqVSkNeh2fP0DKi9fnf7jjUXqNGrQbfJsURm5JpShdIXahoIDeE
         sa6H66fPlTlrlF3ee2xjbmoQLUEENwc22hV5Yy1nH7mg3+in27Qt3+cmiA6GjD8jQmb5
         lCFppa3OPJR88A5CwiyxeyPiQHd4o0/jU9SXUUsye68ls6koVvURGLwihTomtawqbHrY
         OWTckD5kTAdWwCRn403Xpapx7i0pDxeOBpBdkOl8vR1iqhfcriFYKebgweKhfXdnHRw5
         tGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725849121; x=1726453921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h3jsBoK6osKU+9RLD62g9RUso5s5R8d15TnY03wmQ6c=;
        b=OOcE+bIw2SwCHVNJLTOL1vzyCyf69SzvOcbkXEcD1Da8YirjeaXvtE0XtgFqto6qV5
         GlszkW1Mb/ZZ5h+bV4E7eB+Dd94XuIvRsRntpp9A1tLc2khB7H7URaRy6m0bkqIzcANP
         ViuRxpgE2+vd+6Xvxg4v9ID2ygKpxRMvl+BYGY+gn7HHJLyNpnZ5Xk635ST5+J4RuQnr
         TQ9yiZAG3MZSq7mYokBaTND97f7zHUmZERwfhjg7HAQmnObl3fMQMT9BbbfxRmy8IO5r
         lDSIy9jF1jP2cNN3KuL+FUNIGv5Ndp5J217li8qWilGm613FhDg2NCD9NEIKIp1x6OYR
         Kt1w==
X-Forwarded-Encrypted: i=1; AJvYcCXYYbhir/MJn2inCiuyY8jBoxjThQ5h6n0WLQ7X/T6hgDnTwtHMolrUov1TV44r4apXGhh3X7c6LPTMB+OUgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzqgXBun7YrXjwvweo6ZzrI7ZYJWp0XXwURoramojoFL08yfxTY
	iToZCa2gUCSWQMbjjsdVdFoYE6axOEHJLBufhxOZDiln7GlA8qPXXMxvs2M5kMw=
X-Google-Smtp-Source: AGHT+IFdVpSBGSpWYYHDlsrmgHjef/BjQGNN3o4DAAfwJWFtVeibofNSvovQsC/WeLsU5p/ooe4SLw==
X-Received: by 2002:a17:90a:be15:b0:2cc:ff56:5be1 with SMTP id 98e67ed59e1d1-2dad50831d1mr8627025a91.7.1725849121016;
        Sun, 08 Sep 2024 19:32:01 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db049873b0sm3323645a91.47.2024.09.08.19.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 19:32:00 -0700 (PDT)
From: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
To: hsinyi@chromium.org
Cc: angelogioacchino.delregno@collabora.com,
	cengjianeng@huaqin.corp-partner.google.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	hsinyi@google.com,
	knoxchiou@google.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	robh@kernel.org
Subject: [PATCH v5 0/2] arm64: dts: mediatek: Add MT8186 Ponyta
Date: Mon,  9 Sep 2024 10:31:46 +0800
Message-Id: <20240909023148.1677936-1-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAJMQK-imYrDTuycVzQxkfbkZuHehE8uwc+qS2w=UDShETsBvEw@mail.gmail.com>
References: <CAJMQK-imYrDTuycVzQxkfbkZuHehE8uwc+qS2w=UDShETsBvEw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240908_193202_966567_F5E43C0D 
X-CRM114-Status: UNSURE (   8.71  )
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

This is v5 of the MT8186 Chromebook device tree series.
---
Changes in v5:
- PATCH 1/2: Remove sku2147483647.
- PATCH 2/2: Remove sku2147483647.
- Link to v4:https://lore.kernel.org/all/20240906085739.1322676-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v4:
- PATCH 1/2: Add more info for Ponyta custom label in commit.
- Link to v3:https://lore.kernel.org/all/20240904081501.2060933-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v3:
- PATCH 0/2: Add the modify records.
- PATCH 1/2: Modify lable to label.
- Link to v2:https://lore.kernel.org/all/20240903061603.3007289-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v2:
- PATCH 2/2: Modify the dtb name without rev2.
- Link to v1:https://lore.kernel.org/all/20240902125502.1844374-1-cengjianeng@huaqin.corp-partner.google.com/

Jianeng Ceng (2):
  dt-bindings: arm: mediatek: Add MT8186 Ponyta Chromebook
  arm64: dts: mediatek: Add MT8186 Ponyta Chromebooks

 .../devicetree/bindings/arm/mediatek.yaml     | 10 +++++
 arch/arm64/boot/dts/mediatek/Makefile         |  2 +
 .../mediatek/mt8186-corsola-ponyta-sku0.dts   | 23 ++++++++++
 .../mediatek/mt8186-corsola-ponyta-sku1.dts   | 27 ++++++++++++
 .../dts/mediatek/mt8186-corsola-ponyta.dtsi   | 44 +++++++++++++++++++
 5 files changed, 106 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi

-- 
2.34.1


