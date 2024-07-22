Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A28CC3DA5D
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jul 2024 14:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f63c3R5AaO3G4m+kG7QYQwof/dHA1YfJmkPVkwVDp3s=; b=Q6w1b1+gP45LyylDhjhpVk3HaW
	fggwK0egJXs+flsmKt+L8in7Y8NzwJ15LR1o8DzMFFn0wGNwdnJalkAJKAIWmLa1ZV5mOJYwPUBf5
	J44ZlXuAiPBY8aW6/goIYvyvwgbBNxGWih6klt7kUg3X8UtWPo4A/cwi0UlNtm4igTxyURi2zi7QZ
	Fke21hwF1FhnR9uBF5YzCdUexhPOHo4UMuIRTb87UeOf81SPQQ9EU8/bbRqQVile1WeaumFluGNvm
	4OoD/BqBW7kVa/n+yoPD7y39cMgeoLNYXA1Nn/2U9K0B9IkWpspNLUK8PXXVvHemDOWPmhZAGWpN1
	ZOjUFpig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVuQW-00000009qRH-0lf5;
	Mon, 22 Jul 2024 14:54:12 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVuQ7-00000009qJq-0yk6;
	Mon, 22 Jul 2024 14:53:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721660022;
	bh=ReJ6PIw4rNKKvjtKFWY7U3j9FDNjTAGJ375FqNKVD1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QE6SvFrZXY9RlL7OIqqF0pMEBZndfkhJcS49Wvl3dyWdMPjVDqoWFPTnE6C452FEP
	 ZRe+0qzLzTJKR1XuZbZbiXzunsc/SiyBL0AsygI5DMztO2nxLHtQji0JgtG6juH/n7
	 yhY4feI+mVqEZdxMMc/GDrUX8j4qLpXn9xy2oGY8sPqU0HiaOs6N18Mk6yqt138M9A
	 LCnR7UacjOIcQRwXsaHpLt7Y+f/6zmErQCJhnp09ypYfFQuRbYICX+UGiSP217mep/
	 zSSoOQFcV5WwAcEWihxAo0qaqwKur74BpWYPB5W49T9aFc36+KT+mpw0BUz7YblgUE
	 L2x6ncpUeYHjQ==
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6B6783780523;
	Mon, 22 Jul 2024 14:53:40 +0000 (UTC)
Date: Mon, 22 Jul 2024 10:53:38 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Macpaul Lin <macpaul.lin@mediatek.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com,
	Chen-Yu Tsai <wenst@chromium.org>,
	Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>
Subject: Re: Probe failure of usb controller @11290000 on MT8195 after
 next-20231221
Message-ID: <fab8e144-e5ef-4ce8-a74a-89024cd95100@notapiano>
References: <9fce9838-ef87-4d1b-b3df-63e1ddb0ec51@notapiano>
 <064935d8-fbda-4eda-b013-8c8fc63b561c@collabora.com>
 <375b2345-657a-4b8f-b5e3-dc16784ffde9@notapiano>
 <da27d957-866f-f055-9e83-cdc362d98dc7@mediatek.com>
 <2dba1638-f155-463b-8f87-421101b8f4f2@collabora.com>
 <521df3a8-5bc2-4e81-a819-02b755c88d3a@notapiano>
 <ac0d1ba5-1ed0-4d4d-a287-1d3e6efadc0a@collabora.com>
 <ea97fb15-684e-4009-b312-f39c2acdde5b@notapiano>
 <9f12777b-b8b6-4d34-b336-7637e551b552@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9f12777b-b8b6-4d34-b336-7637e551b552@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_075347_441438_0051082F 
X-CRM114-Status: GOOD (  12.49  )
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

On Mon, Jul 15, 2024 at 02:04:54PM +0200, AngeloGioacchino Del Regno wrote:
[..]
> Besides, I also noticed that the CLK_APMIXED_PLL_SSUSB26M is missing from u2port1
> and the reason why it works is because other u3phy0 should be enabling that before
> u3phy1 inits and/or before the USB controller using U3P1 tries to initialize, so
> while you're at it ... if you can please also add that to the u3p1, I appreciate.
> 
> 			u2port1: usb-phy@0 {
> 				reg = <0x0 0x700>;
> 				clocks = <&apmixedsys CLK_APMIXED_PLL_SSUSB26M>,
> 					 <&topckgen CLK_TOP_SSUSB_PHY_P1_REF>;
> 				clock-names = "ref", "da_ref";
> 				#phy-cells = <1>;
> 			};

I'm not familiar with the clock topology on MT8195, but I noticed the
CLK_APMIXED_PLL_SSUSB26M clock is currently only present in the USB3 phy nodes:
u3port1 and u3port0. You're suggesting to add it to a USB2 phy node here. Is it
needed by all USB2 phy nodes (u2port0, u2port1, u2port2, u2port3) then? 

Thanks,
Nícolas

