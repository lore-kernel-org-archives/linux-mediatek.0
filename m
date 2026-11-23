Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CFD606A334
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 21:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b3uqKDNm;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=orDdMu2m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=QrK/e8807Ewdq+6pUMzulpVevOURCk+S/Oy2ZS+wBgo=; b=b3uqKDNm/tzmIYDHZUmQg9yPNX
	lCUEmnERZzk561qCDnYPYyDwYMzkAuzkTkALhaIW1hZoMHuQ2vmN86hU9X3+fEzHks+vJcUUzQIjU
	oM8IqMvMBFYfuQrtbF2UxjgQ1dzuwthbZ5CtmSaFOukpIS3pK2JpNmQZW94G2l/VCAmHAFlitwzSa
	00lTGnA5+TbSfkxqTX8qXLLySiMzIrbIEebuqgwphBxqzv47fGD9cNHj/iEwdrXwYLHtOgFG+NHf9
	0F+FoZtstZTup+RLPwAgHzAruZTluJy6gJLg6NH3mu3cdHXt6XPZ0hSVPho1ef3infOBaYieKRX+Q
	8JlVsRBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVbDu-00000004vN4-229C;
	Mon, 23 Nov 2026 21:05:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVbDs-00000004vMn-3VWY;
	Mon, 23 Nov 2026 21:05:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B47140B8B;
	Mon, 23 Nov 2026 21:05:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795467911;
	b=Q1rFykw1pslvWb5bP+w60DMTaTvwwS3WjgHtbK7YKI+Rpg6QA1XUDWXu9cEES/Z4yPZ1
	 A9tTK00HynjiCjsLdKTMdyK4bYY+em0NCTqrPKzpkbcZiuFJeatWsLmbQAS2K/DXs93a5
	 Zcm23qwbrQHQMcrh3zpuIB5aVe5mdoFNf5gWF4mI83xigJ1STPlSkdl3k+qtfon/b6r4E
	 cfqXp39GXhbHlLxP6ScdiLqZNOWOEJsDC+beThsXhHi1sk85cYqD5qAv3hR28gman8Rtu
	 /v06fvYNcsoCmDKTjcfag70CluuwSvKIZayCLEGjcpAJkgSkZK0fjuCZCd8CjUy/IfA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795467911;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=QrK/e8807Ewdq+6pUMzulpVevOURCk+S/Oy2ZS+wBgo=;
	b=QtEiClQLHOdOM7Sc7B3yGOx8HHl38IFMW7JzXIXSzbvaOMnZ+cTJ/R53O04ZQRznEIyZ
	 NmQt04gtLE/eWw3I/yssb3vLS258Xh2VfTcP5pMIDFNOKiaBZECtpcg0ykSO+EQtZW6Cm
	 3cKXvu0OkRMtjoVDWMDXTSxI2NXS3cOPog5j0q/EzQnUt4HOHP6l3qIoKpP2eHtBq29//
	 zosvFSMuw28udiySJD1y5oewaNswdzmuTfM0Ev+hEoaF7F/vmaP+CDiGGwqGYC3pL2dNk
	 NlZeU3w+GbhwteC5UENuYFlwfRD2sbGmqkKEQYKJ1Zrmx5/oKA0dZGK/XoFx+lIChzg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 780E41F000C4;
	Mon, 23 Nov 2026 21:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795467911;
	bh=QrK/e8807Ewdq+6pUMzulpVevOURCk+S/Oy2ZS+wBgo=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=orDdMu2mJg0OU3CQ+khT8kfl4JBMYP7kamD09elhhE39mw0lqV36LJXHwr7vs4Zb9
	 FgTdKnzIxsB6coGYx3jZ+5zsNAEnfhUyf6vRVdNk5xA+4NjXoKCu+OiO8LdBflS+8u
	 aKMOqAofRtC6DfC3oK1nZ5Pdcr1ttyNna1xLxiQuIosEDBgN6gu8G2iEaw8EEAY+2x
	 gqWlZPoMoCsK+KT7eqHz41btqRPXLpLAYl3Fy83No3eBBqqB6yAkdbtJsWmoiJNG6Z
	 0gVk76ZtKTqQJov5ZIiBHAJJBB9NMaJA71iY/80811UmYIiNYSLd9ZjssTI5P8YGf+
	 GT099E7O4d0ZA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CC9844C746;
	Mon, 23 Nov 2026 21:05:06 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Subject: [PATCH v6 0/4] nvmem: mtk-efuse: mt6572 support
Date: Mon, 23 Nov 2026 23:02:30 +0200
Message-Id: <20261123-6572-nvmem-v6-0-7ba710b15657@protonmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23QwU7EIBAG4FfZcBbDAAPFk+9hPFA6uhhbNlCJZ
 tN3l64xtrHHP5nvn8xcWaEcqbCH05VlqrHENLVg7k4snP30SjwOLTMppBEWBDdoJZ/qSCOn3nX
 BeqsUAmvgkuklft7Knp5/cvno3yjMa8M6cY5lTvnrtq3COvdbjNviClxwF0D15NwgrH285DSna
 fTx/T6kka3tVW681DsvmyfsBjBeOiPh0Ks/74TbedV8EEFrMGi0OvZ64yXsvF73twM0oEF0/tD
 jxqvdYys2rzo9SK88WCv++WVZvgEEct+tuwEAAA==
X-Change-ID: 20260710-6572-nvmem-eb98c7a73351
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Lala Lin <lala.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467904; l=2807;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=5HySxy3By020de7ig4lF2SH8eMQd2Jsf7zV/3T5nee8=;
 b=NZEXWzZNk0GXxwVN8CEUSgN31EYNyCpq6+T8NODY2zAIDZd8D1vjSsywu9VDk10sOpyONK9zH
 UNE5ganuUUCD1ls5ZK35lE7odFRWN2yMB/vdzcb9+oAEE1UZ1lVn5o7
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: rva333@protonmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This patch series adds MediaTek mt6572 efuse support. Unlike newer SoCs,
its efuse controller doesn't work properly with 8-bit reads, leading to
invalid data with current mtk-efuse driver implementation.

This behavior can be observed with devmem (0x10009174 and 0x10009178 are
thermal calibration cells):
~ # devmem 0x10009174 32
0x00CDD4CD
~ # devmem 0x10009178 32
0x0F76865D
~ # devmem 0x10009174 8
0xCD
~ # devmem 0x10009175 8
0x00
~ # devmem 0x10009176 8
0x00
~ # devmem 0x10009177 8
0x00
~ # devmem 0x10009178 8
0x5D
~ # devmem 0x10009179 8
0x00
~ # devmem 0x1000917a 8
0x00
~ # devmem 0x1000917b 8
0x00

Patch 1 adds dt-bindings compatible for the mt6572,
Patch 2 adds platform data option to use aligned 32-bit reads instead
of plain readb().
Patch 3 adds cpu speedbin fixup.
Patch 4 adds platform data for mt6572 SoC.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
Changes in v6:
- Rename mtk_efuse_gpu_speedbin_pp() to mtk_efuse_speedbin_pp()
- Merge CPU and GPU fixup into one branch
- Link to v5: https://patch.msgid.link/20260930-6572-nvmem-v5-0-384d2a3a1770@protonmail.com

Changes in v5:
- Add new patch for CPU speedbin post-processing
- Set uses_post_processing to true in the mt6572 platform data
- Drop r-b tag on the patch 4 due to uses_post_processing changes
- Link to v4: https://patch.msgid.link/20260921-6572-nvmem-v4-0-e9c14156559a@protonmail.com

Changes in v4:
- Pick up Angelo's tags
- Rebase onto nvmem/for-next (2eda8d2a45ca ("Merge branches 'nvmem-fixes' and 'nvmem-for-v7.4' into nvnem-for-next"))
- Link to v3: https://patch.msgid.link/20260909-6572-nvmem-v3-0-c0c441656431@protonmail.com

Changes in v3:
- Pick up Rob's r-b tag for dt-bindings
- Patch 2 and 3 unchanged, for some reason cover letter and patch 1 were
missing on the web mirror...
- Link to v2: https://patch.msgid.link/20260724-6572-nvmem-v2-0-e58d16a29621@protonmail.com

Changes in v2:
- dt-bindings: make mediatek,mt6572-efuse standalone compatible
- Driver: add 'mtk_reg_read_aligned' helper instead of modifying 'mtk_reg_read'
- Link to v1: https://patch.msgid.link/20260715-6572-nvmem-v1-0-9c13be99d077@protonmail.com

---
Roman Vivchar (4):
      dt-bindings: nvmem: mediatek: efuse: add mt6572
      nvmem: mtk-efuse: add support for 32-bit aligned reads
      nvmem: mtk-efuse: add CPU speedbin post-processing
      nvmem: mtk-efuse: add mt6572 support

 .../devicetree/bindings/nvmem/mediatek,efuse.yaml  |  5 ++-
 drivers/nvmem/mtk-efuse.c                          | 52 +++++++++++++++++++---
 2 files changed, 50 insertions(+), 7 deletions(-)
---
base-commit: 2eda8d2a45caa955a5cb1d897bf6024d22041995
change-id: 20260710-6572-nvmem-eb98c7a73351

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>



