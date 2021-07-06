Return-Path: <SRS0=SroS=L6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E36EFC07E9B
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:01:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAC8C61369
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAC8C61369
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p/B1JEhhFmYYK8EKUTG72ldcQd7KS7NDt8UjeUoq3OE=; b=lXlYVaNykEN50f
	Sgr63aKLNrFAwEcXzBiPYjVtbVK3BJchcZYkobcmtZV3q3bW4GxaAcNLBz0z1Vl86oCewXMYfKCl7
	sBpXpGvwtdz5EaF/7EAwCSozZ5YX36wCbtBKEOxc170tI+3uKALcyp3RzuTXQz7qhLQADaYTMWp6o
	kuvxx04t7Jl19eKOMzYs+T4+Q1+lt7Cvz1STOZuW7Vn7XNQnfrq0T2kFKTqCUyjwOSn5NKCNLHq00
	mCXyS1we/eJfNL/ahhCnZmGQ5iR6e+5RZQLs3XnbtAsZJkpS75989Of7fk7VXyIHYNlDHA86fDWvC
	S8n1jnGvXmoG/sCsq1+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0ipk-00B9R0-8t; Tue, 06 Jul 2021 11:01:44 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0ip3-00B97K-Iw
 for linux-mediatek@lists.infradead.org; Tue, 06 Jul 2021 11:01:03 +0000
Received: by mail-io1-xd2c.google.com with SMTP id b15so24407143iow.4
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Jul 2021 04:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PAM3WxGG2aSByzycYnPlxdEC8iQWk/tth0fjLKjJUmQ=;
 b=kuy3vDkn1fhRqNRFz8YQPltnu/ZN544qGFslrOfb73mvesqSWnZRLb2FU6oWp6alCe
 SxmVYx5sLaTlHTOfvsgR988ez7IxSc69Z0G9nxmtyYOCdi2+KxJccGOeEzoc+Aj2G252
 Lu9gx6HD6VOMpctXz1IDfUu3BD/kG/RbukpjmSLn++bydCbknoZBSM68z3MMOH5wUXKa
 fzl4u5B5yf2i1OsFFS8XCeFWfkNpiy4y71M8iU1UwmHm+IryzPu2ZNHiIrDLvB65Devv
 KmTr0shOoDtArNb19Q4IJKMrjrHNnk+4dqInORDEd0llXi/NP5d0yR2b8Sskvs3TrQNk
 c6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PAM3WxGG2aSByzycYnPlxdEC8iQWk/tth0fjLKjJUmQ=;
 b=oxa3TGD9Jklo2+8BAr0V7ak7/sp2yncrgotICT09Iyxs++oHPnFMmPOT5jmMeN5HUu
 IHVQDCnZ166Sjvz4dnyM6sw8g5nRrLsT1vWMIPFGhAN1i8tdk95iPFREgXA87/cgvryS
 tEa59gVvgAxzr2Kf/SSzgYejZXRuCT6XeNSXPKKBlOlrjHKw3B9SyDZQozbJdwoQC+LA
 zMeQiCF42OWz/aF4swYwcEJumD0BjxJWRWPsFtgOvAemNQ4hKauDkwJVfJRXCGUFTxfr
 ai1uwPucbn+xS+8ApsYp0L5w0QaTzeU3vy1ojwxuzdBbHQVEf//W3taTlZjOpUeuBJN9
 NGAg==
X-Gm-Message-State: AOAM531ZWTlzMSvom+ZvqFCRV2UgGfvhxr/LOTvA2dqf57RoDdIAe4t2
 gr6H0mSxbDCXHuSo14dr4E68QEtnLVbHEx9cJEG4Dg==
X-Google-Smtp-Source: ABdhPJzwUDQLM/CTRiwWQY8sr2eGBdmmfFG8dIq9UWX1ZvVG78S0nZEd03RB6W99/KoiiJAz3A2AQBBQwiYbb9+BEBo=
X-Received: by 2002:a5e:a612:: with SMTP id q18mr15318284ioi.76.1625569259079; 
 Tue, 06 Jul 2021 04:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com>
 <1625038079-25815-7-git-send-email-kyrie.wu@mediatek.com>
In-Reply-To: <1625038079-25815-7-git-send-email-kyrie.wu@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Tue, 6 Jul 2021 19:00:48 +0800
Message-ID: <CA+Px+wWAHDbD4ycOSXjg+-Tb6ZsaUnftJ0EbjH+ThwXurO8qMw@mail.gmail.com>
Subject: Re: [PATCH v2,
 6/9] media: mtk-jpegenc: Generalize jpegenc HW timeout interfaces
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
X-CRM114-CacheID: sfid-20210706_040101_637206_58321616 
X-CRM114-Status: GOOD (  10.13  )
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

On Wed, Jun 30, 2021 at 3:31 PM kyrie.wu <kyrie.wu@mediatek.com> wrote:
> +void mtk_jpegenc_timeout_work(struct work_struct *work)
No code is using mtk_jpegenc_timeout_work.  Have no enough context to
review the code.

> +{
> +       struct mtk_jpeg_dev *jpeg = container_of(work, struct mtk_jpeg_dev,
> +               job_timeout_work.work);
> +       struct mtk_jpeg_ctx *ctx;
> +       struct mtk_jpeg_dev *master_jpeg;
> +       struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +       struct mtk_jpeg_src_buf *jpeg_src_buf, *jpeg_dst_buf;
> +       enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
> +
> +       src_buf = jpeg->hw_param.src_buffer;
> +       dst_buf = jpeg->hw_param.dst_buffer;
> +       ctx = jpeg->hw_param.curr_ctx;
Could they be inlined to above where the variables are declared?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
