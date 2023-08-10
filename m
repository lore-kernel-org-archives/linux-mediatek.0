Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF259C001E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 15:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gaMFUVI/TyRmHg+QwjwgptlEX6C4GaxWn6WmWkFBMes=; b=reHP4qZHawJzOuvx87dZblpDdX
	8Xm88SRqhhpUWDdwn1+O/SfyeeO1zMq9wMeJMYMXvTIRa34/nGLxQr5DRJYhOwsf2S87VoZ8hkc0b
	9nZkGp3QzdvBHzVXUneSk+eE4kCEJtkpAKnmE0XYcGNwYz22wb93TaDmcq8dMD4VZ324T34ioUVw5
	o1tRQcEsOrQ7CeJqr7btBT8LoFVh8bkXCScsrU3RtFGnPVTP1VQ6SALzs9g1MeqMmg0vtKAgWkw7x
	IYDm9e7hT3lXfb5tqQaf3vm5CH4rJ0O0+KSABEUe4gymNpV7lxILBIpK/qLV9M734sLXISccOw/ZI
	v7TlUcZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU7uq-0085XH-1i;
	Thu, 10 Aug 2023 15:49:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU7un-0085Vs-0t;
	Thu, 10 Aug 2023 15:49:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9B9FA660F1;
	Thu, 10 Aug 2023 15:49:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8047EC433C7;
	Thu, 10 Aug 2023 15:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1691682572;
	bh=7JZ+hjiGnW6zlgnmFdgRvS45F6iLlcnWLPDgR5IUKPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hRrAvjEGrOfwyKQm5uaZj1BWRp0OibK4wDpl/exdaLQEATqBt/bTkHphCxjUyc983
	 T/hqV+eu+Y6kEbPvq8rdci27BgFTSvEi2trukbFD+4dOci13LG1YzZ8nCs6Fe4eZpS
	 zNDaydwuH9FowoERk/VycQ6pZC3JyQsQJwv/P+ME=
Date: Thu, 10 Aug 2023 17:49:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Eugen Hristev <eugen.hristev@collabora.com>
Cc: Wei Chen <harperchen1110@gmail.com>, tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com,
	mchehab@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] media: vcodec: Fix potential array out-of-bounds in
 encoder queue_setup
Message-ID: <2023081004-stout-blanching-6f17@gregkh>
References: <20230810082333.972165-1-harperchen1110@gmail.com>
 <45d0f538-9769-f4eb-7479-cf676337ff55@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45d0f538-9769-f4eb-7479-cf676337ff55@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_084933_354935_B71F2008 
X-CRM114-Status: GOOD (  14.22  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Aug 10, 2023 at 12:12:39PM +0300, Eugen Hristev wrote:
> Hi Wei,
> 
> On 8/10/23 11:23, Wei Chen wrote:
> > variable *nplanes is provided by user via system call argument. The
> > possible value of q_data->fmt->num_planes is 1-3, while the value
> > of *nplanes can be 1-8. The array access by index i can cause array
> > out-of-bounds.
> > 
> > Fix this bug by checking *nplanes against the array size.
> > 
> > Fixes: 4e855a6efa54 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Encoder Driver")
> > Signed-off-by: Wei Chen <harperchen1110@gmail.com>
> > Cc: stable@vger.kernel.org
> > ---
> > Changes in v2:
> > - Add Fixes tag and CC stable email address
> I guess stable needs to be added by the maintainer, not by the submitter

It's easiest if it is added by the submitter, makes the maintainer's job
much easier.

thanks,

greg k-h

