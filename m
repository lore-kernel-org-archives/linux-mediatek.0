Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF38CD37A7
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Sep 2023 20:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HlByvIOdhm1BrLrYKlOSPCA/h/JQn1HfpIBfjQs7y9E=; b=aXuoyl4XJZovTbSpp/cZuDmLlj
	8XZgGX54gv1TePGo8iWHRZ+1IOnKH0RScEN4h4Y2ktD1WeEc8ixIfKpRZ+nJ5i3wwrZVTXBQB8AeJ
	wb/+nBfDCdBDK5z7Ywk2vvcXjx059hu8pMcKbUi0+rhtgCVGfLeOxzOs8RZ9KmPyF2A+3Aydd2sYa
	vrRlyfBsx4hIODeJ9QCAZJAe9E2ToptQ6Y2+0GkbjIG/cq6l/uxPNmhufNwLxNeuB0Anbme7srOXp
	+z5jbaWYbQ4qUMGmQlmVMJ5ceet2BBPs6k3n/N1F9KWPExtjfrm8qA9L0lGVYWEvuSylbXz3uoqWU
	fZyHb+wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhF92-00BIKX-0s;
	Fri, 15 Sep 2023 20:10:28 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhF8z-00BIJJ-0e
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Sep 2023 20:10:26 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-68fba57030fso2408180b3a.3
        for <linux-mediatek@lists.infradead.org>; Fri, 15 Sep 2023 13:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694808622; x=1695413422; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HlByvIOdhm1BrLrYKlOSPCA/h/JQn1HfpIBfjQs7y9E=;
        b=Ogr7MLRxgY0Xnchu4DAHVv3V40qbOlfrJ0kdVrQcGNecJ/Ac2fP+3H44atyaHIm9xx
         1ZOpCPT3jflmSCS4vv2Y3C1KdLV7eUgwYzlXgt/m4Ze6D7P95jxF6HiFzYENSUSz1mGQ
         hZ5ugOvNKybwqguCGUeXsZ9Wis62wGA+CXjnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694808622; x=1695413422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HlByvIOdhm1BrLrYKlOSPCA/h/JQn1HfpIBfjQs7y9E=;
        b=lQPxNtevWlpne72Qr7vASMhQYmJVmeQOxP8uEjEXdyTNH8y3ELo676ZnZH+8Qq6vn7
         xjOOPxzATbUH9AqDfG/wxQVGpoM67HRydl29fe2Cmv0dsoOT1J74BktR0CMqQC7IzH4g
         Ojuu955IdCDw0RyJuj3tQAVNbrnjIOyXR1L/5zJJvj4dVJRuePl9GQN29y8zm6S9Jxen
         wYvhn3PvWw+qo4RopGfy1p37tInGplnnJc5TGjCOqvDUGUOR7g8fUglhaDCPj4HGNxD7
         RpM9icvcmUouicvBKc7388j1EhUtKBm+okcAhcydbXcd9xEWqVCIbtCtaUAxNWF4OATa
         zxYw==
X-Gm-Message-State: AOJu0YwhRZKOOA4huwEi4JTZUNw8WWn1A0+3Td2sR7+EkHKhpcDeJqfY
	YJxRA4zvLEDKfiv15l9hzW+HrA==
X-Google-Smtp-Source: AGHT+IH97ZRMrx8Ht8kVmTlA+CCi+kBXT3NF6QKj9s4ZlPHyjWvdpu50pjC+R3DiD6+loNvwc9w5NA==
X-Received: by 2002:a05:6a00:178c:b0:68f:ba5d:c7c8 with SMTP id s12-20020a056a00178c00b0068fba5dc7c8mr3263085pfg.10.1694808622247;
        Fri, 15 Sep 2023 13:10:22 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id a27-20020a63705b000000b00565d82769d1sm3161179pgn.77.2023.09.15.13.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:10:21 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: Kees Cook <keescook@chromium.org>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gene Chen <gene_chen@richtek.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] leds: mt6360: Annotate struct mt6360_priv with __counted_by
Date: Fri, 15 Sep 2023 13:10:20 -0700
Message-Id: <20230915201020.never.433-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1575; i=keescook@chromium.org;
 h=from:subject:message-id; bh=f+enA4agyImbFLGfdmWqtF1Ofn6ogLeO3YPTh9r2ypE=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLosMDTNT9zkGuuSS5/v5hvLo56PnCLrNsfhH
 2XWrsY0ncyJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS6LAAKCRCJcvTf3G3A
 JuiBD/9EbeiE4dzQvBsNU8W+Ygxow9+F+K+56pj+lkkL8YD7G9ZLxoEIDtbuf64kthZKeEvjo57
 FTUv/48yOAUZDs2LU9/9qiFoSi8L0qj3gx/k1vcVDT/AYShIsS7MZ3/HQRvGeiiUbRHqAv034yb
 tDCakrDUzz+HFSbIBPQ3hTMf1LrLic/BS6/a9kR+7EerWW8Yc430bzBpznlnZvAvfyudwqApts0
 SYDaEwQY3GFNuWa7oZAZBRMc0FKcTHCVkTcQ7+Sz5PQoXaajs2eVpYcNfSrKxHqBVoh74gB8wIS
 fDSrAqGXttPXJRT3nIVf/NjG12MZ1zW24/t4bDYie6kU2aTNGM/ijQHVjZLDcXTHJXJ/Kbx2dM/
 7gzMy2HDEtF5Vp2mJWeVCfNAS9V80eQ4DGU0TnnWEx4LaQgh0TjoJLRkmZLfonk/Jaf/QTEETCM
 cIvZM3qzHy85LPkBOxvCtHjO48zKpAuM720fZaw1E0W8xqbkW7VMzWw3m3X/f+rzniUmuJhfHuF
 pXCw7jO7QP8gNO3BKGOH5MLx0+LBqeE9a8QydO/pnK/gwVGqWfWiuV50WWXFEQvriun5eAgjO+Z
 UQVj4Ce2Ywi4w5VkhFcUUeepfhCVLdfZN9t9cUXFykt+XBm+eXZJtog2PNj/28wtP32yiyPdLtO
 wcq5HsY mHeihMBQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_131025_238564_94F6EEFF 
X-CRM114-Status: GOOD (  12.30  )
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

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct mt6360_priv.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Pavel Machek <pavel@ucw.cz>
Cc: Lee Jones <lee@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Gene Chen <gene_chen@richtek.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-leds@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/leds/flash/leds-mt6360.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/flash/leds-mt6360.c b/drivers/leds/flash/leds-mt6360.c
index 1af6c5898343..b70dc689b33f 100644
--- a/drivers/leds/flash/leds-mt6360.c
+++ b/drivers/leds/flash/leds-mt6360.c
@@ -91,7 +91,7 @@ struct mt6360_priv {
 	unsigned int fled_torch_used;
 	unsigned int leds_active;
 	unsigned int leds_count;
-	struct mt6360_led leds[];
+	struct mt6360_led leds[] __counted_by(leds_count);
 };
 
 static int mt6360_mc_brightness_set(struct led_classdev *lcdev,
-- 
2.34.1


