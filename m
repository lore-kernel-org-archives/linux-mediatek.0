Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6D5606A8AF
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 09:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wufRtOzT;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HqBtOb+f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sQnkF5f7J5gjzIigPcwvePLDA2RiyWZPn2x/OhMR34g=; b=wufRtOzTQ/ng6qtUkIYNJtIl0J
	i4R9kgKdvgjE5aZtW9lnc618SEeBjhK/qLbPpM7m69YaxyVa5W7sKj7nzqP07lxo+ufTzvKVqNyMt
	Ev2P0pO75u98m9pxhww1xmGjmGDobex/iPib9ShZcFaw+7FhD71T2RxSQEY7Z4jLUtpkE6U1dqZtG
	ysIHL/48App8r257BrJVb5Ju+ysJ5un/LYHHsCArxo4fnJspMlUxFJatN4ZdBKtY9Pb0+7wPgpgnm
	vS/F+yOBt3DXFqO46SS0JaTVL7Ye6B7Z390SEUmUdFNtYeHD0cgvuRhG4bTuhWLJxr/F9ROiNrami
	oX7CKXaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFE5-000000051vv-3KIj;
	Tue, 17 Nov 2026 09:11:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFE3-000000051sd-2efj;
	Tue, 17 Nov 2026 09:11:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 649DC468F2;
	Tue, 17 Nov 2026 09:11:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794906699;
	b=OMh5ilukyezPuxzyok3rCv17xArYJdG4LoFbNwmKOElf6WGkl7gFT86RM4X/5pOEEawo
	 vnC1l5Q2xOAFv3rApNrUWkWoCm2/HyqI3av3FuwyO4PPkIhpsJ/jDYvW/UxSF07lRDtqt
	 7sc14wcPCMxuiWnSyZsJJMamELPwTNTouleMhpAN6jSBukk9huWJnFBQfC4ZdWWyM7Li+
	 Q9iP+GqjKNDczsowSwOZg9zFy7mVpQHJkv/b62Nn0RRryaQ5JyMUSBniSmDrTvLbIRyyI
	 /8cvUfofgJdulIrfRwZiqtKL0k1eDs0dGFMjBtEF/I/q4AfYSUPDJXnhcwNfgANUF8w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794906699;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=sQnkF5f7J5gjzIigPcwvePLDA2RiyWZPn2x/OhMR34g=;
	b=tii5P3rZ2JaCVrUVLWafRMCauI3KJE5F+N6v9ANd60SLP0km7O2n23iJ8EXcltGP2fcR
	 dIiL9b+KQzRnBg47x2+FhN4X7n6CfQZcJQF7dAq1FRViHhwj9iWAkpWSUa8nWlt+/NwjQ
	 /DSEPTEiUJAeV9n/dXuvtAaOP19vV9awTwpf7OQN3z3uFYN/HLjIVTYcwMOVqaFTsyyUC
	 Xl9gtuSy77mszbe2lTNWkXjPGtFolw99teDjkfLZezB8loFWbbgeG5urV53Aj5nqsdpQS
	 ewgCFxdR7hIHgchWEB6ItWux3Yuf2bamMObanIyV6ZvGNE5JlTjiue/7XaAiDzyAMLg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C17F31F000CA;
	Tue, 17 Nov 2026 09:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794906699;
	bh=sQnkF5f7J5gjzIigPcwvePLDA2RiyWZPn2x/OhMR34g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=HqBtOb+f7+zk/sCku6p5lGrGlTJMvWjSILPJYthaRkZCE+kby9CmmVsfbjPLxI89g
	 Cl5ToKVnRQj75AVPZsUqodNQHzZn4NFU9MOCs+8sUkq6yLekTzP/In/gd0Mpty9iX6
	 BfaHLbXBTUIiDHSVbMCzTAHpcL41QMVnA3eGz2vk2dB4Gkvo0HO2jjBdNJ4Eib9Ibs
	 MJjT6LigUIBPlbdh7haWxTvfsuHdaiWnMLaGK9NgKRjCgx4YYe9qtMCnwUNIIgtk1s
	 8pAPab/uwaG+hmaT1GdDK531YDLnQ+rlU8J3P6TdHN/vfdeuZc0kpAG+DN/o81NXLh
	 rAOmYNX70VaPA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 473B54A777;
	Tue, 17 Nov 2026 09:11:37 +0000 (UTC)
From: Rui Cao via B4 Relay <devnull+i.udp0.com@kernel.org>
Date: Tue, 17 Nov 2026 17:11:32 +0800
Subject: [PATCH v2 2/5] dt-bindings: watchdog: mediatek,mtk-wdt: Add MT6833
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261117-mt6833-base-v2-2-058a0685c40c@udp0.com>
References: <20261117-mt6833-base-v2-0-058a0685c40c@udp0.com>
In-Reply-To: <20261117-mt6833-base-v2-0-058a0685c40c@udp0.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, linux-serial@vger.kernel.org, 
 phone-devel@vger.kernel.org, Roman Vivchar <rva333@protonmail.com>, 
 Rui Cao <i@udp0.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794906695; l=1098;
 i=i@udp0.com; s=20261107; h=from:subject:message-id;
 bh=jjCiaVOOht+RI3oDkxUaR1YbdSwCNgqgxnVxINfl9q8=;
 b=9g9D2itu8LsARvIWD5fHnn7cKiJ5isx3uDconLIYrEz7YNX9M/UaO365a15DHPzjWzin6dTNu
 DZmZImgXlCpAcN2Vn/scwDnZx8pOnzCjHOIz8kc7gqYD/GgVyArpBpA
X-Developer-Key: i=i@udp0.com; a=ed25519;
 pk=XZJKcKgnUUjjyw8KuKy7u2QeIX0JLY/L1Fxzwwje41w=
X-Endpoint-Received: by B4 Relay for i@udp0.com/20261107 with auth_id=1443
X-Original-From: Rui Cao <i@udp0.com>
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
Reply-To: i@udp0.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Rui Cao <i@udp0.com>

Add MediaTek's MT6833 (Dimensity 700) as a compatible of its own.

It can't fall back to mediatek,mt6589-wdt, which also describes
MT6589's twelve TOPRGU reset lines: MediaTek's kernel for MT6833 resets
the connectivity CPU through bit 12 of WDT_SWSYSRST, past them, and has
no full reset table for the SoC to take one from.

Signed-off-by: Rui Cao <i@udp0.com>
---
 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index f9b725592c2..5742cc09a74 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -24,6 +24,7 @@ properties:
           - mediatek,mt6589-wdt
           - mediatek,mt6735-wdt
           - mediatek,mt6795-wdt
+          - mediatek,mt6833-wdt
           - mediatek,mt7986-wdt
           - mediatek,mt7988-wdt
           - mediatek,mt8167-wdt

-- 
Git-157)



