Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E758C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 13:05:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD52022CBE
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 13:05:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hl5+vrTy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="G+5TjWI2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD52022CBE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cymJSO7VhhNfKsVj+snWp9oGZRlZ5Pd2+Py7R3RaZGA=; b=Hl5+vrTy8G/FiGvzLvdSTLeCT
	o2T5WAi5O2r5a9Bd/TGgJWgg4r0vow/9mgfNicGVpdeRIp2r/3gLQ6mdlp7E60EGAU9teGZB9I0PH
	PKKW8HSY6+zebmOIwjdxqwTWv7/X6WUfl/gxUn9WajINb4UjvDAaE7VEmaBi4LOAEXXEEPffg/ow1
	6EIM8651tF3BkNbHy+T9hg/b2b8zLWh2GINUqzk7Zs5bvgJJedyP1y7lq2c5Cyg3t3Q58rsHD2rK1
	vWb+D7U83UzpJgSDfmvNS3UT34BFic/bJNFMs17sk8t0SPsfMMVsJHHCKic3CdQNgn7WufnPy4TLv
	LweiJkJgw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBHab-0001Zx-BL; Thu, 27 Aug 2020 13:05:13 +0000
Received: from mout.gmx.net ([212.227.17.22])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBHaU-0001YJ-S4; Thu, 27 Aug 2020 13:05:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1598533499;
 bh=92IISck0Hh+QcjDct9i6ju3E7DbMlpwjZF7zW6G46Sc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=G+5TjWI2zBlb0PKi0wfSqpRmxJjuhRdgxoigzqpjdxg4MGJIdcQjjFOnSdFFEi18F
 WlNPyIXN5cmvug/JyMVgvYpw23IpfhNBIX0SlC88LLdt5eFc65K/MsWIoEZn6ObNfx
 jHQmhtdufK3llEM8vjN0k2pVECiCQ815wHEd/3x8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.146.7] ([217.61.146.7]) by web-mail.gmx.net
 (3c-app-gmx-bap26.server.lan [172.19.172.96]) (via HTTP); Thu, 27 Aug 2020
 14:31:59 +0200
MIME-Version: 1.0
Message-ID: <trinity-d6be65d8-9086-42bc-b993-238b731cdf60-1598531519064@3c-app-gmx-bap26>
From: Frank Wunderlich <frank-w@public-files.de>
To: Robin Murphy <robin.murphy@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: Aw: [PATCH 00/18] Convert arch/arm to use iommu-dma
Date: Thu, 27 Aug 2020 14:31:59 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <cover.1597931875.git.robin.murphy@arm.com>
References: <cover.1597931875.git.robin.murphy@arm.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:s+a4a7dJl6sfE8qr3afXfh3rFMEB0yoGDcQKLuHS4QzYWvUvvC45GFgO8lF9qXw9R52Wk
 DtakmHS+HD6cGoa1Zil3uW/U+yFS9kxTAT+z6AMI2xcYorqC2HXtzYuOCqJCgtLpQ+XE0cJjSFZx
 jxGxAyxNxltq5fYSEegUZWLgP9jut/anC9MQ4QvGWdC7Fx2DqQGzPbELk6qKjHDVZ/m5suQOG5WX
 iSa5xQ1TVnlfnQDl3zDcjq+ZYocRCeCF/YEHBWcp/6xTs4r2KnkcTO/1Z2Mnufc+NBr+EgqeLN3I
 Vw=
X-UI-Out-Filterresults: notjunk:1;V03:K0:8TzpiXe6xbM=:b96ZqYgV6cA8tmr2WFImV+
 fV7dkhuPq4AxCQ4TJwehdPvpLset+yDFwvBG46KzDFp8MtBrrJ6fhFnBlTLmf2BK/2YhO8HJD
 QNGUy8Zkubm32FDZ/XvlW4WpsvOktkElFvh4JAX8U2KNGFwlMI0XV/F8bBuCAKvhatdm/TGEs
 09vIA0lA+v8to7adqFPeCPqdIhu3f3z8GSo1xn+WNYSawAVHqtZKueZi92lrjYnm87jUuG4fR
 d9dxNgWdZwpPhwDKy4+jMNq2lpRjObbSFp7giB0PTEi91AWB3GWVMzdzh4gfNX56vejSolNa6
 eyEAUeuTErw8cQVYru60jXk2sty1ty79Dq7CEk9ZIUhjQlxbFxKhs2qcVqpzIIv4gFhl/nFXr
 4rlCTJ3JR7pSCONvuJnhmBJOYBiEa2XjZWeq1XQntTCrZpZq4Ay8iiiZzI7LPlrhaEiW0xGy0
 KJW2NP3l9N2d5eEtxARoTNZEgSA4b8So1xcOjt3Nj1jphtJhniayKaiQjJ7Yc6f2iu+/bvf1s
 sCl1hKY5L8+zVLclajLJvQS4Cflrt8HiD/bMIfjXuLVvaOOl46db4pKLnLo55l1LpwFmfytch
 G7XadBsQkWdYC6SvWSsNGA4ZVvmoauLP+R02cy9SYUmMHSEp8KWO9O/Zu8X35DhhHmlBP9xQ3
 mjrlwdOIl9iaPMpgky7k0AyMMA3VGWENEOsS0Jwaw9PokdaEKjU4ct4Amq6DaHbtz3qo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_090507_144261_3CB114EA 
X-CRM114-Status: UNSURE (   6.35  )
X-CRM114-Notice: Please train this message.
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
Cc: geert+renesas@glider.be, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com, digetx@gmail.com, s-anna@ti.com,
 will@kernel.org, hch@lst.de, m.szyprowski@samsung.com,
 linux-samsung-soc@vger.kernel.org, joro@8bytes.org, magnus.damm@gmail.com,
 linux@armlinux.org.uk, iommu@lists.linux-foundation.org, jonathanh@nvidia.com,
 agross@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 inki.dae@samsung.com, vdumpa@nvidia.com, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, yong.wu@mediatek.com, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, t-kristo@ti.com, kyungmin.park@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Tested full series on bananapi r2 (mt7623/mt2701, 5.9-rc1 + hdmi-patches), works so far fbcon+x without issues

Tested-by: Frank Wunderlich <frank-w@public-files.de>

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
