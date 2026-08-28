Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55E7C61DBD
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2026 05:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TT97ogqZ21rhXkfi4nqd7h5J+vquPZUcIcmWTDNLD5w=; b=m9cCw8DToFJmwPiBKRr6ARWsxP
	FTxI1So0khhLqEwEVbEcVm007iygl1HoE40CnykceS1PKy3VZZSxVKZjMZW4no+cSj8vDo3z9ukP0
	3vkGAoppHbaR211O4KENbSIAbPPEcs2Ukp2WUv22GAd/mSAuIu345jaOohnLQEF28bYDb6TqoVtnp
	E1Q0TwmWu2ux0/IGVien2FvQKp9ncx8FultwgXSLW02ql8+2+45pAJLl9keZp4aiusk+jKZ5UQ1fe
	Rh5KlGZ64vUzp2raR2XYr+F7W+2/w5ZXzVs+xuZvI1sympC3LA+Svph9+dbeCysuBEy3B22PJ6KNc
	yIIvzfag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzomm-000000057mb-4Afi;
	Fri, 28 Aug 2026 05:05:52 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzomk-000000057lv-1tw7
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Aug 2026 05:05:51 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so491033a91.0
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Aug 2026 22:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787893549; x=1788498349; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TT97ogqZ21rhXkfi4nqd7h5J+vquPZUcIcmWTDNLD5w=;
        b=Xd7/0JljPntNnW4CRH8AKZ4zq8OgRlvI7DN1JOBdm6H7xljB1IzjIlK5z81qnMqwjV
         TzPqx9vJ019xfICEUHkTf/8RGVBL+MQFvsKqZH5GlPpSLp6BCF4QpEgrsNviYPvwmMAu
         rJ0KMpizl+eg74Sxdxh+OSnfRRNyirDzDeKfUIERLXcGNVDJNxRGQ4mwCDxqNAhPwNXI
         erjGlKhhdDpSJxl8MVd/4yxrBlpDrppqkBTRCqsHmSj0qKSFlVngPyAHWmXw2g5nwxiG
         WAUQySh4UQgWissEqdQquqVIzUEJqnc/IzlHNajxtLmcUJ/iOhLxiIWJ7Yk3ShVz0sRf
         B2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787893549; x=1788498349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TT97ogqZ21rhXkfi4nqd7h5J+vquPZUcIcmWTDNLD5w=;
        b=iYgWSEMk+waNAUfsYlyCL7WIr2VCa7Iy2BRXM8EJ8luS97J2vWn4+TJaENfopvGusz
         X5okb8Ch7b/6eqspp8UhIQp6BV0x4lMJjBvaLMj69av1zVosZP4zuTfHmDG8EQ0xTp2D
         JJ6mEM9WORX0BAyguG9xYCVrcA6VuRjc3m5VJ1SSqtBGyZkQ6wvzp82p4Ep2QB3tf451
         WLdzUfH5uAZ85jxeo3jl3FzbZ811UKi+YglGSniQJMwbyodOf6lY+FrnxljsHBBj0r6D
         heoT84ubfOqFrtUP8zTgLi8uRLq3Z+18hXK9P7hVoiMmomcLkxTxGvZndkF0KT0PN5db
         A1Yw==
X-Forwarded-Encrypted: i=1; AHgh+RoT2az4g+/nGDF34aQpt4+ZKw+TbzQBeDEQoqAPzLcApakMs603Y4DfRtJbpa4X1VdS+taPebdIY/hUePCFCw==@lists.infradead.org
X-Gm-Message-State: AFuF++nZdeEYTiDUe1E/D1Bt9oZ+5KzBP0Bbac+Zg9GkyNFpqyvxu5Bo
	/crIZZCWAhN3FpaqG6yaAFuqAHOkUAMxF+YrjmPziQbH7qGds4Ts3Xzu
X-Gm-Gg: AR+sD120COALHjGeN+cs5WCj0Ihx+FyfC88XzMfHDMthluKn8cETeLBZZ1v0gYP3zv4
	HEtw0mNT6RyX2sai8WMnIJBk73Q7r5VSZ6bhm4w76qEAjD8LR6h3/nhAna0SfcdqxMSKjaVgMO/
	SXNpU9sjhe6K+jL4wyXHSQNwfRw/leUzGyHGSiIjspQSEnoSI0MQbXp0HHrG1JSkoDiIgw76luk
	dPl01FgWKGYLebqEKnFCYz+88AQnVyu9QJJgW2F+MBxMx1K6/FzTIR/Di2ghbRvKMS9HVzNyClZ
	RAPamDX56UZ1uB1JvHWIYsWMTB2WYDQQWSritPJnRJULKWIn98lLXmWTL3mG5pGUYv7s0k+HrN+
	4yFch+DZssnlBeJK8lFRdueurEDAFLyIZarKfpti3qJ2DBn9dVOzLXrMuvfATR0tvxyzYWvxD0L
	vZKcuJDkr33RVR1rkhv0ngvj2FgYOuywvPii+mYsMWB+/BMujHC3nSfDn5Jr/J+ma3XIpjs0P/y
	rN1h/jN4YPLUO5BPE8/KS5eerSJBiq9nnqjHolH+sBy305OAE6lRO+V8A5+HXx2L/iSBqUlfBx3
	Kw3/fF60Z8cqlUc=
X-Received: by 2002:a17:90b:5284:b0:396:4dfb:5890 with SMTP id 98e67ed59e1d1-396d0e5bbc0mr9291203a91.2.1787893549522;
        Thu, 27 Aug 2026 22:05:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda7c922sm986549a91.7.2026.08.27.22.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:05:49 -0700 (PDT)
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
Subject: [PATCH v3 0/5] ASoC: mediatek: mt8183: Fix clock error handling
Date: Fri, 28 Aug 2026 12:05:21 +0700
Message-ID: <20260828050526.590761-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_220550_494770_D79D1238 
X-CRM114-Status: UNSURE (   9.51  )
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

Link v2:
https://lore.kernel.org/all/20260821122928.41343-1-phucduc.bui@gmail.com/

Changes in v2:
 - Remove the redundant error log for apll1_mux_setting error handling.
 - Add Fixes tags.
 - Add a cover letter.

Changes in v3:
 - Add a patch to fix clock handling in the mux disable path, 
   as suggested by Cezary. 
 - Return directly from apllx_mux_setting() instead of using a goto label, 
   as suggested by Cezary.
 - Add a Reviewed-by tag.

Best regards,
Phuc

bui duc phuc (5):
  ASoC: mediatek: mt8183: Fix wrong clock cleanup on clk_set_parent()
    failure
  ASoC: mediatek: mt8183: Fix clock handling in mux disable path
  ASoC: mediatek: mt8183: Fix APLL enable error handling
  ASoC: mediatek: mt8183: Use dev_err_probe() for error handling
  ASoC: mediatek: mt8183: Drop redundant probe error messages

 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 95 ++++++++++++----------
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c |  8 +-
 2 files changed, 53 insertions(+), 50 deletions(-)

-- 
2.43.0


