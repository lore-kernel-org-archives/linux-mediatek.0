Return-Path: <SRS0=ooiB=MA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1CD5C07E99
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 10:05:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEA15619BE
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 10:05:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEA15619BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uVqmDAWxLrceWBNwJ7d3rWYimjjzKMmYPniYEUhYEPo=; b=pLqCxf6XuAMHIx
	WRcYG+9Ai1tp61C2RAfCGl1PV9K1vLJYu3d/LvhCj7cUUgX9brtZBgzDEMUzomMHxh4wF/wisi1QY
	fu9b8vowcAj0IwOxI8l+Q7zkpJePayemclXMMVcHz7sXx87nL+8JXGMLzItbIGAItL+/bnNlWBbud
	8FKAkcaaNHgv72uIKWrLjkiRjl0vdXzSQxs9Jmp8zv35OORenyb2mZvHIYMOANpZyzvbTzxQfE/ON
	yCwrvGE6GkzeeJzKGW7fBgNUxExTMDq/iMRbZZZZjGerS6wbNvIInjwOw+Ah0R67/MluO8eyj7muq
	NyuQJxKbVENQkdU7d3rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1QuN-00GYSb-Vh; Thu, 08 Jul 2021 10:05:28 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1Qu4-00GYKo-7e
 for linux-mediatek@lists.infradead.org; Thu, 08 Jul 2021 10:05:09 +0000
Received: by mail-io1-xd31.google.com with SMTP id l5so7453401iok.7
 for <linux-mediatek@lists.infradead.org>; Thu, 08 Jul 2021 03:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R4fhY/yLoZMmhCqnp0rYwJfbvJ3m+VsDi3PuO02Dh10=;
 b=UYLH/VW8SI7ZogoX7fR4NWP4DRGl1d62SfimYKsYGCETDopjoL/y+RsptFQTSoByGW
 q+sENfaHQCddz+goHWQTbvBYRlZpPNGTD+hwSbScS+9stYayGZQXolfj/woo+NmCRBFa
 jGhhZ2GepPegJFGXuvZ83xSc31slF8PwiWyq/CFpd9Wkx+YE6ESZv0Bd/Zg2Bn1QN4L3
 XlwQ5Gw1bepr7GNdQBbKm28jDLcSJf11PX8aOk5pdKA+hC4hLLRMYbVPpSJHXz2ar6DR
 UDOSQX01Z+z/FHqmL6RR7vDsF7HIoczBZVtLjl/NWXDfF8VnYSiP+1906qUiWuzmA55S
 3mlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R4fhY/yLoZMmhCqnp0rYwJfbvJ3m+VsDi3PuO02Dh10=;
 b=R+NKMnMhVhIR/cDOG4e07a9Hj5v538mOeDm/iK4RSbpfGHoAA+f+dYCq7a1ZscjZFE
 5yM0ZRI2EDe/rh4Gbbm2i5FQpRPwAp8R5ku26l1ojlgHHlb/WQlP2KIVLgQPQYNi73sV
 eUnzqvYqZWr6gL6p3x24bgTkZ1qTGBDZ81vRfEKJroFjizacZBGf52FA5WLA7ic5y6U0
 s9eEdaeT2yDw/6fCGavrP+drjT/5rLTh36oYZsc2plVF/dWTtClkQCPgI1Nu6da2ZpUM
 Hm26X4uFZZLEab+JozZFmcf/PK8V3wuxZ4KW7qPRfaLXvUgI8ekAq78k5Vr5Z+SqYup9
 g3Fw==
X-Gm-Message-State: AOAM5302W9VTktMiKScbJaeNtoSRxu5TUx56tBrhixW6LMZIYD+5OkKV
 oL+/+W38D7KWHl2Gpogb+6GALEVvcwl43TSdBuJzIw==
X-Google-Smtp-Source: ABdhPJxdKSoYDqcwBIX1WQ4+fbUqa84UqW8rvefJuvTTO1vwGh4lLoujDgkp/mZyijH1oUQhvQsnJcYa+CxvYJZElwI=
X-Received: by 2002:a02:9402:: with SMTP id a2mr26130879jai.110.1625738705769; 
 Thu, 08 Jul 2021 03:05:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210707062157.21176-1-yunfei.dong@mediatek.com>
 <20210707062157.21176-5-yunfei.dong@mediatek.com>
In-Reply-To: <20210707062157.21176-5-yunfei.dong@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 8 Jul 2021 18:04:54 +0800
Message-ID: <CA+Px+wWQREny2KSjDfgdnMvk8GKKqr+QvRdSR8YXc1i73wbJSQ@mail.gmail.com>
Subject: Re: [PATCH v1, 04/14] dt-bindings: media: mtk-vcodec: Separate video
 encoder and decoder dt-bindings
To: Yunfei Dong <Yunfei.Dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Tzung-Bi Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Fritz Koenig <frkoenig@chromium.org>, Irui Wang <irui.wang@mediatek.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_030508_327208_A756121B 
X-CRM114-Status: GOOD (  10.32  )
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

On Wed, Jul 7, 2021 at 2:22 PM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>  .../media/mediatek-vcodec-decoder.txt         | 169 ++++++++++++++++++
>  .../media/mediatek-vcodec-encoder.txt         |  73 ++++++++
>  2 files changed, 242 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec-decoder.txt
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec-encoder.txt
The patch is weird.  Its title says "separate" but the changes are all
creating new content.

Would expect the patch to remove content from some files (e.g.
Documentation/devicetree/bindings/media/mediatek-vcodec.txt) and
separate into 2 files.

Also would expect the patch is a refactor which shouldn't introduce
any new things.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
