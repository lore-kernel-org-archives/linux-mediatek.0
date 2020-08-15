Return-Path: <SRS0=5o2P=BZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B77AEC433E1
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Aug 2020 01:51:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 757FB22DBF
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Aug 2020 01:51:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Uc8OpZms";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="k3h9l8xI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 757FB22DBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DO+6kWxsSFOv7L9+tfQAgUSXpfXNb99jCMBehp2eljg=; b=Uc8OpZmsmJS3hKo5MsFxX2E9P
	QxVaSjivwgpLqE2UDXZGqyLBMlo8mgJvjmCxkqKyGeoSzQZWcFfUGCicNfsDedbfPbsXcmxI0kP9H
	0YamEsaTr3qf9QCxuMGiCobHBA4SNDGRYZZrk83IF9dD37E03cx1Qa4TYs6i/XP6q7LAeNy3bs3LE
	ghFNOF6m6zdLjoLH3CoZbPOXaTbLmt7Q+52DvQ/9U2fr1hMsZleR4dlLiFcmuLv3BLi9xi8Ei5Y0u
	p6EfxVajD+tSXp0M9/hWIv640H/Bzza40qTWP6/YYYge/kKt8ItXOiYsJaFr7jrHGW19bqURJxqie
	pEliWoTUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6lLs-0005HO-UE; Sat, 15 Aug 2020 01:51:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6lLn-0005Gd-92; Sat, 15 Aug 2020 01:51:18 +0000
X-UUID: e4d376636ae24ca6bf14d8080f5f90fa-20200814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=n9njsq915j0JYG65leUcPbjz+yOQwVnYcVyh/RsTob0=; 
 b=k3h9l8xI+UjhdQn/XXB5LkbXbJFuqhm5bfwrzCeL6Y6jPKQShUcqzbveq53CQpjM117VedtL0Lx5WtYGACU4DrFPHHy6q7w2kcHITDYjVx9w2iZ6xF7w35sZxAdgjXAFFT4K68LubuknO/CWaT746+VVDBJlCp927w8TmaabGJ0=;
X-UUID: e4d376636ae24ca6bf14d8080f5f90fa-20200814
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chaotian.jing@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1662901845; Fri, 14 Aug 2020 17:51:07 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 18:51:07 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 15 Aug 2020 09:50:58 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 15 Aug 2020 09:51:03 +0800
Message-ID: <1597456202.5805.1.camel@mhfsdcap03>
Subject: Re: [v5,1/3] mmc: dt-bindings: Add resets/reset-names for Mediatek
 MMC bindings
From: Chaotian Jing <chaotian.jing@mediatek.com>
To: Wenbin Mei <wenbin.mei@mediatek.com>
Date: Sat, 15 Aug 2020 09:50:02 +0800
In-Reply-To: <20200814014346.6496-2-wenbin.mei@mediatek.com>
References: <20200814014346.6496-1-wenbin.mei@mediatek.com>
 <20200814014346.6496-2-wenbin.mei@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C8FD9DD34606C848FD83AB8A56F0552016427AB87C044E1B6AB2864E9C3F66842000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_215115_506461_3D109D42 
X-CRM114-Status: GOOD (  15.39  )
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
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-08-14 at 09:43 +0800, Wenbin Mei wrote:
> Add description for resets/reset-names.
> 
> Cc: <stable@vger.kernel.org> # v5.4+
> Fixes: 966580ad236e ("mmc: mediatek: add support for MT7622 SoC")
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> Tested-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: Chaotian Jing <chaotian.jing@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.txt b/Documentation/devicetree/bindings/mmc/mtk-sd.txt
> index 8a532f4453f2..09aecec47003 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.txt
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.txt
> @@ -49,6 +49,8 @@ Optional properties:
>  		     error caused by stop clock(fifo full)
>  		     Valid range = [0:0x7]. if not present, default value is 0.
>  		     applied to compatible "mediatek,mt2701-mmc".
> +- resets: Phandle and reset specifier pair to softreset line of MSDC IP.
> +- reset-names: Should be "hrst".
>  
>  Examples:
>  mmc0: mmc@11230000 {

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
