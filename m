Return-Path: <SRS0=Rt7e=MF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 082D3C07E96
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jul 2021 21:50:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE03A61363
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jul 2021 21:50:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE03A61363
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nWJpN+wHf5gnhsBFw3v5pwntRyn9B8A/CmgTyanWmJc=; b=rQvP+Hq74+OjJm
	zWUxaDUMmHlHk5Bg7IvVqD0ZWsDY6sMa/DbnolF8XrtXaEgCRufLOrmHXXQYaeOaxgYw2kLcbmG29
	IMLPLvYMbpAbzpdTuvHZeckweVYrLS1TEL3JStjEsz+p8f+gzyqra2HKKtwHrjeqo6J0IUiWoHHfy
	nDi4CqfZTDk+GXKpKXUZIBZsz/L2XylGQPWYT1vg0Qt4EiF4fZWBDFsIi8UmQWOdCPez3cNCIASq7
	s5YmMdI2q6al4webSJSS2UgMm/Qm0DQZks8RTGgE9YqfEQc5tFzwOE8FS3yw0HwmIBimDvrrNBQjN
	gJ85sZpU/Sggv5/Qye/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3QI7-00BPcC-Q6; Tue, 13 Jul 2021 21:50:11 +0000
Received: from mail-il1-f181.google.com ([209.85.166.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3QHz-00BPbJ-Iw; Tue, 13 Jul 2021 21:50:05 +0000
Received: by mail-il1-f181.google.com with SMTP id r16so17753374ilt.11;
 Tue, 13 Jul 2021 14:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3dHh7Vil5JrWak2z66/WoqkZsfwWNtjB23PPCa1W0OY=;
 b=fiZurE9Cu2GqJt+d7kHhsiiw3Xsk0fe0+lyhRGgdIY0kHvC49pbX84OpPN7AISImQJ
 CiNXpMPNRVNDCjEyMXgqovCIYspU0fS2ULqbJhKBoc+DTWRR5+UbBPFFrG7NRaHgj9eT
 JWl/DCIXdQcwLn+Etn6HCw/cxvLVEkQckIlITUjtKC6HfDtXkVhCNRWrKinUkOtgWn5D
 MTfgXAVzMmyXUV0I4T24tolxb/pHRBXGAY126pMlUSL2o3nxXmdNXVyQO+5fQgFjYKf/
 4EdmUuSYz6hdJFVvW9szhjD680GhBeI7qnk1bdE/vZahO1/OjneFw2aSS0mazOoaFriM
 AbQg==
X-Gm-Message-State: AOAM533hBXl1X+WlVjDPgJUZAYeWQzYCTv0MZLlCnROj1pyXwy3R0XcC
 mQQ/9S4RtCOWCQaSyTsEBQ==
X-Google-Smtp-Source: ABdhPJwhre4QrspuDRU6YJhLmkbv5oRQlsOVAGVEyUWxVg0ueeLz0Pa7fBFOBnnCnLbv4cTCPEmSrw==
X-Received: by 2002:a92:ac06:: with SMTP id r6mr4279396ilh.74.1626213002723;
 Tue, 13 Jul 2021 14:50:02 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id a6sm118786ili.21.2021.07.13.14.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 14:50:02 -0700 (PDT)
Received: (nullmailer pid 903961 invoked by uid 1000);
 Tue, 13 Jul 2021 21:49:59 -0000
Date: Tue, 13 Jul 2021 15:49:59 -0600
From: Rob Herring <robh@kernel.org>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: linux-clk@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 Stephen Boyd <sboyd@kernel.org>
Subject: Re: [v13 02/21] dt-bindings: ARM: Mediatek: Add mmsys document
 binding for MT8192
Message-ID: <20210713214959.GA903907@robh.at.kernel.org>
References: <20210706061920.16013-1-chun-jie.chen@mediatek.com>
 <20210706061920.16013-3-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210706061920.16013-3-chun-jie.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_145003_670175_0AF83DB7 
X-CRM114-Status: GOOD (  10.64  )
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

On Tue, 06 Jul 2021 14:19:01 +0800, Chun-Jie Chen wrote:
> This patch adds the mmsys document binding for MT8192 SoC.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.txt          | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
