Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBF3C5DF89
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2026 12:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KBEhlJoNhEUfCpIMUFLTjnuolbIcay5rAFRembGkrg4=; b=op8U/m86al9YzPcqI2CaQag2kO
	rdOJA0PbEWiQtKt0oYZMqAo8pmE6OvR8yu2S77Df4sUGjDLaqOT53d9RKlkbRVZuO/0KaqBMla9I0
	NDUbuXKs9JLBQwNgjXbTLJWCh5S0RG/aRVaggHJs6B8S5CNHGmZG4PRAlQ23XJhlWWseWmrANwsoF
	ys8JH6CASIgg2S/n7y9nhNM07IzW4n69yFUf0YKv2dFWAX+lL4LKItk+AEjPveG7vlFjtPs990Bll
	5AH1oTHUK/PskKKDZgJgGFHsKN2xaMoMtfC4NB4ERJaE8vTNe2ImPpq3zeagX4KAaG+dsMFEscy02
	4GgDkwkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOOO-0000000DJvw-1IeE;
	Fri, 21 Aug 2026 12:30:40 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOOL-0000000DJuY-3APO
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Aug 2026 12:30:39 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2d530328efbso8492665ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Aug 2026 05:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315437; x=1787920237; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KBEhlJoNhEUfCpIMUFLTjnuolbIcay5rAFRembGkrg4=;
        b=AvoGmj+7ED4Sp0uEvpQhL3NSKjNa51/Vs1Ux1OBUnO05wu/t8qXNGQMAOuTC4PAjOC
         jQ/Lj84L3zcAZbCPRrXIIG9+9dfKeJ8vIzSCWTFWR/b2QW43AYWdYOFQrFXib5ebTZ6C
         hmFxPI1+3UoOugnSYITfe9dxlA820KgNYxpxN2yfFJRIITK3CK840XBkch4N8ayV+K9q
         MndtPINkBourck+puvaOYtrD84f64LFGuXkFA4zI54UTjtxsFaUGFh2E4oiHoXOtnd/v
         V2dMoLf2Y+JZDXTPH4+X/gB93pc4GIp83ZlHx18ky4pvNONllAsad6Apvnr39gzUh49k
         DiBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315437; x=1787920237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KBEhlJoNhEUfCpIMUFLTjnuolbIcay5rAFRembGkrg4=;
        b=Klx0YtljyaVrkIbcnIckiTEGO+jf3NkLItJwUN44ijEazggs4Nneo14CrWsqhxno/L
         4kfbllOcnil92L7sfgHpbLlayYb6n1Qs7r1Rxo9wiWD1W1sK4ZM+TmXSodngeT50x95l
         XyfI+HBBMuMVkJaOh5GrL11vwPD3we5YvOU4IEL2l79nWPyMpdgspy99VEvaTGm8AdRr
         i/SESUpHhE5UMJFdWEpHA75285CEtByQU0qbXw7Mk1/BjY+asXL0FSrPvukeAdN2dnB7
         7xDbMCJhUy0JH9B7byuAvI+L2Pm/SE5zrQyQBZWpMyD6UFiJMiuIcDLtio71pxx6H+Xp
         WX2Q==
X-Forwarded-Encrypted: i=1; AHgh+Roq4iNmVrle+Em/uii4QfI+CMSOtrxk72I3GSmRDzN/s4Z3OkDfV2ZkOq5FhZVmdNo18QHWLqaA2h8nOJMm8w==@lists.infradead.org
X-Gm-Message-State: AFuF++nnB3peCOnqqzukvVBKt07dhQSguIdMfY77T/0hK4KTSUIViR2a
	A2M3THJP/tQYA7Y7RCjDpkAohgN0ehEVRkG/HreylrUY60qLFGWP5NlW
X-Gm-Gg: AR+sD12nhn6loZYVM8U6W7LCpCQ3Y6v7rnPrOGHPrEafqufJTdS0ukyGMATQ7hBxpeb
	ehve/DkW+SOkx9+smdC6AMG7AfWJ3LbqQDObrb71Yr/Z5VoZNwZf/QBJ5o+JZ7aqMS4f5vukAfO
	NhVN3aUP/am2gyR0xmxnIp2SMgh2Wi2cblh99YxLC3kNZAem7SR762ivlbKfKOEGm1gHw6bvqHJ
	2lFnYCUk91APQl3wpxoyeRGNxiBNUj90eTHoZ/b1nA5MpHkehqvd2ruFI69hRK/fl6uQY0sqS+Q
	gR2s0uin90wbnldfHpDNuF2e7FT21UdDDxJ2K9SNO+6FhoWmA2y66RCZAByk6pbsW5PYsm5Uonl
	45L8xnArr4npej2pRQ+PdbjT2W8lqSa14WADUTzVtUJwVX0s9yyWi7VuFdCV4gFNWCsCDK3Q/Jz
	n5Ldusz6DP+TsKWt4uS878OD7AY5NaUexhtISD92Zn/6GkIGOXKzVu8VtD5YZAIegR+cz4qspi1
	xHns9XO+UU/jo3VU2JQM3VYY5XmTTvlyHOV20g0mSytARsexgG7K0IuFUyO8zAPjyok32goegbU
	amWs
X-Received: by 2002:a17:902:f693:b0:2d3:7c58:b0e1 with SMTP id d9443c01a7336-2d64a9a6dadmr114013055ad.0.1787315437005;
        Fri, 21 Aug 2026 05:30:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62e36e1besm18302235ad.53.2026.08.21.05.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:30:36 -0700 (PDT)
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
Subject: [PATCH v2 0/4] ASoC: mediatek: mt8186: Fix clock error handling
Date: Fri, 21 Aug 2026 19:30:17 +0700
Message-ID: <20260821123021.41390-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_053037_801399_B28724EE 
X-CRM114-Status: GOOD (  10.99  )
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

This series fixes clock error handling in the MT8186 AFE driver.

The current code may fail to clean up clocks that were already enabled and 
may not propagate some clock lookup errors.

I also referred to the MT8183 implementation, where the clocks are handled 
using devm_clk_get(). However, the MT8186 code currently behaves more like 
devm_clk_get_optional().

I could not find any indication that these clocks are optional, 
so I dropped patch 5 from v1. If this is confirmed, I can send the change 
as a separate patch in a later revision.

The changes were found by manual code inspection and compile-tested only.

Link v1 : 
https://lore.kernel.org/all/20260820111253.97866-1-phucduc.bui@gmail.com/

Changes in v2:
 - Update the cover letter.
 - Drop patch 5 from v1.
 - Add Fixes tags.

Best regards,
Phuc
bui duc phuc (4):
  ASoC: mediatek: mt8186: fix APLL mux setting error handling
  ASoC: mediatek: mt8186: Fix AFE clock error handling
  ASoC: mediatek: mt8186: Fix APLL enable error handling
  ASoC: mediatek: mt8186: Fix MCK error handling

 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 103 ++++++++++++++-------
 1 file changed, 71 insertions(+), 32 deletions(-)

-- 
2.43.0


