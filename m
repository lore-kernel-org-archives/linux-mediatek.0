Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F9CC27C53
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Jun 2024 17:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nBoRWY7j+KChaT05OiFvTI9j9fKmSRxurLI8csfuT4M=; b=xy+SEN19/Vh6w9AG9ESIR+eNCa
	qN+wEj3FmE0/OdzdeP2ores3bIkByGYKYJUNUHc1bHESZ9NzqdVi4hdO/fzaIRR5w9lHhZ1gFhG+O
	p8Nz2/3sjd9uLYWH3tJGqnXrCN70GDHkvt/54Jwt3NIT0oypBhsMyGFIITHGUzxZQwemylomfeEXn
	pTx3VRGY+LT4ED+4GBwgpqSrVDy2uOAE7vKFedQ+l6K3K4CKdqpP1ufWT3++nCdxp7Z+xQoLCwetA
	6kM/Vi/hzSiiucA7fn/2Jf8k1O3laMraPo9XLWTcH5RdqIYuY4FTAySXTopl6PflivC2V0NEp1YvC
	EG/5O3pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sItmO-000000080HA-0PwU;
	Sun, 16 Jun 2024 17:35:00 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sItmL-000000080Fz-0gMB;
	Sun, 16 Jun 2024 17:34:58 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-35f2c9e23d3so3111802f8f.0;
        Sun, 16 Jun 2024 10:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718559293; x=1719164093; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nBoRWY7j+KChaT05OiFvTI9j9fKmSRxurLI8csfuT4M=;
        b=c/GBvxzxRPDjvKiIefrgvOmPh7yLD9mbCyCzqmhc78X/bwok6Kzoegqydni7Cs+Nge
         pJvQwv7Fjgi0yFvSkygOgW6EifAqNJ4myqfdNmVfMdSvn9YI20ViPptvF78JWmPrbnbu
         Cg1j+6bpdJCD2SMzkXwjgn+5v2SgVhQuoIxyJRBeROCpCZLFx0h4CZvpec1PPbXmkm2Z
         DBVYgDr/fq0Ic+kdCemV7DXJaD4FW326Axc2elh6m0PUC4bJzEWoy/ahkjf8YJmSwJNI
         90zQIItr52s89xhLRL0mYmxf4jnW++KzhnHidHVU/VqYahTHkoTHnuZV8OD3cuWqnrJE
         e1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718559293; x=1719164093;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nBoRWY7j+KChaT05OiFvTI9j9fKmSRxurLI8csfuT4M=;
        b=KFrAeSRNyDumDAQLSR1upd5ZswpzjG/fF4cZmPP/8yjBgLt3YXld0Lz+vcwjT6QvIs
         LZR8l9Y44OVGje84lgmuQG7p+93+0TJJaeEFZke60Y+Q9oaO5BNVW06cdRGFV59KzCto
         qN8NJIArxSeqnjkIsPSwvLN5iY7Wzmn+mpdywS4nsuRcEaIDG4Ge2GER/+0bD8Q2Jc+a
         wCv2cNF9v/U9xjyDu46fhXjj7UqRZz08WXWGyOpq2dOTQny80/XIyQycE9BvijgPCQ9l
         hsUqq2HarAP03FTOFedhicINN/EjejiJHLJYgTs1HvkyZJP72DJSzwSf1UBDuVETqt6b
         adAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUliN5wT5r7eBvPuYvOh7t/K6JK+5JqozrsXp8NX12HpZdMSscMaR/Ii91em8x0i4RkZ461vk75bFXCqIMmKctjISBhcTumpM4pAVKQaREx+Qno1iiKfCZ1mw5inAjhukVneXK2brYb3OjrQycCuVYAwX3pMw0fp5c=
X-Gm-Message-State: AOJu0YzDPe+6iLaSS5Y4PiKTPibx3vstYjaq7zH4XIMDHVQSsqUu6Wo3
	EY1JX01TS8aitwzcdP6lkGvOrPHjBUBQNioBaUdgD5Tv6V8xFjXWYXDD8wjvTJ6UeQs8Ej52WWu
	r0waShJMBM/r9DqZk4ZUPDTQ43wc=
X-Google-Smtp-Source: AGHT+IEu9R5ps8z0ag1x9yvDbuPzRc4SvSDrkTZnExvKYz8mpN3z/gMPOIu1p69pbspBEQ/QMPtSYcClfLge19czC1o=
X-Received: by 2002:a5d:6e8c:0:b0:360:7761:e304 with SMTP id
 ffacd0b85a97d-3607761e376mr9263379f8f.1.1718559292499; Sun, 16 Jun 2024
 10:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240607082155.20021-1-eladwf@gmail.com> <171824043128.29237.10490597706474690291.git-patchwork-notify@kernel.org>
In-Reply-To: <171824043128.29237.10490597706474690291.git-patchwork-notify@kernel.org>
From: Elad Yifee <eladwf@gmail.com>
Date: Sun, 16 Jun 2024 20:34:44 +0300
Message-ID: <CA+SN3sogd29XG7Sgz1EOqBqtxxcVzFkB_mFq10TW+eYGKtdDTQ@mail.gmail.com>
Subject: Re: [PATCH net-next v6] net: ethernet: mtk_eth_soc: ppe: add support
 for multiple PPEs
To: patchwork-bot+netdevbpf@kernel.org
Cc: daniel@makrotopia.org, nbd@nbd.name, sean.wang@mediatek.com, 
	Mark-MC.Lee@mediatek.com, lorenzo@kernel.org, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux@armlinux.org.uk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_103457_231980_79CEC57B 
X-CRM114-Status: UNSURE (   4.83  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello,

It appears that the current sanity check is insufficient. Should WED
be utilized, it will be necessary to find the appropriate PPE index
through an alternative method. Kindly revert the recent commit
temporarily until I come up with a solution

Thank you.

