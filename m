Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AD4CD5BD0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2026 13:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kkzyEKL9NR5CB1YGybIU9XChAPif6lvYie49X9D74OY=; b=0UgujwV0u/VhPn
	ztPjaaFQ4KzqRzCpOFLtI+L+hmF9QmBHlSSQrPeHFjVzjeL8bqKFakLU45RfEdVxsLjONRGmBzYUA
	KjK0GZE/SAbBHnlM+s/TqXYS06DpHCzF73LdO0X5RkUoMUvwXyVYxIQ1vhBP6JGfLl7A9lg/vbjdv
	Y10bQoImAADZwVnyMMjHWcv584B6KgLMYvj/9rfi/N3sqjw//WDtpRYoyj9nVpu1Mgq3xzWJ3Dogg
	ymuNL/e8k8o2hUf+hPjlpXvoiYg0eVaLbsOYmSZ6uvfGhbyVYmt7DnTZ8IxEOk0knyutTJdpG48Zj
	VfzzKQU4Rey+v7SYG+jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSEWR-00000004DW5-0MTF;
	Wed, 27 May 2026 13:42:11 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSEWO-00000004DUw-0xvX
	for linux-mediatek@lists.infradead.org;
	Wed, 27 May 2026 13:42:10 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso5086315eec.0
        for <linux-mediatek@lists.infradead.org>; Wed, 27 May 2026 06:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779889327; x=1780494127; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kkzyEKL9NR5CB1YGybIU9XChAPif6lvYie49X9D74OY=;
        b=QLHGrOxJfuLl5wmEGjlyqFTklnBT8W/X4zvlZD6F5/IJw1tqEFbsdnf0qkl5tsvWvK
         wcKeVTepXdHQWfGS6orisU1TyeWErwbvz/IS3FyhHqi/SQE19JBEpe4VXiYtJ90pAUCQ
         65BEJ0mmtU3SH1tnFLqqwbCwFCkqqP9iWfvriAC3I292t5+jSdIQY4VAmc92RZlvudDI
         aWEu9znKoWjwq+VmRHdw41nAdRDNVNClGlyYsaWID1TAqOJ9nBTHepd2qoHFKFGr1TbV
         /x+iDcOyfxXkDIsob7ZWyWZpbEXxfSqgvpp30DPme/SDfFU705wNOJsZTEXcvHlbxtB7
         z97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779889327; x=1780494127;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkzyEKL9NR5CB1YGybIU9XChAPif6lvYie49X9D74OY=;
        b=etSElxtYcdRS0REbHoZlhepasiZh786byZ8fLIJdsIaOemX9Nd/D/OPHDthULgKuBW
         F6dEQxgLWT2wYSq1tHsTBBm0OhTvUf2aBDtVporZNUG7IRD2lyzHZw53YOB8qsi2vl8z
         wxkxejjZPA/Opwa9j7RkBN2RiD931Y/8Swm36loUvDvpsYTlspsbIkkiG6aeN/864PsX
         GcDtWkFiuwoZLwV4/ujYu8Ilduvvg6PW42JdV2p/epy1nJvtE9Bwup0tIE39A3AQIF16
         Z5o7Hznau9KGUd//b1MoZ/qwxxFqxSE0XmdnbJzu+ypho1iJc5J96DljhNVZCs9e64XW
         jVEA==
X-Forwarded-Encrypted: i=1; AFNElJ8wBFag/u/Y/QbPOHM5qCpDPP9FhmBBk61Hf8g4YIyAd7Gd70BZlJEnCuFwNTnTUgyy+yT65+mpV9YZ4TP7NA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+llskjJXrtYTizvwXLCJeh1KoTgvyfeIWFWHSggAedYoGz6zd
	G+YkOw57wtyqk0nqT6PREJNiHqRc7blnswHVDwKwNZwNJ10kBcZrT9o2
X-Gm-Gg: Acq92OH+e/eq2XXB3FtH5nR6acy4q5MLWAwO/NsACfIgizZfX96zS8HOQDKc5u8yiQP
	hMj72yTHIf1Bi7U8qH/ZipBbPI/T/RPTs8q5cqoYFASpO5jy68e6gOtyRKKHyx+PcHjKnymWjfM
	iA4at5WV3HASF6Udtsxtumts6ZjeZn62X9uveseoNwac606K//yqFZtTz+P73CbIzwOa5kFq02g
	1ZUhLhPBm8zfSjqAFZuEkO5JdpbyBQe5Zwx6pgYkIG6QFmHp4PyXOewquerGSgGqqYcpGFWk5ej
	Uqfd1sIHMrf/zaL98Pni29LYCLwr+K/AOcT/LV5NdsZ076F4wvcyNHz+NpiAfiRJn9dJQwJ+BAD
	0pSDMzeoztXIKB2ESpbpV1zRRfdTnJE76GzOmEPn1y8W8jOial03OrowXZRHHBJ+xmRmyGyd0F1
	hkdxK6ShmqS+l9he6lO1wJ7VMtxkxxLpg3kqVVEz94SLYY4N6IJSW+wmX6BUPV2IdiW1BLE/5Sc
	26AqGdDgYPF
X-Received: by 2002:a05:7300:1489:b0:2dd:6937:79d1 with SMTP id 5a478bee46e88-304490c3717mr11002170eec.15.1779889326738;
        Wed, 27 May 2026 06:42:06 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ccdaa124sm311702eec.11.2026.05.27.06.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 06:42:06 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Subject: [PATCH 0/2] ASoC: mediatek: mt8183: Fix probe resource cleanup
Date: Wed, 27 May 2026 10:41:47 -0300
Message-Id: <20260527-asoc-mt8183-probe-cleanup-v1-0-4f4f5593c8d1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBA0auUWTvQRKPBq0gX6XSiI5qETCtC6
 d2NunyL/1dQrsIK526Fyi9RyanB7DqgW0hXRpmawfb22DvrMGgmfM7e+D2WmkdGenBIS0GO0Xm
 y0+FkHLS+VI7y/r0vw9+6jHem+TuEbfsAiwD/V30AAAA=
X-Change-ID: 20260525-asoc-mt8183-probe-cleanup-eff58c2d4715
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Shunli Wang <shunli.wang@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1056;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=2Q7+zlygQDiWGfxx9oKNM/G5wMI/KwIzH9dxAE1Eg+8=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFliX1Zej3nUwndl6QHG3JC4CezSWbm7z/btUjCI//CyX
 HrFjumLO0pZGMS4GGTFFFlWJy2y3NP14Gp93AoPmDmsTCBDGLg4BWAi/7cyMqxtUwvPNtl567XI
 6ta1Anf9/LUY8tZdY1tqY/5/vYzfxxOMDL3B1oeixFaZbl5TmlPlpepdl3T8//N1M6P8cmQf/Hz
 CwQEA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_064208_303716_5679307C 
X-CRM114-Status: UNSURE (   7.12  )
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

The MT8183 AFE probe has two cleanup gaps that match issues
recently fixed in newer MediaTek AFE drivers.

First, reserved memory assigned with of_reserved_mem_device_init()
is never released on driver removal or later probe failures.

Second, the probe-time runtime PM resume used before reinitializing
the regmap cache is unchecked, and a regmap_reinit_cache() failure
skips the temporary PM put.

Fix both issues with a devm reserved-memory release action and
checked runtime PM resume handling.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Cássio Gabriel (2):
      ASoC: mediatek: mt8183: Release reserved memory on cleanup
      ASoC: mediatek: mt8183: Check runtime resume during probe

 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)
---
base-commit: 8cd773d4f8235aaf0b04927b3c9d2d0326def09b
change-id: 20260525-asoc-mt8183-probe-cleanup-eff58c2d4715

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>


