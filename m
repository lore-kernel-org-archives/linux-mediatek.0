Return-Path: <SRS0=lG5C=36=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4712FC35254
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Feb 2020 04:24:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1370A214DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Feb 2020 04:24:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P2iotYqq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n3Ht9nwt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1370A214DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3QZ3D2uCLgNWqGhspQfL+neE8F60gEDKwBjU4YjakcI=; b=P2iotYqqxBhLD3
	r6ic7YvIHCThWm0IBfAgBo6AS86I2oaoUMNVfs1O2RaupbNKVsaK9aM9iow+BPw+VmoLsa+m+xYMH
	qC00rHOiFEykyf6TxIO+pTWwsCYP/SZ6ah3oM+M/0cdL17lJsBSQwKdSmTx5InYL+ieV68dHQAwXG
	rImmpLCFMkJxqzsFKPViuPaz8qIg1/L2KJupc7Bx46shBTupUYMkWfswOwA8YTRhVyBuQUAE9895L
	4MKP7wWM8DTISaSnUrC1hPDiTZHjZrUf+TrtYKBrl5dQCcaB7QXbq/ws/7UOAmq1lfJL5PJ5PTOrG
	w1va5mpvaJzms9R57v1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j10ci-0000nH-Rm; Mon, 10 Feb 2020 04:24:40 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j10cg-0000m3-5j
 for linux-mediatek@lists.infradead.org; Mon, 10 Feb 2020 04:24:39 +0000
Received: by mail-io1-xd42.google.com with SMTP id z193so6088891iof.1
 for <linux-mediatek@lists.infradead.org>; Sun, 09 Feb 2020 20:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f9/SpRmu7ZftQfQrFKpqn3FiKFBhLldZW4LlC+d7FEA=;
 b=n3Ht9nwt3oFNzZVouxN0h0x/ECuQGwRj6N97mqr+Sl429uxJEHSrkHS48aRexIh3fw
 nxvTLNDb3J/oVL1q0Ehb403siYgBTFrUfX1rH95Qcc6Uu/Fc/DLJcbPL+n3f9QvqIAZk
 P3442KH4s6p4cw3q4HQ4kudxH0tWMvlIJXEmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f9/SpRmu7ZftQfQrFKpqn3FiKFBhLldZW4LlC+d7FEA=;
 b=WZxnmQkqTELY9CRl6ynbRzYJyNKYOM8qhcFF1tBaMLQtsYHENEGklz7MfYqiDJy81C
 hUIGBrtclkHJyNjumGpxzQxctTgGYoPWEkor5OsfiDxRg4OaXNUsnpyEfzUoTGce0NQT
 5wUuosxb/aeWVYFQR4dA/lWtPf/41Nt0K+zen83qv42frbW0h8aFYbfCLK3aWoJC/IDV
 DsQilpi11ZFU5D8BsfllA4V2J2ThXb6ohbhBBccs8fvT86Rl0e2AhmWjEyvnC9DhGemz
 aJ1NLfKTP5kEhHqqycC4/0KDinVpiXbace6ZiwXOqwvj2oJxqfuGE9VeT51HT3kf6am9
 yNuQ==
X-Gm-Message-State: APjAAAUa5qszAwE3M49vESXrrwaRT5NnTm1k0aRqp++BGAKMkA6zDenj
 ugxF1FwOwiBgp3L5MGTkR7W8R3nlrqW24sbZAXSNjQ==
X-Google-Smtp-Source: APXvYqyKXFQWOfUcJughVD7+IczCYrEmXa8+KVPkwR23+DH7h9JTtgAmwF5wDycGjx9kxCMYaIKV2ieQTzAYHPcKEJU=
X-Received: by 2002:a02:b385:: with SMTP id p5mr8392462jan.43.1581308676642;
 Sun, 09 Feb 2020 20:24:36 -0800 (PST)
MIME-Version: 1.0
References: <1579591258-30940-1-git-send-email-yong.mao@mediatek.com>
 <1579591258-30940-2-git-send-email-yong.mao@mediatek.com>
 <CAJMQK-gZcvpQTSqM4kNsnNOXpcOfJw9u-X9uedQDM6W2soF_4w@mail.gmail.com>
In-Reply-To: <CAJMQK-gZcvpQTSqM4kNsnNOXpcOfJw9u-X9uedQDM6W2soF_4w@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 10 Feb 2020 12:24:10 +0800
Message-ID: <CAJMQK-g57BLA0auzFbZsv-__rEQBb38-P5Sv4JNhyQz0M08ZBg@mail.gmail.com>
Subject: Re: [PATCH] mmc: mediatek: fix SDIO irq issue
To: Yong Mao <yong.mao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200209_202438_241512_C02B415F 
X-CRM114-Status: UNSURE (   8.34  )
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, srv_heupstream@mediatek.com,
 linux-mmc@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jan 21, 2020 at 3:38 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> On Tue, Jan 21, 2020 at 7:20 AM Yong Mao <yong.mao@mediatek.com> wrote:
> >
> > From: yong mao <yong.mao@mediatek.com>
> >
> > Host controller may lost interrupt in some specail case.
> > Add SDIO irq recheck mechanism to make sure all interrupts
> > can be processed immediately.
> >
> > Signed-off-by: Yong Mao <yong.mao@mediatek.com>
> > ---
>
> Thanks, mt8173 need this patch for cap-sdio-irq to work.
>
> Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>
>
>

Gentle ping

Thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
