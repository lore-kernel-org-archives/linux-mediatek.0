Return-Path: <SRS0=J0Vt=4N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC13C35DF5
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 11:42:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CC062176D
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 11:42:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JNLk6s9G";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="TUcpxqcT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CC062176D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FwPQVNZ/XEHGevWl0ngsv4pH7nyv3mEe35tajFRmrN4=; b=JNLk6s9GtaN36Z
	zr/f+FraB6ACZXoNytFgDznrgIAgGYuMKIx/6HYWhRkHif6/QCfj9dS1XgTQYDkoSkysAGLgwcTs0
	tyGn7ufKH6zfGxddyZtbnHCx+oyRS04nlN8PS7eHjUm0qj36sV4DmS3UhP4DtUSCl3+i7tykmMTU8
	klT+fQP8xL9txUU2hq/fn+7PJABKSy02oqQS9eU59MvkTOIEUMVs0gMrsVyjvESo4IUv1nDuKoE7N
	u9T3AXuPrEaOXsJkAWWBblYUDmgnYyYDv9JPzVVr7CFzaMYS/yeIDuFUQ0PFLC+fr6bAQNZWvFFOO
	QyOevf+dAPyzDULvNw0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6Yc0-0005xU-GT; Tue, 25 Feb 2020 11:42:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6Ybx-0005x6-C7
 for linux-mediatek@lists.infradead.org; Tue, 25 Feb 2020 11:42:50 +0000
X-UUID: 8edd2a7e109447a0b22453a3f49ea3c1-20200225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=nGdrZKjnM8EU4Zzjz5/irGxbVBbkkCppjfrte/VkDbQ=; 
 b=TUcpxqcTm380AmUeemxdIbXbRkjXaWK3J8OnNXw0ehU4dvFf0Ccmq+YlWLYe3jJyF4k0132rR/iVieM1DaR/4ZLm5TyD/ZyQxNoDK970/DTxIz+suj2LWorfGydzZad4RVI41lqcjPErgu9VMgi2S3x66eLwF0fPCANqRkttZvw=;
X-UUID: 8edd2a7e109447a0b22453a3f49ea3c1-20200225
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1327657508; Tue, 25 Feb 2020 03:42:44 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 25 Feb 2020 03:42:42 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs07n2.mediatek.inc
 (172.21.101.141) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Tue, 25 Feb 2020 19:41:52 +0800
Received: from [10.16.6.141] (10.16.6.141) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 25 Feb 2020 19:41:20 +0800
Message-ID: <1582630955.13085.2.camel@mszsdaap41>
Subject: Re: [PATCH 1/4] dt-binds: display: mediatek: add property to
 control mipi tx drive current
From: Jitao Shi <jitao.shi@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Date: Tue, 25 Feb 2020 19:42:35 +0800
In-Reply-To: <1576647693.15003.11.camel@mtksdaap41>
References: <20191216082937.119164-1-jitao.shi@mediatek.com>
 <20191216082937.119164-2-jitao.shi@mediatek.com>
 <1576647693.15003.11.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_034249_421634_DE146DED 
X-CRM114-Status: GOOD (  14.69  )
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
Cc: Bibby Hsieh =?UTF-8?Q?=28=E8=AC=9D=E6=BF=9F=E9=81=A0=29?=
 <Bibby.Hsieh@mediatek.com>, srv_heupstream <srv_heupstream@mediatek.com>,
 David Airlie <airlied@linux.ie>, "stonea168@163.com" <stonea168@163.com>,
 Cawa Cheng =?UTF-8?Q?=28=E9=84=AD=E6=9B=84=E7=A6=A7=29?=
 <cawa.cheng@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Sj
 Huang =?UTF-8?Q?=28=E9=BB=83=E4=BF=A1=E7=92=8B=29?= <sj.huang@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Yingjoe Chen =?UTF-8?Q?=28=E9=99=B3=E8=8B=B1=E6=B4=B2=29?=
 <Yingjoe.Chen@mediatek.com>,
 Eddie Huang =?UTF-8?Q?=28=E9=BB=83=E6=99=BA=E5=82=91=29?=
 <eddie.huang@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2019-12-18 at 13:41 +0800, CK Hu wrote:
> Hi, Jitao:
> 
> On Mon, 2019-12-16 at 16:29 +0800, Jitao Shi wrote:
> > Add a property to control mipi tx drive current:
> > "mipitx-current-drive"
> > 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > ---
> >  .../devicetree/bindings/display/mediatek/mediatek,dsi.txt     | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> > index a19a6cc375ed..780201ddcd5c 100644
> > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> > @@ -33,6 +33,9 @@ Required properties:
> >  - #clock-cells: must be <0>;
> >  - #phy-cells: must be <0>.
> >  
> > +Optional properties:
> > +- mipitx-current-drive: adjust driving current, should be 1 ~ 0xF
> > +
> 
> In "[PATCH 3/4] drm/mediatek: add the mipitx driving control" [1], I see
> that you actually control a register its name is MIPITX_VOLTAGE_SEL, so
> I guess this control the voltage. If mipi_tx has the ability to control
> the voltage, could we just treat mipi_tx as a regulator? For a
> regulator, regulator-min-microvolt and regulator-max-microvolt would
> limit the volt range and you could get it by
> of_get_regulator_init_data(). If it actually control the current,
> regulator-min-microamp and regulator-max-microamp could be used. I'm not
> expert on this, so please give me more information on this.
> 
> [1]
> http://lists.infradead.org/pipermail/linux-mediatek/2019-December/025638.html
> 
> Regards,
> CK
> 

'MIPITX_VOLTAGE_SEL' is the whole 32bit name.
mipitx-current-drive is just bit[9:6] RG_DSI_HSTX_LDO_REF_SEL,

Not for voltage.

Best Regards
Jitao

> >  Example:
> >  
> >  mipi_tx0: mipi-dphy@10215000 {
> > @@ -42,6 +45,7 @@ mipi_tx0: mipi-dphy@10215000 {
> >  	clock-output-names = "mipi_tx0_pll";
> >  	#clock-cells = <0>;
> >  	#phy-cells = <0>;
> > +	mipitx-current-drive = <0x8>;
> >  };
> >  
> >  dsi0: dsi@1401b000 {
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
