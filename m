Return-Path: <SRS0=+qQs=FF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A0EC64E7B
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 09:59:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18218204FD
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 09:59:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0jfDX+Uu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18218204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AzV80KTQweOzo42UEy3s2EdL2gscfxU40/YuO5ofVO4=; b=0jfDX+Uu6cjVjlKaCmBKzF9jJ
	2iq6p3KUGfMgJeq0D1Zv/+YMIFxHpVfcZVpkuAHCvH58mA50DISjHOEaAOV75X55qQ6x3XTSywT21
	taNa7A+rFE/9u+lcBhtMhVKyBuJ0se/uqL1Y/IdPbP/L8kQFHmmOW67Ve9tWhLIzOZkLTL5aRDStB
	rnJ++oSErQBFff9zQa5MZVsjkS1ayVU16FPT60pHfPYrs83uItT+Z/smZtiwyihryr0ek1FTADvCS
	WfgBy3jvxNN+w0mPXz1o9L1tTIFCN3JVSVbxJdwvvxFGAE09dbSJSNpezI1j9q0pDcwg9cMFu/MYg
	01yUolkLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk2Ri-0001Z7-6f; Tue, 01 Dec 2020 09:59:42 +0000
Received: from asavdk3.altibox.net ([109.247.116.14])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk2Re-0001XA-0R; Tue, 01 Dec 2020 09:59:38 +0000
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id D17CC2001E;
 Tue,  1 Dec 2020 10:59:31 +0100 (CET)
Date: Tue, 1 Dec 2020 10:59:30 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: allen <allen.chen@ite.com.tw>
Subject: Re: [PATCH v5] drm/bridge: add it6505 driver
Message-ID: <20201201095930.GA1981628@ravnborg.org>
References: <20201201054454.51240-1-allen.chen@ite.com.tw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201201054454.51240-1-allen.chen@ite.com.tw>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Ibmpp1ia c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=Ns9eNvu6AAAA:8 a=mpaa-ttXAAAA:8 a=cm27Pg_UAAAA:8
 a=1XWaLZrsAAAA:8 a=qw3Jv0Z29LwRxbBwalcA:9 a=CjuIK1q_8ugA:10
 a=LZLx1i01EnjtqRv10NxV:22 a=6heAxKwa5pAsJatQ0mat:22
 a=xmb-EsYY8bH0VWELuYED:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_045938_180279_CB3D2B82 
X-CRM114-Status: GOOD (  14.54  )
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
Cc: Kenneth Hung <Kenneth.Hung@ite.com.tw>, Jitao Shi <jitao.shi@mediatek.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Yilun Lin <yllin@google.com>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 David Airlie <airlied@linux.ie>, Hermes Wu <hermes.wu@ite.com.tw>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Pi-Hsun Shih <pihsun@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Allen.
On Tue, Dec 01, 2020 at 01:44:41PM +0800, allen wrote:
> This adds support for the iTE IT6505.
> This device can convert DPI signal to DP output.
> 
> From: Allen Chen <allen.chen@ite.com.tw>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> Signed-off-by: Yilun Lin <yllin@google.com>
> Signed-off-by: Hermes Wu <hermes.wu@ite.com.tw>
> Signed-off-by: Allen Chen <allen.chen@ite.com.tw>

I recall I provided the same comment as last time, but may remember
wrong.

New bridge drivers shall support that connector creation is optional.
This driver does not do that - see following code snippet:

+       if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
+               DRM_ERROR("Fix bridge driver to make connector optional!");
+               return -EINVAL;
+       }
+

I did not check, but likely the drive needs to implment some of the
connector hooks too. (detect, get_edid, etc).

Please include a changelog too - it can be very hard to remember what
feedback was provided when one reviews several patches/week.

	Sam

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
