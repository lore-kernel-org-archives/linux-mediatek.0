Return-Path: <SRS0=IT6v=7J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01ACEC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2020 01:54:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C58892073B
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2020 01:54:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KpFlbjnQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="XUpTR3U9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C58892073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ftTEK39ruTFApqDmiyA6xry2bdx79AUkyEI/e9EvkOw=; b=KpFlbjnQ67+F8t
	LfYMU6QdxY4hq1ZGLeqNzzSSNh1rmKLMC349uY0K4G6ker9BJtF3tN/+2+I4fC9oLJTXTUMMhQPc3
	si6lNYmPplT+Z63A2hTqci2EYFpVWi3SiZA2lsAyxruoLZOeTX0ojjYMoVXvlvhSlLCCQDu4mgA04
	m1lxLk4pJ+u+9BVA43NdhO+f93JWbUHJBkZgt/GCFpxHyyPRdq2AxfZ392CypQBito8aYw50Dn20i
	BCBX0Do56T+AHsHP3lJiV8oPTw8Nq+Nd5EH2G6rBRyBXhRlf9+ySQrYuNVDlQotzHV7krs3SlLIXA
	S26JDB8wzzeqFPae/w8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdlGZ-0007Uq-9Q; Wed, 27 May 2020 01:53:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdlGW-0007Tv-F9; Wed, 27 May 2020 01:53:58 +0000
X-UUID: 70968973716b4ec48519c7d51480beb1-20200526
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ZKrqKJ1L5uEpCnzzklpqeT5Qk2zFyQCkc/heYv9ITnM=; 
 b=XUpTR3U9I2ql6YbBD1AN1sf+a1IszagSd55v/wuip50S9/YIF8rA9dVIwyETT7qsAB4UioxxjiJl2jorkFc3bTQscHdkOM5PYG3KJALZhcLw5rs7aCpEHTRlLV/5R55JuwVqICKGca09ozObWc59DmiNt3f5/kisqeSm05yxpfA=;
X-UUID: 70968973716b4ec48519c7d51480beb1-20200526
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 328047851; Tue, 26 May 2020 17:53:47 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 May 2020 18:53:43 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 27 May 2020 09:53:46 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 May 2020 09:53:45 +0800
Message-ID: <1590544320.12671.10.camel@mhfsdcap03>
Subject: Re: [PATCH v8 06/14] media: platform: Improve the implementation of
 the system PM ops
From: Xia Jiang <xia.jiang@mediatek.com>
To: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 27 May 2020 09:52:00 +0800
In-Reply-To: <20200521153257.GF209565@chromium.org>
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
 <20200403094033.8288-7-xia.jiang@mediatek.com>
 <20200521153257.GF209565@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 31B56BA102CB296BF42975F3308432FBE35B5776613BCF49476A31BDC9D305D32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_185356_517193_3EB30BA8 
X-CRM114-Status: GOOD (  23.46  )
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
Cc: drinkcat@chromium.org, devicetree@vger.kernel.org, mojahsu@chromium.org,
 srv_heupstream@mediatek.com, Rick Chang <rick.chang@mediatek.com>,
 senozhatsky@chromium.org, linux-kernel@vger.kernel.org,
 maoguang.meng@mediatek.com, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 sj.huang@mediatek.com, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 linux-mediatek@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-05-21 at 15:32 +0000, Tomasz Figa wrote:
> Hi Xia,
> 
> On Fri, Apr 03, 2020 at 05:40:25PM +0800, Xia Jiang wrote:
> > Cancel reset hw operation in suspend and resume function because this
> > will be done in device_run().
> 
> This and...
> 
> > Add spin_lock and unlock operation in irq and resume function to make
> > sure that the current frame is processed completely before suspend.
> 
> ...this are two separate changes. Please split.
> 
> > 
> > Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> > ---
> >  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > index dd5cadd101ef..2fa3711fdc9b 100644
> > --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > @@ -911,6 +911,8 @@ static irqreturn_t mtk_jpeg_dec_irq(int irq, void *priv)
> >  	u32 dec_ret;
> >  	int i;
> >  
> > +	spin_lock(&jpeg->hw_lock);
> > +
> 
> nit: For consistency, it is recommended to always use the same, i.e. the
> strongest, spin_(un)lock_ primitives when operating on the same spinlock.
> In this case it would be the irqsave(restore) variants.
> 
> >  	dec_ret = mtk_jpeg_dec_get_int_status(jpeg->dec_reg_base);
> >  	dec_irq_ret = mtk_jpeg_dec_enum_result(dec_ret);
> >  	ctx = v4l2_m2m_get_curr_priv(jpeg->m2m_dev);
> > @@ -941,6 +943,7 @@ static irqreturn_t mtk_jpeg_dec_irq(int irq, void *priv)
> >  	v4l2_m2m_buf_done(src_buf, buf_state);
> >  	v4l2_m2m_buf_done(dst_buf, buf_state);
> >  	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> > +	spin_unlock(&jpeg->hw_lock);
> >  	pm_runtime_put_sync(ctx->jpeg->dev);
> >  	return IRQ_HANDLED;
> >  }
> > @@ -1191,7 +1194,6 @@ static __maybe_unused int mtk_jpeg_pm_suspend(struct device *dev)
> >  {
> >  	struct mtk_jpeg_dev *jpeg = dev_get_drvdata(dev);
> >  
> > -	mtk_jpeg_dec_reset(jpeg->dec_reg_base);
> >  	mtk_jpeg_clk_off(jpeg);
> >  
> >  	return 0;
> > @@ -1202,19 +1204,24 @@ static __maybe_unused int mtk_jpeg_pm_resume(struct device *dev)
> >  	struct mtk_jpeg_dev *jpeg = dev_get_drvdata(dev);
> >  
> >  	mtk_jpeg_clk_on(jpeg);
> > -	mtk_jpeg_dec_reset(jpeg->dec_reg_base);
> >  
> >  	return 0;
> >  }
> >  
> >  static __maybe_unused int mtk_jpeg_suspend(struct device *dev)
> >  {
> > +	struct mtk_jpeg_dev *jpeg = dev_get_drvdata(dev);
> > +	unsigned long flags;
> >  	int ret;
> >  
> >  	if (pm_runtime_suspended(dev))
> >  		return 0;
> >  
> > +	spin_lock_irqsave(&jpeg->hw_lock, flags);
> 
> What does this spinlock protect us from? I can see that it would prevent
> the interrupt handler from being called, but is it okay to suspend the
> system without handling the interrupt?
Dear Tomasz,
I mean that if current image is processed in irq handler,suspend
function can not get the lock(it was locked in irq handler).Should I
move the spin_lock_irqsave(&jpeg->hw_lock, flags) to the start location
of suspend function or use wait_event_timeout() to handle the interrupt
before suspend?

Best Regards,
Xia Jiang
> 
> > +
> >  	ret = mtk_jpeg_pm_suspend(dev);
> > +
> 
> Looking at the implementation of mtk_jpeg_pm_suspend(), all it does is
> disabling the clock. How do we make sure that there is no frame currently
> being processed by the hardware?
> 
> Best regards,
> Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
