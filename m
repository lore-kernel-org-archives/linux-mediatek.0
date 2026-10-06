Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B2FCA5FFC
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2026 11:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p7aYTQPeC1hyGc3Y0A2cCz+2IUa1ZlgF2Fp8Xves7iA=; b=i6zE9gRSvvKlvuwyhuQFPPRYei
	RhuHca+NO3ScaTbIvrmW32kzTsg6T0NMfoS/JZu3YpC+xSlFzZ1C+154HUvjcEa2GwpW40bHvWOmh
	SPEjkXtrI5/htGvSM0mXIs4YoYzS01jPP5Z30eDbKnFYr40P5bZsTVI5MQAecXyIiyx8b++CNI9i9
	qKWgYFHJ0saRNDWa9HDuSN7oNEriBNO5uNLGb1KZh/r3tgmktLhbs2kz38quSCTdSyK5Ls/pdAUB3
	bk3CUXA3NKhbLxV0QquXIQ9JJVDzkoEq7eOI33fTVD3sf/Peq17hnau6ltGDy0CLktvi/46yFc2WH
	uhBkajhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE3NC-00000000dQG-3e9I;
	Tue, 06 Oct 2026 11:30:18 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE3NA-00000000dPJ-0pq8
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Oct 2026 11:30:17 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48b0d19cf7eso445162f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Oct 2026 04:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1791286214; x=1791891014; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p7aYTQPeC1hyGc3Y0A2cCz+2IUa1ZlgF2Fp8Xves7iA=;
        b=Lrtg9AazGQY6hCxmFzRp3PavwbEotFEFmku2bsDtFwqv2apZ+RXPSg+82SoIH5JH1C
         rwusKJLkM+mssrI31C63hVidQCcKEduhoDxjYmjwqrplVsAhqhTmfHYa+PgOKoqPx7fs
         8LGSm4lbjX7z2zbDW/289CcE1NX/sD25V3U2qOvSEd9nBGg9Y8vGKlKvecAMTGJ2YdF0
         ao/gdXB1FlHiCiEOrw0Tx4WfamAtJa5umIHlcrQLNnD9BZKz7kZ2sheEmrN05sDTg4a9
         HyeZsIYEXyw6Yff7FEDFgcSk6+kwqZBisXWbusAXAL+gxyAYp3XV3KmzuBMjpZkwZlle
         DWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791286214; x=1791891014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p7aYTQPeC1hyGc3Y0A2cCz+2IUa1ZlgF2Fp8Xves7iA=;
        b=T93ZTJ5xajB8JVyDwjlYfULSsz8JM/+Cjnr4rzAq8gvMmvI1ii2nChLwYVDwFH4Q48
         9m93++1efvHrMReeTBMXKX8iR7OYzNg6qDGu92nAKNLLjhfxSxy52xVAdFIupgqBcTQa
         BWlXcJLC5EljAxrApViSiMG2j5Ar7WO1crPSLC2CEjbE6U1Q2ag+Vavp9r9EU6pS2SuF
         EnkdL97eRMaZ1LARBRfu8M6o4xJFO8GlLCimgSjtgFIb+1kS/N1+LLi7QaEb5NCkhrta
         Uzx8Vw5JpdsXB0nV20aw5qiGxG8eF7Y7i3B8KpJZH4CRShrEX3Ou8r9y/rHSsK7DM/zi
         FYuQ==
X-Forwarded-Encrypted: i=1; AKwUvBznLNiNeL4m16i9k/bZcX6WemlH55BDfu8sWT62ZLTCqMgOJCkoGoeep+8+GFXaOO8705bA8aOUIxDQ+Ep1bA==@lists.infradead.org
X-Gm-Message-State: AFuF++m23nc/2zFAVuL8WuOZsXief3If/PV1ddpLZJVJBJGru5aBX6Vv
	5Ou5RQ/mdRc9y0fyfaH3AfS2CxhBO2kPkcilZV6ZbBf8c/Yc+pgAGA+0yBUPrVxQAoc=
X-Gm-Gg: AYBFou0pVvktQXthLH2PVgi2Ztx25ni/uQUyywN6YLlwAozC16ewirGpsE7IjdTegeo
	Fp+rxX7c5U1lTBCy4vXcZnEAsACd3uOCrcyhK0t5R2E7x4jYFizwTiMRaw2YTwgMAOIpmHKjhvS
	75kZpfTZ8T84h8SRo9uOw20piiQJX9kO5hRrjQ5phC/zeTkWz1OGy2C2k5ngCxLce11Mun0VRxC
	ALne0eIv/DCoRnpi0GU2CL1vV2tPbqogBVN/6XyiPiELIyy1cLelFuTy1NU8MwouanhIk2W22Sh
	HrgR/cUyiU7kTKb7rHFDG9kfuBgIypMOeGThNheHY5WodyiZfVOja8rxwn0rB/7kSNKPUe4VN8p
	O2ZwVs34YNs7SBeZwuOqI5+ivdVq/S4eIWtR/QpVx6JNOCmSjps2ydT1vGndeDRlBZDuX36tLmd
	OY127w+YSpp8x7ml4IPkDCO+bhTRzP1AiMF9iQEN5ihnuAC8aOAA==
X-Received: by 2002:a05:600d:864d:10b0:4a1:661d:da2e with SMTP id 5b1f17b1804b1-4a178a3053dmr37160135e9.14.1791286213774;
        Tue, 06 Oct 2026 04:30:13 -0700 (PDT)
Received: from remote-01 ([84.17.55.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6bd2bcb0sm3173964f8f.1.2026.10.06.04.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 04:30:13 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev-bot+sashiko@kernel.org
Cc: linux@armlinux.org.uk,
	andrew@lunn.ch,
	hkallweit1@gmail.com,
	olteanv@gmail.com,
	netdev@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	conor@kernel.org,
	f.fainelli@gmail.com,
	chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v5 2/3] net: phylink: wait for PHYs that are known to probe late
Date: Tue,  6 Oct 2026 14:30:10 +0300
Message-ID: <20261006113010.741565-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179120736418.434549.3034364543286173403@kernel.org>
References: <179120736418.434549.3034364543286173403@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_043016_254772_7C84D2CA 
X-CRM114-Status: UNSURE (   6.03  )
X-CRM114-Notice: Please train this message.
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

> should phy_may_probe_late be documented as
> incompatible with mac_requires_rxc, or checked against it?

No. The deferred attach still passes PHY_F_RXC_ALWAYS_ON, and before
it the PHY would only have genphy, which ignores the flag.

The other points are valid and will be fixed in v6.

Aleksei

pw-bot: cr

