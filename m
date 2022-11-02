Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6781AC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 17:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DPHZpM3T7GNUF3PTGT7s1XMij8yoCB+al63ICZ+iTrE=; b=1kCjXWeDLjuneOwZRaGK3Sy52F
	k/vdopUkx56nImHFVY60Z8B+mJoLz9MHgEFC24b/eXIlJMsUpP5c8KIeQRTTO9/NnmaxPbilPZRLp
	Cq10Pt4WgBE3pAktyz5N+0LhpeWV0GoiaUDdguhJ3rwyJdWdvUl0rtORdYnHL35FskIqLPp6DGQ6d
	q1ZSe2gIhnzVPbFJ00V/qYeuquU+N3RGYXejC//3cNYA1TwsH0yBvAqM6dO6/HZO3M6FtxR4FPZcA
	FX3CB698tS4EVrm6LQK5RMimmRFq64D/XfjIAJXSeTMHBygIZ+JJ6mGpnGiPUAdg/Yh0Nisj+nijQ
	g2sRs8Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqHJg-00CQwD-Qx; Wed, 02 Nov 2022 17:14:16 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqHJH-00CQeW-9K; Wed, 02 Nov 2022 17:13:52 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7AD0066028C5;
	Wed,  2 Nov 2022 17:13:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667409228;
	bh=ji3U3ak5nD4n2XqIAQUOdY5r4XOdv7SBDqXsn1vBOFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zf4qXkpxiJryyHIFvuayAUpf1EuMA5gcze3C5zcESUQ6vpKd3JyYDTPb1XEX30Wk4
	 KZ602yOuRgovIHUP0WKhlBIm2sNL5RjCrstCvglykMSu5sPoq1XIj81n2In596xdKs
	 XFuq7m28o22PWxMzQpyVWJunDOBC65ReJDfTHUsG6XC5d5beOmE/tjoOl57X/H0Eqp
	 nl2NuVcqzShS9+SUDsAVcLS9j9zuNBFItKupOW17AIqlo7AZvJTIejqjN9BasEludZ
	 IebB2Ycy3pq1AEQYAojmIkKLxxadejxmZIc2S3Qldti/p0V17zaAkhmgKGeo5swe2/
	 TRyF4vZIc8FSA==
Date: Wed, 2 Nov 2022 13:13:43 -0400
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
Message-ID: <20221102171343.3ajwlkxhp7s7r36k@notapiano>
References: <20221101220304.65715-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221101220304.65715-1-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_101351_576119_1F010517 
X-CRM114-Status: GOOD (  15.39  )
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

On Tue, Nov 01, 2022 at 06:03:03PM -0400, Nícolas F. R. A. Prado wrote:
> Currently running dtbs_check compiles and runs the DT checker on all
> enabled devicetrees against all dt-bindings. This can take a long time,
> and is an unnecessary burden when just validating a new devicetree or
> changes in an existing one, with the dt-bindings unchanged.
> 
> Similarly to DT_SCHEMA_FILES for dt_binding_check, add a DTB_FILES
> variable that can be passed to the dtbs_check make command to restrict
> which devicetrees are validated.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> ---
> Usage example:
> make dtbs_check DTB_FILES='arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb'

Hi,

I have just learned that it is already possible to achieve the same thing by
passing the dtbs explicitly to make and enabling the DTBS_CHECK flag like so:

make CHECK_DTBS=y mediatek/mt8192-asurada-spherion-r0.dtb

This flag isn't documented anywhere outside the Makefile however. So I'll send a
patch documenting it shortly, and this commit can be ignored.

Thanks,
Nícolas

