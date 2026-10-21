Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8284606A31B
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2026 10:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S0vRR5Ub;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AEJUkrRp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=; b=S0vRR5Ub1BMmXhtRMzZN94DmFG
	bM7bJTDad1h8oOGYj9xqklNGigscQhM4cSc4se3rUlPcHTbrGhI2XeYk3zTQMghWSQ8mNS8vhl3rd
	ClJOwy8f2dq3ecvrYZf1rqFJ4fe8jy/dBRkLxCXA9sOuXkMfl3ma9utq+zmjr7wPLmQwY4wtZm51o
	Oy4JjfDhSpBMEkyr6Mnlj3xW0RUw2kKrAZBdsV96KvI/bZbLlVq/VhmgOVibYhdGj/lAEekUGLLiJ
	IXP2/46hixft3Q8lkLwFCBPq1t4ajini2SeTsPvMVcgvdnGI8jcpAnc8yxVFJeNeTJbzcWoYozlNy
	qxNa4Q6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTve-0000000BewU-333M;
	Wed, 21 Oct 2026 10:52:18 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTvb-0000000BetX-1p5a
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Oct 2026 10:52:16 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48bbb06e746so304877f8f.3
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Oct 2026 03:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792579933; x=1793184733; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=AEJUkrRp5zJvwz20iSIMv3Sl8PjeWxvVxSfSzsr0yksKatDXamdmaIKlZoo6jPI1JG
         vJcEFHnOP25gT7lhLi8TCb0cULieKwrMiyN68cXgxOYhVVtgNIfjF/8FvrErVIe24L26
         A5rT25tw8BbhChOmTQoe8i8Yh1Z1QV9qzlGFvG40b3vc7ax9FiOkduhjzZN14zkJTZHm
         /mBRnTn6M3wIiRFr4/+DuSO4r5hWx7wirFNMjjr81r+cq56792Vsm9RsFdmqf/VvssTs
         d5ghXcjyjQ0tX0aP+xCiEYBfNMH2ONnSeI7VCaB+0b00+wPpQQUZiEegnRDQxGFvoseN
         65CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579933; x=1793184733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=DHxMtHrbvO3GSHen6ZIZIogIi0/S9XjVWhcNYL9Xa/VkT0T+EFX180xnUpdYVk4P/y
         UqrZ2MwhPwsyvu/ekDfkjfscgdp+N8iJ0NyKbz1fdL1i7OSxjzjV+HD3+K+yidwISt53
         YMdh+lRkpH6WuOe7c4D6JW7u2Oyg+y20Rs9EGbJC0fDYdIWU8VHVjLwuK95d2AZxfT53
         9kEOePAExfCP0LIauxjBPtM8ZZ6tp3CYuLEw7UnL/fhvwRzN8sZSAK7PCYmqQNMf/pv0
         9Zw+gM6wdLuOlvx6GZNuLviRcbMeRptpVNfsibB+V79zC8Dvyx48TGAThPC6diX7c4+X
         JGmQ==
X-Gm-Message-State: AFq9FYLYKAbW5sk1QXYIdTpnIhzqVu4nPrhNjlpi9EY/SGFDEUfXqiSl
	+3TW5O80CW9GzfXoRcqxVPMzdw86eGZpn5jNq9sAiVcjvDjxq+MPCPXDBtPFkmMR
X-Gm-Gg: AYBFou2kXbTFIjQKfs8PgoChL9qqcjq2Thb+vaEFq6Yq31ld87gNYV69PClOtYvHvVe
	Z5oM4nPLUhG3NvHelKq6Ix2Vjp2dRjnKwPvQT9kRv4qFuj5Q8/+uum+AQ8OirzPsqMQm2QqF4si
	IiTws9MnGUgMrVg8GsN8B4LwbSlckW9n8kYrxkk8bcIA2Jag0qscPKT/eEAR9fxBo+qsz1j5PKv
	6uisU55TGsBVhNUsdBVlBMcrfe3kga6LjIcDeoTlJcS3UYpvbORPzizI4nA3c34fi37mxko5L5S
	cRHVqvAHAmzjv6CunRBPo7Z1WR81M/hxb+xf9CmnJtYC1w2lK5bGBbC2XVZPdDST+nXrrc8NyB7
	+Vaz1T/ZSJnw0oGBx7phijePpT/0mlTLzPCZW0mBSGGNeuE6fjDWqbXFhlT0K5zYIjRqdeVf4kO
	z/6bbxb9UnYyHpKrZqIuNxpdZB14penyROvik2p5Z+O9+7tD7AHPXZUWa5NK5m6Y3P43lfidzBe
	fnxNAi1dbI5TlZ6HPH6FJVGGqDT+QjouhTFvUmArSR3xEynkndh
X-Received: by 2002:a05:600c:8b0a:b0:4a1:7ed5:99e8 with SMTP id 5b1f17b1804b1-4a1fdd23003mr30749575e9.22.1792579933214;
        Wed, 21 Oct 2026 03:52:13 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d6e2dbsm153388305e9.13.2026.10.21.03.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:52:12 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v11 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Wed, 21 Oct 2026 12:47:20 +0200
Message-ID: <20261021105109.199886-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021105109.199886-1-l.scorcia@gmail.com>
References: <20261021105109.199886-1-l.scorcia@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_035215_490006_22C2056A 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Fabien Parent <parent.f@gmail.com>

Add the binding documentation of mtk-pmic-keys for the MT6392 PMIC.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index 140a862ecfbe..ff720588128b 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -31,6 +31,7 @@ properties:
           - mediatek,mt6357-keys
           - mediatek,mt6358-keys
           - mediatek,mt6359-keys
+          - mediatek,mt6392-keys
           - mediatek,mt6397-keys
       - items:
           - enum:
-- 
2.43.0


