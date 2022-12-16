Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E70C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 11:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=13Vm0Lo332lPPEsaCgPFzelDF94GXJZ/U5/noq/R55w=; b=eUMPbUWhpuJpiJZnQaCqy8VcEv
	MR/wM+yQFlvw5WrlQtbDxpNYNpZkNzK9/CMePQtlk9eCOPH3sdtbMktBFbXVzRsLNNbib6tyEZuhB
	XIuejm/g9gAQDxcJZnNSeFA/fpD8ZZ6mSD6L2f/58vTIRS4wnBBzlXFHUHoQmzZr258sN5LaDq4ze
	qhTispJWbGa6qVAJGH77PYJbhWlFEA4eAz4cjAheswnGcONO1VI22Arrt0yym6DVQC++7P2rwlwj9
	jCoHq3tN/1pXmjJA7QVEQGebvOOmikp+ru2wwaUZZImol8RS7gJ5+pRcrl2ZPKLc7U79oO3hQMSN0
	9FRDPhdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p69HU-00EgZB-5p; Fri, 16 Dec 2022 11:53:36 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p69HG-00EgMO-SG; Fri, 16 Dec 2022 11:53:24 +0000
Received: by mail-wm1-x32c.google.com with SMTP id o15so1675390wmr.4;
        Fri, 16 Dec 2022 03:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=13Vm0Lo332lPPEsaCgPFzelDF94GXJZ/U5/noq/R55w=;
        b=m+6cs8UgDkgrBh11MngOAu6i4Zg6gyR10RxWXvHqf9GwlYCVctTfJHXDFmc2AKCLNX
         wWoU6Xixz7e/eZTf5rKFD8YlcDnjwg9BPwUPfV5g57+6MGXL+91OhowWpKSYMXHetrTy
         AVu6hA0h4jIwWetkwP1bCGUup6ZIwBeq93USUDy9jz2S/yM+lrAcEpEOmHMCBCuCfxFi
         npWQbhxSvU/MVCPYbpuUoFAeMLeYjIr7y7nIl7T/hfZTGTPNguok1+BX2EWlexJoXhnh
         154FLq2azM0avyQ5HBQ+Qylkx1yybgYNgjMsf0KTCt+oJR0WQtSg+bj9pr4u7/UyLVKB
         jjfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=13Vm0Lo332lPPEsaCgPFzelDF94GXJZ/U5/noq/R55w=;
        b=g1W5UhAkNXT9z0D9jvgbtg2+12aYACqaTYNK2WmehTENQ+ItVpopdNntJskcliE6qq
         MgCCIeMnPHcyx6DBbvJOVhsBac2zzM8HMyBpn253m1AbDI3HM4bYLdKwsoZS71xnlRID
         DjXjcSglTEuVBZX3c4PoJptAYMQ0kkUpbKKlvoRAi9VhRSObhG7QjV4TzAHxak7ef6m+
         GdIO/SOwr6561wAizBEpnhJ/F8l1+CV6WvJZKxV4TRstXzCseDKDHfO05AbUJTIjFxIR
         GEx+3+qt/565PJM5jPDgT5qo2+Wa/ZrGzysyv9kCcQmkvBFt9FJbh4LGcCf7/Tttr67k
         GWCg==
X-Gm-Message-State: ANoB5ply2syGrq6Neg7SDcDloArGBgePZwpw4whZyFzNbR7gG9rVd+f1
	MF5msUpyjebL8BGy4fEp0Ao=
X-Google-Smtp-Source: AA0mqf5bZXdv96QOcJhiW7IsKGleAkHdIQijkx4qy+QU0fcKKDKeNqxRLGjMQy21S+2Q0rZzIzjBfw==
X-Received: by 2002:a05:600c:3d8f:b0:3cf:d70d:d5a8 with SMTP id bi15-20020a05600c3d8f00b003cfd70dd5a8mr24051092wmb.6.1671191595799;
        Fri, 16 Dec 2022 03:53:15 -0800 (PST)
Received: from [192.168.1.132] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id ay9-20020a5d6f09000000b002425504ae7dsm2071582wrb.80.2022.12.16.03.53.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 03:53:14 -0800 (PST)
Message-ID: <06e969b5-3be2-4b23-de5a-93aa9ae6d95c@gmail.com>
Date: Fri, 16 Dec 2022 12:53:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 0/5] Add CPU caches information for some MediaTek SoCs
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 nfraprado@collabora.com, kernel@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221206112330.78431-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221206112330.78431-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_035322_944907_1DA05673 
X-CRM114-Status: GOOD (  12.70  )
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



On 06/12/2022 12:23, AngeloGioacchino Del Regno wrote:
> In devicetrees for MediaTek SoCs the CPU caches information, if
> present, is incomplete as it misses cache size, cache line size
> and number of cache sets which, in turn, will also prevent any
> cache associativity calculation.
> 
> For all of the SoCs that I know and/or I have information for,
> I've added the right information for I/D, L2 and L3 where present.
> This will also make the cacheinfo driver to correctly export the
> CPU cache information to sysfs.
> 

Whole series applied, thanks!

> AngeloGioacchino Del Regno (5):
>    arm64: dts: mt8195: Add complete CPU caches information
>    arm64: dts: mt8192: Add complete CPU caches information
>    arm64: dts: mt8186: Add complete CPU caches information
>    arm64: dts: mt8183: Add complete CPU caches information
>    arm64: dts: mt6795: Add complete CPU caches information
> 
>   arch/arm64/boot/dts/mediatek/mt6795.dtsi | 50 ++++++++++++++++
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 74 ++++++++++++++++++++++++
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 58 +++++++++++++++++++
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 58 +++++++++++++++++++
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 58 +++++++++++++++++++
>   5 files changed, 298 insertions(+)
> 

