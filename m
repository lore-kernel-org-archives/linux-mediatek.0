Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D1BCD1292
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 03:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dz15JYU5qz7M/9w39lPz3MiT118049k699KYS05P/7A=; b=GirGkX6cdeJP4erqT8vZgpRsLF
	4uYLzehKCmZQyLlNlmn+qzzqcXuvmFkzXLNu4vyEEDYPgW+xyWQIzYkXOB+dFmOFnxI/rk7lHDNXq
	2nBS0B7CJniEkVVkIHfkglQSZ9zB9RYpTrLtxjFBzfsnZ1h+bIqRGNURkpWIxx0uY8R4BJY0PRQVh
	G1PQxr5y5b9jqcEF0IQ+PD0dpZb9VuecNxBtIi9B3v0H0glgyrROZ8YfUuMb87574JG5Zd3mX8+oU
	+SBI2SBmdWkupaPL7ISinCtnePKIb9Sw31r92jIUtayWul+zOyqIdgxFkFaVuwvxj/mhvQ8wuZWor
	InVMn3Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rulPu-0000000ADEh-2NVG;
	Thu, 11 Apr 2024 03:48:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rulPq-0000000ADDv-24Mb;
	Thu, 11 Apr 2024 03:47:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B1E8961F6D;
	Thu, 11 Apr 2024 03:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A9DAC433C7;
	Thu, 11 Apr 2024 03:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712807277;
	bh=Dz15JYU5qz7M/9w39lPz3MiT118049k699KYS05P/7A=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=R6E9HVvGHmKi3QW3d6Ls+B9zYQaDqO8zj006/N+H2YTdsBuDVYIk/hwGTTTR7njbL
	 2vNkFpgixTJ4ouUhCYsyh0tuMV1cjSdXaO3Pm0Pa5D5K826OVmmj/PNzs4ZjbxJraA
	 qr/WuwA+Qo6k/pAH3++69jsRfGHdG0nKyq3XuWe0tqOCjFf+MXnSO6F4QKWztgYTzP
	 hXN22QkhAzAvlb0YSxpQiCEKYMUuDYbKRfR2FHpWXHzb/2gnYQQdm8MiyoBrGIrCB4
	 2xjrkadu9G7GohDVo03CEDbQyxNQJHFTsIAJ4Ln4RHWPeHGVfiXlvnXj/qN7i1a1xw
	 jc1HZc+QtLKyg==
Message-ID: <279294c6bfb8af858c2d522dbe3b76b2.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1da2506a51f970706bf4ec9509dd04e0471065e5.1710367453.git.daniel@makrotopia.org>
References: <1da2506a51f970706bf4ec9509dd04e0471065e5.1710367453.git.daniel@makrotopia.org>
Subject: Re: [PATCH] clk: mediatek: mt7988-infracfg: fix clocks for 2nd PCIe port
From: Stephen Boyd <sboyd@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Daniel Golle <daniel@makrotopia.org>, Frank Wunderlich <frank-w@public-files.de>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Sam Shih <sam.shih@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Wed, 10 Apr 2024 20:47:55 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_204758_593462_4F2394EA 
X-CRM114-Status: UNSURE (   9.11  )
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

Quoting Daniel Golle (2024-03-13 15:05:37)
> Due to what seems to be an undocumented oddity in MediaTek's MT7988
> SoC design the CLK_INFRA_PCIE_PERI_26M_CK_P2 clock requires
> CLK_INFRA_PCIE_PERI_26M_CK_P3 to be enabled.
>=20
> This currently leads to PCIe port 2 not working in Linux.
>=20
> Reflect the apparent relationship in the clk driver to make sure PCIe
> port 2 of the MT7988 SoC works.
>=20
> Fixes: 4b4719437d85f ("clk: mediatek: add drivers for MT7988 SoC")
> Suggested-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---

Applied to clk-next

