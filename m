Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1732AC88E64
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 07:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0PXm0Hk8s8gy5/waTkuG4N68LdsLQ96+cyFMyC7Q3Yo=; b=AixRQPkHEmLOMDoFzwbmFfjT3U
	V41LoY4SiSBeavh04e4rDHri+mOaTZojr4e6h896CN0i8+bFWQKH9fo6Jm6iF+2LoRutVn8Ds64ST
	LUtkFi327zEY18lUs1mVEqBasiq2IiSpA4C0DBtgZHVCgBx8P3TmLlYjoKrakYZpfVbW2VII67PFV
	VawaL1Rg6qJIo3eo89T+fv7EBMuSAjT56nwQB+AV2kAlaEbO/8v3fMdtEwRmojfJWe/LlpbHQ0NrY
	+PLJ9CBRO8ogWROn6mMVEMuVic2kqkO/5WHRuaraFEuBT3etBsj1uYxGbrvf0TAaQW06qXyyNcnWJ
	BbE6dWZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x617c-00000002Y4t-2epF;
	Mon, 14 Sep 2026 07:29:00 +0000
Received: from mail-pz2-x24.google.com ([2607:f8b0:4864:3b::24])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x617Z-00000002Y46-2NfP
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Sep 2026 07:28:58 +0000
Received: by mail-pz2-x24.google.com with SMTP id 41be03b00d2f7-cc4d04d73b8so1280804a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2026 00:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370936; x=1789975736; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0PXm0Hk8s8gy5/waTkuG4N68LdsLQ96+cyFMyC7Q3Yo=;
        b=P2KNDiaAe9zqlY4VSIMpWRvvbVZ0lJpxjRaon8jaGdv/Uz2NNiGpp5arjzmmtLgLgS
         IuAVay4PBtQoMpoDvQubpgVnr8rcEPXlnQvyEGzGwy/Zv0bPpZzNxmJzPPFUyaRWB1D9
         ovU5vNWKrwnyfKj9KpBcUQczoCcKLMCX/NGHNac9L94yhcspMq2xXosH/ChRqWy5jp6g
         Bd310mkz5jXxbFTYCFzyjSKCd3vMRi35UeyuMkpjnaRWku6ZHISJehgmQvuoSHhqnZBS
         rrQlcsED3Ou3lqRFS6HcehapAj/fzYtw5VEjEolvKU1aOixl34hg1XnnCMWJzpC4JWfX
         y2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370936; x=1789975736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0PXm0Hk8s8gy5/waTkuG4N68LdsLQ96+cyFMyC7Q3Yo=;
        b=ftsoyHtP4IFc8TGEpTACMPUhSBkSgy4IJoFLa7XBqNG4JnpPzmedEgsnfunzliIWhD
         IK7mJ4B7k6UnPwZOrfjFijx4EfTi+0Tliye9iYTTfgPjbN+LadXMmdplLDvXFtgU4w47
         +Z7jZJl1hfMZrVnfPUM/wD+T+R7CPPj21dChSTQL7JArj6eUYSmHz52xlYi98fDy0yfP
         TY2N22gKFf3TgYTIvFZFKZHkg/VsZS2jo6Wfvz6v5G9mr3Aobjn2BxJc2/aoHLAvuz3O
         Nw1miNYMB182fc4IcNLAKzSu6YbkUPvGbvanlL5kiEAjRztYoSOj9UdLM3bHmjyU7y0w
         sLvg==
X-Forwarded-Encrypted: i=1; AKwUvBwLMbXf6A/SUqTJQFjsq1UTo3oXe4Z8rVZ2c1GgJJ8judZXyajToJ5YV5j+PwtXmBNwiD3EK28vLAUhrynsZg==@lists.infradead.org
X-Gm-Message-State: AFuF++lUFBaMezDUNiHf+hGI7r+S43V68coNpam/ELtheqdgcBKraPAN
	ofcZwgWavejILD2uBMAib/f1uwa/aiU/D7EUD0AYlpjXJOJOns2Iy3mY
X-Gm-Gg: AYBFou3Jd+40pEayTmb7oSUh27Au50yMLLBm/e8tNXhNtrifCNAQlGRcZlQLcgw6KW4
	ucSYPu1gRpMnCwuDnCUFBXUrnfCd6YPEtwUd5u+ap/O6EUQrND+sia+135CSNFh7Hw1KAWF5TZf
	XxosuSaB7AuOPgXgsna5b2KwzTW/0s2yvcW2K9jmYvVPCPwZ7Nja3caSQ764U3etgf4XCcYuPQJ
	sz0LpObBp0jlFu9Nmf9T2Ll03kchPGR7Wxhd0U6te573HZ+fzx1R/an0MtPYTzIoTvZoR82SZ8V
	2eXjJ/6V+ossX2Zpq+q7mnw/SChiv+9lmhM22RRQxEpJpOBF5xmQQaxprQrukmrh7e8e4fqJEzu
	Fx+O89Gp0Iq/7uc4JfbAOPqBPNWbmgLiKPuxHxN9KxzWyLEsJih77jeewNHRAHKOMqy0pKmg2JD
	W/m5w7xHiuBxgmraBJW5l7/5FHRcCnvslyapGSYWOECk989jAoz5zdlb39U1MhF6+SbRdbgGn1K
	lCkoA/ZdBhjrrb1Z1jkrJlxA1NfQdrUokvZSQZ8hq1hwNAqSyl6/cjfX8y05pweH+kO0f75mAdW
	oKaVfooRVQumt3s=
X-Received: by 2002:a17:90b:1d4e:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-39debfaef5cmr2973318a91.9.1789370936217;
        Mon, 14 Sep 2026 00:28:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:28:55 -0700 (PDT)
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
Subject: [PATCH v2 00/13] ASoC: mediatek: mt8189: Improve error handling
Date: Mon, 14 Sep 2026 14:28:29 +0700
Message-ID: <20260914072842.24420-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_002857_616894_34DC8E93 
X-CRM114-Status: UNSURE (   6.91  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series addresses part of the error handling in the MT8189 AFE driver.

It propagates errors from clock operations and runtime resume, validates
clock parameters, and removes redundant error messages.

Compile-tested only.

Link v1 : 
https://lore.kernel.org/all/20260910125742.150902-1-phucduc.bui@gmail.com/

Changes in v2:
 - Update the names of the goto labels.
 - Check for zero frequency since freq is unsigned. 

Best regards,
Phuc

bui duc phuc (13):
  ASoC: mediatek: mt8189: Return error for missing regmap
  ASoC: mediatek: mt8189: Propagate APLL enable errors
  ASoC: mediatek: mt8189: Propagate MCK enable errors
  ASoC: mediatek: mt8189: Validate MCK ID
  ASoC: mediatek: mt8189: Propagate reg_rw clock errors
  ASoC: mediatek: mt8189: Use dev_err_probe() for clock errors
  ASoC: mediatek: mt8189: Propagate runtime resume errors
  ASoC: mediatek: mt8189: Remove redundant error message
  ASoC: mediatek: mt8189: Propagate APLL errors
  ASoC: mediatek: mt8189: Propagate MCLK errors
  ASoC: mediatek: mt8189: Validate sysclk frequency
  ASoC: mediatek: mt8189: Propagate TDM clock errors
  ASoC: mediatek: mt8189: Validate TDM MCLK frequency

 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 136 +++++++++++++++------
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c |  49 +++++---
 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c |  17 ++-
 sound/soc/mediatek/mt8189/mt8189-dai-tdm.c |  17 ++-
 4 files changed, 155 insertions(+), 64 deletions(-)

-- 
2.43.0


