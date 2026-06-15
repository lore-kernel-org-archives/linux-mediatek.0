Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01CAECD98CE
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2026 22:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/BxQrn967BchhiPMVf9s3SPbfGb2SRsf64DIOXc/lgs=; b=rDpDNIWTRHTWnucznzkSn13lLh
	exV80EvGklzylLuY0Z1iaZcFBnW5UyZJbvTnqU0D9WqLARBMxlpGIGcpqD799KxGu3YpQvwIb4ACP
	6av1e4Gbyr74EaEC6T+YineYy9js6nLbtxAd/UzZguZalgptdlf1d1L8bVmxVHQSCEh3xpUHkvboj
	R5TrrVPUKZs062QyIgD6zXeXLf0WEjXR1mI1lr2kJFFIrGYQ/lGh+B6S/Z+tej50cSwZB79eBZzRU
	hWIVELa+joYHg5J0ut5F3ynSvF1XP0Q33g1kVrn10VtHXnlNhdJu99ybVuwDiSbwbu18WJw7SRmBo
	5PRHPVXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZFtL-0000000Etm6-0EZq;
	Mon, 15 Jun 2026 22:34:51 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZFtI-0000000EtlR-1Ag2
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Jun 2026 22:34:49 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-36d98b68d68so2581177a91.2
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Jun 2026 15:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1781562887; x=1782167687; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/BxQrn967BchhiPMVf9s3SPbfGb2SRsf64DIOXc/lgs=;
        b=ILFBMDHwb7gP9JJD93iMkyZX8zWMSFYCgMKe/H5MTQezvMqRBTnNzwPnkv4DkxOmGO
         GcySmZU6KjaGfYiEqpYn/fAlqJymPf8EUg8zS8FI8ESBPpFS1VvJzJHs+noK/knEr6vM
         csnbhYxaIqY+2aDmUovxtPwH0koVGWZ4pSGsrCnI2jyRxJO3eGxf9QY3hOh17HQRxrD3
         YTtjZXvltVPSarSipp7TC3Ig0Dq3zig7Ws5+XwiNn8HIXdgQqIYlHJKRwKNFshPtVstK
         IqtSLEG6eXrJNkYwzddJW5n9LXq0AEex7D8JQ2dykfwbuXUhnyzTTWE/viEEec+0lwAZ
         h8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781562887; x=1782167687;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/BxQrn967BchhiPMVf9s3SPbfGb2SRsf64DIOXc/lgs=;
        b=DxLdsRYNDq+hsHNn7WwEL8stu7sNe+R5SYI6nLoOvrHuXLcsziGMSs37ZSllCLoQlr
         4/f4AZeZfrntzjIcHGDWVzfiySDY7e+YHNQEu2ZAHdEr4lbppDADxWYOePsH0ZafUw0Q
         ymKVKFPSK/Twm4s5Xf12/3yy7gXOPZ0AJs9PO5SKElMV29/UQTQe0Ki8ztXzBwngPMIZ
         6DEHiLbVeWK+00kE2jASKVooTujxoBdGTCtkUs1k5dJS0sk/CLeGSdaCd8D0DltovDZS
         2f/nrskwskYwZk0UQshNnMgQ6YT4fUbGNacflXTAXj9WCVjCz0QrG658zVmqdJEq01il
         z4Ig==
X-Forwarded-Encrypted: i=1; AFNElJ/DBaM48XUrSAEhj3MlCHMC+K9Sls516F2fOh0OjWUANRig3khU8jve4fPpixCnEDyA+6EiB1ooBKTdYPIAQw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwSBdp15FDpvWrcQz84O53qzOn06CjJdZz/JRdEM1G3uImX9qZf
	Ir7m0U/INd0QFGYqCvHwUYgU7brly2dXY9BvOHMtFJq6vTsLR68CxHctXL1Qss/YTYE=
X-Gm-Gg: Acq92OGjH/ymzBbWpp/S+FybVg5/OGZqLrqzaQ7ct07OZmcL4MVE+Ah3RuPiT9XTC4Q
	C9x+U7awaLyVnE5Hghmp88SU++YfPT/Rsdvd9j9QTQi/17PBfbqRUe7EYw7zV/5v7+ofPQKe4Ww
	q0J7uTI/mDUtf0ulsCidPVl/v0RMcXDRGvSpWJGnP95D5r1v1Sjn9bmTbI4Ijyr+EMLJqLXdv+T
	mjaNGFNxA4VXbbd55s9nlx2nGo4nz+odaL3hYIKlfHynFto31ZN/O6agmlY2nzf9gufH+cjuphF
	46vDXnYx6S+imJFYESqYtCVfkIn9PAD2SxNobEDwoeiIPYtoWGA7Nvi1W6uJsMvwvWpgqoItDo2
	6tZMDf6REQCsMa5n2KN2UJYokNXKm1YOPWLxcaeMVIk6etSNKWsKZR1LC/veepq9mXWVWNjYJT7
	YTA+xk
X-Received: by 2002:a17:90a:a897:b0:36d:66d4:270d with SMTP id 98e67ed59e1d1-37c2bd08179mr9024782a91.20.1781562886775;
        Mon, 15 Jun 2026 15:34:46 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:53::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c522a019csm620311a91.14.2026.06.15.15.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 15:34:46 -0700 (PDT)
Date: Mon, 15 Jun 2026 15:34:45 -0700
From: Joe Damato <joe@dama.to>
To: Wayen Yan <win847@gmail.com>
Cc: netdev@vger.kernel.org, lorenzo@kernel.org, horms@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v2] net: airoha: Fix skb->priority underflow in
Message-ID: <ajB+BfOXHpRhCTnO@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, Wayen Yan <win847@gmail.com>,
	netdev@vger.kernel.org, lorenzo@kernel.org, horms@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
References: <6a2ff493.5934d26d.389ef4.d16d@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a2ff493.5934d26d.389ef4.d16d@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_153448_592103_A7BD0D49 
X-CRM114-Status: GOOD (  18.24  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jun 15, 2026 at 08:48:13PM +0800, Wayen Yan wrote:
> From b894fc031e307f1b6756ea9fcac98e82e23815e1 Mon Sep 17 00:00:00 2001
> From: "Wayen.Yan" <win847@gmail.com>
> Date: Sun, 14 Jun 2026 07:30:54 +0800
> Subject: [PATCH net v2] net: airoha: Fix skb->priority underflow in
>  airoha_dev_select_queue()
> 
> In airoha_dev_select_queue(), the expression:
> 
>   queue = (skb->priority - 1) % AIROHA_NUM_QOS_QUEUES;
> 
> implicitly converts to unsigned arithmetic: when skb->priority is 0
> (the default for unclassified traffic), (0u - 1u) wraps to UINT_MAX,
> and UINT_MAX % 8 = 7, routing default best-effort packets to the
> highest-priority QoS queue. This causes QoS inversion where the
> majority of traffic on a PON gateway starves actual high-priority
> flows (VoIP, gaming, etc.).
> 
> Fix by guarding the subtraction: when priority is 0, map to queue 0
> (lowest priority), otherwise apply the original (priority - 1) % 8
> mapping.
> 
> Fixes: 2b288b81560b ("net: airoha: Introduce ndo_select_queue callback")
> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Wayen <win847@gmail.com>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Hm, I tried to apply this patch to my tree just to see what would happen with
the duplicated SMTP headers and it looks like they just get added to the
commit message.

I think you might need to re-send it (but you'll have to wait 24 hours between
re-sends).

The code looks fine to me, though, so feel free to include my tag:

Reviewed-by: Joe Damato <joe@dama.to>

