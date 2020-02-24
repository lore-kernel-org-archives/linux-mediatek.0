Return-Path: <SRS0=9HQ0=4M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9584C35679
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Feb 2020 09:56:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DEC420842
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Feb 2020 09:56:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ao5PF6Pq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hr23lqTt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DEC420842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OVDPWXP0qzXulkB7mwqVaLmadOMsNRIagcha8hM7xOE=; b=Ao5PF6PqyOJ3b+
	TC+GDMF9TBPjN28UNgiM2RE0BFzTUUrq2hdYXpzcNLrpfkqkgDhzBuugncxGheIAA6j3kkO9Ml4lz
	/YNEN3ZdgfYdUODetE2eOs8dtZLN7238THC1Z+VOcUFV4g5Q4srvlUauC5NfE9o7TGfiEYUm9eY2V
	PL/bAOItxsGX2PliyF4FvTD0IZAUtyHIXsncRA/4DKsV/3ArEPwkw1NOF3fSveaQ2A8SX7KSldg8J
	VQcdUAZLQohj9/A5fSR3j8VI674GQXCRh5Lk6200R+nw+2yxfgZw62wombslAvMn93Zzlf8EPVrdi
	b/VjNEyNPnOufLVXGS9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6ATT-0003pT-Dq; Mon, 24 Feb 2020 09:56:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6AJj-00005g-2S; Mon, 24 Feb 2020 09:46:27 +0000
X-UUID: bb61422c5fe74795b16a67022e54837b-20200224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=JJObHOiFNWZrMDB8kq3sMti+Ri6V2M0iYaOtSYj8HuU=; 
 b=hr23lqTthINWXnyqH4FlJZ93clckrD8c2YBD5KQCbAwl1+cMWaGGMF3XqR8jIgyEIQ4ESiynsunRR/peYZmkPZvdQevHMU7s9jWu3khE9ievaw3b0LSAgAFiNMwlYyn3V3uCt9CB5Zq/z+Frm0e33tQA2eZvSaA7HFGoVNyfd2Y=;
X-UUID: bb61422c5fe74795b16a67022e54837b-20200224
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 143668408; Mon, 24 Feb 2020 01:46:17 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 24 Feb 2020 01:46:49 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs07n2.mediatek.inc
 (172.21.101.141) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Mon, 24 Feb 2020 17:45:26 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 24 Feb 2020 17:44:58 +0800
Message-ID: <1582537569.859.14.camel@mhfsdcap03>
Subject: Re: [PATCH v6 1/5] media: platform: Fix jpeg dec driver bug and
 improve code quality
From: Xia Jiang <xia.jiang@mediatek.com>
To: Tomasz Figa <tfiga@chromium.org>
Date: Mon, 24 Feb 2020 17:46:09 +0800
In-Reply-To: <20200214093506.GA193786@chromium.org>
References: <20200121095320.32258-1-xia.jiang@mediatek.com>
 <20200121095320.32258-2-xia.jiang@mediatek.com>
 <20200214093506.GA193786@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_014623_223131_79C71AE6 
X-CRM114-Status: GOOD (  13.81  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Rick Chang <rick.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 linux-mediatek@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-02-14 at 18:35 +0900, Tomasz Figa wrote:
> Hi Xia,
> 
> On Tue, Jan 21, 2020 at 05:53:17PM +0800, Xia Jiang wrote:
> > Fix v4l2-compliance test bug and improve code quality of jpeg decode
> > driver, because the jpeg encode driver will base on it.
> > 
> > Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> > ---
> > v6: alignment 'MTK_JPEG_DCTSIZE' match open parenthesis.
> >                                            
> > v5: Use clamp()to replace mtk_jpeg_bound_align_image() and round_up()
> >     to replace mtk_jpeg_align().
> >     Get correct compose value in mtk_jpeg_selection().
> >     Cancel spin lock and unlock operation in device run function.
> >     Change register offset hex numberals from upercase to lowercase.
> > 
> > v4: new add patch for v4l2-compliance test bug fix.
> 
> Thanks for the patch. The changes look good to me, but each of the
> unrelated changes should be split into its own patch, with proper
> explanation in its commit message. Especially the ones that introduce
> behavior changes, such as the S_SELECTION or locking change.
> 
> Also please see one comment inline.
> 
> [snip]
> 
> > @@ -801,7 +778,6 @@ static void mtk_jpeg_device_run(void *priv)
> >  	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
> >  	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> >  	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
> > -	unsigned long flags;
> >  	struct mtk_jpeg_src_buf *jpeg_src_buf;
> >  	struct mtk_jpeg_bs bs;
> >  	struct mtk_jpeg_fb fb;
> > @@ -829,13 +805,11 @@ static void mtk_jpeg_device_run(void *priv)
> >  	if (mtk_jpeg_set_dec_dst(ctx, &jpeg_src_buf->dec_param, &dst_buf->vb2_buf, &fb))
> >  		goto dec_end;
> >  
> > -	spin_lock_irqsave(&jpeg->hw_lock, flags);
> 
> Why is it safe to remove the locking here?
Dear Tomasz,

I will split unrelated changes into different patches.

My opinion about remove locking is following(after deep thinking):

The device_run function can be only called once for one instance.
For multi-instance,is there any posssibility of hw override if removing locking?I think so.
What about your further opinion?

Best Regards,
Xia Jiang
> >  	mtk_jpeg_dec_reset(jpeg->dec_reg_base);
> >  	mtk_jpeg_dec_set_config(jpeg->dec_reg_base,
> >  				&jpeg_src_buf->dec_param, &bs, &fb);
> >  
> >  	mtk_jpeg_dec_start(jpeg->dec_reg_base);
> > -	spin_unlock_irqrestore(&jpeg->hw_lock, flags);
> >  	return;
> >  
> >  dec_end:
> 
> Best regards,
> Tomasz
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
