Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67359C624D6
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2026 04:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a4ksl9SsTnU1qraDN3sQ8M70vtHGdDPB0HKfqeC0tuc=; b=19Z2Gz5FVXaQjETVSI7yRoXx+J
	qchLvTfiDqsgz+MdyGtMb59XzeVDQl6j/It79aMR7Ih4/9Mk6lr+q9vEluN1Wi4rjJzpwO+ibxsyY
	uayzGV1uL8xe9R7qz9xyq46xF7sMSI0e7RcaRVsj6+6N4lMO4CnxC/+JMxXnDrMXeUzYPJAJTe3EU
	EtK641wzkuaAyBsCzWnMZ9Z5PNcnhlIAz/b9l0P6vpS5fkxycPzSuq5hcQv/A7rTauzX3Dwisqw4+
	8gFIe3ong+WeteWdFuXz+HA2Y0UiH7dqMEmFl6LeSPPCiCoPP8muuF7yl90mNizCoI2UFJxAhFMuR
	q3+rQ+mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zRn-0000000GLs7-1jlH;
	Thu, 03 Sep 2026 04:53:11 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zRk-0000000GLnj-0zK1
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Sep 2026 04:53:09 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso1800910a12.0
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 21:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788411187; x=1789015987; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a4ksl9SsTnU1qraDN3sQ8M70vtHGdDPB0HKfqeC0tuc=;
        b=jIfo2YCYf/3qYpANF6EMgvrPIcLF6/FA3S6fVEKItKDZnb3Bm7qBl/GYETtf+o5SWM
         C6zm14rGQ/rQQghOdUh32p6K8oZZZW0SITk4CJ3hOSEs4tnY4suHyQIBNfGzRDWWnrjL
         W4LHTfyHVGom+ngJ7p9WMT5hMMZg3GYmdgSUI6ulVvs2ewPTxb/fd2WEfjZ/HjHog9dw
         fpX/0XZD+KLcPMbeJQNoT1JzegaGqRECgVNGYNnixMIKaTeFiyH+U1D1rGvN37ASucEg
         S8DlX9wo3aA2ojWVD//xKzL9LygljbB9yUHBnxJOlmbtprKdSuJ+Lu8C2mzzOGsugYR6
         MSag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788411187; x=1789015987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a4ksl9SsTnU1qraDN3sQ8M70vtHGdDPB0HKfqeC0tuc=;
        b=BkhcpAPEdadFwkcqXAbPogCHr4MIQb4pyPw+Jhu3Cj1g8tJOI045Hd32jZtjHO5tfe
         DvR0RpKoLRm+RrubIyJfV6g1tWem9AJ7MGpUU+FH4ujFcozhXouopVyaFoyE0Upg52aQ
         BolS2sGyBOcg5G5oWxToCPBo59IzIWycjGnp8n7ElE+b2Wo9tPZOgLFr5MF3DQk2hry6
         WZ2Us9IPSmjbKxwZ/PwdcZtr1+MOYeuAFtQbGTyM2UkXxAx7mJ6H/eaNWaLqIhSd2n5u
         HOm2uuMnahLPB/ZBF1jGYwf/u3MKjni26OT5JixSIIbkkSFZEzR+YbW5fU01eB6SLKMy
         tjUw==
X-Forwarded-Encrypted: i=1; AKwUvByD//RfPRu5jeJItBfv+giQKTCjbz/Ag9JCWD2upgoVYMrXsQXkPVjKx11V444ceSLMEyadPOtvmZ4TlhWrvA==@lists.infradead.org
X-Gm-Message-State: AFuF++mns9Wlxuehpy068MZaQQwQBVvUqFusrGbwM6YlGFqe9nmL/FpE
	yEYIoQ20aSIEzkyd9xyr3YeXq2NCPsSYzQPo3ebJ2H/x2q5KmO/ek+IW
X-Gm-Gg: AYBFou3//sK9PVF82GIIgOH5nhCx6DTAd4JNfrsg7jZ3EpXizUCu6nhFd3fysn9Hfns
	L21NCH1JKBlcFXGAKcnDI+Uq3Nh+ra4txtfcXcaQLH1/QIR5Of7ovGBON8GLcYswu0ix8pdnEk0
	E5ftZRB2R9T0QUvd0jtU8548pRvGCS45QrW+vnsczbin2gGqJ5cpAv0X4jnea+Xlf9QUEC0gcqL
	vWEwD/rG9LO2Pdp/0oHS3hTSIMeMO1y6ERGdbu/0HOjRpXLN62hKVM6nskBymxvSsCA94RVsmAV
	X9Fl2XpVsGpvKiW4y1HCk7YmxsB8wmMQCC+oiQZjzK03kVYrknVLnJLjHqknBro2adc5xUw6DD3
	57bZN14MSAHBjJv0d9dg4JoPrOEj3hUvw+meWvvOAmWyclgpjsD6kBCkCHztLDWjw8kRJOM+f4x
	fXHSKjjksrjoa1uRegcCUd9KWKPq67he9dVnZufB7hXtd8D/qx+8+h+oIPKEgpcdG6Cd3Kg41sk
	5YjcGYZ+cz2RsEesGJHVr5v1Vn67XI1djdaNlSueMdf/ejKwoP6GlR42yfyc/yYQWocGgFN4gwf
	0DM9JUlCf/YGXlbS
X-Received: by 2002:a17:90b:4407:b0:398:9bd4:d13 with SMTP id 98e67ed59e1d1-39aee219427mr14283857a91.18.1788411187416;
        Wed, 02 Sep 2026 21:53:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d7e8sm2747538a91.16.2026.09.02.21.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 21:53:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Shunli Wang <shunli.wang@mediatek.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 5/5] ASoC: mediatek: mt8183: Drop redundant probe error messages
Date: Thu,  3 Sep 2026 11:52:03 +0700
Message-ID: <20260903045203.175337-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903045203.175337-1-phucduc.bui@gmail.com>
References: <20260903045203.175337-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_215308_277380_8B14C681 
X-CRM114-Status: GOOD (  12.38  )
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
dev_err() calls are redundant and can be removed.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add a Reviewed-by tag.

 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 2634699534db..46b7a2bb6aaa 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -809,10 +809,8 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* initial audio related clock */
 	ret = mt8183_init_clock(afe);
-	if (ret) {
-		dev_err(dev, "init clock error\n");
+	if (ret)
 		return ret;
-	}
 
 	pm_runtime_enable(dev);
 
@@ -903,10 +901,8 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq_id, mt8183_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret) {
-		dev_err(dev, "could not request_irq for asys-isr\n");
+	if (ret)
 		goto err_pm_disable;
-	}
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
-- 
2.43.0


