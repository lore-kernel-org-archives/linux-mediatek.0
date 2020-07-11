Return-Path: <SRS0=kVE3=AW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A05F0C433E4
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jul 2020 07:12:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C568206F4
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jul 2020 07:12:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tL5tJj6i";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nM2kFz5w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C568206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a7/k7W2rKBmbDO2RgpLi4bXuwtQtg1U2/uGcwsaVmEA=; b=tL5tJj6iUZw3Ndj2XGmeed7Xt
	laSgP9KbWQKlL+wcTyCTxdusLfqgHeUvDaVD1p5jJxnYP/XooYT5p8bDaS5MLuCFWbmvfxOOZe7Mw
	1KPGXQcPmAbaXZgMvgfg24tITRw16DGW6JuLkuSaKHLssMWz3Vft3jIxM4rQ7vEU4HYmsOJ0sy/2W
	oibFtRo2drMTaO2/ng9Zs1WtaTqbw+B57kBIzWCaq+6l4AbGOJoPdQJXe9ALDhxla0y15E+Bp3R8V
	K5LmrHMNWGyPAF7dc0grVgzDYRt+6LZtPJRG1WOuSg8lm4DWYxMeFty6r32mFc+8Ufc2C3HEwQyhI
	McmQ4WahQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ju9gS-0007dC-KX; Sat, 11 Jul 2020 07:12:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ju9gP-0007cV-H7; Sat, 11 Jul 2020 07:12:26 +0000
X-UUID: 309edd68a04045e7bda1e631b17aa120-20200710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=yilbJrHb4on0J7hThn4YoSbk9aK3TSJQjUpN3XgWrzE=; 
 b=nM2kFz5wU1FHh9xBxJ8fOzMTcgthThfLMN3XDWrbbKOjHaLejrwZVXH/HvXFKm0R9BzLVMK6QqaOPlxvlyCHUbXhwHlTsblRY3MKb20r4cS1G4ohhtVMZ38aC3jV9lZVUcCyjA83rcnWRJRA6hRIi0QLurpnbvyN69y4mfAj9w8=;
X-UUID: 309edd68a04045e7bda1e631b17aa120-20200710
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 657002132; Fri, 10 Jul 2020 23:12:09 -0800
Received: from MTKMBS32DR.mediatek.inc (172.27.6.104) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Jul 2020 00:12:17 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS32DR.mediatek.inc
 (172.27.6.104) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 11 Jul 2020 15:12:15 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 11 Jul 2020 15:12:14 +0800
Message-ID: <1594451493.16172.6.camel@mhfsdcap03>
Subject: Re: [PATCH v6 00/10] MT6779 IOMMU SUPPORT
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>
Date: Sat, 11 Jul 2020 15:11:33 +0800
In-Reply-To: <20200710141349.GJ27672@8bytes.org>
References: <20200703044127.27438-1-chao.hao@mediatek.com>
 <20200710141349.GJ27672@8bytes.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 05BB3D50A356C307CD14C3C48E7C352C564F8EC9C54A287E85E8AED5818631902000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200711_031225_788000_FD582315 
X-CRM114-Status: GOOD (  11.82  )
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

On Fri, 2020-07-10 at 16:13 +0200, Joerg Roedel wrote:
> On Fri, Jul 03, 2020 at 12:41:17PM +0800, Chao Hao wrote:
> > Chao Hao (10):
> >   dt-bindings: mediatek: Add bindings for MT6779
> >   iommu/mediatek: Rename the register STANDARD_AXI_MODE(0x48) to MISC_CTRL
> >   iommu/mediatek: Use a u32 flags to describe different HW features
> >   iommu/mediatek: Setting MISC_CTRL register
> >   iommu/mediatek: Move inv_sel_reg into the plat_data
> >   iommu/mediatek: Add sub_comm id in translation fault
> >   iommu/mediatek: Add REG_MMU_WR_LEN_CTRL register definition
> >   iommu/mediatek: Extend protect pa alignment value
> >   iommu/mediatek: Modify MMU_CTRL register setting
> >   iommu/mediatek: Add mt6779 basic support
> 
> Applied, thanks.

Hi Joerg,

Thanks for the apply.

The SMI part always go with the IOMMU, Could you also help apply the
mt6779 SMI basical part [1][2]. Both has already got reviewed-by from
Rob and Matthias. and the [3] in that patchset is for performance
improvement, it's not so necessary, it can be send in another patchset.


[1] https://lore.kernel.org/patchwork/patch/1176833/
[2] https://lore.kernel.org/patchwork/patch/1176831/
[3] https://lore.kernel.org/patchwork/patch/1176832/
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
