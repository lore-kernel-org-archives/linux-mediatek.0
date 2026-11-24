Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53134606A321
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2026 14:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y1h0ndcg;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Dk6Weovo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VcL3rj8UTzKfvpsBbOOp/bQe6jtFGG5Kxst45YH4cQY=; b=y1h0ndcgpScGI0
	Hu3zUjp8z+Rc4wRV8PmuFa5imnTd49GoQRfdbQ2k6rayj4BTt7qxEYxl+4yhV2A2d16h7XDEJlgyG
	UxQP312w7WfrucKFM2VwdXYsk8Dk3SXwnuMiuNwJh5dV6LdFuYGAQCgNeWWKVmNfW0fFxF0x94bX0
	Oh7VO5FnXIQUO8KNU3pNh43xtFqDlu68noiziJvNgZxlcot0FNvlRKedXRQ1tattqhf9Aa9e+cbfu
	PEwKAfg4fuL4v0rrBbcGoh27mK+fHv2lLYDbosRSftKUSqJdXSvwgMveMaKR0fdkAhgI+Grjlik3N
	S6gVn3vCpcOI80rbI0uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrVz-00000006kWU-4BIV;
	Tue, 24 Nov 2026 14:29:00 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrVw-00000006kUD-34Wm;
	Tue, 24 Nov 2026 14:28:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795530534;
	bh=1WrWwuxr1fE+LJ5lgDYFWIOOScC5de9NtjpElFZEmR0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Dk6WeovoWPBai4ppzYY2SnCUUYvaEOpz+GGKM9GdvmoWIbIPv8fcofauohVz1pk5G
	 kvnKvnPsEk4e1newry8sam1klQoIqOGcUudih3i6IHAso+TYMyBxiZqmU0AAtlMgMD
	 iyZ1mZzpGTIHye0jAU9uEceuKNUSpj2ES76H9E/BMY74dLldaSf3jNTeOKA2C8Ec9J
	 F1YJTJ/3aSm2FCtAwPM626+B8ggEWuhLAxrEXa8S87B12HODeapT8vrIx82jmsXsGz
	 UGeOtb9vuJ3e2dRtqKXIKkkThMq/6nc4tD6ATnoI6IZCo6pTPdBOiVH4OgyegTFX+d
	 4r6vjecYAuDdQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DB3C817E047C;
	Tue, 24 Nov 2026 15:28:53 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
In-Reply-To: <20261119-mtk-genio-boards-wdg-fix-v1-1-a2d23746a07a@collabora.com>
References: <20261119-mtk-genio-boards-wdg-fix-v1-1-a2d23746a07a@collabora.com>
Subject: Re: [PATCH] arm64: dts: mediatek: Move watchdog disable external
 reset to chromebooks
Message-Id: <179553053384.64247.14935970528940939897.b4-ty@b4>
Date: Tue, 24 Nov 2026 15:28:53 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_062856_951014_4C7BABE3 
X-CRM114-Status: GOOD (  10.78  )
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

On Thu, 19 Nov 2026 17:42:51 +0100, Louis-Alexis Eyraud wrote:
> On Genio platforms, the external reset (PMIC_WATCHDOG pin) is routed to
> the PMIC, so that once the watchdog is triggered, the PMIC also gets
> reset. Meanwhile, on Chromebooks, the PMIC is reset by the Embedded
> Controller (EC), so no external reset signal is needed.
> 
> For this reason, Genio platforms need the external reset to be triggered
> in order to be able to properly boot, but the current DTs disable the
> external reset at the common SoC dtsi. Move this property to the
> Chromebook base board dtsi instead.
> 
> [...]

Applied to v7.4-next/dts64, thanks!

[1/1] arm64: dts: mediatek: Move watchdog disable external reset to chromebooks
      commit: c9b3683042200620c60d4b89c4a95628f676d9c4

Cheers,
Angelo



