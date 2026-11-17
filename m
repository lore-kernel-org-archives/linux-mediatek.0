Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6504A606A31C
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 11:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Yw06eFsu;
	dkim=pass (2048-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.a=rsa-sha256 header.s=protonmail3 header.b=O7F/AtX3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7gp/tEK1h0CZZzF3joRMwW+MfGEJpki8fHwQoqeeKfw=; b=Yw06eFsuttAVNX
	rLgu9aDk8NJ1+Fz9RbqN+jUVHdGjiPKKRMoc2wCG6Ch7Oh76f4K3Oy0pHQNaGKxbxzkVjVbR9zbQv
	tTNhie5+pvuAdLThmGjoz1f3jJC0tdoPjWA7AohASluchCQBs1M7xsZwBJyWM20VqI4eA2LMwx0rc
	8tzAUC14aHZNgYRP8wZciNX+Icw5gACz6jMDQsu35OtaU+nmt4GmON5eDA5/Y/eo+MhpC8SoFAFXv
	hr0DeVkkX8rzUES02MoH2QKwlHKpBpfvA0zX2pvNuGHUS+Maxje+Zs0T/QqZH52SBCusoLAhcwxtB
	tzu7Dm5nzM4Cs5zTmpkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHnb-00000005Vu1-2lc4;
	Tue, 17 Nov 2026 11:56:35 +0000
Received: from mail-24418.protonmail.ch ([109.224.244.18])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHnG-00000005VqB-1Eey;
	Tue, 17 Nov 2026 11:56:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
	s=protonmail3; t=1794916562; x=1795175762;
	bh=7gp/tEK1h0CZZzF3joRMwW+MfGEJpki8fHwQoqeeKfw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=O7F/AtX3l6DPqkI6RguZwNBMfZ8Q78/wqNX5ZpMBIWtPvvD1yed4ILge4ywzG8cPI
	 Lf+lgC64qGvbsf43OvQtAvHvhZsXNTIpYuxklutzWVBR2ckmfbetl/CxYxBeIG870Q
	 kRC/0tii1TIGYeprV3n9wmpYakL+gAb1X2to14AQD5dDrDZJCvoXwUptSno4qcWUDK
	 D3Nj91gHZtEceflE6OFXJxEN3d6M5/Q1Bm5VGKMg4Yq7dUQFRUW7NEsEPn8Yb1djRR
	 BJqc3Hyf0V8h9QaRmeAsaCSgZRxWsB4vb6Vm8IOnL7zusjkjV7bUpKGu/K3jims+7S
	 HwHvoHiSamLAQ==
Date: Tue, 17 Nov 2026 11:55:52 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Ben Grisdale <bengris32@protonmail.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Daniel Lezcano <daniel.lezcano@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 0/6] arm64: Initial support for MediaTek MT8163 SoC
Message-ID: <20261117115545.1983774d@ben-desktop>
In-Reply-To: <20261105-arm64-initial-support-for-mediatek-mt8163-soc-v2-0-e68d7d428f99@protonmail.ch>
References: <20261105-arm64-initial-support-for-mediatek-mt8163-soc-v2-0-e68d7d428f99@protonmail.ch>
Feedback-ID: 27291966:user:proton
X-Pm-Message-ID: 638059f9793bf86f61db029f1075fb5536fbc904
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_035610_502177_9D42E266 
X-CRM114-Status: UNSURE (   8.66  )
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

On Thu, 05 Nov 2026 14:28:45 +0000
"Ben Grisdale via B4 Relay" <devnull+bengris32.protonmail.ch@kernel.org> wr=
ote:

> This series adds basic support for the MediaTek MT8163 SoC.
>=20
> The MT8163 is a 64-bit SoC featuring four ARM Cortex-A53 cores,
> typically found in entry-level tablets and smart displays, such as
> the Amazon Echo and Fire HD devices.

Gentle ping on this patch series, v2 has been sitting for a bit so I
would appreciate your review on them when you have time :)

Best Regards,
Ben Grisdale


