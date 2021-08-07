Return-Path: <SRS0=znLv=M6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE124C4338F
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Aug 2021 03:29:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97AFE61186
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Aug 2021 03:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 97AFE61186
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ic58SOXRcMRB7WsjH8Z6gwMRIWGnOZNnhOilObpQqUA=; b=fN3Sddvu0qj3tV
	CVz62E3gMb8Oyror5WzE0pG2AqYsGk2EEUSTuAvPK0ijIi3fAwsV2CazLCip/V8EttS2Ugzo+7gmb
	3yi31MVy9eesJdILJ9YroUcdwvDGY8IwFpr3//uLiIOBnKHJ+lgIpwIm2s9CKiQn2ZFOWTLB75eV0
	9IegedBK/WrrO4GB8whvxrn1NwfMPfqsfpTbIMQWdbfAw1Y29xwYRa9bRLzoxkLgDDoSRm88XLoN7
	4QQmOW90Q8zToi2I+l6zM0ADuQ0v42FrHG15cFlbMp7B9R9xkCGKXir7tcmDvnMJB3mwx6q+LZoam
	rwAAzzvzcT9FDzJ9vNFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCD1E-00E5Bp-2y; Sat, 07 Aug 2021 03:29:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCD18-00E5B6-HX; Sat, 07 Aug 2021 03:29:02 +0000
X-UUID: 06fada05b68248779e37f29993ac15e3-20210806
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=BmNE7y7NrgqM2Smwx4znez/paXuFyhXlFjgphUZwtrM=; 
 b=kJW9NCfRc2FGgqvn73VZXjzPGV3vYmZYiM1g5SsiQMY5jf14WhohV6m0vqUEFacrsZvJxC/Gg85w0wjAsjDe7CE0zICGFlxfQGHNbRRxAoWPcwj+8+ms0dCLe1VLzOf2A7IwQcbPrWjgcs0wN8P3pb/lGMW7OD480ZZqyNEWyGA=;
X-UUID: 06fada05b68248779e37f29993ac15e3-20210806
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1933993991; Fri, 06 Aug 2021 20:28:54 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 Aug 2021 20:28:52 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 7 Aug 2021 11:28:51 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 7 Aug 2021 11:28:51 +0800
Message-ID: <1628306931.11590.0.camel@mtksdaap41>
Subject: Re: [PATCH v10 4/5] spmi: mediatek: Add support for MT8195
From: Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Stephen Boyd <sboyd@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Henry Chen
 <henryc.chen@mediatek.com>
Date: Sat, 7 Aug 2021 11:28:51 +0800
In-Reply-To: <162827215909.1975443.852277412377742323@swboyd.mtv.corp.google.com>
References: <1627972461-2627-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1627972461-2627-5-git-send-email-hsin-hsiung.wang@mediatek.com>
 <162827215909.1975443.852277412377742323@swboyd.mtv.corp.google.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_202900_978500_661C10A7 
X-CRM114-Status: GOOD (  22.30  )
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

Hi,

On Fri, 2021-08-06 at 10:49 -0700, Stephen Boyd wrote:
> Quoting Hsin-Hsiung Wang (2021-08-02 23:34:20)
> > From: Henry Chen <henryc.chen@mediatek.com>
> > 
> > Add spmi support for MT8195.
> > 
> > Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> 
> Missing Signed-off-by from hsin-hsiung.wang here
> 

Sorry for the missing. I will add it in the next patch.

Thanks.

> > ---
> > changes since v9:
> > - No change.
> > ---
> >  drivers/spmi/spmi-mtk-pmif.c | 90 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 90 insertions(+)
> > 
> > diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
> > index 94c45d46ab0c..0c320801c9d5 100644
> > --- a/drivers/spmi/spmi-mtk-pmif.c
> > +++ b/drivers/spmi/spmi-mtk-pmif.c
> > @@ -348,6 +427,14 @@ static const struct pmif_data mt6873_pmif_arb = {
> >         .soc_chan = 2,
> >  };
> >  
> > +static const struct pmif_data mt8195_pmif_arb[] = {
> 
> This is an array of type pmif_data.
> 
> > +       {
> > +               .regs = mt8195_regs,
> > +               .spmimst_regs = mt8195_spmi_regs,
> > +               .soc_chan = 2,
> > +       },
> > +};
> > +
> >  static int mtk_spmi_probe(struct platform_device *pdev)
> >  {
> >         struct pmif *arb;
> > @@ -444,6 +531,9 @@ static const struct of_device_id mtk_spmi_match_table[] = {
> >         {
> >                 .compatible = "mediatek,mt6873-spmi",
> >                 .data = &mt6873_pmif_arb,
> 
> mt6873_pmif_arb is not an array, see the context header above.
> 
> How does this work? Has this been tested?
> 
> > +       }, {
> > +               .compatible = "mediatek,mt8195-spmi",
> > +               .data = &mt8195_pmif_arb,
> >         }, {
> >                 /* sentinel */
> >         },
> > -- 
> > 2.18.0
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
