Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60F0C54E58
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 21:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gHlgvx6bdnSIEIymVKCIh8Vu5JsHCgbHw41pOOHS8sc=; b=2nGk79l6sX1enzSjDuEnablEsz
	SrDaZJUg+9+tQiFl1/Q9e/oplSOWBDGgzWMgIW8lrAlg3LLOhE9oaXacvjMn5drDXbD5jn+sDUSI8
	WlFFqhJXFNdjbj7awxStr4BcZsXyIrsnaw/zb9IWDt1QZyAPCG6t9MfXt3TutKxwKQe3cZ5Quq2Xd
	K26kyUQfXg/Wvo+kQwCIHphLvuXax9JIisQ0VY8WtmqJpMn78ECXFxlfx7pBQFA2bUDeLxSlI52CP
	JWv+hIWt0tRaLvtMkb2g/LAVG0L033xcCRTo1OPUawry1eu7kfWkHPyPZcnubvDHyC0tfEbDrxw0u
	x4si6ugw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmKTg-0000000ACXT-1N3V;
	Mon, 18 Mar 2024 21:25:04 +0000
Received: from pb-smtp1.pobox.com ([64.147.108.70])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmKTY-0000000ACS0-3En1
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Mar 2024 21:24:59 +0000
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
	by pb-smtp1.pobox.com (Postfix) with ESMTP id 6C3291D0E3F;
	Mon, 18 Mar 2024 17:24:51 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=Xacd7+XnI9OrgFgBfLlGlGfoJ
	qixznjjgneYEnRh1Uc=; b=TkY7QM1lDYIW8xZk0X368BEV0j6nu6Vu1rQ8Q1YiO
	vWHN+aHjVDs2Dl9I6Wke3DjUo8QYp5S5BrMKGJHy9AEELZyPcVkgE7esrQIpV8kt
	tmhulSIRUnDf5Z+cFGlB+NP4j2Do4tKX7J1Bvtr2uKwZXVF4QZdY098wtFNTh7Hz
	4o=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
	by pb-smtp1.pobox.com (Postfix) with ESMTP id 645F41D0E3E;
	Mon, 18 Mar 2024 17:24:51 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:mime-version:content-transfer-encoding; s=2016-12.pbsmtp; bh=QgfuLgg+3qCZ3BodQZfrI7b7gjmE0dfhgjr3WRZLXjs=; b=aMalsHyeCIo2UC9UviC+XFMGk4FAxWfLIMNs6m34FqzDTAEAYPTeuKfHVOk3RC1l+A5h4qqQpGYSxQWecs7fHNwwvX19Gn0baPjkjWhHV6QWg0Hgyi1Qi5qBNSU1PdVzXNxt8uo6QjhmXY2OxnqWIVG26adgDm4WEf3OmWHaiEw=
Received: from yoda.fluxnic.net (unknown [24.201.101.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp1.pobox.com (Postfix) with ESMTPSA id D4CE11D0E3D;
	Mon, 18 Mar 2024 17:24:50 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
Received: from xanadu.lan (OpenWrt.lan [192.168.1.1])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id D404ABE2BA1;
	Mon, 18 Mar 2024 17:24:49 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Nicolas Pitre <npitre@baylibre.com>
Subject: [PATCH v2 02/13] thermal/drivers/mediatek/lvts_thermal: move comment
Date: Mon, 18 Mar 2024 17:22:04 -0400
Message-ID: <20240318212428.3843952-3-nico@fluxnic.net>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240318212428.3843952-1-nico@fluxnic.net>
References: <20240318212428.3843952-1-nico@fluxnic.net>
MIME-Version: 1.0
X-Pobox-Relay-ID: F45B0AB2-E56D-11EE-93E5-78DCEB2EC81B-78420484!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_142457_038636_E32624FD 
X-CRM114-Status: GOOD (  12.30  )
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

Move efuse data interpretation inside lvts_golden_temp_init() alongside
the actual code retrieving wanted value.

Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/me=
diatek/lvts_thermal.c
index 8aa6a8675b..73ca2be0f5 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -732,11 +732,15 @@ static int lvts_calibration_read(struct device *dev=
, struct lvts_domain *lvts_td
 	return 0;
 }
=20
-static int lvts_golden_temp_init(struct device *dev, u32 *value, int tem=
p_offset)
+static int lvts_golden_temp_init(struct device *dev, u8 *calib, int temp=
_offset)
 {
 	u32 gt;
=20
-	gt =3D (*value) >> 24;
+	/*
+	 * The golden temp information is contained in the 4th byte (index =3D =
3)
+	 * of efuse data.
+	 */
+	gt =3D calib[3];
=20
 	if (gt && gt < LVTS_GOLDEN_TEMP_MAX)
 		golden_temp =3D gt;
@@ -760,11 +764,7 @@ static int lvts_ctrl_init(struct device *dev, struct=
 lvts_domain *lvts_td,
 	if (ret)
 		return ret;
=20
-	/*
-	 * The golden temp information is contained in the first chunk
-	 * of efuse data.
-	 */
-	ret =3D lvts_golden_temp_init(dev, (u32 *)lvts_td->calib, lvts_data->te=
mp_offset);
+	ret =3D lvts_golden_temp_init(dev, lvts_td->calib, lvts_data->temp_offs=
et);
 	if (ret)
 		return ret;
=20
--=20
2.44.0


