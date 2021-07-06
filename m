Return-Path: <SRS0=SroS=L6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C6EC07E96
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:02:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B6DE61A1D
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:02:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B6DE61A1D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vO4ZzbfrvN3b2Q/YTq9WjBoPqp5ZKa9CPHyhgU/FRaE=; b=kMqkW6LFwSRinP
	9n2DaHFDlCLuQhq8ZLCYtsGeb6Ziy02zanA7M7oF8n1VHBvQ6r96P2ggmwDe75CnVRcdBg7a8+O32
	0hKAWJ137QCXlhX27mmIyBXnwG+4/z8Q0d4htA5/Eo+HF9Hd6YLM/uN9lDU5ma1Ds6caPmcYdE/Ss
	+qfj4SwaaIkEModS6HvmT8iMnHxxwhjtqzmshR9/ATiVAHF/PE0YYceq91pjD74zYHKQ5dgnHBIqx
	uZaK8iBS1ELPT6Ej2F4WJ2O4zA0oR3jrCDoKRb2rBePVvg/BdQo9qS1EUXS0DQ41rFmSh2FC5cuMv
	5ntyXL6xzidDWaH+EYgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0iqN-00B9jF-6M; Tue, 06 Jul 2021 11:02:23 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0ipA-00B9BD-3Y
 for linux-mediatek@lists.infradead.org; Tue, 06 Jul 2021 11:01:09 +0000
Received: by mail-io1-xd35.google.com with SMTP id y8so6949392iop.13
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Jul 2021 04:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FYk8/MFnVtA7gBfngdQB39lzbb1HLN8KQZCQ/UZ++gI=;
 b=mqRfuAl9FMaPmM8mndYbPgNaTr/4muXGUtAj0aCIVo1DzDJZHyZxeNF57pK/mEv4G2
 bCYhHwF3fX7HA8RxBT8bMsEaXi5swrk6OA2lSrk7s9Bd3Y1QYqzG8ChA2G1FIhPDgDs6
 Mftlv3kB7UFCoozmFUffi/lYHnU1fchrthktlfUbcONCXWyLYtWUsMJsZNM169S4pNZd
 QxaLqqDFtyZ8OuBFNuBPSLrOHtb8+4L6a5s7/JrMGfJj+pvUNYtDQHNz2oqYH9mjum96
 VNtiixoAp3LPgG7Roj8oGTOI8UBQWLwtgFEkf+QxM1lQjGOY+BIkqTtd06ukNz327txp
 bWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FYk8/MFnVtA7gBfngdQB39lzbb1HLN8KQZCQ/UZ++gI=;
 b=LL6k3GjrPE1HoS4vQidG48ogXXLwjthKw0RKshjSiNAf+kgiNISaqMEdI+nsvDm3C/
 vJYp4oeU6IUM0vpcJNl8XoXtxAwXdAOYPMFSQ8Qd/4lCtXmMP534gWVGifJis6tCANVg
 XpY4HO6CoRO87QhLlopOmx6YuhW+X0Ac6xml+XthjoNHwXccX9QXWzWDBFEI9od93KlO
 HTAhJi36iAZiSkF6P9doFJDChYKIYSQPK4W1hsSDeRf2IgeOBCecFwcFtRMr78SRv/R2
 GbsneTSTNiqh8hhmaiUAeaSgjAWOgZdqDDWZhrEFFwaqOz431wS9HJgft+mnhiB0DhOT
 Aveg==
X-Gm-Message-State: AOAM530T8C9iwfdDGth9Ai/XDZPqZgjJPMiiyHEUuLBz5CJlIH9mILeN
 MOsph3+VlIkOYChpotE4fjH15+aGh9DwOeZk9hqLrw==
X-Google-Smtp-Source: ABdhPJwfVqDJZJ8YMxlfHDI/5iWfU93hNngTm71CYO5d2lEfAycitsV1Wbt0lZDaTUxVYOgEgo1j1trbkKDAIraFWas=
X-Received: by 2002:a5d:96cb:: with SMTP id r11mr586569iol.53.1625569267395;
 Tue, 06 Jul 2021 04:01:07 -0700 (PDT)
MIME-Version: 1.0
References: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com>
 <1625038079-25815-9-git-send-email-kyrie.wu@mediatek.com>
In-Reply-To: <1625038079-25815-9-git-send-email-kyrie.wu@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Tue, 6 Jul 2021 19:00:56 +0800
Message-ID: <CA+Px+wVwuujSM2MN3VC=kAAU4+M8ZwDhVE3WbUe9R39EuEWDuQ@mail.gmail.com>
Subject: Re: [PATCH v2,8/9] media: mtk-jpegenc: Generalize jpegenc HW
 operations interfaces
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
X-CRM114-CacheID: sfid-20210706_040108_191231_87809F06 
X-CRM114-Status: GOOD (  10.46  )
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
> Generalizes jpegenc select/deselect HW and set params interfaces.
No code is using the functions.  The patch needs to be submitted with
other patches.

> +static int mtk_jpeg_select_hw(struct mtk_jpeg_ctx *ctx)
> +{
> +       int hw_id = -1;
> +       int i;
> +       unsigned long flags;
> +       struct mtk_jpeg_dev *jpeg = ctx->jpeg, *comp_jpeg = NULL;
comp_jpeg doesn't need to be initialized.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
