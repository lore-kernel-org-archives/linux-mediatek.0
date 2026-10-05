Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1515CA6003
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2026 11:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IaeSmAbEdNNCv4ePy9V8UJGOy8eNT4mDncD0icKlLB4=; b=CqZvbYGQdsI0qeaHkVMj12+RQg
	x6q2r2dARq3rgU/1Q5AMlBucl32lWtPYg5w4fnAWjyHs2sIZ2+A7JoW8xaA+2H/uLgv4DVbsq6qja
	cRvFyGYHrYZERSYaZZVEhjTd4RHE8QsYlFV+IpIILdshoDfGmQSij/uusFSiiB7yUMCPF7HIe42BF
	N1VExtGlChDYgmVeE0wuAa8I1zIOoFjb1Gqkdt+kdXxCQrT/OtT/29MQroOr03tnThOpVjvhEdzx9
	7XS2bTJonP+TnV724hZ46PF2ey9n+C/4ab4BAHKJ7ELKqxPvBl9Njxpll/JnUnklBxLm1yKA/yxBy
	n3lvpvmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgU9-0000000GHQl-23iz;
	Mon, 05 Oct 2026 11:03:57 +0000
Received: from mail-pz2-x2b.google.com ([2607:f8b0:4864:3b::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgU5-0000000GHLY-3ohL
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Oct 2026 11:03:55 +0000
Received: by mail-pz2-x2b.google.com with SMTP id 41be03b00d2f7-cc78dd54610so408418a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Oct 2026 04:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198233; x=1791803033; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IaeSmAbEdNNCv4ePy9V8UJGOy8eNT4mDncD0icKlLB4=;
        b=eIxmqrDVPB8kE7k7GqcNKdkAFAEMjIpJ70YZra6qI8tJ6LN2v/gFJ9mgqPWDSquya7
         PhgnhcQ3Pezr6avtOnI0voGSAZo+RNJ4PUkH3Y2LCzS1lQ2hygKUxBIaMFjOhC85+sQ5
         NshV99EkCF2EbYm8XybjN3pv6C/KWWe2eDR6vLrh+t74/2JW7BCQ4ywZ1U1vub/G4yfV
         44yHTQiznZcBxM3gy93Kw7y27M0mjqFAsJ8PlgvyC0JsNpmJWMBhUb2+xW916BERPIaa
         DuKEOgiGWL31LAMyHwubgL0w2EFtkKCQYq/an77mEi3sC30Y8NMgnBMzbF+c+pKO7FIm
         uwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198233; x=1791803033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IaeSmAbEdNNCv4ePy9V8UJGOy8eNT4mDncD0icKlLB4=;
        b=C/KI6IFCg+tQTq4ESU2dkssqcqBIt83yAs5OhKc3pWfsuL4i5jAb1wgZ+VuF/73CiQ
         I0XvnW7a18SltyxLRsVJMyAzVD8UEWYkK0/Bq8h4Ibzu/f67mFp5XG9RUbD7TXUD2Oja
         /OIZhN4nGCnWNry8Nrj9ST9bmyZzx1qClSH0XwmC5dmvazvpzThW1C4Vq8qq2rvrgnUV
         MY+1BhNC/9bXXozZltiQsbez/uN3NhMbhQKVbOM4SBIyVNLaknwYq9ulaYKTxOFwutwG
         F0wD9oxrzvOq0qeJrbt6mwDVBhx1DmywyapZwnkC2RMNQRM6YKKHoa9cP8LYV1jdJ3Nj
         gpPw==
X-Forwarded-Encrypted: i=1; AKwUvBxsjdXZqBqqP18bg5yByIflkAAJnO6Qiey87hgXSqTXihdyOIzG8IIO7GLt9Z0kUCdIbsSi79fWQbk7tcOJDQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lhv97nbFIcRRGjUxh3ZazPS6VaDMQLASy6w7f4BNr1e7FmGXml
	kn3lkYhtT834NQ7GyM0E2Tt1A6ih8dZoBSt/JwYxOJ/zYaUnuhGaN6VZ
X-Gm-Gg: AYBFou3vyOWV+EOwVM37K2ZNIAwEDSYD15lqOGYZQa2URfDuZ2RCWMfCzfWjhnLMS99
	cs0MDnU1VmHkDQopC5fGNlFrUmZUJxF7HitQy8jdSvB9+IjpfkX2Yi7UIcZKpk0OewXdi75DsXO
	kZT2HiF3MM9KZ8sYiXfsVDwAVu9piu6TG7U1pgYpqGyrUdw7PfDhTqm6BcQU/ZJZSEH9ZJY5xuk
	H146Y8U/xKDDqlNV/BUgdKrTBMDm1Da+S0vV9uCw6Ms7pioTy7REZJpveMeCcahK8z6HJ97AkeX
	ExmjaYStm1cIF2qpyNXQ0QZkOVvS7zUnwILfCu8nntgAc8IXbuk+eMp/Qo7YJrK8MSAdyJwxFLL
	ACwTZp6kgVJ5Mx1J1BHuCuxZGbpVNgHxepj2NqRDPNXotgq1fQzoYnfnAjacm/6nIOs9vwxsf7b
	4VOzz8j08B3LTBFCX2C/Ce5CDZhd1ZIXAj+WdXKbl47frtCr043WMP6NQxS5Wuic/0kwjScn9DZ
	kfTnyoDfKwo5k5+pl0m9dWOW5Dx+bYDTbfujPnFJKsKpFI5W/OIhMjOOKb1caQgDk6XfNq4dRsn
	Cl7PonSM/GGtHg==
X-Received: by 2002:a05:6a21:b82:b0:3d1:39e9:b261 with SMTP id adf61e73a8af0-3e0bc6b7503mr9745642637.0.1791198232809;
        Mon, 05 Oct 2026 04:03:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:03:52 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 08/14] ASoC: mediatek: mt8195: Remove redundant error message
Date: Mon,  5 Oct 2026 18:02:51 +0700
Message-ID: <20261005110257.50145-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005110257.50145-1-phucduc.bui@gmail.com>
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_040353_950936_B45F0B30 
X-CRM114-Status: GOOD (  11.97  )
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

The errors handled here are already reported by the called functions,
either directly or deeper in the call chain. Therefore, the additional
dev_warn() and dev_err_probe() call is redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index bb357cc674cb..1bca2f62e76e 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3083,7 +3083,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* initial audio related clock */
 	ret = mt8195_afe_init_clock(afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "init clock error\n");
+		return ret;
 
 	/* reset controller to reset audio regs before regmap cache */
 	rstc = devm_reset_control_get_exclusive(dev, "audiosys");
@@ -3130,7 +3130,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	ret = devm_request_irq(dev, irq_id, mt8195_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "could not request_irq for asys-isr\n");
+		return ret;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -3188,10 +3188,9 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* register component */
 	ret = devm_snd_soc_register_component(dev, &mtk_afe_pcm_platform,
 					      afe->dai_drivers, afe->num_dai_drivers);
-	if (ret) {
-		dev_warn(dev, "err_platform\n");
+	if (ret)
 		goto err_pm_put;
-	}
+
 
 	ret = regmap_multi_reg_write(afe->regmap, mt8195_afe_reg_defaults,
 				     ARRAY_SIZE(mt8195_afe_reg_defaults));
-- 
2.43.0


