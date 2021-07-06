Return-Path: <SRS0=SroS=L6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D32FC07E96
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:01:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D676D61A0F
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D676D61A0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fs2WHfECV1EG5F9lb7iSwyW7dK65CYV16n/7iZamD5w=; b=iBYxj+W6DHEeB/
	ycDuLhRzRSTVlUwAF7sQuTU32aqkNXZuDWzsKh/W71pTeCiWtnMQOsiyGrjmk03v8cp4aI6vqIy1O
	Zdqs+pVw9MLLy5FxiJQ4hIAZBqC+vnXZnWjUnOlayg09HICZOZ3XfW/gwgCDN+hKpTEXWtrpHlaop
	XKyDukl07A/mzwxE0Uj/wQV9uom6Dn7ErZAj0P6uh7/zpACjMITCTGpT6BZckmL931nKRuuehNajN
	WPyTxxGVL2cEvr1rcbSoaT113SHi6lRXCRLId3NBSfi8N7gJZHkCRheocLNd0ufZkCBNZF7Hu1BcJ
	PQCdiNjuPSfSpIBQnihA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0ipU-00B9KL-Bg; Tue, 06 Jul 2021 11:01:28 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0iot-00B92M-0d
 for linux-mediatek@lists.infradead.org; Tue, 06 Jul 2021 11:00:53 +0000
Received: by mail-io1-xd35.google.com with SMTP id g22so24463486iom.1
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Jul 2021 04:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eEmJIJa0v/rePle6ZiJmkXBLf0tXP2KOovjivMZBv80=;
 b=QwfTscdCnYxl5W3v0uqo+Vp9odw4vdnPwAoBVqUYPoMBhGwbWub8cjaVgWVSAKbUP/
 jjvblrcSDn3hzJET+O5YGqybeZbrnheV73a9Q63Tk6gBUVkpPogvHBkJVuIUso1Als8p
 OqwFZLETeRJmiP4aLUbJAzic7A1tPzcnwKeqxKPFNJURtV04Vlw3zRjQHhYPI3JPJUja
 bszPardb0bXROaBdbxG6zb+PManXPuXffhjcOjmWYt7Wday1lhU7QujyJDMdtqgK3P/8
 YAV8gT1rW7h9DsJ6BfiJTLQgb866FGNuY29J/iPSihEQY+mZ3vwAxv+JmMNH2We+ebGF
 T0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eEmJIJa0v/rePle6ZiJmkXBLf0tXP2KOovjivMZBv80=;
 b=OauOdymsD7K990b/dQAzpZi2UTO6FvkeWJe69/YEABOxqp3HjMK1uTdWE2EnGa9LQH
 dxDlhD7OOxNFa7ucwLdbWUPSLlgFAJBow3fdmGukE3nKhsT5BSeLYzegfxgJ+P+BPiaE
 Zx5sttbK0g0GWyZUSUcSfzm5e+IKqcEii1Ryn8ukcevXzeDBXB/NdH31Tjsx9Lb7dZ0l
 aQh3nl+q5cBR/mNgnJVuvPbGsNalTvN9Kh3bCjcM4nFdDhckX1X1+Ic1eK6xCOnOVqkW
 iYriU88ONV13bHCkN114hXA1ryHUNWa7VP5IFFKMN/LCdNotmEGowckl5ESsgQd2AQFq
 +CVQ==
X-Gm-Message-State: AOAM532jqQnWiO2KoW2tLS3wST001ab6UbZKE6wcOIfha04qNNn8VOMO
 mHdDBWCoCJHIWqNscd9c96Rmoy+ROrQf2Fe1fpwSsA==
X-Google-Smtp-Source: ABdhPJxvj13Qe7ShtfOQOOMs44W/5ZrbsATHscYcUYaEOc5irj6+5wlNH6VxwLBPlwT/L07LNCOgx7R1idVY9sS9l5Y=
X-Received: by 2002:a02:b155:: with SMTP id s21mr12465245jah.50.1625569249677; 
 Tue, 06 Jul 2021 04:00:49 -0700 (PDT)
MIME-Version: 1.0
References: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com>
 <1625038079-25815-5-git-send-email-kyrie.wu@mediatek.com>
In-Reply-To: <1625038079-25815-5-git-send-email-kyrie.wu@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Tue, 6 Jul 2021 19:00:38 +0800
Message-ID: <CA+Px+wW-L__+mGpvA3P0C7KQh=mJrQ2g0ciPVO=rKnueONqo0A@mail.gmail.com>
Subject: Re: [PATCH v2,4/9] media: mtk-jpegenc: Refactor jpeg clock interface
To: "kyrie.wu" <kyrie.wu@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Bin Liu <bin.liu@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Tomasz Figa <tfiga@chromium.org>, 
 xia.jiang@mediatek.com, maoguang.meng@mediatek.com, 
 srv_heupstream@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_040051_115765_F3629317 
X-CRM114-Status: GOOD (  19.60  )
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

On Wed, Jun 30, 2021 at 3:28 PM kyrie.wu <kyrie.wu@mediatek.com> wrote:
> Using the needed param for lock on/off function.
The description makes less sense.

The patch is more than a "refactor".  Please change the title accordingly.

>  static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jpeg)
>  {
> -       int ret;
> +       struct mtk_jpeg_dev *comp_dev;
> +       struct mtk_jpegenc_pm *pm;
> +       struct mtk_jpegenc_clk *jpegclk;
> +       struct mtk_jpegenc_clk_info *clk_info;
> +       int ret, i;
> +
> +       if (jpeg->variant->is_encoder) {
> +               for (i = 0; i < MTK_JPEGENC_HW_MAX; i++) {
> +                       comp_dev = jpeg->hw_dev[i];
> +                       if (!comp_dev) {
> +                               dev_err(jpeg->dev, "Failed to get hw dev\n");
> +                               return;
> +                       }
> +
> +                       pm = &comp_dev->pm;
> +                       jpegclk = &pm->venc_clk;
> +                       clk_info = jpegclk->clk_info;
> +                       ret = clk_prepare_enable(clk_info->jpegenc_clk);
> +                       if (ret) {
> +                               dev_err(jpeg->dev, "jpegenc clk enable %d %s fail\n",
> +                                      i, jpegclk->clk_info->clk_name);
> +                               return;
> +                       }
> +               }
> +               return;
> +       }
Doesn't it need to call clk_disable_unprepare() in the error paths?

> +                       pm = &comp_dev->pm;
> +                       jpegclk = &pm->venc_clk;
> +                       clk_disable_unprepare(jpegclk->clk_info->jpegenc_clk);
Consistency issue: mtk_jpeg_clk_on() has struct mtk_jpegenc_clk_info
*clk_info.  Why not also have the local variable here?

Is it a good idea to just separate functions for ->is_encoder for
mtk_jpeg_clk_on() and mtk_jpeg_clk_off()?  For example,
mtk_jpegenc_clk_on() and mtk_jpegdec_clk_on().

> +/** * struct mtk_jpegenc_clk_info - Structure used to store clock name */
> +struct mtk_jpegenc_clk_info {
> +       const char      *clk_name;
> +       struct clk      *jpegenc_clk;
> +};
> +
> +/* struct mtk_vcodec_clk - Structure used to store vcodec clock information */
> +struct mtk_jpegenc_clk {
> +       struct mtk_jpegenc_clk_info     *clk_info;
> +       int     clk_num;
> +};
> +
> +/** * struct mtk_vcodec_pm - Power management data structure */
> +struct mtk_jpegenc_pm {
> +       struct mtk_jpegenc_clk  venc_clk;
> +       struct device   *dev;
> +       struct mtk_jpeg_dev     *mtkdev;
> +};
> +
>  /**
>   * struct mtk_jpeg_dev - JPEG IP abstraction
>   * @lock:              the mutex protecting this structure
> @@ -103,6 +128,9 @@ struct mtk_jpeg_dev {
>         struct device           *larb;
>         struct delayed_work job_timeout_work;
>         const struct mtk_jpeg_variant *variant;
> +
> +       struct mtk_jpeg_dev *hw_dev[MTK_JPEGENC_HW_MAX];
> +       struct mtk_jpegenc_pm pm;
>  };
If the declaration cannot align, using 1-space is sufficient.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
