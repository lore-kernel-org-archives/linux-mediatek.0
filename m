Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA4B2C43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 04:14:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80EF921D46
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 04:14:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sJIwS4c7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C0Has8Ps"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80EF921D46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zA+aV8si7dBRiNrfVm7B4+0Rv5AAEVpdYL3+vs/6ke0=; b=sJIwS4c73yLLAjgvcRRsC+MLF
	4DV2bhXUO1JYtujmhshhy3JCp7UY+L4TRjRGr/fsKZ9et6+RUrLvBAV3189ZfIvLobIBA1St/Wi7r
	mnZmkkKlsfNZ2OGadUPudJHKTt0wb7rPNY67ToSGtFMIGhKCYVZkU2P8gn1Nzs/KqaF4+Vg3WWOey
	EvFc20+WutYa6341mrOYqqcJWl2oVTB+Y3jON+yYiWScBdy3aP+jUweCP/gIpgfRxcVR4dMD4fr1A
	aIBPbIUAmJ3MW/fIyduiGNYwqIvwS3xhO8uEnrLaEt3t4dvyImdWPDtsTYRS/eiNNPLdFX1Z4GLHy
	eMsMJdzVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGDyh-0001UO-62; Thu, 10 Sep 2020 04:14:31 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGDyd-0001Sl-Lk
 for linux-mediatek@lists.infradead.org; Thu, 10 Sep 2020 04:14:28 +0000
Received: by mail-pg1-x531.google.com with SMTP id 7so3518267pgm.11
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Sep 2020 21:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v8c0TlCjltGNPv4rO1/Om9Bj2FreW//+32287ppV2e8=;
 b=C0Has8PshVIeDcAQTJrxM9ZzNdfDxXuEqG5zNv5qYtLXbKUFj9EBIzfY9dWxm4thpT
 DjWXa1ho0Ww850nBUNan6kcto2RrCWkI8NU7l+Wu7qwyqTX4KVv1RoCdnbw7lbVxN7gz
 peZDzv6PQsO07P9+X9UjV7dc6MsCI9MURi3XQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v8c0TlCjltGNPv4rO1/Om9Bj2FreW//+32287ppV2e8=;
 b=Q0i+vj0OjrTuQgQSv7qrqyb6F1lwh6i527AfClztxRDA/WkU7+p3ISgWfUJKg/gk95
 JfKEyoLu9XWtN09fl0G3fkzX4C+EJz1sSEsx2eqzDvkVIYNneA2RjWZLkmOfjaiL6Kzp
 FxIzlne100CV8sfGX3M0vytjWNOzT3uydh+RNFkCoCJOEX7k/k7kg8PuZ7X3ww/KuvpN
 a7v5i/WcvIJTdDJzavQlu+xNpqkNK7TQy/pu3WtN/sqmVhKKd2YtUSYlGisLMXHBpCqf
 Ebl/P0ffKhcCmKJawHh+GYzfLvJsCTVOqjwMKuIjsn4JfJLv5ZiRmtnHH7uEXRRVBLYa
 ZdPw==
X-Gm-Message-State: AOAM5323dWGrsh/OALoEuvIcjMvtqOQXwmlDNVdTnC5KT9Ri3VF95Plo
 gR/1Msvwb2DzlBMA+fCFv5g9yA==
X-Google-Smtp-Source: ABdhPJyEfGAaDdXT0yj3+AgZpsKtXjp78eyXQV6Ft8bAtu4SuDhI8K5uZicrEwMQlYm4yqJi/J4MPw==
X-Received: by 2002:a62:7c82:0:b029:13c:1611:6525 with SMTP id
 x124-20020a627c820000b029013c16116525mr3778979pfc.5.1599711264257; 
 Wed, 09 Sep 2020 21:14:24 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:10:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id z11sm4266169pfc.181.2020.09.09.21.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 21:14:23 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: spi: add mt8192-nor compatible string
Date: Thu, 10 Sep 2020 12:11:00 +0800
Message-Id: <20200910041101.1695195-2-ikjn@chromium.org>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
In-Reply-To: <20200910041101.1695195-1-ikjn@chromium.org>
References: <20200910041101.1695195-1-ikjn@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_001427_758612_4BE9C35C 
X-CRM114-Status: GOOD (  10.75  )
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
Cc: linux-kernel@vger.kernel.org, Bayi Cheng <bayi.cheng@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Chuanhong Guo <gch981213@gmail.com>, Ikjoon Jang <ikjn@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add MT8192 spi-nor controller binding.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---

 Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
index 42c9205ac991..55c239446a5b 100644
--- a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
@@ -30,6 +30,7 @@ properties:
               - mediatek,mt7622-nor
               - mediatek,mt7623-nor
               - mediatek,mt7629-nor
+              - mediatek,mt8192-nor
           - enum:
               - mediatek,mt8173-nor
       - items:
-- 
2.28.0.526.ge36021eeef-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
