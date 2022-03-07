Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581EDC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 21:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nD4LNsuDZl/772brfLldUzHTOTVmgLsldG1paUXgBro=; b=KFbpCCdt7ZL7b3
	2sQZjKe0Lkwjg5+l6q7EvC/wETsmWL46nwRTcq2Qyz0izqmxUBLEzxZQAKqKpmWjYho8sJKFZw0GQ
	1R+hD+fGL1uETNFNeYANBSYTcHtvM34IZGR1n70WNVvyf8dhOOHobFb/Cv0Qsb1LlIHXyBVSZSCmL
	h8hGfXQgiN6JnHQA81d1aurTlS3fl6dKVirMsaTTcN9hR5JL8Pa/jlycglJtoHhfDdEhlMsDGz7fT
	JIoU8lQD8jmETCHS89YRskC1teRau6mv2NFSXLV+nJZ7re64uv60yzEwrDf10kT2K1h4r3xJRAn6o
	TvbrEo0aFNXhvSN7jGIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRLHS-001fyy-Ry; Mon, 07 Mar 2022 21:52:38 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRLHQ-001fxG-P1
 for linux-mediatek@lists.infradead.org; Mon, 07 Mar 2022 21:52:38 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5BBFB3F60F
 for <linux-mediatek@lists.infradead.org>; Mon,  7 Mar 2022 21:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646689955;
 bh=avS2eWzHwYAlHNx2d4yWSoiGc/ntu1FTeA6bPKX64Gc=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=B/vbHnmX7JiW7DQJ3rl1hiP+SydwLlc16dhck6yySWyadm4TDEPc6rg6OEiIUaiwX
 f86I5rjGLLc7Frd/r5BJETC3kJzKkNeIPZGCs/923NHj8D9Uv5MdTNM2yqGyPzS2by
 cub//bmEDpoQ5PRyh4b7Wm2JE94MmiYFyanoMh+lkQvj7WtWw5QcNM8XiD82YkvV65
 JEDKfoz8tox47VLPI9x0IFuRsVKnD2v1Vu0cC08JL+lAqxITRJzTUl+SYG8NQ7GIJx
 Gwcc7YXAq41MfGrAPBGC5xII847V6/SMkBE78Euup3a/B0vy9j6fEM3hFmUD2KPuE2
 Ad5p+JJAtLvXQ==
Received: by mail-ed1-f69.google.com with SMTP id
 b9-20020aa7d489000000b0041669cd2cbfso227518edr.16
 for <linux-mediatek@lists.infradead.org>; Mon, 07 Mar 2022 13:52:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=avS2eWzHwYAlHNx2d4yWSoiGc/ntu1FTeA6bPKX64Gc=;
 b=TakBGFTA8xMLWwWdqmFT0Hor2p7TU9cNBzmaR5Qsa7ngb3e3XFq95JP8PH7U1ohjOt
 UOb3jqbW7H2Og0JT7kxye/Rs+nzM3TfclCIyY5cmgVHw41MNNqJmkBwgijbp6olJ6hOO
 tJHg1tWJjKo8y9N9j6tK8QW5b7xgS1GHB8ysI/tdmUssZunaZ5BIwRfpT02Xvq4YZpb6
 9DjYCV96a7iI95w393Hh7BQQh+i5SEbNDZJawBogNDOyWTmqLg237FxQh/kgTzy6OdlC
 nmZArDUarub+zZixc7Dzjm+hLpN0bJQbyyRxAuD7zyuzQJXLAS/JmVUPCG5njEt0hUnV
 tuRw==
X-Gm-Message-State: AOAM532ph56boWIr/oh58Uuap25l7k2oJZAooUkmvW7GDTMU1JMTC9zB
 ZPcWEGVwGzNCf5Enhpw20sCx5POOqeTbYDAw98gvHXlrbcYnfHS9gC/xQ2xBzQr5pMgEjUKLgog
 PR5bH00k9pawqSDCwF9SzQcPQhDmVWbNYbufiZep6EyDGt2E+xg==
X-Received: by 2002:a05:6402:644:b0:416:4ade:54e3 with SMTP id
 u4-20020a056402064400b004164ade54e3mr5828297edx.222.1646689955069; 
 Mon, 07 Mar 2022 13:52:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzhroSgyUUiu+9iga34EIiz+zQNtDh2UNpPeDJ+/rC9xXcmLwdoBP4LNusITQji+CJ1nzOyPw==
X-Received: by 2002:a05:6402:644:b0:416:4ade:54e3 with SMTP id
 u4-20020a056402064400b004164ade54e3mr5828286edx.222.1646689954927; 
 Mon, 07 Mar 2022 13:52:34 -0800 (PST)
Received: from [192.168.0.143] (xdsl-188-155-174-239.adslplus.ch.
 [188.155.174.239]) by smtp.gmail.com with ESMTPSA id
 gs39-20020a1709072d2700b006d3ed4f51c6sm5289571ejc.0.2022.03.07.13.52.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 13:52:34 -0800 (PST)
Message-ID: <7f99b453-5510-d7f2-3d9b-b3ac3415fa62@canonical.com>
Date: Mon, 7 Mar 2022 22:52:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/3] devfreq: mediatek: add platform data to support mt8186
Content-Language: en-US
To: Tim Chang <jia-wei.chang@mediatek.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, fan.chen@mediatek.com, louis.yu@mediatek.com,
 roger.lu@mediatek.com, Allen-yy.Lin@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, hsinyi@google.com,
 Jia-Wei Chang <jia-wei.chang@mediatek.corp-partner.google.com>
References: <20220307122513.11822-1-jia-wei.chang@mediatek.com>
 <20220307122513.11822-4-jia-wei.chang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220307122513.11822-4-jia-wei.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_135236_997465_4E10C83A 
X-CRM114-Status: GOOD (  12.28  )
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

On 07/03/2022 13:25, Tim Chang wrote:
> add specific platform data to support mt8186.
> 

You just added this driver in patch 2. No need to split such actions
because this is initial submission, so it can support two devices.
Squash with previous.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
