Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5CDCF31A9
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 09:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=evEIp0tcwQK/fnZllF+woILdmOmkGRsqywtpOWrkOOo=; b=XF+HNVmdF0/T3Ip/xY3sANGZxb
	GoOUJI0Dd64fF+bXjR58ueT4k00t1vrYv2bM+zr4pyp8WZcOWQ9saCSTeEjA7sRqu0g7HKtK1Ahry
	9h80z7LWRuyFcESngRAuCQdxqDY5yDugPRzDjywtGAstV7MTe2xPUi4BSZqV5TzigMKQjV8VI7X/A
	X05xX/Xn9Br9JW3KMx3wYUn1xHnCpArmRen8J3Ul9GYjL1E7AOTpQsNMI0/0nzl9CahEoSMU7qF13
	0ZXPKS/2FqOaPGbkPoclhfCQUdWAsRYG+mf8nOG3ztXH9Kpc5UT+DMdi8y+3NTHbx76kS8E4j7eJD
	ARM5e64A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svvOy-00000005IK4-16jw;
	Wed, 02 Oct 2024 09:12:08 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svvL6-00000005H8g-3nAi;
	Wed, 02 Oct 2024 09:08:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727860087;
	bh=Uv+gg59I1MzsZycm8h9V1Q3hkVJAqt42K2Jf7dWAjn4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DwCVwIfJA1qP4RmRK4wpk0QmCXyp+gA7qqrYBIIWQmT4KuLvBg96v6dj1b+lTOiGe
	 BKo9G2ZksMLz4aBfRdRftjplnLLZ1GFTU6dP1EpOKM2JtT5wWH0TjdQ47GWlbPZtrS
	 nXebW6YSstcTre7R/HbbURdRZfPT7A4i7YgzGUZD8zY3nqFpt2VCW2pIMwGZzr9F8R
	 mxAcgKvI+sIeAgo0FM5E/uoJWW6YTBa5abws/y7G1Msr0yY0d8hKAfb37412gKl9S6
	 wp+Zp4UKTOICebRymM5MmD/Nto7ItYrUofrBs+NOJPafXyj9FArKAXr0NjlU6HQ8om
	 U99ZQ5F8W+FHA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C445617E1167;
	Wed,  2 Oct 2024 11:08:06 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
In-Reply-To: <20240918100620.103536-1-angelogioacchino.delregno@collabora.com>
References: <20240918100620.103536-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v1 0/3] soc: mediatek: mtk-cmdq-helper: Various
 cleanups
Message-Id: <172786008674.33539.15432336067797076322.b4-ty@collabora.com>
Date: Wed, 02 Oct 2024 11:08:06 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_020809_351272_DC202E02 
X-CRM114-Status: UNSURE (   8.06  )
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

On Wed, 18 Sep 2024 12:06:17 +0200, AngeloGioacchino Del Regno wrote:
> This series performs various cleanups to the MediaTek CMDQ Helper lib,
> reducing code duplication and enhancing human readability.
> 
> This also avoids double initialization struct cmdq_instruction as,
> in some cases, it was stack-initialized to zero and then overwritten
> completely anyway a bit later.
> I'd expect compilers to be somehow smart about that, but still, while
> at it ... why not :-)
> 
> [...]

Applied to v6.12-next/soc, thanks!

[1/3] soc: mediatek: mtk-cmdq: Move mask build and append to function
      https://git.kernel.org/mediatek/c/2400e830
[2/3] soc: mediatek: mtk-cmdq: Mark very unlikely branches as such
      https://git.kernel.org/mediatek/c/21ab3dae
[3/3] soc: mediatek: mtk-cmdq: Move cmdq_instruction init to declaration
      https://git.kernel.org/mediatek/c/66705b89

Cheers,
Angelo



