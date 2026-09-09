Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 600DCC79FB6
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2026 20:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qckaQ07GIjAycth+WTbJjXIHu8VJsW0kggwIpsbAbME=; b=0YQAva4lQzZmfO+u5muFxf+BcT
	Ik+PeNN+YwEmA/i5/xlnVKZGcqgHrYfOtFWqvut69464Un69tcBhLDOczUnBz5scId+2yP+JutALy
	xPrQyktZ9MBZb6sHI/U/tVoUPNhEjtOs0at03Gewdh58AYPBruGIfV/gWNYYK64E3sHVYmC0V5r8G
	fb967cUPsB2abH56Pi9JNdGU0EfA/GYpos6y9pFYIY3ecfnpOm3X9jq3D7zjem1+eisUTRNWt83Ps
	rY++kpzwgofpdKj8WI/jt5e/qtyV/NWtM4vjVOBb3DpfUZWW9BanidHI6xnKZ0xzWjM1E9fagPDD3
	a8IBowug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4OvQ-0000000Co6l-05wa;
	Wed, 09 Sep 2026 20:29:44 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4OvN-0000000Co5a-2eac
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Sep 2026 20:29:42 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso62130625e9.3
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Sep 2026 13:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788985779; x=1789590579; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qckaQ07GIjAycth+WTbJjXIHu8VJsW0kggwIpsbAbME=;
        b=TBTCZBQVXY7o1z/k5lO6NKcH1fETaBAFpNw4/d98mEnKPGkp/+2D/1dO6bENuDCnuF
         AddhEXoPXAYaLBqvwcDgBQZ82lzOF9P3kFpgJyOzhdE3DdEZmA3O8GjrfyO9yyTuL05D
         cVGKXhrxlVbQJA7r8v8vauFrS6NBYpUDw5aQ5O5zxaSbX8fhhx1cfOwCqIQW4ufqhFbu
         bV1hAYCa+VelxVGYCqZwbpPuhEZa8m+HU8YdzzAFI2ndU/QMoPmWePkpz/KwDQ2LTJkb
         Ei3YLOQ83Q52ElxX12xxq3RbJwyTBBakdZVL4fabxuuL+pWrsP+5kSia6UyJAtZowStt
         ZNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788985779; x=1789590579;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qckaQ07GIjAycth+WTbJjXIHu8VJsW0kggwIpsbAbME=;
        b=jvbWmgS76nx5B1Tmv/ltXX4k0KOTQUIpkJHaidRa5gmax/Prc7VSHTJNHaKXB9S0M9
         /qxvc6ipNT0cGctZfAUH2AC5JRv2MmmajOJ0sL5HKkp7bPT5MHGHDGTYTIvUfFG2DNw0
         /HUbsMGb3qvcpKLFYA/zlWAQZmVXCQmgeRvNT3yccvjt3BiaAOIZui1Rvo2NEyTvIdYP
         nS1YNHEqbB047x8xg5kqop5SJU3ySVtD5qE90LkW6Uf9RijkTj7oa1EbFjBDXGq8s3UJ
         o7IrzmAFFt5wR8ATBNbbF65Vr3MQ9rwDmo/XO/4jHyEhQYLiO7MNSvJWYenFzitmNPOO
         bR/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwWkIgCR6BBPVXOh0q0B9qJAedO111YzEvnGbSB3m/qcf140plbx8TgdwgPXV0FrQ5dSzj+mcyvgdz5p3/C2g==@lists.infradead.org
X-Gm-Message-State: AFuF++kDGMFbRPK4GRANmrplJmW4wFvceTZfXg7Q6gcsmuRnwD5JTxXp
	1/7weExczYqimy/yW8drJfAc9GwctTuudk3Jds4qhEftAlhmkXYq8A2w
X-Gm-Gg: AYBFou3xM7m2PcSv0ENCPXWsfuBvoskh+C2chrPQ2wuBZX1LUxBfDRKMN6wp54swhZy
	6yeCg/41gbPLvF6ZjCxEDYkLWSluyMKIbFmu4iBb+ZmLEscFaF6Gyy83zVwCRqCEx0byBahZ/mC
	OSKL8lT3Bazm4FRagFDVXktqmxYtsReAmGYNXY35VBQeMZJ9DaTbfmSynXDDJ/3Ec1I6K7W2rdB
	bLEbmxIzVBsBXJF867cQFA+PY6YBlySEjOJisRYu64l5oPrrTKzXBJ8u4nRDsELfUaIin/Y1qZj
	aRoSHsm4pdRMkFf8Wqnq5Si9iLHu2GaEefEdL9XUrlNa/6psHtSW6jCmnBjmugcCho+ktvSx/Oi
	/kL0sGxyC2/3phQTiKyYuq98iWM4ptvwfr5yQKWwI8hLlJOPnXOPQIUS6UJrFF4DvurC62hNumX
	HOk0WRaOS1ohTfX9YVZEh0ROe3i+nxn45DUyI/XaIdRTxurbYaEYH+ZgGGFr12So93mU8Qd+9kr
	0iDoSBrZ6FFGiRvDig5ztaJLF6Gyy1UsiMMSXKHMwJLrsJPum1PlwZ0ptT6SAL82zrSmVFScyTt
	RzXbSTpMw/ypE7hK8rS5Yp0GhivlhMI7LpdVLzW49O17Ltb5JpcgDOG8jVQr8ttjEAZGHNvyska
	mm/SoYiiA0IiA47gO
X-Received: by 2002:a05:600c:628b:b0:49d:2856:fcf6 with SMTP id 5b1f17b1804b1-49d2856fe91mr2796585e9.15.1788985778747;
        Wed, 09 Sep 2026 13:29:38 -0700 (PDT)
Received: from workstation ([85.186.165.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26b7332asm16723565e9.0.2026.09.09.13.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:29:38 -0700 (PDT)
From: =?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
Subject: [PATCH v2 0/2] ASoC: SOF: xtensa: prevent stack OOB read on DSP panic
Date: Wed,  9 Sep 2026 23:29:31 +0300
Message-ID: <20260909202934.37644-1-stefanghetu9@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_132941_689463_ABD86A8F 
X-CRM114-Status: GOOD (  10.54  )
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

This series fixes a stack out-of-bounds read affecting all platforms
that dump DSP oops/panic info via sof_print_oops_and_stack() (i.MX,
AMD, Intel atom/bdw/hda-dsp, MediaTek).

Commit 58bb5081cba1 ("ASoC: SOF: Xtensa: dump ar registers to restore
call stack") added a loop that walks the flexible array member ar[]
in struct sof_ipc_dsp_oops_xtensa, using plat_hdr.numaregs (a
firmware-supplied, unbounded count) as the element count. This only
works correctly for callers that allocate room for ar[], such as the
Intel IPC4 path. The IPC3 callers listed below allocate xoops on the
stack with no room for ar[], and were not updated when the loop was
added, so numaregs walks past the buffer.

Patch 1/2 fixes the i.MX handler (previously sent standalone; this v2
includes it in the series after an automated review pass flagged the
same pattern in five other handlers).

Patch 2/2 applies the identical fix to amd_get_registers(),
atom_get_registers(), bdw_get_registers(), hda_dsp_get_registers()
and mtk_adsp_get_registers().

Ștefan Ghețu (2):
  ASoC: SOF: imx: Prevent stack OOB read in DSP panic dump
  ASoC: SOF: Prevent stack OOB read in the remaining DSP panic dumps

 sound/soc/sof/amd/acp-common.c           | 1 +
 sound/soc/sof/imx/imx-common.c           | 1 +
 sound/soc/sof/intel/atom.c               | 1 +
 sound/soc/sof/intel/bdw.c                | 1 +
 sound/soc/sof/intel/hda-dsp.c            | 1 +
 sound/soc/sof/mediatek/mtk-adsp-common.c | 1 +
 6 files changed, 6 insertions(+)

-- 
2.53.0


