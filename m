Return-Path: <SRS0=hSNv=LK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 712A7C48BE6
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 23:23:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32EE2613B9
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 23:23:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32EE2613B9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yaE58ZHL8mh89iIH/kqQ9og5RpWWGYIABgJjd6rCzBE=; b=nf4bbILCBqM/UY
	JrxCLKAxvDkX5TK7SPDNVw0vmVNnF4huLpm+ZXDxfcvznI+UthTzudM/J+cWeNc2OlXvGuKl75rnC
	a36lIZ5hxtTe3/QiFbt/ZzQIDNnfDwCReVQ94JYeu6BazbpQx3JT5bOzHV6P4x1zHgVBEtAud+8DK
	kvBYwG5fU1gHVF+tZSzVMzhbuWwC3PCH/mxmnocXCHFjGPkRUPex38K0XansieKtF4pAk7IHNtL/P
	bU+SzHOF+HQXyDo62b7iKUkkNTKh51frOwSIJ/HQjx3sWuX/5jnyb5X0rl06GYuPtruNHLQakUHbm
	3z95z7vyGFkglWDLQAaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltes8-0087xR-98; Wed, 16 Jun 2021 23:23:00 +0000
Received: from mail-io1-f45.google.com ([209.85.166.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltes5-0087vY-6Q; Wed, 16 Jun 2021 23:22:58 +0000
Received: by mail-io1-f45.google.com with SMTP id s19so1046570ioc.3;
 Wed, 16 Jun 2021 16:22:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sT55r6CNEZMib5uoieAPwMKrpqQFOR915u+G/id+O8c=;
 b=l66sWRlrXmSkMJ0WgKUOFrViSqVNJWfWtFpwlixgNQL2kS0vLvaGDyybaV87kxuUHA
 frJF2GTzw5OQ+dRM4vZcBJJaKxh7AGsce3CeZ68+zekUE32TKVUzi+c0+G2q32bS2V4E
 eotG4Yvzeo8ztNzZc9kXAfZTtGOAmHWnEAHV0Nn3WVnj3tHttQvFq8NbR4HGKrOEguaS
 dSUpH5Ti4MyljfUnsuRlzKX78urXcKyu0vNxsYZmXdWf2ibRsMcgtSqENjWn6C3Rg7/E
 6KiNsMq4qNnJllp0B018keXQWM9DALPPn5JdEUIE2Fg41IfUu4FkpwNG5o0QQvIEKNaI
 w0pw==
X-Gm-Message-State: AOAM533Mts1FzKAcs8KXinwIKf1Bg1Tih/UhKTNP9u34TyxnV0I6FaJq
 Zgaiso8dLMM9ZDjDWPniTA==
X-Google-Smtp-Source: ABdhPJxz0m48Lc6wge8V7RgY/VykuKzOdsCXuhgzkBYxqe29UMDL46K1NPHO39N8+gpYuvPhjjXiiw==
X-Received: by 2002:a6b:8f81:: with SMTP id r123mr1108781iod.154.1623885776371; 
 Wed, 16 Jun 2021 16:22:56 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id e4sm1829304iow.47.2021.06.16.16.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 16:22:55 -0700 (PDT)
Received: (nullmailer pid 277485 invoked by uid 1000);
 Wed, 16 Jun 2021 23:22:53 -0000
Date: Wed, 16 Jun 2021 17:22:53 -0600
From: Rob Herring <robh@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-cerise
Message-ID: <20210616232253.GA277451@robh.at.kernel.org>
References: <20210604052312.1040707-1-hsinyi@chromium.org>
 <20210604052312.1040707-2-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210604052312.1040707-2-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_162257_267192_807B55A8 
X-CRM114-Status: GOOD (  10.13  )
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

On Fri, 04 Jun 2021 13:23:12 +0800, Hsin-Yi Wang wrote:
> Cerise is known as ASUS Chromebook CZ1.
> Stern is known as ASUS Chromebook Flip CZ1.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
