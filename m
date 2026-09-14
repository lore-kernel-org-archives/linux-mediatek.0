Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E937C88E64
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 07:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qB6h8bEY4JQqTm9X+KYhPwqJjNuxDZMSiRPIGrpZWzc=; b=IEs50P/s8Ukruwvk1b7HH4XPQC
	CAHSWaPQ+xy9T3JlMpJMozjO8BGqR95WZtwJaP//fF/sT2IG+h7GCbMAYtRAfgjAN+mkyBTyD3NiX
	Jd2eBVzqG2J8Ktec1KNOhxucfqvAUaR+EL23SidAMMUcoeDVdeIgkGJG/NZ1bSrKiIRWMXu9p4UhW
	FgWC3cBONUTET8gdNUMfI26+At+rXRMZBM7CLPhxUpYo4NEgOXXNW5cPnqrzTyZtZz+qC61D9n218
	vjqCRFOJQ3ED9xDwVc8zEESbt8W3k2Dh3BXqkwsLHpDwDe6euwONa7Bs0zwhSBAo4xwZjHe9cHzVS
	kbRC69vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x618M-00000002YnH-0TaG;
	Mon, 14 Sep 2026 07:29:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x618K-00000002Yit-0Wea
	for linux-mediatek@bombadil.infradead.org;
	Mon, 14 Sep 2026 07:29:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qB6h8bEY4JQqTm9X+KYhPwqJjNuxDZMSiRPIGrpZWzc=; b=g2H8ucy9CJrz96uAPOMZjW+rKp
	I5qXdwHcmJ6Io6dbHjL15Mtzz8Zd92V3UQFeLn5EoPFJff4tgwlPdP4IvZxMRt5SSYDxfGFFb39iQ
	4IdOP8CamGDSuvR2rpiWW4kM/BEkvqmm/UJR4wCpZ11QGy0WQBuB5dTO95AKL9aCBcXRLHbXOJXJK
	5DTkFkM1S4UwxolblWUqUwOhwbrvys7ECCOdEkK6pylAzW/aDhsBOD7dPgS/mdkil/PygXe7dVGSC
	/EqXjTpGhT4MDfO7vYhym460MwUt60i/Dpe7BZX7C+g+WQHZXUoiNjJg4deX1gK33dx4AETtkfA6u
	SUuyrARA==;
Received: from mail-pz2-x16.google.com ([2607:f8b0:4864:3b::16])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x618H-00000005KtM-1Wci
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Sep 2026 07:29:43 +0000
Received: by mail-pz2-x16.google.com with SMTP id 41be03b00d2f7-cc4bdf8abaaso1726707a12.2
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2026 00:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370977; x=1789975777; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qB6h8bEY4JQqTm9X+KYhPwqJjNuxDZMSiRPIGrpZWzc=;
        b=cFwhUGUMhxcFkL6IzS1u6kFnzKakF6bzAUW40zg0h5pprMaABRR/cf2WDKn9cM+BxH
         6O6FJFzgT+J6gLAlsk/i4pfVvFGHhTnb3gg9exJYEnicdIteiS7WVx7S5Rmm/O8RGtID
         GegSxDg0AYDGS3BjWR5GhPTas5I9UutNIfUSxfhTa1Iqit4kG7f9EP6m2c7JgVLZWbwj
         LKc0aWflXpKmFMczbRkorgXjYDLmbKDG1u2w9aRTOdZahmeUAtvxLJ75q5mhD2gLb0q/
         Ggv5hoivw8fVSgIcqVj1btrsgEIN7PTZ0GUcmA+VcPzFLaX9ugRbOS/6Zhpt+GrSnUnP
         S82A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370977; x=1789975777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qB6h8bEY4JQqTm9X+KYhPwqJjNuxDZMSiRPIGrpZWzc=;
        b=n68xf26291AGd4tYWNmDQKcPFpzSWtutBh8GYAZPNb9mw2obR6GShsmxBxjS0OjIae
         VppmeY1Ctmz2HRW/1IXd6FV8TT6WWHbgU9oeynhEnk9DsW3QFBVjf0p9Vc6ICQExdFMd
         WaUF9IRGPt8QKvfCJSrrIq/zTd5WYYxbjDHjM5/9xB28zIFpMhr8zkCl6V4qPZuJ76pc
         LRQGVFtXvbFC6qRa97eFJz7sn/ytv6hzMetB+bL7yLKE6OE4ZCrQRF+vGY79bbxJDfzq
         jXk1/OFTH1U03SImyeAop+d+n5/4phEg3OChS9jTKYAhf3jn55+EqqopCpI80/1FYB2g
         Wg0w==
X-Forwarded-Encrypted: i=1; AKwUvBzfaeLTq1jpeWwca9TQeJkxb64I8dsh26t10VJEkXLo2MKEGpkoMa9iGvS7cF/b7Cx3PpMv1uwGeZsMpZuwCQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lC7I8omiEFDu936uY02MNT7g0HvW5tVaPqqQ0C2hW8kLFE/Dt1
	ZiH+NC61/GkUhfmyxZGZOOPb1amzHd6E9nJU9Pzgq30fDrE/2RyAPSFv
X-Gm-Gg: AYBFou2OcWwJnYcQgxrh6w62sIvCfpmI8sOtyZ7muKSTbh+VCplaEIRdZv9cGi7so1S
	4YLvyDZEfzKPumyFVojAeNVj38jPS74AKoktjgplkhmW5+dtRImz/+eudWM9jfkA60uJ/Tie7iu
	CFTzmezQQN5wb3YoGr0KE+2HauxezJ3Ac3mU+rTqJQjo1zZenYQkmQazIDd61cXCaBd4NJFH5in
	+SyTlUvRhNyEFphbBWPPT5bIMjH1lnKaL7+bHxyQacrH+MRQE410tg6P3ygI81FwtZwoilS/0r4
	9sR6jYCeNofZh3tF3nZP+odluguUwJXzPvwWyr9NcUOGQsP5htIe1QycuzX1PpoBvDr7+kE74hA
	UUq6UnUFVhxeGJq9XOgf38JviTiEnkDWH4v76sL9a2qsDfJBS1t+Kp3p/UkbLi/D4rnCnMPOUGU
	TInlVLyiJpq/2O9+KbCPHE6u/7TXu7jCmGX9dp9mVdejYBNjmh9heRscjF9SYLjE6jXyvHWTmKC
	bGJRbf8bcOh/ipOW4fx7xB0dt3Uh72iXeDK7adQv2DUCZnb6xXYvRCTOsxFeosQzRniI1sKQgIQ
	V5ex0VxCen+PwQI=
X-Received: by 2002:a17:90a:e188:b0:398:b71e:60c1 with SMTP id 98e67ed59e1d1-39dec05885emr3027132a91.12.1789370976645;
        Mon, 14 Sep 2026 00:29:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:36 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 09/13] ASoC: mediatek: mt8189: Propagate APLL errors
Date: Mon, 14 Sep 2026 14:28:38 +0700
Message-ID: <20260914072842.24420-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_082941_545321_9EA3EE66 
X-CRM114-Status: GOOD (  10.90  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

mtk_apll_event() currently ignores errors returned by the APLL
enable functions.

Propagate these errors.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
index 94c49a662e2d..4826ee250d70 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
@@ -485,6 +485,7 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	int ret;
 
 	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x\n",
 		__func__, w->name, event);
@@ -492,9 +493,11 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		if (strcmp(w->name, APLL1_W_NAME) == 0)
-			mt8189_apll1_enable(afe);
+			ret = mt8189_apll1_enable(afe);
 		else
-			mt8189_apll2_enable(afe);
+			ret = mt8189_apll2_enable(afe);
+		if (ret)
+			return ret;
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		if (strcmp(w->name, APLL1_W_NAME) == 0)
-- 
2.43.0


