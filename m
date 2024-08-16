Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F7EC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Aug 2024 15:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MHQ6C9YAPTB9bZgAEs3xu71MVSTPq6FS5mdvsNvOcFw=; b=UGSfeNp8AuB0po
	cs4L7Edxg8JjAfdkk3mvSes1r5xytWBWluQVSdaoKbj1BaBrMPrBE8dumgvY6HugFWOEG22u5yZou
	dzxVshSvaKi3bVYkk7XHADxLK4w8a//hHM5zk6hD6MDwKXuuLuywyu0nF7mZMsmeKYOS8oCMxYoKM
	gAx23TvBYcIibd/ZVliI4TsfJKG30N1LrPalhAWcA36UiVvOhoAsKoNjqN8NXjZSnbVRVvxsRTpFQ
	ai5vUT67XLQh9yBsKrgUNqWvZJuPI9cJIS/oY/PkYDD7lDvuRKqtnnPVKHj41k9JASGqp3aabdWJM
	02DDLgKS+WJXOo1gnSMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seyvl-0000000DOWg-3s5a;
	Fri, 16 Aug 2024 15:31:57 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seyvj-0000000DOVe-3Vg8
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Aug 2024 15:31:57 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-428085a3ad1so16722175e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Aug 2024 08:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723822314; x=1724427114; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MHQ6C9YAPTB9bZgAEs3xu71MVSTPq6FS5mdvsNvOcFw=;
        b=ZhEaw1+keeNnqrsjz2ci4XWhUtnx8PhDCVRqltCCWSKWCpxIBtNE6rsqz84DsHDmHI
         n0KZp/PZyqH219j21LmRr8G8nW+tUsH3EByNYlHNb97e/f5EFVBgllU+6WGXK49q8G7z
         qe4/KoIFKobkxWX7wx9rCm832VaN7z0qP3nW7CPcwbmBKVSTU9H2xDHc34SxqZQg/gPh
         dnJm9N56BUMjo64esQcGkPgFERpjysXpFM6w+DOZHZIDB4RE+XLMEi6Dw5ASgFq1FTHs
         hVa6mX5tEATWJ0MIdvmqFCRB9wL0ZF8/l5+FkUmLA848SXf2Qlx6Eug2XpQWQoECsOI+
         2L2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723822314; x=1724427114;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MHQ6C9YAPTB9bZgAEs3xu71MVSTPq6FS5mdvsNvOcFw=;
        b=XVybn8jLuJ0ZUg4cF8SxqCWq8qig3gYUdsg+xeQ0oAFry6OeJHabjweJAyTRNaqNkm
         wia5pHwieK4pemTnbx/gR5lopzEZleB8M57Sz2t5GdfYi4UGwgEgwnP4iV96C5E+UN5K
         G30d65zqTzpJrG//5P9YeuUUDazrHESTo9oPSRXYWEXI6aSkH5iF9Evv9MV+OTOJIcpJ
         rUOf9mpQAYcRR/YeqgMh1mvnJ2fIpTrWYW1E9p0yYcuT6PVx2uPtYjKEfSl+VB58+ZqI
         G3nOg5L0TizbZnjp+okmhEQcUCIKyyfTweGH7foaBNdoESWPXjygUK18wuZYaGekYl+z
         DmNg==
X-Forwarded-Encrypted: i=1; AJvYcCV+wDyE21sKaT9HzHAndlgILlSsfxeFwXXvyX+Cd4rnfsURALg/EEwSJ7bSTXXs4W8URldSuSBTTNScYBP6dpyIVafD7mc0OPikzDDmGo+lwaFJ
X-Gm-Message-State: AOJu0Yx4pNe/FOZzPdEQG3LmnbvLatPokKeg0mJyFrNmwTauLE+cDBXt
	cJt6tekOwXzTgpyGcYOFskt9keddgZvJprm4+nEzNbrUJxW7ZqXJj2zw2R7gbPQ=
X-Google-Smtp-Source: AGHT+IEJXIL/v689+CCwET62EtuJhvPdXX0bjxeXiDpExl+dQXshRR93P6h1RVyaR5NPA9hqYGuwQQ==
X-Received: by 2002:adf:f80e:0:b0:371:82ec:206e with SMTP id ffacd0b85a97d-37194314e2cmr2149706f8f.5.1723822314242;
        Fri, 16 Aug 2024 08:31:54 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898497f0sm3853661f8f.39.2024.08.16.08.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:31:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/17] leds: Use scoped device node handling to simplify
 error paths
Date: Fri, 16 Aug 2024 17:31:32 +0200
Message-Id: <20240816-cleanup-h-of-node-put-var-v1-0-1d0292802470@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANRwv2YC/x3MQQrDIBBG4auEWXdARUrpVUoWQ/ytA0VFk1AIu
 Xsky2/x3kEdTdHpPR3UsGvXkgfsY6IlSf6CNQyTM86bl33y8oPkrXLiEjmXAK7byrs0hvcuuiB
 WYGn0tSHq/35/5vO8ADzhSsRrAAAA
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Riku Voipio <riku.voipio@iki.fi>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2458;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=vPETBZPAFSUrChmKOPA1zhCE04APeQPcK73ZidPqOh0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmv3DWkLz00DPYD8biGX01dG1yR9zLzcUK7/uv6
 6afN8fm09yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr9w1gAKCRDBN2bmhouD
 197FEACbc85PRN3+9lFao/L3mAVNDQNRS/WrqRBp38LHkAnWKc7LRgi5nYg5KB1EFA5h8jdqAip
 wQu5JfN0Uq6UVg2pni9gYeAd+u0b2ixjIpXBbU0aCIc2KHYzvRI+9pOqdi/2DAU75yq6uqTdkJz
 A1jyUxXiCXUbuA+O00JBPquyPzDSdxAi2jFBr87A1F8FhkSNlVWJNC8FRrYBsFgHPM/ERUA5cvr
 H2U9FWuVB0OoxIrFXoxu4JjXrg8kXvY0k6gp7B88QA8GdoLD9QGNWVDdB2/NB1pBxZJX8Pf3+N/
 7L9qQCYj0SqGuPxCDYrbOUt/ntOfqWSw5I4uAwl6jMtgoIhe5VFJnhMujghF8e0UqW32nr2kk+i
 Psdzb61R1XKtHmsE5h5/CUp+EU5mm0K1NolzVKiPfu3P7IBVeOzWHxnWScFcpyrQqSEfY4Dsdjx
 eZKnmL2+dYljL/kl5mpO6jS3ltK/EOv85b2MzeRq4kgO7r9636O2Rxepa+QvKRcgq9tImKDuDst
 YCj14VVhOERncMmEmSoBrqGVTKuMKLBPYaeG+CAyd6fObIt3srxCVN0e6JPBB3+pPibLOU/Icay
 ybDu8w6Go/RZ4uzbeWWhTJpkof0ZfxuBxuqvQvwR+aNNZi6VrmD53WIbbNqiBqP6OjWp1PQnUbG
 0Lkw1H+khOJc1Zg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_083155_955641_DFB93706 
X-CRM114-Status: UNSURE (   6.27  )
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

Hi,

Make code a bit smaller/simpler, with less of_node_put() thanks to
cleanup.h.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (17):
      leds: aat1290: Use scoped device node handling to simplify error paths
      leds: ktd2692: Use scoped device node handling to simplify error paths
      leds: max77693: add missing of_node_get for probe duration
      leds: max77693: Simplify with scoped for each OF child loop
      leds: 88pm860x: Simplify with scoped for each OF child loop
      leds: aw2013: Simplify with scoped for each OF child loop
      leds: bcm6328: Simplify with scoped for each OF child loop
      leds: bcm6358: Simplify with scoped for each OF child loop
      leds: is31fl32xx: Simplify with scoped for each OF child loop
      leds: lp55xx: Simplify with scoped for each OF child loop
      leds: mc13783: Use scoped device node handling to simplify error paths
      leds: mt6323: Simplify with scoped for each OF child loop
      leds: netxbig: Simplify with scoped for each OF child loop
      leds: pca9532: Simplify with scoped for each OF child loop
      leds: sc27xx: Simplify with scoped for each OF child loop
      leds: turris-omnia: Simplify with scoped for each OF child loop
      leds: qcom-lpg: Simplify with scoped for each OF child loop

 drivers/leds/flash/leds-aat1290.c  | 14 ++++++--------
 drivers/leds/flash/leds-ktd2692.c  | 15 +++++++--------
 drivers/leds/flash/leds-max77693.c | 20 ++++++++++----------
 drivers/leds/leds-88pm860x.c       |  5 ++---
 drivers/leds/leds-aw2013.c         |  8 +++-----
 drivers/leds/leds-bcm6328.c        |  7 ++-----
 drivers/leds/leds-bcm6358.c        |  7 ++-----
 drivers/leds/leds-is31fl32xx.c     | 14 ++++----------
 drivers/leds/leds-lp55xx-common.c  |  7 ++-----
 drivers/leds/leds-mc13783.c        | 24 +++++++++++-------------
 drivers/leds/leds-mt6323.c         | 22 +++++++---------------
 drivers/leds/leds-netxbig.c        | 19 ++++++++-----------
 drivers/leds/leds-pca9532.c        |  7 ++-----
 drivers/leds/leds-sc27xx-bltc.c    | 12 ++++--------
 drivers/leds/leds-turris-omnia.c   |  8 +++-----
 drivers/leds/rgb/leds-qcom-lpg.c   | 14 ++++----------
 16 files changed, 77 insertions(+), 126 deletions(-)
---
base-commit: 2d9e88b1a66c6b9a76fb16141ad3c6fb59334c5a
change-id: 20240816-cleanup-h-of-node-put-var-e442f2da1ae1

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


