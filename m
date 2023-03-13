Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2483C76195
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 21:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GPpFzY0H3ocypf25nzBsMZcz2jHpyh97I8lhoOmDtHQ=; b=R9QtnhfsFebiEG
	FKhqcwWGkqYuiU5KYiQpJdFG8fjRNZ7rtDNukLrGsPgTlz4Vt3HuRcjP67wk+7mfwM2jswlQOYKUC
	AjUbz2wCaaZq0+zjt1Y7SIIf25ib/Ma0gwvGuqms8G3p9zENMHb1tWyrXUgm1iH64ftxDY+TX3auP
	OgEzgThaviXj74mhKf4SLgyLziFrWulSQfJ7ZO93AWhNS01CnFWOiGN7qkmVjHIgX4ADi+P4y2Cyx
	U8fSVfG13ODBidKGXWEQIb2u6+ZznEOEP2s73vyJc7DGyatslOOoW4szZTOoU8/BmJH+8I8i9b+Do
	otn7xEvseHj2g4qoIa2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpHK-007ktT-Hj; Mon, 13 Mar 2023 21:00:22 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpGx-007khb-KI; Mon, 13 Mar 2023 21:00:00 +0000
Received: by mail-ed1-x529.google.com with SMTP id cy23so53927821edb.12;
        Mon, 13 Mar 2023 13:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678741197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPpFzY0H3ocypf25nzBsMZcz2jHpyh97I8lhoOmDtHQ=;
        b=OHbagyg5bjoVCvA1hrlo5J1nAhIBkYk4wwpEghya4UrayOuB7UPK30gEC/jjivdhEQ
         xflR/CW8VYKLUAuhmaIsrCVEUsAhfzk5BT4dSLMJ4F4wjE0s1ecLWA/PR1UK7Iewxv0t
         RsfCqVU/p+xVNZyQXsSghzAhnu22KZHSbj918dK8eIbXI1d499psPnXipZnQPyUImJU2
         en8D3NR/740e8Ok1RP5cCAcztQY9Wv59n2p9z0dXxjSEOc9kMSx3q5j8Hoi51LfqcDc1
         jS+M1Uo4I21dM6n5UY71t2VHBoMoAobD4eOBriJ2WSU9iqenAnck/PMR8VqaeFs4w1cV
         DpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678741197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GPpFzY0H3ocypf25nzBsMZcz2jHpyh97I8lhoOmDtHQ=;
        b=VSLN8BCnHC9uzLK+R6SADu/9vr5ysW+3tXieSZzI8EKuQ7kWEL+pIS7c8GaU6B1rqf
         jQtAFwnIgAkwbZacOeG+48z5p6E2vNx/TTDMHGxLaTms28lLFMOZL0KBmN+nvMKCwwfb
         MEgNQGOBq+FQuzEp9vCLJbOqHzQpHdnNyUrGtmZOeiJNqgiOj2ZZMNuIdODrY4jH8obC
         Uu1xmj6xg7y11DJt5dODl7meISDwUeJP6AweqSY7p2AAyZb6UAXF//s5pcgEGlAGTK1f
         GvLMaom55SkoxXSwvaGZsUkQihjxhl419qPHA85XBwjKg+SeX45OVQjE75JeKMkMnfhy
         kmOw==
X-Gm-Message-State: AO0yUKXPI9TijheOovvhhxGXpypviFaxPlzebLRyaZd03Tv8OQC6kJyp
	oTH/hByFDT4m40nrBoKXOB8aaNA15kE1nDDi
X-Google-Smtp-Source: AK7set9icf3Izry9u+GElnyac3XCLodvzYP9CrmqTou6BbTyanMvqHTnSw5zFhiuwRjnmYr5BdEksg==
X-Received: by 2002:a17:906:eda5:b0:927:6e70:e245 with SMTP id sa5-20020a170906eda500b009276e70e245mr6281060ejb.63.1678741197194;
        Mon, 13 Mar 2023 13:59:57 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id j11-20020a170906830b00b008ee5356801dsm219853ejx.187.2023.03.13.13.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 13:59:56 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 02/21] pinctrl: ralink: rt305x: add new compatible string for every SoC
Date: Mon, 13 Mar 2023 23:59:02 +0300
Message-Id: <20230313205921.35342-3-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230313205921.35342-1-arinc.unal@arinc9.com>
References: <20230313205921.35342-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_135959_694135_F77BAC7E 
X-CRM114-Status: GOOD (  12.80  )
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
Cc: linux-kernel@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, erkin.bozoglu@xeront.com, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Andy Teng <andy.teng@mediatek.com>, Hui Liu <hui.liu@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Del Regno <angelogioacchino.delregno@collabora.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-gpio@vger.kernel.org, Sean Wang <sean.wang@kernel.org>, Daniel Golle <daniel@makrotopia.org>, William Dean <williamsukatube@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Add new compatible strings to make every SoC, or SoCs that use the same
pinmux data have a unique compatible string. This ensures that the pin
muxing information of every SoC, or a set of SoCs that use the same pinmux
data can be properly documented.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/pinctrl/ralink/pinctrl-rt305x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/ralink/pinctrl-rt305x.c b/drivers/pinctrl/ralink/pinctrl-rt305x.c
index f6092c64383e..fa3743c7680f 100644
--- a/drivers/pinctrl/ralink/pinctrl-rt305x.c
+++ b/drivers/pinctrl/ralink/pinctrl-rt305x.c
@@ -118,6 +118,8 @@ static int rt305x_pinctrl_probe(struct platform_device *pdev)
 
 static const struct of_device_id rt305x_pinctrl_match[] = {
 	{ .compatible = "ralink,rt305x-pinctrl" },
+	{ .compatible = "ralink,rt3352-pinctrl" },
+	{ .compatible = "ralink,rt5350-pinctrl" },
 	{ .compatible = "ralink,rt2880-pinmux" },
 	{}
 };
-- 
2.37.2


