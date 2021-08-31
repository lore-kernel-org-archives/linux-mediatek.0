Return-Path: <SRS0=bg5C=NW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2742EC432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 19:28:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4F0D61057
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 19:28:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E4F0D61057
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JW6iCOrn8GdctAbtxebjGVJKdN9/cWva38OBOrmccVo=; b=wXX3UJds1lZf/1
	sKd7F+neA6M7w+NupxWWcSgr3I0rnjpy0b0kBVqz4UbC9G4HkgEVishKk8fs0MKAfif0lJQPe7Nmo
	0M22AotHBhTBRvpSKKq64SAd61dF60aW/d4OQwW8aXlp5JqzuxC4VKib0hKgKXJ8A+WKTJUTXZ2uB
	aUwxEx2WHhTH0xyNRYh9kHiXiow6/Hc7EK6znvmzuAra8HsXkWWTJzyw5ODlTcb76b0kOW1GCGEXd
	BL+Dlsx1HRYhSO+0D/6kZhRfN2Z/cqc6Atky32V7pJfJDI3m1ykHbK8V/1JRa16R488GjWwo4nAyr
	UGin3f5LpdVi44/qGHGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mL9QX-0032Dy-QP; Tue, 31 Aug 2021 19:28:09 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mL9QT-0032D3-Nu
 for linux-mediatek@lists.infradead.org; Tue, 31 Aug 2021 19:28:08 +0000
Received: by mail-oi1-f179.google.com with SMTP id p2so603487oif.1
 for <linux-mediatek@lists.infradead.org>; Tue, 31 Aug 2021 12:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fe1iPBUGll7CabOyKIXq9rii3gzsPUouD/WcotDVXrU=;
 b=nZWFGWNmacUMCHb9Ljs0rjNF3uMgr9ORYLHHKoCM60Kd6tS8FRn2kj9CcotJeu+hy8
 v86cL47bWlm9sg9uiY3yhZuy/yOYXWfdEJMJBNUXuI1GXAcwB8BmNjOCkFskKoBF0LzP
 7ByPcU6LNqnzGK/BUdFOyevIjXRcMepfi7MsAmTypENnhzh6fZ9/UL5dVOcSrIc39S0c
 tM8eFmJfuYW4zhXB7WS0tfd2wnkdUmQmGxgcu+hbum7n0Q1taJ3Ivm2TyzYdp0oC9Fqe
 CWMR7LCc5W6UuaEw4PfyY0EqzaKO1GNB9NHNKIuxlhf/04+OERV1wzrPRtW6dU5H6ln8
 Cx5Q==
X-Gm-Message-State: AOAM533VlLekjPPv+vqbMnppN96I7P1HjXPiD+qcIfPv1cJUAdj7fkjo
 gPs4ntA4RQR+tnNNkX0MfQ==
X-Google-Smtp-Source: ABdhPJws9qx6XcrPGYIgnpGeYwiVAlvmQxI62yN9BSuYhFdbaGJzn1YOmnSK5UDGBccHB3nFVAw/sQ==
X-Received: by 2002:aca:210f:: with SMTP id 15mr4521746oiz.102.1630438085170; 
 Tue, 31 Aug 2021 12:28:05 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id p81sm2001401oia.48.2021.08.31.12.28.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 12:28:04 -0700 (PDT)
Received: (nullmailer pid 516178 invoked by uid 1000);
 Tue, 31 Aug 2021 19:28:03 -0000
Date: Tue, 31 Aug 2021 14:28:03 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>
Subject: Re: [PATCH 2/2] dt: bindings: net: mt76: add eeprom-data property
Message-ID: <YS6Cw7YxKKaBaLzW@robh.at.kernel.org>
References: <YSWdv7ZKz7SBtF+v@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YSWdv7ZKz7SBtF+v@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_122805_817604_3CA6E5FA 
X-CRM114-Status: GOOD (  10.18  )
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

On Wed, 25 Aug 2021 02:33:23 +0100, Daniel Golle wrote:
> EEPROM data for mt76 can be embedded into device-tree as an array.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../devicetree/bindings/net/wireless/mediatek,mt76.yaml      | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
