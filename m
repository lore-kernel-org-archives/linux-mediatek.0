Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7DFC5DF89
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2026 12:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WhjxC8meyqFgoC6xgU71L58Qnwuzn87ityQti+5Ixag=; b=ZN/gUwuEkmzm4ig76uQaikN+qZ
	c+hgw3yiZ2FlYadwQ1wTHLXzxwaSBbS3a18rdCPk+pks5sVctdumJu65RJu5FOTepgZ/pUlkDgsb3
	3qOixu2QcVEdWFawkIrbtvJZVmRgvpbxb4tXVH4EtDfi2TYOnios3Xilo+UMTS1rTnshB44FWOoWN
	4z7mWF9PPpNefdWsJDSRBZgQDd2TW51HF5tllkD5oWtmVnZpdLZLKHsu/35UL8S/3REgQPCO62XFP
	oYuHClG0O0Gby+NGDc4MlvxVujfVTZNsK6QwE/K96CxTwhMIeDhhe50I4PT+rdP26fNt6IC7jRMJD
	qm2J2+zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxONU-0000000DJIn-3fUV;
	Fri, 21 Aug 2026 12:29:44 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxONS-0000000DJGo-1Sfc
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Aug 2026 12:29:44 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8485b358552so258863b3a.2
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Aug 2026 05:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315381; x=1787920181; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WhjxC8meyqFgoC6xgU71L58Qnwuzn87ityQti+5Ixag=;
        b=Xke9kaIhnRJvdE3iHUnzXp50W98fDtAGNxQP9lHCVkGmZ4MvctU1ayWouCl86G9oqe
         W+DOYiuT5fZGSNqRHrnJB9fYwRTqKZZiNQUL6KpAkc+aFUknOA2fqzkGIC4M3iEdkmKP
         ntLiiMd1lr5Z7gsJT9vRZUg9CTTfgxgXi9aTAXPhXpXJ2IhrDslm6ZYruF2KdWZ8IQBC
         0wi/wDABMNb6N06cz7BSq17aarnKqOhrV3edsz8ReYjv0jQ1CcE7xxStcjTAh9GqBhB+
         QPHljeco2AO1n5Y5FYBfRd/3r5aAmMB761gCY6xZz578TIhk4Pb2SdpSMBZy2Qd1RIzJ
         /zHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315381; x=1787920181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WhjxC8meyqFgoC6xgU71L58Qnwuzn87ityQti+5Ixag=;
        b=A4xQUyIbTAv02bJERBYjiZ4HUgV/1DQtMzUPxmiwOBv0DNRRYgTxwRcxMzO95TZrMM
         OerFTBAjmYkgxQtnH5PDeLUPj9TxsAzzRids6n6ekqeDH0/3psxVbyQ8CBHd18lz/Rtc
         9O0aY08Bg4hjw+762y0vQSnBZP2kjW4yQmREe9xN9+YCXVldMMtL843SUb6Qq74M79uY
         Mlpja0yNMB5EC7A8Uig8ToxR3u7irq81vhRGBwe0OXhm3qYuWjjJd08Ow+Cd5QeCZrJR
         WtmbDP3N+BW27FIFokyifoqaJlclfGFhWWJQpyatHk8lfneuFD2lMYfaBkaMSUqTw33P
         h0yw==
X-Forwarded-Encrypted: i=1; AHgh+RrREe0EHrOeJUh/NEJBJdT64iFN2XMOBIQHGK1+Bl/dTxxOEtNgsQ4YJ/r7urKit6wowXW8F2k0nqV3t5AYZw==@lists.infradead.org
X-Gm-Message-State: AFuF++kPm1TCrrO1lCz84I6N8IyHV/ThQfPI06yBKwFAn8zrMIbGyfWv
	nMKXaPjjJWqgS0Hx7mKirafM6RCQ/S9mkqePYFsICmc+QEFxUOaAyF5P
X-Gm-Gg: AR+sD1316TbpkEFgreTlburTHnYZJAx8FLCov/ocUJcTnWPdSZDGi1nDxBsejQg/vH9
	CuxCiznm3TxzyGMk1dB7EAONAV6uKAjrN6deFVZYaubeT4kpNI/z2BZfV2sjORSo5NnaUb4oN7C
	a6ykCthLxtvn9aipdbsLe1nJ6ElWS3Kc9rxNX0Vat72mo43dGQWaqRl0vUGQj5E5AVQp8aeUXnV
	DA6gozbCyWwbuvlNfRzbUF2zqLrXiE1PSYlrANpOxszh25RJtJanJ6KXA6yYiojMcbHbw5T05se
	4GAPNNT8yjlFo0O6V4BVUFU5hx7ZuFD1grBcvn9H/MIR1q5ySpodn0Tjf8OiE3W7p6MxYT1WNjS
	+tDf7Yq67nNMmJPsPKzhR7W5cgWvBjvWmz2WOWLfGT4pA0pcduH2lvBfGb9/tWMBGFPt8BP4tbO
	pwzZthBim5iokTa9omWlh9hRTcjOIk3P4e1mhGDG9aO+xPpB3//vNk18TEgMMQUFIegCIsbv6Ck
	6yXwlvzVCOIgtI3+12RqQabVImk8FVToabAAVpYkCeFLUm51DXXZ4mFqmPE6LFxvdk+zDLTKtcH
	HYTM
X-Received: by 2002:a05:6a00:4397:b0:837:e9cc:d474 with SMTP id d2e1a72fcca58-851f9bb6a9amr10190094b3a.2.1787315381261;
        Fri, 21 Aug 2026 05:29:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3389fc4sm2848582b3a.14.2026.08.21.05.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:29:40 -0700 (PDT)
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
Subject: [PATCH v2 0/4] ASoC: mediatek: mt8183: Fix clock error handling
Date: Fri, 21 Aug 2026 19:29:24 +0700
Message-ID: <20260821122928.41343-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_052942_400163_CD62A79F 
X-CRM114-Status: UNSURE (   7.93  )
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

This series fixes and cleans up clock error handling in the MT8183 ASoC 
driver.

Compile tested only.

Changes in v2:
 - Remove the redundant error log for apll1_mux_setting error handling.
 - Add Fixes tags.
 - Add a cover letter.

Best regards,
Phuc

bui duc phuc (4):
  ASoC: mediatek: mt8183: Fix wrong clock cleanup on clk_set_parent()
    failure
  ASoC: mediatek: mt8183: Fix APLL enable error handling
  ASoC: mediatek: mt8183: Use dev_err_probe() for error handling
  ASoC: mediatek: mt8183: Drop redundant probe error messages

 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 25 +++++++++++++---------
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c |  8 ++-----
 2 files changed, 17 insertions(+), 16 deletions(-)

-- 
2.43.0


