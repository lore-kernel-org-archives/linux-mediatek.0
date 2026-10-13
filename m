Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F26CCC6B19
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2026 15:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DldAa+NtWBY2ZHtMa/QGhrtb5Vlsja4TWpwxlEVTD6A=; b=N3jMVQl9n4iz3ymJD1ZPkJH6Ry
	efCvS6WIndM6U3Hpv/faM4+AkGsXFPpOfYc0F1KckftZfi2O7psWYAX6oOvmA5qDV1bNwJYI8Ki/N
	gBkUqd9K/bq+IUr8SF5OzrVegnVx45XDqZpigrzQwA8EZIQ5OMo4HbXHcFchaNQCABZf9Telxzc/C
	TVDFrXfx5oRUqyja+STVDyeSIuJ6366Piv5sV/ruR6EprAZQiv+UVIgjqB4XwMYhQ49R+miVazCQ/
	hH83zdCx/2YNvCDTp5n06kKInNBWBIgN7MKmh860LrV4K6KtR0v+xJNAGSZd83Mp14o0DsVNiEo7I
	d5nWkMpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeHP-0000000DGij-1lmT;
	Tue, 13 Oct 2026 15:19:03 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeHH-0000000DGXc-0MaU
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Oct 2026 15:18:57 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-cd5c9e52398so1271398a12.1
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2026 08:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904734; x=1792509534; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DldAa+NtWBY2ZHtMa/QGhrtb5Vlsja4TWpwxlEVTD6A=;
        b=gM3OPJgHRDMT3WwLsSNK4piqOY0auN9gDt1sSUmTPs/6ACCXUDWA/rlvqq2KfecCQZ
         J1h4cPjF+5V7oAA0oC4ZyCb5SJtb6m4Q0KRqS1QjOw6GZgSj+W2p+cGI21uIik0tNif2
         ZTL4QWt80eG/h5rWBj7qqnN0zKUz5vXHh3fqM48l0bvzs+3AMTGaavBRRW8qwec9rypE
         ZXkFSD56sthwGmqcxxQVb75jmRcP2wha614PocbQZ5+r/MeobvQoEC/m8K9rMsCoiX+g
         QJiNRDOCABGRbDIypEspWfE+4iPhKUlJgIHFtkFJjI97gWwuQprpuseD1W3gW114Zpev
         21iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904734; x=1792509534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DldAa+NtWBY2ZHtMa/QGhrtb5Vlsja4TWpwxlEVTD6A=;
        b=tsuAQdO9JDMpPZdLTtThVTjasEsm/ezd34YIyM5Ls1Did0/JybHBi71/eRcNlBBKvQ
         ZPwQsRGK7wWQjrA2CO5CLwKZwHX0+59CdIu7hiBQA4uwi5smjepRC3HAfQGGPLtMjUWw
         cRrW3XrqD6pV0JQZFwE6Nbxx8XIBIcTS+4V2lJnUnAnXG4h5zxuzmrrBqLztt00Gmtxj
         G96VRxyRxgRtSX5b0jC342JlMiu5dvoVrgkErPVPtohCBhxdl+Kz9Medyg65WjmyBs5b
         3W3PAxtnWlePrLOaiTFtSd1JOwS9mRKiQNyM8MuJFBkuDWk6AMmUeiBtXdmRcHFewSQH
         F91A==
X-Forwarded-Encrypted: i=1; AKwUvBzw5RFJnUs8cxmR8+C82O/5GfB3IeFuvY77HZRRBo2pbdxqWKjrG8zTBzwOAXD5nkqKU/LtaqhOZDYuQ4aBLg==@lists.infradead.org
X-Gm-Message-State: AFq9FYIgId+Q0t+EnBklkR1bnIwO500IZyy5Rx/FwPLp7AAlZWF8l/AN
	0/XEzX0qQU5XE1MDq77+mduS/plFSxhr06kCdpfbgFvErkZ1Oo00eVQr
X-Gm-Gg: AYBFou10WhXoGLLbycJ9QhFvZM39sYxFWe5mvtBIYZGV+spcY470MpxJB9yrbEmtKZn
	8jyJe9BmU6w96PqOe6KltuDVG7cGlVXLGS3iTUyHVEJiUMIFjje0iseD0AvIB7qGBt4FAOWYogH
	jT/4ycmqRnQHfYbCjb90liYweRQTlf5RoRgxpD6FuXN4rVD8gp6vqUT7k0Pw8w8L6j1Hza3FmVQ
	w+t6mkxkV9xvX8rZhQm1iQ2z3FZDz+K7DFYs6I6H5iKD0UrXBLo8pCDsZQwgm6z+jmqoYThON7Q
	cHkEgkN3OgQ1ubbx2XKvEIRRGhVon7xXz5vVYyqOMf0KJdK0RJLNXJ3IxB5WfgvwtvRoyO0dMd+
	ZoGcwC7T8eablo0GX0AmuTtprEuxY5D9kwQbes/3lMdThgNHG1GPLfKLRIN1tF0NXmL4FtwQ2Z2
	9JcZoSagYtj61bhm3v5iR+bucYU/iCyuqQ7ytGqAZY4Mv7XDCvOahi0OAwOnc05i5G8wrK0UouQ
	tQ/++ihtvYjPy6fu2btLy++jz5n
X-Received: by 2002:a17:90b:2d86:b0:3a7:d2b5:2e99 with SMTP id 98e67ed59e1d1-3ab3a60d1eamr9892006a91.20.1791904734175;
        Tue, 13 Oct 2026 08:18:54 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:18:53 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Miles Chen <miles.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 10/35] clk: mediatek: Fix memory leak in mtk_clk_register_gate()
Date: Wed, 14 Oct 2026 00:17:09 +0900
Message-ID: <20261013151734.3177690-11-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_081855_141056_1924DB17 
X-CRM114-Status: GOOD (  13.61  )
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

When a gate uses the hardware voter ops but the hardware voter
regmap is missing (e.g. the "mediatek,hardware-voter" phandle is
absent from the device tree), mtk_clk_register_gate() returns an
error without freeing the mtk_clk_gate structure allocated earlier.

Free cg on this error path.

Fixes: e504d3bdb3d0 ("clk: mediatek: clk-gate: Add ops for gates with HW voter")
Assisted-by: LLM
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Newly introduced in v2.
---
 drivers/clk/mediatek/clk-gate.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
index bd2fcd489a3f..0b1389993751 100644
--- a/drivers/clk/mediatek/clk-gate.c
+++ b/drivers/clk/mediatek/clk-gate.c
@@ -221,10 +221,12 @@ static struct clk_hw *mtk_clk_register_gate(struct device *dev,
 	init.parent_names = gate->parent_name ? &gate->parent_name : NULL;
 	init.num_parents = gate->parent_name ? 1 : 0;
 	init.ops = gate->ops;
-	if (mtk_cg_uses_hwv(init.ops) && !regmap_hwv)
+	if (mtk_cg_uses_hwv(init.ops) && !regmap_hwv) {
+		kfree(cg);
 		return dev_err_ptr_probe(
 			dev, -ENXIO,
 			"regmap not found for hardware voter clocks\n");
+	}
 
 	cg->regmap = regmap;
 	cg->regmap_hwv = regmap_hwv;
-- 
2.56.0


