Return-Path: <SRS0=Jt7l=BW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9BD1C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 11:58:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3C112065C
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 11:58:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aW3sJfZG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nRKpy3VZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3C112065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZwDS1Sgxag+S5Z0+L5Q/TLJBqukwTDgc4ofu4PY1MvQ=; b=aW3sJfZGTikxyqHq4zlblPQ+n
	g1wXq398n3xFdYXRrGPw3XeBEJTYuiGvDVdorgrHGZwWz+jjkTlNxLSX/acu7o5NMXuAn9ITRHG4q
	QKKWdKDfOWVwrqsrUlINGF0JAbl/xjsdDWTY3BZwqb/xcuNox/kbePtdHZ454wZF/Sd0rrfq9aUcf
	5Zlce9xU2UGatjv452wOlLuM7sHQSxlguxtJZEhN7b/4tbn+cT5EVSRmWaLDGUANa5vzALI/3qnrA
	QVBQuH8cCBfIdME/ln4mA4w8VBQRECcQj5y+xrV7npgiPALL+cMu/Q+pzHgSVpgS3B1RjZwXgd1md
	zIKt5zrKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5pOa-0005mX-KS; Wed, 12 Aug 2020 11:58:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5pOV-0005lD-Is; Wed, 12 Aug 2020 11:58:13 +0000
X-UUID: fed16cddf68540a3a91277e00f894035-20200812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=D6lfhIK0juhubU0dZSLfqofcrBNMDDsBIY7w5I1uBv4=; 
 b=nRKpy3VZDSoVi4nWSZxdi0nOaZzDOu3eon/6GKkSILA938TjEfYHJDixHbzAoEgzxAGbM6D5Gdp0yB+7/h7dwhhu9kyxCRt6f0x1YJYOT/Dcx8MDtyPE6JyZX5MzUYVeqB/0lMrsh8z/PSQxMGVXXVYfrUU5Pyusq2wS5zIICrs=;
X-UUID: fed16cddf68540a3a91277e00f894035-20200812
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 566238408; Wed, 12 Aug 2020 03:58:03 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Aug 2020 04:58:00 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 12 Aug 2020 19:57:58 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 12 Aug 2020 19:57:58 +0800
Message-ID: <1597233424.10188.4.camel@mhfsdcap03>
Subject: Re: Aw: [PATCH 2/3] arm64: dts: mt7622: add reset node for mmc device
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Frank Wunderlich <frank-w@public-files.de>
Date: Wed, 12 Aug 2020 19:57:04 +0800
In-Reply-To: <trinity-a4a4e709-ca8d-4867-8f90-d0ddbfca05cb-1597228420620@3c-app-gmx-bap56>
References: <20200812093726.10123-1-wenbin.mei@mediatek.com>
 <20200812093726.10123-3-wenbin.mei@mediatek.com>
 <trinity-a4a4e709-ca8d-4867-8f90-d0ddbfca05cb-1597228420620@3c-app-gmx-bap56>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B32ACDD6AC6B4D175228B6D78D1775133AD378FB68C06E1E2B072AAC9B9554922000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_075812_554052_6B7FBA22 
X-CRM114-Status: GOOD (  16.63  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 srv_heupstream@mediatek.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Thanks for your reply.
I will add this in the next version.
On Wed, 2020-08-12 at 12:33 +0200, Frank Wunderlich wrote:
> > Gesendet: Mittwoch, 12. August 2020 um 11:37 Uhr
> > Von: "Wenbin Mei" <wenbin.mei@mediatek.com>
> > Betreff: [PATCH 3/3] mmc: mediatek: add optional module reset property
> 
> > This patch adds a optional reset management for msdc.
> > Sometimes the bootloader does not bring msdc register
> > to default state, so need reset the msdc controller.
> >
> > Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> 
> Thanks for posting the fix to Mainline
> same as 3/3, dts-patch is also needed for fixing eMMC-Issue on R64
> 
> Fixes: 966580ad236e ("mmc: mediatek: add support for MT7622 SoC")
> Tested-By: Frank Wunderlich <frank-w@public-files.de>
> 
> and it needs to be fixed at least for 5.4+, so adding stable-CC
> 
> Cc: stable@vger.kernel.org

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
