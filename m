Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA4E606A335
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 09:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fpG30bhV;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Nfj9yFHs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uhSDJq8Wyhd+N3+fjmtrEANcukfKqwNL8O8VlAwpkNQ=; b=fpG30bhVS1yjNYatDLHVg6mzif
	7WhLkiyxH/E6bRJNP9REbhIg31xRgzg2iegHzsh6XAH+VrtVOEx8Ak/7QawH+aCdc+jbQRHnOmd+1
	UtTsIrRZGrdY2kmABrsMY2MJdHWWhkInosHRj7bsS6fFXNyYqZ7yVQMiP3l9iTpi0+Tx6zMd1diwK
	ejmYilMahdUTv5IKOAaNCpaTR9/YgpjX6Pl0VgkJVaMBcwihleHnXoiorNJ1YSjAraG+nbqSCA6Wv
	rrTO9zDlg3vbrxjAieB2hEkHWtTNYr0JJ/MFa6jOHlLJEOuOV/qqo8GqkraSV/TeXLMDDcdFsgq9K
	aY518faw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStTc-00000001rgu-2Ol8;
	Mon, 16 Nov 2026 09:58:16 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStTZ-00000001rfm-31N6;
	Mon, 16 Nov 2026 09:58:15 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id D7F6820067C;
	Mon, 16 Nov 2026 10:58:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794823091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uhSDJq8Wyhd+N3+fjmtrEANcukfKqwNL8O8VlAwpkNQ=;
	b=Nfj9yFHsKUQv4cHudGDJEL+q3z8JZRRr9ANqmBM7EW/79T7CxGm8Drh0XCJJI/wa1hmohw
	T3+rSTCXWTF8YvPo2yLIDRo5/TqDZ4N0KFPGXhb/bv3xIhw+I450FTf8xCgCI4bEL9H5sO
	WmPZGGbYyUp/K+lolD4ZY9YgeQfBTYDjCYvDyF/jbF769GjzwT0mXVglmup/olPnDvqeGd
	QygsLgOKBdgyo3IgmUUiXvLj3js2zj1kcM4QS/pCTSFhlGBMFpuMHTHrbp+u13s0/eoN6P
	PrxF2za+Xv791qmU2cHnlLUz8rTUfcw2s6jW0uKEvshgIKyAcBZBh6Z06VrXgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794823091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uhSDJq8Wyhd+N3+fjmtrEANcukfKqwNL8O8VlAwpkNQ=;
	b=QozebcUAt/4IMf/YCQjsdk73VG3/GsHIei8rxaKdBJbS5aXwv3vuF9xisKEIqD0pIX7eEb
	NuinsMemnUuEL3xZQg6ujIIhHRLeJvrw8P24UNnGEAqk5ogdhvfzGiu0V6bcLN1Z9FD2BG
	bw0fbTkzYJ5rqsIW6rySLYk8albeiTgry8Pcw+LXH5mXNOGJNDJwmDiKRpR8IlKuv2PJ+i
	vt5Hf/gaGioWpDAUNKMe7pG64YrVyJEuN3a808o41wjNot/G+uSQV5tDfavEvaRPhRAM2F
	ijq20Q8vmFg+iX4t2OC4geVbf7Eo6KyJmYg7ue1iKgNCSxvmRo39z1aOGS4Uqg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794823091; a=rsa-sha256;
	cv=none;
	b=fIC3DWTY5n+ooj0zrJfsLtukqPmNMEUK+BVrmHdsPJlrOPWL0TZzUH14N6iawtAiw8+IhP
	3Oo7/nSvu+rDv8CC4ui3xYAxuIoxOU7+YCf/I49smR4mR1y8dXwNmw6JACMVx/gqJ4sOYg
	X27YskizZJANXVpMuXiKePA3ghDRzhdfGe/lmj8Xughb+eGVybR6eDtygiLdCL8OOzhO2k
	DGfEvX9+B2oR0/EoTp9vxpTsgby0rPXOOzTL97CGVjEPS8foZwMyQzcF6hfefX7xhkA9lj
	nt2+Bkdvwbp8Ckrd14Oa14LsvaVcMmYy0t5mUbW2jV7SBq8lVlqOxFOtZhkrKQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <5ea675380093047ea19951a31005e3c1e5ca0e04.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/3] i2c: mt7621: assert and deassert the reset line
From: Philipp Zabel <p.zabel@pengutronix.de>
To: John Crispin <john@phrozen.org>, Stefan Roese <sr@denx.de>, Andi Shyti	
 <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>, devicetree@vger.kernel.org, 
	lei.dong@airoha.com, Linqi.zhang@airoha.com, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Rajeev.kumar@airoha.com, upstream@airoha.com, Weifeng.xu@airoha.com, 
	zhengping.zhang@airoha.com
Date: Mon, 16 Nov 2026 10:58:11 +0100
In-Reply-To: <20261112185820.1315718-2-john@phrozen.org>
References: <20261112185820.1315718-1-john@phrozen.org>
	 <20261112185820.1315718-2-john@phrozen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_015813_914593_8F8AD1E0 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Do, 2026-11-12 at 19:58 +0100, John Crispin wrote:
> The driver resets the controller with device_reset(), which needs a
> .reset operation in the reset controller. The EN7581 reset controller
> implements assert and deassert only, so there every call fails, logs
> "I2C reset failed!" and leaves the controller as it is, also after a
> transfer timeout.
>=20
> Get the optional reset line at probe and assert and deassert it. The
> MT7621 and MT7628 reset controller does the same in its .reset
> operation, with no delay in between, so nothing changes there. A board
> without a reset line no longer logs an error, and a reset controller
> that is not ready yet defers the probe.
>=20
> Suggested-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: John Crispin <john@phrozen.org>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

