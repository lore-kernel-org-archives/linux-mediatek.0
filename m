Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5252C433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 07:10:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F01920708
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 07:10:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RUH5SJLy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VjtBL01j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F01920708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jDY0UldK5oHu4uZAiXCAotxAGHf5qbqAqPWuejMfXec=; b=RUH5SJLyChRHz2Pg3ZLKYUwGN
	BCJF56r+1H0EwNtT66oylj1lTPbuZuKgXFvraUlj4Pbece41MjWEEgeTcf06O3cuVFv/CSn64/ksf
	hCXZA8KeElLNp343WDC8oBjM5/aqGRuPKEtjDo0/XmSP7wgISDtkxQgM8VvBkDwynGFQZsi1FH0i/
	MFJWZomnMYdRXLOerUWXI+aBuW/PzeNhMKsBON1vhUJ9PLsCRd0hUvMQ4mt1agbCgZ4hxxsWMqas/
	Sr1Agl/lS0dpWbHjB0AX/2/dGy765zWMJdpJzCNA1BAUg5nQ+5AQV0vDXiG1c9p5wIohFu67JdUdE
	6MFSilTGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGGj1-0001EB-Un; Thu, 10 Sep 2020 07:10:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGGiy-0001DY-0B
 for linux-mediatek@lists.infradead.org; Thu, 10 Sep 2020 07:10:30 +0000
X-UUID: f31d41170c9d445f97ed86fd2e27fa59-20200909
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=qQ3o5wuN2rg8uyEANSJYR8YzzG9Gaxvo1A2sTkhF+DE=; 
 b=VjtBL01j/HoBXflC5GlI+QlUTjud9emFvNHY1ZJq5wY5TPnDX0DrA0dAMn2YeH8262sE/pt5GH2zcs6H+rEm2EvEbV51k3i4iQpuYfj+7BkX9ki3ztgQ+yYcMUxmWSSNBsGB64xkUXFky1+gs0UeZbamElxF76eiTWXFtuP9A4g=;
X-UUID: f31d41170c9d445f97ed86fd2e27fa59-20200909
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1326224228; Wed, 09 Sep 2020 23:10:25 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Sep 2020 00:04:48 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 10 Sep 2020 15:04:46 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Sep 2020 15:04:44 +0800
Message-ID: <1599721372.7466.15.camel@mhfsdcap03>
Subject: Re: Aw: Re: [PATCH v4 0/4] Split PCIe node to comply with hardware
 design
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: Frank Wunderlich <frank-w@public-files.de>
Date: Thu, 10 Sep 2020 15:02:52 +0800
In-Reply-To: <trinity-74abdbb2-2ddc-440a-85c8-97e80e9eb2ed-1599545604475@3c-app-gmx-bs38>
References: <20200721074915.14516-1-Chuanjia.Liu@mediatek.com>
 <1596440772.7361.35.camel@mhfsdcap03>
 <trinity-74abdbb2-2ddc-440a-85c8-97e80e9eb2ed-1599545604475@3c-app-gmx-bs38>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7D884D44EC4ED2C18A83C4ECE5BF2DBC5AB661AF82EEBCB6FFD4697B9FB981372000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_031028_806561_EC797802 
X-CRM114-Status: UNSURE (   9.07  )
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
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, jianjun.wang@mediatek.com,
 Ryder Lee <ryder.lee@mediatek.com>, linux-mediatek@lists.infradead.org,
 yong.wu@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-09-08 at 08:13 +0200, Frank Wunderlich wrote:
> Hi,
> 
> i don't see this Patchset in 5.9-rc4
> 
> is anything missing?
> 
> regards Frank

Thanks for ping this mail,
<vger.kernel.org> mali list consider this patchset is SPAM 
because of my environmental problems.
I have fixed this problem and send the V5 version.
It can be seen correctly in linux-pci mail list.
Now I guess the maintainer will help review and apply this.

regards Chuanjia

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
