Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCE3C6FD19
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Mar 2023 13:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sj4f7lJPyQLZUYqaER8NG8pmeutfonQX6OO2yd6udaw=; b=p6lGUn7DqDseeRAcYgyyVKDbb9
	f7bdgPrVcC2yzJHbT9cau79YJCIaXiauZNozFWIIiftCk4rG4Lxfw/eqGePFPTppXtfVIFaz11Hh7
	jI428F50YswKIqv9jcYeirZyhDAieuXCC+nuiSxwUj4CGV44N89sXnV8+1l3IPKp4eJv7DY4wdzLk
	54OcZDBbYPobZ/A0vVhFzay7C/xx4YRs7rWvrs0P+vODL1HfInaJxM21M5bwNx9A29daDu6+xDRoZ
	ZJGpSjPFXdC4BNN8X6oaV4frVhaEoGx321MiNaD0dbiBPVZZtjRZejhp3QefwvuMRnUd3ZlP71gLH
	L6x3MSeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbM6l-002ZMN-Sh; Sun, 12 Mar 2023 13:51:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbM1d-002WcW-96
	for linux-mediatek@bombadil.infradead.org; Sun, 12 Mar 2023 13:46:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Sj4f7lJPyQLZUYqaER8NG8pmeutfonQX6OO2yd6udaw=; b=ovs9emqkGAc1F4UKR/qSsh1OIN
	XwGcLmqh6nFhEsVaVtlIKFOG0O+QYXt5s8x+9y0eZzvaf7t9YMcNWk8m4vA3NfRl0XJF+NcZiDjxl
	qcR/OQiK/XEUScD4a0txNnwK8BUp9deC37/M8RWqEqv/gYgKcp45gWS3cNRALMGROrKwiDUbf11VC
	Qy5ssSYLJWXvb6/HIEO+d4vwkfmQtWaBtC+6w+mDkue/qZzkLgXcuNYUprIhTn/lB2UJOBLr9idBg
	UakYXdRbQczOiMGZH7OZVKdSdZ+gFMXC5Lvb8FVPsufZYTD0pz3Ctpc5VGl3vLVwe7AJrBzx3PTt/
	byJujBQg==;
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pbLWB-0011Ec-1J
	for linux-mediatek@lists.infradead.org;
	Sun, 12 Mar 2023 13:13:56 +0000
Received: by mail-ed1-x535.google.com with SMTP id fd5so4617827edb.7
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Mar 2023 06:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sj4f7lJPyQLZUYqaER8NG8pmeutfonQX6OO2yd6udaw=;
        b=haj+KB/z1L8vJsua2o1vxxCHMhlVmbnayBqVzvMfHTJAHqgBLjuc/m6H8B4mzyAIUc
         62++ksMk1muzp7U2CtB7D9P7OT9ysYz5szaVXEfN0VUDh7fKa3EjKwvqTewvN6LY1vAq
         uKTmvbqcscSxRnCGfJgPFBVKO1QsrON6N8UYL/HmXesYNb1v6+H+yFTBF0epod9JGCNQ
         sopNnojKfIUzWOI7GKiySLHrr51LfhfDQYqJ93VkkJkXadH8VzeSa2sdUn6eUFC1W+Gu
         SmuQmjfkoayusufLq8/6NhHZyZBJHob0DzV+rM0eAmzL5eNCUGhmohmS7ijIcVRPEuYc
         oUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sj4f7lJPyQLZUYqaER8NG8pmeutfonQX6OO2yd6udaw=;
        b=P7UohjsRJf66K+0atd+AXSE7MJNhj3IKzpYiD6j4Pcyqw6/481jScsx0ea4NDi+Ftk
         mGebslNDPnep6v9a+uP75RKFYP2so/oNAI1KhEh098eOo/08pmquXpbbR8lGV5i6ddrV
         JvFSlvp0KgCyJv5viakUA3AnrJFbyuskdBY+bk68RmYgDr4BJmZ9WpGq1rQbli7teVV7
         mrK4GjEkzCNqh9h7+C2Ysu7kezvJMxPmhbJ85kwtzfXS4cKFy/sDcgw/tdxASTCdwHiT
         Gr6n5fzRrMZkk8YXggnrwF1k8sejiHIQEmRzI05wqoMNyflBffPakIQt0cLtHKdMHKpl
         0DTw==
X-Gm-Message-State: AO0yUKUdE1Kygsg3ZX7rsWorr3N6ZKZk4t2BY9egKjtF/6msQ8wSZ766
	6hjYUm9yZ2pIgSfAlCuEc/jdQg==
X-Google-Smtp-Source: AK7set/ermG5mPokgNtP87IO4WUZSbcbchCeAghNXlc5QJFzLjHi45cBPkYMiVQWjmGVImmiqhDubQ==
X-Received: by 2002:a17:906:4c8e:b0:8af:447a:ff8e with SMTP id q14-20020a1709064c8e00b008af447aff8emr28369686eju.20.1678626821501;
        Sun, 12 Mar 2023 06:13:41 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:41 -0700 (PDT)
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
Subject: [PATCH 09/28] media: platform: samsung: s5p-jpeg: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:12:59 +0100
Message-Id: <20230312131318.351173-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_131344_224173_553B7BB4 
X-CRM114-Status: GOOD (  15.17  )
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

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it might not be relevant here).  This
also fixes !CONFIG_OF error:

  drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c:3124:34: error: ‘samsung_jpeg_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
index 55814041b8d8..8be8e3596e07 100644
--- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
+++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
@@ -3166,7 +3166,7 @@ static struct platform_driver s5p_jpeg_driver = {
 	.probe = s5p_jpeg_probe,
 	.remove = s5p_jpeg_remove,
 	.driver = {
-		.of_match_table	= of_match_ptr(samsung_jpeg_match),
+		.of_match_table	= samsung_jpeg_match,
 		.name		= S5P_JPEG_M2M_NAME,
 		.pm		= &s5p_jpeg_pm_ops,
 	},
-- 
2.34.1


