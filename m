Return-Path: <SRS0=dCaZ=2J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E77C2D0D2
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Dec 2019 03:51:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 704952072B
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Dec 2019 03:51:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FYjHp4kk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C7UCqqJz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 704952072B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q6OeCSotnWZq6l7dMkgsngHNxl/cK61XLSCDCacu7gg=; b=FYjHp4kkD0jWsY
	g0A9qRMqoaGn9UOf6y69pGERnDfepA4wYdEovkdsBf7YVQnYOXuBDshg8EYiNY0L2xO7VkcO+kSdq
	WKCpOV7n8HrqxoUE6zPkhZGE0Uwvvfccn/bSobn1S0MqkvpaNGxoonrif7N0QoDQIlfJwKmNc1+K2
	6UYWe/2bMN+30pWUditG9GbVQp6ETFB9S5Ry7XdqGrM3h3UooIM3kjn4WPGSfnOKNTguouf6t7qs0
	OqVEbe5v3ibY8mTYhF8jLcx7lXS3oJwK6vC/6uk5wf4IOakMkKbbCN+Dtq/o82tXjUahmYOoRGNZr
	N6jY49yqJZO0s04YJXrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihmqc-0002IN-4D; Thu, 19 Dec 2019 03:51:34 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihmqZ-0002HC-OV
 for linux-mediatek@lists.infradead.org; Thu, 19 Dec 2019 03:51:33 +0000
Received: by mail-qk1-x741.google.com with SMTP id z14so2281304qkg.9
 for <linux-mediatek@lists.infradead.org>; Wed, 18 Dec 2019 19:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uAOzy6HGq+TFs1xtj7/74tezRjxUw60c5rVBr7oLwZ0=;
 b=C7UCqqJzkPx1B9MwYq5LMFwPNwZyG+0Lu2c/yVQdV8kq5zN+wo1e0ltwHagA5u4va4
 Z2Dj9d4LjBn5WuzmdYZAHL+yKhKZAJkCRvaQLFfiNOU+N3UqRrdkJMgyUMANVigeTFaC
 dZb3Lcrvzgp9DkVgJEDfMwhF7RLdt6+uVAhHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uAOzy6HGq+TFs1xtj7/74tezRjxUw60c5rVBr7oLwZ0=;
 b=UnXxJGnp3ySo3o5js+yu47/RhNfLBpOIhKytcs04nBWsOs2mRweY8fXsMZLyiIu1GM
 Bw1wYl0y/a954uGDu3LZ7NOg/3yU5nMqtc3eZHXOj7J1Dzkk22CcnAc66iTh7igoGSCa
 plvW4TKW4PQio6j9ORlP0iBg9jktO9QnAFjVnALrGZcII3ckJDRVl7YT5jW0EFbjZwT2
 EvxqanHaRVXA2ki2qk4vDUG0WWG5ZhMD+U7H5dTc0wxPcTQ8Gb/F+AqEoYTWsEe0wlXz
 CEC96eJsoKcVjAFjslHb3LEMJ9QaQWihShqjyKiUgv5c/gF+HzpxIaEOXYvs1bDHAqra
 J5Sw==
X-Gm-Message-State: APjAAAWT89H5po1JTdTT+ar3z5niUWelPtCzD6uhQeIigICZATIxCRvN
 rCruSzRVErVDjGLvfQUd+7hkQebvI9Ysms/4SVlidQ==
X-Google-Smtp-Source: APXvYqxVQR1zDsHVfDiovLQ82mdUU+RrdR4Ro/PJNLrRoTgjjNYA4g4hdU30loYBDdj3qwoVrHU40Q9ZvwTk5Kt3wBI=
X-Received: by 2002:a37:4bc6:: with SMTP id y189mr6213311qka.18.1576727490722; 
 Wed, 18 Dec 2019 19:51:30 -0800 (PST)
MIME-Version: 1.0
References: <1576657848-14711-1-git-send-email-weiyi.lu@mediatek.com>
 <1576657848-14711-6-git-send-email-weiyi.lu@mediatek.com>
In-Reply-To: <1576657848-14711-6-git-send-email-weiyi.lu@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Thu, 19 Dec 2019 11:51:19 +0800
Message-ID: <CANMq1KAB9vTDY+d1ktmAtxCGMYqc_C9-SzLzOkLyBmgLz39KYQ@mail.gmail.com>
Subject: Re: [PATCH v10 05/12] soc: mediatek: Add multiple step bus protection
 control
To: Weiyi Lu <weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_195131_797182_E4713401 
X-CRM114-Status: UNSURE (   8.38  )
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
Cc: Rob Herring <robh@kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>,
 James Liao <jamesjj.liao@mediatek.com>, lkml <linux-kernel@vger.kernel.org>,
 Fan Chen <fan.chen@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Dec 18, 2019 at 4:31 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
>
> Both MT8183 & MT6765 have more control steps of bus protection
> than previous project. And there add more bus protection registers
> reside at infracfg & smi-common. Also add new APIs for multiple
> step bus protection control with more customized arguments.
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
...
> diff --git a/include/linux/soc/mediatek/scpsys-ext.h b/include/linux/soc/mediatek/scpsys-ext.h

Will this include file be used by anything other than
drivers/soc/mediatek/scpsys*.c? If so I think you should keep it in
drivers/soc/mediatek/ instead.

I also still had a comment in v9 about clr_mask, otherwise this looks ok.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
