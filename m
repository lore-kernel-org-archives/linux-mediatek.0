Return-Path: <SRS0=+t0h=23=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82068C32771
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jan 2020 06:58:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4685A215A4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jan 2020 06:58:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="shlvV4H4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Hbr1iiIw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4685A215A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RYiOJGCAt6V2gf7curxfJhobIy5leskmR0+KCUnJK4c=; b=shlvV4H4NtpRPV
	Ln8TCRizBJHlRITDlhrAcnIe0px6Q5j2huaiq6nwTpnPcxrfCoPwhCPJRtkpmcsR0JJ0mjBzRs5Q7
	ZxUEQNi2lyVNiTtQpxZPb0Yhizxqz0G1OSwuR5Bnci7zCHEZqISIWuSiw2JmLmxTmFyMASDtEWqrc
	JzgykJd54KBRFOzWu0GWG/vDrIfaecKXdJFRG5u4Ezvr/Bb/WixY6P6H9oSez6i5zZI0ASV6RUkgg
	or22vW/+ZrGAhD+8lpOvi8Jf7OApGfhCDXbJIZD6v7CcJi0ApBn2lnaeZVOF6HnDkuhg+XwbxBVly
	U0xOwXhWnT4x+MxaNDaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ioML6-00072b-Ky; Mon, 06 Jan 2020 06:58:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ioML4-000726-Ek; Mon, 06 Jan 2020 06:58:11 +0000
X-UUID: 9990aa3cfbd348c8b66b7628a5b5a95f-20200105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=aYAZgI6ryqNleIeTmQWVE96vhfch+9yXx43Fz3GXDe0=; 
 b=Hbr1iiIwM5x+W94EmR46cxymgPfb+HIHweivpVQEJJZCEcrIrBzE+73oyEyn56Qh/CkstUDm8rnDdScizia4Z69tQOZxnI5xBM7ATIZFQrFs7mFrpjbWsWCJ8tSzTXRX6zeUnsTr3GcBEAeRqKEhi+3I3aJqGwilpPKk1jDl8LE=;
X-UUID: 9990aa3cfbd348c8b66b7628a5b5a95f-20200105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 201681531; Sun, 05 Jan 2020 22:58:04 -0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 5 Jan 2020 22:48:03 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Mon, 6 Jan 2020 14:47:41 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 6 Jan 2020 14:46:02 +0800
Message-ID: <1578293251.3044.1.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: fix indentation
From: CK Hu <ck.hu@mediatek.com>
To: Fabien Parent <fparent@baylibre.com>
Date: Mon, 6 Jan 2020 14:47:31 +0800
In-Reply-To: <20200103142445.55036-1-fparent@baylibre.com>
References: <20200103142445.55036-1-fparent@baylibre.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200105_225810_504414_7E94620D 
X-CRM114-Status: GOOD (  10.40  )
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
Cc: daniel@ffwll.ch, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Fabien:

On Fri, 2020-01-03 at 15:24 +0100, Fabien Parent wrote:
> Fix indentation in the Makefile by replacing spaces with tabs.
> 

Applied to mediatek-drm-next-5.6 [1], thanks.

[1]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-next-5.6

Regards,
cK

> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  drivers/gpu/drm/mediatek/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
> index 8067a4be8311..b2b523913164 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -21,7 +21,7 @@ obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
>  mediatek-drm-hdmi-objs := mtk_cec.o \
>  			  mtk_hdmi.o \
>  			  mtk_hdmi_ddc.o \
> -                          mtk_mt2701_hdmi_phy.o \
> +			  mtk_mt2701_hdmi_phy.o \
>  			  mtk_mt8173_hdmi_phy.o \
>  			  mtk_hdmi_phy.o
>  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
