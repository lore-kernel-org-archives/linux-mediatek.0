Return-Path: <SRS0=47V3=CG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A848C433E6
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 22:00:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6833920665
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 22:00:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eHTrLKJu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6833920665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wf7+NoTs3B3++cQydU2wxnx3Eew8L1VUNxPtGq9GTsg=; b=eHTrLKJuRC7UOyHSzVCp/pMM9
	WakqbE+H+DOvPp/HkrH3CHmoCNxI1PP6ElOoTDf8tlk/MImAIpJvEVPcTKA/8rxAuJBd8RKy9z/ei
	KmNUMOiqIuSw4acWPGK4gNj9XCd/ItD6h4ca0cH1bjEOf8yFcgqhR9VuU6LIhpg4BZyYkIPix+yY3
	FySt6PZMpHodwViM/N3wBRZ3rvZBKYfKIBcXz8d8zHBDPaarp83aM3d1Sa+3ncNGhFuRDkZdSWV3i
	hQHG9NUqYJM16J9VLsInvqUSE75K39/3RRzU/dtNLGozhNkShmUDRSOxF50oAcJOB7Q/SyNQ/kkta
	9wjuAsouw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBmQ6-0007Tj-Lj; Fri, 28 Aug 2020 22:00:26 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBmQ4-0007Sb-P0
 for linux-mediatek@lists.infradead.org; Fri, 28 Aug 2020 22:00:25 +0000
Received: by mail-io1-f65.google.com with SMTP id g128so524609iof.11
 for <linux-mediatek@lists.infradead.org>; Fri, 28 Aug 2020 15:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wMHVWbiPBLcRjA2cjtQwy6nnc0JRKu1LeCAOKufBp48=;
 b=oRnGS7pN/6SEh5yej453AHLgm6KVLhpbqitjjDI+aX+9GFsdeX44Zo2ujnf15/0T1m
 5V44qZtX1EkSs4WyIbvY1RjBHAFGBDkW8ezvbgaY/aYfi1JuW4vQsuu8P1qbisjdMk6l
 I0c+v+LKXoy+uQPDcHVZzz8UHiceTJazUBO2Y6siu3i+1imr9csmpbVEgx8D+NzISNCx
 U6mR6Ume7m+0Rj331Jd/tfQPWTvz2VKLa+o/G2Tb+JIyuUbPmiu/zZC7ra7VbQapkaw6
 FDK2VAi2y+uvjXzCglYE6oxH4RtWWbubB/hIYSTXy6ctQqNjFGLGRc5mOe7sxlupu7MB
 GVAw==
X-Gm-Message-State: AOAM530Tv/a8F+eHUyURnBjwR+gwPopsuLWnN0owxUSXhjq4eAb9B82O
 uLqUx07vbucQKUmgazrGUQ==
X-Google-Smtp-Source: ABdhPJwCx/OejHv5kikm7x+v+SSME8DKxT8DEC7huiH8h7vtJ20q7dk2WOTs1KGDoOVWNyEPsoNmwA==
X-Received: by 2002:a05:6602:2293:: with SMTP id
 d19mr660780iod.45.1598652024037; 
 Fri, 28 Aug 2020 15:00:24 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id y9sm286427ila.65.2020.08.28.15.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 15:00:23 -0700 (PDT)
Received: (nullmailer pid 3479570 invoked by uid 1000);
 Fri, 28 Aug 2020 22:00:21 -0000
Date: Fri, 28 Aug 2020 16:00:21 -0600
From: Rob Herring <robh@kernel.org>
To: Alexandre Courbot <acourbot@chromium.org>
Subject: Re: [PATCH v4 02/17] dt-bindings: media: mtk-vcodec: document SCP node
Message-ID: <20200828220021.GA3479540@bogus>
References: <20200821103608.2310097-1-acourbot@chromium.org>
 <20200821103608.2310097-3-acourbot@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200821103608.2310097-3-acourbot@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_180024_904720_77DDCDC6 
X-CRM114-Status: GOOD (  10.37  )
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
Cc: devicetree@vger.kernel.org, Maoguang Meng <maoguang.meng@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 21 Aug 2020 19:35:53 +0900, Alexandre Courbot wrote:
> The mediatek codecs can use either the VPU or the SCP as their interface
> to firmware. Reflect this in the DT bindings.
> 
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
> ---
>  Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
