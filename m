Return-Path: <SRS0=cZv3=AS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79AC0C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 03:44:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41C0A20708
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 03:44:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EMHKZHWa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Wz+x6l/j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41C0A20708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=82ZduEgXhS0FEKTs56UPX5JzZmZtEgPublADAIeRwz4=; b=EMHKZHWaCHqSar0ZW06MnmQ2k
	0CWpxPdV1xk1paKCJqSTTpEpqvzJ4pDVGuB1YaJQxfMMk493V//u8NYQkItHIKe8JbCzlyhN+wfCr
	DY4lOwMwrrBFm9OEzLo8M6LgpzJNRohYTRU+dHSdW8Do03EV/MCDwsXeSknyG6QGrGjBfGBngDp+r
	5mv65ROACcmkcHdknN0LKZi5lYN6e9vb9bf0tbCUwpxZEgAJFq6GMhY9o7wkM6FkE2fZYbWmzGvc8
	p8AB+8boEqt1tDG+0DVEVHtQHjhJRVX24wjX6Pgm84qGdoAf1eReZBg4BkGQMcGWPkz1qBcLrrahq
	lqx0asVLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jseXI-0006JH-V7; Tue, 07 Jul 2020 03:44:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jseXE-0006I0-Sx; Tue, 07 Jul 2020 03:44:46 +0000
X-UUID: 4b33743f3f1d4a82b948191e59f015d5-20200706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=orN+U9b8rBcb3cgnPPXbg0k2d4sfceTMwEf/l9coVVs=; 
 b=Wz+x6l/jsyBe+FBkiPN2hT8GqrSImQDn0f2JcxNqRlPWZCbRcikFzRxh/J3wfHdni5y+Y96ad9XQ380/b8IreF1N6ewNatev8QcH6gbwDLyLqRm9AtMHx2NBD8/8sT9BA3YnSOeX3Tct5/JC4ezX+Y840t3FB7WpAhJJnHILfKk=;
X-UUID: 4b33743f3f1d4a82b948191e59f015d5-20200706
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1349725907; Mon, 06 Jul 2020 19:44:43 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Jul 2020 20:38:27 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Jul 2020 11:38:13 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Jul 2020 11:38:14 +0800
Message-ID: <1594093094.20820.8.camel@mtkswgap22>
Subject: Re: [PATCH 2/2] soc: mediatek: devapc: add devapc-mt6779 driver
From: Neal Liu <neal.liu@mediatek.com>
To: Randy Dunlap <rdunlap@infradead.org>
Date: Tue, 7 Jul 2020 11:38:14 +0800
In-Reply-To: <eb2eaab3-1ecc-d2c8-fc40-5bbe51ee31c4@infradead.org>
References: <1594027693-19530-1-git-send-email-neal.liu@mediatek.com>
 <1594027693-19530-3-git-send-email-neal.liu@mediatek.com>
 <dd03ec1e-e511-4c13-4e12-a9f8ec407326@infradead.org>
 <1594092631.20820.4.camel@mtkswgap22>
 <eb2eaab3-1ecc-d2c8-fc40-5bbe51ee31c4@infradead.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: BAB8E2C131F09C2E8A131E9F69B010D851F56200AC2906895C4A3E2A86C556E62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200706_234445_159560_85D4E5CD 
X-CRM114-Status: GOOD (  20.12  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Neal Liu <neal.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-07-06 at 20:32 -0700, Randy Dunlap wrote:
> On 7/6/20 8:30 PM, Neal Liu wrote:
> > Hi Randy,
> > 
> > Thanks for your review.
> > 
> > On Mon, 2020-07-06 at 09:13 -0700, Randy Dunlap wrote:
> >> On 7/6/20 2:28 AM, Neal Liu wrote:
> >>> diff --git a/drivers/soc/mediatek/devapc/Kconfig b/drivers/soc/mediatek/devapc/Kconfig
> >>> new file mode 100644
> >>> index 0000000..b0f7d0e
> >>> --- /dev/null
> >>> +++ b/drivers/soc/mediatek/devapc/Kconfig
> >>> @@ -0,0 +1,17 @@
> >>> +config MTK_DEVAPC
> >>> +	tristate "Mediatek Device APC Support"
> >>> +	help
> >>> +	  Device APC is a HW IP controlling internal device security.
> >>
> >> preferably:               s/HW/hardware/
> >>
> >>> +	  MediaTek bus frabric provides TrustZone security support and data
> >>
> >> 	               fabric
> >>
> >>> +	  protection to prevent slaves from being accessed by unexpected
> >>> +	  bus masters.
> >>> +	  Device APC prevents malicious access to internal devices.
> >>> +
> >>> +config DEVAPC_MT6779
> >>> +	tristate "Mediatek MT6779 Device APC driver"
> >>> +	select MTK_DEVAPC
> >>> +	help
> >>> +	  Say yes here to enable support Mediatek MT6779 Device APC driver.
> >>
> >> 	                         support for Mediatek
> >>
> >>> +	  This driver mainly used to handle the violation with 1 DEVAPC AO/PDs.
> >>
> >> 	  This driver is mainly used                           ^^^^^^^^^^^^^^^^
> >>
> >> 	                      What is that meaningless string of chars? ^^^^^^^
> > 
> > I did not see any meaningless string of chars from my original patch.
> > Is there something wrong?
> 
> To someone who is reading the Kconfig help text but is unfamiliar with this device,
> I would say that        "1 DEVAPC AO/PDs"                    is not helpful at all.

Got it, I'll try to make it more readable.

> 
> > [1] https://urldefense.com/v3/__https://lkml.org/lkml/2020/7/6/168__;!!CTRNKA9wMg0ARbw!0pAmVqUrtDEDPT-QkQENXso-_umOz2nbe-DDIlMb1sEsD57BaKtDZF47QFTfMSP-$ 
> > 
> >>
> >>> +	  The violation information are logged for further analysis or
> >>
> >> 	                            is
> >>
> >>> +	  countermeasures.
> >>
> >> thanks.
> > 
> 
> 
> thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
