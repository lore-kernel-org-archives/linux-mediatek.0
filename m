Return-Path: <SRS0=9yZI=PC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADD97C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 11:34:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79CCA60C4B
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 11:34:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79CCA60C4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z99nBoJ90G3+y/LkqCMGlGFZOxV+inHpCVyQx658bd4=; b=QFWd+hlClVpTLg
	5wWlKOnOJoXwZwSsmL/YQZ8pW2HAp526modaw/s8EqphcycO7YFx8R1g1rrdX2Qp0mNzmlgq2ktNd
	PlxVYdDAQpm/JxHkeoYv4xeamEhgyXhvRK4/6PylqbJmauXebumxxN9crQmDp2I115XQxBpP32JCK
	utdc+NjZmPKGriuw9sDnDy+VXEGBCidDD886AVDjRsQkJLo7BgZoPM2m3pLpZDqP2bXYdfHsMorpv
	4HyWA2cXcRoEFGziQkS7YAiEv4FQ+nfjWg68CmEygZpfm+bwHotqCDvMjlkGfVa6FQoWAPL3EuLXS
	iEdrVEscWw9lqMXeodCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maz0b-002s8V-2T; Thu, 14 Oct 2021 11:34:49 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maz0M-002s3H-AA
 for linux-mediatek@lists.infradead.org; Thu, 14 Oct 2021 11:34:36 +0000
Received: by mail-pg1-x52d.google.com with SMTP id f5so5236298pgc.12
 for <linux-mediatek@lists.infradead.org>; Thu, 14 Oct 2021 04:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J5zIQtEINl68ppbiKPjAl+bjOFNEBzrwY8VighY2IFQ=;
 b=qVosOjh7AdklRWWS09mi5uq4xPurEmGD+e4QRnJLQV1MBGBdo9gpvfLtsYJ2wHUVup
 doPjWydZlXzwHf6n2oS/DS9bBIQ07lGfx6xk3PDYdyluyaNwgwJjc3HuJ3R6X2c/AaxE
 8kdWzAdSDUGE9TSzLMC4pZRF4wlE4IRqKqczP/q+EDarBhsmLBvn8ZzWpPnevyWzYTaZ
 E+3R9/Dy6LwXSy7+ksZq4OO5wOfq2Hi22gomyAL89t/axxy6aF+VxZA+1LrMyJDk9AsJ
 eoGy0FWPSI8sSsAWYQxlCM8GEil6jdjCEUUp1Sb9h9Htx7JXmEDAYBJOl1uCwggZcxPZ
 ToWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J5zIQtEINl68ppbiKPjAl+bjOFNEBzrwY8VighY2IFQ=;
 b=vaBYUW7dAHnT9A0VYLGcPSjIhuFmz7mL/q0cqqaHD/cG5aAQW8TTAyTCl4EmVWIwmY
 FzuLomNA2iaG4hcqYb9EWiQRAAY4qXTqiNEw3mQvzug2DcY129L424sIPFNwmMS6F8Ax
 Ner9ETdk47Marf1p9s/rRc4TwW8zw07t7kLs5+ZutWOg3wuIuKlxMRVQuJX6AgRRQZML
 KVCsUwgkORcDRhm5WE0Jg1IG9t/sCae1c+yJk6TwqDa4hWXHQnrD2ETBNaD/gtMlbU1b
 jgj/AsDHHsx2LXQ3seuU31gF41UQfW9gCAAZFi+w4ipHGAP96lFxr7dPU3rN/TRmFuM5
 Z7yA==
X-Gm-Message-State: AOAM532Wad8ABh5e4StDElkeA5ufudc5UGSevVwxRY4NnA/QRH+f8aUL
 +wIB/8+45dm3p+1QSmwASnF1ThlaG7gGVItJcpvoCEB1ZJEp1g==
X-Google-Smtp-Source: ABdhPJzMPsCfuckKb2wPvpjVBzH0exDzWnWutlx4LciiCMEZlCymR5wF69/3Kle5WNeCXzDA+u6mOHkWVOLkUEAxqO8=
X-Received: by 2002:a05:6a00:d63:b0:44d:186d:c4c0 with SMTP id
 n35-20020a056a000d6300b0044d186dc4c0mr4824579pfv.47.1634211272785; Thu, 14
 Oct 2021 04:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211014093112.3852491-1-fshao@chromium.org>
 <20211014093112.3852491-2-fshao@chromium.org>
 <CA+Px+wUKXJ7a9th1HyxvCgDTQXL9kHtZH+O9z9oRqCfcF8H-sg@mail.gmail.com>
 <CAC=S1ngFY_LMQrzGpKXUt9HOJnoBvBoL7MV9sKSUJd0xOHZtZw@mail.gmail.com>
In-Reply-To: <CAC=S1ngFY_LMQrzGpKXUt9HOJnoBvBoL7MV9sKSUJd0xOHZtZw@mail.gmail.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 14 Oct 2021 19:34:21 +0800
Message-ID: <CA+Px+wVVWaFMK+TxZtrQQdBKrGFsv=3MfNH31oMpOtckbbTAGw@mail.gmail.com>
Subject: Re: [PATCH 2/2] mailbox: mtk-cmdq: Fix local clock ID usage
To: Fei Shao <fshao@chromium.org>
Cc: Jassi Brar <jaswinder.singh@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_043434_388889_C4FA2BCE 
X-CRM114-Status: UNSURE (   7.97  )
X-CRM114-Notice: Please train this message.
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

On Thu, Oct 14, 2021 at 7:33 PM Fei Shao <fshao@chromium.org> wrote:
>
> On Thu, Oct 14, 2021 at 6:47 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
> >
> > On Thu, Oct 14, 2021 at 05:31:11PM +0800, Fei Shao wrote:
> > > +const char *clk_name = "gce";
> > > +const char *clk_names[] = { "gce0", "gce1" };
> > Does letting them static make more sense?
> Yes, I'll send a v2 later. Thanks!
Probably better to keep their scope in probe function but extend the
lifecycle by using static.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
