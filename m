Return-Path: <SRS0=+2Q0=DW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 472ECC433E7
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Oct 2020 08:47:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A79E5218AC
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Oct 2020 08:47:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oKJXxpjH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="JI3OP/nk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A79E5218AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gxu0o8UJKwLdCXNhjv7zBkSgeVStG5o/hcBBzmtd/ck=; b=oKJXxpjH6tSV4JQGh4o7u8pmZ
	iXybe5z7vOFvqq/stQNTvB07BEMPXw5ZPSforRP4WKpvRlFWdRDWPQtFOEXs70fYoqwt3cdIwYdRj
	iYH1gCvyUv2cdMZsrM3fPXI+q8BkCxwIkrvhdqOuoqUcwgsMkzEcxpxsIXJ6Y7uRWlQs4ynEOrMdO
	ds7U/h5YrM2gVQ8Vf8phs3unFtfd+Ygabpr6sPcWAMSw0oVBfRh67uAh+yniWsBMxPIc5kssa6zc/
	mV7yFODmB2E15yTzgMQwxSwWleKbjR9WkLJMw/mjLqyvndAIFyKoBh9PUK5IuMg41Ut0UfQnpR8Cv
	h0qPFJPbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSyue-0000Mr-MR; Thu, 15 Oct 2020 08:47:04 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSyua-0000LW-1W
 for linux-mediatek@lists.infradead.org; Thu, 15 Oct 2020 08:47:01 +0000
Received: by mail-wm1-x32d.google.com with SMTP id q5so2630867wmq.0
 for <linux-mediatek@lists.infradead.org>; Thu, 15 Oct 2020 01:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WfnRK5cVX6azZMqBqUfHbjQvOcd148r5sIa6MP8wh/A=;
 b=JI3OP/nkE9bQKpG4ifkR4FVb7nHZOMWL3s8qxbyik9PVQ4XLBy9KO0qkeph94YyP6k
 XdN0rsvdqpxChgu91LUssRKNl7ip1VnuhMGRkRKrDCF14x7AfGiOPtfexDHjO43qRT1o
 t3lCdy92X7IKvSLpKBTe/StmAOTBSt+duPBco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WfnRK5cVX6azZMqBqUfHbjQvOcd148r5sIa6MP8wh/A=;
 b=QwSIdMgo+XwS+PiLe/hLt40A0Z3OTOp/8skPyPCHPuo5nC2Kfz2vYvfTiVzgtOr5Wi
 iJrsPLmB6JQ1jQwkJsc6AQ/eUw7VBt3YMqENX97CJEf+bsTji3FFVFzhYv5VXEjdr0HJ
 qh8mmnc3+69QjLVs4izVTSKoJ/cthg/f9+zMcpmyDYlfslFktkBXHYVaVwANgoyNlr8N
 EhNflUtRESuuO2ylSXdNuWlu+4VZ8C6OJLlnVbG3L91dY8iW96KaQlsfcXMVVBDNbSuw
 iAZY8bDfltzx9SL7hIi91o+pb8ZcQuh9fPK6hW0xEPPfwNLGD8XB2zqLmkbB8rXK4BW4
 v+jA==
X-Gm-Message-State: AOAM532DbYEPBTA5wjDVHGDvlV3mFVvz0WTiWkZTW9L8WZ2bwf6O+vd1
 xkYAUvSdT0TTUYzGUx1JHrQOpVgWVeAY5YdfmW7U3g==
X-Google-Smtp-Source: ABdhPJxNphEIA53NFxSRPBrfZeZ7M9POQUCzTal5jT3zSrlzJ58Sf7TBd3Eh0rkz0/EjjC/ILesmCAQSDCdKDvrKunM=
X-Received: by 2002:a7b:cc89:: with SMTP id p9mr2998028wma.4.1602751617285;
 Thu, 15 Oct 2020 01:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <20201014131703.18021-1-geert+renesas@glider.be>
In-Reply-To: <20201014131703.18021-1-geert+renesas@glider.be>
From: Daniel Palmer <daniel@0x0f.com>
Date: Thu, 15 Oct 2020 17:46:46 +0900
Message-ID: <CAFr9PXmv-2h9prVuuWe29ae15LPtk-k0XUA04ywv8P7oiJpbRA@mail.gmail.com>
Subject: Re: [PATCH] irqchip: MST_IRQ should depend on ARCH_MEDIATEK or
 ARCH_MSTARV7
To: Geert Uytterhoeven <geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201015_044700_287671_778AC9F7 
X-CRM114-Status: UNSURE (   7.19  )
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
Cc: Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, Daniel Palmer <daniel@thingy.jp>,
 linux-mediatek@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Geert,

This looks good to me.

Acked-by: Daniel Palmer <daniel@thingy.jp>

Thanks,

Daniel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
