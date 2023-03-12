Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23542C6FA99
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Mar 2023 13:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mjvZGlI9gqxKHJb6Zb5Fkc5S1/fsh/NgaCfi/T9v11Y=; b=R1j+gT2EAdkwGHuneAcAS5bion
	vJNaHPDHv8EbeUafJwfddylooOGbAa4ySMOw497N6r9ZLzOsL99w3jKfrm1s1/smhl/WvR92ma0vw
	KT62QDIfHUoAMDsDdUzeqBHzmnz2Qrmv/yHC/X1I/su3RuYH0Gp5Spy8cZcKvJvfvxWFJchY82S2j
	AtZ9DOLwwWMxLXFiwH74kBhhohEsPquiOLVr5fBX5uSM87LgeWDqvjBPAspGw5THHL9cSCl2iYSrA
	QmTYLHk4WEpeDQiwV14G1vsnOl6VsO8Pj0iPEjBpGQj6k/ra/wJ4MbHhfeWf2iW2J7oqz2raqJM+r
	is548Jpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLWY-002Is0-Ve; Sun, 12 Mar 2023 13:14:07 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLVx-002IMj-Ub
	for linux-mediatek@lists.infradead.org; Sun, 12 Mar 2023 13:13:32 +0000
Received: by mail-ed1-x52b.google.com with SMTP id g10so9626175eda.1
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Mar 2023 06:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mjvZGlI9gqxKHJb6Zb5Fkc5S1/fsh/NgaCfi/T9v11Y=;
        b=lKlYxxhYCKn0JxPwkYKx3vASmrkH+srcYSRHily2tzLUxFl3QklS8Q4NAB9udLBZho
         dDGPZTBINPga+76lbL33R0Ue0ftkVUUQLxJzi4w9KwBDni2xOXZwaZzbSux02prlPDHP
         vJ7nGGelocPKxiZAPsodErx2JPF3u6mnEqcDFc2Wm/P0mWtV1EylhbCj0fTAm6z6v6t4
         CdJ8Mm8qbbJwTOuhYW9bDTdnFKTImZMFdRSyvSmbjiOQG5UwzZqJrRtqjTlrTWLJdknY
         zHGpr1crUtQGblfLv3akSTMscNClIduQLP5C6mBhyVCwurXuWWNgdYQ93BE30x0tKpwz
         Z2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mjvZGlI9gqxKHJb6Zb5Fkc5S1/fsh/NgaCfi/T9v11Y=;
        b=rgCyPyy/GSV1/oYvnXg3l2AEVuO0EwkGXJM70pG4A0IrvizB3eiXUqLMrgRc5dc0Il
         GYOX3yHnz8s2KrcJwoHL7G8S5cuFLdAqKWWQ238pfrfBoxICOFcqzpV3h79EgQaUXiR0
         d69qho0Kp4q0o/uepPgAMDeaW7XEvxfYLyCbS3JCh1uWqMV+eRNfZgXZiu68c3J72xfJ
         SSHWcE//rAtdpd2HubvaAuR8TlNLVC+BUcoV6Rr8jlBGGP7lWYRhDFc6IckeFitGgSNZ
         jPG73EIS03AMIODjbWkie78ZIRR1XlV6bqWx2PX8PGLWFPnmQulpGTsWwx0fAVEK0uh3
         horA==
X-Gm-Message-State: AO0yUKX4vZqqIk5frp0NYf+Vf6L+/gR6ff/8v3d+QD5SZ/CNcvJuDh5U
	uXTcmyU9Kr089o84LQ7l1nAhvg==
X-Google-Smtp-Source: AK7set+EVWjyvBDbBmHCcExD0NtojGt3goUEamDttcbYP3oPo0KNy0WQIuIA/C83vuguDS3t+796Xw==
X-Received: by 2002:a17:907:98e6:b0:929:43b5:8e69 with SMTP id ke6-20020a17090798e600b0092943b58e69mr166365ejc.40.1678626805682;
        Sun, 12 Mar 2023 06:13:25 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:25 -0700 (PDT)
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
Subject: [PATCH 01/28] media: cec: ch7322: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:12:51 +0100
Message-Id: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_061330_022761_3DF38384 
X-CRM114-Status: GOOD (  13.95  )
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
matching via PRP0001, even though it might not be relevant here).

  drivers/media/cec/i2c/ch7322.c:583:34: error: ‘ch7322_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/cec/i2c/ch7322.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/cec/i2c/ch7322.c b/drivers/media/cec/i2c/ch7322.c
index 34fad7123704..3c6e6496a001 100644
--- a/drivers/media/cec/i2c/ch7322.c
+++ b/drivers/media/cec/i2c/ch7322.c
@@ -589,7 +589,7 @@ MODULE_DEVICE_TABLE(of, ch7322_of_match);
 static struct i2c_driver ch7322_i2c_driver = {
 	.driver = {
 		.name = "ch7322",
-		.of_match_table = of_match_ptr(ch7322_of_match),
+		.of_match_table = ch7322_of_match,
 	},
 	.probe_new	= ch7322_probe,
 	.remove		= ch7322_remove,
-- 
2.34.1


