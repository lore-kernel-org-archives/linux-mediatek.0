Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03063C77B7C
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Apr 2023 12:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ta0l6Lv08itCF3ih3pDrrtQORcFWDgffeo/Lv6j7nWs=; b=PhzACOtGXlcJCDwX4hVl3IpSJ5
	EPUcg6Xj6khoArXq6itNRsikClAel/7SnwFrlOW53XdDfo5ti/FV5VNBdi+T794e08AUjsLWFV3qT
	LFjf6pVVhCLfUvXlIZN6fPsFdonvNQX/jvGTxIRxqvyLzJ/TzEQ/X0ysIREizh/tLpGO433caSmSZ
	rjZNgqATSvQ7Y01EzU+qNWhEnCU6ntB9KPLoeaipUJElxXoG2jB31sCnZtg9NsLx3J2r9dUQdunbE
	88GeIOg1TqT4ubaHehJ6bbOq/IqH0kFzX2uB6V8kacJbQO6WiLF0ITJzOwC05XFnhl/AJNs/tp/GM
	Y0gvslbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psNBF-009mw0-28;
	Fri, 28 Apr 2023 12:26:29 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psNBD-009msr-09
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Apr 2023 12:26:28 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f19323259dso85646315e9.3
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Apr 2023 05:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682684785; x=1685276785;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ta0l6Lv08itCF3ih3pDrrtQORcFWDgffeo/Lv6j7nWs=;
        b=l/kvU/GHw0avOPKANSxEPurb9FkrW5c6sXEi2BHlm2Y5GYB5+69txZKbvaT6AOqCtV
         bLqaNmHLakLuj8vEtMZfeULYDYmyOdqFqaTSDVHI7tb6eRP2mnxzK3FqjAAHXY5rb/OL
         BfwoZtZBL5OCZ0OrlVcgr47q17VWh+ity76RJudCv0Uu0NZ2/vrnElhg6OS2Hz6cPcc9
         aY95cnaUz25Y8TO4UDkNtDnyUpHkPi08ucqhgM/f+OBLkTwYb8LbetYh0kHggEaUf1sF
         SwVLeBIA6FT6zGCA+XbGx5trbNwvUpZLgQFbOG2oJtvclEZrci8574SccMx4h522wQKX
         PwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682684785; x=1685276785;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ta0l6Lv08itCF3ih3pDrrtQORcFWDgffeo/Lv6j7nWs=;
        b=IzFeRqpH1v+oskGE+t2kqqMayuDaZXO7g0m+yvbntMbXWgxDuXBIBbRH1K0WVT42Tk
         EXgY51tUOHBY5mrgl5XpRGrMTS/KTRQ2iqrQ8wfjIvnRThdSYmokaxNYt7MPjiQ16UzM
         eI8nLiGlSxS2wufGM6SsJ5mceWMQDBg3CnNHwjwXcreCeXYxxZ5XJljBTHfgLrdA+8Nu
         En+z+yqQba8+HsE/cL7+9NYOJdPofvIIjpJ7M72fBCIyG2N1KEMGoAFMan49FCE2LGLT
         faKK7GcRMkzoaQM5ap7Ttk/mUtht8adeAj6zyDRBF3ndrI176dBOtQoZJz51rtGkmoX9
         8W2Q==
X-Gm-Message-State: AC+VfDzizDvTLLeZtVTmUOSW3+fX+dNKFqI+u3gQV3scGD7jGfnMTCZC
	bSfst/SWD0U7Gq/59h36OFIsqQ==
X-Google-Smtp-Source: ACHHUZ539Um3Au7ebr5J25DDcgb29sKe92KDcP8tUre5wahXVbiS2azwg4bFs5ceTkPhZOBWur11+w==
X-Received: by 2002:adf:d4c6:0:b0:2ef:b8e3:46fe with SMTP id w6-20020adfd4c6000000b002efb8e346femr3704585wrk.37.1682684785530;
        Fri, 28 Apr 2023 05:26:25 -0700 (PDT)
Received: from [172.23.2.142] ([195.167.132.10])
        by smtp.gmail.com with ESMTPSA id f8-20020a5d4dc8000000b002f9e04459desm20930621wru.109.2023.04.28.05.26.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Apr 2023 05:26:25 -0700 (PDT)
Message-ID: <9b39118b-afc8-034a-67ad-c748cb76fb71@linaro.org>
Date: Fri, 28 Apr 2023 14:26:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 0/7] GenieZone hypervisor drivers
Content-Language: en-US
To: Yi-De Wu <yi-de.wu@mediatek.com>,
 Yingshiuan Pan <yingshiuan.pan@mediatek.com>,
 Ze-Yu Wang <ze-yu.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-mediatek@lists.infradead.org,
 David Bradil <dbrazdil@google.com>, Trilok Soni <quic_tsoni@quicinc.com>,
 Jade Shih <jades.shih@mediatek.com>, Miles Chen <miles.chen@mediatek.com>,
 Ivan Tseng <ivan.tseng@mediatek.com>, My Chuang <my.chuang@mediatek.com>,
 Shawn Hsiao <shawn.hsiao@mediatek.com>,
 PeiLun Suei <peilun.suei@mediatek.com>,
 Liju Chen <liju-clr.chen@mediatek.com>
References: <20230428103622.18291-1-yi-de.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230428103622.18291-1-yi-de.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_052627_096884_C9405723 
X-CRM114-Status: UNSURE (   9.30  )
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

On 28/04/2023 12:36, Yi-De Wu wrote:
> This series is based on linux-next, tag: next-20230427.
> 
> Changes in v2:
> - Refactor: move to drivers/virt/geniezone
> - Refactor: decouple arch-dependent and arch-independent
> - Check pending signal before entering guest context
> - Fix reviewer's comments

You need to be specific about what you changed.

Best regards,
Krzysztof


