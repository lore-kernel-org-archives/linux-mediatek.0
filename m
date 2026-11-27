Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC2C606A31C
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 17:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rA7m8gJP;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=S2RtunyL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9d/Wi5+niKKQp3umNIsJBpc53BekU1YR9TZcw4SOdF8=; b=rA7m8gJPWqCwvb
	uw60z3vE7RskQEimxe9YRdDXMLWkkEnPzaRH2oCgE6v10JDyRGoCO2Sc9Bk19O9AU2VZInAbyb8s2
	4kpVeUQywsl1javrs12vN9iL3xow1SWISKaZbZbP0ldiw9Dgyrss4on96oP0cOisKb88d2k/jcqcq
	g3vaErLNq3yXGjs5ixNmVMdLmuuUzOyghQwLQaUK0mrMWYV36A5TCLOLUWel5RtugJ8IfLroH5oh0
	GEAwqwl1n+rsnidbBUu6RZ5J2PK/eQ7ST8JzkuaL3IfOGGHCC9EvPW5Sya+JTjdeHZr8tI7LwBDMc
	H5Zd+bWRo7XIErxM+ztw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0By-0000000HL9N-0xLD;
	Fri, 27 Nov 2026 17:57:02 +0000
Received: from mail-24417.protonmail.ch ([109.224.244.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0Bu-0000000HL8W-3LYk
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Nov 2026 17:57:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795802211; x=1796061411;
	bh=9d/Wi5+niKKQp3umNIsJBpc53BekU1YR9TZcw4SOdF8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=S2RtunyLpG7AW2lM24pI/U7rKd6i69buF+keQMLZs0G8NLrzeYl5j8V6vBXvfB08Q
	 GQkR8M3KrYLf06dyBxdeFKGBk0ce4/yIFlQ/PcaTMeFDdMnptOFxh3Ti8Xxdet6eVH
	 T+3lQjCYH/g3A/UMhHgpXKuOhrXnhM38G2GuccDP856QDBO6JlJNkuWH5VXPb/ZOUk
	 mqtHtCTjQjQetKQvwHw1pcEg2gaNhpDyE9TrlAOExdufHNKKXQeS4tU+mxm1/RnQbV
	 PzGh+nV9trw1fhTxYvZLiLDGcVnv4dgD7WuT1PPuTGYTqmlrDSE7LUsaa+cejHscG0
	 00KLmzD3+VgGw==
Date: Fri, 27 Nov 2026 17:56:47 +0000
To: iasnezhkov@gmail.com
From: Roman Vivchar <rva333@protonmail.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, amergnat@baylibre.com, me@adomerle.pw, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: soc: mediatek: pwrap: Add compatible for MT6789
Message-ID: <GE3qRi7GaGOm4q3DQ5CGxw5EBsl7PZAaMFuN0ZZ0deeH8ibregEYkJBSZjrh9s_wO7n-eNViVRUkNI4B-dEtUWtgtAprhKViuPTy4t2oj2s=@protonmail.com>
In-Reply-To: <20261127030009.10572-2-iasnezhkov@gmail.com>
References: <20261127030009.10572-1-iasnezhkov@gmail.com> <20261127030009.10572-2-iasnezhkov@gmail.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 76cd1cefd60693b41ceda656ca77dd37e48de0da
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_095658_988922_A4666CEA 
X-CRM114-Status: UNSURE (   5.12  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Friday, November 27th, 2026 at 5:00 AM, Ilia Snezhkov via B4 Relay <devn=
ull+iasnezhkov.gmail.com@kernel.org> wrote:

> From: Arseniy Velikanov <me@adomerle.pw>
>=20
> Add a compatible for the PMIC Wrapper found on the MT6789 SoC.
>=20
> Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
> ---

Reviewed-by: Roman Vivchar <rva333@protonmail.com>

Best regards,
Roman

