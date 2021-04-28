Return-Path: <SRS0=j19f=JZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16948C43460
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 09:49:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6B9E61422
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 09:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6B9E61422
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r90tozlwH5Nv+TTSvhpXjI1He3mIZuyoc9ZupxR5Bac=; b=qIq1ZC/DWkQb+1D6Cyz2cwzyD
	PCvpbayORj+zTeEYHxHy0Mba8iPPHMDhrWv2PfRC9TV4cNRGqb91b91sXuw7Z93RZKAMVwdxLLy91
	KL08wHUQWG8zP9ECE11sqDvGL+n1+YLKrWH8QncZj9wZ4fYqJGAMJbNqH1vkIi0tPJU/MC3069ecz
	w188UDLWmbS4WMxz0/++uVzXRTNGHnt3wpQQ8JNY2kvnX3xX440U0ffyTnjEQ9kAu0cvvxaY6lDbN
	z0ynzsaWHaD9Tja6hTdw/HXqLdr1tramdgHsDlvr1M+Bytzlxiw2g3LiZD5ORB0tSakV4mUg5ghdD
	RRcmqWv3A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbgoy-003Dlf-6W; Wed, 28 Apr 2021 09:49:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbgoi-003DkO-Dt; Wed, 28 Apr 2021 09:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:List-Id:To:Subject:
 Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=q5937lHE6lQgj4oeOJSpZTrgoZeayCzBp7qxgHHB17U=; b=Zg6ZcvEX62SOWccPD8kzmiuRde
 Fnejecjz48DhCYG6ArINobPwJ2v/RMcn+Fbq8UanDBzyOhlaXCPgdDutgH97JU2CSdX0YF+OoUvoF
 Z1jH4dK8FThoDZChiQj8mw3i/D0lqLui8rXBMfqrtxBlJUWTxeP+xmlfAiik1lmIxflVCp81mZ4ur
 xBpSW4OHA93pNEMcLP7SEZeNLK/GejggAYjhBpWgHB+BzsGMXzhQfBnd5lIfGCX225ZYkFhJarO+F
 Bxt07gh3BPxE1TMMZtAByPcS4eC5GsLdujkOKIj6X5s6VRmrl14u2wffTcaOk6GAKetnvqBW451/o
 EpfIvAxw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbgof-00HKPd-Uz; Wed, 28 Apr 2021 09:49:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 70461613BD;
 Wed, 28 Apr 2021 09:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619603349;
 bh=BTpapuBCvK1/RzTALLtgh0umCIaMOFFwyezbD4WPKjQ=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=UvxFdVJnsaV4AMVcrtTvvZ8Rc5pR44xP8smCLBpiGXp3mhF6r+DA/DFKjrMRBoLAJ
 c1FiRnjTYjS6mX6MYcLVsxT5wE1hZiA4cRkvu/wvMKSotRF1AXlOtaxS37zvf3cojl
 Nsv/Z1ARxtgSrOfLWyk9NThqi3TMTqGeSp+YOgyqgkhwxHYxdXxeZhJE03sP31pAzx
 3WQ5Ea2+mGIOsfz+ruqQy0byC9OJxogMYRrZNFhM3Ka4vjC2VsBxzeECW0zBVcDqfJ
 AK5fTCg+zS9GADlFnqCM/BWzFeEOUjCCbI7pcb6AH/GPoLBoStUrEastBAY9zi7EEi
 qAUYZWymAhltg==
Received: by mail-wr1-f52.google.com with SMTP id n2so9173074wrm.0;
 Wed, 28 Apr 2021 02:49:09 -0700 (PDT)
X-Gm-Message-State: AOAM530khLsL8nOkE4hE0jRkfacDgS4YUEELiw+qAdN+8wQtN53W7Pxp
 yXoPXeC+OAeMqejcx2N/7FCvJUHhMHn5IYvUYLU=
X-Google-Smtp-Source: ABdhPJwxYZOTgwv5/iaUwcCx9k5yg6cFv27JHM+ZB0SjvTqa2xFdivG1Y2/xDb19d5IfIeNHas5Zl6K9joPLfnC+YGo=
X-Received: by 2002:a05:6000:1843:: with SMTP id
 c3mr36114955wri.361.1619603347393; 
 Wed, 28 Apr 2021 02:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210427210121.1080364-1-arnd@kernel.org>
 <YIj8sySF3W0x8E+/@kroah.com>
In-Reply-To: <YIj8sySF3W0x8E+/@kroah.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 28 Apr 2021 11:48:34 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3Fae0B+3KTqWx_f1nTUhr5sKfYMRo6zJHFQENo-KTjzQ@mail.gmail.com>
Message-ID: <CAK8P3a3Fae0B+3KTqWx_f1nTUhr5sKfYMRo6zJHFQENo-KTjzQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: nvmem: mediatek: remove duplicate mt8192 line
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: <soc.lore.kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Ryan Wu <Yz.Wu@mediatek.com>,
 SoC Team <soc@kernel.org>, 
 Fabien Parent <fparent@baylibre.com>, DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_024910_057080_1091ABFA 
X-CRM114-Status: UNSURE (   9.44  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Apr 28, 2021 at 8:12 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> > @@ -7,7 +7,6 @@ Required properties:
> >             "mediatek,mt7622-efuse", "mediatek,efuse": for MT7622
> >             "mediatek,mt7623-efuse", "mediatek,efuse": for MT7623
> >             "mediatek,mt8173-efuse" or "mediatek,efuse": for MT8173
> > -           "mediatek,mt8192-efuse", "mediatek,efuse": for MT8192
> >             "mediatek,mt8516-efuse", "mediatek,efuse": for MT8516
> >             "mediatek,mt8192-efuse", "mediatek,efuse": for MT8192
>
> Shouldn't you drop the bottom one here to keep this in sorted order?

Indeed. For some reason I assumed they were meant to be in chronological
order, but you are right that the others are all sorted alphanumerically.

Fixed in the arm/fixes branch, it was the only commit there. Thanks!

     Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
