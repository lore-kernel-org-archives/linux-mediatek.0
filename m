Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668E9606FF54
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2026 19:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=blDans+3;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KFORJDXR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iAbjlXus0iw2LllxqZoryy58tCqmnnXTzlAaD4u02/I=; b=blDans+3SWe2kPyTpVqJsglIwK
	zEDG/jdaIvGuoRPIRzu2d4Fwsho3rWKbndZEP0OdqreMTg2FZl/HRJgHNeTauBJcHllwZ8TduQ/VW
	wzojDkea6PYd57GWXT1U8P2hgS8c//sh2iPOEBndHjnzXc30NAJWV84yr9F8rQNh5MmKifxj0Gupf
	JT1RXbf09ZekjreEi9xcY2eZ0/mUSOkwEveY1QmzkuTxgVpv4gug1CH7gn4GX7RPmuNescckZxPsv
	5PUPacp9GTRRQDTdTIP2qAdVPW0Rf4ZM+g7g+gQViXCplsK+YDf/O96z0XLQhC5Gr3ZVmLYRtCRrk
	gQQ3EY/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTlN8-0000000A6nq-0Kpa;
	Wed, 18 Nov 2026 19:31:10 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTlN4-0000000A6mR-2IUQ
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Nov 2026 19:31:08 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c511cdd5a82so115807366b.3
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Nov 2026 11:31:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795030264; cv=none;
        d=google.com; s=arc-20260327;
        b=Xs4+nDuAgwitTt3Drx7oCrc0sML7+EZXe8WkDUGl+1pAOZP35osd4L3E9mm+rG5tgD
         TyRQ33RVrB+mBljNhSMHCVRg97Mpfv1qnhH4drSCLU3VwBx+C+7w+H3qWNKfSypnLd4l
         638BjFWKALEvd2sMvmETfjEtGZZoKYvSwNTp2y4Idzqxgz9wfvxbQaBg6lcoJ968+MB0
         lTnfNgmkbQsuZGGKGlpzUgFajTUIkq8pEnLiZNchMLl2bsR6MWvg8G6o6ELOTdfxMGBs
         f1YAn+EB2n4Ov4ly6/nTHK5NnBtkFScc/ab9F1LTaoy5PezMBHSAGHyo785H968Ns8WA
         N7Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iAbjlXus0iw2LllxqZoryy58tCqmnnXTzlAaD4u02/I=;
        fh=dHdFPVc4z8nsw5DaF1jIpi+tzr5CB2bMEWdwbcAp05o=;
        b=sgf0eCa8vioMYi60LO63LZ7oy2oSEvDW0RIf0KNuAEPBfx2PNKkIL938Ejg7zTeDSZ
         FzbX9/EVQ2lqH4koSsr/ock8o1JmSO46H4qv+uyz1zmm3CKdBM/XVbeEuuQrMVp9pjiD
         koPlHdN7emnXip9Ai911vj6U4gI4HKRMQxfYnDnmU+9+0dxUUOjzpCo/3f163d/ZH0L5
         gbHF8FKV7rQYoE30a+dExGl1KKdGi74Gs8lq3uQgSdrKJZhtJVCRU0lI+BWZJkyEy0Cy
         DkwyZBAEA6i0GgOcEZ9aQRo6ETjw7UA51pS+bH9KALJ38vqxwZS9RIOfVGSvPsAJSoxK
         tFGw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795030264; x=1795635064; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iAbjlXus0iw2LllxqZoryy58tCqmnnXTzlAaD4u02/I=;
        b=KFORJDXR0tTk5KVgNDJhdCtuAgVz0rLNYE+jng1gmE4Y0jRUv69jgdCTjFELfQfeM+
         8uKgygon64V4PDwFSAFiCMyrGk7uHrSTl+ZTxua/mY18dqqXgMOAUGLv3zi+HOxt/qwo
         CiW9mJvIeFfcYz2uf/SWpy9nO8umxkbVU3PPxyXAb31axBDO57ktFk4P3Qa62W45wdu7
         cz73KI4vF1CccipgC6op1rxRCzKthO2W1/2NWwxNXFKvRUie4hSlvYii6+hoKLMNJH75
         epOmjqkJ44tdk45V6L2YICnFI+62cSpj4B7PzPDQ4r/4UjONdG6AxXqBl2ru1NKWQ5NJ
         6p3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795030264; x=1795635064;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iAbjlXus0iw2LllxqZoryy58tCqmnnXTzlAaD4u02/I=;
        b=srlTEcN3p89q0oQnRjLWWCp5kF/bO4ffiR3ZHlRh4ygqF/4u8wlPza+0YpkW/Cw47W
         tUai3UGXui1u3U8zwf39hb+emVtgLqBjL1bSbUKmkEYxaFY37pFvEyqjxT2E2uZK3wzw
         mQJfPKDORHrsaRUkJAx1J66Ue68iMJTpYgQ2CFvzjZk+AJL/hsHfUnN8qpGgdEzrvueo
         iN7254m2ZsAbM/QMoHsX7ffkIzh5wo64HJmzYyO7Uf2AuxBymLXIk73l7mtEooA2xYzN
         6SS0MCg5bIMRNgRthkS1qEbuCNdbSxxnRBSRMy3/kpA4FkRBw51ENnLizvV1+Eskm8wp
         m+hQ==
X-Gm-Message-State: APuU4Z84hV29q7msQ60AtKmfV550YKJub8GcObycwmMJDmlRDfjwHEsz
	UGlbypJmmemoxToW9KPzHJwtjw39t3YwlHrXGHKBi2m4/AXCxcS4l3FDQjbfQHmW5BXxZxIi1K2
	WKaCNfsJ7Lr1z4nb+2D0j7FcTCy7dphA=
X-Gm-Gg: AYBFou2y6kF+8hOtblCYG6zVmNFeIr0KoXqF1EtkLaV81Emm8mBnNxdTh1OzG5pOxgi
	jbUsayegu1szC+BYD/XLn4it/1ZRfDCnK0Zibp6Mt7+m7xXbMYTtfuq8aLhgYO+B3CNiAxvCffg
	sPEyIWvKO7C/rlPYSYctXHh3GA090TdQCt1vOa5l++/LGwTu4sHqzcqazRnYbkDgBTyYJd1pYN2
	SAQb7aeKlnxF2SWOIUEKknwEPjDU0CZzb+IkHuB41QU4iORqK6kali6eeWMBv7NLTtaFuvAbGG1
	ArbEMCMwyM/OBc0kPYz0ST51ZGU8BT8yCBLUE8+GDnsuG0nDjeCqmyb8C1xU+O2jo+24ojT6dXh
	Q29SSqRRLJrzzIQq6yxK/nO+1XXN24+hq3b0=
X-Received: by 2002:a17:907:f816:b0:c2e:317e:d711 with SMTP id
 a640c23a62f3a-c510e398889mr303013866b.27.1795030263845; Wed, 18 Nov 2026
 11:31:03 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105194426.1113050-1-l.scorcia@gmail.com> <20261118152346.GC98456@joneslee-macbookpro.roam.internal>
In-Reply-To: <20261118152346.GC98456@joneslee-macbookpro.roam.internal>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 18 Nov 2026 20:30:52 +0100
X-Gm-Features: AclHuK-Q_ZR_eSDZWgs8r4i-RTkFZUMV5FI3ZV4LgWAQGQjLtUrjcLbEIObtllI
Message-ID: <CAORyz2+7q3BTeW3NsaiwN9riAbHV0Q_tCm6bBV7RoiDeAbcLrg@mail.gmail.com>
Subject: Re: [PATCH v12 0/8] Add support for MT6392 PMIC
To: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, 
	Fabien Parent <parent.f@gmail.com>, Akari Tsuyukusa <akkun11.open@gmail.com>, 
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_113106_600810_BFC99CC3 
X-CRM114-Status: UNSURE (   9.75  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> MFD looks okay now.  How many more Acks do you need?
Still need the regulator Ack. Mark Brown provided an Ack for the first
version (almost a year ago) of the regulator patch [1], but it was
substantially modified in later revisions so I dropped that Ack.
I'll move Mark Brown from Cc to To tag in this email for a gentle
ping, I hope that's not against the ML etiquette.

> NB: This patch-set looks split in two in my inbox?
Now that you mention it, I see the split too. Weird, I sent it using
git send-email as always. I can resend it if it's an issue.

Thank you

[1] https://lore.kernel.org/linux-mediatek/20261105195206.3440-5-l.scorcia@gmail.com/

--
Luca Leonardo Scorcia
l.scorcia@gmail.com

