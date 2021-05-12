Return-Path: <SRS0=1nN3=KH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 130BAC433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 03:03:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB07761628
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 03:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB07761628
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XdJWJmYq016vA/z61VZ76UdrC4YcYpwe4Jo6c6GKoDs=; b=JnNHmPpnXuMisk5AlPj9zHKwg
	20BcJ1fQxpjBZ2Nha8+E348N81EmPR6EEY8AVxplhDBz5LWkFR+aYQC0I4mPwNdbQorCo37zf/go7
	S2UL3tWJ3mjMi1IihfkO9WTXz7JA4p8VAKLNe0DerQuMrHYbkL22XrkW4fzJaPOn8Mb2Mj4cYH8Lm
	Eni0S1a5M26MVsx0cR+xpYj6/UHWON/I9D2FLIa5uv2pGKbPMAws7HpZr8YLpG8mQlKZQjQcWWwHu
	hXXm0uLfpixp34sxYM9jJXltELZkHXeBq9p0crW9GWDytSc0z6e7+pJhhHqUSneRis5WyPEtVS4jY
	J5B2ZHNhg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgf9j-001psv-0O; Wed, 12 May 2021 03:03:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgf9f-001psa-0d; Wed, 12 May 2021 03:03:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=dtJOvz2WWO6ECyzszzQuFawSNgdGEd0oa1GShADyJlQ=; b=ZjzsL4zdCkfvO/P4+iqe0blihz
 FiBdWgcTUMdmrIn93LkUxt2fVyYrE9ZAp0v+T7py854/wNPxLW0sV+T6AAJi3/RyKoG+V6xL3SRom
 15ALrDTZHtI1Dd4xwv14sSDlKHKJfTpuBV54kfmdIZ5O69oAcXLMaVZecrs+HkX8Zgl8B3hr9ij/R
 oDlmu5iDb55237WrhsuHSaxTJE4zB/D6bMmGKj7bw916mJorw+cdq0jGmu3BI4HPGqomZVBKTT3Vv
 xJCAXWrjd3EYqeOjEEs2iuVSL2RfA0T/xybvFY0Tz21moyL2O+3l9T2YI8CNX8K2iCiQ9yU9YyFiy
 7C5wMfYg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgf9b-00A3jS-11; Wed, 12 May 2021 03:03:21 +0000
X-UUID: 4a67eb37661647afade243bd8ef55b32-20210511
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=dtJOvz2WWO6ECyzszzQuFawSNgdGEd0oa1GShADyJlQ=; 
 b=O1JxK7sDJX/9VdwZbVQT+gQddVz7xTLL7CZCvHtNOmDNSq99PVxybufohSuNLtedKRxp/5EsbTird9tfWYCLFdmFCNxhKybGoL+fz/ZD5qtUzsmpfSgZGUHGOEqfhyexWAqcWwXj0TFuDdZPXLslUiwoNUKOsmGtBE6VJVGAkQk=;
X-UUID: 4a67eb37661647afade243bd8ef55b32-20210511
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1240054446; Tue, 11 May 2021 20:03:14 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 May 2021 20:03:12 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 12 May 2021 11:03:06 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 12 May 2021 11:03:06 +0800
Message-ID: <1620788585.30140.7.camel@mhfsdcap03>
Subject: Re: [SPAM]Re: [PATCH v9 2/4] PCI: mediatek: Add new method to get
 shared pcie-cfg base address and parse node
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: <lorenzo.pieralisi@arm.com>, <bhelgaas@google.com>
CC: <robh+dt@kernel.org>, <matthias.bgg@gmail.com>, <ryder.lee@mediatek.com>, 
 <jianjun.wang@mediatek.com>, <linux-pci@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <yong.wu@mediatek.com>,
 <frank-w@public-files.de>, <chuanjia.liu@mediatek.com>
Date: Wed, 12 May 2021 11:03:05 +0800
In-Reply-To: <1618890121.31169.4.camel@mhfsdcap03>
References: <20210406034410.24381-1-chuanjia.liu@mediatek.com>
 <20210406034410.24381-3-chuanjia.liu@mediatek.com>
 <1618890121.31169.4.camel@mhfsdcap03>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D836AA10B476B126428DEF1F5CB8ECBC9D9AE408E3481CC3B0F9BB8FA8D350952000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_200319_094463_3D1CBC31 
X-CRM114-Status: GOOD (  14.86  )
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

On Tue, 2021-04-20 at 11:42 +0800, Chuanjia Liu wrote:

Hi, Lorenzo, Bjorn

  just a gentle ping...

thanks.
> Hi, Lorenzo, Bjorn,
> 
> Just a gentle ping. Please let me know your comments about this patch
> set.
> 
> thanks
> 
> On Tue, 2021-04-06 at 11:44 +0800, Chuanjia Liu wrote:
> > For the new dts format, add a new method to get
> > shared pcie-cfg base address and parse node.
> > 
> > Signed-off-by: Chuanjia Liu <chuanjia.liu@mediatek.com>
> > Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> > ---
> >  drivers/pci/controller/pcie-mediatek.c | 52 +++++++++++++++++++-------
> >  1 file changed, 39 insertions(+), 13 deletions(-)
> > 

> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
