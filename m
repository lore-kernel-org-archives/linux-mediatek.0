Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E949CA0FE1
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Aug 2025 11:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AxFZWCSKR4desKiHPJ6haTS2ebGrBTXqENWB7tlhWOw=; b=nbDFyoAG2rw0zbCDfY5RlSuh3z
	9ohpSgtmfPKONSXRQ7eVjLY2C10kxEUV3Fs8nCpnoTq3j7XvU0orgbA8LjMPCgn3+OslXAdHw2eXa
	O/r0j+sa3JgK2iSVcunHuExFxUTm+2Zlaxe+gyy6Ekt+Y7UWwzq8IYHFe8Hu9MVK2J77Cuq16xPf+
	0rDVz93mMb+XL87htTmJ2NuKUORt+GjCArMDEljyOwwwMawqLvmRzDt0mzH8G4M2+fLIfFj66rtYR
	eW/vllpfK7MGtEczn++QcKZ+TNPl663jBuiz7Sb2nyhhn0I1PuWAm7HfXt6yfYHaL56jRB0PzS43C
	TJiB7DRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQG8-00000002N8p-0f4f;
	Fri, 22 Aug 2025 11:48:40 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upLGn-00000001hIe-2mf1
	for linux-mediatek@lists.infradead.org;
	Fri, 22 Aug 2025 06:29:02 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-32372c05c5dso1500364a91.0
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Aug 2025 23:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755844141; x=1756448941; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AxFZWCSKR4desKiHPJ6haTS2ebGrBTXqENWB7tlhWOw=;
        b=WgsnfrC/K2z5KexlSLVcLz6aCz+v+7xKwXSjIg4V9UXJfgzfNHOwXuXvddf6sEYXz8
         KbV3IVDbtlwcfR19KmXIqZOcW6ojXtMmqYScg/JJg4+J6qiN6k0JlRYTNLrXsSYJgnCB
         EMTwuUV4ZuTnpwd24vvMTkzTRufeF7sugwW9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755844141; x=1756448941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AxFZWCSKR4desKiHPJ6haTS2ebGrBTXqENWB7tlhWOw=;
        b=qU7/98cFHMEJkq+JsVaumiHFN6X1c9uyQEHGYC4XS9JHuiu6D3FJVa/3MLdY7BSchp
         gCIOm3bBfehKj+o7iUB3GNlzAA20iZK8J+gp1KZyq89/N2/MVB2dYJVkQzBzTzOCwz/s
         Y+8HdzgPE03S+VBgofk4AR+Pn4uVsdrrKusfrDXyIcv8WahDIiseL5cqcs+jEL/EYUs8
         Hs9Ixs+GOuTn/8bjD+EfHK9Xua5UUSBfFsPFkyxz2iYAaMrIMLA/4lhrDhyUJZBT0xgs
         /i9wN21MTcE9E9uHYsSw3UCJFFhBX8/P8cao84OgpMRPd2Fl/YiFKdjwkIwDVVxR3RCI
         904w==
X-Forwarded-Encrypted: i=1; AJvYcCV2LDpGXizhu5qdTBOYDaHvzAcv1kh7ptF9sS0TdUCiFM0TE7oMUqPRqfAKRo91onbt2XzxhOrk1Zeykb1wYQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzHd0QeipJI9guTDfuZS0DSFlTcNQqjt1f2EdUQRW3KSWjLRsY5
	5Y2PEENgm4QZHnf0EdEV4gnGbgZ7cLfU8c9turpMJi8OIWGjGIpFCstcm4iLd4FX8Q==
X-Gm-Gg: ASbGnctxbXhv8ycfk5yuHC2nVSRg1SfQZ6QnXp66CqPCb0cuAnAy0eLEQLtc001S4Mm
	U2Fc//joRsrBx8FLLBK/Ydr1fc5MKblVAIL7E8UNzqCSZDTxVrftcnd3v1qoBanq1RT6S6J2+0C
	7V/UYB0oJYqwuN9EmwNmOQc/1EhGtNAZws/u2KiHMrY1s1sBV8AVIQCzxc8/r9pTQJx5qrs8GKi
	gMQyTH01RNZry4RhnuYn0zOpmN83oLL1r3fwtURnSMyxVI0Dge/0XTb2+uviG5/hjd+BVLfNZ/J
	tMIP4qKZUb9/nAcHnK7dBfVf332XFkj8CqA6pWHbNlxEGT7H9yGYGpQTDeC++lknq1bEhx0je8E
	ZH4qNXyH/KItuRqpazW0K4/+SIyRi+JUa32grqKKo
X-Google-Smtp-Source: AGHT+IEmIoRbqzsMhT4RaCduv/mgQBiZTCW0YMv/crR9hLxBxCwCtU4VSoj9WK1ncCfxE24zov8CFw==
X-Received: by 2002:a17:90b:2e0e:b0:313:f6fa:5bca with SMTP id 98e67ed59e1d1-3251744cbfamr2642987a91.22.1755844140925;
        Thu, 21 Aug 2025 23:29:00 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8278:5411:367e:2f11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-325143959e1sm1530661a91.23.2025.08.21.23.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 23:29:00 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: clk-mux: Do not pass flags to clk_mux_determine_rate_flags()
Date: Fri, 22 Aug 2025 14:28:52 +0800
Message-ID: <20250822062854.2633133-1-wenst@chromium.org>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_232901_700565_9C0067B8 
X-CRM114-Status: GOOD (  11.76  )
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

The `flags` in |struct mtk_mux| are core clk flags, not mux clk flags.
Passing one to the other is wrong.

Since there aren't any actual users adding CLK_MUX_* flags, just drop it
for now.

Fixes: b05ea3314390 ("clk: mediatek: clk-mux: Add .determine_rate() callback")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index 60990296450b..cb015dcf8d30 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -148,7 +148,7 @@ static int mtk_clk_mux_determine_rate(struct clk_hw *hw,
 {
 	struct mtk_clk_mux *mux = to_mtk_clk_mux(hw);
 
-	return clk_mux_determine_rate_flags(hw, req, mux->data->flags);
+	return clk_mux_determine_rate_flags(hw, req, 0);
 }
 
 const struct clk_ops mtk_mux_clr_set_upd_ops = {
-- 
2.51.0.261.g7ce5a0a67e-goog


