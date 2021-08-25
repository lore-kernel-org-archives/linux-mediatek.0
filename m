Return-Path: <SRS0=pvhC=NQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBDB2C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 16:53:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87E3F60FE7
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 16:53:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 87E3F60FE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B4Noe7XKQcCX4lBv+AhpGBtJrzbc2nf0+hPNDn88Ecg=; b=mrEqnBiyYj3o8M
	u34AgXo/OkYc46pnvKZUzwpM1YS9+T3ox9YL26P4AGYRI3hnufd2cF6z9ebEW05ZBIEXldt67FjQK
	X29TuAbApt/KhZEv/XUQUH+4eNy/CjBbeEZiyUp304cnEgZL6gE+9lQTzauMlTT33VIN6IWCQc38o
	1CnFCc7vAJaxNET6B+E6CGmc72qfS2XI0JlLVESzb2UVXWql9M51DOMz7sUFujAgX4/Qe6wB0LkJc
	TeSkhBZ8K6ERjhAY0kl//r6T5DKnGsFETQe126NQIsGf4XmFjgZ31sCmiGbcsEbuSzbR8N7s8cpCU
	1BcJ/VTDc7JQq2yUTWhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIw9S-007xen-3u; Wed, 25 Aug 2021 16:53:22 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIvo2-007nI9-Jt; Wed, 25 Aug 2021 16:31:18 +0000
Received: by mail-ot1-f42.google.com with SMTP id
 v33-20020a0568300921b0290517cd06302dso55600660ott.13; 
 Wed, 25 Aug 2021 09:31:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tMEQ5rSS37SXZ86EXg6wb4SRLylx3WacUr1VwiLL/Ng=;
 b=KEAifm5CsnRGagpJZ1RYFHyq9riHSRRRbKUPiqh6f3/ZlNNHp1+70GVFZv7DABMIkk
 b9ukhqpWVoVUzMUXEhxm0OSLKev+9AzQ+R7MEJYHRZX3GWZD+fW2vHxOwEYgrQuLKZx1
 vTxC1oB2etcBg5ADuKRZdVBPkZpjdGehLgKLQnwnPju8j0BUoS532WfZsZnCr/oz59zA
 /hRkEmk4I7oooX0JorSAY4mwjdfVtr55zZuH9XwyFSjunMg/xfSHGC2W5AQjgebrcMH8
 RW2TtKQqf+L6Tf2GpSNOGZP/vxZp1C4wgqcsfvorVms8LgzgWHO9ykHU0wYFUTMsyPMe
 XYpw==
X-Gm-Message-State: AOAM533CZjhi3JqB+ZpyPqWC4XtxbgjhlIS8xN8bHcnW52RtzYj5098e
 MF5nfnqFK/SIcm8jHWpC2A==
X-Google-Smtp-Source: ABdhPJxfTu0ee+tYGYmnlkF+0uBzIVdwz+W40xhaEOvLrBXPblsCrnPz+qZSsntwz86pKMcuTxI+sA==
X-Received: by 2002:a9d:6e0a:: with SMTP id e10mr34241962otr.259.1629909073115; 
 Wed, 25 Aug 2021 09:31:13 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id r20sm66162oot.16.2021.08.25.09.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 09:31:12 -0700 (PDT)
Received: (nullmailer pid 2904615 invoked by uid 1000);
 Wed, 25 Aug 2021 16:31:11 -0000
Date: Wed, 25 Aug 2021 11:31:11 -0500
From: Rob Herring <robh@kernel.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: linux-kernel@vger.kernel.org, kernel@collabora.com, jitao.shi@mediatek.com,
 eizan@chromium.org, linux-arm-kernel@lists.infradead.org,
 matthias.bgg@gmail.com, Fabien Parent <fparent@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, chunkuang.hu@kernel.org, hsinyi@chromium.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 drinkcat@chromium.org
Subject: Re: [PATCH v3 2/7] dt-bindings: mediatek: Add #reset-cells to mmsys
 system controller
Message-ID: <YSZwT8QahCfWE5N3@robh.at.kernel.org>
References: <20210825102632.601614-1-enric.balletbo@collabora.com>
 <20210825122613.v3.2.I3f7f1c9a8e46be07d1757ddf4e0097535f3a7d41@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210825122613.v3.2.I3f7f1c9a8e46be07d1757ddf4e0097535f3a7d41@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_093114_716372_54F17EF2 
X-CRM114-Status: GOOD (  13.54  )
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

On Wed, 25 Aug 2021 12:26:27 +0200, Enric Balletbo i Serra wrote:
> The mmsys system controller exposes a set of memory client resets and
> needs to specify the #reset-cells property in order to advertise the
> number of cells needed to describe each of the resets.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
> Changes in v3:
> - Based on top of the patch that converts mmsys to schema
> 
>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml      | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
