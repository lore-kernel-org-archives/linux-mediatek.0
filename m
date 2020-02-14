Return-Path: <SRS0=lPor=4C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C6EC35242
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2020 06:48:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 136542187F
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2020 06:48:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jSgqUVdZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="mNOYLuie"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 136542187F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hlKTACYP3X6UKTND/WIVQKdIWVb0YgjyHVdk59dbFEs=; b=jSgqUVdZw6VUEW
	rTtUD7zz+v2EZX5wB5xvhin9N500LfTczKLtEn4m3ZxLjp+ARUAq1ORePBExGWiosLN0UO9fw7isi
	CxzVF+lU8LeaKT3wN16BTVdCpv8lcTOfD0NZoj2Fo6xFOleHubOb9J/6/gtiOfZpExfqo6kW2rD+g
	1QQGiBqZo9FaUoZ1p7F/7W4A8hmvcVsgYMnZ2aZDQdrWLwfxf08YBSuTGwcXszAeLP+C/BO6mL2ky
	8tmzCM1h7MyKQMjwXdJ9w8mRUa/3vHvZjl8u38hYwMVpCZajlmkOYzvtnkzdciB/XWcujWKEV0Mac
	BXpvANRTAmVtvz796HuA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2UmP-0003dE-Fn; Fri, 14 Feb 2020 06:48:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2UmF-0003Uh-1E; Fri, 14 Feb 2020 06:48:40 +0000
X-UUID: f115d0698aaa436380569af2208ee355-20200213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=793AtRhL6KTU8oRy5ebaU3z1XDM9P+It3bT3YTeZoSU=; 
 b=mNOYLuie8RFfAObLdxVKO47u9kXFV9XODlwdMQBEcAs/8GHTOLaBqkdm0YIMMXTK6xRaEKjsdVmN3S7XyjLLC8fcRMvcrbQ32vCQvHhtjySMHNWP+RXOIUVsnohSlwPNEbUNU1DMVrz/mMGiepG83AUfnrHOxmDNkYubsbdkY+g=;
X-UUID: f115d0698aaa436380569af2208ee355-20200213
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 786401139; Thu, 13 Feb 2020 22:48:35 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 13 Feb 2020 22:48:32 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 14 Feb 2020 14:47:41 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 14 Feb 2020 14:48:32 +0800
Message-ID: <1581662912.17949.4.camel@mtksdaap41>
Subject: Re: [PATCH 2/3] drm/mediatek: make sure previous message done or be
 aborted before send
From: CK Hu <ck.hu@mediatek.com>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Date: Fri, 14 Feb 2020 14:48:32 +0800
In-Reply-To: <20200214044954.16923-2-bibby.hsieh@mediatek.com>
References: <20200214044954.16923-1-bibby.hsieh@mediatek.com>
 <20200214044954.16923-2-bibby.hsieh@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200213_224839_086768_84E0CA1F 
X-CRM114-Status: GOOD (  16.96  )
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
Cc: drinkcat@chromium.org, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tfiga@chromium.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Bibby:

On Fri, 2020-02-14 at 12:49 +0800, Bibby Hsieh wrote:
> Mediatek CMDQ driver removed atomic parameter and implementation
> related to atomic. DRM driver need to make sure previous message
> done or be aborted before we send next message.
> 
> If previous message is still waiting for event, it means the
> setting hasn't been updated into display hardware register,
> we can abort the message and send next message to update the
> newest setting into display hardware.
> If previous message already started, we have to wait it until
> transmission has been completed.
> 
> So we flush mbox client before we send new message to controller
> driver.
> 

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> This patch depends on ptach:
> [0/3] Remove atomic_exec
> https://patchwork.kernel.org/cover/11381677/
> 
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 3c53ea22208c..e35b66c5ba0f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -491,6 +491,7 @@ static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
>  	}
>  #if IS_ENABLED(CONFIG_MTK_CMDQ)
>  	if (mtk_crtc->cmdq_client) {
> +		mbox_flush(mtk_crtc->cmdq_client->chan, 2000);
>  		cmdq_handle = cmdq_pkt_create(mtk_crtc->cmdq_client, PAGE_SIZE);
>  		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
>  		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
