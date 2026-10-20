Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9BD60A261E
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2026 17:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IGqFQ1WG;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q0FbKEIF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=; b=IGqFQ1WGMxpK5LHlAobmbrk91T
	87OUCqbNGKOU47y4ABTuw1ePXjWxkc6e9H1jy/Qh/EgmMWuJKwfWiRBOhE/h5+mnT5IK0s7bC5NoD
	Is6OJobi0thcAeY0J24FoGAhK8LNvhL/MDaj4MP1xEw0kTWKpnE8kE7WAdhQDHj3Y2GmQW8n+1Y37
	/EabdtEhDV3MiXx9rOypMHS4Q6TUc8vntJ2e4G5QRI2rbOIcc2zmfB37JWoK8TZ40Z6D/+klfFY+B
	WnN8alCAyDlRBxiF29KTyY6SbRZcjWe2AwaMoYoUy/gnfYiVBrxe8wU5EWnLBH6WnF5lC1u1y+Nce
	1EvJGdJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJDlo-0000000AM2V-0uUN;
	Tue, 20 Oct 2026 17:37:04 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJDlm-0000000AM0s-0mof
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Oct 2026 17:37:03 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a1e266fca2so19995895e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Oct 2026 10:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792517820; x=1793122620; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=q0FbKEIFRygHTjfCXh2EgbfUfsUau++/8ekdVKPTWGpmVwsa2fYD1RRMHr5GKg58Jm
         +NmIBE+HZVmBx/lq50rThWKaIiL/Bp0qUTXFGoEUYhV5UVG/LSftV0fcix3C1b2jOEtq
         Uqq087381pPuk2iziEMMf72aJB0YRpXBMTGr8WUqnor2ZTqodWk+fWoIvw/6w+WttnvP
         w/n7HzSTtYSOts9HAatHkPPg1cfo1zOMu/291v4Paz0P+D6t5s0Hkt72pWvjUpuPd4sK
         7Ga5ciHia8sUtByX4MjHBaocM7Iu5VLxx8JDf2yMCTZH9Z0b+l78W1psodubYnPB7Y0T
         BMew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792517820; x=1793122620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=MOj5CcY+xtYULM2FO7urvuy1wm/uXf7rWmnlckbCtTxFWdbS36gM9qmPVK4iFUS9Dx
         RE2YX2042j2/PJDoA4V4IN4T2P9NVZKkZrraAUwa8w5Y4oekxyYgnS3s6fDwSIopGeAx
         Aj3I0VkZBtttQgb4755TkxvqydPE4iN+4bPoNkrurd/4Yi/CJpLN0rfpsZ8cjwISaSQE
         KQSMw+3S9LpFNxePlfxTTfNLx2SYRbkjqAT0gnGlyUMP9DSPjP1HZv3U3k78iXW1JHuC
         cr96iTO1HfZf6aVzygWRn45PYBdWLia/lYPEXAn3WTXv45vfoBwEr5FXArqpT+p/SWM5
         kxZg==
X-Gm-Message-State: AFq9FYLYkpYg19kox0KduMfYpQYeBppJbUk2q+ED12nFcMswh71w5hvB
	3CRkvTfzcw06QM7uMYOEzx9LBR6l/drTBErGIwMlSrS1T7WBv4uZlWUbcj0EbiOp
X-Gm-Gg: AYBFou19rFkVgbAjau2xgwNKbwxCvefZle2enGZ0Cgg+EKME1pwd4SPG7okzVyhfuiT
	hj0gunfhpkcG3T35d0cjJqR4dQDu7svlPh88jEhRC27ZXZSdCHGxCXB2n0z4Y0EZ4Z/01sod+q2
	ES+/SynhUuosqkVE/cOXdiJSR4G4HYOzocX4/L8auaDDdS9HcE9DtHuUjoK3WsQSDcR6uN0S10T
	/QOBeKJqPPo5Yaf3eR7Pg8NcyYTzAzL0HzG3Fs1GwPwdmq2cOoA36xX+Z979NF9yhXTFO/FrYqn
	E1L+ZxUkMlwgknUpRjTfMWOkbZf3rFO4yCUGZa5rnao23ZNHxL1OS5l/xTgcWeEvYAoLGYNd6ON
	RfPgfbfjerhKyeaJkJd78YNKtaOhd0GY6nuWw5O3YmnAtENj791e8re65l7WMxpoQ4gMZA24Qmx
	pErEgQNp6pmVUzBToeUOlG5TUCZggBwSgtO5Svkk/iLvLYj9KDQal4jg53q7XjpJ4WqTM=
X-Received: by 2002:a05:600c:c87:b0:4a1:fae2:a8ab with SMTP id 5b1f17b1804b1-4a1fae2a902mr22956085e9.3.1792517820215;
        Tue, 20 Oct 2026 10:37:00 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f8016c93sm52505235e9.5.2026.10.20.10.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:36:59 -0700 (PDT)
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
Subject: [PATCH RESEND v10 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Tue, 20 Oct 2026 19:33:23 +0200
Message-ID: <20261020173556.632798-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020173556.632798-1-l.scorcia@gmail.com>
References: <20261020173556.632798-1-l.scorcia@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_103702_245802_F5191F66 
X-CRM114-Status: UNSURE (   9.16  )
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


