Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F3EC982DE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2026 10:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SAhM4rS8vGtagR8aFAjA1hCIKMAz6vfqxFS0S53ee9k=; b=fVYJLFSPuGEOppgKCKlKw7uaDx
	g72zacMMAwHm6VTvSqjxoo4uxmZqdkcquLfmxltk91erjJQNTty7Nch1fd5AQq2PARgGMFuSabR1W
	X4hUFVO1HqA9+qF4fSO+q26wLYkDUxlmWZVHeV2VnE1a/0ARmmJxDCbCpQ6SevP5DIe58FxJXYnFT
	m4IBtxN2/j10nx8aDiEtWtQPWxLjXann3vzi6x7xz8kjTFQuDvXrw+/DTOlx/R/oJIDiwKPnsj81u
	z4Km1NPndgr6VQ2C5w91vWAXlW5D4C5Pkcu6hHCCdlYbIKEr2ZEg36RhBRRP+thGnJdEct2MtKLxN
	FQ/eJzLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bDT-00000001gbU-2iOy;
	Mon, 21 Sep 2026 10:25:43 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bDO-00000001gXp-1rIj
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Sep 2026 10:25:41 +0000
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-85469d20963so1767568b3a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Sep 2026 03:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789986338; x=1790591138; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SAhM4rS8vGtagR8aFAjA1hCIKMAz6vfqxFS0S53ee9k=;
        b=WujphvEo8+Ag7piGmcTisTpgtgs1Adzjh0l2/WWakrYQ36UhmjS7iNX0d/PTv45JWT
         qOHwlJ1r81UU3uYIfcKAC/u6W21zQ7xrwEhtm/UJv2btcA+qyq17lZ8tiksnceLrI9DJ
         9TtSXs2QUTNGYyMgeJwWKrmvEms2nMUXrvzsADXr3hNyXFd/fYzbBKRVEc5V8n4hcS67
         DABbTJlnNtHmFUbFncVy0XlY/UEfsGWj9VkUhQdXDU42kbiZUPu53BQoJyRcBHR6zzMm
         c9uiBPitxzgXj6G3UI46RjTTIYLalMiOS3ix99s70FKRqhNqicR7/Bi3F+cX/RNYtpEF
         SsHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789986338; x=1790591138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SAhM4rS8vGtagR8aFAjA1hCIKMAz6vfqxFS0S53ee9k=;
        b=eRWawDbMY3sHkjZFQODD9nZXYjOKJXRxJGYVwMBpkqQ6qR4N7yI5wHU0AVL7Pl0Jw4
         156Vppg5ovQkeSiiFS9We5LBO7oU/j1hk5uwfUzxgwGD0uAl/oyLkkxK1I0NB31SGgLI
         w1MSdIqpUPuYS2A+gO3ZNmD43wIN9hac34wtvhlTctIuor2Vij1Q8gOwrNyl4xZhK2Kw
         Ue0ptMfAX3SCIG0dWS0Ar0QluzUyQL/40OfneEPCnX6OOdg9fSd9GS/EVkkJdT95G/i3
         YKhJA6Yyj6IXcL7cIc3wDVEN/DgK+Q0dpHpyOwdbBkXMEYTxCoTxUd/x8+T6Jni2y97e
         2p1g==
X-Forwarded-Encrypted: i=1; AKwUvBztmi4m5hQqsMixnqdkBz2UkrX50rMaJWms6Nc3/BvOMGmI4uuDsOe2KFYSSRvxfI1RLiqHX6GKCxUNsGOjqA==@lists.infradead.org
X-Gm-Message-State: AFuF++mqjvnV5UZVxVb3NxSsB31a5fNwqjdDyO0ssUfxe4TX4iSHkW0/
	EDNHbVSE36L6H662cEUcS2UIHo/OSkQy4i5/lgJbQEI/PMsJlw/yeKNk
X-Gm-Gg: AYBFou22hYNFTDWiG1YLhAwWzTEJZCb3L7XHNP77NRfbdkN+iT4KEuPQU9hLkhXUkdZ
	HTkxn9J0P5+RfFmddRQgtQbxCbeX6zvU/afFmUaStEHa/sx7Ab6eceyvWAmI3H41ZFjyX5CpapL
	9yG3aHylVX68hjPrWf1CLLJp911xeS4bx7rIEhNlSAGuI7zHVhVeipTfA0i37+5o28SHj4ETNQm
	Zin39ODMGjbfCb34qsOkrjr3fgibhpZyOQ/Zl60dNIq4DqNQZIZgqqW8HQRBuXVZfl2FKLjhq0O
	U4Gs1b8MbN4BKKkYv/v22T8Ep0r6inyIaG/GLCnvY8oD9PlD/H4iRKdBpQEtbwjRVAiqRYnhQUF
	85X3Cm/+Y2VQbTrLAVyB+JvEo3b0C2n5541o+9vOx3pE/5eLL7oeJKcOfQjiWmrN+6EjjtoZRjK
	boJYiNFOfdm/Xtxtow/fEj6rVsoy7PRwcRHKXgSOj1NCNlpAtzomV1GDIep2pQVR/Z5Fg4cpjVk
	AqyLt4AuVFv84WXpDRY6vi5JE/rBYXQ9ket7B0=
X-Received: by 2002:a05:6a00:9487:b0:878:3507:8d6b with SMTP id d2e1a72fcca58-8783508a7bemr6555638b3a.50.1789986337806;
        Mon, 21 Sep 2026 03:25:37 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f238csm2909174b3a.21.2026.09.21.03.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:25:37 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Laura Nao <laura.nao@collabora.com>,
	Sjoerd Simons <sjoerd@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 3/6] clk: mediatek: Reserve missing MT8167 clock ID
Date: Mon, 21 Sep 2026 19:25:19 +0900
Message-ID: <20260921102522.1640072-4-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921102522.1640072-1-akkun11.open@gmail.com>
References: <20260921102522.1640072-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_032538_503404_2443D312 
X-CRM114-Status: GOOD (  10.29  )
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

Reserve the binding-defined CLK_TOP_HDMTX_CLKDIG_CTS slot in
the MT8167 top clock provider with a dummy clock.

The clock is not implemented by the topckgen driver, but the
slot must remain present in the onecell data to keep the
descriptor allocation large enough for the registered IDs.

Assisted-by: GPT-5.6 Luna
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt8167.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mediatek/clk-mt8167.c b/drivers/clk/mediatek/clk-mt8167.c
index c64d918c37de..c88c41aa7fdf 100644
--- a/drivers/clk/mediatek/clk-mt8167.c
+++ b/drivers/clk/mediatek/clk-mt8167.c
@@ -746,6 +746,7 @@ static const struct mtk_gate_regs top5_cg_regs = {
 	GATE_MTK(_id, _name, _parent, &top5_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr)
 
 static const struct mtk_gate top_clks[] = {
+	GATE_DUMMY(CLK_TOP_HDMTX_CLKDIG_CTS, "hdmtx_clkdig_cts_dummy"),
 	/* TOP0 */
 	GATE_TOP0(CLK_TOP_PWM_MM, "pwm_mm", "pwm_mm_sel", 0),
 	GATE_TOP0(CLK_TOP_CAM_MM, "cam_mm", "camtg_mm_sel", 1),
-- 
2.55.0


