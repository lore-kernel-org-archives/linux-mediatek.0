Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72ABAC678D5
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 14:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wybJnM53KevypaA7rKqPG0maKqm0ssJ3PZrRffZT0iw=; b=Yim2MxI/SWWq94
	h+JWj7Sj+O/nDG57o8popOUgl73UctdcXOENgJR8ZH3FvwGPJ2ihABtxJw6+uPdncdInMs2FCMaTZ
	WFrELU5QaKE+d0zg51k+4DPM4Ayam8bKdozwhSlwwNnehU2hfO70wSobbsJuQt5YCWVbcWBT3ELqr
	UxOLmvG6IavwR3Z8JME1Hj1gq8aBm8CMr/6/dDjDTdGzExPAYYdtX1Lr3cRKX/SQWkntDo6ch9NUx
	dfPCdunUJqH8w+gp7Gj5ti7/q3aSgZDp9yxfhkHG2J3UEBVJAAgp4VYupZN2x9vsQlpUQ47hlHRPf
	FDkqoE9/mEx1uvDIckWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVYjj-002hOu-Gu; Fri, 24 Feb 2023 14:07:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVYjX-002hMe-VI; Fri, 24 Feb 2023 14:07:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5A82661843;
	Fri, 24 Feb 2023 14:07:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A58EC433EF;
	Fri, 24 Feb 2023 14:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677247654;
	bh=6WgQseSSE1/0RjYTZmTF8phVwKCFajro+gk7cetd7fg=;
	h=From:Subject:Date:To:Cc:From;
	b=e3icBfRRHSaWBxoU7LXlhkkJ0dYzqRGcFoeLU+fspHDzlaA9zBC8GeNEr0XoWqRYb
	 XrWCoGjjVBIjqcs7d4Fn0XnOqYQPZ66sLSLH85VvoqWnwlZbCSUYTqBzMqkbk9Gol+
	 qJyNPR1dH8GkTHU/eTurusY2fu4NeKRdFDjG5Ci98wc7ru8+xQso8CEw4jFzJd9hlb
	 aZABOvgqo7J2hWYjnyLse4bS0PkJM5HA1SkEOKbThYc9T6S5x7xLhJ60RS0EJu/apn
	 lhCFM1kQJZGHnb3Qjo7eTeasTkDA7K/1drnv3JHFpNrmyqdmpU7BU6FNYQU88xQxys
	 CN+qvpn2mCfkw==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/4] ASoC: mt8192: Fixes from initial glance at kselftest
 run
Date: Fri, 24 Feb 2023 14:03:54 +0000
Message-Id: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMrD+GMC/x2L0QrCMAwAf2Xk2UCbwqz+iviQdZkLsm42U4Sxf
 7fz8Y67DUyKisG12aDIR03nXMGfGkgj54eg9pWBHAVHFJBtTjit0V8IX29NTxz0K4ZxCOLYxzN
 RC/Xu2AS7wjmNx79Oy2GXIv+8qtt9338NhGfcfwAAAA==
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=949; i=broonie@kernel.org;
 h=from:subject:message-id; bh=6WgQseSSE1/0RjYTZmTF8phVwKCFajro+gk7cetd7fg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBj+MSgptemsOYFwoH0fc5cIPy9dkZo6raLVN9t/bwB
 +1VF2laJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY/jEoAAKCRAk1otyXVSH0F4CB/
 wO8wM26BECdCimtw2TUtGGjddmXPhsckwQto7lBLJnqtFnOxrYE4eHSGXjRkRyvFN1BjKnEObQY6Cb
 ZrzIw5s7kYMxAd0ik6y/+TOM5X+a2h7PJvwkfFlQEnTNUXz06e+Wr7+2th0RPw28ovpvrv9suUyjMf
 PrlaTSKbcvL/ThYL94y2bKP8bqL9segFhHf8NwSpneSBlVAsg3lHNb2tUKoVxZP4OeTMNSgMTlyYxd
 GfYjWV1qZgwIKdzteb1WDVZQn20VkgeGqSy4G+XqdAsor1IPfo26xdcE0snqTs7tID86Yvi9yBN9ss
 MfryzIZcD7L/hWfFve8dZ9/dvrj84m
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_060736_076537_03DAF817 
X-CRM114-Status: UNSURE (   9.25  )
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

This is a collection of fixes I came up after glancing through an
initial test run with the Spherion Chromebook on KernelCI.  There are
more issues flagged, this is just what I fixed thus far - the volume
controls on the MT6359 have issues for example, and a lot of controls
aren't marked as Switches like they should be.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (4):
      ASoC: mt8192: Remove spammy log messages
      ASoC: mt8192: Fix event generation for controls
      ASoC: mt8192: Report an error if when an invalid sidetone gain is written
      ASoC: mt8192: Fix range for sidetone positive gain

 sound/soc/mediatek/mt8192/mt8192-dai-adda.c | 58 ++++++++++-------------------
 1 file changed, 19 insertions(+), 39 deletions(-)
---
base-commit: b361d5d2464a88184f6e17a6462719ba79180b1a
change-id: 20230223-asoc-mt8192-quick-fixes-8f3e0a187226

Best regards,
-- 
Mark Brown <broonie@kernel.org>


