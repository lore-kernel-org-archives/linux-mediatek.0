Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E884C761A6
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Apr 2023 00:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/3qF5QMycycn3Ifdvu3IGRV4MhWdzkinRZ2DT7WrP4Q=; b=CXKTuaVfD5HbFKkFxxRqLrkxiM
	nwNNFFFmfHfU7XVc22G9Vzp3BqR0RU4a1IT/eMJwMLgPs/MxNBU0GtHURJMB0a3UE4XnP27Z6y8Vb
	o5fGtu498qXMjKcpE7U+ixwIf8dh/hT15pAgtaHd9B4KH+FjDksPi22VGP45tqzby0Bl0xYz2EUjT
	drxCOjnZO1+8OHqBkbD7Y2BL7wXk+ujcbsL/NtGgvrtLxNfxpZYEGhafYCBFCVPq+u4AO3V1moLso
	KUq7LXWCQWMcwZZdTChPrxXtHI3qx2q8I/MZhcQY1DkQZ4wvbDG1plVtIs7EFtg2Zk3iDj5ndjPmH
	Uz6ylPEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piOk3-009GSm-2i;
	Sat, 01 Apr 2023 00:05:11 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piOjn-009GFX-1V;
	Sat, 01 Apr 2023 00:04:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2C4CEB832A9;
	Sat,  1 Apr 2023 00:04:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E190CC433EF;
	Sat,  1 Apr 2023 00:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680307493;
	bh=/3qF5QMycycn3Ifdvu3IGRV4MhWdzkinRZ2DT7WrP4Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=q4Wd0/H9s1SBBon3vtYZQkyns0U1346Qr02mSd9NBb60ablN0xkVmrhF5y4h4sOS/
	 LZR1SQ5Ozxr1ZhHbT/kv/f/Mu1/M0H/GAp5/7/d0mPOjClG0O3VSi23JNmDizTXubU
	 1042KBix6eCHOquJHfspFpvTjbvG88VmwJv321ZcKznRcV2CiMVmWu0tCYPxJoDnV6
	 +hMal843Eb2WK7fu3AjZhnE32YptBvQUap2//+Dy+C/yp29iWVxgyEkSEhkeijjB1K
	 8+Xq2XiWbmZCRe1v5sFerTJMt4kHW8+z6vyRaravVczhdGW6V1LKbvUhSWSKkWk+PE
	 /fBs9F76d4Pzg==
Message-ID: <85b562634468d54b0761fff9c7e21a51.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230331123621.16167-18-Garmin.Chang@mediatek.com>
References: <20230331123621.16167-1-Garmin.Chang@mediatek.com> <20230331123621.16167-18-Garmin.Chang@mediatek.com>
Subject: Re: [PATCH v8 17/19] clk: mediatek: Add MT8188 wpesys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, netdev@vger.kernel.org, Garmin.Chang <Garmin.Chang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Garmin.Chang <Garmin.Chang@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 31 Mar 2023 17:04:50 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_170455_651939_BD8D742D 
X-CRM114-Status: UNSURE (   7.29  )
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

Quoting Garmin.Chang (2023-03-31 05:36:19)
> Add MT8188 wpesys clock controllers which provide clock gate
> control in Wrapping Engine.
>=20
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---

Applied to clk-next

