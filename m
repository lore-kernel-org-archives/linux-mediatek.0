Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7A7606A31A
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2026 09:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Enfyn1xF;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S8kh9aMm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=24F/d8Z+ERFiE118WtTUpKViM5tZiEO9H1s/ycjWi/Y=; b=Enfyn1xFKjJ+d48O2YHz5AXL98
	buayw/mDoi96cm4UHgyfRnC+VjsIZQcp+tNxO8xvJg4ksaBHOSxl4yRAij6/W2Tv3gAgRVXVrLd1/
	2R2SfDODJd640H0lb+LQ8+93HsOO06ZM/ZX5zBxEuvJe2HKw2no20/5pcGjYWa485Xq849PpAbflU
	s4BYK2c8vz4jl5Fuu4MDe+LfLAkC41Y9H54L6QT3HuOESMO+3qtWgN1VzhMfzWQ2LcnMc0ccMX6IX
	bKj2dj20PSzHpE470DHKN6ZkzC2+nEWjqv/ZUsD/qTGyMyY1K3UKgRpAj1FAp3xhnazunPBIdZpux
	OvFjb/iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJStb-0000000BWYQ-14Xt;
	Wed, 21 Oct 2026 09:46:07 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJStY-0000000BWXT-096C
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Oct 2026 09:46:05 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a2001dd4e7so3163345e9.3
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Oct 2026 02:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792575962; x=1793180762; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=24F/d8Z+ERFiE118WtTUpKViM5tZiEO9H1s/ycjWi/Y=;
        b=S8kh9aMmOy4yzOMol7iwVjPdyxNHZRYXCdhbI+ooxD3beu4ULswK3u+gjLhTZi88p2
         A136JIlSbZwikC7NgvN38aXR66XJOc2+Z9Wqf3E2pd7JBWhr7/XR78zTjPNVJ7eH34RV
         +gVZGnekwON4ui7U216RoIRf8siXg05tgvAbfxyteKoYwklWr0Igymm/BWBc4nhz1DRG
         pUND/cuqSUexNf8UnTJbaMQ5n0LQYN1tEldTUQoRxMsG1rAty/EIbLA0OvuDrqO4Wfmq
         V+MZxhUDyOp4Do7gWhJaYj5ePlbWcpYrHuQ1Be+GgucYCZNtiFYcNy5Gpa9qfTC7KNT/
         SiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575962; x=1793180762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=24F/d8Z+ERFiE118WtTUpKViM5tZiEO9H1s/ycjWi/Y=;
        b=RMqUGshoSQKw2PgRJUI1RBkV9YOyeltkq+s0HpWqcpEXD6MzYF8fHff2RB8p0jhQ2j
         aERlsa25Hz+ErlEJTPZUIhmOEtm0zfmCdjtIilr7wU3c15Ho8ldAlhFeWVA/Wl6BEmiQ
         L/tUeUh6NiHYHHjDcbuQqyy86fgMXeMl6w18I9/yYl4Jmmf4qcAZpjQrj3OqLItyttyJ
         TIguGwMhsVQJ1tRvNXhbin5F1L74acGmeGYVGSnfSQLmnyL0EyK43bt19+/IadurJdkV
         LIcB0eXsRsUQtW6Sa41CakDNhpUaFBau4HLySuJRM4X1ozzqX2NwZvxOSJdFHOYTsTGP
         c1ag==
X-Forwarded-Encrypted: i=1; AKwUvBxOeFG1XfKDgjxX1h2ayAe56ICVjTMhdR4l90/1NEY77UqjrnNqoSeR+/he/jaQ6bR0aQbwiliNHW69xmcJig==@lists.infradead.org
X-Gm-Message-State: AFq9FYIup9sy40ewo/eaV/xd226T1RHi6T/yZcV6mSZ8BI3l1ETuXfUG
	w9faFxxEjiAaJs8pWNHXIO1j6HVucMWFbIlxs1ZCcFPbL15/98AbPp+gJGBCqKFD
X-Gm-Gg: AYBFou2duCzIPlzFMLUfuu2R8W5S1xvPe7wr02/Bqqleu1wMNvofwPPFuyw7puRhUk4
	8URg3xoJAzgJtsupjU7LgoYsBnpoSbORxdTLypcybjO1fY3OmyH0/gQxSEpq6knLaTC7x9UZS3P
	L2ItPQ6jJeK3nSo/CI9I8vfy612/1po2q6yWG1/yPWDZHBDYt5T+NM6IOvXsoVMdksklrindqM2
	vZ4y64NOvTWd4UhZw2Cd1gmR/ZJHSgK9bC4jvY+nCVZzPp7nG1Cp1vM5cagVbsABLcg+XmAfENp
	1SpEP7KydFcL/4oRqG/H1X8p0rMQWo70d60bOELAu80h1nlt7Z75tmHLG9GTfqfYNoLBSf+KeEh
	/8h5mD5BMkSir5W/dUgVJCxTwYqL1ai/2FcYGC2ZpzthiFk3leFHonffwjhJSX1yEZf9DMWRE8p
	N4kOwUcX7NibNQG2Z2y1OwsQ1kmp8iWKW1OG8uCbVADkup8xxtoQffbgXYD7Vv15MXsIkjfq0TW
	mh+e+Oupw/bnKmgK87/hUcRz0tt+IAMJxwoXpWLSzCI/WUbpsY=
X-Received: by 2002:a05:600c:1f95:b0:4a1:6c0c:ab93 with SMTP id 5b1f17b1804b1-4a1fdd109camr28889945e9.28.1792575961841;
        Wed, 21 Oct 2026 02:46:01 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258427cesm4320300f8f.52.2026.10.21.02.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:46:00 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: akkun11.open@gmail.com
Cc: angelogioacchino.delregno@collabora.com,
	bhelgaas@google.com,
	bmasney+clk@redhat.com,
	dakr@kernel.org,
	jbrunet+clk@baylibre.com,
	laura.nao@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	nicolas.frattaroli@collabora.com,
	o-takashi@sakamocchi.jp,
	sboyd@kernel.org,
	sjoerd@collabora.com,
	u.kleine-koenig@baylibre.com,
	wenst@chromium.org,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>
Subject: [PATCH 3/6] clk: mediatek: Reserve missing MT8167 clock ID
Date: Wed, 21 Oct 2026 11:45:20 +0200
Message-ID: <20261021094542.59417-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921102522.1640072-4-akkun11.open@gmail.com>
References: <20260921102522.1640072-4-akkun11.open@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_024604_079961_090F234E 
X-CRM114-Status: UNSURE (   8.00  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

I tested this patch on the Sony PlayStation Classic Mini (MT8167) and
unfortunately it breaks HDMI output.

MediaTek HDMI PHY driver registers the hdmtx_clkdig_cts clock at runtime
[1]. When this patch is applied, the following boot error appears:

10018300.hdmi-phy: error -EEXIST: failed to register clk 'hdmtx_dig_cts'
  (0xffff0000018539a0)
10018300.hdmi-phy: error -EEXIST: Failed to register PLL
10018300.hdmi-phy: probe with driver mediatek-hdmi-phy failed with error
  -17

The original problem is caused by having the HDMI PHY node disabled in the
DTS, which is usually the dtsi default, but it does not happen if the
HDMI PHY is enabled. If this is merged I think this error would show
up on all the affected SoCs.

[1] https://github.com/torvalds/linux/blob/a804c5742bff224d4cb4d25dd383554d598be32b/drivers/phy/mediatek/phy-mtk-hdmi.c#L140
--
Luca


