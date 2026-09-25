Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A59C9830E
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2026 16:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P2oQDwCwCo1gfWj8hUM2bE3rJ8xWs7DjrsEeE/nug/Y=; b=p1pj2AeOUo6vVo/xi3Dwm9j4sL
	pbljGj7FdZ0dNoyc/YdxOypIuSaRoH9IdIwvpbsF6vFzhitJ6Y4u2EnB7oVehlen7WJJlDCRDNDiw
	jiQEsgIk0gTMSU0VZWf9XT/ED/bbNTjMsKPqeE78qG7g1Wgw4EjGAf7aoVFRvYNPbVqkJGYRc4tf/
	PjJJ/7it6QK+tPx0rFg7mvxVjG0cnlIj8gKudM965VW4QTNj3d9vK1cZ62tnFwiZ/gPirFRhznssp
	PKb/ypQN9WxE7LA0FUlp49Xtxs5pavWNoTVC4PuDli1zYK8yuPkqsrt4r5eFy4Ekyo0DTu7gUQZ5A
	CMG4YFPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA9H3-0000000E1e2-07UB;
	Fri, 25 Sep 2026 16:59:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA9H1-0000000E1db-3OO3
	for linux-mediatek@bombadil.infradead.org;
	Fri, 25 Sep 2026 16:59:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=P2oQDwCwCo1gfWj8hUM2bE3rJ8xWs7DjrsEeE/nug/Y=; b=EIkHt2PQ7r4XAm/QlI2mGqdz5k
	VnrqZmn9Q2P5PThbibzSSIXoFlud4YCAZxtnkENQYkQ5aTKdz92Na1KAGUoeNDvmhRcO2O8EokWx1
	plxXUWPXYzn0SX3IGS2k9AZPfQeqAItAFAtKDVsmxL7JFXnq/q3fexOEYpBTHkZVdTGvFkUzPmW3V
	YF/k5+YrwkfNTsANtS8RVcyvFBGxq5Adcnw03szfrpn5ClfeppLeO9efek+Nc6cb6Ig7PlnH0UUn3
	DXLXfJQkCoEt8mye+k8fb8ADHNbciog5bbhn86cpZOZ6fMdKqb/cEqhfwxq/wCAOBLIv4v6299nST
	d5pTsLOw==;
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xA9Gy-0000000HANr-39zY
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Sep 2026 16:59:46 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6aaf28a86b9so838595a12.1
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Sep 2026 09:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790355583; x=1790960383; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P2oQDwCwCo1gfWj8hUM2bE3rJ8xWs7DjrsEeE/nug/Y=;
        b=jhJ3NXUcVwWtHYK9hgo/JrBYcgxZkf85S8oK6XrM1omazPFFmHA19dKsfLTTCpBBQy
         Ew99Skii3/3wTGsWLmHb1vZV3cv0N9oC6WEkD6tnr4K49PVaII/IC30nRRJrsv1ehTrj
         lYrJkuPauF/gu1RrTl/mXQfeK3jcc6znQtZ+n33l7hLXOrtOSH6qy1w9L3Lrqs830oUS
         S61Zn9YzfhqBnrVHAKH/DgnOzPgQit9aMaq3/AH/iHvgr7uO/gWd7BcscoYavmqhW403
         RF6ONnEGEDaBkCCcNkdpj/PuB9vB9phszlqTYh1WuoZwfmVW46IPAwGmP8fs+OI7h60f
         nvDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790355583; x=1790960383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P2oQDwCwCo1gfWj8hUM2bE3rJ8xWs7DjrsEeE/nug/Y=;
        b=WzaG9ONeHJtgYTZaD1Vu7m9hZqcUNtUZ0pvh9cd9Cq/ZBr9Q7+m4Q6SyWcKiKNIpnA
         2QNWaN3eDtHyZAl8QlCKEp7s5PNks3QPfi+R/IvQ+aKf9riiQeAwwOXNPn6jmPsXm+SQ
         2MSL0JInNG3ALnSfo1djhkHxtoU0gLEFHT+y6GsdMuw1SQLeMvCbttrXlmR04LjTavjx
         A0mzKJRwMiSBAu74s6/anrpAdQdy2i6Xo/gigYcvDGyezJcOsYf78UL9Kpt4mLt+jMfV
         XM2x7Mq4Y32ypa/6CB+OxkPKQdGc8qi7/7scMj7AKBKLYTD2vVukJrjFrAkBPEA05kox
         jr7g==
X-Forwarded-Encrypted: i=1; AKwUvBzCSPIrkrDXnhzhTrQ6vXbGxHLKF6eJx06swKcrgu3tu+3X/aklF4VtbixdWbVUVO5g8Yb+WQPdbWJv1ikb1A==@lists.infradead.org
X-Gm-Message-State: AFuF++nWhDZANvg9KAFNEkx3XnhcarOAXCbFfvwaJnn/eV50dkUnqKVW
	ESPf9rQjc+sj/3S7RPDeO5nrY3hJPBIaF3p/UMMYSTfNgETCIPx7ERqV
X-Gm-Gg: AYBFou0c8oJw8joewRQwFdm0X8VAM5e/gBpYxvZZNY0r+Y38xlic648dQalcOX3MywQ
	X0gyYNGzfNwoa+bmY+/TXaBjnb/WLG0G6k9dXK3PPae21Os9CVJHC3tM4kNHLTMr2unwBwdO3as
	/wGJEdpZ5UN3V6RfzZ/EEhkh74+XMhjrRsCBu7kh1gvH82o2jaGMkrVbEH920+ALWlRHE/k2HXQ
	LwZWwMEEEK18Y6NhUm2HtODAOPSVpHWQ49uQt3FdDDpZaKKd6B51nlQF85UBUK5cAADo7xZiA/g
	CdKayd/oxNLGDl4AJuW17JFU9MG2QazNOH6sQz1KYJ+kWIbVuJ1ao/sufIHl/ifipzL/IgGG1bZ
	rA+7K4MiQk2mllfdv6QzaGWZgig5wKrUVHW/i4efeVGxTRhgAqT3REDUuAjAZeo64S6hSfuhb5Z
	Qy5fnGW5hpwZERuLhbWDb0+KP9f/bOE4ZhQzE5H6gxeROYxV3UN8zZVrtXRhMkJDFwgM0XFkXia
	xVnM/x0tlxiFpqL3vSuMwplzDe+W11Tk25qJ5f5MyXRbulRPHk1ZvUOyaq8Hinc
X-Received: by 2002:a05:6402:12d0:b0:6aa:ab94:4a36 with SMTP id 4fb4d7f45d1cf-6aac8f1b94fmr4157302a12.8.1790355582773;
        Fri, 25 Sep 2026 09:59:42 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-29-83-136.business.telecomitalia.it. [79.29.83.136])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5cb9b0asm1321152a12.9.2026.09.25.09.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:59:37 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: kernel test robot <lkp@intel.com>
Subject: [PATCH] ASoC: airoha: Fix sparse warning for AN7581 AFE PCM
Date: Fri, 25 Sep 2026 18:59:17 +0200
Message-ID: <20260925165919.5407-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_175944_888145_000AF16B 
X-CRM114-Status: GOOD (  14.29  )
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

Fix sparse warning reported by kernel bot:

sparse warnings: (new ones prefixed by >>)
>> sound/soc/mediatek/an7581/an7581-afe-pcm.c:144:30: sparse: sparse: symbol 'an7581_afe_fe_ops' was not declared. Should it be static?
>> sound/soc/mediatek/an7581/an7581-afe-pcm.c:419:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *base @@     got void [noderef] __iomem * @@
   sound/soc/mediatek/an7581/an7581-afe-pcm.c:419:14: sparse:     expected void *base
   sound/soc/mediatek/an7581/an7581-afe-pcm.c:419:14: sparse:     got void [noderef] __iomem *
>> sound/soc/mediatek/an7581/an7581-afe-pcm.c:439:42: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void [noderef] __iomem *regs @@     got void *base @@
   sound/soc/mediatek/an7581/an7581-afe-pcm.c:439:42: sparse:     expected void [noderef] __iomem *regs

Make an7581_afe_fe_ops static and add __iomem for the base from
devm_platform_ioremap_resource.

Fixes: 4974ffa0d6c2 ("ASoC: airoha: Add AFE driver for Airoha AN7581")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609242059.t4FlJzOz-lkp@intel.com/
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 sound/soc/mediatek/an7581/an7581-afe-pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/an7581/an7581-afe-pcm.c b/sound/soc/mediatek/an7581/an7581-afe-pcm.c
index a1d742362538..d47edb630452 100644
--- a/sound/soc/mediatek/an7581/an7581-afe-pcm.c
+++ b/sound/soc/mediatek/an7581/an7581-afe-pcm.c
@@ -141,7 +141,7 @@ static int an7581_afe_fe_startup(struct snd_pcm_substream *substream, struct snd
 	return ret;
 }
 
-const struct snd_soc_dai_ops an7581_afe_fe_ops = {
+static const struct snd_soc_dai_ops an7581_afe_fe_ops = {
 	.startup	= an7581_afe_fe_startup,
 	.shutdown	= mtk_afe_fe_shutdown,
 	.hw_params	= mtk_afe_fe_hw_params,
@@ -375,7 +375,7 @@ static int an7581_afe_pcm_dev_probe(struct platform_device *pdev)
 	struct reset_control *reset;
 	struct mtk_base_afe *afe;
 	int i, irq_id, ret;
-	void *base;
+	void __iomem *base;
 
 	afe = devm_kzalloc(dev, sizeof(*afe), GFP_KERNEL);
 	if (!afe)
-- 
2.55.0


