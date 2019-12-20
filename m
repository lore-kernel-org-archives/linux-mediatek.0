Return-Path: <SRS0=AkNb=2K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F18C43603
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2019 13:28:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A87FE206DA
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2019 13:28:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U/06mCAh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dojB2cit"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A87FE206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g4Xx6oiK3MqU/ZGgqh8b4cYpFFj/cZTFnYBXECv5fSU=; b=U/06mCAhSAmWWr
	PU1lbilEMONRaUrZcOp4L4UqtpUxxhergaKTuOZoXTfUV1VPbydLkjZQRNLvR05QVFXksuG0TBAQK
	zSU0tEXGhYjRCQ+JUk5MeK/RtZpIkeij3/XEiN9gzD3/CMm93xMJgpBiFU+3Dxm/lijjymsNk57Dh
	m/yTYDdBi6f3doSkonJ0ujkMLDON84KtVB2Dl/ZZ3+9L41zHmRxlyPqFpd4EOvs0pi9qYvGYc8EEf
	lD6ZuRCvvi2YsKP+hOMSpT5CuNnxiW2rKRt7OBuFEAbUx3xBbQV+IrmnjiXVmjjqIql81/t+U2NNv
	0ckHr/hb/X+qfKMLfjKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iiIK9-0004sk-42; Fri, 20 Dec 2019 13:28:09 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iiIK6-0004s3-3Q
 for linux-mediatek@lists.infradead.org; Fri, 20 Dec 2019 13:28:08 +0000
Received: by mail-io1-xd44.google.com with SMTP id n11so2656018iom.9
 for <linux-mediatek@lists.infradead.org>; Fri, 20 Dec 2019 05:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qro46RnVnbo2QgGtaf7fEzgqPFK2obp1dRKTpO96WCA=;
 b=dojB2citQDZZpDMYks9ZYnVZdw2jCW6bHd5wO8pPxVBgCrAJfNz7W4YS6MKfH8BsKD
 uFToiAW0Ul47Ri8E58KWo5s4bEHrJ5Nnv32l9d5hFMnE3Nt+uFQozfZJtzdikGVPRE6B
 fjmDRKq7hYTRQarkFqhgRgaZfIGpPno7iXiXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qro46RnVnbo2QgGtaf7fEzgqPFK2obp1dRKTpO96WCA=;
 b=NIcA8RSOgnmWQbup39M47dJkYetvpJh9xVOG6TQfeM6LngB3EbaEJIh9Y5JPYPGrlc
 difeIkcRinuLoNOz50W8yCivpZkd530lw0bt4IPbGjVjN0u0yemb8vGkcm1PSpy9Awsk
 xx3GppODcm9vifZROns+iZMdF4Ye1aJdWLFX7PkOucsITDlOM9SHMNv+VT/MB0oTqvBu
 6wRSKqCst5oxuyr1zQgcdd14ohh8sKV9rcDebg1vtxUgwqqGnr1vS6izFowbSNHAq7KL
 5dYh4wl3NX7eeWnWNwYIAcdc0J/kUPKsGymQcnvIgOtnUZJZ/vgchc1WrJJEgYWW0lJW
 S9+w==
X-Gm-Message-State: APjAAAV3IKJFVDKy7sKYmf8Ay9IJrUVxGNXBfMBdNOnIEj34ke+7G3Zw
 h2gtQGizGPqODZegdOL/eWv6tuMATUXkhNev5xsPMbyKhW125g==
X-Google-Smtp-Source: APXvYqx1z00p6iauoc4NZtcOA9AhAGNGQumLKZgKWsoylxv2/qOGV3v00MP2K8c3STB2yn62imhJmHfZ0XJiN+viMWY=
X-Received: by 2002:a5d:9c10:: with SMTP id 16mr9571305ioe.150.1576848485210; 
 Fri, 20 Dec 2019 05:28:05 -0800 (PST)
MIME-Version: 1.0
References: <20191210050526.4437-1-bibby.hsieh@mediatek.com>
 <20191210050526.4437-7-bibby.hsieh@mediatek.com>
In-Reply-To: <20191210050526.4437-7-bibby.hsieh@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 20 Dec 2019 21:27:39 +0800
Message-ID: <CAJMQK-jdMwoC54XpWj-XYW_yZkM=TcGcJpy94DTdYBN2t1wqmw@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] drm/mediatek: support CMDQ interface in ddp
 component
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191220_052806_167714_5EC39408 
X-CRM114-Status: UNSURE (   6.18  )
X-CRM114-Notice: Please train this message.
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tomasz Figa <tfiga@chromium.org>,
 CK Hu <ck.hu@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Dec 10, 2019 at 5:05 AM Bibby Hsieh <bibby.hsieh@mediatek.com> wrote:

>
> +void mtk_ddp_write(struct cmdq_pkt *cmdq_pkt, unsigned int value,
> +                  struct mtk_ddp_comp *comp, unsigned int offset)
> +{
> +#if IS_ENABLED(CONFIG_MTK_CMDQ)
Should we use #ifdef like in v4? https://patchwork.kernel.org/patch/11274439/

We got warnings while compiling kernels if CONFIG_MTK_CMDQ is not set,
since cmdq_pkt_write() would still be compiled.
Similar in other #if IS_ENABLED(CONFIG_MTK_CMDQ) (also in 7/7
https://patchwork.kernel.org/patch/11281349/)


> +       if (cmdq_pkt)
> +               cmdq_pkt_write(cmdq_pkt, comp->subsys,
> +                              comp->regs_pa + offset, value);
> +       else
> +#endif
> +               writel(value, comp->regs + offset);
> +}
> +

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
