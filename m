Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87731C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 13:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5YjuwIGjzV6EjTSZhckB4xgoIfz2AYIN5AyV6R+T/co=; b=f7Sl0Bqep7ykmF
	8AmqQ0jD7w3+mtguTfeh2lRUTcjR9N5hGIlzXPGwrFZ4yRs5WW8zS9HJ7H2z+oFI3wYMBIbffd1UC
	IcBnYLar1oRGhcPoGG1FTJvuxtTm6urFAjd7KslZPVSWbcue18WRZq8kZ67eYfIsdAavf+5Men+1d
	YxB00JaRBiUaFw2aoZYxEFBE0dPNcFFgJU4dODKV/yq/Y3Qcuvk2qAd//RRpVfY52FWA6pv82E/o9
	lecokmDjXY8NF3HoJG0qqoQdNM2ImkAQws1ePj4c8pLKB062UHJEhF9DZAxuNzDtXUdTE0FCnp45L
	5403p0cVxZGHxKDbWsVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngny1-003sH3-Q6; Tue, 19 Apr 2022 13:32:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngn5A-003XAI-Qh; Tue, 19 Apr 2022 12:35:50 +0000
X-UUID: 389cd0fc0d0a4c0c8e743d2915c2713b-20220419
X-UUID: 389cd0fc0d0a4c0c8e743d2915c2713b-20220419
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1765917064; Tue, 19 Apr 2022 05:35:44 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 19 Apr 2022 05:25:42 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 19 Apr 2022 20:25:40 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 19 Apr 2022 20:25:40 +0800
Message-ID: <a1bd1703b39d46be48bfa1500f57c59f049d532a.camel@mediatek.com>
Subject: Re: [PATCH v2 2/2] remoteproc: mediatek: allow reading
 firmware-name from DT
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Ohad Ben-Cohen" <ohad@wizery.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-remoteproc@vger.kernel.org>
Date: Tue, 19 Apr 2022 20:25:40 +0800
In-Reply-To: <cb56d23b-fb80-426f-cc30-50ef351b0ad6@collabora.com>
References: <20220414122140.6114-1-allen-kh.cheng@mediatek.com>
 <20220414122140.6114-3-allen-kh.cheng@mediatek.com>
 <cb56d23b-fb80-426f-cc30-50ef351b0ad6@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_053548_934105_BCA71A90 
X-CRM114-Status: GOOD (  22.74  )
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

hi Angelo,

On Tue, 2022-04-19 at 13:49 +0200, AngeloGioacchino Del Regno wrote:
> Il 14/04/22 14:21, Allen-KH Cheng ha scritto:
> > The SCP firmware blob differs between platforms and SoCs. We add
> > support in the SCP driver for reading the path of firmware file
> > from
> > DT in order to allow these files to live in a generic file system
> > (or linux-firmware).
> > 
> > The firmware-name property is optional and the code falls back to
> > the
> > old filename if the property isn't present.
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >   drivers/remoteproc/mtk_scp.c | 7 ++++++-
> >   1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/remoteproc/mtk_scp.c
> > b/drivers/remoteproc/mtk_scp.c
> > index ee6c4009586e..82813d74e829 100644
> > --- a/drivers/remoteproc/mtk_scp.c
> > +++ b/drivers/remoteproc/mtk_scp.c
> > @@ -809,9 +809,14 @@ static int scp_probe(struct platform_device
> > *pdev)
> >   	struct mtk_scp *scp;
> >   	struct rproc *rproc;
> >   	struct resource *res;
> > -	char *fw_name = "scp.img";
> > +	const char *fw_name = "scp.img";
> >   	int ret, i;
> >   
> > +	ret = of_property_read_string(pdev->dev.of_node, "firmware-
> > name",
> > +				      &fw_name);
> 
> Hello Allen,
> the remoteproc subsystem provides a helper for that, please use it:
> 
> 	ret = rproc_of_parse_firmware(&pdev->dev, 0, &fw_name);
> 
> 
> > +	if (ret < 0 && ret != -EINVAL)
> > +		return ret;
> 
> ... this check is necessary, so you can keep this one.
> 
> Thanks,
> Angelo
> 

ok, no problem.
I will update in next version.

thanks,
Allen

> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
