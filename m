Return-Path: <SRS0=fggR=7S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 111CAC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jun 2020 12:25:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF6082077D
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jun 2020 12:25:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TtPuhN/n";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="EawcP4Ep"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF6082077D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GR4SVmilYn7QgHtEoKupua8YDLI67MjUwSoZ42q26vQ=; b=TtPuhN/ne8tnvX
	Qy8gmCN7VRdZzAzx5QOa7cwv9I2t28ewiCmNZAsmfTvHADdGjTY/9k4LDXuWI4kp2mGcsUwL0IUwe
	0eKufZZ2a+orixcFzLylfGGsouGmyV3CvFU6l73TBOcYfOQAEHHL8I/ze1ATFGEgic6kv/9tAVo61
	8NpXCh7bfrODeVWdv5Gi64a8VESrLSuhai/cMcv3MA+5/MvjKgYP7XGqqzAvuobItzJ68AZ+duf9Y
	Ha83vI3lXhG47xbnyf8BTC3Lk4bxelzSZtEubqLYGKnAKZEVI27X/gx+xx2gxKDPI4+PK7jIEOuex
	Yt14Cj60sgI+57Pfx03A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jhBP4-00040d-9D; Fri, 05 Jun 2020 12:24:54 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jhBOw-0003tW-Qs
 for linux-mediatek@lists.infradead.org; Fri, 05 Jun 2020 12:24:48 +0000
Received: by mail-il1-x144.google.com with SMTP id 18so9296395iln.9
 for <linux-mediatek@lists.infradead.org>; Fri, 05 Jun 2020 05:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kIfn0QHMP7CK4Hmgml37SRcHqGH4aTtKIuqHQUCLWRQ=;
 b=EawcP4EporkwrqfLPgvSKZWlEE1ID85TieWCHY9LwiKd+HIWVF0QxVSawt8hyzZZA8
 QXJ2pNFwn2Ify3QvL2OneyDAR505YIqjhKzJNYhUVvWgjj9lx52Iq2Aqz4dkftCr4YN5
 esT7/cpbLK9xB2nYLvrPz1qbc1Jt6Uo7VHWrud5qxemkEHW91lVv59CjdFHDnMAbn/BD
 kkCNiXNYmNFMH635f2w+rTyfZuBaHtwXgUEm3k2UI4/y5jZ373klw6RMSRCkefE+qdjy
 RqUsL1NqHhjxO/v4NWOxFztHbXvT7SRoAUQpFoeWdvf/XV9bU9cHguBRm9pITOknMnBd
 2W2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kIfn0QHMP7CK4Hmgml37SRcHqGH4aTtKIuqHQUCLWRQ=;
 b=d/bEI0A5ggdcQ7pWjE0I10NypgadjP389espmTI2K8Jd2915sUagtSBPfTWAyy5zBL
 Ng2pNIkokqGSOOIjH9G9HQl4ZzhlsiRvZKddmQjbTOHQ6+rySdpc3Q1xgY5O8yKTvGuv
 D5dNvhwbYlCQU0NxQu1h6Cprg+ULxpOQdKE0MqI4dydCNwfEmCvHZYup/f50f08GuGql
 qLXNTCRYDLg/G4reA+uQBVSmvYq0PxGGUf3SxwfvCaoKFtFAdlTGguSZo7/+F8BYQ0UL
 MQMXIAZNk5IKsuCVPAqsAJKw5nEWhizDWJutkIrky1IyL8zS1qyRcJ62gs7bt2ccLCVD
 TBIQ==
X-Gm-Message-State: AOAM531C7IOQnPKU1jRlUIF0AkffTeRlY+t8sMTsCVe6ZPkjY/r1ybU9
 c5K/M+BSkN3ZTnbdaAXZynnaekaqqicbHGQS+4zGQA==
X-Google-Smtp-Source: ABdhPJxIJRIn8uLBn8iAB1Nr4R5l0zbAftEc1md7w19YTUWpfcp8liEx8XFB8UBZsNB8M/Dg27ZKhc4KMp4ZpswjQ+Q=
X-Received: by 2002:a05:6e02:1350:: with SMTP id
 k16mr7686913ilr.213.1591359882249; 
 Fri, 05 Jun 2020 05:24:42 -0700 (PDT)
MIME-Version: 1.0
References: <1591353222-18576-1-git-send-email-jiaxin.yu@mediatek.com>
In-Reply-To: <1591353222-18576-1-git-send-email-jiaxin.yu@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 5 Jun 2020 20:24:31 +0800
Message-ID: <CA+Px+wV8U6Y-tppLPUdoOgQhpss-DUm-YDQX7TZ1uHHH7JMyZQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] ASoC: mediatek: mt6358: support DMIC one-wire mode
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200605_052446_885614_90A8E849 
X-CRM114-Status: UNSURE (   7.13  )
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
Cc: Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 howie.huang@mediatek.com, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jun 5, 2020 at 6:37 PM Jiaxin Yu <jiaxin.yu@mediatek.com> wrote:
> Jiaxin Yu (2):
>   ASoC: mediatek: mt6358: support DMIC one-wire mode
Has done previous round review on https://crrev.com/c/2230089

>   ASoC: dt-bindings: mediatek: mt6358: add dmic-mode property
Has done previous round review on https://crrev.com/c/2230086

>  Documentation/devicetree/bindings/sound/mt6358.txt |  6 ++++++
>  sound/soc/codecs/mt6358.c                          | 23 +++++++++++++++++++++-
>  2 files changed, 28 insertions(+), 1 deletion(-)

With that:
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
