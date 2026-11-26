Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A6C606A327
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 00:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CP6TE74t;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hadKJSGo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=8/j2KGNaUueZ6HQz5OAd/x2MDfeXHwBB6zGE9XCsJuQ=; b=CP6TE74timF3QYJj6Xo5DE75Y9
	a+FE7Z3l0PkJcCwFw6292Y2G6oes6ycmH1ofxOf+0syiZEZd8apL4WfGeyo2EzXSHvnHZoLytUEG6
	CNqpRqwo8jVS8pxCTvr79QaYrP03bWL45l/etpg5tFBGzZCCDhunmpYhvh6DA0l19aTeJ/XIX8cp4
	ZXgWUNp8oBo2l1o39S/KvTgECYuP1Lr2d7lQuiF/f4CMJqWHwLxss2JogpEs2ZSI6MVL1fD28iSsd
	AMO2+PLlwC83fdBMfsByg/mu8pKrPs9KfIFRxBD68btn2KjBuqF4lgfoFFmCznyAX2NDdqOAtoOuh
	xEQ36c/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNlF-0000000BjGg-1nOg;
	Thu, 26 Nov 2026 00:54:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNkA-0000000BiOb-25AW;
	Thu, 26 Nov 2026 00:53:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E6CB6623FE;
	Thu, 26 Nov 2026 00:53:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795654425;
	b=K4LCPvnwCnnEoEywbRH/+m/Hl9FpVxKZf2umq67t1CsWpuniamDaJSXja7YWLVT5ZmQ/
	 VAG51ZUDoHBOclY8cJDv1clW6EQgVKwUZOt36YcExZWzEJ57tNgGFcCjnKRByv5pSzAUk
	 JzVKItVHTk2x/hAvqguYFve8AYWv2TRM1dXAABoceDE2/qCd8/LyE2kFd91uxUGNUPmMg
	 jk9F+ekg3/7lW+V7ATVw90ZSuL/maBUwP5YteMUxZZMNYMR8Eapu+ykPok9lYlG34yVY7
	 XW58z/9qZJJrFJeYo0pfGCgmdhLMO6ArPM+r4wLnm9JDMxK+jMBp5XvCVh0556fGmOg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795654425;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=8/j2KGNaUueZ6HQz5OAd/x2MDfeXHwBB6zGE9XCsJuQ=;
	b=r7zBADGDw2ZthHaUTPLYplYLJF2EWC+pMlAeUCZKOb5R3408tms1DFRvPzBWqfwHpnRi
	 1qwulXswrKF2cS0HYeq3323WINM0S7VjCuQ6Qpgqeb5NhBqOeSv95YEc1ctnJLOdyCv4Q
	 z7GJzNYowQgBeDxiCHcSmMnqWt0yqMAK7xmcW4PQ1jSFTr3Nq2sAK2a6fZ0AuLmXwNE/w
	 rpiPq0J/+FzGH9tnKgM279OTBG3wpN4SISId5Fp5lmRI7xNYo97sUHL/LYxumksNvdBaf
	 ka+zMqBPhKOniZJ6i1kYskBPmqe7km8aEp+5xsqaQZxyJbtHcSV5d/fKfdvhYRVS0lA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5E1351F0156A;
	Thu, 26 Nov 2026 00:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795654425;
	bh=8/j2KGNaUueZ6HQz5OAd/x2MDfeXHwBB6zGE9XCsJuQ=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=hadKJSGo8qESy/3RHz//wg1kcKvfqvy9r3OZ3C6QiXXx9jRgpibGVifTOjBpSvnz6
	 UkCeJ2EM4W7/zRWaA7gDLOcijtBDGm2iaQxHo9p5q2V9vM6ZluBMQpPFlzoeAfXf9e
	 i1oQdmXjjLMX8ZMoYMDOGxd38oqa6+CeU1dALClMwQvG8S8/+hX7YJWK6/gIty9fFA
	 pvSY5/O8KYD/3zaF97EwnXq49ZjCPHQMaXDCemUZia2dInqUtFRG0NBhvP8kmzROkw
	 rtOO7xH9G3UdVSJ3hMoQO/iErq3EqKItyzEStNh+kDWgKYZZz79YP6anKz1HrKMfgH
	 eVFxcsDw551aQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 159354D144;
	Thu, 26 Nov 2026 00:53:27 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
 andy@kernel.org
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 linux-iio@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] iio: adc: mt6359: fix scale divisor, request bits, and
 MT6358 VBAT ratio
Date: Thu, 26 Nov 2026 00:53:26 +0000
Message-Id: <20261126005326.71926-1-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795654406; l=1166;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=n/bGHTO2cir7J4gLJmLj6ma/8giXqTZENBQlokXLnFM=;
 b=zLM3faDqP9nS67VJwbKUrhhlfrkzrS2+nfQsu7lnjxRY/4w2zOWZK4JlGa7zjPZkg7zztfNmB
 G8gWxAzZTtEDYUMHdtloR8JJPszlX3jrGB5QA3zjkVrkpHo9mZEBeeo
X-Developer-Key: i=iasnezhkov@gmail.com; a=ed25519;
 pk=hQgXfiWi4ukk2jh4BHu1vRVhg9BUivo//AFp50AKMag=
X-Endpoint-Received: by B4 Relay for iasnezhkov@gmail.com/mindone2026 with
 auth_id=1643
X-Original-From: Ilia Snezhkov <iasnezhkov@gmail.com>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: iasnezhkov@gmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This short series fixes three bugs in drivers/iio/adc/mt6359-auxadc.c
introduced in commit 3587914bf61d ("iio: adc: Add support for MediaTek
MT6357/8/9 Auxiliary ADC"):

1. IIO_CHAN_INFO_SCALE omits dividing by (1 << chan->scan_type.realbits),
   causing processed readings and sysfs scales to be 4096x or 32768x too
   large. Use IIO_VAL_FRACTIONAL with shifted denominator when
   denominator > 1, and IIO_VAL_FRACTIONAL_LOG2 otherwise (avoiding
   division by zero on unpopulated descriptors such as MT6357 VDCXO).
2. MT6357 ISENSE/VCDT and MT6358 VCDT use PMIC_AUXADC_RQST0 bit 0
   (BATADC) instead of their hardware request bits (1 and 2).
3. MT6358 VBAT impedance uses r_ratio 7/2 (MT6359) instead of 3/1
   (MT6358/MT6366, matching MT6358 BATADC).

Found and drafted with an AI coding assistant.

Ilia Snezhkov (3):
  iio: adc: mt6359: divide scale by ADC resolution
  iio: adc: mt6359: fix MT6357 ISENSE/VCDT and MT6358 VCDT request bits
  iio: adc: mt6359: fix MT6358 VBAT impedance resistance ratio

 drivers/iio/adc/mt6359-auxadc.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

-- 
2.54.0 (Apple Git-157)




