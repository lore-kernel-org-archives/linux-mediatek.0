Return-Path: <SRS0=Jt7l=BW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B9A0C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 11:57:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26B282065C
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 11:57:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E+42mVvx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="M5Ikbd4q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26B282065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g6QheoXPq/tjQHyRN5Xws6DMwT5C8H8K5LRWiYT3+j8=; b=E+42mVvxTecur8by4qjK2bNQx
	y2y2SI3h9xoIUJxTK6BG8JJ7ryG6gjDvPRUG/dJ/puHg2LzRlVgHD0KSCjaO6/iVTSg/2FetNwNuR
	i2vI+jiHvjR3f1AxsINbcJYpjHRksSJwNh3adOPSrX0VlQk8qsvYa9zsPV+BzT3ZEPBB7jREOhrD7
	bILKfWqYnq6HbLWPxRgPTVKTw6gnWcqhbkaZHLoCbCdqe5BJuzeM4opRuENZ+z4LScp4Z1vdXYbWN
	UxugG2MMBcb9FEZrUCHPLkm6x4d8glV4Pj7dH9a5QtEr56HqKLPZ9Cv2fjp2ToFzll6gTkrEQOeVt
	Aeo19nDrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5pNP-0005gL-9I; Wed, 12 Aug 2020 11:57:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5pNK-0005fR-3j; Wed, 12 Aug 2020 11:56:59 +0000
X-UUID: 12baea6004584c36850085653f8ce21b-20200812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=CPfvLHBxlQlMKioayJomvxJW3VbWFN9owalBbLtburM=; 
 b=M5Ikbd4qPeLS5jyUTSz9kWCUmWje9AsCNpgncMYhCDsGxhvzgS/aydCT5ulaJQ0lpBXlwWRZDdIo+HUX2sF0sEpRFanHFKOa8wv2eL7fy0sLKlLdGggqpCKA8T9S3sYQKP0TktNrTUozxuzuQnnVatXMv/Tu8jg5e/ejlnwF8fQ=;
X-UUID: 12baea6004584c36850085653f8ce21b-20200812
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1222777576; Wed, 12 Aug 2020 03:56:51 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Aug 2020 04:56:49 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 12 Aug 2020 19:56:46 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 12 Aug 2020 19:56:46 +0800
Message-ID: <1597233352.10188.2.camel@mhfsdcap03>
Subject: Re: Aw: [PATCH 3/3] mmc: mediatek: add optional module reset property
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Frank Wunderlich <frank-w@public-files.de>
Date: Wed, 12 Aug 2020 19:55:52 +0800
In-Reply-To: <trinity-5b810acf-eb8f-452e-b08a-30e1fe46226d-1597226878715@3c-app-gmx-bap56>
References: <20200812093726.10123-1-wenbin.mei@mediatek.com>
 <20200812093726.10123-4-wenbin.mei@mediatek.com>
 <trinity-5b810acf-eb8f-452e-b08a-30e1fe46226d-1597226878715@3c-app-gmx-bap56>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: EE4356F3A23EF08C004D9C72FDAC0CE917E712D37CC61975CF9F4085EF6906DC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_075658_359729_D4ACF7A0 
X-CRM114-Status: GOOD (  17.17  )
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
On Wed, 2020-08-12 at 12:07 +0200, Frank Wunderlich wrote:
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
> 
> imho this should contain a fixes-Tag as it fixes eMMC-Access on mt7622/Bpi-R64
> 
> before we got these Errors on mounting eMMC ion R64:
> 
> [   48.664925] blk_update_request: I/O error, dev mmcblk0, sector 204800 op 0x1:(WRITE) flags 0x800 phys_seg 1 prio class 0
> [   48.676019] Buffer I/O error on dev mmcblk0p1, logical block 0, lost sync page write
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
