Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48C0C4706C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jan 2024 12:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dE/+2LovMgmw9hBZ6Ne/A3xHD1SQLb2ddq49yV1by2k=; b=IYDI5Yva9Q8Q3nbZ5dvrTZM3D5
	RpnXHjR4QuvRNbMA+HQFgC8e4W7RXCjoys55+qcjw/SmC8kzocWwNY5ehFpO1E2w3+oHRwo+SX8ft
	B3rPWrSW1FviOE45BMt6j8w6a7mKsm0/kdiwOYhmT4ixbtpKW2iTdZvDckM1XbbxRgK1uW1sepoEP
	MqM0V9d8QUKIdUR/Je+ovP9skT1bTLeZLN9dHJ6jORhJvsGfgyfOjOIPBKDF1YH8v+wIgsIGWjJG8
	5djml6oF1ZTdnJWG832U/ZN0ZMzXK/nrQ6jqMeDuyd+T8ReXwpZZXOW/EZhrkHxl4qGKcjsD66Byk
	QkyIjhkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOGWd-002oT7-2r;
	Fri, 12 Jan 2024 12:20:39 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOGWZ-002oR5-2R;
	Fri, 12 Jan 2024 12:20:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705062029;
	bh=i8hxiZtStqbbjhK8/jOTH1x0pnQ0MfzuFS4C3hHq9Ko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SD9oSjC6pMipZ5XcLfnAjzmwaDrWiehIl98MAk5QfY84ZmVKwATxN87MyJAZODQm0
	 fQycGjGiYLi4Rowc5HVHH/mDXF8rb6d1vDTWLSQgITwC4mNd2lKh1nKhuQ9t/kcLTL
	 7Y3jcbnrIKmhXTzUcHyalJ6Y7b50maKTJUBMTLp5dpRfyXtzkT1vuaMWwRb+vfHNv/
	 BWuT2y2dfkj16gvvThNTcTqPYaQTSjgzYdV/gFrExrT5q7z4TjknGBgir2j0AN9C9q
	 KJgLLs15Wx0Pa7xVtCJPkqvgfmCu2kCXE+L3ss6LxSa4xj5QjoD0PypOfNPUjC8x/p
	 yttkbbWUvm0hQ==
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C9F873782017;
	Fri, 12 Jan 2024 12:20:24 +0000 (UTC)
Date: Fri, 12 Jan 2024 09:19:52 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
	Conor Dooley <conor+dt@kernel.org>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	Ikjoon Jang <ikjn@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Stephen Boyd <swboyd@chromium.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: mt8183: juniper: Remove CrosEC base
 detection node
Message-ID: <cfa39af2-936d-470e-93ea-adc2a632849f@notapiano>
References: <20240111195335.871096-1-nfraprado@collabora.com>
 <CAGXv+5FKHX482+QjYP=jWKWz2HD=Af6x9Cahi+fc4EKNmM-MMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5FKHX482+QjYP=jWKWz2HD=Af6x9Cahi+fc4EKNmM-MMQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_042035_994461_32E382B7 
X-CRM114-Status: GOOD (  16.42  )
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

On Fri, Jan 12, 2024 at 03:10:12PM +0800, Chen-Yu Tsai wrote:
> On Fri, Jan 12, 2024 at 3:55 AM Nícolas F. R. A. Prado
> <nfraprado@collabora.com> wrote:
> >
> > The cbas node is used to describe base detection functionality in the
> > ChromeOS EC, which is used for units that have a detachable keyboard and
> > thus rely on this functionality to switch between tablet and laptop
> > mode.
> >
> > The juniper-sku16 machine is a convertible, meaning the keyboard can be
> > flipped but not detached. The detection for the keyboard getting
> > flipped is handled by the driver bound to the keyboard-controller
> > node in the EC.
> 
> We could do this for the whole jacuzzi family, which are all clamshell
> or convertibles.

Ah that's great info, thanks! I suspected so but since this unit was the only
one that I could actually test the change on, I decided to stick to it.

I'll send a v2 removing the node at the jacuzzi dtsi level then.

Thanks,
Nícolas

