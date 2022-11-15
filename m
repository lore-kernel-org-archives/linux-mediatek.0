Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85268C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 03:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K3i5y3oyIwsgiFHEGgey14XqgO98FOVbhLAM8VvS1C4=; b=h2Q+HX1QiKxnM8p4XfpXVKV82t
	LQD4TI0Zoz+rnEtUSzueAlCym2z3r/nHwOEFkmPz/2Y7IRNHVo1bfyBdVvP5U5aEgzIU5Xdulo19T
	L+Qola5hDDSztATJw91vR0kBkPIOzznevM/l4MBwx4ziGzUUYWkTdp0HR1rj4F9F5RkQoWTiA2RO2
	R72z4edGDc1ahAvomUVmjg96fmT98AHFDiNm3adsk8XVCHIIQcfaMw6Qf6rAta1LxXlvbkxKigU+7
	rpnbMmaOX8nWwwwK1a43vaAOLUxARPq/E8Y8xI9CQEQkBMGJPPvkGwhbhMezx6+p2xswRxCKXBuaw
	Xm8GIdUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oumdp-007Bou-2Y; Tue, 15 Nov 2022 03:29:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oumdD-007BHK-8K
	for linux-mediatek@bombadil.infradead.org; Tue, 15 Nov 2022 03:29:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=K3i5y3oyIwsgiFHEGgey14XqgO98FOVbhLAM8VvS1C4=; b=BS3ICzAp9C/o765nx4mXzl771b
	eansHbNJUEBIiAAavWPkHP3t09ZrBWynJ/P4lrI/icd35gUML6ArgS9iY6V9FgvgePAmPV+puXg1K
	jtEpeBCMg31bK0kVtW5yjfgii+1h4yDD722H6ERFFgsoZSDl0FtmY8ivu2pAKm9a5Tr4N7wBKFiWd
	hbTmHwSdP5PvGEzuGnWfDN/8TfZnmLZQeKcy79t8nqQx6xFm/z5qWavtxE9B/RHh3fwp7SEypi1Bz
	jRxFHSUW9Svw/PoTECVYfH5BlPlcBLxS4jT/jKVugXrM8cSQM2mGvABdQhJVkD3zlpvQnxepRrGcq
	lMF8VOjQ==;
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oum5w-000wvZ-M5
	for linux-mediatek@lists.infradead.org; Tue, 15 Nov 2022 02:54:47 +0000
Received: by mail-ej1-x62e.google.com with SMTP id y14so32919491ejd.9
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Nov 2022 18:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3i5y3oyIwsgiFHEGgey14XqgO98FOVbhLAM8VvS1C4=;
        b=XAXlj7HV8ef+3U0UC2x8HKCj1F0PVBfJNEi4v/dZPj8vLlvixlnXQHiPnfYxppc2Fy
         wDYLb95FbAzLVcegL5D79d6AZ0QqRcTEVcw25fV4omTjCbPQ4cmCzV+z2HVXZundzWtw
         zgQc3h8iYsOzPGBJhJ20zIlFzyNFcy86DBdde8FE6Yr010pvjp3vc5JAQJzwtH9uAEhL
         cNkfnjnhjOQ582CUtgKPr2DzkAxQhtyaI0t4ywIcoYu67qCFXVP522S/Fp5P3kwKWdUC
         pUrhwF/4m9Jy0CWeMDcAcK6/biXlve4bkPHpyByR7w9biS+CDSTeZnaryajRb44LaU7J
         PKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K3i5y3oyIwsgiFHEGgey14XqgO98FOVbhLAM8VvS1C4=;
        b=q5BzL+UcBvWzZBneHHjiofaUw51XIPBwTTaLggWLHpzQo2wCpHLYDkUY4UeLGpMV9k
         pIpngcN84qlW3rJJi7ujQ5gZ0kjRQMTnbI4qf7CZA7GaX3zK6ww+9jVJ2KACdtgioVH1
         /xHAy61H5vvFCPjftpPWuqHjGn17v3Bw5JSEKA1hkYhXwndZMS0XGWlZ7LOGAzF3v9J0
         RU1DCit6oxLMvYobWHb1PEAxHeDWm43vHTEAS6EyuH7Pjcw3DdOfUpgIuEso/Cp05Fj8
         4gOqp2YnAILEQSIfZOpB6CZ71cRAnfZZhPXLvkT81z96nMKItQXhgrix9VmAbYQivScy
         xywg==
X-Gm-Message-State: ANoB5plbbcWqqruaAP/zM9skwAYhzstk0eJm8OFTyNawSjSHrleGFzo4
	23XlaQzK7d8GsJUwPoiywANkjYuWXeY/l/d6
X-Google-Smtp-Source: AA0mqf4oWc70NQb+RlNBLY8bfQHcMNf1sDr6y50bKMAxjSOg+vK8+QcAhQSipCT9z0C2AliMJmmZ4g==
X-Received: by 2002:a17:906:7fc6:b0:7ad:c66e:ad9d with SMTP id r6-20020a1709067fc600b007adc66ead9dmr11853936ejs.413.1668480876417;
        Mon, 14 Nov 2022 18:54:36 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id l9-20020a1709063d2900b0073d9a0d0cbcsm4861177ejf.72.2022.11.14.18.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 18:54:36 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com
Subject: [PATCH v2 09/15] dt-bindings: mfd: syscon: Add mt8365-syscfg
Date: Tue, 15 Nov 2022 03:54:15 +0100
Message-Id: <20221115025421.59847-10-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221115025421.59847-1-bero@baylibre.com>
References: <20221107211001.257393-1-bero@baylibre.com>
 <20221115025421.59847-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_025441_284996_7E01248F 
X-CRM114-Status: UNSURE (   7.87  )
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

Document Mediatek mt8365-syscfg

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 4e4baf53796de..3d868e42e7bca 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -50,6 +50,7 @@ properties:
               - marvell,armada-3700-usb2-host-misc
               - mediatek,mt8135-pctl-a-syscfg
               - mediatek,mt8135-pctl-b-syscfg
+              - mediatek,mt8365-syscfg
               - microchip,lan966x-cpu-syscon
               - microchip,sparx5-cpu-syscon
               - mstar,msc313-pmsleep
-- 
2.38.1


