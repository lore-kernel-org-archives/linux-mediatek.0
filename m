Return-Path: <SRS0=/0MH=ER=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56CC8C56201
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 21:30:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8830208B3
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 21:30:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sIsZt+YC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8830208B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=skQuKeOoa3ZsEo6XSmMJN0m0xWOFzgBzdAqf6pU53NA=; b=sIsZt+YCP68kcjtcpXlYiokxa
	MHRGJuPuM56/82JxadRoJmLahM+cdA/ADs8GZLTgxtGuEdv1hD5a0Fhtpt92i9dLUWZJ0gx3EFRhJ
	NE/k1pnfVEthSUsOiisJZwUdtcBS3btBGFw6E1Oas2r9oE9h3yoJXfgdYr5DzpoDLbmTOuTtxzLi5
	wSm1ZXIeM7KjtgJd/mR/WCBY6bBC/rTw1uxa6CLHG8JPtYpgYwzEgFLJkOvHQNHpA2rYXMpe+fLi4
	Xh5f+0MQLWjvk5M6++KS5lh3Wsd1lLCH9boc+MwapdsU1jYbdMGN1/hhK93P/won2KOjm1jhJmbln
	mW9Hr0BTw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcxhG-0001H0-NC; Wed, 11 Nov 2020 21:30:34 +0000
Received: from mail-ed1-f66.google.com ([209.85.208.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcxhE-0001GA-Np; Wed, 11 Nov 2020 21:30:29 +0000
Received: by mail-ed1-f66.google.com with SMTP id q3so3830808edr.12;
 Wed, 11 Nov 2020 13:30:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VXU2Y8um07dYkZOSE2h8yApKemYd1SjZEtR4nU/PGP4=;
 b=r73hIskN6LlFfMtW43fKhuYpcm7bJVvX+sHA/T8Nb/tfixrK75z87V7saZKHTa49O7
 sSabIoS5/PCUV8yi1jdLg+4LHQCJRvs57KZk82jJE9AGMAG8plLp2A5Gw6Gq76Gvh0yz
 9hGJQW2tcoBoufnOsBEP73LHLe/qSMyiMqrfZhFzLjvb52kDJ5/7q2bS8TCBNZQ6mPO1
 KCpZKjMuZzuMhYYrJGtPSkf0o02AmbY59FOIF2KnY7OeffSvqvqN77X6ofCepqtjPQ0n
 6u8vomPzK2cB/3l8H0+fwKYO77Ayhfof7bvU17MA39Ul/Y4RlAEBRt1sQsflfzrFGrLE
 WY6Q==
X-Gm-Message-State: AOAM532RUTNYA/kFb2RXPdUaTYhdeXuc/oAV6OAkvCqMwIRjWbmPzXLc
 z05AoXbvpJYxyBseQMIqBmU=
X-Google-Smtp-Source: ABdhPJwVSGs92SscCBCPBRoMp1HtHTNhBg0G7orwBTU8eK0jeXqo9NPvVCdZIMkZeStonb8IonVcFg==
X-Received: by 2002:a50:b761:: with SMTP id g88mr1638344ede.387.1605130227345; 
 Wed, 11 Nov 2020 13:30:27 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id k12sm1319337ejz.48.2020.11.11.13.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 13:30:26 -0800 (PST)
Date: Wed, 11 Nov 2020 22:30:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v4 03/24] dt-bindings: memory: mediatek: Extend
 LARB_NR_MAX to 32
Message-ID: <20201111213024.GB287176@kozik-lap>
References: <20201111123838.15682-1-yong.wu@mediatek.com>
 <20201111123838.15682-4-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201111123838.15682-4-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_163028_869711_F99BB10C 
X-CRM114-Status: GOOD (  12.80  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Greg Kroah-Hartman <gregkh@google.com>,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel-team@android.com,
 anan.sun@mediatek.com, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Nov 11, 2020 at 08:38:17PM +0800, Yong Wu wrote:
> Extend the max larb number definition as mt8192 has larb_nr over 16.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml | 2 +-
>  include/dt-bindings/memory/mtk-smi-larb-port.h              | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
