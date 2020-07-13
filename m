Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00642C433E4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 13:29:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C33EF206F0
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 13:29:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QcsCQRZj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C33EF206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7J5Ijx01B1crFbrkY+Spud1z+brDcD/Hn2MkCsluXmg=; b=QcsCQRZjJsv8++ISm0IixO7zX
	rPeSxAqvd6G96dQyeQ+Q6ArtFxgzqiVXPPF7J1jTLAPd14oc38ctHygj1x1CLQQh6+P44JvGJ4DHW
	pm+Xy181dyLs20BmTS45ocTIqUnw2xcVyPyuwA9whTDh8ptkSQzwztheP/LtvtGohw/9/FKv/JyRV
	q4BrD3BG1p7Qj26lsXM6Bhn99dMVcWbGO6pHo5+nMEWynV9cgk/Cg9+CFjjtmFJ0DES9ZnfqE7CR+
	B197a/sScWKC9kM6NOTGUJkF+AR6XsEXO+O3sZWTNIbtmLAAVjC3RoVTF7M4X8DV5dAnHz2SqvJVb
	xJ2nSG4KA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juyWX-0008HN-1A; Mon, 13 Jul 2020 13:29:37 +0000
Received: from 8bytes.org ([2a01:238:4383:600:38bc:a715:4b6d:a889]
 helo=theia.8bytes.org)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juyWS-0008Fa-Bd; Mon, 13 Jul 2020 13:29:33 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 3E90736B; Mon, 13 Jul 2020 15:29:31 +0200 (CEST)
Date: Mon, 13 Jul 2020 15:29:29 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v6 00/10] MT6779 IOMMU SUPPORT
Message-ID: <20200713132929.GR27672@8bytes.org>
References: <20200703044127.27438-1-chao.hao@mediatek.com>
 <20200710141349.GJ27672@8bytes.org>
 <1594451493.16172.6.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1594451493.16172.6.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_092932_528259_EB169208 
X-CRM114-Status: GOOD (  10.86  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 FY Yang <fy.yang@mediatek.com>, wsd_upstream@mediatek.com,
 TH Yang <th.yang@mediatek.com>, linux-kernel@vger.kernel.org,
 Chao Hao <chao.hao@mediatek.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Jul 11, 2020 at 03:11:33PM +0800, Yong Wu wrote:
> The SMI part always go with the IOMMU, Could you also help apply the
> mt6779 SMI basical part [1][2]. Both has already got reviewed-by from
> Rob and Matthias. and the [3] in that patchset is for performance
> improvement, it's not so necessary, it can be send in another patchset.
> 
> 
> [1] https://lore.kernel.org/patchwork/patch/1176833/
> [2] https://lore.kernel.org/patchwork/patch/1176831/

Okay, applied these two to the arm/mediatek branch.


	Joerg

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
