Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADFBEC5DF9D
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 10:36:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DE8D222C8
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 10:36:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yxv8w1BJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JIAb8qRm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DE8D222C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZQAULX+2ygnAw7kCgaMCPk0UjLiJc41yI5yYcIdzvGA=; b=Yxv8w1BJXv6sEH7HzgqbuErf5
	D1U9RVXVoSo/fqpMBV+uJJNfMlzsbuuD6SuBO6RFV+BkKnuhl7pCTEOKL1utSr7suEsPZg0oGtjlK
	2HvwNnuvKXJvhavijOOZ183YUucNaSPx5cj+HXJh1Gf1kx2xwimMKYIMgdzEw2tC0GTUb+dx6A6nq
	Pv7kZryuHsGb0A3I2TRXf55JZL4gZKzrCFmguD1CZaxShOEP87A1vtw7ej5TEvi1j+Ig6p+auTvkr
	psGhbdJIT84aC5TP7BCuIWyLEKAvGONRSDhZFdg6g+sBVXZXX9cyUU2qcF3Wri86zqL1I57EV6Hcj
	pxt65dHkA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXMKY-0007PI-6o; Tue, 27 Oct 2020 10:35:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXMK7-0007Ds-QE; Tue, 27 Oct 2020 10:35:29 +0000
X-UUID: 508f937a6cbf445a8752b109bc7711ca-20201027
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=lI1rHYpY+CiSC3fg2g3y3KjP/CT7FHrSA+j5s8OF8S8=; 
 b=JIAb8qRmlXdWorFqndwiH1RPBJD69+AONjtAqE/eICvQ5pWXgIfaWzbVGqwio7LWLUy7LGYxVqMmzyImN9kfqOa48tUygEJc20Uh5kdCsnIn/SzwF2g9HkEf/zFXAQWBJG8UxWuXZawKYiIQDpD5R1/CdUjm+bE1yXD1UO2+Ix8=;
X-UUID: 508f937a6cbf445a8752b109bc7711ca-20201027
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1652287061; Tue, 27 Oct 2020 02:29:02 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Oct 2020 03:29:00 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs07n1.mediatek.inc
 (172.21.101.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 27 Oct 2020 18:28:58 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 27 Oct 2020 18:28:57 +0800
Message-ID: <1603794538.26523.6.camel@mhfsdcap03>
Subject: Re: [PATCH 1/2] ASoC: mt6359: skip first time data at the beginning
 of DMIC recording
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 27 Oct 2020 18:28:58 +0800
In-Reply-To: <20201026123325.GC7402@sirena.org.uk>
References: <1603521686-13036-1-git-send-email-jiaxin.yu@mediatek.com>
 <1603521686-13036-2-git-send-email-jiaxin.yu@mediatek.com>
 <20201026123325.GC7402@sirena.org.uk>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_063527_995508_23ECF149 
X-CRM114-Status: GOOD (  16.22  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 shane.chien@mediatek.com, tiwai@suse.com, tzungbi@google.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-10-26 at 12:33 +0000, Mark Brown wrote:
> On Sat, Oct 24, 2020 at 02:41:25PM +0800, Jiaxin Yu wrote:
> > We can choose to drop away any length of data from the beginning according
> > to project needs. Some projects don't want to throw away any data, because
> > they want to use recorded data to do echo cancellation, so they have to
> > make sure that they are aligned with the reference data as much as
> > possible. Or there are other algorithms in the upper layer to eliminate
> > this noise. Or some projects want to eliminate this noise form the kernel
> > layer. However, the minimum recommended value is 50ms to skip pop noise.
> 
> This seems like something that would apply equally to all DMICs so
> should be done at a more general level rather than in this specific
> driver, for example it could be done in the DMIC driver.

Hi Brown,

So you suggest that we use sound/soc/codecs/dmic.c to control the delay
after recording?
If so, should we add one more CODEC('dmic-codec' and 'dmic-hifi') to
dmic's dai-link? It looks link dmic.c has helped us do something to
control dmics.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
