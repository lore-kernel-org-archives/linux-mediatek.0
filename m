Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC11C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jan 2022 10:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kYnnZS1VEThq+rjvlGfdJVzAf//+bfSrKy7Y23mI4oI=; b=DGNHhLXmNuhSlD
	F3l5SFEhDRP9kZrjLgVPjaiDdOkGgWp+G8ftGbmf/1tYt4xyXPhv1yhVng+3lCo0MlXuD9MNfUSmb
	ybmp189YP7d9KR1nhmet5Z57sU90o1gvMbXGx7y+UtA3gMUER1rSITzuQEKWW7zgydNY6eP4sxGYS
	wCwRvpjRt/6pRtxLSuwzxsh2XSOd1x83xkCFIvEJwAZlxUIwr8ttbdD2jfHREnQQErhkFOvCnbbIc
	mT7wWEc5U/godMGb8CXHvzWniSPieZpLxpBOje6vIpQQjtZA6ejMXurM1/gjgtycslP+eHugWphmX
	ocZ8ViIrS4OPJ2M8jIJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDOO8-001Rn1-Qp; Fri, 28 Jan 2022 10:21:52 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDOJY-001QEC-7D; Fri, 28 Jan 2022 10:17:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BB0C7B82519;
 Fri, 28 Jan 2022 10:17:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8CF8C340E6;
 Fri, 28 Jan 2022 10:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1643365025;
 bh=hULxR6bdXjPSimROGWCwHC0PuL4KxtAplmQkFP5Xb/E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IEVQWx+82dWXak6hO7ao6/lM8FJBdKFpRkLsuPRCBn95fWSpqPdZea5p1tgRVqoDG
 AvMpMTLBU2wjvkFmWYw6MxBWtxnT9INOCtIo9NOhEcRPv18HiwJaGxkpgMyLnie5gy
 O8AkF5KPyd2qeK2VhYBRE9A5zDKe3L6auhc0Ldzw=
Date: Fri, 28 Jan 2022 11:17:02 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhou Qingyang <zhou1615@umn.edu>
Cc: kjlu@umn.edu, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: mtk-vcodec: Fix a NULL pointer dereference in
 mtk_vcodec_fw_scp_init()
Message-ID: <YfPCnsZ1Vce3fJ1u@kroah.com>
References: <20220124170731.59240-1-zhou1615@umn.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220124170731.59240-1-zhou1615@umn.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_021708_422688_415640FE 
X-CRM114-Status: GOOD (  25.73  )
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

On Tue, Jan 25, 2022 at 01:07:31AM +0800, Zhou Qingyang wrote:
> In mtk_vcodec_fw_scp_init(), devm_kzalloc() is assigned to fw and there is
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
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c
> index d8e66b645bd8..aa36bee51d01 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c
> @@ -65,6 +65,9 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(struct mtk_vcodec_dev *dev)
>  	}
>  
>  	fw = devm_kzalloc(&dev->plat_dev->dev, sizeof(*fw), GFP_KERNEL);
> +	if (!fw)
> +		return ERR_PTR(-ENOMEM);
> +
>  	fw->type = SCP;
>  	fw->ops = &mtk_vcodec_rproc_msg;
>  	fw->scp = scp;
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
