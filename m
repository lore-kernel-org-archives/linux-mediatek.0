Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFADCC624D6
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2026 19:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xrxj50UPOiAaVvLDQBKaDhxwCp4EpiwnDcNCbB25YKw=; b=4wpkXQY2nCTNzslNLqp9FT/U+v
	fOM10jFOzQn/d0Qa70jd4XdP3rvLQ1pvzpToiA8YcCGmrAqf2yyS3PYQdpzYogcgIuZjXHCt5Miy0
	qZE/TH6i+xCK9MI2XNqk+HAZRVs68RjDHN5LhIpBvWegP4Ds0oX8+LlilWKF56BkHb0xga9g6ypb/
	xlkOGDhlHvovFHlkZFfpfSwcLv6rWukBGOzAmKukeXAdobj5swz1+AMFYDlcsE8wIK1xsvrlH030g
	ytMcC6Es7pd8l2QdDCxGDSAReH2V0zqem46tRs1OD/3HexcbIVQIqEP45PKIS9H/Y6MgJ7erKRHj9
	XiDYh7aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1UVx-0000000DG32-1shh;
	Tue, 01 Sep 2026 19:51:25 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1UVu-0000000DG0t-1jBy
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Sep 2026 19:51:24 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-495590dde14so2132405e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Sep 2026 12:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788292280; x=1788897080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xrxj50UPOiAaVvLDQBKaDhxwCp4EpiwnDcNCbB25YKw=;
        b=jw5IHllMu9ItFbhbWLZ7zuiytuyhs63OrKlmkwwXnUYXZF9wWbsb0MQu7pGEE9Dt5Z
         4ymRejP4rjqtJ0itQ8HbBhDDb+G7qnwGtRf01HYtM/k8CDfn85KwTA2ohDhDf6ykycq1
         KkYzY/hzGCqVH42fXI+kpCaFtaFi6zdQ7DbpFb41Q6IPzIakTKteSK8pXZNsb1ddDdBI
         tk/jchdogYuwdmwmrjfqdzL4yjKXzj9lCehUP8KAZWsKk1/7XxGts+V65d6RoC+ugicr
         HkliRnyoVljuwTTHxO68c/yOpFJ3Ys8iE3k4Tv2iyeZWo+uh/BEB6YH+130pjugaPciJ
         rTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788292280; x=1788897080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xrxj50UPOiAaVvLDQBKaDhxwCp4EpiwnDcNCbB25YKw=;
        b=QO9CoLoxRxXErxb95cot208KlwSySy5W2Fn7kKJkf+OuEglct/0HnD0v4TWKbdtS0q
         U3vL4t0PQbx8lJVPeEzNrovFoPr71myH7CwCRBk5pmsTh7Yi2M1dl/Xu+AUF36fYLget
         rfHRGLT1bjCdguBO+IG0pDd7iWe1+q7gphIrxDrezBAZRCTlhZMME2Ua8Tw4mYGwbvv0
         fWamsWx/o/mpj/3OJ/kLlqLw1dB/NxeSr/Jrla1JsmXrLWsXZzgD9Pfk8yZIXUOfG/hY
         jW+ioz2cqstURbyR/GY3/pNRSOmieJGaU5HxK9w44iMXlVzbfXWohUtDnv5CHZ6fC77k
         oUDQ==
X-Forwarded-Encrypted: i=1; AHgh+RrM+BwAKUs+9HAMpDBZE9J22AEYdxrJBzjjzv1r0NWfo8e1vWD+o4HyvyCpom2GJRl0erYNy639G/ci1W1xJQ==@lists.infradead.org
X-Gm-Message-State: AFuF++me63iAXN6gNghkIiJcpjocMDtcI02IoB+GxDho15GHGkPJytX0
	9XdNV09mRx41UMqRUiDtKwRKj4Q/kHt083w3NAS5xcMjd/Fy2ky80ONaun4TLfZJrgE=
X-Gm-Gg: AR+sD10ff9XyqZhwN6W3btv7pgtiDjuhCI7Eur5VGEUsq4iJ9NTNI29wECWj2QnAvpr
	AeGjxy9u3H0aMwcWg730BP0GsvauP5ZsYTiO34NRepRaLt6SLwpK9Jxwfg4yIFvAjOid4HehSpf
	WAAD6HWySGxe8tHh7jD72On1Yh1TB7TifvbGboIUGfdfNmhY63ih0LbPHeLqsGRvRqtDEU4Qtsj
	MELDnysYP5yXGoPw9S35RVnrVoLB3V8uPwu0tqIaNWTEg9tPJD5iJ2x5BYxTHiOOodH0ndyhtpv
	zZowiPAjmzNSuncXBuxvuXlid8S3XQ3AentyyGa/3exSS4Pt1h5qUc5ae32PSCgQQxgE63bfsNS
	j9FXzhJXhTsgYZCXjMWw98rttkBmU5rR45aYLeKKm6rXm4vYZ58AbhIw308k23xarFfu72KnLvN
	+Dg2EQTsvOfcyaZWwbLzbezB7ij59YYX35xKKAhzQ=
X-Received: by 2002:a05:600c:4eca:b0:49c:e1f1:3dd5 with SMTP id 5b1f17b1804b1-49ce5816892mr62765e9.4.1788292280497;
        Tue, 01 Sep 2026 12:51:20 -0700 (PDT)
Received: from remote-01 ([84.17.55.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce3e04csm82484315e9.10.2026.09.01.12.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:51:20 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Paolo Abeni <pabeni@redhat.com>
Cc: "Chester A . Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v3 1/2] net: dsa: mt7530: populate lpi_interfaces to fix EEE support
Date: Tue,  1 Sep 2026 19:51:18 +0000
Message-ID: <20260901195118.37238-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <d0e8bd80-1798-4840-b388-05206bb72fc6@redhat.com>
References: <20260827211652.63504-1-f@lex.la> <20260827211652.63504-2-f@lex.la> <d0e8bd80-1798-4840-b388-05206bb72fc6@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_125122_495552_6CD95148 
X-CRM114-Status: UNSURE (   9.14  )
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

> Clashiko complains about the above:
>
> https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260827211652.63504-1-f%40lex.la
>
> @Andrew: WDYT?

The raw LPI_THRESH plumbing predates the phylink conversion: before
9cf21773f535, mt753x_set_mac_eee() wrote tx_lpi_timer straight into the
field with the same 0xFFF bound, so what ethtool showed and set on these
ports was always the register unit. This patch brings that path back and
does not change the unit. Settling it needs the MT7531 manual, and the
EINVAL-vs-clamp mismatch came with the conversion too. Both look like a
follow-up once someone can confirm the unit.

