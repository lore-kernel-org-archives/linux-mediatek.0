Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E97AC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 21:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AR+RpptO93OXstfiAhWbUVqw4hBBZs7vD9OUXvkHxOE=; b=KJTSi7ZpAb8DN6+iDwXLRN03TU
	cl5NTrKt4FoGmKBW4WuuWs44zCyb+Zn0ayidKrqMRk2ijBhDPZQB67s/739FVhAqAaLQjgB4EcE9s
	NC683iUdMrZgCQ0rAXTvyw08hG1E7KGjQ3hbeo5ILjtxQp6dWTej3rxKO/VbdYkzwenSZfFEfSUav
	6P06cGHob6tVkUiVOcIyL5rm5UUQ5YLVF9wKZAH1eYN/jpBUmoAudB4SLZs7vUWkcLY80PPc7Yp3O
	DFUyfnnBWameWIwXnKTyqKPc7v430nEUoxzZClyexfplglcPlVp6kBKWPab2yGpWOyOwh09AfpLM4
	4RycPBcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqLZw-00EZbn-Vl; Wed, 02 Nov 2022 21:47:20 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqLZi-00EZV3-4t; Wed, 02 Nov 2022 21:47:07 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8690B66017D3;
	Wed,  2 Nov 2022 21:46:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667425620;
	bh=wr7XvMBx78CPPZbFbCo5cFsqN667CuKHD66q8hrxbsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Chs0dNoDzTTzVfBcJOaxY9re2NI0KcgqFwFCYcBI2SiP7ViF9AwVnzmuBZJ+PTFha
	 733pUwWjrPpCGTfB33H0bLV6UmKAAedHz2UKfEkrUXUZvV35TCDhfOGT03jAoN/rKB
	 1A8TEcUoKwUSzyfbQi0Mf4w43y95HOoBTc2VwtNpyRASXdGxYy35IXY9xRoRcn2v6I
	 vBEhVhPlUg08iQexwCyokTyU7YfPgPI7zF1t/VxHgK+D2dEl9ma8aVxB6y06A6oBW4
	 TqkApFf5nIlPOXJa9ejtMrYuKcRHWeK8QQw8mxGpp936vMi8VxHiKrczXPb2rzjsSN
	 dYX9bWcsjcdPg==
Date: Wed, 2 Nov 2022 17:46:54 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Rob Herring <robh@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com, Masahiro Yamada <masahiroy@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Michal Marek <michal.lkml@markovi.net>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] kbuild: Add DTB_FILES variable for dtbs_check
Message-ID: <20221102214654.axyptitp5kpq3wcq@notapiano>
References: <20221101220304.65715-1-nfraprado@collabora.com>
 <20221102171343.3ajwlkxhp7s7r36k@notapiano>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221102171343.3ajwlkxhp7s7r36k@notapiano>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_144706_341739_28CDA856 
X-CRM114-Status: GOOD (  20.19  )
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

On Wed, Nov 02, 2022 at 01:13:48PM -0400, Nícolas F. R. A. Prado wrote:
> On Tue, Nov 01, 2022 at 06:03:03PM -0400, Nícolas F. R. A. Prado wrote:
> > Currently running dtbs_check compiles and runs the DT checker on all
> > enabled devicetrees against all dt-bindings. This can take a long time,
> > and is an unnecessary burden when just validating a new devicetree or
> > changes in an existing one, with the dt-bindings unchanged.
> > 
> > Similarly to DT_SCHEMA_FILES for dt_binding_check, add a DTB_FILES
> > variable that can be passed to the dtbs_check make command to restrict
> > which devicetrees are validated.
> > 
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > 
> > ---
> > Usage example:
> > make dtbs_check DTB_FILES='arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb'
> 
> Hi,
> 
> I have just learned that it is already possible to achieve the same thing by
> passing the dtbs explicitly to make and enabling the DTBS_CHECK flag like so:
> 
> make CHECK_DTBS=y mediatek/mt8192-asurada-spherion-r0.dtb
> 
> This flag isn't documented anywhere outside the Makefile however. So I'll send a
> patch documenting it shortly, and this commit can be ignored.

Patch: https://lore.kernel.org/all/20221102214300.309347-1-nfraprado@collabora.com

Thanks,
Nícolas

