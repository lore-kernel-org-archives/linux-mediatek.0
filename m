Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD58C982DE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2026 10:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1J2ZuX47pvRKc6yxdNr+hnj5FMRU4oVdsCq83VAYAo=; b=OkxiD7BwGzVLk+FEPkfsY4DHY+
	fDZfU6JXm//BBeQz6Jxs8q6MUGEuzhX73Gf3GUs0P/qAW9bc20ppwm20mfgyqGvoGj7OA55KgfAVv
	hWHgmfq+cnLPYmyzjoj3WKwTHlkx+gQDbg6uXWIS5YodGwcAq2S9TXEfwJaWJVsKBUKzc0n9pkDfT
	wArj7IFtcp/DW7kIKHkqk670bQME1q0PJ5A8OEMX4e2ofvezmgiaM53ndIfn3euw7N6r60BRx3HNS
	5c1xbWt5iAz+jpsisyvkARheZr9nkYEPVbdqQti2+xpRM1NHyrujbGkDE47CaTJq1w6PUl6mA54Xu
	yJHa0fKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bDl-00000001gqc-0HaS;
	Mon, 21 Sep 2026 10:26:01 +0000
Received: from mail-pz2-x0d.google.com ([2607:f8b0:4864:3b::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bDU-00000001gcE-1Efl
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Sep 2026 10:25:46 +0000
Received: by mail-pz2-x0d.google.com with SMTP id d2e1a72fcca58-8692a8568e9so2334080b3a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Sep 2026 03:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789986343; x=1790591143; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b1J2ZuX47pvRKc6yxdNr+hnj5FMRU4oVdsCq83VAYAo=;
        b=adC5BXX77mh4fCug1QvbJonnHvBogNmIuoN5Y5ykFRG5/z3YZMy8c4iKpslio7lW2j
         42oSrUyaFbZJy79UC27xNNzR4CFtNX1AbRr6CjOShMQGU8OsPI3IloSu54E7Yvzh/IqC
         xMA9FyuyIsGXfIOIAQPb7X3UT5wCqkfi9YkSJPehNxuynQoEqodhcVLnioW4mNNqSpxJ
         0zogtPHLqHF5AsMpsFn6NNoXZIz5Nkija4sZc24zo4c7TfYvIGBPT4/u0c+e0sxGtIZ4
         clYrW9l/dLzooBkVY6xzPb2b99M4t8lvY60HosOT43jJQiMEBsGJf5uNKl/htG8mRCAv
         WxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789986343; x=1790591143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b1J2ZuX47pvRKc6yxdNr+hnj5FMRU4oVdsCq83VAYAo=;
        b=IjOTJ85iLyU9HwY/36rmZmw6FZopTrh27IdlgbKOz1p1FpaVOgVMrXCyktNb2BofbE
         dVCWCz+VrPJW4OCQanv4ki/4KfP8W4b2gZibxYYXPhqDkfd8/Ms7UDq9EQjjTgYrWS+W
         fJwjh7LvXL1/7gsMKk1yyGZ8lXT0YVfm9St05smm7bL8moGIeXyNwPB3KQHZ6oRLH6T3
         Ss7hJ7aPDNlnmIWWvevKgdZykYEsVXCwCrFS3hTVBgcGiECFsj3DjL4vXR+K+P0DAym/
         a+6LUhdsB5mvVNM7AGMKOdHsSqdMPsZi9nQsujR/pc4RXX360kkpIVibCSSM+1Ja91H7
         UxJg==
X-Forwarded-Encrypted: i=1; AKwUvBxHQ3X9Nd7/5a0mqi8Q+VuEHZFBzKCMC4eA6dkdrDachDCD2Lan2hcX1E2hZLelb+PtPHtJjNzajOoNrt0VWw==@lists.infradead.org
X-Gm-Message-State: AFuF++n0iZAePAHYEmASVclzyChQij4VOJXq/HVSwCaqOJ6z96/6aqI3
	aYWT0qW2nwaHaTmc1k8/Fc2fFt4p8Url38ubFXxdMisYJmOOZCsKFESp
X-Gm-Gg: AYBFou0wrm+pO7CgQ98UFgBom6tJ2sSfJYKqHXznddY9711U4xeOnMGMoE3up0eV0on
	slLoFgyd0pwFpoFFo6CnUoWAaf6OTa5B06MVkYL+Ht7opARm6FRKaJFuiT+6giFqnFVoUfWVjEa
	FPAVh6ADaSlPatfNElvcrGbc+B7xd3A8nYwgGf01uPTeofmLwn/SXjy97CbAHigztFP87Nf3VzP
	9sIemKMlg8tnNaX5yhPC8gf27SoeUGv9L1w8ukUJc/RT2VLDRREOl1z1lwhdemM0w44cweAvnJc
	0RbygM6EKBLcnkey/UoqXNvxPMn1BMWLtOS70rfWN2P+C7myBLpZVaJaYgWQLeTlI+N6VFXPooY
	mitPHiFvNMArbGxYrihQW97ogBCL9sOnUP5HoqA3LRARUrQp0JxYxCr0Yxj4OFh3+66BIMZMyz/
	diUrDU86Am+ebUKPal5PtSdEJeAsY7xP5kyANYTsCpGiELwDSoi+OqSLpDkk3e2d75vt/IkKQmw
	OtaH1UCi3ZZttEAT7F/wIagkjU2oJR/QxXKRIY=
X-Received: by 2002:a05:6a00:2d26:b0:857:72f8:dc98 with SMTP id d2e1a72fcca58-874dddfe1ffmr14902028b3a.25.1789986343595;
        Mon, 21 Sep 2026 03:25:43 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f238csm2909174b3a.21.2026.09.21.03.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:25:43 -0700 (PDT)
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
Subject: [PATCH 5/6] clk: mediatek: Reserve missing MT8196 MDP clock IDs
Date: Mon, 21 Sep 2026 19:25:21 +0900
Message-ID: <20260921102522.1640072-6-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921102522.1640072-1-akkun11.open@gmail.com>
References: <20260921102522.1640072-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_032544_478994_3A14A2E6 
X-CRM114-Status: UNSURE (   9.99  )
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

Reserve the binding-defined CLK_MDP_SMI0_SMI and
CLK_MDP1_SMI0_SMI IDs with dummy clocks in the MT8196 MDP
clock providers.

These clocks are not implemented by the current MDP clock
driver and have no known consumers. Keeping the slots occupied
preserves the binding-defined ID space and prevents out-of-bounds
accesses in the descriptor-based onecell data.

Assisted-by: GPT-5.6 Luna
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt8196-mdpsys.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8196-mdpsys.c b/drivers/clk/mediatek/clk-mt8196-mdpsys.c
index 7667d88f0eb0..2d8997d34201 100644
--- a/drivers/clk/mediatek/clk-mt8196-mdpsys.c
+++ b/drivers/clk/mediatek/clk-mt8196-mdpsys.c
@@ -66,6 +66,7 @@ static const struct mtk_gate mdp1_clks[] = {
 	/* MDP1-0 */
 	GATE_MDP0(CLK_MDP1_MDP_MUTEX0, "mdp1_mdp_mutex0", "mdp", 0),
 	GATE_MDP0(CLK_MDP1_SMI0, "mdp1_smi0", "mdp", 1),
+	GATE_DUMMY(CLK_MDP1_SMI0_SMI, "mdp1_smi0_smi_dummy"),
 	GATE_MDP0(CLK_MDP1_APB_BUS, "mdp1_apb_bus", "mdp", 2),
 	GATE_MDP0(CLK_MDP1_MDP_RDMA0, "mdp1_mdp_rdma0", "mdp", 3),
 	GATE_MDP0(CLK_MDP1_MDP_RDMA1, "mdp1_mdp_rdma1", "mdp", 4),
@@ -118,6 +119,7 @@ static const struct mtk_gate mdp_clks[] = {
 	/* MDP0 */
 	GATE_MDP0(CLK_MDP_MDP_MUTEX0, "mdp_mdp_mutex0", "mdp", 0),
 	GATE_MDP0(CLK_MDP_SMI0, "mdp_smi0", "mdp", 1),
+	GATE_DUMMY(CLK_MDP_SMI0_SMI, "mdp_smi0_smi_dummy"),
 	GATE_MDP0(CLK_MDP_APB_BUS, "mdp_apb_bus", "mdp", 2),
 	GATE_MDP0(CLK_MDP_MDP_RDMA0, "mdp_mdp_rdma0", "mdp", 3),
 	GATE_MDP0(CLK_MDP_MDP_RDMA1, "mdp_mdp_rdma1", "mdp", 4),
-- 
2.55.0


