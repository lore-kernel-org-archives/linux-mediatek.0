Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27CD3C55178
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 18:12:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B04E920723
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 18:12:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OIANceB/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="P2UTQj+r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B04E920723
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4zDoM1Y1J9M/DcBJ5EHGwx/8BPUxqvp2XQxj/dom10g=; b=OIANceB/LlpwiSkwKa8aAl3CQ
	c9gPakWisAh7vVawNBIESAsCMXj0nNIInrf93lvhfL8VbaAqoG3A/fjNbJfkXzAUuPKxjZuS2m0qm
	zAbbZsY4OpHBM1p0EkYjMj1BWaq1KBw7zWWdSpnuQur/UVDCmyeg2Jqpj6aQUdta7aiId7bmryki7
	6SBZUwG4gJ2IIdtIQ2V7651sH+MnYiGHqz3OeVpD6xYoto+n/02VVXQWCyJ9kiwQzK/Lx8SSVguPJ
	TPNEIotb60s+ZmzHgwI3B+/PktkMjZGViGMV0swgSeOJxPPiBTl0rKNWLXTDyImR7XzYeFUDdAxwZ
	p4iuoMDyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXTSA-0007uM-6C; Tue, 27 Oct 2020 18:12:14 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXTS5-0007rj-11
 for linux-mediatek@lists.infradead.org; Tue, 27 Oct 2020 18:12:10 +0000
Received: by mail-wr1-x443.google.com with SMTP id e17so2942357wru.12
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Oct 2020 11:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AizmEGLJWCh5e+BIl/5tzrCIJ5dIEIgB9BBqx3BLDyw=;
 b=P2UTQj+r1SEKRJedJWTFLKzP8So657DIQN2igB9WKpnJ856BOvDDfhLzT9DqoAdWF2
 kGplRYYu2HTJ/KE+eIhW6lNcI0+4I03RUL690XQRmlOGVhnMfC9z7AgiiKr43rrcu7Ck
 48qsUdqDxpTL6c0x/WWSVXeMrpZ1T44svS/CO1rtcP6PIONfvEZ6w9Dm16JaqQQW+Fa5
 N7dq/PTYCc6okwxpphEDjOj1VsK0sCgDoiH7qemoPGPyYaZ2o7NSEH1RSbUjqWVQuavW
 4PQH5Tva2lt4aKmDZS5K36KPM79gR3Kz4coyHN2BcqYhepP+5Xb2e6QUlw9MpJjnOBun
 vpnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AizmEGLJWCh5e+BIl/5tzrCIJ5dIEIgB9BBqx3BLDyw=;
 b=fgEK/dSiJb0tP/b+eGn+9duQoZoJSRlGHxxJAb4ShAoOYt8d+WMHAjGVl4bfaTlDJj
 4HVPNExWo17KNeHJqAJeBjKgm9CqaWoDJGH/ReFIc/vXsQBCcW35pcEQb2zgQekDwg0h
 uYEwhPevvcHpVwieeLF/9ebYjNE6487H1ROU6FEAGJJYG7olpy6Zfe+DW7xFdfJqJNI5
 jYY1k36e/njvo/ZTpj2zjFF5KwXdLgd9daHBl6rf3TuHxkypzQCZ48MpEr5COj+317sV
 fv3LESfQkc06GHoJeCEUojZGBP0FTi3zs3tYSJLJiXYm7vWk2AlnBaezK6Xr1bzQWAeh
 ejsQ==
X-Gm-Message-State: AOAM533jq3+QhhUdBAMR7ofroURfuy+xH0MBpMlDNgS73Mw3EIL5NL5g
 N+NnUyhXs+z8mBizvQyIYgvZcw==
X-Google-Smtp-Source: ABdhPJzW9nq4LkblMc0w9V7lubC2UdibGY38QsWzOP+oXqTs8LAZbRDjEIXechCCEn18xtlwRn4ufw==
X-Received: by 2002:a5d:6052:: with SMTP id j18mr4408374wrt.306.1603822328165; 
 Tue, 27 Oct 2020 11:12:08 -0700 (PDT)
Received: from localhost.localdomain (159.174.185.81.rev.sfr.net.
 [81.185.174.159])
 by smtp.gmail.com with ESMTPSA id h206sm2801224wmf.47.2020.10.27.11.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 11:12:07 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v6 RESEND 2/3] dt-bindings: input: mtk-pmic-keys: add MT6392
 binding definition
Date: Tue, 27 Oct 2020 19:11:55 +0100
Message-Id: <20201027181157.862927-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201027181157.862927-1-fparent@baylibre.com>
References: <20201027181157.862927-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_141209_221786_25E3CB88 
X-CRM114-Status: GOOD (  14.23  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the binding documentation of the mtk-pmic-keys for the MT6392 PMICs.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---

v6:
	* No changes

v5:
	* rebased
	* Rename MT6397/MT6392/MT6323 into MT63XX to make it more readable when
	the list of support PMIC increase
	* Removed Reviewed-by from Rob Herring because of the new extra changes
	made to this patch
	* change the compatible for MT6392 to also contains MT6397 since MT6392 PMIC
	key driver is compatible with mt6397.

v4:
	* Patch was previously sent separately but merge to this patch series
	since there is a hard dependency on the MFD patch.

 .../devicetree/bindings/input/mtk-pmic-keys.txt     | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
index 535d92885372..71c82687ab92 100644
--- a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
+++ b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
@@ -1,15 +1,18 @@
-MediaTek MT6397/MT6323 PMIC Keys Device Driver
+MediaTek MT63xx PMIC Keys Device Driver
 
-There are two key functions provided by MT6397/MT6323 PMIC, pwrkey
+There are two key functions provided by MT63xx PMIC, pwrkey
 and homekey. The key functions are defined as the subnode of the function
-node provided by MT6397/MT6323 PMIC that is being defined as one kind
+node provided by MT63xx PMIC that is being defined as one kind
 of Muti-Function Device (MFD)
 
-For MT6397/MT6323 MFD bindings see:
+For MT63xx MFD bindings see:
 Documentation/devicetree/bindings/mfd/mt6397.txt
 
 Required properties:
-- compatible: "mediatek,mt6397-keys" or "mediatek,mt6323-keys"
+- compatible: Should be one of:
+	- "mediatek,mt6323-keys" for MT6323 PMIC
+	- "mediatek,mt6392-keys", "mediatek,mt6397-keys" for MT6392 PMIC
+	- "mediatek,mt6397-keys" for MT6397 PMIC
 - linux,keycodes: See Documentation/devicetree/bindings/input/input.yaml
 
 Optional Properties:
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
