Return-Path: <SRS0=qi5H=EL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 563C3C00A89
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 04:55:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C28AF2083B
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 04:55:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1evcr9OB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QybcdYkG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C28AF2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KX74wFqRsMrCMSybnnyagaAUUDDX5KPOXxaObqsbnhU=; b=1evcr9OBRyXihdQxyTJbBNNEz
	9yZ9Sbgmo+t0vRRUdikCHSMJsQuucRJ63vs/wkQZiMj3nBT7KWe95W5tLxAMH43BzQchcobP4k+3G
	scdtZ+x1dtL6WBnzP/7aOEO7lVZw2fl6+5Qnm78f8dNx/hMzQLuo2jfIAPpb8Q0Xg4E6PsqejIpgE
	DMVTgS52DA4zKEVPUmmJTClyEXS1lLK+l25cQggE+QiCmTHU/QuWixnBaiXOmvak7UO0oj+0TWvaD
	JyCz2KYVUv1/ighjyD81hnUUQlu0WQChOKCWYgFTVuWXNFnPTkTgqQyFQp+EDdDlYJUybSYID8lPe
	9pcVU4MEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaXJK-0001n4-By; Thu, 05 Nov 2020 04:55:46 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaXJI-0001lQ-1w
 for linux-mediatek@lists.infradead.org; Thu, 05 Nov 2020 04:55:44 +0000
Received: by mail-ot1-x343.google.com with SMTP id n11so300889ota.2
 for <linux-mediatek@lists.infradead.org>; Wed, 04 Nov 2020 20:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=i6MGr/Kg3VZyORAXNQIPSqeLnV8zx9yqFNyMUoSyDIg=;
 b=QybcdYkGQifdwCUvS6mzcHt5x/ze6Uk+AU8hfeX5CCttAAjMJ9JixZwigksaFEM1U8
 v/okucIqFFVU7VHHDOMk+/vW3ceFa/smhEYZKI3wHU4eN5TPV25FIT14cJgS7Zp7WLmJ
 gcjWURKjGLYBgmYycdwu1V64hbzyatd/3umDLpv/6+FshkDeLD1qJ35IK7KNbXnaMmzR
 SejanBqzPKxCy15mDtB2/KqyQTFGCQD0m/3N29NgrgYBsQyTWF4c0yWAvFBLe4RG+nYD
 3jMfs8d6Njg8jo76DutCptIjzK9ankBp9i7CdLZpoN5UwGUOg/Q4j2mBtdUq8SavqrwZ
 fRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=i6MGr/Kg3VZyORAXNQIPSqeLnV8zx9yqFNyMUoSyDIg=;
 b=F88vbfhcxlli5bSWDmKNGkjWFdsWlNxnH1dwgs1IdyFdrF9ARJ9lQwqVhj6tEDBE2I
 hmH5UelZfC5J8WwDGoXm+gunO5VO5BHdfYUU97hMj6r4BWKMCaQggXsl79Mvn3Ph+LnA
 8sU9YnB6hKrHT0MMD3DB0e7Di0PJQrss+2pWpizhUFttxe3nG4WhQxdLTbPMK+OZ5Ibl
 hysvpdocKxpopXkIWElcpo47r3NhWQN2yvd2UzLKbs6DkqdNNps2Hr2b4vhAbqkRvlxy
 Zs7bBCxSfMh5pAkVZxl+gPapDNAARZnHYrQ+pbh92C3sGAv/mgFL3lsDtho/Kpz9I33i
 1EyQ==
X-Gm-Message-State: AOAM533L+3HwiwymoagkgcGrjjnjJCG7ea8eimgvTHKO50lblgxK+EES
 Li4eWzg/rMTGu9C3Icohve96hA==
X-Google-Smtp-Source: ABdhPJx8wemuxHJ5PcafcR+3WSW0gpy0QWAV+NsA3hxjXU/Wnf4rhD2zTdNnzBM3zh6Mhoi0OJRe7g==
X-Received: by 2002:a9d:7d87:: with SMTP id j7mr510237otn.356.1604552140570;
 Wed, 04 Nov 2020 20:55:40 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id l23sm95998otk.68.2020.11.04.20.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 20:55:39 -0800 (PST)
Date: Wed, 4 Nov 2020 22:55:38 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH] remoteproc/mtk_scp: surround DT device IDs with CONFIG_OF
Message-ID: <20201105045538.GA29931@builder.lan>
References: <20201102074007.299222-1-acourbot@chromium.org>
 <20201104190547.GD2893396@xps15>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104190547.GD2893396@xps15>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_235544_166357_9D346C10 
X-CRM114-Status: GOOD (  22.31  )
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
Cc: Ohad Ben-Cohen <ohad@wizery.com>, kernel test robot <lkp@intel.com>,
 Alexandre Courbot <acourbot@chromium.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed 04 Nov 13:05 CST 2020, Mathieu Poirier wrote:

> Hi Alexander,
> 
> On Mon, Nov 02, 2020 at 04:40:07PM +0900, Alexandre Courbot wrote:
> > Now that this driver can be compiled with COMPILE_TEST, we have no
> > guarantee that CONFIG_OF will also be defined. When that happens, a
> > warning about mtk_scp_of_match being defined but unused will be reported
> > so make sure this variable is only defined if of_match_ptr() actually
> > uses it.
> > 
> > Fixes: cbd2dca74926c0e4610c40923cc786b732c9e8ef remoteproc: scp: add COMPILE_TEST dependency
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > ---
> >  drivers/remoteproc/mtk_scp.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> > index 577cbd5d421e..f74f22d4d1ff 100644
> > --- a/drivers/remoteproc/mtk_scp.c
> > +++ b/drivers/remoteproc/mtk_scp.c
> > @@ -772,12 +772,14 @@ static const struct mtk_scp_of_data mt8192_of_data = {
> >  	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
> >  };
> >  
> > +#if defined(CONFIG_OF)
> >  static const struct of_device_id mtk_scp_of_match[] = {
> >  	{ .compatible = "mediatek,mt8183-scp", .data = &mt8183_of_data },
> >  	{ .compatible = "mediatek,mt8192-scp", .data = &mt8192_of_data },
> >  	{},
> >  };
> >  MODULE_DEVICE_TABLE(of, mtk_scp_of_match);
> > +#endif
> 
> I think it is better to add a "depends on OF" in the Kconfig.
> 

That would reduce the efficiency of COMPILE_TEST, so I would prefer that
we drop of_match_ptr(), which will result in the pointer always being
populated and this being referenced - although unused when built without
OF.

Regards,
Bjorn

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
