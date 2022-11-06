Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A486C4332F
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Nov 2022 08:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HTNFq3TyDhFyNWIAWgSh9mMvlsrOJm3pLpGjJrBym60=; b=JBEKC3t9hpXmiFZ/dDAa6Brm/8
	dC0xAVCqubuHvme5Swid6fk7z1twUY/P01plMPJSIkecP8Qock3IMxjwle0cnZWYt/8rAI/CIG5/2
	zpfm7lsZ3P02h5EddJaH0Tzepbd4WmiDEhti/wGYKfIv1bYbZt3oBOIXaF/pmfxlZYxjhlc46xKUB
	w+hBNGzWnygfMxiijnEmh4tGPh7sJTNyVbpKEDDJYbg+DHrllGYCvoPMUJno7DSdWot6tbOfQfsyX
	G+JLWC66SyKjKqOlf+HU/5iAzxmQ+P5OqvqWFae0wiVM0u34dxpw2Tlvo6h8s2CDylaPUp4FUReDS
	NWFg2EOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oraiU-007gin-LG; Sun, 06 Nov 2022 08:09:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orai8-007gcJ-Sh; Sun, 06 Nov 2022 08:08:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HTNFq3TyDhFyNWIAWgSh9mMvlsrOJm3pLpGjJrBym60=; b=HWpWhuWLPRUJ1f2Wpzdw93WSnZ
	HEPJAUKpwP+6llBO7co5OtIlZ5zlIeyxmggY8yOxABbeZUG0uYz/Ahz1Giy9bwo1XJywyVhQ/Ozgv
	r83cr76mFgyj0ozENG5SsUZnMfl7/9UK6L/n5WCzcmecEhGThpFm4n6jsBIvcwE+jmAmAMm6mHlZi
	NvPvViMzTPRtfxFytjobVI7xWnMRS3U3OqnLF0ztdPPhQa2klKN98gWE+WJAuyJtA1lWiVKeVbBdC
	Yz3Vns5iw4KJZmhHxCZZL8A07q6DqZNTZDJmWe30qGVPkfPtWkS2/qS0RVbJOyoa6Z3ojpZf9E8Dw
	gsD+1uTQ==;
Received: from mout.gmx.net ([212.227.17.22])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orai4-009UqP-Sf; Sun, 06 Nov 2022 08:08:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1667722118;
	bh=HTNFq3TyDhFyNWIAWgSh9mMvlsrOJm3pLpGjJrBym60=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZTjTIQ5tgWtBUGXuP5NdP2uWnuhLQAE5DIvsBGFvFVQXIgtxH95sdOMg5coexIt1t
	 LU3Ic2UAKnGsoKOeHAKbUSFJ/Qm3keYE4n6APEz96aLcglUD3C167kPei4c7qrTYMa
	 hsOpq51y9QjW4nAmu5WUkII0FC1g18+fL2HOiFFhrHunj/BUf3gaTnoxfBJgYz5c1/
	 isDVTeeCDf0TLNPUJ17Oj89JjzG7nHbO0kYA8PUh9t9C6PZp9i/TnUoLweGs3F1xf7
	 1Usi2TKKA0HRnpP77wMAVfbUkcXVwzEO+ea8NtJex9hKdlJqTOIP9lOM1FHOhJBm+O
	 py0iCkJnl9fcQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [80.245.79.199] ([80.245.79.199]) by web-mail.gmx.net
 (3c-app-gmx-bap30.server.lan [172.19.172.100]) (via HTTP); Sun, 6 Nov 2022
 09:08:38 +0100
MIME-Version: 1.0
Message-ID: <trinity-82c4e225-5699-4c03-bc04-cea1a2d5b3f6-1667722118679@3c-app-gmx-bap30>
From: Frank Wunderlich <frank-w@public-files.de>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Rob Herring <robh@kernel.org>, Frank Wunderlich <linux@fw-web.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Sam
 Shih <sam.shih@mediatek.com>, devicetree@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@kernel.org>
Subject: Aw: Re: [PATCH v3] dt-bindings: pinctrl: update uart/mmc bindings
 for MT7986 SoC
Content-Type: text/plain; charset=UTF-8
Date: Sun, 6 Nov 2022 09:08:38 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <trinity-93c64b9b-8363-406b-aa0b-07e6802ec84b-1667660667233@3c-app-gmx-bap26>
References: <20221105092500.12145-1-linux@fw-web.de>
 <166765939212.4158869.5881767839110614067.robh@kernel.org>
 <trinity-93c64b9b-8363-406b-aa0b-07e6802ec84b-1667660667233@3c-app-gmx-bap26>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:EMz+lrjrmCAlVksKsxn0azOOpK6Wc0cDQzr6u804gLqwdXRbJ4LHgABsPteviC2OPicw4
 WxfBVlWrhF7266MetBJotdeEWiyXZHY39hQBpuHumEq+TfQKASSJAmgYhwwoUiGlWHk5X7nd8xA1
 UpRbSg1Acu4cncnaKDj9Ohl80yxR1+nngsjhuAtwXOKEt9UI0e2SIeKwr9z2fgh+xZAjV52U9tEW
 0/4vXcT8btC+yVpyyD398y70mKMoilF9kx872A8GbPyyDcuBiDRprr8IatT3CyT1ahJZFB98JHhJ
 /c=
UI-OutboundReport: notjunk:1;M01:P0:MfjkpulsvRo=;ruPvxJlI/AytI0KCjmc/m9Jb5B0
 LEXvXaJ4IfVEvdWDwgbnQ/4sJNiKRUnfcehTucqUxeeNVPdZ5PUuIpYhGCnNOuE7Xk4Wgjyt9
 +4A0hqMM887wGdHYRkWBaH5QnSPGmwD3uuF1qcqnWmC5i7QwD+eGZbrkUSZEj0ElO24Uotjwb
 iGMtSvCRqNzjyyOLIfxvSenK43IhTuNOLyJkCs4W2VRBYyjqLRbKNkb/6V+bJL/BZtXCDQIcH
 FKlqh+LgsxMd+dYBU3SB5X0+rZnCrpSJvYvczd9gzFjjXcz7vlqLF7gOx6s9ZMgFVRzThKTNp
 TwcNewLIBNCWJGJQeUQoDPPE1qVN5NcLRBc4pYCMmVgPkr6Xr+IcQZ/L+D7pHJ2GkVAyPhDiA
 j620Cc0bWhRSVyysSwvL5zcUqHVfgD4bg4SbbTOBTvz9aLKh/azEwP7THrXQyJKK5EVIcpo+r
 XKmxiMvfRg9t6MetmewF6tcFaPzXLF3W5SUbTKTIhR3x0DoqRjWva+s0nvnfIP9ohML4Qly1c
 O7vSQM8SBx5t0rJhPMUYEdz2O6clAgjNslemg2KfL7kzAyxZtuOfTmRBYiITN4hIpNw11YnTY
 QJKqblGyimCwVXscTOplYBqSh6IAXXSshXIorjgpz7L3imSvcfiM3lGX++NRVB4TLQxp0LQBG
 dMX7y/dkdkxJ/y9UC6/ZHb/D2K8y+ibHRLf6SGBDQNmTXmRoyVI4yrGfESOkNBb+RTbAza79Q
 GxYxKKW9AJuTfF4S4sTe1Bx5Xl5Hz8pUM6NEEqtO2Xfb9SLlYyQb7Xpl33qTpoQF8+fAVgmS0
 6FwWtkqCEXc708UOtCdy85Mg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_080853_555248_233B1D89 
X-CRM114-Status: UNSURE (   6.15  )
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

included this Patch in the pinctl series here:

https://patchwork.kernel.org/project/linux-mediatek/list/?series=692462

regards Frank

