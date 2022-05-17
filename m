Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFF3C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 14:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dp7Z5QvrlF7LM/5eh5ptIeX5ASyQ/bmtUNPU84igS1I=; b=bwyZVf3ZxGynF8
	qOO5DWvGNC5ERj/8UrpPK8wCBqLKoWBTAncPiCreplXfiW3oIhAEMgFn3wXLkzKDobVBYi/3GOROz
	7Po12/8THIz3z1QDSyhA6TEw1mPhGKO+cTcUdCx8wZyUy6PL2A0+fyAhtp+rwHYPVC2tL9AjYU44Z
	jGbXmf24kgXe8g6gSzUVFyKMsPJt/xRZ5I52z4CrhYhsQLndqYiVZpWBdZJysUAcEK0zk+zdl+8BY
	L+61womEPk4AM+dH+3HFG34fvAQg+1Jvwt4i+MpUun/pR3M3W577fxqcW3XVJBLaOeUi5rTwV0kym
	oHyQaWzp+rIRdfW7AAiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqyKT-00EUjw-5u; Tue, 17 May 2022 14:37:41 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqyJg-00EUJ7-36
 for linux-mediatek@lists.infradead.org; Tue, 17 May 2022 14:36:55 +0000
Received: by mail-oi1-f173.google.com with SMTP id n24so22470054oie.12
 for <linux-mediatek@lists.infradead.org>; Tue, 17 May 2022 07:36:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q5lBuzj7jrTo1bfrQUEvnoU3RNCjBwv86AZJ0JkzGd8=;
 b=PGrgcMRLaDdp0wXrMxocZitjWq2hsNpDr4xfLSaN+Pa2l1IXnjnGG+YsLt8QaEc+9x
 ihizMHoKSpiaKbYJElCugNQKYtS0LcFRNW2QuD+UurPs4A0+xZL0XPmRYwZoj9RfiibE
 zEQcWBTGCKwir+zhRKAprMg3btlQwa2shSMkZwjoidDcqixkTw4TAVmBh9ZqB3K3FV8+
 ta0NetwvrwG/EMo9N4WZAEQBRAdkFUPm8QsvhXOnlxu3MWa2XQPEWAjDNTeF2nazs6zN
 xuZfVHbjs4bGPbW6wBdgcRE0TxhCOwIpOxpKz9ufcfTySp/NdAzKR2xkseIv8pwP9nTJ
 3mGA==
X-Gm-Message-State: AOAM5306gUmxRVIqkiAcDI18Of/vLzrveLyPXrgmg9Wq82QrQAl4VDxJ
 hNYdqeRlonq8tax3CVkDJA==
X-Google-Smtp-Source: ABdhPJzIcHczmuF3hxxob2E68B85dmbZb4/C/nUn+ACeqTvaX7o7FfPdMwzAISFHxfP0xQ77wLofQA==
X-Received: by 2002:a05:6808:218c:b0:326:955e:f39 with SMTP id
 be12-20020a056808218c00b00326955e0f39mr10911612oib.237.1652798206877; 
 Tue, 17 May 2022 07:36:46 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 a18-20020a056870469200b000f18cae8c0esm4282088oap.30.2022.05.17.07.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 07:36:46 -0700 (PDT)
Received: (nullmailer pid 988925 invoked by uid 1000);
 Tue, 17 May 2022 14:36:45 -0000
Date: Tue, 17 May 2022 09:36:45 -0500
From: Rob Herring <robh@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: davem@davemloft.net, linux-mediatek@lists.infradead.org,
 Sam.Shih@mediatek.com, pabeni@redhat.com, lorenzo.bianconi@redhat.com,
 Mark-MC.Lee@mediatek.com, kuba@kernel.org, nbd@nbd.name,
 sean.wang@mediatek.com, edumazet@google.com, netdev@vger.kernel.org,
 john@phrozen.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 net-next 02/15] dt-bindings: net: mediatek,net: add
 mt7986-eth binding
Message-ID: <20220517143645.GA986163-robh@kernel.org>
References: <cover.1652716741.git.lorenzo@kernel.org>
 <aa934c3185c9e04893d9c285ed655495a049fa4f.1652716741.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aa934c3185c9e04893d9c285ed655495a049fa4f.1652716741.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_073652_224224_3649E489 
X-CRM114-Status: UNSURE (   8.29  )
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

On Mon, 16 May 2022 18:06:29 +0200, Lorenzo Bianconi wrote:
> Introduce dts bindings for mt7986 soc in mediatek,net.yaml.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../devicetree/bindings/net/mediatek,net.yaml | 141 +++++++++++++++++-
>  1 file changed, 139 insertions(+), 2 deletions(-)
> 

Doesn't apply for me, so not tested, but:

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
