Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DE4606A33B
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 11:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vYIUnmix;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=HOdXKRQR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=s7AVPmufHz96+sRIu+b8P8lL6WMxsrhav/dLCJI1TTM=; b=vYIUnmix3Kkra5
	+PY97PbhLO50pWi4GyyBL8aJAuCHg3Njq34FGHKCUOg0vWD/t28rTvUvkFFliGlZqcOj84kok38zi
	3fAuRi1/UN0BYUru9at6mKSVDkdbhmgUKKXOB2KYChsZ1/s5O6rzwvrxvBtcjoMcBOtgmskvsBbhh
	85+gLrpP2qX+6aoKBMJUpiE9iuAzGe6OodZ345djvaTm/c+/Ph+hDP3i26QikYcm2SIoO702QjPLA
	WcezHvA50YtNA7GjHjBHPj8NATwaSHtdo2h0JBO22gSoS9I1xB5kk3JdSI0aHokdi+5VRDKyjVKzt
	ddAd8cJ0z/8RUgrxaH9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTH7w-00000005POn-0MVg;
	Tue, 17 Nov 2026 11:13:28 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTH7t-00000005PNf-2HUf;
	Tue, 17 Nov 2026 11:13:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794914003;
	bh=/W4zx8LndX+Y2boNw4PDCj2CCOdKiJ6ihYmq0R+CnYk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HOdXKRQRGz3e2Bp/j10K/jECI6tKqoNCEap8PFSYNR9s4DowtlClVF0F4uddFo0Ld
	 koDNjvGVa0sRI7ygVw3zhcEczIkNAe5Sj+cfN12CRnuBrEF5Ixm9+HG3x/J0WuPmKX
	 dpqVoyWl6ekwG61xkP/1o0DNLlsElyxRcymVFjx7bcSPLwsm41kvOelNN7AcdgxggE
	 vEC5qpdEbYLvwyBqlDKzy4ZiczpJszspA3xKlhtRpQg8O5KofLa19FxwdCI69bvjt+
	 06B7itnxcQkzUhDDCeT55QF25Jy5OhT7khc1Ua0tGecJI7IA//AO7+ZuMfIEEtxqBg
	 AbxdlB4S9k+wg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EE29117E0060;
	Tue, 17 Nov 2026 12:13:22 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260909072051.4627-1-l.scorcia@gmail.com>
References: <20260909072051.4627-1-l.scorcia@gmail.com>
Subject: Re: [PATCH RESEND] arm64: dts: mediatek: mt8516: remove cpu3
 armpll clock-name
Message-Id: <179491400290.166415.7117847128055406868.b4-ty@b4>
Date: Tue, 17 Nov 2026 12:13:22 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_031325_739766_D97298AF 
X-CRM114-Status: UNSURE (   7.34  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 09 Sep 2026 09:20:14 +0200, Luca Leonardo Scorcia wrote:
> The armpll clock in cpu3 clock-names property comes from MediaTek sources,
> but it's unused in the kernel and not populated in the clocks property.
> Let's remove it and align the node with other cpu nodes of the same SoC.

Applied to v7.4-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8516: remove cpu3 armpll clock-name
      commit: 0ed020eaeea1bf0854005eb9b72126ca340b8e4b

Cheers,
Angelo



