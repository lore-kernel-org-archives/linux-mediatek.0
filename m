Return-Path: <SRS0=eFaK=B7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FB45C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 11:20:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F21B02072D
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 11:20:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kqnARwNW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="ezr+nxjQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F21B02072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nZ7OQdCDcaSb1R4Vr0az1cL1MRfkH2QOkKTDHGx/I7Q=; b=kqnARwNWHq2de5w3klhtYEhM/
	yk+ZnOmdNeyUTGwmOnR7bOu4BJs5N7pKwG1OzQDjq5sZ6OIE+ktkAfszwVDjgxg8wZUHvthhHXLB7
	BS8BaVdB25X/Xi868qBhjMf/iO58Pt6ON2MSe4rvQb1y6kkAZ0T90LPZGdZsstGdUlCDUUluev7T8
	oBqRdrd3kcgQO4M5pmRa5QnZ8NYswRgf5vwr0YOtStyiaTU7CdL3d1NdCazmK50rGv9PnaZm0Ypm/
	xLXsEhUhO+Yc5Y2HNdu2bOuOSO7+qgb9QCR2ttIuAMFC7+cbVPd+Dp1erIh0fHg+oSfSClbr/d60q
	GPPcWZoWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k955j-0008Ew-2l; Fri, 21 Aug 2020 11:20:15 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k955g-0008Dn-Nn
 for linux-mediatek@lists.infradead.org; Fri, 21 Aug 2020 11:20:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1598008794;
 bh=3hICDB8bk52dFVQc3BFBE3kOtnHrBZBdOB6EMWbL2iU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ezr+nxjQcTM0EXZeL2InQ6WmK/7rFPvFMtE/ME5vtM82RfRY2MJH2B8pBYiNLD8PC
 VLfSHjUxIde5mOIqhcStoCw9xdmVHktVbyGieg9FYIjmdir5aJhgok23hsIVwQXdWB
 zitkD87MAklsRdjUBecFu+oBhMKn5frAJkGzeS2M=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [185.76.97.101] ([185.76.97.101]) by web-mail.gmx.net
 (3c-app-gmx-bs37.server.lan [172.19.170.89]) (via HTTP); Fri, 21 Aug 2020
 13:13:02 +0200
MIME-Version: 1.0
Message-ID: <trinity-299eba1b-59af-4257-83e6-7387e9fcf865-1598008382125@3c-app-gmx-bs37>
From: Frank Wunderlich <frank-w@public-files.de>
To: frank-w@public-files.de
Subject: Aw: Re: [PATCH v5 3/7] drm/mediatek: disable tmds on mt2701
Date: Fri, 21 Aug 2020 13:13:02 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <0E911554-482A-47C2-B2C6-136486C5ACB5@public-files.de>
References: <20200819081752.4805-1-linux@fw-web.de>
 <20200819081752.4805-4-linux@fw-web.de>
 <f68cf4c2-6c79-fe46-b7b4-bcc49e0b6b69@gmail.com>
 <0E911554-482A-47C2-B2C6-136486C5ACB5@public-files.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:qQ4/QXcY7aHug4GJ2xC3UHeSxq5y48c2pvLvlG6DRO/NMKGYWoyQwtVQ37sT6Iw2tCo9j
 WCKmpdZA+cTKW69yQWXhnYpUZUmALV8zop6WyiuuqnOlgKYjp5SDOuFI4iXNCwt0xaMW577Qsf4d
 GPoF68X2Ms6m4c7uyd8zyf3lCvsTyHOwKsTRThS9n78XKRGZpOuXSHdczxiiomx7Cb1MK4H/5baj
 nrYfg8g1zE46ft9EsWJp9+YZy4LaebVzAcJAxu6PPD9DeHN3zUo3QGl95pZbpvqgABWDEm8OI5H6
 Pc=
X-UI-Out-Filterresults: notjunk:1;V03:K0:uQ8dr8ujp0Q=:Eua4yDiKdePNpB1qcZiwTs
 To9A+Uk+d8VeKwVsZv5QS1gEi1U5uqLejxLQXFWWmoupzS21Z2YGzSFwbYEG+sfYqfZySLP/b
 ayB8t8k0hEqwSV90mqQbBMI4KYddnKVW2cC+Cr3uO7tDfpwC6/6BY/s69BEjaPybXWEpA9Kc7
 w2QvTFYKTv9gPicHeNjo2Q6P7mPgsTUjleqbNEbaF+7FllK12bVkKcyTckD5Dh43X/ZUlEq9o
 U0K73vrISimYzxNR4aAynshnt3Mo3f67HtZWSrr1hNew+IcaIrj5JnMIZsxWEtIW5BwaeKvPH
 BPg0EiQAj8RNiIohqeWy5aXB3eJOQ7BLeETENJEtP1+vjtc0T6T1w2FDrXjf3jTwdDdRzIpia
 /4IBk6jd/DvJ+mT/pD7Er5kJEZxnDy2IpDBLDuZDiaIIJhj5KTHKx6yE/NE8N08MxNniDqgYZ
 QCp+Wet7lIO2CsJ9IHUI38ILnQJIBXi+z+SMXHNjZkQad3oiFCaICpACr/D5K9k7nT4UXb0W6
 zqdG3bX9jjWfqyaMCiuIAo9bwed2go2i747nEufOMfdGDUhd+pk/A9EesjxHJe5TZnqfEVMaM
 I/wNsxOCtQaa7SCsmestcGOK7W5NOZbB97H46JQsI1wBX1uQwq8kfWIr1wDb43yMuCM/nHfGw
 Sx3v+qypeM+9LzZMaJjNuaOzOx2wvU5b5sKU3ClSwGa/5kVcSKeBGR+po1WIbMwXSQoE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_072013_049807_2C86FFA3 
X-CRM114-Status: GOOD (  11.45  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, chunhui dai <chunhui.dai@mediatek.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Frank Wunderlich <linux@fw-web.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> Gesendet: Mittwoch, 19. August 2020 um 21:04 Uhr
> Von: "Frank Wunderlich" <frank-w@public-files.de>
> Another way to fix it maybe not enabling it (use the flag in mtk_hdmi_phy_power_on) there instead of disabling after enabling it.
>
> Maybe this is less hacky than current way (as ck hu pointed in v2).

seems my last mail is not send right (did not got it from mailinglist and it's not mapped in patchwork).

i tried this approach, but this does not work, with checking the new flag in mtk_hdmi_phy_power_on and only enabling tmds if this flag is not set results in same behaviour like without the Patch (horizontally distorted image flickering on 1280x1024)

- hdmi_phy->conf->hdmi_phy_enable_tmds(hdmi_phy);
+ if (!hdmi_phy->conf->pll_default_off)
+ hdmi_phy->conf->hdmi_phy_enable_tmds(hdmi_phy);

seems like tmds needs to be initially enabled and can only disabled later

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
