Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A0BC6FD19
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 22:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M3WdhQD5rAXvneo2z5R6lNFWc2ZYKuwan4rS9Bakw0M=; b=p0aezB/rj6O5p8Q0teZlNNFBTf
	BE4tD8FjgvxZrAcxVROa1REcXMHNlRAQrMbMkdJxsAnckZUAQVvlZUKRzLz0z0AqyvFoLtmgVjych
	26C9CnSrcHrJDZeFDgr6iQ8nuS9InH+7Qjaif3zkj9T9fdmbD+x6S79cuT9vc0Lzo06zud33gSu3j
	nPCAKAkid5SM/isQHs1j7uomKoZD6oJ113VRFhJU69gjWvU0dm08YYGt3W5mxRKWb5x6eC4X3l/SR
	XeEXQhmtJK645uhwNv9x6qboDagvI7xAI3Akjb7eF+hLfAPzZZ71kfljICqTrbafVQXUsrgwbtH45
	aZt0pOjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1palZ0-00GVoP-Ge; Fri, 10 Mar 2023 22:50:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1palWq-00GUbD-Fh
	for linux-mediatek@bombadil.infradead.org; Fri, 10 Mar 2023 22:48:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=M3WdhQD5rAXvneo2z5R6lNFWc2ZYKuwan4rS9Bakw0M=; b=AtCwkXEpQpj40DxKiLHZrPcU2T
	PVAhWubAaRdm+jiI3LfH0x49tlrahWLQ+PYSOP6ONkmf4VFSJNWsOs/1NJg1ikmFI+KBO8+LjfJUd
	eU3N0o8+ADl3z5K5CdnldTlNzf+Y6pahzohC+J5BKlzJ6wBvpjmUF5RcfkwFMI1gkGPL/pEJJD4Rd
	smnk3JmQUZUhXnISuGJqtPoqg9QF9xuGRlSNrChys7Z4byiRllFJBUFv93WL4qS7iDcDF7BKs+as1
	4gVhXCgxIeq1Y8Cw+5dqCc2Tsw/dgqh79AfC6sFXXlJ7YUwMayuvKsOSNlKADPWZjbFnPk7YpUEqY
	0Lpnr9tg==;
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1palEl-000asQ-0O
	for linux-mediatek@lists.infradead.org;
	Fri, 10 Mar 2023 22:29:23 +0000
Received: by mail-ed1-x52a.google.com with SMTP id k10so26371863edk.13
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Mar 2023 14:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678487358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M3WdhQD5rAXvneo2z5R6lNFWc2ZYKuwan4rS9Bakw0M=;
        b=FH0mRWxSv3dhvkjeAGdGWC3XJUniNQrv9dUJ0DlkmSHDBsR1cMKPip4P5qxshWquPT
         o30zH/P6OAMsiqd3b0gJ9NO9k37kxCWE+3g5o0qJuGCMqEhIOhBWbVB55yR9EIYjwikl
         MUi7ljpJcIO9BHqSC8yhPoVOk7jtPv7Jy5AuYh0rPtyhy+iFBBXeYwq2rREH8uUGRdYS
         /P4xnqadCBAt+jcFiqqZPyh2zUeyHC2ZbAOtBHuovmw213/b91juyL9shSC7qo/JEzMk
         8aInCsXVd2L2IU6uBunWkv86D74zDz99X+zHVkraLs4W584lOZl9HtWsQzBPfqK2Xq7Q
         dqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M3WdhQD5rAXvneo2z5R6lNFWc2ZYKuwan4rS9Bakw0M=;
        b=ethhtoJUyIVq5RusJTIFzmq9ONFl0idHTOmTDXHFoutEEpnuqY9NV6QPpNBn97iYcN
         Lzp4BqYA4+enjDSj19vm3dfrN9jEmdVNdaSY2IwnNJ4SYyh5uaww8EbvYfFHiNg7QEIV
         2MathyQSbEZ/likOq1deQdZaWoUnQuM22v6UoogM8+s1jqYx1wg8lxlIBr4du7yex7o2
         w5Wetr79ltwFOrGsUQsdmUPDgl55Me0h5Ec89ud/90ChKMVtr1ljyUqkGj/S9BGR949R
         djHs80w3zxXeppvJtWSotau0DW7BkEtcDmR2pAR/ArdOnlHAeW/qhtme/QTiN97U6wcV
         ZdUQ==
X-Gm-Message-State: AO0yUKWnqvQVgGsGy1D1NcqFawkTB5HaI3PREXGNmcx7iQh90qv50Alk
	g9w8hMllmK4dLTV0hwvgc206AQ==
X-Google-Smtp-Source: AK7set/aeDYIEUgYw5BDy72ya0/wLgG/2r8MQ4JILKTIDWdyXnTsT8LTeyXPCHZ13QKftG5RxlCVrQ==
X-Received: by 2002:a17:906:4e15:b0:883:3299:91c8 with SMTP id z21-20020a1709064e1500b00883329991c8mr26654805eju.55.1678487357988;
        Fri, 10 Mar 2023 14:29:17 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id x101-20020a50baee000000b004aeeb476c5bsm525467ede.24.2023.03.10.14.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:29:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mark Brown <broonie@kernel.org>,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andi Shyti <andi@etezian.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 14/16] spi: sh-msiof: Mark OF related data as maybe unused
Date: Fri, 10 Mar 2023 23:28:55 +0100
Message-Id: <20230310222857.315629-14-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_222919_621423_277E5B4D 
X-CRM114-Status: GOOD (  13.38  )
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

The driver can be compile tested with !CONFIG_OF making certain data
unused:

  drivers/spi/spi-sh-msiof.c:1076:34: error: ‘sh_msiof_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/spi/spi-sh-msiof.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index d828a3b370b8..412aa1882e5d 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -1073,7 +1073,7 @@ static const struct sh_msiof_chipdata rcar_gen3_data = {
 	.min_div_pow = 1,
 };
 
-static const struct of_device_id sh_msiof_match[] = {
+static const struct of_device_id sh_msiof_match[] __maybe_unused = {
 	{ .compatible = "renesas,sh-mobile-msiof", .data = &sh_data },
 	{ .compatible = "renesas,msiof-r8a7743",   .data = &rcar_gen2_data },
 	{ .compatible = "renesas,msiof-r8a7745",   .data = &rcar_gen2_data },
-- 
2.34.1


