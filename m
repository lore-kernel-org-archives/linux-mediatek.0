Return-Path: <SRS0=FEjz=EP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E732C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 12:32:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00BAC20659
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 12:32:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KTJeEzKd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HEAANq1F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00BAC20659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YK039oCzzcIv4DyW2UM3jjlUMpQUYd7+aUZ2Dag0fjc=; b=KTJeEzKdhokFEyW5C8Flx8rW9
	jmrj8W+OVdqQvvLS3qa6KeFzweRzYXHC30mRIuhLcJwjIBaI9SXN1ES1zzjX2IaGGF9YDktc6dveP
	EkMUtS8azpQuKooZre6kJmIRk4WZ67EsjE583wnyCHuWa4Ju+GVZ+7y4mnrp1Jz/+j/HikFZ09eKO
	iIFBh2mSi0jKvgQyaZz+wYT+sF1k5si5mYZYB0AerLbJqYEW9/FdhZn7s1nfkxuAi6e+Zw6hw7cWb
	ILVVy/usmPecwjY+5g8vdiLr6aexpqeX2nn/WcJi7azBEaIzl7olW8oJQsvaHoSIMW4qgXqMC/rKs
	+t3MUmqOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc6LA-0003IM-JD; Mon, 09 Nov 2020 12:32:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc6L4-0003FZ-2h; Mon, 09 Nov 2020 12:32:03 +0000
X-UUID: 2d97a104a3ce41f2b3425f1affbcc2a2-20201109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=WJtPHpW+0YyB7rI0wRU9pvErODSR4itX2vnVqUYeC14=; 
 b=HEAANq1F196w6kg49Y5TjB/ci8z2C+s+raERdHeRnHOj0HSYGyn+E+oKvB5GC+Nb64DPvcaKJNHoq88gt/T0KnhKThqLI7balimW2rm1JXFYleBjebDeWzZZknKHuZKVGOR5JHBnogvX3P6ohEq7zSEBdmSPrh6S3uxxGMaV6Ns=;
X-UUID: 2d97a104a3ce41f2b3425f1affbcc2a2-20201109
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1374360585; Mon, 09 Nov 2020 04:31:54 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Nov 2020 04:21:51 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 9 Nov 2020 20:21:48 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 9 Nov 2020 20:21:48 +0800
Message-ID: <1604924508.25719.24.camel@mhfsdcap03>
Subject: Re: [i2c-next,PATCH] i2c: medaitek: Move suspend and resume
 handling to NOIRQ phase
From: Qii Wang <qii.wang@mediatek.com>
To: <wsa@the-dreams.de>
Date: Mon, 9 Nov 2020 20:21:48 +0800
In-Reply-To: <1604740180-14645-1-git-send-email-qii.wang@mediatek.com>
References: <1604740180-14645-1-git-send-email-qii.wang@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: AC90FDB39BE5BB9BF4DC8700836DAB9494D29A8B859090525ABE5C95D6F179852000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_073202_882969_4C6429A9 
X-CRM114-Status: GOOD (  12.63  )
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
Cc: srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-i2c@vger.kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

I am sorry, there is a misspelling in my subject.
-medaitek
+mediatek
I will revise it with other new comments and then update this patch.

On Sat, 2020-11-07 at 17:09 +0800, qii.wang@mediatek.com wrote:
> From: Qii Wang <qii.wang@mediatek.com>
> 
> Some i2c device driver indirectly uses I2C driver when it is now
> being suspended. The i2c devices driver is suspended during the
> NOIRQ phase and this cannot be changed due to other dependencies.
> Therefore, we also need to move the suspend handling for the I2C
> controller driver to the NOIRQ phase as well.
> 
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
