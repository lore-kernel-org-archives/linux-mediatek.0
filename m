Return-Path: <SRS0=6j47=7G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C016C433DF
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 May 2020 17:45:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C4192073B
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 May 2020 17:45:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fthNCakd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C4192073B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0R10R46byeunSbOg+QC4MyVlsQyCCITp88U41UIRmOs=; b=fthNCakdmXmu6l
	PQG6cjBKR20D7cadtsyFzneapeMTNLUgXIfYy57PHv/ZE0DqyyxVXclYUxIWkAo4XkZDC7toTNouM
	U7jBgo9TKzpTUTVy6P860Y6BCuRvb7KwR6PvSU+Wv2pRCp/buT1Pq4W8vxfLg2UN1ZvYsw6TLgtWd
	M/gXKA0ZDoL82BusygTn886Rizv0olJV5j0Y7cKzKh1FoEz4gO9Eiv9vRricGsi3UO4G1/HC5vwid
	tPHocNS4dZKXBVOFbBnRkLOXYs8p+lDHsScCxN7fDLgWqWjCaJuefRw5zlO0+0vT1NPp8vjApwADW
	4VGnuwtkZzllvxRBBxxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcug8-0002vz-NO; Sun, 24 May 2020 17:44:52 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcufx-0002mB-GK
 for linux-mediatek@lists.infradead.org; Sun, 24 May 2020 17:44:43 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1jcuft-0000lZ-FB; Sun, 24 May 2020 19:44:37 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1jcufq-0002cY-Dp; Sun, 24 May 2020 19:44:34 +0200
Date: Sun, 24 May 2020 19:44:34 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH 1/1] pwm: mtk_disp: implement .apply()
Message-ID: <20200524174434.tcnszokabt2ymh7x@pengutronix.de>
References: <20200410031955.111392-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200410031955.111392-1-jitao.shi@mediatek.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200524_104441_542782_8BE3E23E 
X-CRM114-Status: GOOD (  10.24  )
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
Cc: linux-pwm@vger.kernel.org, srv_heupstream@mediatek.com,
 huijuan.xie@mediatek.com, stonea168@163.com, linux-kernel@vger.kernel.org,
 cawa.cheng@mediatek.com, ck.hu@mediatek.com,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 bibby.hsieh@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello,

On Fri, Apr 10, 2020 at 11:19:55AM +0800, Jitao Shi wrote:
> implement the apply() for pwm.
> =

> Fix the clock clk_prepare_enable and clk_disable_unprepare mismatch,
> switch the driver to support the ->apply() method.

Adding support for get_state is a separate change.

Other than that this patch looks more complicated that I would expect,
I think you can make this easier to understand/review by moving the
mismatch to a separate patch, too.

Can you please respin with these hints in mind, then I'm willing to
invest some time for a deeper review. In general it's very welcome to
convert the mtk-disp driver to the atomic API. Thanks for addressing
that.

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
