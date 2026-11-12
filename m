Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD897606A32A
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 09:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Sa4KQvTJ;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kaLIlekH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=VMpo5RPSnSntW+woI56Bm32Y77NrXTYORi/b1dPNWxY=; b=Sa4KQvTJMY4l2wsWR4OACodEsK
	nCZR4GDuaVrhL93mzvhbCO5wjEzMUMag+fOm4zXr0XCd73IlRKQpy4yiKoCYsha/6EM6Xt2ipyXMM
	kt2WT1Ter3Yauy8/pWQV8q54oRbwzPEWQ7K+drPPTE5NkXWtC6UGDY1osWZWReXqY+UEr+PUpapa+
	XyPavwB43i+61VfsdwaKe8pC1b1AaSCgy8nCl1dC7IM4ojNvMk4Ars9xhZ75sIr8IE3e1DBaFZZg6
	PIAEgQJGorbmkFD47I4RlyTgbk3p92UkR50jwRv7NAvdEeeSbs4JK+N+sOJzUZCazT91udLhVWQsj
	tROsy37g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQtZ-00000009K7U-2GN7;
	Thu, 12 Nov 2026 09:15:01 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQtW-00000009K6D-3TWN
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Nov 2026 09:15:00 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-1b244fb7fffso5038708c88.1
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Nov 2026 01:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794474897; x=1795079697; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VMpo5RPSnSntW+woI56Bm32Y77NrXTYORi/b1dPNWxY=;
        b=kaLIlekHzu1lt0MFsGvIP6qUfq+/DTs09DVYH3XP72alt7du0F708qiT42ffn7tY0A
         eHsPenEVZaYE9faqz2sC+crYOX2ORWIEj+1abJbiEhVz8UKjMMtIMexVTDAjx5Dbb/tP
         xdkg6Lrs8AAVxRDLxopJWb89EVrr1iyLjtU7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794474897; x=1795079697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VMpo5RPSnSntW+woI56Bm32Y77NrXTYORi/b1dPNWxY=;
        b=LS9izYuIZeBkb33LTQqFOAmrcCv1Xs7svB2xi+Gssx9im9QgSGDI/QQ+VLBmzlr0ZC
         oUx4smYwR1A7KAe7TsQX5JtcU0neo0k8EhSPPXqPlEAPRsh0XXXGYmCTnXEB21wbBWiA
         nSAXj05qXnEc3IpyE4Dv1LFyQgnZikUr4Lq84Qn2x175E9I3OEqWRBbGm4TXZnp32ghU
         PnSW6zSLT/RvOkyR9IFui0PGnPJp8rSqpniiVW/FsSDyVRvg8nIf97xLXdjaQjllzAC+
         PnyZH0qzsY1hrgK6cqU/2XIrlMaAHnSBtnOrnTlKAEvncASjhS/Ax11bh9fv9O4Dr01T
         ix3A==
X-Forwarded-Encrypted: i=1; AL+hErG4ewS582Ntyvh/i8+dsDcuU1PBBX7kznC6bY53OkHRrIcctozCjMv+8BC/rzbum3v6SMK4EvBoVyqaQexKlA==@lists.infradead.org
X-Gm-Message-State: APuU4Z8ciOaprlaVsQ+n2bwdfF+A+YdAj3+tTX4u96HSszEYhPsP9Ln3
	kY7CG7nVHS+XMcBGqATXargZ9SoWRmPz2aNXcenEvaRJUGUhvL8+ajgOKACc+iqOZg==
X-Gm-Gg: AYBFou1+JgYPz8RveEMh2PHbWj5zrLxMS0YwntrVHObI7p5EbGkDt/Xzn+XwsI36hcV
	KR5NLGj+LuR/acYQz3AM+i7uLVHpGcX07UERfftwlqy6EEyUQZJ70IWOlTX7CZB3Zsm1PRiejcc
	8np4V9JWSH8ePCQg/LWcaqxfdxj+nuHKTxy1MB5cfbS683t6UCkbfKWRIesz+AGegFf1RjEX/lC
	r6qM9MtvR8P6NZLGpg6jPDriYydFZoEorBnigh3oqbsjU8NXpPlN55Ie+2KfSh12f/2GD/DuyOS
	K2VDTExNfFyh1CDr+gCa6H5SVxYMPwt9LuEHIQ86UIEGypswpfEBLlmVDhT5jjaqgby7STTAarC
	/UWR7SmGHINW1UwfqhHMbwOlUlmd/YV51fcFQiTLAC3D4RVLpJPYCXOfrX4/W4qYtOn2uO9bi8F
	8KyZvUHmmNmJcL+KBizQR15JvcYkucVeFjI0gaKokrtnF+8rny6T3zw7QbE7F0oyz0SSIvmhgam
	Vb/rodZfrlfEB3Y4/25ZkXyhlv91WmYQ2waInSe3DsC1TWzwMfuzvU42OtRiMRcBOJyMF4Zda9u
	tUDMltDalJKu/6RPq8p1iPXbRbXRpE13YLfnLd/X1kXNawXKR7g3Ry5hZEpA
X-Received: by 2002:a05:7023:d0d:b0:1a1:8bac:c1c1 with SMTP id a92af1059eb24-1b3c02f06b0mr4729658c88.15.1794474897295;
        Thu, 12 Nov 2026 01:14:57 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:3df7:8811:7670:7b44])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b3b5b2eeffsm23794130c88.9.2026.11.12.01.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 01:14:56 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mateusz Koza <mateusz.koza@grinn-global.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: mediatek: mt8390-grinn-genio-sbc: Fix PCIe pinmux node name
Date: Thu, 12 Nov 2026 17:14:46 +0800
Message-ID: <20261112091448.869620-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_011458_900120_72836C98 
X-CRM114-Status: UNSURE (   9.66  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The pinctrl bindings require that the pinmux node's name and the node
names of its children follow a certain pattern. The current names do
not, causing a DT validation error.

Fix up the names so that the validation passes.

Fixes: f4d1eace54f7 ("arm64: dts: mediatek: mt8390-genio-700-evk: Add Grinn GenioSBC-700")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
index 51f12328a1d6..7a31cf6f27db 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
@@ -228,8 +228,8 @@ pins {
 		};
 	};
 
-	pcie_pins_default: pcie-default {
-		mux {
+	pcie_pins_default: pcie-default-pins {
+		pins {
 			pinmux = <PINMUX_GPIO47__FUNC_I1_WAKEN>,
 				 <PINMUX_GPIO48__FUNC_O_PERSTN>,
 				 <PINMUX_GPIO49__FUNC_B1_CLKREQN>;
-- 
2.56.0.567.gdb80ae8cd5-goog


