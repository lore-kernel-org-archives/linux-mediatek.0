Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C3ACD128D
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 03:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FdHWJrFPlc02B2pGH6ArAyuUv2xu/DLPV4gO6KwPBI0=; b=brSa+lLJN0QpjN2zUB7QDZvXWu
	49bjJ4LcsgdnH4D15g6uH/mJOcJPRYkTWAiVhynkmeshIyG3fsLfbLFkeRLWENMrJRwwlner9ARAV
	ysQ/WdZlbZqsl3mET5ujNL1hthrjYSImBcYkicdAmzzuEj6EK0QpOWnhIPIHwSYOyHswVxjBda3IB
	C6ZhiYwQtghkvVopK/RH2r47LNqHdAfIblxlaU/EErzh9EWYodnBEGiiCE/fADbAflL/Q7bIyU0QC
	Yb/svd6ufq2XrNcr76oCQxS3EN7IPKRL8Imgqz0pnL67RUFtaP0ECyoydjKmSZto0tKK3l2W2cyse
	kzqwXwAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrUoi-00000009ZYa-1ZtD;
	Tue, 02 Apr 2024 03:28:08 +0000
Received: from pb-smtp20.pobox.com ([173.228.157.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrUod-00000009ZPn-0aLe
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Apr 2024 03:28:05 +0000
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
	by pb-smtp20.pobox.com (Postfix) with ESMTP id 929B325040;
	Mon,  1 Apr 2024 23:27:50 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=Y6jvOzEouXNWKuWy3ccTjj476XMGHanXU+3TO3ClnKg=; b=Yc05
	Gq9Q4s+S4T8ijXt4ByAH2vn0T9sWQinjDx0KDB9iZ4yaLIRz0Yr4mArCGoVdw4N5
	PqVrlHe5jv1igraG7vjHtF5P7Zf6d1Pw6VPGy1vKz8JxIKah24EpD/RTf0xoi7nM
	+8RVPPFT//es9w6lDVvHqctpGs685cgHzHgr+78=
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
	by pb-smtp20.pobox.com (Postfix) with ESMTP id 8AD122503F;
	Mon,  1 Apr 2024 23:27:50 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=from:to:cc:subject:date:message-id:mime-version:content-transfer-encoding;
 s=2016-12.pbsmtp; bh=Y6jvOzEouXNWKuWy3ccTjj476XMGHanXU+3TO3ClnKg=;
 b=rGs9S7c5Q0bvvz5g4tDLqISdgaZ+uFHhu/hvls5t2MQJLlLELiUj5GWWqrZKtsW7ql3p3yOQ/MrXaBzUGuOG02YmH1LTTwPlTfdbrL8ZPv1tnh6QMIDroITGXF0JAc9FrxGAc8tqkf5xn53uNvT6nWSe84shCXRxkCivcTuK5+o=
Received: from yoda.fluxnic.net (unknown [24.201.101.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp20.pobox.com (Postfix) with ESMTPSA id 8736E2503D;
	Mon,  1 Apr 2024 23:27:46 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
Received: from xanadu.lan (OpenWrt.lan [192.168.1.1])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id 3F48BC1CEC6;
	Mon,  1 Apr 2024 23:27:44 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Nicolas Pitre <npitre@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 00/15] Mediatek thermal sensor driver support for MT8186 and MT8188
Date: Mon,  1 Apr 2024 23:25:34 -0400
Message-ID: <20240402032729.2736685-1-nico@fluxnic.net>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Pobox-Relay-ID: F974D08A-F0A0-11EE-A764-F515D2CDFF5E-78420484!pb-smtp20.pobox.com
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_202803_616874_D6CF6071 
X-CRM114-Status: GOOD (  10.92  )
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

Changes from v2:

 - use meaningful name for binding index definitions
 - reuse LVTS_COEFF_*_MT7988 on MT8186 per reviewer request
 - do similarly for MT8188 that now reuses LVTS_COEFF_*_MT8195
 - use thermal zone names the svs driver wants
 - adjust some DT node names and iospace length
 - remove variable .hw_tshut_temp as it is constant across all SOCs

Version 2 can be found here:

 https://lore.kernel.org/all/20240318212428.3843952-1-nico@fluxnic.net/

Changes from v1:

 - renamed CPU cluster thermal zones in DT
 - fixed logic to cope with empty controller slots at the beginning
 - isolated bindings to their own patches
 - added MT8188 default thermal zones

Version 1 can be found here:

 https://lore.kernel.org/all/20240111223020.3593558-1-nico@fluxnic.net/T/

diffstat:

 .../thermal/mediatek,lvts-thermal.yaml        |   6 +
 arch/arm64/boot/dts/mediatek/mt8186.dtsi      | 256 +++++++++++
 arch/arm64/boot/dts/mediatek/mt8188.dtsi      | 383 ++++++++++++++++
 drivers/thermal/mediatek/lvts_thermal.c       | 434 +++++++++++++-----
 .../thermal/mediatek,lvts-thermal.h           |  26 ++
 5 files changed, 987 insertions(+), 118 deletions(-)

