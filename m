Return-Path: <SRS0=osr7=J7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A501C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 May 2021 14:07:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4595F61177
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 May 2021 14:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4595F61177
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rcwZECnSwjRdtiTLTYYuvPzRS4atRlWR+TzICJlqCQ0=; b=leJ9Z+s528z1umHGIjguSriwm
	MfbS0SG0/N3cUZRE3ghaKnQE7EQqIKKEon/vaPp1mC2HZyOfeY563myEiM9MWvjptxb/lQsibipnL
	6HfR+RJ34CMbFcHZ3h8feTFCfJ5NQsc3CjY98qYZGgEPNk6NlzdpUgICBzMkr36JTRnpaQHt1mKNy
	Evjv3jGgtHguwtYpHQ6A5kgf5TkOxVXuAYTfLaIqyS7j1eoMlWPOyEuy905tUuyEF36CPzkyVgUw3
	cH7K+Ia5jL6k8Feo1x1qhUFhwa6dRIh83eJuIvqVfuGrxzHS8BEvbdD7bYOAaS/CPtapyQqNB0ovo
	17c9lDFCg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldvhW-00GKkL-Ey; Tue, 04 May 2021 14:07:02 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldvhU-00GKjo-Jk
 for linux-mediatek@desiato.infradead.org; Tue, 04 May 2021 14:07:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=DWRKnXNV3uSJXPmlESo2Co1jPOLNUzmS9oTXfFMPzXM=; b=vPraTiZy54pk1Emn3Ec85WSnBL
 54u2CJ71BZdUAT4JQnWOFV8w5fM7108O33U3CGIDGAw5R6Q7zFA/I/JN1smsbfcCAVTJdhESCrg04
 pUkuQ+EOc4Empx/GbRdkjKfDTD90VnF4WolqOGvroWHdhl3bGpW7eEqLYR8ae/TwwH2lSk/GHuSW/
 abAgtgd8YD6ZXVWRkLor/SwPwypRJbvIJcpxCw0PQoJxx2eNK7r/Be4poPuoqqayiUGwRfnFZh7qA
 YlQDG19iLs39Nieqs5kS2zAkuy7kagPyk5CMTwTnd41c1Stpoco9xBU0j5e/CV6TRa1Iv+/2/6Jic
 g8iANIvg==;
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldvhR-0041cT-UN
 for linux-mediatek@lists.infradead.org; Tue, 04 May 2021 14:06:59 +0000
Received: from mail-qt1-f200.google.com ([209.85.160.200])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1ldvhQ-0002oD-Fb
 for linux-mediatek@lists.infradead.org; Tue, 04 May 2021 14:06:56 +0000
Received: by mail-qt1-f200.google.com with SMTP id
 r20-20020ac85c940000b02901bac34fa2eeso3594806qta.11
 for <linux-mediatek@lists.infradead.org>; Tue, 04 May 2021 07:06:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DWRKnXNV3uSJXPmlESo2Co1jPOLNUzmS9oTXfFMPzXM=;
 b=m8j1OtYx8DHlcsbBFapsLrl07Tj9zYvpOmSbJsjPJ5L6qB5Cz7ZPTiMsm75cc5OdWu
 uc5DRhyfmaRVMQi/GqV/+Bl2wDbD9KVvcRpR1wtmICw94e2Q13V1qBiV30Scpe0uGmMW
 +ln2C4EXQdxkR0mGBCk/D+DVrH9luOh5OvmKfsFb9lJGp+bI19Zph+SXSbsnmxzSx6Eb
 AWCSK1e9In8Jw40jaJZwAKdTPQ4yR8Fr5aa9yojDJudn/S6z+rbbEzfy037uL5hdANFb
 tk156G2NVhlTrHc/TecH4Vck77goE7FCqQyjkElvFAOX05Qv37KTalH7j/ok7FHCNxbe
 u8yA==
X-Gm-Message-State: AOAM530TS5IahdMv+PNNJOBEC0BaP3xhy1EJXo+N8Qo6tNeQX2FX7sA7
 TZY3+FTSjmULRZb7nQOZawzt2rSXUvAQtVsWKwjprUUTC1Nwfvp7uVIz6SUZkAvM7xv4bMC4S57
 YZv0DDoM7ltUQjiW5qc6CJ+06RM6Yq5rgvYTBgm/yNyV41vJiJA==
X-Received: by 2002:ac8:6909:: with SMTP id e9mr7938520qtr.338.1620137215670; 
 Tue, 04 May 2021 07:06:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBl2lpQtJv39myBZ40HvWie+tqvi5BvCcJraN3Zh9gti5+dUGNf0zUyQrCLYwdSO1IMEJgOw==
X-Received: by 2002:ac8:6909:: with SMTP id e9mr7938507qtr.338.1620137215510; 
 Tue, 04 May 2021 07:06:55 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.49.3])
 by smtp.gmail.com with ESMTPSA id u18sm10988533qku.39.2021.05.04.07.06.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 May 2021 07:06:54 -0700 (PDT)
Subject: Re: [PATCH v2 4/4] arm64: defconfig: Enable MediaTek DRAMC common
 driver
To: Po-Kai Chi <pk.chi@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 CC Hwang <cc.hwang@mediatek.com>
References: <1618565538-6972-1-git-send-email-pk.chi@mediatek.com>
 <1618565538-6972-5-git-send-email-pk.chi@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <73ba4443-c0b7-e6e1-0faa-a41d2f552146@canonical.com>
Date: Tue, 4 May 2021 10:06:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1618565538-6972-5-git-send-email-pk.chi@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_070658_145814_1F68D121 
X-CRM114-Status: UNSURE (   9.03  )
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

On 16/04/2021 05:32, Po-Kai Chi wrote:
> This commit enables MediaTek DRAMC common driver to be built
> as a module by default for the ARM64 builds.

Don't write "This commit".
https://elixir.bootlin.com/linux/latest/source/Documentation/process/submitting-patches.rst#L89

Please read entire doc above.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
