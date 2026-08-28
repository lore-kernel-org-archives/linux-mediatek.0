Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C87C61DC6
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2026 09:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oK69mOzh/nTQyD5btplCU6IorcHxRfVNJ/HUqVvgcgs=; b=Dm1qaCF7ZtnLXTgd9EJDCUZW7r
	OTI2jOPY4iAu+/yrl/toQtts+EX88lw0kXwrKISgfVqgmCz+mNphSOLaTZqeBRp9IMMEAiwUlfqNe
	Uepif0qb4DsKE8vuDUvId5cC8M72W0Le7TQFB391Kw2BF0kCrwDmfzcrYGdhFiw6fIePJS7gh3waB
	3ikQ3gdqySGS+2KcDnhJb6yvMEJpDurzHysKTZ+JAzJHZFaygg9DOu0IX//i0UW5Ui/jEtAbq1rRx
	YK/ZAFO2L7umXFb2CeFzZ5GFvJqmrn2R6+hndgLFJqbTMDiPG9KTz/nJ3qwsTahi8wLVmWI1sl2c9
	bG/OOiVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsgs-00000005QDn-0ebg;
	Fri, 28 Aug 2026 09:16:02 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsgo-00000005QA1-229Z
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Aug 2026 09:15:59 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-84f3ab8750cso642100b3a.0
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Aug 2026 02:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787908557; x=1788513357; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oK69mOzh/nTQyD5btplCU6IorcHxRfVNJ/HUqVvgcgs=;
        b=mpZtJWbEVrB4Ew7NZEt+MscrvkmJB9XmyNGvSpud4cBiuaZOhB2XivasLEEYOcPA/4
         YV5VlxYrwo94Pk32s/CXkkF/Apv306Jm/eLlRMlQIwlbWj5wn1IRPNoilUpOOW1qpxaL
         nvNLrgkay4e0BKQD7umT6Ga7EFZKIstRE8bXTlmDJaD2lfXDEhnLn1LMnbdQw3Xag3co
         Q5aJ45Bk+No8NJbK6fOH48hkjjS3PjDulq0FwE4yfyqVqrqySRk59VclfpPIwjyNwVTy
         XjY6AEXMgawQ8ZyHy1ybQ/vzLl7JCpSk7dvFAIO/VX+569Q0vla7q+VQOnNTJEttWxsL
         HHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908557; x=1788513357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oK69mOzh/nTQyD5btplCU6IorcHxRfVNJ/HUqVvgcgs=;
        b=NFZFwwGVUyLj1Lq4VRGBVCCt6MmKyQDMLDV6KGg/h56nWuSVEBVMpapBxkKRcTLVFQ
         ed3Fjrnc3jBEX6xFbxOQkaZP1vUhInrRQdISbHu97JRG+VrsoRJikHx9O9s+5Y80pk+o
         F4y9xbc1qy2LTTD0smO0VVGx0Vyb5IZ9HFtd7/fXj8RneXpasVI3XVJo0WCenrfkeqZ1
         uzklAro2wkrVxyz5KGFkkuVtCzkiKmqQyrteXdhfczHvG8E2S9yHx7iOlUS+wHbXH5KP
         cRNO0wliPq+qjeoOxBWXb/WJbTXnxG35E/rNznsFH704mHmLBkp5SIyFizNyXJR6tPNK
         RPbQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq4olbe1pwA2oqR1cf9+5zRAyICCMKpCKgfSjJ9MmflR6RGpmvlPVX3pajaR89H2pXJrFqCADHsWKVsqCrB4Q==@lists.infradead.org
X-Gm-Message-State: AFuF++nIfRUtmEaWehxPgMaAhqujigzbEiSQw7GtbBB/vEyIWCxmf9+a
	XTpLSKcxu673ZE+0txOn4pP10DUEB/Mcool3Cb/n1HRECN/TjjuO8nLM
X-Gm-Gg: AR+sD11koSt3cKnJXyqvoBdYMT3/LQ5paOE6IFSybjcfunKFvAxi4+J2dKKo7aIiTMm
	Zm6oJlpKNlrszWXAVnV09hIwYkiJS1rcFhpcM7k08az3h98wMSkUvzxquvTO7KzuO2bUMNToBUH
	QnHC/vYFCAuv0Ox7b3ZJytrhkFDh6qg3AvqP5j70vWlvHmY1IkUt/iPQaJMxFngkDGgJxujqA+N
	H6BmjmZ0Fq6wQGNC6b+BZOyoaq0T4jtQ3h4lQAgq6T0fez4GEEAQL7t/mXprzaF/Dy7m+r/4lVf
	jtbWIK8yVrMF7lTp4k6qhl72ROlsusitDIGy3UArc6rMO1gQpEtIMtcMNIkefN9Qhop915AbzKx
	/uN6Ys7M3WjfOzfUJragCsyfM5GFcLDnOFZn2L3GnDqjgpezF5Kv+VP/oMDZns3d2WJNFjMoLJ5
	lEpl1t43uRxnnkhVsIqlDJP4/Z0Hs6da1jyq7Wjp8X/WoLUbwHObC3ZisV9e1weaSTPkwlleSyN
	2LvBrXH44owK4qe6Dg9TBQHP7G/5F+aOIi0qkBN/LoZvKnebVrbcNXrRWU4lkiX23jlLb4xKjPn
	nHl/
X-Received: by 2002:a05:6a00:1da4:b0:847:973b:3cf6 with SMTP id d2e1a72fcca58-85625541a6emr12204502b3a.0.1787908556977;
        Fri, 28 Aug 2026 02:15:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fe78fc3sm381248b3a.24.2026.08.28.02.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:15:55 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 0/8] ASoC: mediatek: mt8186: Fix clock error handling
Date: Fri, 28 Aug 2026 16:15:24 +0700
Message-ID: <20260828091532.600047-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_021558_527809_A3E29904 
X-CRM114-Status: GOOD (  10.40  )
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

This series fixes several error handling issues in the mt8186 ASoC driver.

The patches mainly address failures during APLL/mux, clock, MCK, GPIO,
and regcache operations. In particular, they make sure that partial
failures are handled correctly and that resources are left in a
consistent state.

The series also removes redundant probe error messages where the errors
are already reported by the called functions.

The changes were found by manual code inspection and compile-tested only.

Link v1 : 
https://lore.kernel.org/all/20260820111253.97866-1-phucduc.bui@gmail.com/

link v2: 
https://lore.kernel.org/all/20260821123021.41390-1-phucduc.bui@gmail.com/

Changes in v2:
 - Update the cover letter.
 - Drop patch 5 from v1.
 - Add Fixes tags.
Changes in v3:
 - Add a patch to fix clock handling in the mux disable path
 - Return directly from apllx_mux_setting() instead of using a goto label
 - Add GPIO rollback handling for partial failures in ADDA DL/UL.
 - Add Handle failures from regcache_sync().
 - Add a patch to remove redundant error messages from the probe path.
 - Update the cover letter.

Best regards,
Phuc


bui duc phuc (8):
  ASoC: mediatek: mt8186: Fix APLL mux setting error handling
  ASoC: mediatek: mt8186: Fix clock handling in mux disable path
  ASoC: mediatek: mt8186: Fix AFE clock error handling
  ASoC: mediatek: mt8186: Fix APLL enable error handling
  ASoC: mediatek: mt8186: Fix MCK error handling
  ASoC: mediatek: mt8186: Fix gpio rollback on adda dl/ul partial
    failure
  ASoC: mediatek: mt8186: Handle regcache sync failure
  ASoC: mediatek: mt8186: Drop redundant probe error messages

 sound/soc/mediatek/mt8186/mt8186-afe-clk.c  | 163 ++++++++++++--------
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c |   6 +-
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c  |  21 ++-
 3 files changed, 116 insertions(+), 74 deletions(-)

-- 
2.43.0


