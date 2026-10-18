Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81DACCF2CF
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2026 05:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pWsmmNgQyuC4nITyeMHO2zX1yCotQ/f74LykMNCcqF4=; b=dTKMX8gchHNdCJMEkT1sMOXNJv
	uppiUC/HGuaOh+VDH9V23kalRfaDLMucF9j3O0iM6lTmDU4P5imGu6ZNXlQ5o78e/gXDSv/Ay/Res
	ETnltGfAQOsKnU/rxsOiu5Ne0rOE1O8FVoeYJWX717Wy/07NGY5vCkWz+rl3xSVBjxz1qLlxdvLLz
	Hldr/bs/LUi2wgWAjImKLHiw/0ICe947ZukmfXCWnQk0hKoTSqUKotXDMEwRbJd67Szi3TxXK8ayI
	zdjRj3qcg+hsWEKqJhOwn4vLRekDoRa0LQUupumRa/sEJsAQUBB2dIOq3HI6Zx7wbeaNzhnOyOn69
	ixfQjIBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJr4-00000005ZSq-1w8s;
	Sun, 18 Oct 2026 05:54:46 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJr1-00000005ZR8-0RcV
	for linux-mediatek@lists.infradead.org;
	Sun, 18 Oct 2026 05:54:45 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2e9cf928dc9so1512365ad.0
        for <linux-mediatek@lists.infradead.org>; Sat, 17 Oct 2026 22:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302882; x=1792907682; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pWsmmNgQyuC4nITyeMHO2zX1yCotQ/f74LykMNCcqF4=;
        b=Fa7bHev3g6LDp5u9m7uJbBn7lFpmOvsKp9CWdcPdEXC1pV9TF9H9tgo+WgMRzpO4US
         T2CRtWtQ0NDfVTO5IhoLpJT1K84GSvE4ZihaV3+ONxoYdXFKRzsZ35JYq4iGbUQ1n2OK
         YzIVVMFrIZ+CnWl2OQGlU7ppy+SR5cfvlrOJw8nmfe9Qjlz2Wv1AilB9kXmDnU3IEQfO
         wywIchRPYhdFh7DUgxrDDBzntXkWk5zswSenjz0W7koywEO28JmAw4Yo5H+aQ25yHRiy
         Oe6zo1cBysfrgaydD6LLLTwZE9g3z4MHyuMAzxG0XE1SvKgmYAkGsCRoBNfMPh4AlgPq
         wNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302882; x=1792907682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pWsmmNgQyuC4nITyeMHO2zX1yCotQ/f74LykMNCcqF4=;
        b=MzDMhu88SiQJxfHSIZaZoCAbsZvJw5evRcs1bFodAVLNLy4sjz5hB89gbtc8/q+gqH
         2WNB+o/ytr361WEuco9C0YEz31ZhM+CbUDNgRKgUbQ0ItMQnGCL8hbq4qz0xo0/IlbvW
         eNVCfkBGyKHV1AHz2jy2C6qF1ICOA3tZaZMCKV0CHjky9brA47Lar0uqNltjrkDvP/bR
         tNTSwHsbg9MvuSA3F4Ze4MuyOSQH+ruYsPLCSkJ+Wbi4iFO3jVq5XgAAbO6BbxmUfyKN
         ZsTK/Aj/9d/PwbdkjN2b9igZz2nLCFjD560ewNhcMwGZhtfELstetWgxbVeD7to0wuuz
         7t7g==
X-Forwarded-Encrypted: i=1; AKwUvBxL+w0tCm+nifFN9sbtie3xvPDMFRh46C2uQ6uGnZGPkYttq/ZdUO2Y3+l+Tv22macOEvle7bMgH6s7psAaUw==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ+c1IljkMjB0KELJBJjCLwi1xkh7bSrthUNw3K+U0S1ENPRHgP
	+pSjQCWs/XcjAo2c3wqY9YnL8N+QKNqUMF9/w2/D53T5viwfIAwgOpESFh4FX8di
X-Gm-Gg: AYBFou3gnYMxc8/0nWMk8n9/lhoJ9IDi0kMQk2EO69V/TxcPUvPDpXoxlwPKbhoi/f/
	PaC4DBOU0IBI5tSAbeZ5YBGXQ3hJ4Lb7iEUi7gy9L/AYqEDrkdeSgVJ5wjG4J8Jdo7ji5xJPOoa
	oraicPOZOoVvYGwI0LmWFY382+Pn5mIYaPebeRVrUsvc4JJSzI6qsjpH5T3dl1aEd4kZNExmgzQ
	yyMENTyTkKQydXfIp5Bq9iR0vE5bKpAxEBsoCR9+md6/Ev113+QqAWOVXHL/yrtMsNcL0tvuv29
	txLpzkWzMzOsOyMcZ91Mx2jq3zZDFpPe3qrd0I4Ru4sPYd44ZKaYo0y0KFErFmQuKepI8T5tjMi
	NepPSkmaLcyXLvARHjqhaSFCrrmW1DhGM8iR8xAGGjOQWlJd3gmkz3nfxbWF14aUFg3T/Zbzu+p
	lp7dCv4aVmDMI05llg2iJUCAVZuRkyWYKRKtTz7UE6Q9QXESAHU0Pa+vWF5779frFinNCRtH6Af
	vIEKRwYNRrXMxsBKGLEp5DvnySs+FkovAQdQ44e7XvR0uUKQbAnayVtNZ+G1iPOQXVKR4HAz1gQ
	t6KKCECP13TZN54Nf3zzT8l728tGok5/gkNOmr3Z8+BJdA==
X-Received: by 2002:a17:90b:4a45:b0:3ac:b6eb:e0cf with SMTP id 98e67ed59e1d1-3acef5dcc94mr2797709a91.40.1792302882329;
        Sat, 17 Oct 2026 22:54:42 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:54:41 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:53:55 +1000
Subject: [PATCH v3 01/21] ASoC: dt-bindings: cs42l84: Document
 sound-name-prefix property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261018-macaudio-v3-1-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
In-Reply-To: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1125;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=vyIYXeTvpK7D1QV50HT+GFALOmTzN0QImSyZ/l8Csqw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4rn9v1rM2RbwXkbirPLsz4fsNjM/kRQz5nGODOYKc
 ej5qWHaMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmGpbf4b/fiY1H4ybv6Rw7+vrXbuf+8/0fd9/cvhsW23Edk9s36MfTAx/RXP0Cq1
 6awsZZE4+mdUmqcF7qnS9vuaD7RLe2eslDgmwAwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_225443_248690_EE12670C 
X-CRM114-Status: UNSURE (   9.48  )
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

Some consumers may wish to prepend the codec's name with a known value
to identify a specific codec among many. Enable this with the common
sound-name-prefix property.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/cirrus,cs42l84.yaml   | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
index 94062c1d9d45..ca137aa57461 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
@@ -9,6 +9,9 @@ title: Cirrus Logic CS42L84 audio CODEC
 maintainers:
   - Martin Povišer <povik+lin@cutebit.org>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 description: |
   The CS42L84 is a headphone jack codec made by Cirrus Logic and embedded
   in personal computers sold by Apple. It was first seen in 2021 Macbook
@@ -32,6 +35,8 @@ properties:
   '#sound-dai-cells':
     const: 0
 
+  sound-name-prefix: true
+
 required:
   - compatible
   - reg

-- 
2.56.0


