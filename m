Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B06C61DD3
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2026 05:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cBr8HRxr2IvFH9jg6UhnzrGvkPEyPmptbNqlHpdb1vQ=; b=teagFXerq0jAd3LgtH9wJiqig5
	UKTNdzilWa8BwD5bDi/k56b9oyyfUHb0eyRXRGGTEjGCUbU1THu6PrEHnVp5cdqYdynQLPt+IXIjJ
	x2bp63Mh6Eu245xgo59E++oskmH6egY40CcSPec99opF2N49hAtPo1kbfRgECF33SyeHpwhzcd73o
	6dV6HphAZqdhGOQ3+52FcQnD6kUSPH5xUQTq2arUXXUvkuDHlu5brZ+ApXTsqP4PMsmdB/H+pGOzc
	GXzA9DkK3+J2vMjOvwfFsae02fTOK5umF1rmc+x+SzHmDfXe3y2B64LTpLA8GDCJGOcfSIIKlcQ8G
	lRKJMQKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zkD-0000000GMm6-13vA;
	Thu, 03 Sep 2026 05:12:13 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zkA-0000000GMkz-1Qxc
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Sep 2026 05:12:12 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-396750cfee6so1657215a91.2
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 22:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412329; x=1789017129; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cBr8HRxr2IvFH9jg6UhnzrGvkPEyPmptbNqlHpdb1vQ=;
        b=o0NAJA7+C16A9LRMfEXFB6OS9FDJaFbPF1WrzLsjhCL/drVeJaECQ3GnAlemDywd6X
         TGnNZ4sYO0iQFACC03lQ7CQli2wQ5/iAHUNFeclqeWTfV3zNg5SBFDvClbabjhOjXdV2
         YrT40Aea8tEOrveR7eT11Kq/KAaNcXcy1qA75p/YmhPvGuM4x65VFbz+l6KD01QFgRGs
         PWfCx09DSTEkV7GUWYk7DgB+irEptdieFPUohroCEr9oJnBNFRK629IusEjY3hQvCVGl
         zfh0YvSjDaf2BCzuGkEhiZ7iZokJ6obBZxjTPL30Mbtng8qDhY37pUhKOIz1340sjpZJ
         g+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412329; x=1789017129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cBr8HRxr2IvFH9jg6UhnzrGvkPEyPmptbNqlHpdb1vQ=;
        b=mM76bLJAb3JWnL3xPupnMu0cckuLcWVLBEBG2e3ucJPz0V37cqckF5LiIfGfJMo127
         86QCmlKbqg2ZodpYRr9naHGGeDLk80pNBQtWTFMj6Y3JMJ+oPxK/8CIwfy7y6XjsFvlg
         7H50iRgnNPSADJGcBG+RqdDyGn1u7Rspc8blc0fxg11Z+xfGFJEDgyCYjti77CVjeW4P
         5QeoPUsH/IzOjkHKH3iq/qFEOFJxSc8x3E7k0a+cpXTPTKXhdbVbwzwuq4xkPBxgFCY3
         q4TXrFAX8+ZWfND4pwhvUuouYPTeIdi+KKbxpRJxd7yuZWHY8aN9gfvqox2MyV5TNrao
         Wzzw==
X-Forwarded-Encrypted: i=1; AKwUvBzlA2hhYQFzQRd/vJ3D6usLPBNoakKjwy/LS6/8tlHl8cn10uIRgHXIY6ZafxEJuo2cu1ea/R1nA57SEwcXNQ==@lists.infradead.org
X-Gm-Message-State: AFuF++m1eBeDTrcl031mv8NDnZzFidPKUOd+WBEnMCzu2VkJvnZSBqd/
	nbvjQnFgfofRhZMqRChhoPCxCmYel4+2jlP0nuyaJhxDGuwJYTl0uvfx
X-Gm-Gg: AYBFou1WcvjFoX5b79nAUXOT+mNEVcX40xJOkn1hsYy1o0F2lg5ktMUpYhdCg4WHAhG
	Wi/CMElXe6t4jCDhO9mpDvtkGsAWs3pgZYqheACdHwbXqvllhZiRUHwasmkZfSYwn6GSGcy0Q/w
	8zDBmLEq23iS8aHlvj5Z29AXKXfLMQ+SbRqF/M1Lj6nXcJY+r0D5VJZDSR9+LJqXcIDXpVmIPrU
	49IS/9A4mFO01yITbiCBZC9pNMRy2cuNhHpQIaVxmHuPQQBIXTyPLl/6rciiTgnbBgLdcSS4CHB
	Evk1cFz2WIkzzLEPn7QYrLhOndJSQODiocPY2siXAduLatcUL+bv/mrBQq/nwmjuW0wIYsJMJD8
	lCTw8SwpsXayjjfomIbiVQOsCYqihI386S7go0ZDJZh/NxUjdvxwDoQCSx8IiXC9elSYUNSqAab
	JmgO9PrpbVpwJ+T/g5Ps3DmRKbhLF5G8aJuz3lY12TA2hxaQ1UX++VlFzzTSz+mmjscbw49t7Mj
	4P1pqDWabaHOZFJbiJ/FKWJk0XkzNfGOrnt2rBPCi6wo9pj5LoVgLKgrDfQGYZScEtYtObrBp9Z
	9qYN
X-Received: by 2002:a17:90a:ec8c:b0:38e:5964:97a8 with SMTP id 98e67ed59e1d1-39aee04ace5mr16394737a91.16.1788412328628;
        Wed, 02 Sep 2026 22:12:08 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0875ce14sm3218092a91.13.2026.09.02.22.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:12:08 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 0/8] ASoC: mediatek: mt8186: Fix clock error handling
Date: Thu,  3 Sep 2026 12:11:42 +0700
Message-ID: <20260903051150.178057-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_221210_435893_202B11DA 
X-CRM114-Status: GOOD (  11.17  )
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

Link v2: 
https://lore.kernel.org/all/20260821123021.41390-1-phucduc.bui@gmail.com/

Link v3:
https://lore.kernel.org/all/20260828091532.600047-1-phucduc.bui@gmail.com/

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
Changes in v4:
 - In the mux disable path, remove the goto labels so that all teardown
   steps are attempted and any errors are only reported.

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

 sound/soc/mediatek/mt8186/mt8186-afe-clk.c  | 95 ++++++++++++++-------
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c |  6 +-
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c  | 21 +++--
 3 files changed, 78 insertions(+), 44 deletions(-)

-- 
2.43.0


