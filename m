Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D671FEDA07
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2026 18:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+y0veSsgUsUJmnxU5xqCTTpBOt5TLJfl8EzSd1maDY=; b=YfLxD0WvnFBewlbUz5YYNeEWJQ
	bx4JgCGvtoQBGyRTS+K/qSsxMBgpQow8Dil2hEGGeHweGeQSWxXSeuQh/LR/dIMJH6Qhn3suaMqsL
	gC1bG9nznD//zJC6+XNez6gaig1qa/iD2k6N9oEMSB6f9FrdtmaULkdr1j9TEChvKTIkNoHtZIRyR
	eRYk+KCLfAbl7iSTuKDlBxOWLoTI4q7Iz7hmhxOh/xy6vj47WzIrpS6ZXBIc4tU5pK83r9Pe26UKZ
	UVbV28Uy4oyf3+PTuDkcaHgjQcLfZG5JFy8kioWSuOWqWiKtK3EHXkw8kQcA+gk5YpToycSVLuRw5
	LKdqfzTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ZQP-000000074Ld-20uE;
	Tue, 17 Mar 2026 18:45:53 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ZQN-000000074KC-0wP3
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Mar 2026 18:45:52 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4852e09e23dso52239835e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Mar 2026 11:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773773149; x=1774377949; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+y0veSsgUsUJmnxU5xqCTTpBOt5TLJfl8EzSd1maDY=;
        b=e/+zl4owtqvCb7AW8MVCecEce3mEFwezA8Zh5s+NG+salIPgf6pAA4GuZuVJ7BH0DZ
         x8qTGttfjUxtyCb4yFz8/knvYMFlkdRhlHGHZlsKnNas9DegDO2k2eYqvvCIGGiMGMj/
         8FWERRMd7WGF1KOJBq5RIreAiZ1rJu1ypgY/C95hdzsKunIwt3bZH9GoMQ/gBDwghj3R
         FYJET9S1J1gYeMBHF6fpGkQdLHLeTK7Rv3USVxZYOZ5wGDrYxR8kLNGuztZJgC6PEt5s
         r22DvIQA5AZ/TtW++W1FLyH9wYLkn8wDXC4LfEV/zjtsJWgtR7ji2wcP6Jy1Ch7WwAwR
         Ms0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773773149; x=1774377949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a+y0veSsgUsUJmnxU5xqCTTpBOt5TLJfl8EzSd1maDY=;
        b=VwsGAc6TYbYPUxFoYPK6wOcDFiQpmInquf/ojOL+hi7PYP0VjTulUXSDs0EVqLP4/t
         CH1ip3UPidBSk/kCqa0VVs7vsSw4Aj8perb33elXIdomVX3gxFEk4Xywr5tDOPM/TKl3
         rvxN1CaU5r92wCTc9U7cmaVVxgWUlubIKQOVp5t/BMKQQVKwUwrp983N0yvJKnegcPIA
         xB01sC2LDqWWAVaKx2tnVYKwRvfcmzJ7F9ju6fJJVxCt2bUaXL0+KbsWjb5ifoZVheEj
         JTSNzZTIIZk/feb4dz43V5IUL45tj95ZypDPUzu0aZwVLmuCPtR+vlUcwpN+EjxbenCb
         E8yg==
X-Gm-Message-State: AOJu0YwS5AOJMgGtrkyxxCjWX7Xm8i+9Jmm5lOBDk8tZpljQRqdI50u2
	POs6JbQ4raxP/Cmk22PtDe4qABGRvOAeVpwgfOi+fcmLkNOY2pMh2/p55JQjjEGs
X-Gm-Gg: ATEYQzxXcYVi6MhGjh2zFdQZhphhwgIOnKKOhZTMYV17uCy2DnnXm9k2dvKZeOuMcMH
	Jfd1QM3C71hhT7iE/p3lh9ifch6e8lqbvKBpDZCjJJobWhEQByH/MWKRNcZgG7gqst4IQCeNaJY
	AAXnMwB0J2xReDXSGPMAcnhjWEV9VmawOLVdlyOwejjReAB1yr5q55lrkoFz17toQKIkCncv/YK
	WeZt+ffFTknSsBCpLkkXMRdW8h+YAgc2QUHnreckBRPFn1UuIfBIBNOgvQOHC9fIhUvduwPhbAg
	tO1ksQumhEYJItnOgB8EX2ozN+hpRnRVBMgbp3UUuPB+E9ZcCcrzCXwfMpEFFtfbHKlBV9EjAC0
	I7rA6Qn0iYyizr9VuqEBqqFwyd13sZoDL7iMFrgqNYxu8UcrnDzULd+/1e2KC/eTiS3xwJ5iYlh
	K+pNPZpl8skDsBgXJVIn/tX9kqVrl7vQ==
X-Received: by 2002:a05:600c:1f93:b0:485:3b5b:eb8 with SMTP id 5b1f17b1804b1-486f4463591mr10143505e9.26.1773773148893;
        Tue, 17 Mar 2026 11:45:48 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4ba760esm102725e9.24.2026.03.17.11.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 11:45:48 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Julien Massot <julien.massot@collabora.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 2/9] dt-bindings: input: mtk-pmic-keys: add MT6392 binding definition
Date: Tue, 17 Mar 2026 18:43:05 +0000
Message-ID: <20260317184507.523060-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317184507.523060-1-l.scorcia@gmail.com>
References: <20260317184507.523060-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_114551_291386_F42755F9 
X-CRM114-Status: UNSURE (   9.44  )
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

From: Fabien Parent <parent.f@gmail.com>

Add the binding documentation of the mtk-pmic-keys for the MT6392 PMICs.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index b95435bd6a9b..2d3c4161a7f8 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -30,6 +30,7 @@ properties:
       - mediatek,mt6357-keys
       - mediatek,mt6358-keys
       - mediatek,mt6359-keys
+      - mediatek,mt6392-keys
       - mediatek,mt6397-keys
 
   power-off-time-sec: true
-- 
2.43.0


