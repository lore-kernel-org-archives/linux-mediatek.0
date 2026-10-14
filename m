Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B22DCC6B2A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2026 11:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Vtx/KxXQb9NzxJFggdtETIpVOQq4JhRN6ab5MTU7oE=; b=IEfeHE5WJBSbwUYinAzrr3Shku
	3r159AJteq71OyB1g6KArJ/JtYhpzLQWpth5rxHf0U8WKgJy2aT5XtG9C8yn7b1rAaNReiU0M0z4p
	xvJEWPuuxIixahGa23hMdYJAy8gT0LKj0EniX7NUnsdLVIIUR4wFyS8mdrWK5TmLpLLdE8XF2etsZ
	6gsSrC/f1/2uPYJ5PwCYuPERVQ1CXrjFQ2NWoCdGuFZOlC2C6uEWZamdvsIGMWnuKqOaUVBxEmcYi
	qTmLBLE+qRQJNz1yQvpZQUeGhcrfuJCPCvIm14obv3VfuEkRaGdjJXjftEU0sv5oNd05D3H3PXxvf
	E1r3sJbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxBD-0000000FKZ3-3RA0;
	Wed, 14 Oct 2026 11:29:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxAp-0000000FKMH-0sm3
	for linux-mediatek@bombadil.infradead.org;
	Wed, 14 Oct 2026 11:29:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9Vtx/KxXQb9NzxJFggdtETIpVOQq4JhRN6ab5MTU7oE=; b=fgai1Ra3WDsH6DgMuQMNw5w85U
	HAmcsYZ504Pk211HF97UCR7+8qndNZ+dTsDsv4q5ZlY5E74Ng0MNvZi73/RAcoWsqr1bS7Qre0FzZ
	YbmUcOj/1CypKJVu+Ek/m8Ooe9YGGuBKCV+s+PTZoEDId9h9DHcgYvKbWsj4Er4hJDotV+IDxv/NK
	WM2otToijPwaa0qEyoO436fNZu3P32KnGxKtFZpUdPXjiS5S/ROw8nn2W9hQNlWK+USx56xIDdPcl
	50azW0u6A4C0+bUsMjve4pqOdt0ykEiBO9sUI5Oap7oWS4NTUB6n7jtIT3R4+W1YWP0aV85TKkFTV
	0wSSEfhA==;
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGxAj-0000000Gglf-2t3s
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Oct 2026 11:29:30 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso209173a91.3
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2026 04:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977364; x=1792582164; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Vtx/KxXQb9NzxJFggdtETIpVOQq4JhRN6ab5MTU7oE=;
        b=giBgEdjzFRWLuhWzT/XMnTV/tmGpQE8vb+DVPACoZfDCdS1rqWCbhJzpb3RzhihQMk
         D8SrlXUL51pnlTxl7FNWxUkLYXh8r3c0CRKklCPPFHYOvOt0kT9nPGYm5Td6RkgKFCkF
         2u2Qs/2I1muv/yTKjVrWi+Je9oRvZVBzjpZquCGqogk3RXmvbdZ0SBzS0dpOwjsR+k1e
         XsOmaqY49Io+OV07yk292vCnkboZPjQNu4G7wt1zDm7mXVNGZQTmkjKhavvYFYXiD1HE
         n6ORlNQ4h54kPBotlERmOKtigNUvTzHdQE99OoATUgqb4p31bOIvw456lnw7ValOUB+6
         pO+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977364; x=1792582164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Vtx/KxXQb9NzxJFggdtETIpVOQq4JhRN6ab5MTU7oE=;
        b=MZrMpSg1fO6cHyS/ZZVw8Sj+7NIdQw8CAyhCpJcsigjWrGR99pEHp3KyT3Mh/08udr
         0IEk+nawYw3KNTi+z8fpQtBAddUKQT54yLdAk0KLjDdYhs+ocWGRhK2nLRNniIKSKhr1
         FQbVyVCae2IQv3dFDvslhxA+aqCIFrqmGmwYbSlKjKtBRPtr1cr0IwexYGtdlDY90FBj
         qvP6XqY/TEAcN2TbUrwyMYp8e9okoRUqB63kACzDN95gm1ml3fqdtuRWo/7j4Eq7RUn7
         HO5QiIR/E1i6rU8pu1Rof9ckH9eUpiiFFfnWlFRWAZdxFrhKBMwl6uZ9Ud0Z1G+77A90
         ndKw==
X-Forwarded-Encrypted: i=1; AKwUvByb30Q+E4HNRTAWkFdEMm9NKYkFj48B3Ld9HNqFwMNM9lWEEmS90rfPpoeO4RcKfrJjMcssus3hQ5BgQxd8Vw==@lists.infradead.org
X-Gm-Message-State: AFq9FYIS5WNgYIriRCbxen8HhwA/xVA7pIN5fLGFxfzhe64Auljet3Rq
	IT8K9La0hISSy8QhzTZqJHWZi79ByQN+EDBvzU7w9nqIWqkpxcHLMoxIwbKntw==
X-Gm-Gg: AYBFou0+/r5lEdNBvCPII5XzNfMnofMggM+b9pWcFWHl1qYR4KXSnQlSTVWc+KuOuNv
	sXkp+51sVFmgZ2BzOgFaH8juSiH6WGPzupgZIPo6kM3RRlX2RLGJ2aolJncr2Z28m1PMj5s2vZs
	WvIXFa0sq8nCF2sXb2IWBnnp8RMvfHrvE3DKPUfafJhj+8q0WBiaXVzKdjJCEhpzrGO0dOJYU+2
	bFYpAeOskHOvm+Yex8BrZ5O5cL01tEE9/4GiZWXwakaSUx+tMlhjdU7ibXPG2iH3obFMsI9hHO0
	w+6JlHzpINTO5Q8ZxJGzRE3BMRVHpuRRfbi3m4rJod0aTZaBcu9IvJ/1EY9/xb183sEUxrMzyel
	gviaLJtDdZ3INlDVLIck/VL7gTh6Fs9Xnk974t2dYWdwkw9ivweJ84LToBZBuxNg1o4NuH1BSIJ
	EWFn5qAhgpejg3kzQ2LynVt5/rW9nRqu2ipBOzXBwCOouAQcY3Jeorr6p/yMdZNtAJI4s738Rxg
	XbSs9J/6+50cFT/YHQHqSbHWxPp5MZkmNv+k+lAOnOhJtxqrDb+9MFJbXToLfFRcePB4lvXTJDO
	KiEeYyeBS4tmKg==
X-Received: by 2002:a17:90b:524f:b0:3a8:c0cd:57f8 with SMTP id 98e67ed59e1d1-3ab3a239c2fmr12156626a91.4.1791977363541;
        Wed, 14 Oct 2026 04:29:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:29:23 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
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
Subject: [PATCH v3 12/16] ASoC: mediatek: mt8195: Fix ETDM MCLK error handling
Date: Wed, 14 Oct 2026 18:27:47 +0700
Message-ID: <20261014112752.683032-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_122926_119949_FC20A3A7 
X-CRM114-Status: GOOD (  11.16  )
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

Propagate errors from mt8195_afe_enable_clk() when enabling the
ETDM MCLK instead of always returning success.

This allows callers to properly handle failures when enabling the
MCLK.

Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index 1a20adb2cbf5..fba51c552eec 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -1549,9 +1549,7 @@ static int mtk_dai_etdm_enable_mclk(struct mtk_base_afe *afe, int dai_id)
 	if (clkdiv_id < 0)
 		return -EINVAL;
 
-	mt8195_afe_enable_clk(afe, afe_priv->clk[clkdiv_id]);
-
-	return 0;
+	return mt8195_afe_enable_clk(afe, afe_priv->clk[clkdiv_id]);
 }
 
 static int mtk_dai_etdm_disable_mclk(struct mtk_base_afe *afe, int dai_id)
-- 
2.43.0


