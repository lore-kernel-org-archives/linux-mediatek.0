Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DC7C6FA99
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Mar 2023 13:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oyfZXZKB4+wMo+MDBbIp2+KcuCWmp7jMlDdmZzcv/lM=; b=G++Q1UHpf0rjk60BtenKjd687l
	exXzXshcpR93AVMyvA8JaXrml3FUcGI8rwXJATk8TPrVf/aiBYGToTlJB5QM20vSh8yzasuhA4Ph6
	3buby1a9OvXnsfDkCGZa6GZBepQkdqxE6or0rSWE1De3fUgwOjfs2q9GoSkry+SSmujWUTmK4t0D9
	z8K9JX/EvjiCQURpf9SGy+gszsZOam43xViY2EAjRuieTqs3LVK7UfU9zX3Eda6LM+mhmF5YNGj8N
	9x9rJpSkC/vR0xJX6xnOHX7JDzFbMhvc80wYV8ZcjHwRtQqumtiZTc+x6JZ8dN4Rme8+XIeg/wBr+
	Tdvnwnpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLqL-002RqF-Nl; Sun, 12 Mar 2023 13:34:33 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLoN-002R6l-Q2
	for linux-mediatek@bombadil.infradead.org; Sun, 12 Mar 2023 13:32:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=oyfZXZKB4+wMo+MDBbIp2+KcuCWmp7jMlDdmZzcv/lM=; b=L2qq2ZnnJufG2hqPDHSMVXn4aj
	8kp2ueLqAJ4k4eorwTEsPuonf1tytXFs2lksTYq9LRWHB0fIz3ngPPIrVW5DLFlf3PocjFxDxk1YX
	YjpMArhNrDrFlAlW+e1f5z40f3PRksY4vsDIZM8UGvXd9bNcG42EHn19JleiOpQAADYJQVnBmhByl
	cV+HMk31GvqtFlspBgBggEMcXTCiVmHplvp5j4tn7g6E3/IIkuJgbLfhGB4iI5tXmUKniG93hcLHV
	up/t8Rw6xFt68PnDlcOBjIhw4Uzu4qcEvzzVlPwS1QYlkq/1BDOjowQNo8o/Pmyh8d5gbkatpZgtw
	YKE5OCMg==;
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLWk-00B3fc-FQ
	for linux-mediatek@lists.infradead.org; Sun, 12 Mar 2023 13:14:23 +0000
Received: by mail-ed1-x530.google.com with SMTP id y4so9046800edo.2
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Mar 2023 06:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oyfZXZKB4+wMo+MDBbIp2+KcuCWmp7jMlDdmZzcv/lM=;
        b=Vy9duYu5oml7kBElCY7/Pz9DoA06T0NpAzoFB/8UDRZyaoC1RpIJ1UG/pwIgekC2Xm
         yYW/KxCTuRHcGby/RdJBOs8FfozWHhANyCcxDcfPAptsunxdi4xdisq8hxE/EovjxMxx
         WjByu21a8DRYQ5vQ5rjtppMPmTA3YfVs7EfXHLOyMmvOw/czvNHgWfZxzwLoODRI5KEw
         vNanwMyr9B6tnUqhDIuZmnrX5YVE2IR3o04xY7Cs4tE2w9Qz305VEEdxXyxoLSTvTBjY
         Yy1omhrkhMUHIvMWUnx/Ay+JP5uqpp8jwJihgHxxCnFFmOGcACEyvVyl0XheIj0cDejW
         35+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oyfZXZKB4+wMo+MDBbIp2+KcuCWmp7jMlDdmZzcv/lM=;
        b=V460f8kMB5Z3xF5NyyTKbfEzRy2vU4Ci87bI+57R9ChuwHgMkIVC8gByCiW/lCuQc4
         Kkxmc6g5pap5hH/WbWSSka/JjprN/g9xD9G9ICd9BLgi+OxxFGEsWNxwDIsbZGaYpnWf
         oBlZ+eU8JNjRvgOnJUQMy0sAun88H8kTFe7GICsjPgvbHr743sR2b8ug6g9vX08hW5QS
         jsGr46etBZlRgGsYvgiN9fC4jYbHS5NrUIFnIJL42ow4BFhMamVEjlPWdVSA1bZmu16v
         1obLDeSWRcdtr0pBb5NdkXK1GzezoEpfoqH8LGxP6VhRNl8a3qaJuJLSX1Q2Z/ogzQ9I
         EhKQ==
X-Gm-Message-State: AO0yUKXgENP31EDKzpgmfaB4BF46e1q+VXXhqW8VimwgyzmrZ2GZ/WcA
	Z/KeSMx0mqqiasp8wbzKEhmq8/8f4whGIeDo5a0=
X-Google-Smtp-Source: AK7set89zg6fjfmD/Q83CKvXo7fQ6g/JeQCzWDXtSGLthFDWRFHtX2ThlhUxvw+IDwH+wYEhp3Ys0A==
X-Received: by 2002:a17:906:5284:b0:915:fbba:2e0b with SMTP id c4-20020a170906528400b00915fbba2e0bmr18851554ejm.58.1678626858623;
        Sun, 12 Mar 2023 06:14:18 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:14:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Joe Tessler <jrt@google.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Wenyou Yang <wenyou.yang@microchip.com>,
	Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sean Young <sean@mess.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 28/28] media: dvb: mn88443x: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:13:18 +0100
Message-Id: <20230312131318.351173-28-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_131418_989375_5B843514 
X-CRM114-Status: GOOD (  12.22  )
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

The driver will match mostly by DT table (even thought there is regular
ID table) so there is little benefit in of_match_ptr (this also allows
ACPI matching via PRP0001, even though it might not be relevant here).
This also fixes !CONFIG_OF error:

  drivers/media/dvb-frontends/mn88443x.c:782:34: error: ‘mn88443x_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/dvb-frontends/mn88443x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/mn88443x.c b/drivers/media/dvb-frontends/mn88443x.c
index 1f1753f2ab1a..0782f8377eb2 100644
--- a/drivers/media/dvb-frontends/mn88443x.c
+++ b/drivers/media/dvb-frontends/mn88443x.c
@@ -798,7 +798,7 @@ MODULE_DEVICE_TABLE(i2c, mn88443x_i2c_id);
 static struct i2c_driver mn88443x_driver = {
 	.driver = {
 		.name = "mn88443x",
-		.of_match_table = of_match_ptr(mn88443x_of_match),
+		.of_match_table = mn88443x_of_match,
 	},
 	.probe_new = mn88443x_probe,
 	.remove   = mn88443x_remove,
-- 
2.34.1


