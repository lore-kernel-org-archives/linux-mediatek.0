Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA23606A9E5
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2026 09:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pPk11LzC;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZlvsI3O7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MeBKTA0b9gdc1oZ9om4ZOcHEMZQgFvlj1R0DbKnQy1M=; b=pPk11LzCn1C4G9
	He8Yc1X9r61wfO7GHth6SD68GyvZ3glYkVnLUr+HN6xXyo8mBQXLXF1eyWPd/u5vbsWhz+L4eZ7O/
	E3rRfmUCI6UB5kFGEfiIcUdwcMUd90eCmoGu3H6HVt8uikv7mzHhC0eTC61Rp98GXPHpi6MAuouWn
	snRAntJx9g55OTkVrvpZleraJ7WOn1YI3YLj0uTK6RH5Thrn4kLRSVkp7GQWZuGQ0lRxNGE0mI04s
	ZZ5yzanSGWF8MpIAI1QJxQzFALS3CyEkVWPLkJIYUHGa70xY7AoJp5HuxzbD+6JTGuWl8R7ftVEsl
	hJF5xKZ4VwJQh24m7oYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSh-000000029XB-45PO;
	Mon, 26 Oct 2026 09:57:51 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSW-000000029Hg-2pqU
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Oct 2026 09:57:41 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so26338775e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Oct 2026 02:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008659; x=1793613459; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MeBKTA0b9gdc1oZ9om4ZOcHEMZQgFvlj1R0DbKnQy1M=;
        b=ZlvsI3O7fJafrgzjIsTFD7OAGNhoQ1wJgG8MY5IAS706QiuVnSiDhWEgKHTMXayKDi
         xfVbxWhQPgRfv7czaaQVhwxVDWStYRapnOjLW0iffaeeczk5gouHv0sIkR9GJ7aU9gem
         KBWEIHTkPxRckI83ofzMy+k8s/s/jzGz9VvpVuoNDhLwaDhKvyaa4W+xFoJlav4d4L4d
         iTxCIPV3qjfo3F/sw7ZMGNR7hlQ6euCTuy9xzsy+i7La4MZ9jx+G0kyxi2m++N0ZF7sr
         f6BIJWjXljp1XTP+feETFCQABKxwFlNlEFfL8g1vbPFZitLGh7a+zMFqbpSrUjd6c8E3
         LQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008659; x=1793613459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MeBKTA0b9gdc1oZ9om4ZOcHEMZQgFvlj1R0DbKnQy1M=;
        b=iyL8/M6ooucVftFFzOhPvPljNLACg5aJzxu1BL9HK60ieWQifTkU4k+hVxSEfRrvbc
         HVZCyFFd4/X7w6pO3R2jViS7jw3kDshq1Cl8E6E7EnlSoNIcuVZttB36NKUJKItekHRL
         a9bVHVFVVlEHxJBDaInXCCfhWx440pgOHhN8qEsb5fmjfrukV5H6gFuDAaoZdN491Jya
         B4Cy/qxU6UpFPzUVwxtxyoe/+SvJStywuYi60eID0isYe7j6wtT6or454h8FCl+KwJCn
         WR7noVw+63eHRv+dxi2KAm9khEbraSJ5w96fICNb3DSIRhHfyXR9fcTRAq5P1tDvWAsq
         /bqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZ5VJRmIFEcuoBn78wkoqZtMQB1DAof53U4d8r69XdKpdoMr4204IeH893eS+VrCFO1qH/G5Uk3+/Qq5hZ3Q==@lists.infradead.org
X-Gm-Message-State: AFq9FYIG51J6tjhNpLJjDAiWqubwuILUFEfIq/qK5StVHkAr3BaVLV9t
	74mVAYIiRgDPDLQldIfSkp0hvmKItqEl2gDCA2GxOT+zof//jqxB9rqa+ZVVmg==
X-Gm-Gg: AYBFou0iqTcXxFmp9m0UjUAt+0GMT5UfXCufPCriqdZSM/MhCTzmrcXExth9y3uAwuX
	dhTZ3x7LQ5mZC/TrnY4RtapLK1sRoKaS0RxC55C9Iw9MCZ+gHX8YHY1crTk/w+kVVmU4LLJjuMB
	4lHSzE2zyKpnomUO3TZ5n0qbnqbs0UQ9Wp7NVrEvrnJy+yGSbjj9O2sUD8hfX9Ux93OgFzbTeHh
	2gFtgjxfrG2ZxJk9Yz9wzVwyWVLDFHDBHXFn09Q3mzI8pTETvPPIag3F8sL9iVaICkA7MUwgdZv
	6D1Jfikvb2GNMutIf8VmX+4oMJsQAb/qHUmJrNWeSf8oNxL3cLTTXGrsYOpr5NuOzdNN7O6chUO
	GyYjixvORxM3yq/9oQfFkVaCtAEMaprwdSmwIFDLY4fx/65WCia5nk+ie0h9DaX2KNQHqZMIH6v
	SmlROB7HwlD1+SRaA+7kdLuXGV6GMdnYb58pqG1Q9lAzxKmMZeHIbhRyJcazmAnF3Bp+zir13nM
	mU8byU0qcAALsfRPijQGWqcmAWF6zvPXEwuTsAbsQkx84iUG+KbpGW5AQQlAobMNrjJejBnx2CC
	g8cPQ6QkzjslhU0k7LjTc6BJ0FLjJYS8rIqZJUdmTMqZc3UZAJZ/cs5MPsyiWZulyA4mGwjH77e
	bfDqCFw==
X-Received: by 2002:a05:600c:8184:b0:4a2:9cda:57b6 with SMTP id 5b1f17b1804b1-4a35aca71c3mr100497405e9.22.1793008658493;
        Mon, 26 Oct 2026 02:57:38 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a35a0cc374sm190382825e9.9.2026.10.26.02.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:38 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/9] arm64: dts: airoha: en7581: add Chip-SCU accessor node
Date: Mon, 26 Oct 2026 10:57:09 +0100
Message-ID: <20261026095727.31708-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026095727.31708-1-ansuelsmth@gmail.com>
References: <20261026095727.31708-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_025740_729715_58F93505 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add Chip-SCU accessor node as a companion of the SCU node to permit
additional configuration for clock, MUX and thermal related registers.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index c5a335086741..fbc5ee47523c 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -342,6 +342,11 @@ spi_nand: nand@0 {
 			};
 		};
 
+		chip_scu: syscon@1fa20000 {
+			compatible = "airoha,en7581-chip-scu", "syscon";
+			reg = <0x0 0x1fa20000 0x0 0x388>;
+		};
+
 		pciephy: phy@1fa5a000 {
 			compatible = "airoha,en7581-pcie-phy";
 			reg = <0x0 0x1fa5a000 0x0 0xfff>,
-- 
2.55.0


