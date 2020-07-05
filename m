Return-Path: <SRS0=Yo4y=AQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA23C433DF
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jul 2020 09:44:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6B3520786
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jul 2020 09:44:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qZxRl1Jh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="G1t2Xboh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6B3520786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kzUu5kEzDQUVTNQ9BR0P1swP+Ssry1DMwwnxArNn6QE=; b=qZxRl1Jh4B+INu9I2Wcibf1WQ
	2oMFJwMHhymwl4sPuNE8av9ZLEb+6yicJFTumWtmqEC3xlYmgkNM8C8Q/jVQQFD8TlF/YDD+dMR+p
	fCccBj+uzc21II3OrTIVun7I0xJDMh+I4JtpgEinHPArzeHUgJQfj67C6phkI9qJ/3B/HY3IjyvNT
	/6zZ6hLo5//ur8OBBIuOHxIP9xtxEsANa1AFxfOosDJZf8feDIZxtJlKbXT3GqqpmMEyoNcV7QxZ0
	MbJVGTX/cY1UGvVYlMe5ucLla6JGR3f/mh8MiM79lbN1cC4Jr5q5I2wa5OIJDiYC5uhk6atSZUHUO
	JysXdr8DA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1js1CK-0005Et-Mf; Sun, 05 Jul 2020 09:44:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1js1CG-0005Dw-Qq
 for linux-mediatek@lists.infradead.org; Sun, 05 Jul 2020 09:44:29 +0000
X-UUID: d49312b6a2484e1299ff3f225a05a13b-20200705
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=bVAN/Pr8hp2riddPU0Ip98uCQV+TayeMJMDOKh3eCMI=; 
 b=G1t2XbohuX5vrSHUSv00rfOOvnOD7dzzgBrqvUOjVP2NR+ys05ynEDkgxkFzIMiDZYxpCGwEt8iRA34aK4RUqjWzULJbiC80tDdzl0hda9Rw1psiKq/Xj+NPfMNO3p0gnXBABb+adNrlKWn9RvRn4NvepK/pRXgtSDPr/b/2cGg=;
X-UUID: d49312b6a2484e1299ff3f225a05a13b-20200705
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1806175037; Sun, 05 Jul 2020 01:44:14 -0800
Received: from MTKMBS33DR.mediatek.inc (172.27.6.106) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 5 Jul 2020 02:44:14 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 5 Jul 2020 17:44:12 +0800
Received: from [10.16.6.141] (10.16.6.141) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 5 Jul 2020 17:44:11 +0800
Message-ID: <1593942260.24547.0.camel@mszsdaap41>
Subject: Re: [PATCH] drm/panel: auo,b116xw03: fix flash backlight when power on
From: Jitao Shi <jitao.shi@mediatek.com>
To: Sam Ravnborg <sam@ravnborg.org>
Date: Sun, 5 Jul 2020 17:44:20 +0800
In-Reply-To: <20200705080637.GA1745670@ravnborg.org>
References: <20200703095113.55712-1-jitao.shi@mediatek.com>
 <20200705080637.GA1745670@ravnborg.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A3D6659F2DC4FFFA11B5C6F5A8FFA03230239A4D2ADD46D9DBF384DD810AE9CF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200705_054429_003338_083CC7F6 
X-CRM114-Status: GOOD (  16.53  )
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
Cc: David Airlie <airlied@linux.ie>, huijuan.xie@mediatek.com,
 stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 ck.hu@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 2020-07-05 at 10:06 +0200, Sam Ravnborg wrote:
> Hi Jitao.
> 
> On Fri, Jul 03, 2020 at 05:51:13PM +0800, Jitao Shi wrote:
> > Delay the backlight on to make sure the video stable.
> > 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > ---
> >  drivers/gpu/drm/panel/panel-simple.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index 3ad828eaefe1..18f34f286d3d 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -734,6 +734,9 @@ static const struct panel_desc auo_b116xw03 = {
> >  		.width = 256,
> >  		.height = 144,
> >  	},
> > +	.delay = {
> > +		.enable = 400,
> > +	},
> >  };
> >  
> >  static const struct drm_display_mode auo_b133xtn01_mode = {
> 
> Patch did not apply to drm-misc-next.
> Please update - and when you do so also add:
> .bus_flags
> .bus_format
> .connector_type
> 
> So we have this panel properly defined.
> 
> 	Sam

Thanks for your review.
I'll add those next version.

Jitao
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
