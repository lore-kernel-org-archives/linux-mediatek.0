Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE082C5DF7D
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2026 12:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xJG5qITotgQ4r/8yEzCbVy01AHxnXQ29q5xOCfnqmk4=; b=tsTVcx4+xEN+4i/c0HEXRE099M
	M8YWJ+CJq+Glot4nCvpKN+x+jXoAVz47DBi2VwZfxWpTjFt7YHaV9E5dS5tYS7f9U3d3G158R7frr
	fKXwio5ip/jT0czIVC2LL5tIQv43cE+TNkGN/GtiDdjPymDi8iJjiAfWn6t5x/sAtJt6tndnDrdDZ
	s9NOLmKizMufpKT2l/++qytdgLvuGvsX9SL0+CwrJUGl3TqbKLEfykuut5/aU3nmV2MiU0yc/+UK6
	MHpX9ta+Z2XEfIib0HITs5De46CAAVdpjAPd6Wa8b8wkSM/U/zW+6tHBtorYm+c0W7HV3Usaftk1a
	LGnBE9Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOMj-0000000DIuE-17Qp;
	Fri, 21 Aug 2026 12:28:57 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOMh-0000000DIsO-0WHs
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Aug 2026 12:28:56 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2cf27856f9cso9377775ad.2
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Aug 2026 05:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315334; x=1787920134; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xJG5qITotgQ4r/8yEzCbVy01AHxnXQ29q5xOCfnqmk4=;
        b=R0Y67kCuiKWl8HqKhfOaGnX04Hfiltfj9KDYy8O5rGkD1z1NQ7yX/g/Ev2S35ShAlg
         326PpN7Vf8Z5Y6YC2OVsJK6m8DdtR4szi3O858TJAJUL12Im3K8m+wh4CHM6ArQEkOsm
         AYtrS5vOcMnZJMeeN9TvIt6qR9DtEk9M8akNmnGIOb7sWUibZ1aBFiF6f9c1WMIjwgvi
         j6Qj1SXJ336Ox8U3YlNEDZ21yNFGel6INkhD8MKU4NA2NvE0qA3blFkf1UvlJsu+VZy/
         d4xlWWLF/cdAYo7N9vTnfq1iPuP1uksIxrWFMrVs48Megke6sMznagjVSmjDNjR1P2mh
         4sEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315334; x=1787920134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xJG5qITotgQ4r/8yEzCbVy01AHxnXQ29q5xOCfnqmk4=;
        b=HFCHfrSQAW36si10RotzXJZpauRTSbYHrCy4/JrzsZXDhJCQM11gNu3/y++FwT60Fa
         feJM/eSJOdKk4sqPvwS3l2DZrJZot7u1QOpmnxsLbOcVEazY4DDwlMcwov3FItxv7Dyn
         hfthclZbwvr3oBtz3b5PdSMm8RaaQ4ZP54ZSmZMLR4wDhwrqJn0R6LxAJ5LnR13oaaRO
         9DYczi41g/igV4XeAZSo+ZqUbmhiBvK59VRmRWt52GJ4XNFKfhmDWCAsV5Bmxv83xZLj
         VyBl5lPPmwm+qXc2l9zKb6UVsYt1ur5WvQRJhKfzmornTSItJPnghOFN4xNupy8dkZoH
         33kw==
X-Forwarded-Encrypted: i=1; AHgh+RqPDlLw39Cqu/wT02hzuOkyVpphxwUA7aCL4HoHmHI7lcTMu1zCyaY8LTB5td0YvGqfb5o4nyxfQmJwFULGGQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mo7trbhJsKUx56+NGmH8Y2MRj6FANgsiv6ESy/dQA5QNvcIyyV
	ouEiPmwBGicrsHwm1r/8pjC3dLisa3qdBaN1a7OxJjhx/hgSY4BnX4iu
X-Gm-Gg: AR+sD10YLE/RXcjkA3rH16ZpNj8Gsg/mBzNgsoTsbQMBANTEtZSRjS2LRTkofwUDLuC
	9A0P2qObOtTUi/UHEUln8WIFi33m00mVQ9NSZoYX+Wl8Ott0WL6Ig9HetgRyuUpxQSH3uJnGVrD
	Lapn+GyQqEJAB7rjjWDxDuvF8K+EA+weQ9ZWm1FJfEQgGUmiU0WKmTFIyfnAZx39p4kMKpKLfLB
	jNbOnI1UVEsD2APoZ2VcZQidxmTEh/dgv2rEEzCzHH9VZsrrGqpwhNW84eV0mA20Bx9rPYAW49I
	YKJnSgYgZBoWdbH+1mSjH/EbnBxeJFg/6Y4z4VEI3j4SNAbwoXorx6fK/9eOmvI6E9kcV2vmNxw
	RRcmMV9QqCDOFhvqwVBD+NpRc7OZ/Rnm8gPL4BCcrXJp36LpKxAfIL5wVe11/cAmSqQAsptm7WJ
	fEvx46qD5+ufcCZWvh+wU5XztKOY9bQPh1nvDkTy6kXVnZ+3Fc1cqYZLgKKQ2DhjqjwfcDESJV1
	cDsu8XnNzOmjoKmYK7cUQg7Wm8p4ulDpE0ZIBSPFsmvRyjELdEAFLG2EtuRJFckL3+6zQZ1nG2z
	46Wx
X-Received: by 2002:a17:903:b07:b0:2cf:afe8:b722 with SMTP id d9443c01a7336-2d64afe960dmr114112305ad.11.1787315333606;
        Fri, 21 Aug 2026 05:28:53 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62d554450sm18134515ad.2.2026.08.21.05.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:28:53 -0700 (PDT)
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
Subject: [PATCH v3 0/3] ASoC: mediatek: mt6797: Fix error handling
Date: Fri, 21 Aug 2026 19:28:37 +0700
Message-ID: <20260821122840.41266-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_052855_239608_3EEB5124 
X-CRM114-Status: UNSURE (   8.26  )
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

This series fixes and cleans up error handling in the MT6797 ASoC driver.

Compile tested only.

Changes in v2:
 - Update the subject prefix from ASoC: mt6797: to ASoC: mediatek: mt6797:.

Changes in v3:
 - Add a cover letter.
 - Add Fixes tags.
 - Add Reviewed-by tags.

 
Thanks,
Phuc

bui duc phuc (3):
  ASoC: mediatek: mt6797: fix wrong unwind order and error code in
    enable_clock
  ASoC: mediatek: mt6797: Use dev_err_probe() for error handling
  ASoC: mediatek: mt6797: Drop redundant probe error messages

 sound/soc/mediatek/mt6797/mt6797-afe-clk.c | 23 +++++++++-------------
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c |  8 ++------
 2 files changed, 11 insertions(+), 20 deletions(-)

-- 
2.43.0


