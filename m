Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 508DBC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 07:29:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B0B822BEA
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 07:29:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="udfpzepL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="1vhWaygJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B0B822BEA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R8DOiqElrOkdOiL6abKjU83fx1pikcZclgjPml28gro=; b=udfpzepL2XXnskaJx4iK9haHpg
	djqxUSo+fwuCOYkvFtQas0nmPZVamuTHt8Xcdts6txg3FS1ex3/48Zk4T0T3oCvsC0bqFWsGdaQc+
	qACcXf/QXLXowNanpQERR8b+miGcTonCfdM2Fkyhu5mg5oTXZFNSVC5xIvjStn6zYo0Eha7d+1FPy
	Tf9+bvul8aWG9e2Lf4iYJphHmhdJ3dt6bR8608gV89oTjYN7Nu2tWytIuztDJmiLYilfDAMmr8rbV
	jE6lV4crIkwJwPdVely2iS8KSsPIlKycfdgz2Rw1fxXtGhYJw5Zrji2qmtZg4f7x/Fe/bN2IUVW7I
	WIvEE6iw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBCLT-0007r3-FV; Thu, 27 Aug 2020 07:29:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBCLO-0007pv-8F; Thu, 27 Aug 2020 07:29:11 +0000
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E5F6322BEA;
 Thu, 27 Aug 2020 07:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598513349;
 bh=nbSZMecGtdmxZW4q3TGUmYJN2UdboWHon00s9zo57H4=;
 h=References:In-Reply-To:From:Date:Subject:To:From;
 b=1vhWaygJ/COg4tZPDl02n6HNO4/LbDWA8KWd9BXDCUh2IC5CpHXw7iwIxST1HzMoT
 Ma5WMf1KGHu0/lg8PxmCkPbvPbxkmXyKahNu3NSsKuEK8vr44CaGnRTYRnUF+uwMKk
 NJ7DwnlhSIzKlBkn0VI2+tih5GFWTGpjGbsCoVK0=
Received: by mail-ej1-f44.google.com with SMTP id b17so6290453ejq.8;
 Thu, 27 Aug 2020 00:29:08 -0700 (PDT)
X-Gm-Message-State: AOAM531sTTJYLK0bXxVTrQZILaNlgjUHbxzAn1WQGCsY3IHeuaQddR0g
 XCK976PhOzz5QKJKy+EgcTE1xdwEeCQ3oinp5C0=
X-Google-Smtp-Source: ABdhPJy8EQNVJk2xtAcp7FmtzkGSLEabjI/9YF46/da9HZesZBfsKqnmi4daxquL1QXjjh23ke3wwOrxNqtH+LnrXmM=
X-Received: by 2002:a17:906:bcd5:: with SMTP id
 lw21mr19315061ejb.454.1598513347486; 
 Thu, 27 Aug 2020 00:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200827072626.23331-1-krzk@kernel.org>
In-Reply-To: <20200827072626.23331-1-krzk@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 27 Aug 2020 09:28:56 +0200
X-Gmail-Original-Message-ID: <CAJKOXPc37f1vRDXjw6fmS5UArVFZ1dDup8Pq9o-mCN0V2ga43w@mail.gmail.com>
Message-ID: <CAJKOXPc37f1vRDXjw6fmS5UArVFZ1dDup8Pq9o-mCN0V2ga43w@mail.gmail.com>
Subject: Re: [PATCH] maiblox: mediatek: Fix handling of platform_get_irq()
 error
To: Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, HS Liao <hs.liao@mediatek.com>, 
 CK Hu <ck.hu@mediatek.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_032910_457288_9AC02480 
X-CRM114-Status: GOOD (  17.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 27 Aug 2020 at 09:26, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> platform_get_irq() returns -ERRNO on error.  In such case comparison
> to 0 would pass the check.
>
> Fixes: 623a6143a845 ("mailbox: mediatek: Add Mediatek CMDQ driver")
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 484d4438cd83..76e4dfcf5228 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -525,10 +525,8 @@ static int cmdq_probe(struct platform_device *pdev)
>         }
>
>         cmdq->irq = platform_get_irq(pdev, 0);
> -       if (!cmdq->irq) {
> -               dev_err(dev, "failed to get irq\n");
> -               return -EINVAL;
> -       }
> +       if (!cmdq->irq < 0)

Ah, this is wrong. The irq is u32... without my patch this was so broken...

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
