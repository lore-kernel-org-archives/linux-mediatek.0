Return-Path: <SRS0=7Zfj=FT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD64FC4361B
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Dec 2020 17:12:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 461D92224C
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Dec 2020 17:12:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 461D92224C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/KQYyC6vKG7PuAXU2/EAeCC5S0WhKwtbieXXVBOcsHI=; b=Lys7NkhabewISkM0XH+6kETqY
	iH7hXmtFy0AI56JJvRNlWvWGOCHFBw/dMbrOcerKAAkxuEUAPx77TYbKHIQXKSziroC/pUHTmO1ne
	IGuhfQSWRPN1ZHRO6/r5XdZdsGkfkva3O1cv4d5Wa0eHvHj87zm6yxVFif9+uhN3hPDlN5jUAJfxB
	kqulM8F5EG/89vOJrRawvI4/QOLZUx0NeXOzYg73nRVttNywEBDvGRXTOzNp+PMtX50P39Yhvjoe5
	IP2F1YyLRgh9/KfHx9YvKfzI8p4icZTJGJjFi/x2PW3vWxzAzrCP5DYiS53LkQ+Xii6KnEqjI3k0y
	s4MqQLkoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpDsU-0003JG-Iy; Tue, 15 Dec 2020 17:12:46 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpDsR-0003Iy-OW
 for linux-mediatek@lists.infradead.org; Tue, 15 Dec 2020 17:12:44 +0000
Received: by mail-ot1-f65.google.com with SMTP id j12so20076508ota.7
 for <linux-mediatek@lists.infradead.org>; Tue, 15 Dec 2020 09:12:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tq/IR9knUY1aNNzaItUIR0LH+tSlkFf5XqzmbSFPck0=;
 b=p5qSQHwLOyKJGj0KeFN0SJQGhZeZybwaQHHwkOq2Ke1BhW4Z/jLWX22EjS1QXaM+go
 fKkAF1UHCWEmpNQLNlNmABN09qKM21C7FmuNtOQ5eF1E8d8OdleFXUqfyEpgpTsACA2d
 DRVkRYERZCnJamrrBx2oL0Dgea6r65cQ5IeMU8MPJe0Ln0hjHeh7WeiJqhACs03MsnXJ
 4uXSw6Cu8B3rrlx5s7NIzD9lutBrIrEBPJsuX/NJaKp1fZ8xH/JUaqKnbO1twh+f78sd
 U4RX4B9fLlYzftAHRgwRKHzfKWjLeFhjLx7CFeGDI76RRBTKc0q1ziK+M6ldY3KYUdAP
 lJKQ==
X-Gm-Message-State: AOAM530ondelXMH6V1aEyGaMEdFnVLSimDYtxS0R9VqJkykgIO+ADIOF
 Se7Za8K5MZN3iaGDUBk3RrhCjkgY9g==
X-Google-Smtp-Source: ABdhPJyzQbJ2HQ/svaqxAA488qWQdmLYLwOfT9qsUlzvoW1OAKhM2rplpYojejBWBK+LfmebEn/TOw==
X-Received: by 2002:a05:6830:400f:: with SMTP id
 h15mr24027638ots.284.1608052363028; 
 Tue, 15 Dec 2020 09:12:43 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id g12sm4847248oos.8.2020.12.15.09.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 09:12:42 -0800 (PST)
Received: (nullmailer pid 4043914 invoked by uid 1000);
 Tue, 15 Dec 2020 17:12:41 -0000
Date: Tue, 15 Dec 2020 11:12:41 -0600
From: Rob Herring <robh@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: mediatek: add L1TCM memory
 region
Message-ID: <20201215171241.GA4043874@robh.at.kernel.org>
References: <20201214050521.845396-1-tzungbi@google.com>
 <20201214050521.845396-2-tzungbi@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201214050521.845396-2-tzungbi@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_121243_886692_A15943EF 
X-CRM114-Status: UNSURE (   9.17  )
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
Cc: ohad@wizery.com, devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 14 Dec 2020 13:05:20 +0800, Tzung-Bi Shih wrote:
> Adds L1TCM memory region.  The reg-name is "l1tcm".
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/mtk,scp.txt | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
