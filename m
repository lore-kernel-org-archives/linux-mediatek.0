Return-Path: <SRS0=Skuz=LT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04BD1C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 10:11:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C16FE61428
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 10:11:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C16FE61428
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H4f5dNGdrqyNv2rvaWsWWeSKTF9Rz5hKmZisj12F/Yk=; b=Bo70BhgSZKEEvx
	X5GHKXdgJ5QVatmt2zV44jlr2DNGVQPtQ2eVgdfl2/awcJQ2mFX3eVh0ii2r1iHwZPdPEWrPrFuy1
	8IkVHS9N0Np1VbDkVwWv9Uk6Oos0RIipsTziY9JyseVvs+D/y5RJWyV1rn6t//NgAPacKZygYbFdS
	l4T4UaFrFCPdTR9An7mMQq4NMfhsYjkH9MS4hm+ZbiKeQZqRvtqQyYJkCk2JeEu46b5K4EBwvwQOA
	sobNuDwZQePX5NksY5hrlnhPqX/ZudlxeksnbIh2n6ynJVke3ClD059GtzsB+q+0pkhbyz4BFmfZP
	jtv3UPzjrQLALNPrZTxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwioJ-000sGu-64; Fri, 25 Jun 2021 10:11:43 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwhys-000cOf-Qc
 for linux-mediatek@lists.infradead.org; Fri, 25 Jun 2021 09:18:36 +0000
Received: by mail-io1-xd2d.google.com with SMTP id y76so1064891iof.6
 for <linux-mediatek@lists.infradead.org>; Fri, 25 Jun 2021 02:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=88FCEyGY0ObH+JRYnSMOFbc8rSLjvc2FivRi/MWezus=;
 b=clmTQ6i02Tj8s8oVZQHWalhZCVnAixA5WTtIyAGQL9bFK9TDRU4WY9w6YLpuaUPd4D
 lVG1MDJ72xb36377gWaJzV0cuc/8vgda8HyXZ1iB5cBTZu+B3l8X7LRtkn05iB26eG5f
 E0lwNnLMnegvu3O/6c1qmkG5WKYdc7f4cQMZjCcyijNLMDc3tsJyr1x03Av8qjjmg/+q
 QrZ18UapyQ1AtNDXrm7q0vKY32eTvZmOOCD0ht1W15+SbDf8YakNDTvPTT6f/KZQp4yn
 JduvzNX+WegZ57QObIYIJXvc88Evh0qAEpin2ELCCg+ti2khYJcTecXfuiK4piU9Fixw
 fW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=88FCEyGY0ObH+JRYnSMOFbc8rSLjvc2FivRi/MWezus=;
 b=YhaLOOSwS5LtMlVgPq9xD1/jDOpntd0VHHCmiHjgjlaS+8eNlhNAVYwGwForRUODt0
 i6VBdlktwwy+6lk21mACrP8j9QLqk6IEl9/of/2L7oRtNPkr+IBBPYHbRVLXZZsU9erd
 ELs/C6K9hh+E8D7Wr0kK6seqVGAnrioHo9OvcgppZ3Plh7EPauAxAVyKzfjXRYVbqgj+
 jKmEHtInyNzuJq/D1KPd08lwvOj1HrS5NzRXBFHdvGhIjZ7/dEN3W8qP4FdQm9micvCz
 XwezW8lCw7zt8hAD1uKyWuAxFAAlMWGV7jFtUXsj+JklMVdfp6m1F7TU9qkNKy3KmrOA
 H/aA==
X-Gm-Message-State: AOAM532+e2mLbAyR2hPZ9hKDxJLrK9MelNp6MCF0n7GO77rM8zls4JYe
 30Appn4lnY0VF62RAZZ/ddDVRvpp7qF5XBeteZMcMA==
X-Google-Smtp-Source: ABdhPJxbt3pm/73VTwg6WDqxvFoGlsWZppVPiwv/xS7DVbmoMx3sJvxUADJW/Q03NqHJbGeQmuoHUyhzht6/MupEWr8=
X-Received: by 2002:a6b:7110:: with SMTP id q16mr7755529iog.53.1624612713653; 
 Fri, 25 Jun 2021 02:18:33 -0700 (PDT)
MIME-Version: 1.0
References: <1624428350-1424-1-git-send-email-kyrie.wu@mediatek.com>
 <1624428350-1424-2-git-send-email-kyrie.wu@mediatek.com>
In-Reply-To: <1624428350-1424-2-git-send-email-kyrie.wu@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 25 Jun 2021 17:18:22 +0800
Message-ID: <CA+Px+wW6PrYihYo8F2Op8XPfVHMmO7ODRQrF75DQxc4gRM-qfg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: mtk-jpeg: Add binding for MT8195 JPG
To: "kyrie.wu" <kyrie.wu@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Rick Chang <rick.chang@mediatek.com>, 
 Bin Liu <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Tomasz Figa <tfiga@chromium.org>, 
 xia.jiang@mediatek.com, maoguang.meng@mediatek.com, 
 srv_heupstream@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_021834_947389_9D3A8E56 
X-CRM114-Status: UNSURE (   9.87  )
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

On Wed, Jun 23, 2021 at 2:06 PM kyrie.wu <kyrie.wu@mediatek.com> wrote:
>  Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt | 3 +++
>  1 file changed, 3 insertions(+)
Note: the patch won't apply after [1].

[1]: https://lore.kernel.org/patchwork/patch/1445298/

>  Required properties:
>  - compatible : "mediatek,mt2701-jpgenc"
> +- compatible : "mediatek,mt8195-jpgenc"
> +- compatible : "mediatek,mt8195-jpgenc0"
> +- compatible : "mediatek,mt8195-jpgenc1"
Why it needs 3 compatible strings?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
