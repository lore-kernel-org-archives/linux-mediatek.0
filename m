Return-Path: <SRS0=WAzV=DX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 802BEC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 16:18:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04ACD207BC
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 16:18:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q3MMfCD7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04ACD207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UJ+gQjnOkPjvWfuJgxmkZWXGQ/k42KihhFKOmW+Fl5M=; b=Q3MMfCD7RVQWU8ILnrjyFb8uo
	2swY0v1kALq00FYzxLvRVaZpdiuP01PeNv4smvGXNDYCp0hn4lmDQjn8FKDDMxt7KRCVs5U5kVHLU
	wmAaCE+LkVzr7RSTMkVRNqmodrPzxzGlB9wdmz/j71sZ6bP1GGWNfEELHePXrMolCRPioZJzctI9I
	Q/kzbh8YbkQYwDv8sC8E7TIwKS4V+ltDw6odSW0W/bt3HQwtYpcqgHtAg4nx6k1mCweWh6NSGenGI
	2f5XqqUe7Mx0jNUj+gYVL/w1iM9JCTQoZ8Ev6pXw24LIvR4Mc0u6+sE0hQQ6cOspmFLvD05i/FRHL
	9Rx6FFrCg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTSR8-0005X3-9H; Fri, 16 Oct 2020 16:18:34 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTSR5-0005W5-PK; Fri, 16 Oct 2020 16:18:32 +0000
Received: by mail-oi1-f195.google.com with SMTP id w141so3037056oia.2;
 Fri, 16 Oct 2020 09:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uISo57yfUZpTzroMJhAVgeLo1/yelMiKsufW7Z+pWqo=;
 b=steFxeRhq+WE7aBXLDyjo//YYlO8u8imIaZ3aW4dNKRJ5zAMB0UJaeXUWLaFC0gA6r
 N4N2ly1MV9OzINaia+2tFnKDxfbdoAhDYBY4MYDrfzOyVPMf0R9PzjmYmKotAjIeLnmN
 nsnRivp7LfcQdK6IHV0SXO9+XcNA8KSZHELYNXwpsFFCPml7MoNYb77yBLqiqMugPd4u
 /FtpXUqrRuT6QZFV0i7gGT3xOX7zaOgtqCtGlp0yOxWDVu90cTVnoNdF8PiGN+AlWolv
 60+JB4YYfCaIplVL/BfaTPkPVvE1K3aDCDyPSjYaPGFDRiKzmM5rJYfMzYbRvjku4TX3
 Pocg==
X-Gm-Message-State: AOAM532a/0E70lHx/NRUn5GBvWFQXTtTZwYNumSsdtAiXaAJC8WU9S8N
 xGz/w1Lu11XD2Dp4a1XQvA==
X-Google-Smtp-Source: ABdhPJxXWV44wqWW/P4G+jW/m/jxEn6yv6aGQSaC4SmYzaJjQxINSxxLka7EviDs9inU1aAGasqeyA==
X-Received: by 2002:aca:aa08:: with SMTP id t8mr3126702oie.129.1602865110271; 
 Fri, 16 Oct 2020 09:18:30 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u22sm1266354oor.13.2020.10.16.09.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 09:18:29 -0700 (PDT)
Received: (nullmailer pid 1517766 invoked by uid 1000);
 Fri, 16 Oct 2020 16:18:28 -0000
Date: Fri, 16 Oct 2020 11:18:28 -0500
From: Rob Herring <robh@kernel.org>
To: Wenbin Mei <wenbin.mei@mediatek.com>
Subject: Re: [PATCH v7 2/4] mmc: dt-bindings: add support for MT8192 SoC
Message-ID: <20201016161828.GA1517686@bogus>
References: <20201014030846.12428-1-wenbin.mei@mediatek.com>
 <20201014030846.12428-3-wenbin.mei@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014030846.12428-3-wenbin.mei@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_121831_856198_2A03037D 
X-CRM114-Status: GOOD (  13.88  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 srv_heupstream@mediatek.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 14 Oct 2020 11:08:44 +0800, Wenbin Mei wrote:
> MT8192 mmc host ip is compatible with MT8183.
> Add support for this.
> 
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
