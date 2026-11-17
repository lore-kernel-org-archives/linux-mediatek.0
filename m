Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66141606A32F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 14:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JnYKAAbV;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=EsYBJW2S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=knN5k0t0huH/W+V1r2YAeIUG7lCZ9Z1adCqmN3gGZ2k=; b=JnYKAAbVTfIy1e
	oV//QjzLGS4RmHiY4fXcaiHAHGTYTs9iFAI4dVuMethITl58GHpdKDBA8sEQzW1/FvnMI/aYted7X
	H6zx/wv2cqTs4rZ3Im2pwyKmvfNHo1gd+MmBjYVl3BDGFzHUp9N9XPCfQZK4mqwnp7p0crBJ45irc
	t4TNViJJvogHZaxEzgVXMw7f3TBXJEK9mIXVFblAIq3w44mONy7pykOYzuy5zli+PXRK2pbIOLrrK
	qmw99IfStK6fPjs9iZI0dgmoj/dHFZx/mHZS52XCArKnLYlOLWMmXAjEOQlOgqbcW/FfPAb3AYzX2
	AyCNm5R5NjpF2HAqsjKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKPk-00000006By5-0IuR;
	Tue, 17 Nov 2026 14:44:04 +0000
Received: from mail-244123.protonmail.ch ([109.224.244.123])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKPg-00000006BwL-0BiF
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Nov 2026 14:44:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1794926637; x=1795185837;
	bh=knN5k0t0huH/W+V1r2YAeIUG7lCZ9Z1adCqmN3gGZ2k=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=EsYBJW2Sm88Zu8IFWMCs2bL/W3yNkKIOw2po0Nudr2gzfOVV6uoABjReHAVp+tiGz
	 A/4INdb4KObGgD20HjThCTZX4dtcVXOaitixhmpIhLtAKWiZsu5B81R5AeqegkU1gs
	 bQqr6MBqjCnlpDixvy+T6IkXUABPspwRI7HJ8/LYldm/kJc8DsWQLm6kBXoiPHT9xJ
	 8yASBuFGP6JZpk6IeIZ5Hj/tMeAO6LT2gkxrtiTyoevca3THUu5PAqQ8++TQdCWADN
	 mBI6B1etcEvNCwnACDv8CHaU4eZR7UOshIqSE8lGQfe6HNV2DiMwJd/fxvZdfA6y7C
	 h8B8onFMwGjZw==
Date: Tue, 17 Nov 2026 14:43:52 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Srinivas Kandagatla <srini@kernel.org>, Andy Shevchenko <andy@kernel.org>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH v5 3/3] ARM: dts: mediatek: mt6323: add EFUSE support
Message-ID: <hfElNICOLYWph6ayG04s_yQbkHLXmu6qzdWeR5ObRNxVsBtq86bjnERSJx427OwwrZYipLAOrUGBU8zvYtXEV1ixQ3YBzAZYQ3ypouA66T8=@protonmail.com>
In-Reply-To: <20260921-mt6323-nvmem-v5-3-2f5d308369f0@protonmail.com>
References: <20260921-mt6323-nvmem-v5-0-2f5d308369f0@protonmail.com> <20260921-mt6323-nvmem-v5-3-2f5d308369f0@protonmail.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: d6eab4eb4da4fb8cc3577e6a0760d480392e243a
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_064401_079224_1509ABD2 
X-CRM114-Status: UNSURE (   5.26  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.5 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Angelo,

Could you please take a look at this patch when you have some free time?
All other patches were applied by mfd and nvmem maintainers. This patch
will be required for enabling thermal on the mt6323 PMIC.

Thanks,
Roman

