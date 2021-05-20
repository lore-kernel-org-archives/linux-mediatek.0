Return-Path: <SRS0=cSMM=KP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C01C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 00:02:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5527610A1
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 00:02:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5527610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EJm/eDJvZb0gpFIv2JTwv+hfKWahJgMgh8GXaAD6zF8=; b=IjmthW2vqmqTKGoyQU6nI4Nrk
	8oRa1r4+Vk8D3Cj7uOWRUk4y5uR2Q2m7TsUBSXfW3NGCAZp6XudbxEd5/M/d0Oimq5uZvyT8AULN3
	Pfr777pQVX/zabi0caWyg+JUdr4lwwBssPbnx9R8xW9sVJhT4x/bXGnQ+D6h6Ye7Oe68zggwiO8Vt
	PXSdJUjXHttv7AXDnQ83iRHoZMsengBQRVVEuLy7Gt56nxsIuccSX7dFUyJKtUHpLzb66wgu/L9oE
	u9MIq2+H8SQjsqwosbzNm3XEpwNrWhDQyYgcH3WCUwwMGH4CXbcokNM0ZcQmF1NyH/XdpLFxuKdG8
	HHhVkecKQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljW8l-005Oq7-Jr; Thu, 20 May 2021 00:02:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljW8V-005Onx-1f; Thu, 20 May 2021 00:02:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=CqZdJVwT0Nb8DrWS8WJIIqJzdky4y/DuKpCLQt6Q/iQ=; b=BvkT3LFENXDKpX2Lnzcb/zEx+u
 wVlzyXWrdKaQ+VLuF/7QGZnQBxuKzsfCtbkSYhQoTecQ8Qo2vl4EujCt27wduZrG9xTk1G4oTsoAd
 wu9ivVIOYObLmOHFHLIfeE8v4vbc4ecy6r6HTm5Le2Jz9sM3xrxk+KXDbQxLegqBz4F48u0iivNCa
 W53fqHMIoYUqG92ngjUIWl3LezXbY7ImasaZnRjtbFGyFqAQUZDzD8iBkp9TI0AMVcOxrl5x3DfPL
 Vhj8mXW0I1x9FsKZpvQBT5qXWd/uTQ9LkDlvI1Fc6hnp+5CFrRXXrvh3/PlhRCRqLfkKEpIvr/Kx9
 /YCds9qw==;
Received: from mail-oi1-f181.google.com ([209.85.167.181])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljW8S-00FrBb-Mb; Thu, 20 May 2021 00:01:57 +0000
Received: by mail-oi1-f181.google.com with SMTP id z3so14757604oib.5;
 Wed, 19 May 2021 17:01:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CqZdJVwT0Nb8DrWS8WJIIqJzdky4y/DuKpCLQt6Q/iQ=;
 b=srpdAD8dflAVKQt2BwzaTbpd6pF3G1klq15I8vCSkzlLGG9MrtrfImJBoKmlgyIlf1
 9Ob2zPrjOhVtwUw1Sz5Z8CuRHTj9i4qaeV+456YFe9jlAjFVUjp4t3/MvL/u6sVyDb/F
 ernik2zIc5yg234I+ku0rxTVgiNEIjvRhTXO2ARZ6v7X3MXqfznm7nlY11H9tnxoPFHY
 y+iLJzmnflb2q0x5ito0DSWCxyo6LNtv/uJDmE5WIDYIBZyD4GKiGyPfpD8x0/jb/p2U
 fUEbB3YHyEPz1DC6rnxs9PeTWKFntUFsaDqAVU1ioLEQgMPl0B+USWe0IAVirdKVQQ39
 ZQIg==
X-Gm-Message-State: AOAM533TJa9hURD7esQTnHtu4+R6OhIYYRA6UB3SvIsLrJ6K0ivdFq5V
 87ggHTppULYly8MSnz3olg==
X-Google-Smtp-Source: ABdhPJxThq8+RF1gT6s0i1ZuMM1z5xHsoubad0bkXqOJWVYPATEp0Bhsz4Xx38ghfJr5JR0XXyJewA==
X-Received: by 2002:a54:4385:: with SMTP id u5mr1322615oiv.30.1621468915739;
 Wed, 19 May 2021 17:01:55 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z6sm261788oiz.39.2021.05.19.17.01.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 17:01:55 -0700 (PDT)
Received: (nullmailer pid 3920838 invoked by uid 1000);
 Thu, 20 May 2021 00:01:54 -0000
Date: Wed, 19 May 2021 19:01:54 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Cc: linux-i2c@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 mkorpershoek@baylibre.com, linux-kernel@vger.kernel.org,
 Qii Wang <qii.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: i2c: i2c-mt65xx: add binding for MT8365
 SoC
Message-ID: <20210520000154.GA3920797@robh.at.kernel.org>
References: <20210518145522.2420135-1-fparent@baylibre.com>
 <20210518145522.2420135-2-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210518145522.2420135-2-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_170156_754560_BD5D476F 
X-CRM114-Status: UNSURE (   9.88  )
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

On Tue, 18 May 2021 16:55:21 +0200, Fabien Parent wrote:
> Add binding documentation for the MT8365 I2C controllers.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
