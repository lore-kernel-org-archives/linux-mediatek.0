Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5487C54E74
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 21:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5X5pmPbwLhveMS4kv3Gqd8pebh+qyE6AfgNDbv8+l28=; b=BP+Go2e3cYMFGvI0FZev2ZiJ98
	m3OmjIyqnh2o66srG0TLe2xpJ1P5snkUzp6x74ux3xcWB/cDFwp7ydg3d6RAjKXOzIOsMgvnCsxnb
	zrdXlz6WnF3j/7cSQJJqbskP+t0JM5A+VF0y1fli1ANLhK+fyyIMxYY87afx/3Aaz5NCXygO5lneu
	Bnx4TlnvGIEWT3VG3QBu4h7iIQqYfbG2HUx5CqS+sCbonV9dBEpasReXjHMbCZ/HxMAaOB6OvrOd1
	tx3KcXMCY6JpQaQf2IjJPf18uGsI+wePikucLseVCiToqwumfN/i6YZeDf4xhXv/GJ48nJF5BCDSk
	aKwnhGXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmKTh-0000000ACYR-1wn6;
	Mon, 18 Mar 2024 21:25:05 +0000
Received: from pb-smtp20.pobox.com ([173.228.157.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmKTa-0000000ACTM-0Zv8
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Mar 2024 21:25:00 +0000
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
	by pb-smtp20.pobox.com (Postfix) with ESMTP id 262F6234DE;
	Mon, 18 Mar 2024 17:24:56 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=xwC5o7BEiXf9FRl2hIxykD7yqDyuhrPupfBToOJJlTg=; b=GFPz
	1DB5P8iYSvs8eQpZaspEU981FKnl5eFfb8OqT7owVB6XWFlQsBDto4LRQ5C0CUxb
	myQY7MmnDEI14kn5r233oNvotzAXQ/nqJmSBPs9jsSFrTbe8rm6RQZCwz17zStC9
	BuILDtODNhKNGo7tGXbzX9Q5/NM06AROkEAug4U=
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
	by pb-smtp20.pobox.com (Postfix) with ESMTP id 1E6CD234DD;
	Mon, 18 Mar 2024 17:24:56 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=from:to:cc:subject:date:message-id:mime-version:content-transfer-encoding;
 s=2016-12.pbsmtp; bh=xwC5o7BEiXf9FRl2hIxykD7yqDyuhrPupfBToOJJlTg=;
 b=sP5Qt6UGC/+x2zgsfN1c23WYC5W8Bwqnr+vrInzMhV35sxHqu0cMMPRbm11nMfW48XH5Mb4Hd7OyCZXsRIHAaFfURKNB4XKs3KsIDreIL72vP+NKAMzyw+dY0wKlmtnPOytUnAKxPctpTR1LfwSonpECK0thbxhcYFmpD2XxXhM=
Received: from yoda.fluxnic.net (unknown [24.201.101.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp20.pobox.com (Postfix) with ESMTPSA id EB0FA234D9;
	Mon, 18 Mar 2024 17:24:51 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
Received: from xanadu.lan (OpenWrt.lan [192.168.1.1])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id AD6A1BE2B9E;
	Mon, 18 Mar 2024 17:24:49 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Nicolas Pitre <npitre@baylibre.com>
Subject: [PATCH v2 0/13] Mediatek thermal sensor driver support for MT8186 and MT8188
Date: Mon, 18 Mar 2024 17:22:02 -0400
Message-ID: <20240318212428.3843952-1-nico@fluxnic.net>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Pobox-Relay-ID: F501C348-E56D-11EE-A2FF-F515D2CDFF5E-78420484!pb-smtp20.pobox.com
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_142458_316307_2A3622EC 
X-CRM114-Status: GOOD (  10.80  )
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

This is a bunch of patches to support the MT8186 and MT8188 thermal
sensor configurations. Several changes are needed to cope with oddities
these SOCs implement.

All values (calibration data offsets, etc.) were lifted and adapted from
the vendor driver source code.

Version 1 can be found here:

 https://lore.kernel.org/all/20240111223020.3593558-1-nico@fluxnic.net/T/

Changes from v1:

 - renamed CPU cluster thermal zones in DT
 - fixed logic to cope with empty controller slots at the beginning
 - isolated bindings to their own patches
 - added MT8188 default thermal zones

diffstat:

 .../thermal/mediatek,lvts-thermal.yaml        |   6 +
 arch/arm64/boot/dts/mediatek/mt8186.dtsi      | 256 ++++++++++++
 drivers/thermal/mediatek/lvts_thermal.c       | 375 ++++++++++++++----
 .../thermal/mediatek,lvts-thermal.h           |  26 ++
 4 files changed, 585 insertions(+), 78 deletions(-)
 .../thermal/mediatek,lvts-thermal.yaml        |   6 +
 arch/arm64/boot/dts/mediatek/mt8186.dtsi      | 256 +++++++++++
 arch/arm64/boot/dts/mediatek/mt8188.dtsi      | 383 ++++++++++++++++
 drivers/thermal/mediatek/lvts_thermal.c       | 425 ++++++++++++++----
 .../thermal/mediatek,lvts-thermal.h           |  26 ++
 5 files changed, 997 insertions(+), 99 deletions(-)

