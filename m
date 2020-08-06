Return-Path: <SRS0=30uw=BQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3FB3C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 12:20:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D7CA204FD
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 12:20:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AXwnEHd7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="e7LJq29O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D7CA204FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ebONAp7ijB2tgLUSj+1prIZuRVmod4/cmMDPdZX611g=; b=AXwnEHd72sH5XkqbO6ESMc2CQ
	ExpOf4Flj0JDJ2mXayfbYIVdcH/C+D+h/F/Yq+tHKf1a8mYwISlMIO+r+ggEMC0RC/nciyRgDVH1f
	PJnyTJ/jO/1czpHptlFu9H/IMJMk2BWAj9/LRVVQ/2ZBuvEB56KwEnwVCemxIO1lCmzVBRFPw3Xbu
	iEzRPVIsjdiq49VXTUgH6sHVbdUb5GoG4ieqy3/Yf82H70DMc3uM8yv/rCH3JANX13fBMxPvK2sG7
	aqOfPxSrs7EUe/2Q8VLO9KVK7Zey4gdNFZeIl5J9A4Ws5OZvlEUPDmEuiUW/pinr57I2+VExjizvi
	abd+aqhwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3dkU-0002Bj-8Q; Thu, 06 Aug 2020 11:07:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3dkR-0002Ac-0X; Thu, 06 Aug 2020 11:07:48 +0000
X-UUID: 412f4fa15cf443439dd20c6cbc3c54a1-20200806
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=81yr++aU7+XxgAqjzy+4dxBSf9qaA6XpetwM97SESGs=; 
 b=e7LJq29OgasN7UOqAY9dT759QzXEoNacew8H+ap9oqxiKRl+noQDphmm4jZONqrjtTOVt6O80tqAvD+32Ae0uqx0Dtjmu1B5BEmI7tohA802YBAg1GbXii6Hr0DXlmJ6V9YAz7oI1yza4Kqnqf4NH41oykPJ1+mV+zpR/DnP9qw=;
X-UUID: 412f4fa15cf443439dd20c6cbc3c54a1-20200806
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 3606564; Thu, 06 Aug 2020 03:07:36 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Aug 2020 04:07:33 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs02n1.mediatek.inc
 (172.21.101.77) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 6 Aug 2020 19:07:26 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 6 Aug 2020 19:07:27 +0800
Message-ID: <1596712005.8263.4.camel@mhfsdcap03>
Subject: Re: [PATCH] i2c: mediatek: Fix i2c_spec_values description
From: Qii Wang <qii.wang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Thu, 6 Aug 2020 19:06:45 +0800
In-Reply-To: <c410f784-7b51-0d65-7a41-3845214dd273@gmail.com>
References: <c410f784-7b51-0d65-7a41-3845214dd273@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_070747_243406_2A967CBE 
X-CRM114-Status: GOOD (  15.94  )
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
Cc: Matthias Brugger <mbrugger@suse.com>, wsa@the-dreams.de,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-i2c@vger.kernel.org, yingjoe.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-08-06 at 11:48 +0200, Matthias Brugger wrote:
> The struct i2c_spec_values have it's members documented but is missing the 
> starting '@', which leads to warings like:
> 
> drivers/i2c/busses/i2c-mt65xx.c:267: warning: Function parameter or member 
> 'min_low_ns' not described in 'i2c_spec_values'
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>   drivers/i2c/busses/i2c-mt65xx.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index e889f74703e4..f51b35fc400f 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -253,10 +253,10 @@ struct mtk_i2c {
> 
>   /**
>    * struct i2c_spec_values:
> - * min_low_ns: min LOW period of the SCL clock

Can you help me add a description of min_high_ns. As
@min_high_ns: min HIGH period of the SCL clock
Thanks
 
> - * min_su_sta_ns: min set-up time for a repeated START condition
> - * max_hd_dat_ns: max data hold time
> - * min_su_dat_ns: min data set-up time
> + * @min_low_ns: min LOW period of the SCL clock
> + * @min_su_sta_ns: min set-up time for a repeated START condition
> + * @max_hd_dat_ns: max data hold time
> + * @min_su_dat_ns: min data set-up time
>    */
>   struct i2c_spec_values {
>   	unsigned int min_low_ns;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
