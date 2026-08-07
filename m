Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8B4C5AC80
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2026 09:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ff2PqEjwL9/E48n/LYtyoRX7V3j9un3+kJnzZ64yyh8=; b=ua3vdEq/Mq/k1ICaWmQDMdp4Sm
	wMQt4jjKVT+Akalad5mKqQRmjBATov1eZOk2LYrV1a51WMLbxV2UACSefsbv5j9KuioaSAp2ICxKX
	hsZVRV1q7VjAWZs6nc98+AB+YBQB0NWx/ovYGiZXZ/iyA06iVK/HM0fq41wq0/1IMHDuEe0/qemLe
	0FkKVZLDEDFJoCSCPnCdyFoxKxPmSW2MR9ooTTJI8ygkMHHPQC7jWwh3fdqp2al8nxefJRgxuHqCN
	mSZ/Ciw70SQSnoxWzC4KJXoSX4F1cAaXUqJ3yAsHep2XtBc800VAdXvfczWQ/S3H2fHGup9SNTzlG
	TWCBS0gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsGan-00000007UNg-2y51;
	Fri, 07 Aug 2026 09:10:17 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsGak-00000007UMR-23pM
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Aug 2026 09:10:15 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8487088510aso4555185b3a.0
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Aug 2026 02:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786093813; x=1786698613; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ff2PqEjwL9/E48n/LYtyoRX7V3j9un3+kJnzZ64yyh8=;
        b=k6s/LcGobHyzA/YYvqyKPlkrbGeksLNjeZE0lKAfKaA1dREu/nKwB3rFVOHAWqP0hH
         tV4GmkP+kxfpp9IbmdUa7hmHm/uXjzLvbsFQiZNKG2BHtYkciPGH4fPWm6OmrpeCtmrV
         anyEGFEpe4Nex8KEJo3+6XENWeVZVrpSYDtyADCFzOQRqc9k9cC3bSWo8yLPe00dEEF/
         sB/tcnxDflKsSi1saNVVikWky4Skw93YsCgnpccHP0Uj47TR6+uN8xyh22pc4g+7qFga
         AAw9/kcQstx08wpeiZBQSEP4jO/j6WDhFjODGXY9pVe+ACb9ETXDX2gX94n1V/bhMI88
         v67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786093813; x=1786698613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ff2PqEjwL9/E48n/LYtyoRX7V3j9un3+kJnzZ64yyh8=;
        b=mIQ7qCVXuQxywhXGd5Wb+7uRxBD2VGP/XR4nlJ3Mi8q0nNDsJmlposzJhOq5HoUamn
         IS2BwVgjvnxX3A3/4oeo1B0uytAV6iTYQoi8G9T8vmyx6sgHtF9ipTA2NRXyphIGV1Eo
         /LK+KMAy1vJC0PLVrmQDokJuMn1OUIjVixYzAI4VqyDkUM3ISPUh5RP9257hLQ5Bo+98
         W+JfXYiXda0tY/vojFWpX5JXl1tZ6DjQi1bQHXsUIxQGb8kn3rE+MlwOaoZZbHpSEfuE
         sYqtWeuU/QWOG/CpOyKMPmxEU6G9Gnvki6QzbLY1YdrY2gzg8I7W5zu3lq/M1KUfbzb9
         1hVw==
X-Forwarded-Encrypted: i=1; AHgh+RqS3vxAcpnN6MqLKjJ0y2LrB+mfLdciWPKiRqO+XBmgqkOXMuPi92XNecCOzeDgbiHzkIdohmY3ZW1CPgcMMA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyEgVbq3kKuhxxCF8M8zlgjy0lCbqXB/4vQ5HBBsb/M4bzFklvG
	FlDpR2QGew5OKlMX0BUMUuJSNdMj924NftHd8XzfUdiJa45xqpkq7If+
X-Gm-Gg: AR+sD10A9SV/NmP3AuZo/38I4ltNUba+IS1AO/ppY93llCbh3KSRq15yixoBvUtzdYs
	2LokmRcXMwlPWahe/XTWSnTH65A8+jTMtggdypWlR+R75CU0K2oek5d99gOw/Eya2qKCgqde/SU
	cGRGeweIa9guhAQPUqImXy64cXaNUlZG6JpE/uzUXM+8yjRqLLRxyktx6TK6I0p4e14Xb2v81mn
	utVLnyMYtdI4/z5dxHUx9SriHrWo3mIsXct/AQi+2MUUI4Y/vjborIZjtLrkgr1nRKtFiww9w8e
	toyB/KCxudl4dWE/EO86SjvP5NFbIgveQ3kIWO2mlXV9OXQyjGnKU+IC9EAlebPnpNZHO2Xoznm
	VYgU+lB8xTYTc97cSNXZhgkf6AkNi5rdFRhxfAHsT9nwi4L1xZu9IlONzPGUfivPGW8NJDTjJ9M
	yfY+2MivJSKRkLliA4aKIk40AVXy/3mhjiSsoebm9HxrOPlTebJth8Uxuknc7j0kFlOzrU9P9mQ
	fuZBq7VyJenoDMQRqE4LQv5zhnMVa+NpLvRNTMgKVGnjZxvcBvQaRAZmDca2OpAK+w6WuvPuuJU
	paUIodD0p1THVJw=
X-Received: by 2002:a05:6a00:420e:b0:84a:6726:62f9 with SMTP id d2e1a72fcca58-84f2dff7c61mr26343835b3a.9.1786093813505;
        Fri, 07 Aug 2026 02:10:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a552859sm715908b3a.42.2026.08.07.02.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 02:10:12 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Jiri Slaby <jirislaby@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@nxp.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Yenchia Chen <yenchia.chen@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	Sherry Sun <sherry.sun@nxp.com>,
	Robin Gong <yibin.gong@nxp.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Zong Jiang <quic_zongjian@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Aniket Randive <aniket.randive@oss.qualcomm.com>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/3] tty: serial: imx: Propagate errors from optional IRQ lookup
Date: Fri,  7 Aug 2026 16:09:44 +0700
Message-ID: <20260807090945.41690-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807090945.41690-1-phucduc.bui@gmail.com>
References: <20260807090945.41690-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_021014_544673_F1F89BE1 
X-CRM114-Status: GOOD (  11.03  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no IRQ is available, while other errors should be propagated.

Propagate errors such as -EPROBE_DEFER and -EINVAL instead of continuing
probe without the IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/tty/serial/imx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index 251a50c8aa38..4224454d360e 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -2463,7 +2463,11 @@ static int imx_uart_probe(struct platform_device *pdev)
 	if (rxirq < 0)
 		return rxirq;
 	txirq = platform_get_irq_optional(pdev, 1);
+	if (txirq < 0 && txirq != -ENXIO)
+		return txirq;
 	rtsirq = platform_get_irq_optional(pdev, 2);
+	if (rtsirq < 0 && rtsirq != -ENXIO)
+		return rtsirq;
 
 	sport->port.dev = &pdev->dev;
 	sport->port.mapbase = res->start;
-- 
2.43.0


