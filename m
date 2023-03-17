Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C1CC74A5B
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 21:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GPpFzY0H3ocypf25nzBsMZcz2jHpyh97I8lhoOmDtHQ=; b=NqC1Dc14FaHigz
	0sgst1uxjdxsJ+Pmu6oThm8TQOBJ5Y7e46YVMwiNXZO/sVrBsSklG4z/XcWiMJ6eK0MoyygTM4nt7
	loAGSgEDCLarWnAjA5GsSYX3g9UJuAAWfD7+P9Vjip+hM+GoPoukmUuBR5ISLVWT7hc+BuKToPKCn
	Nkuk1diIi7cRqV7rU87QfZJuUqL3UpvRMrsGrOSy9Gl3Kb+tIjhTVkTmd8F/8FHpLO3ojClq8+Xcw
	byT/tBDUHrQhVkl/B4eY06U5flpND+FSa7d/5UwqUtmLHqe0Iogs3qnEG6+BdUKmcReHSRSGnYS2t
	6DQTIMI2xlsXGChRgbJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdHea-003Rww-30;
	Fri, 17 Mar 2023 21:30:24 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdHeY-003Rvi-2Z;
	Fri, 17 Mar 2023 21:30:24 +0000
Received: by mail-ed1-x52a.google.com with SMTP id o12so25376673edb.9;
        Fri, 17 Mar 2023 14:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679088621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPpFzY0H3ocypf25nzBsMZcz2jHpyh97I8lhoOmDtHQ=;
        b=Oa1shaEabrkzIwGb8LHYQAFL4Ho6oDqeN2TfX7YQ2U+J6nE9MJnwxk8BJXu/Yz7QrR
         7y4b/1bBpU9uhFTVwl4aWiA/sjp7Dng38gIR2xBRj6c36Tvu0R3RcnKdVQrivH/plen3
         fMVh5DVPROQHh7Q9m7pRrOTRKAGzZPVymRJ938lDQtpMLljFcx3OZrkhJgsosj2Qdkn/
         SUTuqYHb6E+DLx7D9cm13g3Sm4ywaP7+gaBnmweMm7BRPWstbU1Hwe6zxnmNn9hC9BQW
         smH1zpvxq5MnPxx1x0pe0W+V988tQMmRuvKrQ5d3RsrL7F4w9XPwhSkP/8tElKFliT6I
         DVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679088621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GPpFzY0H3ocypf25nzBsMZcz2jHpyh97I8lhoOmDtHQ=;
        b=lpXWiuTLjMVOnnBrbvOrFr4qYm0xQkLl6jMoNNLsq2tckZrgQV6maClwCrds5VQqXq
         b/t5ABQM3ISSytY8c375alNSQdEO/v8klN6HnVsMXuwy8qVo/4fEonrAzBBEfP0vQ2Wc
         uJ1SejMzlVGrppbSvdPjPXGYUxYcgoj9oVP/B3KAE5z8RheBSRFARi8Pk5uGss7l2tFR
         ZnJxKan1hDHe8uxyXxJQv/TbdKLNX6IUw/yrndDG+983RQzfxBcbGyh0FQ8OClSiw8T1
         n3fy/rhLq5LOKgFhU4MmcJG2KR5joCcgPTag4tHcNEKD4xuT7W+qp2sOzgF7yObkcIlp
         veGA==
X-Gm-Message-State: AO0yUKWzzlrOZU6m8oRRCwcP3YtjpNrBaAGAkncnigBBIg7bSNO2TxNg
	Af1dGo/Q+ueK2zCj35hI72w=
X-Google-Smtp-Source: AK7set+tHHmi6qkolpcnuJDFVW4c6/ogWFo+Kv7rhpvUnOMQvShD3seRfaKPclm53t3IOgVIbOkX8A==
X-Received: by 2002:aa7:cfc8:0:b0:4fc:73dc:5def with SMTP id r8-20020aa7cfc8000000b004fc73dc5defmr3832240edy.41.1679088621453;
        Fri, 17 Mar 2023 14:30:21 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id v19-20020a17090651d300b0092b86d41dbasm1404683ejk.114.2023.03.17.14.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 14:30:21 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 02/21] pinctrl: ralink: rt305x: add new compatible string for every SoC
Date: Sat, 18 Mar 2023 00:29:52 +0300
Message-Id: <20230317213011.13656-3-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230317213011.13656-1-arinc.unal@arinc9.com>
References: <20230317213011.13656-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_143022_839457_027F8B8F 
X-CRM114-Status: GOOD (  12.73  )
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


