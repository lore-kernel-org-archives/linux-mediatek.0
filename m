Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18EBDD31A15
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jan 2026 07:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ckEQlhSo0uNjJNCffM8K18YS1pvTsE1PMOujyFxuJ8=; b=vmDjnPunf4EMsa6Oy6rkj0Cxii
	I51a40ojqT0EhZGZFjFe47CBNfZ3hnznjDY+3kf4I0rJbqRPrI09PgSIVGvZ2lw8540WOiOz6k2y3
	513Ogd7LDKJAZkRDBHfqbB7ouBGmQzD1laUQ0U2i+Nwyd45WOM24pHzNHTK2BnCI/uHh0Jpwp9V23
	wtPv2ycJIuJHckJpwx4Ornm5BlnL+lxW4dsaZYfuLTrUdfW8GVmQMknn4YcDKRCKrGJgoSA8BDty5
	pfWNridtCQfpjBoLS+GeuGLe6U4tvGu3rn0mwSqHfG3POvnvEemAXx6Fjp9Gb0fUydOd859igAVT4
	kTS3NrAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvQQ-00000008Czr-2pbN;
	Wed, 14 Jan 2026 07:36:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvQM-00000008Cyn-1umk;
	Wed, 14 Jan 2026 07:36:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0E1CE438F7;
	Wed, 14 Jan 2026 07:36:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41D50C4CEF7;
	Wed, 14 Jan 2026 07:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768376172;
	bh=219ZNTWKZ6kYNfbXo9YLqM426s7JXbLhIYA12mOsA0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jPWwJoi85/9G7Kor36Kuo2Ljoq1U8Lu1svFRPTWiDIr7VirV/wSvCD5FgJkp3IoQq
	 Pt2NO0suJtAPSzuCDGwHxEjfA94Gv3gb4+6cTGa1uyoq/roLyF2lAp0qhMbSXI6SC8
	 5v/MMIoUP/5A5o+4sBe5HlWkkRD2ik3fzMw27grfHn6e7C+3i6zJ8o5QZDp3BnZoFL
	 jyGwsBMhVkpSWVQDZj9ImYjPEXHs6xhQ2t6nAPRZdYrN22RSsaCybXTjoRjsxXxmHR
	 Rerd1NgIifYsH/lGQFcXDBmgrclOmIxvQKWNd2i5usZTicWX3746OTqnAKd0/HtDSJ
	 8pIxYxGxQZ8wQ==
Date: Wed, 14 Jan 2026 08:36:09 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andi Shyti <andi@smida.it>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Qianfeng Rong <rongqianfeng@vivo.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>, 
	Qii Wang <qii.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v1 0/7] i2c: busses: Introduce and use HZ_PER_GHZ
Message-ID: <aWdHRszwPfcniL1q@zenone.zhora.eu>
References: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_233614_534400_127833CE 
X-CRM114-Status: UNSURE (   5.98  )
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

Hi Andy,

> Andy Shevchenko (7):
>   units: Add HZ_PER_GHZ
>   i2c: mlxbf: Use HZ_PER_GHZ constant instead of custom one
>   i2c: mt65xx: Use HZ_PER_GHZ constant instead of plain number
>   i2c: nomadik: Use HZ_PER_GHZ constant instead of plain number
>   i2c: rk3x: Use HZ_PER_GHZ constant instead of plain number
>   i2c: st: Use HZ_PER_GHZ constant instead of plain number
>   i2c: synquacer: Use HZ_PER_GHZ constant instead of plain number

merged to i2c/i2c-host.

Thanks,
Andi

