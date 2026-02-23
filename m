Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10434EC1113
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Feb 2026 17:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GZL3Fp+qjeYQN997X5TZmi0Oj1feAEcYEmK2ad84vbQ=; b=E1du9CKzlvgsQDAyt6WyJfQVqf
	3VVtjrcxBBQOwtbCv5TyvkQj+bDmZL7HIZr6zilqjXbwVQx5iHlvT2vuNnXFdNuu0c0Lqd1GaBEGp
	BaAgYxlZEruE2FfAiq4bE1QjHTTFvaAjAufVIoWTe1Rc/LxXERk1GJe09cyqrFtgcpQKwLotGmg0N
	vJW/UkdDX41VzullsJ8H61EfUVPL582E4+oSq6m6/A23boeEWpp82u7qGbGuLvERxoZp1jld0N2eF
	b6NrhmqqZQv4GcrlIMgJYbNfKtnu35u27zrEBZgQ6skUMlN8/5z5Eq/44D61jUhy8sZsGaceoQG5W
	+7sApDtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZZN-00000000k8d-0vr6;
	Mon, 23 Feb 2026 17:18:05 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZZK-00000000k5Y-2EZx
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Feb 2026 17:18:03 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-4376de3f128so3289978f8f.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 09:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771867080; x=1772471880; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZL3Fp+qjeYQN997X5TZmi0Oj1feAEcYEmK2ad84vbQ=;
        b=LqPiZ0YI124SfcokWvuJoJ4+Yr/9ImCJtKERcK/Ri53Py3lyI1mMxt1avfp49689Os
         8Giv7VP/7laTOBmwnPErk2qR75T4+vqi4VeAy6AqZyHpkU8mC+xg4J8EJeHb+UIuYMWQ
         XJauiX4uQYFfHHVICFjjZTnL7cHFkAuiBGSeYsXufyGbEV3TpWPiUtQyWFrbLfRnRyb6
         ieSVg628e9n1kmGtmRQGSRzLvPhgBynEdx/K/vKeDjPxwWFbeGK5biKEgy0z8JO6cCXz
         z3DkGEDbp70dcorluYMve79rhoSiWzU4RwOHGGA4ND+v2tKXSAWND80aR+HRTO4gLpoO
         LIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771867080; x=1772471880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GZL3Fp+qjeYQN997X5TZmi0Oj1feAEcYEmK2ad84vbQ=;
        b=GABNL4i4WcmV9DIbKgN+Pkup8JzSQCM939pwueO48QUiwlMxNBOczI/InP29YEPfCx
         1AsgOSwMg6kxrSs+iltk1Xs6G399VOLLAJaw04xZkIWeE6r7unaKuFgfihJ0fOcWHOzq
         BFsKI6YHjIlN6izArh3tJGzALYJpQBg3d84zKK1gH2TUNCe2dCN52u66RYffNUiH/ZsW
         HSSNL22kQe8fXqu0SBGAbgVIy4m08sY1tq36Kx+V0CCZRDwYYA5dAZv8pIDH2Uba6JZC
         DBkqhRxPWOgAN+QOWAlgS5ktnTyqaZjYXo+MN9B9Hi1JHoXAdJqUmtILWEMyMCkLzzCX
         Wdkg==
X-Gm-Message-State: AOJu0YzNKLwm8yIBesaWSKbgsg678gqEbA4HHUcuybrxNzA8t4OGibdg
	4EeqyWMNqfCEeN6N1KfwRB9zJvdWJsDrVxThpb78Tb3OdBfz99WkN7W9vd2A2w==
X-Gm-Gg: ATEYQzwbXvRg74JYEx3DdMKmnOxPzvf9BCt8YkwgtJVyVffnseAza2hsKnXiywarPxh
	YgnprrGpgRR9reutdOh9KesJ+9WqMLMCK53DhXNtGimP6aBT/Vf0AX7HwowRTvSU1F4ITkJ8br1
	LiJvnur3RvNonoSU5dj0a3ls8WRUsbtM560H83Qjs6m/hUSih+RDsRDPVLVKzS6q4qwU+K6aMyF
	AD5giWJmaa3ikeSJkgc/X6Tq0zY+Nbkqkhikomxv8d9rLUTNmdCwB5F8Nui0G2Wm9xPcs60f3wY
	hloUhWRz+FS70c8GstaVvONBDY0b9YS1PQ8dddr23rtt97l2fLaQg58sPDHJr0ZXmrGMtXohYGj
	5DDAWupCS8zWS/qHSbIs2zOJGqnKAl7imxEa0vpP7Z1NTXKramuWki4a4Y26zvLEb35yw4RTqRQ
	MQ/McprG6XEWP545Geqdk=
X-Received: by 2002:a05:6000:2583:b0:436:145a:e54f with SMTP id ffacd0b85a97d-4396f169c6amr15272283f8f.24.1771867080189;
        Mon, 23 Feb 2026 09:18:00 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c982sm20871454f8f.31.2026.02.23.09.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 09:17:59 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
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
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Fabien Parent <parent.f@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH 5/9] soc: mediatek: mtk-pmic-wrap: add compatible for MT6392 PMIC
Date: Mon, 23 Feb 2026 17:12:44 +0000
Message-ID: <06b45142f4e6a30f9f53aa561a99b936ff72c035.1771865015.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771865014.git.l.scorcia@gmail.com>
References: <cover.1771865014.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_091802_581653_E900C126 
X-CRM114-Status: GOOD (  10.66  )
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

From: Val Packett <val@packett.cool>

The MT6392 PMIC is equivalent to the MT6323 in terms of pwrap.
Add the compatible to use the same configuration.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 0bcd85826375..4b8d49c6f34c 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -2249,6 +2249,7 @@ static const struct pwrap_slv_type pmic_mt6397 = {
 
 static const struct of_device_id of_slave_match_tbl[] = {
 	{ .compatible = "mediatek,mt6323", .data = &pmic_mt6323 },
+	{ .compatible = "mediatek,mt6392", .data = &pmic_mt6323 },
 	{ .compatible = "mediatek,mt6331", .data = &pmic_mt6331 },
 	{ .compatible = "mediatek,mt6351", .data = &pmic_mt6351 },
 	{ .compatible = "mediatek,mt6357", .data = &pmic_mt6357 },
-- 
2.43.0


