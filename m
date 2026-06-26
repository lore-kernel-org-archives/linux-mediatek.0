Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2687FCD4F26
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2026 09:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E49Adk+rz41ma/ZabM7UStJxIriNv9H3xlG3UDtods8=; b=OY2+wymbdY1m/UDrnNCtzenZQs
	9iyvjjyPzTo5o/whJTH7ZZID2rlVBJ1/FLT+tfiUF0SbU4gUzVazDaP2UYx1MFrUrQi3D/F/Q/Zjr
	Li4ugG9MQkcvtu0LqqeLSvsQ8e7afnhD6vlLLf3ofdLo6LkkCtOJSeHuVJIMjQrGXI2zZzlyF/YtJ
	pvEKmrtWzo8T/ZS6NR3i+W0bqEAI85jvAXXQ51lCvHhJvPTR5J5iJalDAW9VJHn8wtIwtkO2f66iJ
	uwfth7Z6Qd+vQV3zVrGFqxc/Wv1zaa02VFBb5LwJuLuIKq7NZMhWFRAFoHfG03OO/R2EwWft0HWCg
	F/eyoKaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2k0-0000000AxkY-45LN;
	Fri, 26 Jun 2026 09:20:52 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2jv-0000000Axf7-0PBk
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Jun 2026 09:20:48 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so5068215e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Jun 2026 02:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782465645; x=1783070445; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E49Adk+rz41ma/ZabM7UStJxIriNv9H3xlG3UDtods8=;
        b=pvpYleu+xozcI6nJ+NLgf296+X4NKz3TmlrkCUCD9d2wanguLKQ3512HtLWnj7L8Ye
         HYl0vknbkNbHdy8dFF8MoF9aEW2dSd6Ju9tLcgoDQ6ILTmF9kGjJiijOK7nIwn0BpJss
         ENsy8pD0s1J+Xqi2QnLM2ezy/jiksFsMIlBn8uxKLpuRjPhw+Lo+5mwS6leanuhDcRHZ
         juhnDY14Hp37+VYxqJaVrcngSigyfdsHBVuvu3PltH6ckFSMj3o1olg1jkpHZ19iO2Af
         a9LDsDtw7FzUvU93XNtacWbwiWItBGEvegm9BvKPiy4ittXTIDfSu+HE9rwl2Bih8hXc
         xALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782465645; x=1783070445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E49Adk+rz41ma/ZabM7UStJxIriNv9H3xlG3UDtods8=;
        b=pNm4F6UMeGNsRnz67KIQhp20JGEb4pdrUqHpmUhlBeyfylaHnWuOePt/tA7nLZFnDs
         864SRLjktRjNN5okOKfQASx8471JpAppbMy632NhrtOmodh0ld4NWUbBslZDC0N0TEgI
         B8EVrnccFmOngGnsmMjE+CMuAzNZb6sEqg7yiq/WzMe4o8aDZX8MCRIGBYAAtKzucxgv
         b3Km6JghjLiIbxKcloSIBpDkkhvjaW4faGvkwoM/pldZZxwp+/4OqZuTMVz1o9y27GLb
         zHeHJaOT2uho3srXMbU/P2PG20MVQiNYdvS4opJACmXuB16UXiNLxWjkv5ic26KJSnW0
         xYXw==
X-Forwarded-Encrypted: i=1; AFNElJ9s6ZrWKFe67ObbWvsGfaHN0T6tpP9bfIabCV4jHw2MwczaIFTEkM7SqBpWvfxqlMEl/ZQFp0pbbFixNEcZUg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyBgcrpc5hpxXDt0xCGqPOgs1l643xfgysa3D5UaWlGCkWDQon7
	dTR5cYU1AoESCriIkFGp+c26n2B90HZzxw+eQEsjA+jhn1s0Tzrkv3MM
X-Gm-Gg: AfdE7clkyXDpJW5mQN3aEuPtq37r/FEZgFFZBxfXNmrVyoxjiQElEOPa2IwozAlihqH
	e8tKyRvjIN8K+oQ94Pk2uNWzUGWmyxUUqtci/qP52Ioi4qg3KhRJQQDEuMkQW6S4TvmzWkK1vsN
	8JHTLQBn2jSoKhEn8aeRUIjg+IIHf/yrNH+wh7/Nfb+9Y56jfjnnVhjBwj0mJaMm20crHg1vaxt
	lgKe2rEjGN7rH2iRf1czKCdLwG2788NLi09aAbcfUGGJb0nnpMWfsJaE5MPKXJ4gKRO3T5FGhUc
	3AHf5gHgXCIkisVZaUta7M47qAzzjRLz4PCi40x/bNEQ4vVX8UMCQ4W0yRAX50741g49K66LECJ
	K7MbDdEEjpeL4hH2EKR4oY458QKLeVOHpKvd5Zb/aqSTjZcLSFjWrAwnwbe5WqdTaY+ZnCnvZ7N
	3KsXliDlLsE+zrnWleKHNl8kzKOgSh6S9Vl+b5yMYgMM+loWThTsRyyO9tCb8LJmENpJ/rE1HEk
	IGAWInNsWzT
X-Received: by 2002:a05:600c:1c05:b0:490:ea8a:32da with SMTP id 5b1f17b1804b1-4926689ee78mr79972515e9.26.1782465644046;
        Fri, 26 Jun 2026 02:20:44 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-80-183-219-152.pool80183.interbusiness.it. [80.183.219.152])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-46e6167c05fsm9094388f8f.25.2026.06.26.02.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 02:20:43 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/4] dt-bindings: clock: airoha: Add additional reset for PCIe PERSTOUT
Date: Fri, 26 Jun 2026 11:20:25 +0200
Message-ID: <20260626092029.3525264-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260626092029.3525264-1-ansuelsmth@gmail.com>
References: <20260626092029.3525264-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_022047_172632_93C0B3D2 
X-CRM114-Status: UNSURE (   9.68  )
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

Add additional reset to control PCIe PERSTOUT reset line for each of the 3
PCIe lines.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 include/dt-bindings/reset/airoha,en7581-reset.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/reset/airoha,en7581-reset.h b/include/dt-bindings/reset/airoha,en7581-reset.h
index 6544a1790b83..25e75534daa9 100644
--- a/include/dt-bindings/reset/airoha,en7581-reset.h
+++ b/include/dt-bindings/reset/airoha,en7581-reset.h
@@ -62,5 +62,9 @@
 #define EN7581_CPU_TIMER_RST		50
 #define EN7581_PCIE_HB_RST		51
 #define EN7581_XPON_MAC_RST		52
+/* RST_PCIC */
+#define EN7581_PCIC_PERSTOUT0_RST	53
+#define EN7581_PCIC_PERSTOUT1_RST	54
+#define EN7581_PCIC_PERSTOUT2_RST	55
 
 #endif /* __DT_BINDINGS_RESET_CONTROLLER_AIROHA_EN7581_H_ */
-- 
2.53.0


