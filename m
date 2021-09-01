Return-Path: <SRS0=BCEy=NX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 312E4C432BE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 03:49:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00D4260FF2
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 03:49:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 00D4260FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0V2Dzoie3trXMtPfL7m+vzPNSn35N/AidWEEdjyoTg0=; b=4oqmwzersh8Kpb
	DpVyXggDfpavPPwOztSYanQ/YRPLrtcj//3xRuj+c98QeYYfH8t9oDaqDbkh6v6iCLhOCsMxAD7Ef
	qlvrCcV2cTPTon7Q7oNy40Y0CV9a4CHBTIAp65pZPup6OFOtqutyewDniaW5m08LjTtih1TRDCPN+
	eUVI2zhvLCKIciZOLOSCk2SjFdMnobQx7VBr77KG3IAibF/6iyBRFYvMHrM9T3Opr0vn8MJsX1BoM
	R4OwzAzO1au95N2xadlbX4tG/+J5ki9QY2t1RVE0teOJuP8K8dg0+h9bIDRP1oNtHPz2QFyA296LB
	/TssoyPRpqAKUTmri+cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLHFA-003hjo-JB; Wed, 01 Sep 2021 03:48:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLHEq-003hYH-0Z; Wed, 01 Sep 2021 03:48:39 +0000
X-UUID: f9bdb05323c3498391825c6254a26e24-20210831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=hGt1wc4kq8kljXgVH5HFAtVh2cBIgecvwIJfVOk/B78=; 
 b=XGSc1ODAjT0mV2s0iM2ZCN5ZLLFj97vqirnpITeZ4O7adYUA9512FZ4vcLrrq/5iuNcvvFZuG4v6OzeCUYPyZ/MbWvq0HK1YjUsUM32iw7cNLz2SZbKUDenOdIhQ4mLCVRgQLNcvmqgfpXdalXKXNIN/CP/0waxuPj+Z6x1gpj4=;
X-UUID: f9bdb05323c3498391825c6254a26e24-20210831
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2018249345; Tue, 31 Aug 2021 20:48:30 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 Aug 2021 20:48:28 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Sep 2021 11:48:27 +0800
Received: from mtksdccf07 (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Sep 2021 11:48:27 +0800
Message-ID: <535478691c3a9ed31b508f59dc897be57c4213c0.camel@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: SND_SOC_MT8195 should depend on
 ARCH_MEDIATEK
From: Trevor Wu <trevor.wu@mediatek.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 1 Sep 2021 11:48:27 +0800
In-Reply-To: <7e628e359bde04ceb9ddd74a45931059b4a4623c.1630415860.git.geert+renesas@glider.be>
References: <7e628e359bde04ceb9ddd74a45931059b4a4623c.1630415860.git.geert+renesas@glider.be>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_204836_088309_EDB68858 
X-CRM114-Status: GOOD (  19.22  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2021-08-31 at 15:18 +0200, Geert Uytterhoeven wrote:
> The Mediatek MT8195 sound hardware is only present on Mediatek MT8195
> SoCs.  Hence add a dependency on ARCH_MEDIATEK, to prevent asking the
> user about this driver when configuring a kernel without Mediatek SoC
> support.
> 
> Fixes: 6746cc858259985a ("ASoC: mediatek: mt8195: add platform
> driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  sound/soc/mediatek/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
> index cf567a89f421b4c0..c8c815f599da90bf 100644
> --- a/sound/soc/mediatek/Kconfig
> +++ b/sound/soc/mediatek/Kconfig
> @@ -187,6 +187,7 @@ config SND_SOC_MT8192_MT6359_RT1015_RT5682
>  
>  config SND_SOC_MT8195
>  	tristate "ASoC support for Mediatek MT8195 chip"
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
>  	select SND_SOC_MEDIATEK
>  	help
>  	  This adds ASoC platform driver support for Mediatek MT8195
> chip

Hi Geert,

Thanks for your patch first.
I really missed the dependency declaration.
But we only test "depends on ARCH_MEDIATEK" internally, maybe removing
"COMPILE_TEST" like other MTK series is better for the maintenance in
the future.

Thanks,
Trevor
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
