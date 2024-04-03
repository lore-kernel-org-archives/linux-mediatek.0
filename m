Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8CACD128A
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Apr 2024 10:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NkUIlSapQDuvNhJo7AEKVbgM49hO3NuBWdsqPvR5nAI=; b=W6IPC2zQCMrDlUubp5KkIx2YiM
	KgzsNJY//QRcAC171Uc+vO6Hbbncmj1J2NJOhnIsPEJ61orOUdM9RPp/CX4uX+/WhTsR3D5X0wlDj
	MzWT7wN7QIJFmrjjbj9i9mW8fAxg8So9c1Ox6iVtSECxJ6KSjZI7cq7RkLrQafZaoEGA/MK8dLn13
	HCMcqd2SfeKbNzM3alZdrahoKfeNF0ai1m9nuUs4cCaIB1TeskOZPWW+4HfYMvSIOpvFXSqzw9aID
	aer7KpY/buIGYMpSHOwKeGMbZ1y9zMi4cdp4V0rhvnobW9aKJKMi1s1RlcH10B+LtJ2UEZgj6tuHE
	LrJ0zDkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrxuX-0000000FX9p-3Wsp;
	Wed, 03 Apr 2024 10:32:05 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrxuK-0000000FWys-1pQe;
	Wed, 03 Apr 2024 10:31:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712140310;
	bh=4iqKGJY4kBJIBlK531YR7UlzsD9hKc27WlTKaBE2L6c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dpePdvJ6o64/y+hWsMvSio6BoiFXgnbSY5fnWWl/C+4y3eIaZpyxqvPa4FVP1RFcq
	 7xogpdAg7vsQDv48sdKvVhKdRW/tLXNBjVi9fEVn1fJuvnLw64JoKCZDi1d4B0WcM9
	 Onaf33Cvu7AGbILGVCU4C/XhtKWrnxpMJnV4FWUeqZDrjIBmToS92MR15NekJPinaA
	 uUvc9S4k+r7enXSTg9fNJztATKbkRK/dCFVB8ylUMTIOlB1J/ENesGVD8i+WdLGPEw
	 So1nD4D2OZtYoxKwDKWLFia6omPmRlWFtlsXFAy7et2h1VRzjccNhsjtUms3o28xEu
	 /buh9A9/dZPsw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 105AB3780624;
	Wed,  3 Apr 2024 10:31:50 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH 0/2] Add missing chassis-type to MTK Chromebooks DTs
Date: Wed,  3 Apr 2024 12:31:43 +0200
Message-ID: <171213798076.111748.12884095737828369172.b4-ty@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240313141538.1438167-1-angelogioacchino.delregno@collabora.com>
References: <20240313141538.1438167-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_033153_005735_AA72FD56 
X-CRM114-Status: UNSURE (   9.16  )
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

On Wed, 13 Mar 2024 15:15:36 +0100, AngeloGioacchino Del Regno wrote:
> Even though the chassis-type property is optional, it is useful to
> identify a convertible vs a laptop (etc).
> 
> Some of the MediaTek Chromebook devicetrees were lacking their chassis
> type declaration: this series adds it where missing.
> 
> AngeloGioacchino Del Regno (2):
>   arm64: dts: mediatek: Complete chassis-type for MT8183 Chromebooks
>   arm64: dts: mediatek: Add missing chassis-type to MT8192 Chromebooks
> 
> [...]

Applied to v6.9-next/dts64, thanks!

[1/2] arm64: dts: mediatek: Complete chassis-type for MT8183 Chromebooks
      commit: c7df5fa3d1bd4c71d3a2d452c9da70e5e78f03e2
[2/2] arm64: dts: mediatek: Add missing chassis-type to MT8192 Chromebooks
      commit: 9b8c00596e30bb27a1f25a0d9766d6c767f4b355

Cheers,
Angelo


