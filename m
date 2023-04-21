Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7965C7618E
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 14:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hj+Hu6XP4pZhnNrj8Vf9alnr87ZG38XoBKlicOhSLBI=; b=D1UGF7K0ZepDv+uvbFG1HEsHav
	3jSpHhxkvY2QQwN61UspXgx3cz8NzPT+bHkE8QT3JTKZjimFwaT5cM0ZgctVsPEh6NxPFUJg9+jiu
	KVcs7WuTNLDjVPz5aaWVu3WUkXWHFolavq3U/AS4WpqbTWZpfZPk/aEBopTV844aP33rtBZMEbHDn
	XeyHDdeT9iwVxXX9nmK/V7KJdVQBA21YfFqNzwnmc7GQWtdiAU1flG/60VmTZleyAXdDQc6UmTo7K
	hs941jjcASOJiQvqCifPZ3c6IuS9XaaIj3aHmz27wwMDdpqGl7bgE88a/AvsYLG8dAUofThqaG6H4
	QMNomYlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppriC-00B603-0H;
	Fri, 21 Apr 2023 14:26:08 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppri5-00B5xr-0y;
	Fri, 21 Apr 2023 14:26:05 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CE2C7660327A;
	Fri, 21 Apr 2023 15:25:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1682087155;
	bh=yKwA0nyhzB/UO0XdgVA+ywU0OaEnb8ZR3NfuifZEl8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J5LFmSAk8QWKR7yqAmTExPhRMkzXpq/g2+oIdM1V0O3sBELjjol7TDA6hdHPe0Vsb
	 qJt5oAxcFUKp6xhCxzrPWEbhx3jTiW1KHBzNxKyhCuTqaDOupWC4xFR+jZOoCXzkKh
	 QBxS1w8anmuGcS8H07AOpmfk668OiD6cCDOML2DfIKgBAkWDFrbhFgo39Ws+ESRoyd
	 MnZ0XN8JPtNxPFEU3Jn95xSWBja5wGalfkJdbqW593g2jIJfCzP8xt4QVxQ8F5wdxh
	 LEQrxy0d9Ecvb44iqEVsYUxK6xm37pUEv4E1WT/s5X1Jg0wE4fTrbHUbli+eWcifQs
	 LlqhrN8fEnOrw==
Date: Fri, 21 Apr 2023 10:25:50 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: mediatek: Enable all MT8192 clocks by default
Message-ID: <1742f1a5-52a9-4146-bd1d-6b383c878561@notapiano>
References: <20230421111125.2397368-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230421111125.2397368-1-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_072601_472962_E03ADA71 
X-CRM114-Status: GOOD (  11.20  )
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

On Fri, Apr 21, 2023 at 07:11:25PM +0800, Chen-Yu Tsai wrote:
> Currently the base MT8192 clock drivers are enabled by default, but all
> the other clock drivers need to be enabled by hand. This is extremely
> confusing and inconvenient for end users. For the MT8192 platform to be
> useful, most if not all the clock drivers driving the hardware blocks
> need to be enabled.
> 
> Enable them by default whenever MT8192 base clock driver is enabled.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

