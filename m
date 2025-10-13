Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A989DCCD18E
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 09:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=magqpC/ICpnHytykh3cNdIwSRBZoSaTWDcBmzmdWY9w=; b=XfJtl9wkvAQWnatR8FK8a3+jkY
	HRoswBJRzJoWKlBPhk5uNeqQ64O10+E5NcIKZ6TsKPbn2C9dZz0a3ULXmtYel+q8NgRb/f9I94It0
	GhQGSU4yeMKlB23i47wwvMaT/hnnztehnPGVhyYiwGCxPtvm3PNxYmdsMffWmCcYBUpEfxeuSgndF
	9FowPdwLybXHLAxQk3Gbn/tZ08yR8aD+B5WuxZE95EomGC9m4bHtESw2zcXJgP+t1MMr91f/0vBNW
	ajOb++rkGRjL0tsjbTUQHKD5OHiacF4wTFTjbFEsGktLJA81dFKpam0q7JBfc1XeyBcQZe6Gk/KKn
	A8F2dZRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Exa-0000000Ckty-3JMj;
	Mon, 13 Oct 2025 09:35:18 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ExV-0000000Ckqt-3EUS;
	Mon, 13 Oct 2025 09:35:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760348111;
	bh=or8xQ1iruJtdfX8SleEUWuob1OR6uOc2dB1flwoE3mE=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Gpre5uhbDneJfSx3JZt6GYGvpLzkerLjnbCmIq2hgFeyKqezmwBOxw/bJLD7/enfF
	 32ugXIYdpl1eKijQH1wbj3pCPNfiNgZ0zZhhtfsvkU4iHYVds2mO4xpRtm3YppQ/Fn
	 /hzRp5U+Li3LF5LwxfMZ4AhXl1SgVtVFuZOtcDQG7pXXu2O6YZZa2IM7Qd2UEFmTbs
	 KqjTnGuHWKxfPUyHXimdKf+a6LGUYxJNhHdRp6NVMBx3/k5/tNaW54Vknak7Rd4dl9
	 SixC75OkU/mCJEcK/iPNrtdmrTkwRDm8+jK5Gx5iwrGZ+Dn74zrqaRIFgz6+XIMpgD
	 Mg8w4plkgkp9w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7DCE017E12C8;
	Mon, 13 Oct 2025 11:35:11 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>
In-Reply-To: <40004650c99c09ff540d8e2028a1393f4a70a6b4.1758369130.git.daniel@makrotopia.org>
References: <40004650c99c09ff540d8e2028a1393f4a70a6b4.1758369130.git.daniel@makrotopia.org>
Subject: Re: [PATCH v2 1/4] arm64: dts: mediatek: mt7622: add 'soc-uuid'
 cell to efuse
Message-Id: <176034811146.21265.15506279212407234181.b4-ty@collabora.com>
Date: Mon, 13 Oct 2025 11:35:11 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_023513_975406_337C59CE 
X-CRM114-Status: UNSURE (   8.07  )
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

On Sat, 20 Sep 2025 12:56:42 +0100, Daniel Golle wrote:
> The efuse of the MediaTek MT7622 contains an 8-byte unique identifier.
> Add a 'soc-uuid' cell covering those 8 bytes to the nvmem defininition
> of the efuse to allow easy access from userspace, eg. to generate a
> persistent random MAC address on boards like the BananaPi R64 which
> doesn't have any factory-assigned addresses.
> 
> 
> [...]

Applied to v6.18-next/dts64, thanks!

[1/4] arm64: dts: mediatek: mt7622: add 'soc-uuid' cell to efuse
      commit: 79fb9654a2eeea8e973f6d329ccf68221703ec59
[2/4] arm64: dts: mediatek: mt7986a: add 'soc-uuid' cell to efuse
      commit: 18d0f98a17757c4030c0af046dfd864c8108738a
[3/4] arm64: dts: mediatek: mt7981b: add 'soc-uuid' cell to efuse
      commit: d261557f7ad37fad44e3c07e76e63a60abcf8bc3
[4/4] arm64: dts: mediatek: mt7988a: add 'soc-uuid' cell to efuse
      commit: 6bb220964d608b133a81ac2ff15177a32617ac77

Cheers,
Angelo



