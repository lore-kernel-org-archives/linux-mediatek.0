Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697C3606A335
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 19:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IcfzRuZx;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BPIPLQ8l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9xw7u7BY3gKW/hPJk1lTv2E8M0UGoLRiDA10ri1AQ68=; b=IcfzRuZxpUyxuK
	koeXtXi/+73pvISDWrDDPVxGaTxfd32flfY1JZ23nOuXo+ASwtCLH3ojfrV6GXJeAnf+AdJ1OQt+V
	MiXcV+s9APc6AzRiuBEyZAyfHUdEeTvxWJRKDcD133/l3OEsG50VKSZeAWYBqYW5tvcCw9/OmCXfl
	4KmY+DijDO5DlbIa0L1MJIk3JTaHWUV0S1fvcSYyYDRuquSLinPqnDOviFZjS3T5zWtetlGp8rmeU
	yqOzyZCblWAceCAVbxKeJH1B6VXVHY9+G11Fs7Eq+jzUNTY3xZiePVAjON4rGUTc2Fxz+LHuYtuk0
	UWu5q1i8dI8Y0jc2zRLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOfD-00000006q3V-0bvM;
	Tue, 17 Nov 2026 19:16:19 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOf4-00000006px5-42RN
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Nov 2026 19:16:12 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso2360145e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Nov 2026 11:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794942969; x=1795547769; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9xw7u7BY3gKW/hPJk1lTv2E8M0UGoLRiDA10ri1AQ68=;
        b=BPIPLQ8lVm/XHQeFobr0WNGXsmLfz1IEU7mGxTcHbS4WlrrSdinkTO09iirlu5RaQj
         5RCLWZ34OFZYj6/fTSf4ZxJ1cfElnR6mF505lc42Re9m1DsRsC95VUNu03muqSU6eAtG
         /D0t/LLHb2EzJCWele8u8dr62qbIHDcmKRg7CLfjumSwo0o4beoRTUt6neF4vipfh8bv
         q9o05aRHGQlfW25ZEnR/MYEhkYuaReCqLLk6XEYq6tNdorar1CrgsO1kG47JIbqh+cvf
         G/syAvc3m2/FXNecRw4Q9CwX5zOefJrflnI+SrnsRSPJF2SZxaP+kOJv7Zdwit/X4J3s
         74Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942969; x=1795547769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9xw7u7BY3gKW/hPJk1lTv2E8M0UGoLRiDA10ri1AQ68=;
        b=TamCazTcXo0hE/XVJORC4e/B6JKpzoEJbqj4j665pCXNFuykWVJU+BNnghI6xsmtjC
         t4ZK2B3C0O/POuHOT0TxNG4oD3sG9UZZscf8RWttYEjfQDV3Y09FQKQqYWU/VOBVmTh9
         /okp6T0DGomb6QmzCPBVew8Tpht/Cvxqb9+NqQpVYA3ZQwkuR0kY5nLVbz/fi796faGG
         hmRp/nLTzIHIONYocs4++VQDqw6+WcAkOR4dxZfX6FEYr0Fv9CQUr8YzNc5HpJGk6epV
         6Xq5313K+YBrwukjCu03Nlgw54k6M7FFMb+9g4ueUykg27vUp1JM0nCWf/VUvjJJ+/RS
         EjtA==
X-Forwarded-Encrypted: i=1; AL+hErEnVTa5B43Z6G6EAeIud89b1hYEZRG6pK+qa1aTK+IT3zYsg8obgHg2RNENvqkiiAQaaUn8e9u684gIdD0mbQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+yTpjFjzLNRPRvEoXCfGdNskQJ4L+G+/mV2qQZ+lHAFfDY+HvR
	oHGZvdkM6FvrNELETMpsanIKsIA98WPvACB0i5Jxkrui0JyXbCX86sak2VWRfCFvG3I=
X-Gm-Gg: AYBFou3f7S67oDx52ziGNGLvszS8AYB0K5Ho7TXhbyuROxnT3sRpg1lZ2vGBw/zUlBu
	yO4S6BPlgXeU7ztIrfuu8/upMughkypC/Ic7N4fRO826jHImvdTHp4X/1kf1uaGmijU9/IOxUPK
	p+OopLyPBazYr0vk0BQrtfxxweu1V6aAvM+YbKlO0LrV756Mp7Z7OQtHpdxntr2Xt0rPUU1P8Zt
	XiOyy//o33hn9kiGi+sXXY+gwuM8f5tCsfiSlfKTLka367NXzjneXMZiDjF5qqHRjQuVnxYNGsh
	ymKIzhfgfZCbxXwV7bR1efYvJ0ifE0WKrzmgOFM2WxwoRcnaYHj6agqYxHj6/4rbJtmYrsK970m
	goGzlF41JY9RpQWX1CulYtg9wltm1SpkozIf+B6YPAJFIiHhAGvus8QJ6zMZ7VF01Mp3FxJ8xOm
	CVEyCHgXVByLsz6b/PRBkK3YJJ951/Ec3TWcehpTQgtDgI2dyTc/xWSIlMfnI0uW8777zM9Hbir
	z5k335qt8vF6kntfOTes8zjKQZrWqXDIT1Bh+lFiKyS+UMRCFGWd4u8cv38BmH4hOh9J8Gmvyju
	LUvwhxpVZIIGvbLo1vb4joWo5hZNg68IBSNegScEy15I5G4N0Cwo731B
X-Received: by 2002:a05:600c:8b83:b0:4a1:df52:3e36 with SMTP id 5b1f17b1804b1-4bb7da55745mr2432765e9.27.1794942969381;
        Tue, 17 Nov 2026 11:16:09 -0800 (PST)
Received: from [127.0.1.1] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2b8032sm5658625e9.10.2026.11.17.11.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:16:08 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 17 Nov 2026 19:16:03 +0000
Subject: [PATCH 2/3] clk: mediatek: clk-mtk: Add composite mux tables
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-mt8196-pwm-clk-v1-2-d8725bcea9f4@baylibre.com>
References: <20261117-mt8196-pwm-clk-v1-0-d8725bcea9f4@baylibre.com>
In-Reply-To: <20261117-mt8196-pwm-clk-v1-0-d8725bcea9f4@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 Laura Nao <laura.nao@collabora.com>
Cc: Chris Chen <chris-qj.chen@mediatek.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_111611_035014_BCD6235C 
X-CRM114-Status: GOOD (  11.15  )
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

Composite muxes register a generic clk_mux, which writes parent index N
as register value N unless it is given a table. struct mtk_composite
cannot pass such a table, so a composite mux cannot describe a selector
whose parent values are not contiguous, such as the MT8196 PWM source
selectors.

Let struct mtk_composite carry a table for the generic clk_mux, and add
MUX_FLAGS_INDEXED() to declare a mux with a table.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/clk/mediatek/clk-mtk.c |  1 +
 drivers/clk/mediatek/clk-mtk.h | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 3dfdd3a422f8..b426f7a36e68 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -239,6 +239,7 @@ static struct clk_hw *mtk_clk_register_composite(struct device *dev,
 		mux->shift = mc->mux_shift;
 		mux->lock = lock;
 		mux->flags = mc->mux_flags;
+		mux->table = mc->mux_table;
 		mux_hw = &mux->hw;
 		mux_ops = &clk_mux_ops;
 
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 5417b9264e6d..c7822a8d015c 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -93,6 +93,7 @@ struct mtk_composite {
 	const char *name;
 	const char * const *parent_names;
 	const char *parent;
+	const u32 *mux_table;
 	unsigned flags;
 
 	uint32_t mux_reg;
@@ -161,6 +162,21 @@ struct mtk_composite {
 		.flags = _flags,				\
 	}
 
+#define MUX_FLAGS_INDEXED(_id, _name, _parents, _table, _reg, _shift,	\
+			  _width, _flags) {				\
+		.id = _id,						\
+		.name = _name,						\
+		.mux_reg = _reg,					\
+		.mux_shift = _shift,					\
+		.mux_width = _width,					\
+		.mux_table = _table,					\
+		.gate_shift = -1,					\
+		.divider_shift = -1,					\
+		.parent_names = _parents,				\
+		.num_parents = ARRAY_SIZE(_parents),			\
+		.flags = _flags,					\
+	}
+
 #define DIV_GATE(_id, _name, _parent, _gate_reg, _gate_shift, _div_reg,	\
 					_div_width, _div_shift) {	\
 		.id = _id,						\

-- 
2.43.0


