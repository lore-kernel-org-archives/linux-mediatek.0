Return-Path: <SRS0=3cxa=PP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B36BC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 02:16:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AC05610A0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 02:16:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0AC05610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m1QObF+TSZJXpB3eU3gs3FnZXzamxIe3JE/QnxU44YA=; b=kUWL85no354yjo
	5zDmZ/i5TXZ38aJCkN9jkv9JYgsjpjnlglrZoTnZQlu6gi2srDOHfTYHqlrLYJBPgKvKPw0XEHH0T
	uW/NeiniA+sfDfl+WYql7GcvdTZQ4ozgBPDh8Va2ixkFvVAjoSyONYXLQl8x8uyMAXYUnwPmu1SfW
	bObEHRu3jDamhi5l2xUNp4lvP35FNPfQjDeyL8RGuOPP3Ye4Mp1UMprwipfokua52Mbfxxn1Wv6yj
	/CGLw4FXCJVB1Q7afmdFQCYzZEnWexv9JueeX1GFMCZtB7vy9Z/IqdpBxVnqmAZElBwjxwuIRN/Is
	Wp5BnEmnoULZ9qFNf4EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfYTo-003ZRg-CH; Wed, 27 Oct 2021 02:15:52 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfYTb-003ZOp-7Y; Wed, 27 Oct 2021 02:15:40 +0000
Received: by mail-ot1-f43.google.com with SMTP id
 e59-20020a9d01c1000000b00552c91a99f7so1498210ote.6; 
 Tue, 26 Oct 2021 19:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4e48CX0qvtEmKBUWQL7AMrMjdEX7VZo66I22J7xcWhA=;
 b=e1vhqGD2Q1mHIntBfVi6vRUQIDKIJ8faVKWwinPOECijl+GvRawuCZlCUtf28/jW2y
 AbmImVXnWIexO6oRyPf41B6MZ2SohAw/zUQL83FIl0qu6EBFAtP8PHMdI5bfGNQkTQ3n
 OXiaNYAwgnNhcpmPt+nNyGF4QssB5IDrq0QBbtyOf7+7h1fogBsjiuErYNfw9qN8SScw
 rSsCMVyyZZ4278xNoX8ZEXEaLqyfc8jzycJm3hePijPWdfsn+9bAUUrTIRYm1S52vteW
 ecs3Yb1juxpwP2B8IVqk6ZCRt5XLzny3L1Gn96E0Ch9im9lU//okDN8sq4/LUKixDoia
 rOiA==
X-Gm-Message-State: AOAM530EvbV4sKGW/Mah3cKoYTwVcvi6wqGbO4O8oTC9DCLPjHoKmO0U
 1rwCAcmoI0K3/5uGb9iTFQ==
X-Google-Smtp-Source: ABdhPJyChzGuvY5bqBc8KDyGx9en8XmDx9zzO4Uf41ZkubxMcyZGH6scuTsDj6Yr361N81N/JssaGQ==
X-Received: by 2002:a05:6830:1c2f:: with SMTP id
 f15mr23060547ote.63.1635300937707; 
 Tue, 26 Oct 2021 19:15:37 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id f10sm5521224otc.26.2021.10.26.19.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 19:15:37 -0700 (PDT)
Received: (nullmailer pid 3809599 invoked by uid 1000);
 Wed, 27 Oct 2021 02:15:36 -0000
Date: Tue, 26 Oct 2021 21:15:36 -0500
From: Rob Herring <robh@kernel.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Benson Leung <bleung@chromium.org>,
 devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Guenter Roeck <groeck@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: mfd: change naming of mediatek rpmsg property
Message-ID: <YXi2SBjJin9Nw1Rh@robh.at.kernel.org>
References: <20211018115111.14096-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211018115111.14096-1-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_191539_293663_605E88F2 
X-CRM114-Status: GOOD (  11.42  )
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

On Mon, 18 Oct 2021 19:51:11 +0800, Tinghan Shen wrote:
> Change from "mtk,rpmsg-name" to "mediatek,rpmsg-name" to sync with the
> vendor name defined in vendor-prefixes.yaml.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mfd/google,cros-ec.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
