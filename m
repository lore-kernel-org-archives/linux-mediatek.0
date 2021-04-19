Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F705C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 10:45:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C2E961157
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 10:45:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C2E961157
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tUjRvzDG1lBaY7aQHvCLchOy93B9RuFgvMcNLICcIGs=; b=oU/d0RSLtjBDHoyORfG/v/wSx
	GDzjEe9GRE5ReN80PhZ30QZbDMHj0Am5/GA6ZiENf+iAIUFzbufuIMn4RprX3DzzMmf5mpQwQFNyP
	GQoWWDedztDnVtFzvWpnFF0jfBKTjpPDCMjgIK94FF552pqq16tYpzVAMOQ8Vr2Btd/8dV0ou51wo
	MrAohyPGC8VdUWXSxafe6n/rNu8tMw8+cEOZvZvnvsysSjuuc2yBW9NvqCzHfpTSP/toYE+FRZwwn
	02ZJ0QMUwCOx0XevY5BIVbDZILN2N1k0cPyUlcyxcRK8VNcRkHN5loXiKPEjY0rDzoBFkMcTIcSxI
	Xci1xlnAQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYROt-009hOq-Uw; Mon, 19 Apr 2021 10:45:08 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYROi-009hNM-1p; Mon, 19 Apr 2021 10:44:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=OtE2VFFG/Hz5sPvUhjgusZDKznuPxwvHe6RMF9FLtP8=; b=1/EBgluv4nTVDZHEoQqdoHuQ1u
 5aUXiD++o5PJNuE1D+A/LoaF6T4tc79OhoEGjnjYz6VGyhn85VMKgvtDlMhOdsDPtvbUoY9sdpy4x
 fP+5y7APpcmXuFBBMEsJj86BklfWxPRgUSzJl0d2wsldVQ6YuI6WOPSbs9d8IFYf36/Aapsh2zTRY
 2Ycsnkwein9T+gIaokRyWKcTycjIrVgKAdjkOrcAoDaG4kRDea6ZAiOmyDF+4UsofwT8Pm21oZv6v
 xEHf6n426xWOfajSQTnmaZkFO2/kVdxvzsYp4dJ2NKCn+qAlyOzlReBSHaWz6muAc+VUtNRRFMYac
 9+d7qKJg==;
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lYROd-00BHa3-Lt; Mon, 19 Apr 2021 10:44:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB1581FB;
 Mon, 19 Apr 2021 03:44:43 -0700 (PDT)
Received: from lpieralisi (e121166-lin.cambridge.arm.com [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37ACA3F85F;
 Mon, 19 Apr 2021 03:44:41 -0700 (PDT)
Date: Mon, 19 Apr 2021 11:44:32 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Bjorn Helgaas <helgaas@kernel.org>,
 Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, youlin.pei@mediatek.com,
 chuanjia.liu@mediatek.com, qizhong.cheng@mediatek.com,
 sin_jieyang@mediatek.com, drinkcat@chromium.org,
 Rex-BC.Chen@mediatek.com, anson.chuang@mediatek.com,
 Krzysztof Wilczyski <kw@linux.com>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [v9,0/7] PCI: mediatek: Add new generation controller support
Message-ID: <20210419104432.GA2427@lpieralisi>
References: <20210324030510.29177-1-jianjun.wang@mediatek.com>
 <20210416192100.GA2745484@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210416192100.GA2745484@bjorn-Precision-5520>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_034451_783192_587B2009 
X-CRM114-Status: GOOD (  10.12  )
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

On Fri, Apr 16, 2021 at 02:21:00PM -0500, Bjorn Helgaas wrote:
> On Wed, Mar 24, 2021 at 11:05:03AM +0800, Jianjun Wang wrote:
> > These series patches add pcie-mediatek-gen3.c and dt-bindings file to
> > support new generation PCIe controller.
> 
> Incidental: b4 doesn't work on this thread, I suspect because the
> usual subject line format is:
> 
>   [PATCH v9 9/7]
> 
> instead of:
> 
>   [v9,0/7]
> 
> For b4 info, see https://git.kernel.org/pub/scm/utils/b4/b4.git/tree/README.rst

Jianjun will update the series accordingly (and please add to v10 the
review tags you received.

Lorenzo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
