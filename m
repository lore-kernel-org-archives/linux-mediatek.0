Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A97D8C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 02:06:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39442613AE
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 02:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39442613AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w5NnXABo1crOySTH/yetYhQaMbcuzNmRXqwoA3beLvQ=; b=aV6ifkFCKKzpunKwq6fZfAVGo
	QGQon/VHndUvBAfOMKQK3Z+3VcEWRKUxCpmKsA6NUJG0yDlzryfS2mYJQ8xyppjfEaPWIXQYCbcsE
	F2oySQ/s2yHIl0km/xBnMHKjZz+y1dpX/aSxEqwqqYBGg50k4mGry4tQkbjw4JJlRFIAkLJHUJGXD
	GqpxpSe2rm/9YmmkhZdDPrcNvMwsgFM/N177vi0RzfLddiyAtgUI4Q7UaJuNSakEE2AjkIvXW1NCG
	2pxPa8mRiMYVv60Fje4eygIYe+QNdqen/TAskBbIAF3MNonfFADHuGB6jQV8pzPzRI40hM9uC/Wpp
	+lRDDPkiw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYfmE-00Ay7c-6M; Tue, 20 Apr 2021 02:06:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYfm5-00Ay7D-Pi; Tue, 20 Apr 2021 02:06:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=Z09ggkvCRJiJ4/N9vlMDVPDlpKZyre12NKJNa+h4uZw=; b=VBuYbx4mg9euNbT7wVa4HOL9g1
 2xxd5V8HzhI2eSQVs09mclbe/gV4pbp3wDcOs27ylWuF4dHO8PUB7oGJIW+gCJbOYdZgj8d7Arlm9
 QUeGLbBZoIaROe+BFZWrEAQ6aUsjaDWjl8m+g5qXRkKF9uTrSQNeamOZ59nGCRmaUXTGEkUTQvlt6
 Jrn7Ut1NaprmRC8YTB9ghYZcI7q0/nYWA5r6nKPHP5pCTGNXc2tCqKicYtVtrdbE9YzSS2s8S0/i5
 xyyhHqg0tNn3GU074uXeOhVcGtr99QxluerMXvQHty/1XpuVqJweb4eCy/dAVt8nWjPezBEjOMV7N
 UL0siuZA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYflz-00BlYW-Kr; Tue, 20 Apr 2021 02:05:59 +0000
X-UUID: e3467d6bd2524a6e87055723522a7097-20210419
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Z09ggkvCRJiJ4/N9vlMDVPDlpKZyre12NKJNa+h4uZw=; 
 b=cH7CcmtfEC/UWAtgkTkjbpf3VCvucC9o+8EFGh3HL8+CGppaSQD8w0XNcuXB1GMGT5/x3k2CfuJU6+96MAMQPvLPL2MYLuHePJD5CyNvfe+kwU+tW/ibTcDMiSzS3vj98IGgho1DpTRAzl46NQkY/BD60NMfBSKx1u3rvPih4j4=;
X-UUID: e3467d6bd2524a6e87055723522a7097-20210419
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1778018181; Mon, 19 Apr 2021 19:05:46 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Apr 2021 19:05:45 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 20 Apr 2021 10:05:39 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Apr 2021 10:05:38 +0800
Message-ID: <1618884338.29460.3.camel@mhfsdcap03>
Subject: Re: [v9,0/7] PCI: mediatek: Add new generation controller support
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
CC: Bjorn Helgaas <helgaas@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "Marc Zyngier" <maz@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Philipp
 Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <youlin.pei@mediatek.com>,
 <chuanjia.liu@mediatek.com>, <qizhong.cheng@mediatek.com>,
 <sin_jieyang@mediatek.com>, <drinkcat@chromium.org>,
 <Rex-BC.Chen@mediatek.com>, <anson.chuang@mediatek.com>, Krzysztof Wilczyski
 <kw@linux.com>, Pali =?ISO-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Date: Tue, 20 Apr 2021 10:05:38 +0800
In-Reply-To: <20210419104432.GA2427@lpieralisi>
References: <20210324030510.29177-1-jianjun.wang@mediatek.com>
 <20210416192100.GA2745484@bjorn-Precision-5520>
 <20210419104432.GA2427@lpieralisi>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B45CF740E0F6667A28FE967807155FA258A3BB8BAE458FD2526271E6569C26AC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_190555_707992_FE7D8EDE 
X-CRM114-Status: GOOD (  15.72  )
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

On Mon, 2021-04-19 at 11:44 +0100, Lorenzo Pieralisi wrote:
> On Fri, Apr 16, 2021 at 02:21:00PM -0500, Bjorn Helgaas wrote:
> > On Wed, Mar 24, 2021 at 11:05:03AM +0800, Jianjun Wang wrote:
> > > These series patches add pcie-mediatek-gen3.c and dt-bindings file to
> > > support new generation PCIe controller.
> > 
> > Incidental: b4 doesn't work on this thread, I suspect because the
> > usual subject line format is:
> > 
> >   [PATCH v9 9/7]
> > 
> > instead of:
> > 
> >   [v9,0/7]
> > 
> > For b4 info, see https://git.kernel.org/pub/scm/utils/b4/b4.git/tree/README.rst
> 
> Jianjun will update the series accordingly (and please add to v10 the
> review tags you received.
> 
> Lorenzo

Yes, I will update this series in v10 to fix the subject line format and
use EXPORT_SYMBOL_GPL(), thanks for your comments.

Thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
