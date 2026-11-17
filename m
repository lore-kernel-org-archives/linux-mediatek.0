Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A8B606A323
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 11:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R9vZLAUJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=dFPHcWSP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=px2yzMZb+00ZKFAUheOTtZTROwrHpwZ9llnWmqj6+d8=; b=R9vZLAUJ065ZDj17FYmKF96aCt
	vrZGe9Ld+G2d6rqe1Kx6d3KV9hIdwYRMWJhbftwgRj1q/Ax1Ing48Bl1Osuk2J05VcU+Uq1YhSI9s
	rRjsBf3fg6Lkc1xFRHH4e3TbzWghr7mDsSFN9FCcxR1E06mT4aEhG9PkLoRN5RldHBG4rZdTK2hPT
	rTJuvCIlsRFaCCgrCg5ZYdiVdATTfTGzN4m8lv8cOHgPjVndG/NBlptekLHQXDoCe8175fWIa4yim
	UNjdbw4fvz9A+TsJhYFENn2b7TTzwlXcXvNEFKzanjsk7PdqUuGhoMQTXkp2+RWe46mNdTUdKQ+ln
	9JjBmZkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGyb-00000005NmE-0Z25;
	Tue, 17 Nov 2026 11:03:49 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGyW-00000005Nkz-2GOB;
	Tue, 17 Nov 2026 11:03:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794913422;
	bh=I99eKTieG3r9N5pwxWknTLA2rNggoIxISoFLRuvf9gE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dFPHcWSPFhEf3kOgHsix8TRHG5+yhF8Wde8U/dCcnkyNELHv0w8554s6O88KesVXg
	 AH/wq8Rv92MFEapC3Uu0BXOaQCBvijSMDMSQgaHyllV/GO/21r45X+rvvH+RSIMK5e
	 UTk+RzWp+CidMx6OrWM6Sm0DJBBhYgLroJ9FABTq+h8Wxf7w9ipAy7FJSxMA6XLOer
	 97HQ84eKfeHWFN/QzweDZgEUmsJI9wyg/bZGV0lWTTfoem8rXGCiyhZr5IzaN/SGwJ
	 Q4UyUV3HrDmsPKW9AB6pnPt8PnJr3g19w5jd6nycszO8bJIvKEGeHWzlatzN33MC5m
	 wIRNQ0YNWZjAw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5754617E04B2;
	Tue, 17 Nov 2026 12:03:42 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, airjinkela@gmail.com
In-Reply-To: <20261028134544.594888-1-airjinkela@gmail.com>
References: <20261028134544.594888-1-airjinkela@gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: Fix malformed SRAM ranges
 property
Message-Id: <179491342229.161638.8257695418556840247.b4-ty@b4>
Date: Tue, 17 Nov 2026 12:03:42 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_030344_732806_015264D4 
X-CRM114-Status: UNSURE (   6.69  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Sjoerd Simons <sjoerd@collabora.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 28 Oct 2026 21:45:44 +0800, airjinkela@gmail.com wrote:
> The eth_sram nodes on MT7981, MT7986 and MT7988 sit under the soc
> simple-bus, which provides #address-cells = <2> and #size-cells = <2>,
> while the SRAM nodes themselves declare single-cell addressing:
> 
>     #address-cells = <1>;
>     #size-cells = <1>;
> 
> [...]

Applied to v7.4-next/dts64, thanks!

[1/1] arm64: dts: mediatek: Fix malformed SRAM ranges property
      commit: 55e9f03de754eb92e45404def36faaa5942a3877

Cheers,
Angelo



