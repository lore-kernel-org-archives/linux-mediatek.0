Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B81CCD1A5
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Oct 2025 19:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eceHFX0RmtQDMq4x5hNy8OnbHWKSwCTIDv7MpsAV2Jo=; b=QCvSdYH6sww5ZD+TkjbDLwyORk
	9ShFyhSMcL2/CNPxG3ZaTgMyD2Dzqs2guBeid6XPtrL9fV5LzEhn3V1H0dDUPosEA31pK9wkZthNS
	oTNW2EOm2NNi0+MsS8g0fpa63qduGYrOsxFfGubR4yNRxktynY4sPIgTW6BapkYu+cuD419MLW7In
	BFeX2dOoGmMwY5T6Fv6UZu/IkwvJOQ+0h5m9+O2amZK9bKcFaFK5ErIgaqvIIk2bhcwzROcIggXde
	VmGinDYQYLsRyGbeev+6AwZ4uvmaxc+scUnNoj/fhdABqz37IZ6wlO9UU9qG4pYVJo4wnZqMW5bS7
	31MtjJ1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBI6t-00000000V07-2D1y;
	Tue, 21 Oct 2025 19:33:31 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBI6q-00000000Uxr-07xW
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Oct 2025 19:33:29 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-42706c3b7cfso2062387f8f.2
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Oct 2025 12:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761075206; x=1761680006; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eceHFX0RmtQDMq4x5hNy8OnbHWKSwCTIDv7MpsAV2Jo=;
        b=V7/hR632+S7Dy7mSkBxvr6g7bhqjnxDhV5FJ3aRE5UukZ9jniJtJkeeLTkUDH4fDIl
         GZgKqn840IT7LjXHpMSk+KAJsql6GnGaGBEkbC9uSAdxK2rAOOYSfyS1vk7ae1l9oIqR
         ipCT9SEi9xdFTcSBDZDDMnfvOLm+VL9qRilhceltcjWMGWR/jUsriUrG2sIYHx8Vs9ZY
         BH4vxzAiRQuyRjLHF0nGnjjMK+Vot72t/0Bv2YzRcDx4fVFatoReZXc6uUuuUIRnf9CH
         vojLLXVRa5oV+qqod7nyj9eOQEnpSpqdgL3r/fXTNkOsGhbEQAs9Fs8i73BbP9td8O2J
         bgXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761075206; x=1761680006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eceHFX0RmtQDMq4x5hNy8OnbHWKSwCTIDv7MpsAV2Jo=;
        b=w126RS8NKjdBKnZp+ZkUwnx2mR5YoauWvAMrNY8Nm4qLKRvNOCoEyjqNZmacqnXtTu
         JJCqbAcIoXAO6QXPAxP4OCoK3ryIJQFg+jHIUaR82jG8u13fHumlpI7UGk4UF84ITNZs
         HIP7E1YEHZeC7wCK23TGg06y+zAgvdldEadVUYf/qeDJJ4yHEFe2FUQ91YyHAL1owpfE
         ya0q5A0n/I/V0aNQUfXEM/IFiY2qvK/tA6u2m4+hXGMLMh/dZIRNLPXzn9v1z4m4h3l9
         ApjNksgoXPxg7z8okdkA6VJiu9E/QSUsuoWwg9uIGwmkHOTtZVwgVeURi8fELC2pM/gt
         PIaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgNcdhmzT7CZocwti0/eDATMOSj/03BBiLdd6hksIvifXapO34Ij8L88O1X7h+0/El50TAJ1esFohWi8Kwuw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4Y77jOHDhHWYz66S+gzoMKnNqel77cnqZsOETmXXe3c3YVjcQ
	pJVMvXKypxsiNiGYDcGNHDoKyUbXyYvfd2lYq2ofQUHJGqyVHYt1l8j0
X-Gm-Gg: ASbGncuPAWRBOVPFAf5FSZfBQ29Qu5CFlBjJmQCOJbE32bIeUwxpTfk/b8GSPPgrOiA
	qB+BPb3J9Kti9OROrhaCB+qnimpsmsT7wRC6e4KlsuLrelNVejELF5C6IwnnVI8pmy7kC7DEzob
	qyDrs8/qvxB8VlGQ7/5cQzUN53zpU1FPolZI2FnZb8gjhGsu11xCCTWGzBaaHpJBmf+qJSiZZ1E
	2gLCSnlbxqrVT33ggNS8+tZPY+DiuFBSrm1nwrcrPeFgRpS6jp6v4WDd1k4VAA+TJx6Gk6Kj8SP
	Qgr4UFWefouEYz6gAFAl1O5oxFR2wWi0nwPTdVJWTUffzXH6bxjl496NE6mnjqXstGTfmhy/OZV
	5epHv/R4skwtQm3lgs8jPwCAAdmXLM6WqKYI9tgbAr6aTdTywLpNGk8UsILyqeiPt2ypylI/ld7
	QwlgoPZxAae52UNKLJfi+6hhMOG67V52pRpo7PDvT71L0=
X-Google-Smtp-Source: AGHT+IHOYqls17257tkZfrI1j3S/rbxbkd3G5LS7Xa1V5wyrUo+IQJd6ypdrMXOGDYIilpkwXDnmEQ==
X-Received: by 2002:a05:6000:22c5:b0:427:492:79e5 with SMTP id ffacd0b85a97d-42704d7504emr10968810f8f.21.1761075205922;
        Tue, 21 Oct 2025 12:33:25 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-92-177.ip49.fastwebnet.it. [93.34.92.177])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-427f00b97f8sm21327187f8f.36.2025.10.21.12.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 12:33:25 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [net-next PATCH 0/2] net: airoha: initial phylink support
Date: Tue, 21 Oct 2025 21:33:10 +0200
Message-ID: <20251021193315.2192359-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_123328_101719_FF541FFE 
X-CRM114-Status: UNSURE (   8.86  )
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

This trivial patch adds the initial phylink support. It's expected
in the future to add the dedicated PCS for the other GDM port.

This is to give consistent data when running ethtool on the GDM1
port instead of the "No Data"

Christian Marangi (2):
  net: airoha: use device_set_node helper to setup GDM node
  net: airoha: add phylink support for GDM1

 drivers/net/ethernet/airoha/airoha_eth.c | 110 ++++++++++++++++++++---
 drivers/net/ethernet/airoha/airoha_eth.h |   3 +
 2 files changed, 100 insertions(+), 13 deletions(-)

-- 
2.51.0


