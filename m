Return-Path: <SRS0=Ncyn=2O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F9ABC2D0C0
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Dec 2019 02:18:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10FE620643
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Dec 2019 02:18:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QVwicgRI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="k3JkGaib"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10FE620643
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x5bA5fNTDJ9dnaCuhpbmcUodVDSlmS0GxZuxPnYOt2A=; b=QVwicgRIw2RKDf
	en9rB1qlKJyzfGrPkQSXPdtjJKy0Gl9S75j1WoENxttIsIU5owC8tSzR2zX1B+b9z3l3KuirfgBnJ
	RRImROsEDLrn53TwpdvNqQZTzzPj/2sD5aq3iBWYWIv/zJdDLcsXUfMRr2awtsViPwxM2CNKS5MJt
	dAjKNNZA9uBx/di9qpv5hd7yb2T4oQrOJhA7sG8pb1J+GM720rRVWwKJyT4CjFwnvkxX10LaH1K7E
	sB4yTKGRtr4oBDbWRZw3N/TM9WqG8AQgT3Yb9B8di+AUXyWV3+f5WEsCQfKYqulfO6QVRgzRIOwaK
	zobxzwqa3V3ud1T/wB2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijZmS-0007Ek-00; Tue, 24 Dec 2019 02:18:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijZmF-00074c-U0; Tue, 24 Dec 2019 02:18:29 +0000
X-UUID: 39782599e70840c398b2dd28b4ea8ac8-20191223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=16xFo3KU0nEDG/VMlRzWi955Bc53HVQ+4UJtznpAulY=; 
 b=k3JkGaibHrVFzAu3Qcxh5/QGdxvmPDpx6tWUsID67zbA/2b2ro+aDr2o/jBxwqtN2r9Wo+nwmNT21cSb4DV+oQDYFDYTKeggACAOLlurmjgedQ9EsQy2fbNbxM2vseUQSZa05DdW+Mbday+ndNPq40sGrGZbstWwrDyYO8rfLkI=;
X-UUID: 39782599e70840c398b2dd28b4ea8ac8-20191223
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1714018685; Mon, 23 Dec 2019 18:18:23 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 23 Dec 2019 18:18:45 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 24 Dec 2019 10:17:15 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 24 Dec 2019 10:17:22 +0800
Message-ID: <1577153898.15019.0.camel@mtksdaap41>
Subject: Re: [PATCH v2, 0/2] drm/mediatek: Add ctm property support
From: CK Hu <ck.hu@mediatek.com>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Date: Tue, 24 Dec 2019 10:18:18 +0800
In-Reply-To: <1576222132-31586-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1576222132-31586-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 038CC378C24033B372078724DE10872FC6D2686BD2692C93E805E6EC8F9A94AA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191223_181827_975702_02558095 
X-CRM114-Status: UNSURE (   9.13  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Yongqiang:

On Fri, 2019-12-13 at 15:28 +0800, Yongqiang Niu wrote:
> Changes since v1:
> -separate gamma patch
> -remove cmdq support for ctm setting
> 

For this series, applied to mediatek-drm-next-5.6 [1], thanks.

[1]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-next-5.6

Regards,
CK

> 
> Yongqiang Niu (2):
>   drm/mediatek: Fix gamma correction issue
>   drm/mediatek: Add ctm property support
> 
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 18 +++++++--
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 62 ++++++++++++++++++++++++++++-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  9 +++++
>  3 files changed, 85 insertions(+), 4 deletions(-)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
