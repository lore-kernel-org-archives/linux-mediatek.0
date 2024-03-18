Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12694C54E71
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 21:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GtvZdTKnencwKn/zILnP1aAaV3EYRH94qY12tDmOvFE=; b=sPOw+ZiCBhMgH3vM3BT3Wj22uC
	kNR2lj2K0cX/EimQDJPC8R+3fDBcUr+5Ic0BlcB16OhKzeh9dR6Pr0ajnCQiokfW5KH3jKPRlw5Fg
	/xuWrrUX00KLxtsg3Sllh+LmcrePcK09Sr8mtAt92FPSSZVSZrC8iCBVb8a9g2stGVGxzEDTUaJCt
	0IuloQD/QBlusV/v2D0SLDeRkLl6Wf4ioqDJrARi20EuENeaGuW4OHYnzZWBwVkFSZqM/4REhznox
	qgar/R3kN0Jzwm29FQ/KIcBb29SDrSswnaIX5c1X5nS69EzROAKnJZl08DLdqgMBZgazh+2YOfSOT
	CjGGRUPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmKTi-0000000ACZe-2AKN;
	Mon, 18 Mar 2024 21:25:06 +0000
Received: from pb-smtp21.pobox.com ([173.228.157.53])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmKTa-0000000ACTU-1pff
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Mar 2024 21:25:01 +0000
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
	by pb-smtp21.pobox.com (Postfix) with ESMTP id 1EDDD309B3;
	Mon, 18 Mar 2024 17:24:56 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=wTzEj69iJ8UoY4X2yX7ncL39y
	AKgdIL2Ul1L8AhX++A=; b=KIQFWwgwlhzRhuFMd2wEjEXyQSFB7kZ3n52m6HjQf
	mbrK4Gr5Q4jKOCETR08IdYRoKhcAX5V2wWWK/7junuO3JJkb0JANnYU8gffNsk+g
	6BpqDewUr3FhcbKRpfIqvTB4yrxcDMudxb5kCnhoYM96BeWspuH6Y7dAta1slnYp
	ik=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
	by pb-smtp21.pobox.com (Postfix) with ESMTP id 16F5E309B2;
	Mon, 18 Mar 2024 17:24:56 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:mime-version:content-transfer-encoding; s=2016-12.pbsmtp; bh=8mS5L7XcBU/PWbB5RoWRI1Hd7hvWa++aPqY1Xp/FvFM=; b=Cbw6msFewsSEyNQa8DVIomsU9Bqhx0BZ/FcYkVXdJJu9ATm4jKHiIBK4ZFk4j6Emayv1WdkDKH00IRHTkV/Ha/XI/CYS6t0BLxro9A22SXbKEdiHcI5HrWTSvGbOLIofh1P0OAXdPHRUUHGcRQZ+aUppuvgltN6F/Cw50YywRhA=
Received: from yoda.fluxnic.net (unknown [24.201.101.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp21.pobox.com (Postfix) with ESMTPSA id EA7AF309B0;
	Mon, 18 Mar 2024 17:24:51 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
Received: from xanadu.lan (OpenWrt.lan [192.168.1.1])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id BE244BE2B9F;
	Mon, 18 Mar 2024 17:24:49 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Nicolas Pitre <npitre@baylibre.com>
Subject: [PATCH v2 01/13] thermal/drivers/mediatek/lvts_thermal: retrieve all calibration bytes
Date: Mon, 18 Mar 2024 17:22:03 -0400
Message-ID: <20240318212428.3843952-2-nico@fluxnic.net>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240318212428.3843952-1-nico@fluxnic.net>
References: <20240318212428.3843952-1-nico@fluxnic.net>
MIME-Version: 1.0
X-Pobox-Relay-ID: F501701E-E56D-11EE-94B0-A19503B9AAD1-78420484!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_142458_753466_069A1F86 
X-CRM114-Status: GOOD (  13.78  )
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

From: Nicolas Pitre <npitre@baylibre.com>

Calibration values are 24-bit wide. Those values so far appear to span
only 16 bits but let's not push our luck.

Found while looking at the original Mediatek driver code.

Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/me=
diatek/lvts_thermal.c
index 98d9c80bd4..8aa6a8675b 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -679,7 +679,7 @@ static int lvts_calibration_init(struct device *dev, =
struct lvts_ctrl *lvts_ctrl
=20
 	for (i =3D 0; i < lvts_ctrl_data->num_lvts_sensor; i++)
 		memcpy(&lvts_ctrl->calibration[i],
-		       efuse_calibration + lvts_ctrl_data->cal_offset[i], 2);
+		       efuse_calibration + lvts_ctrl_data->cal_offset[i], 3);
=20
 	return 0;
 }
--=20
2.44.0


