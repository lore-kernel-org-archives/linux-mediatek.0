Return-Path: <SRS0=xfzx=33=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82035C352A2
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 09:43:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55CA8218AC
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 09:43:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eq5jBB9S";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="PUFN4niI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55CA8218AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=spZOJWNG14H0fE7dew/N076/brMn+SmXfxrGlO0Vhng=; b=eq5jBB9S7ZR2dx
	VvqVcwWTocZk8s4IbDvOWM4nprkzSSyVkLilzKgGWYzHFwkS+rQq1JTqhChCDDyVRVLHPKaLa7cb1
	Mywn957a8BgYD1hIePBtMKHMyNZweQD1nGqAxOumAem16Pq7B1KYXlHPp4DLv9iK/D8B/MadVlkYw
	LUtFjeuBTK+K8e5xfujvxm+2FX5nEJ7/uPO3/VRRKthJYzkrQYR/MH1/M/uKhpvWcs8/9Om7IfMIm
	QUjhCACQ+TT/AP/Pn1OhD3wxLEj/df/9Nc2y/ezqBgcArK2H0ZLr6bsqT4iZq+VRllEmupprHvwao
	UbYNt7+c7Ce2xS9gaPpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j00AH-000806-Iw; Fri, 07 Feb 2020 09:43:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j00A9-0007sl-TQ; Fri, 07 Feb 2020 09:43:04 +0000
X-UUID: 42e8a891972e431293b686dd418eecda-20200207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=m74yjQkT2G8gL7JoqJhfpeZ6P0zLpKwVgqiwmutKy3g=; 
 b=PUFN4niIigJ5y4h9n6/8BFNCnIfv41AI2DNojRUrHJcG0/L3pCWJVbOa8n7ah4u0oGqJELS6wUtwpZQWf1NGfjjTsy4kQg9dIKuR64MEb5FOX+YyZevs/B0Q/QC9NtfU+b6tatMNH5cZ5nqCzjEYNmsXqs6rBH1gPQFSYLXZaYk=;
X-UUID: 42e8a891972e431293b686dd418eecda-20200207
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1512609855; Fri, 07 Feb 2020 01:42:58 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 7 Feb 2020 01:34:19 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 7 Feb 2020 17:33:30 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 7 Feb 2020 17:31:40 +0800
Message-ID: <1581068057.28261.0.camel@mtksdaap41>
Subject: Re: [PATCH v2 1/3] drm/mediatek: exit earlier if failed to register
 audio driver
From: CK Hu <ck.hu@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 7 Feb 2020 17:34:17 +0800
In-Reply-To: <20200206102509.1.Ieba8d422486264eb7aaa3aa257620a1b0c74c6db@changeid>
References: <20200206031752.193298-1-tzungbi@google.com>
 <20200206102509.1.Ieba8d422486264eb7aaa3aa257620a1b0c74c6db@changeid>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200207_014301_959053_D49E6C84 
X-CRM114-Status: GOOD (  12.98  )
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
Cc: alsa-devel@alsa-project.org, p.zabel@pengutronix.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, daniel@ffwll.ch, matthias.bgg@gmail.com,
 dgreid@google.com, linux-arm-kernel@lists.infradead.org, cychiang@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Tzung-Bi:

On Thu, 2020-02-06 at 11:17 +0800, Tzung-Bi Shih wrote:
> Exits earlier if register_audio_driver() returns errors.
> 

Acked-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index c79b1f855d89..23c2b0e8693d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1656,7 +1656,7 @@ static const struct hdmi_codec_ops mtk_hdmi_audio_codec_ops = {
>  	.get_eld = mtk_hdmi_audio_get_eld,
>  };
>  
> -static void mtk_hdmi_register_audio_driver(struct device *dev)
> +static int mtk_hdmi_register_audio_driver(struct device *dev)
>  {
>  	struct hdmi_codec_pdata codec_data = {
>  		.ops = &mtk_hdmi_audio_codec_ops,
> @@ -1669,9 +1669,10 @@ static void mtk_hdmi_register_audio_driver(struct device *dev)
>  					     PLATFORM_DEVID_AUTO, &codec_data,
>  					     sizeof(codec_data));
>  	if (IS_ERR(pdev))
> -		return;
> +		return PTR_ERR(pdev);
>  
>  	DRM_INFO("%s driver bound to HDMI\n", HDMI_CODEC_DRV_NAME);
> +	return 0;
>  }
>  
>  static int mtk_drm_hdmi_probe(struct platform_device *pdev)
> @@ -1705,7 +1706,11 @@ static int mtk_drm_hdmi_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	mtk_hdmi_register_audio_driver(dev);
> +	ret = mtk_hdmi_register_audio_driver(dev);
> +	if (ret) {
> +		dev_err(dev, "Failed to register audio driver: %d\n", ret);
> +		return ret;
> +	}
>  
>  	hdmi->bridge.funcs = &mtk_hdmi_bridge_funcs;
>  	hdmi->bridge.of_node = pdev->dev.of_node;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
