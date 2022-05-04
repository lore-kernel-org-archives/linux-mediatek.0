Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE70C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 12:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xr7aSIe0sGjg/Qtsy/Ol+Q/Eg1dmvZ4QoamMybXoRng=; b=Ocx2+YTz9r5D4w
	rWVsm8ExFdk72RySxoOy6BCmatbfGzalXnBSTb4KDuZDiPTJRQyBeqiKYnjYcihCfX05xDVOGVKU7
	aZ8soS60ejy+nYHsxAF2+n618nTbfLg+QzU1Vd4dYA3gHp6VVjtyA31r9Ygj8aaFS8ZKlRXobjFhU
	D9XsWAGw34jJIF5avibTXtb5xnJrIMBGW46AETNKALgGEm4VN+UGN2nKADCYtoKqrWl9w8X6r+2RH
	c4i2//S2jmDBFfItFLlJllu+IbYKjaEso+S8zSIRaDDa4PK1j3rO0Y8RQT1aU4bPpERyjF2baw9aO
	qv5sMQjovfsDAtoMz8Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmEDP-00AkaP-65; Wed, 04 May 2022 12:34:47 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmEBc-00AjP9-B8; Wed, 04 May 2022 12:32:57 +0000
Received: by mail-ej1-x631.google.com with SMTP id l7so2615682ejn.2;
 Wed, 04 May 2022 05:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PUVxfJrhsniJtnQ7nz0gUaC/9RR8AYztqQ8GdhvVU68=;
 b=HEJn9ahozroDJ2MNeRspCwpjwGh54adJdjlEW5nC2Z4kGL8cZKo2DhcvGKBTAJSEq+
 R1crI71Geo4C7IwGhUVxJLo/jffNS4jwOcK8ynC95bgwCQlFUVbpdfFsMBZEc35eUUQ1
 J7pfHqMr71Ju+L/evYzQBx+CBku6/iL+J2uSxz6mvXp4033IYEYHhB6FqhK2uBNssh4p
 uIch3cnITzd7PoJ3rC+LV8h284zjM/qVws//9XfPYbc/CgAlSygl7IPwy9wmVGCHrnpZ
 WwEfAC/WMnMeNGvwUb6bJqeEUlast7AGBB2VWksrXwsnt72Zy3hbGoqEtE4mzNYrUUS0
 iB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PUVxfJrhsniJtnQ7nz0gUaC/9RR8AYztqQ8GdhvVU68=;
 b=I6hn77aHWsUfnFv9cQ302ScixHWzVGqkkzcfyvK3LjVSxqhFCtY/USTCkA0/BB3Y25
 B6rHUokOVQ4PxaXo4yasop3hGQX5TFLOzk97FVuZ/s7NpkDAREtj+ZnsdDO2NWly9FyD
 ouTx1kK0rAEnSVoadLZxn6n3vb6Cicg8LNuLbL7KRytst7ayDU2C3o6vxfb4jiDlaRY7
 yIeyWOkt4B8lXqYf3OkC383W1S97ZToH7TD4EIr8zI0EMu+eegJIKmewgTNo1vT+cWdC
 vuuDcUEUcGnBkG5O6QJFoZtJlWWCJyoCmRJOiogwfFiWUCBqPH7lE7BxkrrGvvCJUcnv
 OcfA==
X-Gm-Message-State: AOAM533U12gA8KlM+CUFybLyO23hoQqSySDmxenxBRpIumsEtSp8FVDi
 R6+wA68gNBa/mSqqqjoY9pE=
X-Google-Smtp-Source: ABdhPJysMRSbHfcoJzQlOOSojNDvkOkjioWOUaFZqOEhre5gzFXjpjw3ryjINkEIAXIBd/cSPm5NNw==
X-Received: by 2002:a17:907:761c:b0:6d6:e553:7bd1 with SMTP id
 jx28-20020a170907761c00b006d6e5537bd1mr19590051ejc.5.1651667572462; 
 Wed, 04 May 2022 05:32:52 -0700 (PDT)
Received: from localhost.localdomain
 (185-177-124-12.hosted-by-worldstream.net. [185.177.124.12])
 by smtp.gmail.com with ESMTPSA id
 ig1-20020a1709072e0100b006f3ef214e7asm5688693ejc.224.2022.05.04.05.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 05:32:52 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 Yassine Oudjana <yassine.oudjana@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Weiyi Lu <weiyi.lu@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>,
 Miles Chen <miles.chen@mediatek.com>, Sam Shih <sam.shih@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 08/13] clk: mediatek: gate: Export
 mtk_clk_register_gates_with_dev
Date: Wed,  4 May 2022 16:25:57 +0400
Message-Id: <20220504122601.335495-9-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220504122601.335495-1-y.oudjana@protonmail.com>
References: <20220504122601.335495-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_053256_469143_AD9E8B7A 
X-CRM114-Status: GOOD (  10.49  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yassine Oudjana <y.oudjana@protonmail.com>

This allows it to be used in drivers built as modules.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 drivers/clk/mediatek/clk-gate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
index da52023f8455..8af907b82f8f 100644
--- a/drivers/clk/mediatek/clk-gate.c
+++ b/drivers/clk/mediatek/clk-gate.c
@@ -261,6 +261,7 @@ int mtk_clk_register_gates_with_dev(struct device_node *node,
 
 	return PTR_ERR(clk);
 }
+EXPORT_SYMBOL_GPL(mtk_clk_register_gates_with_dev);
 
 int mtk_clk_register_gates(struct device_node *node,
 			   const struct mtk_gate *clks, int num,
-- 
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
