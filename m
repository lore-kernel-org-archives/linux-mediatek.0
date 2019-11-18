Return-Path: <SRS0=+oxs=ZK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94CC5C432C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Nov 2019 16:50:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64E3D21850
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Nov 2019 16:50:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qyu3hl0q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64E3D21850
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OEJTFameuxH2117Lza/E28myEZkKwWTg0WX/fX8o/Mk=; b=qyu3hl0qu9d6Xm
	N7iKQ1Oy0uy1hPh8bNZ6V0t2DoIG51PYTkvwgm5eL8Vu/kojY8h0HsUforhX/TRJQb1ufcV4pBtcE
	McPIO/BuZAHUqpSl4BM5Tl0zlL2NimR7pk7/K+ftGmVYv1qi+jXNh+3ikbHcd7WCSTBU/nwOEyVXb
	Y9RQQhKzNXIcuhfwAkMwsIn5AcPRenvXO9Sr2tAXcE1z+JGImjNZ6pOsTtq8lyPFiLRanl9i30yUb
	mSRgdT+TJPP9zG687N2vDe2MIabLZ3RfCJGZCFEy3mVFXxcmL1NVhfAr4SzDrOntgeNr/5Of8enX+
	Im8C47wRZx6JncQqwZcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWkEO-0004A5-Ut; Mon, 18 Nov 2019 16:50:28 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWkEE-000410-Gh; Mon, 18 Nov 2019 16:50:19 +0000
Received: by mail-ot1-f67.google.com with SMTP id w24so14620898otk.6;
 Mon, 18 Nov 2019 08:50:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5NYQIVzszlovCzGCoyf9SHkjEAYAPxgYWsdxQCoKIq4=;
 b=WImTOJZP3yNjIeXxE5FR9RkAmajgGNsl2T/+MSS0yYKGeWtGaP/P7ri9LE30aggkwn
 l8/NV4z+dMqR0ryUECn7sCmnKcF/4AKvZQps+/x1ywFTgDxmDCxph8nHVWSKKpwqsVf3
 XV6ddiqoHVEQWhY6FlAtxNPLn5Ml8ncWqyAJuok09VK/ZjCwkHKZ4PXM57hX7Epx2EZx
 HpLQW0MJ+iQgweMybP0h243YvcuOEg5FFq7uQWiBEeFK8PhfNpp90KpHHZc02FZrcNqp
 mz//8jCX7EUmpwwQdmuWfYfBlaMnQRbTu7E65TYfSKNv4FdTsoSUcUcUttyUYq8PqkrC
 vMHg==
X-Gm-Message-State: APjAAAUAf5X7Yw5Sg8lwb6g3ia3J/CwUh5vp2L8V1+IC/wBUuGzkj/JJ
 1b2Ob0twAsqOrF6OUtkPcQ==
X-Google-Smtp-Source: APXvYqy5fyTYkoXXqqwQ0H9dOLJstLheW2bjF5U1SrvtNLNVH/MBfBQlyKUyfzD0Wr2bOMi5c0zc1g==
X-Received: by 2002:a05:6830:1e4c:: with SMTP id
 e12mr162673otj.358.1574095815692; 
 Mon, 18 Nov 2019 08:50:15 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s133sm6229914oia.58.2019.11.18.08.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 08:50:15 -0800 (PST)
Date: Mon, 18 Nov 2019 10:50:14 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v4 01/11] dt-bindings: phy-mtk-tphy: add two optional
 properties for u2phy
Message-ID: <20191118165014.GA3621@bogus>
References: <1573547796-29566-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573547796-29566-1-git-send-email-chunfeng.yun@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191118_085018_588703_85551597 
X-CRM114-Status: UNSURE (   9.91  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 12 Nov 2019 16:36:26 +0800, Chunfeng Yun wrote:
> Add two optional properties, one for tuning J-K voltage by INTR,
> another for disconnect threshold, both of them are related with
> connect detection
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v4: no changes
> 
> v3: change commit log
> 
> v2: change description
> ---
>  Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
