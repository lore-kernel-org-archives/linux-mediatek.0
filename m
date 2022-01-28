Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D074C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jan 2022 10:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yUUldSotdi4bpmOZZ1JgLRICSaVU+RGnX2YQysrSz0M=; b=ukQHtg4nYXx2c0
	xN4UFEfapWikYDIlC3eRSRafjkZQdgfnPU3lgIUfJDsieSwNt2RJLlrvsvB4N3R6EL8T49sGYkMfp
	WsQgDeNnBeVCvhOUnLN2AEF2cf8TIXQu3JmQx9USXQojeZWgiUDzEsOSS6lNIl9ZjWA0d2cEHmHYO
	ZOKlQTysIIvmMUmk6ZbsjQXqQAQlnAyoUVfaEZ+7vpcwcO9muy0LURAQi7yt6SdibqX43Af2dbr98
	Rt1mPFELhzfMfC4rBSZyooFz7EV10+51KNn2zqzuAVf/ksidQee19oFfzmIBxUXoAp4vHh+OnNci4
	WzQj3j7oKWWvtPAant9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDOPH-001SDN-AS; Fri, 28 Jan 2022 10:23:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDOJm-001QIG-CR; Fri, 28 Jan 2022 10:17:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7BFD061E0F;
 Fri, 28 Jan 2022 10:17:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 479D6C340E8;
 Fri, 28 Jan 2022 10:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1643365040;
 bh=TS3ZHEXIHp9rGILPKv/FSpRiPRtUzwCDCOlCFn5B+no=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jCBcr0AbPP7BoKtnFXY2BdMSNgxOz2/wIHtgt0lkvgbdmyldY+uWKVDv5H4ge8PPH
 lKB7dN0sGj06Yvk0xBAKireqO7udEXN7ntMkXWJREwcw3MQ1BxV4GCgbecD7IjN8nf
 QlUG/E63vzkXmma51jq22b9ZSFADATezi0gfLubg=
Date: Fri, 28 Jan 2022 11:17:18 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhou Qingyang <zhou1615@umn.edu>
Cc: kjlu@umn.edu, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Alexandre Courbot <acourbot@chromium.org>,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: mtk-vcodec: media: mtk-vcodec: Fix a NULL pointer
 dereference in mtk_vcodec_fw_vpu_init()
Message-ID: <YfPCrjuXhRYEKOFC@kroah.com>
References: <20220124171503.61098-1-zhou1615@umn.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220124171503.61098-1-zhou1615@umn.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_021722_558185_03F57588 
X-CRM114-Status: GOOD (  25.62  )
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

On Tue, Jan 25, 2022 at 01:15:03AM +0800, Zhou Qingyang wrote:
> In mtk_vcodec_fw_vpu_init(), devm_kzalloc() is assigned to fw and there is
> a dereference of it right after that, which could lead to NULL pointer
> dereference on failure of devm_kzalloc().
> 
> Fix this bug by adding a NULL check of fw.
> 
> This bug was found by a static analyzer.
> 
> Builds with 'make allyesconfig' show no new warnings,
> and our static analyzer no longer warns about this code.
> 
> Fixes: 46233e91fa24 ("media: mtk-vcodec: move firmware implementations into their own files")
> Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
> ---
> The analysis employs differential checking to identify inconsistent 
> security operations (e.g., checks or kfrees) between two code paths 
> and confirms that the inconsistent operations are not recovered in the
> current function or the callers, so they constitute bugs. 
> 
> Note that, as a bug found by static analysis, it can be a false
> positive or hard to trigger. Multiple researchers have cross-reviewed
> the bug.
> 
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c
> index cd27f637dbe7..33ae88a9f9da 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c
> @@ -102,6 +102,9 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_vpu_init(struct mtk_vcodec_dev *dev,
>  	vpu_wdt_reg_handler(fw_pdev, mtk_vcodec_vpu_reset_handler, dev, rst_id);
>  
>  	fw = devm_kzalloc(&dev->plat_dev->dev, sizeof(*fw), GFP_KERNEL);
> +	if (!fw)
> +		return ERR_PTR(-ENOMEM);
> +
>  	fw->type = VPU;
>  	fw->ops = &mtk_vcodec_vpu_msg;
>  	fw->pdev = fw_pdev;
> -- 
> 2.25.1
> 

As stated before, umn.edu is still not allowed to contribute to the
Linux kernel.  Please work with your administration to resolve this
issue.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
