Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA4AC982DE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2026 10:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TT5lRmym0T1mzXaOaX/8a6/gNfD3HTc1xl19TrAEELM=; b=JGY5TW5F61NmPp2mTblCjji+gx
	FnfUMII9ivWNevTr1v8kJXpSloe//rM7RXb6HK1R0F+BU3T7KL4Z3c18rIl19Zi18c9U5daCsRt2o
	5afz2QM1xxqCKzSWCcCfhmXr+W//xJ6dEvzSXpqVs8mEVbEBeZrunVfxwhRRntUMqftAVy27FaKi4
	OVbpphrln4OWACHENpxqrOlcrbmn31k8h8apQOWInBHML5F0sZU9u74BddPNIBYIzaBzG9HQS20nO
	Gx/RMc09u5TQtSr/LlhnpwyIh1OfNt6R2uf3/3RXsgSDo9L1O0JYfUKuS9+GbFsRW22WqFmedI2Wn
	r2Y7U58Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bDJ-00000001gVN-2dWu;
	Mon, 21 Sep 2026 10:25:33 +0000
Received: from mail-pz2-x0d.google.com ([2607:f8b0:4864:3b::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bDG-00000001gTD-3ZWs
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Sep 2026 10:25:32 +0000
Received: by mail-pz2-x0d.google.com with SMTP id d2e1a72fcca58-85469b2e1d5so2892777b3a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Sep 2026 03:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789986328; x=1790591128; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TT5lRmym0T1mzXaOaX/8a6/gNfD3HTc1xl19TrAEELM=;
        b=e5jgnpAh4VVbEfICKqyZDXGmXbO2xLXEJbi5W67ZguFD0j8KT8+8z4ajuP4Ef7ZEdL
         pps8kX23njl9sRq3oqvAOxwQDHfiaay8SRazbzo191vI+BCpBxTsOE4KSSA5iqVXgNAb
         fYFeTVrt7U60Itc9BVDgDZtpML3JbPgECGXQCrk7G6eIIa3uUOUVTktIUZCYuWxGR2qj
         b3ExXSRTbaYq5de478Psz79enWmXaomM0OgzGk0lhpnDPoL5xL05WIpvOk1r0e1cBRzW
         w3FT/usaT84Yo3iM3bN0fzFO0B0/Sj/RtuFOyagcfQen+jihjORkNn3vlmJwFx31a95h
         EohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789986328; x=1790591128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TT5lRmym0T1mzXaOaX/8a6/gNfD3HTc1xl19TrAEELM=;
        b=X+FLQNkkZrziC19RL15ifG5xWyI7QkrvrsRXW+RUZNbdctc/nVGIHqAoXpq27gNVGP
         u3IlVbpcO/YKm4Zc5ylyhpLX8uj3EWWxEES3higV2/is1azRNw13ouZf/J2b8QPBDTXh
         vKJ1kO3yLem9f4HkbYGQpMXdghpxnkcLDUFTQAZ6H10p2n1z/RKuzwyZyec4rpli0X+X
         te1jNAM1vdB3E9dKrg9/2WKLcldcpmEVJNDQXEZMGX7/Oz/iGA7kESXKbPbrWTzIXwgj
         RIcm1JOX920ydCbECc8IoKzTEi+DZXvCXaGYZ0o8UacUj3e1YxiOhzJ/IiYoXA7QgWBP
         d/yw==
X-Forwarded-Encrypted: i=1; AKwUvBywxyzVEaoyKAp8ycI7SU+uNMjdZP7ZpakxHqQAHtqKsw9s7/0s9/wfWypzXk8S9HKyRPSyAsIpu6B78whEgQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lkVQlTbNV/ZCwcvEohrQIslxoiCffHGmquzTgvsspm+zImquM1
	p5IExUnyIcwfIkRzDQtrdpmHDip1QIpvK8YtRQhS6CRr6Rjmdxl7Vs24
X-Gm-Gg: AYBFou0VXThsdMS+apG0NskU87XzN4RqX4cWNR24FK69yZQwvVvjICnxB0tMtuOc4rM
	BzZhymgGkXWg6ULRGS4F/lJTeKczc7rLvRZ4W3Je2zehC+1yoRxA9yW7OyZGJUVFVu4ey98Zdsn
	lo6I/X+tGotz5b2NLuD/GVdwH5U/BicoooP8qp4m9CwJ3IdDVkiu0zRoko14bKqYUHi8V2fUl+T
	QNoTJBYWiJi7Srvz+T7TUdecWB8UHBKinhwKpRkV0zfP0CPrgIrDDb26r+8FMEPREFp9fTb+uYK
	lniITjjHmPre5nHykFEUxZiFSBlBbBT7CWhlysIK9h7AfOUQNG4zSWclBPedpUFtRbp08VsWzPX
	TU7NuZo16YDSs7p+RvcLQA/crvPvEr7XwJ/Tq9KjwJ2mSUtcSMjxje4I2L4L1T0fg+pdyJIwwRt
	NzwLOCe62zrb1BwV7yA4OpEziOKB2PKJwjN/EIc3XTNbVCc5vCw3iv90IqXJGbaH25ISQFZhl1Z
	t+nAiF13oDEW0wQ3KO+c3ah03ET
X-Received: by 2002:a05:6a00:1911:b0:878:34e7:9a3c with SMTP id d2e1a72fcca58-87834e7a3a3mr7459656b3a.53.1789986328468;
        Mon, 21 Sep 2026 03:25:28 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f238csm2909174b3a.21.2026.09.21.03.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:25:28 -0700 (PDT)
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
Subject: [PATCH 0/6] clk: mediatek: Fix descriptor clock ID allocation
Date: Mon, 21 Sep 2026 19:25:16 +0900
Message-ID: <20260921102522.1640072-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_032530_919989_2A13A3B5 
X-CRM114-Status: UNSURE (   7.92  )
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

Several MediaTek clock providers have clock IDs that do not match the
size of the clock array allocated by the common descriptor-based probe.

Add dummy entries for missing IDs so that the allocated onecell data
covers the complete clock ID space used by each provider.

Akari Tsuyukusa (6):
  clk: mediatek: Fix MT6779 clock onecell IDs
  clk: mediatek: Fix MT6797 clock onecell IDs
  clk: mediatek: Reserve missing MT8167 clock ID
  clk: mediatek: Reserve missing MT8173 topckgen IDs
  clk: mediatek: Reserve missing MT8196 MDP clock IDs
  clk: mediatek: Reserve missing MT8516 top clock IDs

 drivers/clk/mediatek/clk-mt6779-aud.c      | 1 +
 drivers/clk/mediatek/clk-mt6779-cam.c      | 1 +
 drivers/clk/mediatek/clk-mt6779-img.c      | 1 +
 drivers/clk/mediatek/clk-mt6779-ipe.c      | 1 +
 drivers/clk/mediatek/clk-mt6779-mfg.c      | 1 +
 drivers/clk/mediatek/clk-mt6779-mm.c       | 2 ++
 drivers/clk/mediatek/clk-mt6779-vdec.c     | 1 +
 drivers/clk/mediatek/clk-mt6779-venc.c     | 1 +
 drivers/clk/mediatek/clk-mt6779.c          | 1 +
 drivers/clk/mediatek/clk-mt6797-img.c      | 1 +
 drivers/clk/mediatek/clk-mt6797-mm.c       | 1 +
 drivers/clk/mediatek/clk-mt6797-vdec.c     | 1 +
 drivers/clk/mediatek/clk-mt6797-venc.c     | 1 +
 drivers/clk/mediatek/clk-mt8167.c          | 1 +
 drivers/clk/mediatek/clk-mt8173-topckgen.c | 7 +++++++
 drivers/clk/mediatek/clk-mt8196-mdpsys.c   | 2 ++
 drivers/clk/mediatek/clk-mt8516.c          | 2 ++
 17 files changed, 26 insertions(+)

-- 
2.55.0


