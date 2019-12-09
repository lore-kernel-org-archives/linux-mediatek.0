Return-Path: <SRS0=SGDP=Z7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 495B5C2BD09
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 19:58:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FF2024654
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 19:58:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qW9JB1yu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qrCUYV1V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FF2024654
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0NX0kVhmLTfV8J0dEhaJBtxDbJ9Kg52ZVPY0XqaqAXY=; b=qW9JB1yuHFD46LTsGdkxoHv5pC
	5/aqxFMm8JxD5XxGPyoPIbJzLnckua9P9UVO0duWR9EURsBvp98LeBFKrLIWS7O62z/XG+lhgX5oN
	LXo2xigVYPLJWdgG+fWNnXfBRAQfWPVWb6zZ+gp992JeoF34sFZ5zVs9N/nxMXvqsQEAZzkvYL9Fn
	x19rOmcIcko/JWu1hny1NqRVS/C0uHEOwn60od6gnQNG+RS9L6XBBBHawH+FiOWmjbPUM5zllx2Vo
	xhKAi2HNSrGYIG6vw7JxV/EPRZYFIla6s58nMImFuGEau2pojuBuSPJ/Osm3mir9Ch+jXWPjH+r+k
	mHO9AYhw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iePB8-0002JA-KP; Mon, 09 Dec 2019 19:58:46 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iePAc-0001e3-98; Mon, 09 Dec 2019 19:58:15 +0000
Received: by mail-pl1-x641.google.com with SMTP id x13so6227279plr.9;
 Mon, 09 Dec 2019 11:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=u5SdTuHzF4zf1Wjn1flJ+qtgBZntgOO/VK2s/WcVYGU=;
 b=qrCUYV1V6P4WlHrNdcprEAx8IM1K02m67llRFrDmx5AbLcZr5zs8ipmgkb+Mf86WcE
 KoDWHWWiYzxdsPeY1WSn3XaibbsEMk6RiViK2Ug/v1kHIAm5kd7KWZ04VrGxjR5shB6H
 QwCdY0sNhsC4zuFBSUzJ9KnGnXwQv8RBPweKGsXkxh+f3mwY9l+yHkr/1HEG5u0/u0Z+
 UaTpTeJ1qcMfW4fObk12VUCtENtlyNImns3/j71VtEB69up4yoNuJDzO0cJrU8DEY6os
 kdITtE8N5y98P5f6jC1B7ShpWo70XyQoRDdHM7fdw42vAXf/BtJt/Ie9aN3O7KnoWKIJ
 hHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=u5SdTuHzF4zf1Wjn1flJ+qtgBZntgOO/VK2s/WcVYGU=;
 b=im5Fu0C0+H8n3BJSysjdIBVNpL/47RuaZwF69pVAyzHHlFWP3VT5RSOG60YgxMbwK3
 44hRhxrVNKcNDuxtk/HfRATKpTFwdrKp9K+Kso2wBHG4O9BigqRh/j0j/56O/fX+V3B8
 KSxuW1LJVs38cURpR1oE9KL5xYvbKaR3LrJp53cg5h/6cDdUqLBgA2d4oT52V2Z4+VTu
 2FJpTIQjnjZDJk4NlJmgNPqJe1RIfWTe0wi3/gE/eV+FZ7PZeRPK4bbbM2/n+1EaZWXd
 0qvWJ3uVdoj7d9NXMy77f45/oVvV8fwvg9anN1p03f08XG8gInTxGY8Biu8GpTK9ULIX
 km7Q==
X-Gm-Message-State: APjAAAXgfZKoEo4Xm4E7XZ3DhEXaQ7P4D2Q40SJ9Gi9z8mZNrdxwRFDo
 HSmHyqFNHTBe/UIU2etoPBs=
X-Google-Smtp-Source: APXvYqw8Afql676it0tHiWqNjCREZmqJaXGsHUnMLrZAq/Xt4r6ZN5z7oOBZ0rzgeg294DZY29zPYw==
X-Received: by 2002:a17:90a:f0d6:: with SMTP id
 fa22mr877656pjb.136.1575921493516; 
 Mon, 09 Dec 2019 11:58:13 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id d2sm175316pjo.32.2019.12.09.11.58.12
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Dec 2019 11:58:12 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: afaerber@suse.de, manivannan.sadhasivam@linaro.org,
 mturquette@baylibre.com, sboyd@kernel.org, Eugeniy.Paltsev@synopsys.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, agross@kernel.org,
 s.nawrocki@samsung.com, tomasz.figa@gmail.com, cw00.choi@samsung.com,
 kgene@kernel.org, krzk@kernel.org, palmer@sifive.com,
 paul.walmsley@sifive.com, dinguyen@kernel.org, mripard@kernel.org,
 wens@csie.org, emilio@elopez.com.ar, pdeschrijver@nvidia.com,
 pgaikwad@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
 matthias.bgg@gmail.com, rfontana@redhat.com, gregkh@linuxfoundation.org,
 t-kristo@ti.com, john@phrozen.org, tglx@linutronix.de, allison@lohutok.net,
 kstewart@linuxfoundation.org, swinslow@gmail.com, aisheng.dong@nxp.com,
 robh@kernel.org, daniel.baluta@nxp.com, weiyongjun1@huawei.com,
 wangyan.wang@mediatek.com, chunhui.dai@mediatek.com,
 miquel.raynal@bootlin.com, heiko@sntech.de, jcmvbkbc@gmail.com,
 nsekhar@ti.com, geert+renesas@glider.be
Subject: [PATCH 08/17] clk: imx: convert to devm_platform_ioremap_resource
Date: Mon,  9 Dec 2019 19:57:40 +0000
Message-Id: <20191209195749.868-8-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191209195749.868-1-tiny.windzz@gmail.com>
References: <20191209195749.868-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_115814_335206_EAB5F230 
X-CRM114-Status: GOOD (  10.16  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-samsung-soc@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/clk/imx/clk-imx8qxp-lpcg.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
index c0aff7ca6374..10ae712447c6 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -164,7 +164,6 @@ static int imx8qxp_lpcg_clk_probe(struct platform_device *pdev)
 	struct clk_hw_onecell_data *clk_data;
 	const struct imx8qxp_ss_lpcg *ss_lpcg;
 	const struct imx8qxp_lpcg_data *lpcg;
-	struct resource *res;
 	struct clk_hw **clks;
 	void __iomem *base;
 	int i;
@@ -173,10 +172,7 @@ static int imx8qxp_lpcg_clk_probe(struct platform_device *pdev)
 	if (!ss_lpcg)
 		return -ENODEV;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -EINVAL;
-	base = devm_ioremap(dev, res->start, resource_size(res));
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (!base)
 		return -ENOMEM;
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
