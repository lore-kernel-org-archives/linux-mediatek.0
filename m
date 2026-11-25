Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C359606A323
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 23:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lQNiZ4VT;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ftZspJUI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=DTx/h20UDlrrJsR+uyfD2CGTZInGwh7R/wLmVCKWLDs=; b=lQNiZ4VTukKCgOC8QWiF8KA8FY
	ppb5aiK1+MxXbtDjTZJmkaSLnGwmrW6TY1sAtSw4Rzgmp6SwZSg8VWGVe8RGZ3A1Qyq237DjVzxCw
	2Di2vfUufCQVJpil6Zt/stvF/qCE1gwjpjLGVJafQch8w8aAmv1ODe6evfcLNXyMKU0hGGDBZ0Xvz
	yN6N8oi46QfhWmxOv/tiLAed+/QZLdTThNoVvIstDBAPyy7IjEl0TIkBVflZuyhrnqnmakMK93kMA
	00P02YIs3DLoc2Cje4qlZXzrSi9UVgPsi8ZbFF4W24AS4NE1sAdmEZ4d7AavUg0PkP61QyzyYeKIw
	WGb0LdqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMj8-0000000BbiU-3lo4;
	Wed, 25 Nov 2026 23:48:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMj5-0000000BbhE-3KUD;
	Wed, 25 Nov 2026 23:48:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 36FFA46378;
	Wed, 25 Nov 2026 23:48:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795650514;
	b=ElA3+xkol5Gcia/2sPDk3/dvJUJzXk7x5aPf8zuSyyE2QvAMbEBI3gD1gIjxm8ybXSHg
	 wUnWLFC9LVEsNSje7N3Pmef2cjBh/7uC4C4pTPJ+r6Xu/+5l+8tZBNz0XRkjsujisQKX1
	 Bm9FoITFUittT6wBUm1FglR+LHnchDZruUQkMB/uBetKH4z2iwtRUiEXRtSJWW6Wjr0sl
	 6NBjbj8ZdcOvj+fDZm9EvlNVArGLc2nrnnFnQ0oRVtH8jk81n4JtC3n02PUbCeJgYL2vn
	 v3Hyu8IEflmosdFF8zQE7BFUNpKPLHvpaAIwH8aqaUxiax5+zQNEWQWOEOs/V6F2hnw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795650514;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=DTx/h20UDlrrJsR+uyfD2CGTZInGwh7R/wLmVCKWLDs=;
	b=3HUUd+mO0S9B8+z1AMvrLMCE6QiO2aSYdzvMPzwR8Em6Savvza6WE4rymEzwUXzIsDko
	 TCsRvl20yMFB/Pb7d9uRmFXs5QklkamLjL3PkPm3+502V0xziDMR7fiT197XLAEtJrT0k
	 b10sV+C59ZzlV8zR2D9EJUKLkBAU/4dEx9f78SvB0gTZDDFt+bAvCKNKNf30MbpuMugHG
	 bzowdjK+YSyMfCAeqq4aR0Q0+jweCn7F2esPIq/VgceF+KKBL9aRenAkUxCrGwVg4rQVj
	 kfWS/P6RmKTLmKZyi4hJTcU4OJurat8NrHLJAXOB/gcRMju4kZcSva3YalsUR2JjgoA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EF2771F000CA;
	Wed, 25 Nov 2026 23:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795650514;
	bh=DTx/h20UDlrrJsR+uyfD2CGTZInGwh7R/wLmVCKWLDs=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=ftZspJUIKCIpxCKKWmsnJGVmXzTA21RX3hiFMsiQDQfpPhl7mXu78bOjT/wkBWyqh
	 ZSjZbdI21SJXli7rcrF631LhQg/EDaa2nHttlVXoagz70GeCAliHA+6CQsSE0GzWbF
	 R1D3+Rq18Pi/nS0pJFTncpsmU0EXph6G/UylzjkKTbL01bh+ejzfnHf8yjnhFmyRwA
	 P7EicbsAbpsk1M7tyQEYeEOu38UXSVzCKVa3A0rBvGdBJYIOq4Lq/NGZuFnAWKvMWC
	 EkxSxaweQJgPf8FXYqG0JMvTE0qehucB+iG/21MLw59NRskt+TwPt2Vo0G52GVTjVa
	 SBnKdljAK3New==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7B56E4D0B6;
	Wed, 25 Nov 2026 23:48:23 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] regulator: mt6358: fix MT6366 VDRAM2 vosel_mask
Date: Wed, 25 Nov 2026 23:48:22 +0000
Message-Id: <20261125234822.94684-1-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795650502; l=1559;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=NR5lTAGqEZZZ+e0evyu7yj4VBUXqt2FNsTxclnP6kJ8=;
 b=U30rDd2xT5dzziJ5z1nFS+q2oq2JPjQNp/vgG3PCxQ8HRFoChmiCTmCUY5fbDqPXvN9a1EY65
 vOV0au3HUU4ArN+3oNOWH3Xs7QsTAftTpHXQWWemy0OL/6BJ8GVJStW
X-Developer-Key: i=iasnezhkov@gmail.com; a=ed25519;
 pk=hQgXfiWi4ukk2jh4BHu1vRVhg9BUivo//AFp50AKMag=
X-Endpoint-Received: by B4 Relay for iasnezhkov@gmail.com/mindone2026 with
 auth_id=1643
X-Original-From: Ilia Snezhkov <iasnezhkov@gmail.com>
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ilia Snezhkov <iasnezhkov@gmail.com>

mt6366_regulators[] declares VDRAM2 with vosel_mask = 0x10 (a single
bit, bit 4) on MT6358_LDO_VDRAM2_ELR0, even though vdram2_selectors[]
uses values { 0, 12 } (0x0 and 0xc) which live in bits 3:0.

MT6358 in the same file (mt6358_regulators[]) and MediaTek's downstream
MT6358/MT6366 regulator driver both use vosel_mask = 0xf on
MT6358_LDO_VDRAM2_ELR0.

Change MT6366 VDRAM2 vosel_mask from 0x10 to 0xf.

Found and drafted with an AI coding assistant while auditing MT6366.

Fixes: f0e3c6261af1 ("regulator: mt6366: Add support for MT6366 regulator")
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
 drivers/regulator/mt6358-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6358-regulator.c
index d6a0ec4..1d62c25 100644
--- a/drivers/regulator/mt6358-regulator.c
+++ b/drivers/regulator/mt6358-regulator.c
@@ -604,7 +604,7 @@ static const struct mt6358_regulator_info mt6366_regulators[] = {
 	MT6366_REG_FIXED("vrf18", VRF18, "vs1-ldo1", MT6358_LDO_VRF18_CON0, 0, 1800000),
 	MT6366_REG_FIXED("vaud28", VAUD28, "vsys-ldo1", MT6358_LDO_VAUD28_CON0, 0, 2800000),
 	MT6366_LDO("vdram2", VDRAM2, vdram2, "vs2-ldo1",
-		   MT6358_LDO_VDRAM2_CON0, 0, MT6358_LDO_VDRAM2_ELR0, 0x10),
+		   MT6358_LDO_VDRAM2_CON0, 0, MT6358_LDO_VDRAM2_ELR0, 0xf),
 	MT6366_LDO("vsim1", VSIM1, vsim, "vsys-ldo1",
 		   MT6358_LDO_VSIM1_CON0, 0, MT6358_VSIM1_ANA_CON0, 0xf00),
 	MT6366_LDO("vibr", VIBR, vibr, "vsys-ldo3",
-- 
2.54.0 (Apple Git-157)




