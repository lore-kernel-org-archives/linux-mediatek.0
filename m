Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8876BEEB567
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Sep 2024 08:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZ7SlFqCrlz5NcLPHVRGdLSPiYs6/Dpr+JnnW5Fq8NY=; b=GWrXC+qNJM3ALCtvzOHQYdrKTH
	ybGPg7ThbZtiPC78BdGfl6i7poJM2u6Iv+TGvI+DZs4GdJf/JReVNXd6aAZ5Yq8bEH0YYXJjUeYWV
	Au1Bf3VkSTwGzLn0gAaazeS8zzcjiSQWi5MkzxjE0Axqq1cNUMPoK2MIi9UtfQp8kHDR5Syw6cqkI
	VNrQ7HrYdz4PuS1LvX2e4Tks0BYI985VTQT+0uQIw5zRSEgRTmDlOWOV925PFR87XOLurwFqugnX8
	rYgN7UESTo+gc/FZF+gzX/WFxvtEOHc+h2AYiJemm9tyx5wKcPtqV8BKqJ7H099kbtpOq6jpH/yBy
	6yKgLEXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sofQZ-0000000CPuc-0YwY;
	Thu, 12 Sep 2024 08:43:47 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sofQX-0000000CPtW-0Zab
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Sep 2024 08:43:46 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-374b5f27cf2so532275f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Sep 2024 01:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726130623; x=1726735423; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rZ7SlFqCrlz5NcLPHVRGdLSPiYs6/Dpr+JnnW5Fq8NY=;
        b=ZY6mxLuc/9e1DLqRfBc/4MMmqdyMnDmp3RD/NJ8H+APIqslPdq6e+xnr0Goc78iqs+
         JFFBmDpfPkKdsHPV8aXi9OWT0NaKNdZ/B6X9YN/TKRGY7ehqJa7sYL3jL0b+DACbWOgh
         crVPUqp15B62jqJnfdUHxHraJ2EMFxP0CNEl0nVsUf7wXN16r9nJjhFXPhexDxEe1oTk
         4VZRvCMR5aMHUCND86UiDDqGH3vN+b1OAV+dnp1etgKny5CMXmBmI6rEBs/cxNpA0ZP4
         d/PD5Ga8tTEhdFvMi853NcJ/2hFLZkEhvT9jiWrwxAEI3hnf1mjxHJuu+Rehf1j9tWMn
         STjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726130623; x=1726735423;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rZ7SlFqCrlz5NcLPHVRGdLSPiYs6/Dpr+JnnW5Fq8NY=;
        b=LRJt2FQ8e+Zu7TBBsjwLaiHcW1NANVY10vjXhxu0F7xa8iRd/BXhYIhsIr5QFr01w/
         IQEMSPiorNiePy/Ix/S7HpLCAz+BJ+ZqvH44c6fJbHdst69/VWu3ozgiWy94d5LDNHsr
         ozgkiTvDtaf1zczMr4VKf2bSHt9VQRPYOfeUALYvDyqgj7YVdyXcEunS6LdKcVSKAFbZ
         FSC+cpPnLkQ43Hi0q/4Xt7bJABdCYcnHr+6xzHAeuACzPtxpN0i7GrF/BJSdFtPd6gNf
         F7MoV3cigkiuCAM3P2OKHYOpLeCnDqRy4wVi2OqKQ5ifucDFXdqr7fenOzONez5314Fr
         J5fQ==
X-Gm-Message-State: AOJu0Yzp6Il8vKYFOTwEwYsAei0SrJHDd/YaxbRPNVLjTQA2YbCjeucM
	JAfkIeiTc0kTjqIedtgLalvCDC0q2nk0t303/4GYP1GZsT7vkO8HfRXkwmGJDI929u2TZWg4W82
	6
X-Google-Smtp-Source: AGHT+IGmhbfJ1vjnCPaSyOBI3vJqSx8RBkCxjzC8VNEEbV9NwHP6rgE22YqQllIqQeBTsm07mHeISg==
X-Received: by 2002:adf:b30e:0:b0:374:c3e4:d6c5 with SMTP id ffacd0b85a97d-378c2d59673mr1104780f8f.57.1726130623243;
        Thu, 12 Sep 2024 01:43:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cb3cb6f74sm142629615e9.23.2024.09.12.01.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 01:43:42 -0700 (PDT)
Date: Thu, 12 Sep 2024 11:43:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>
Cc: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [bug report] drm/mediatek: Add mbox_free_channel in
 mtk_drm_crtc_destroy
Message-ID: <b5c51c93-633f-4f6e-84f6-e409e729c7cf@stanley.mountain>
References: <77b85cdc-ecfe-42c7-a3f3-a757566b6f5f@stanley.mountain>
 <fd3890987a56a01be8954f3d10d6e744918c62d7.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd3890987a56a01be8954f3d10d6e744918c62d7.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_014345_216295_AE12845E 
X-CRM114-Status: GOOD (  17.23  )
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

On Thu, Sep 12, 2024 at 07:56:27AM +0000, Jason-JH Lin (林睿祥) wrote:
> Hi Dan,
> 
> Thanks for the bug report.
> 
> On Wed, 2024-09-11 at 14:02 +0300, Dan Carpenter wrote:
> >  	 
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  Hello jason-jh.lin,
> > 
> > Commit 593b655f0523 ("drm/mediatek: Add mbox_free_channel in
> > mtk_drm_crtc_destroy") from Oct 28, 2021 (linux-next), leads to the
> > following Smatch static checker warning:
> > 
> 
> It's actaully caused by this Commit d7c66b5fbc70 ("drm/mediatek: Use
> cmdq_pkt_create() and cmdq_pkt_destroy()").
> 
> > drivers/gpu/drm/mediatek/mtk_crtc.c:132 mtk_crtc_destroy()
> > warn: variable dereferenced before check 'mtk_crtc->cmdq_client.chan' 
> > (see line 130)
> > 
> > drivers/gpu/drm/mediatek/mtk_crtc.c
> >     123 static void mtk_crtc_destroy(struct drm_crtc *crtc)
> >     124 {
> >     125         struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
> >     126         int i;
> >     127 
> >     128         mtk_mutex_put(mtk_crtc->mutex);
> >     129 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> >     130         cmdq_pkt_destroy(&mtk_crtc->cmdq_client, &mtk_crtc-
> > >cmdq_handle);
> >                                  ^^^^^^^^^^^^^^^^^^^^^^
> > Dereferenced without checking.  We recently refactored these so the
> > dereference
> > is detectable by static analysis.
> 
> cmdq_client is a static variable in struct mtk_crtc, it's not a
> pointer. Do we really need to check this?
> 

Sorry, the bug report was a bit unclear.  The issue is
"mtk_crtc->cmdq_client.chan", not "cmdq_client".  I've done this analysis now,
and we do need to check for NULL.  I'll send a patch.

regards,
dan carpenter


