Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E48C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Nov 2022 19:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XRA7BydosCdosjY1YO5sYEuynxlsLpkwh6SYG10sx5o=; b=LDt7w4HBseHbw+ic4MN373f7qd
	DJWDihMeHsk2pGN9yNrulJxS4y1AFYCCBmfKC0Qg7GxpCgZwQjwQ9HJdQ437PXDvpL3oWPo5M3pZZ
	23twYsFJo4XXtJbfW/bJWn/ofUyxK4AkbHqmV1Kb5plMCfwUc0REWvFaQgqNlsUTXIqXCLTzaqBOD
	KoArqA2yzvnMdU43rqxjQQff2kknC5cdKbGb2Z3dfXFJk/dLaNCOHmBSumThljZTVvjD18Leu8mCN
	tPKxL4Jzg3HekICy+UlIAGgcLuOPy17iHh/V8glrow2n3IT5wQ3dDecGMHzYDURrtLWH4IRtxvKML
	IZMlx3TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osqgI-00GaMX-Ok; Wed, 09 Nov 2022 19:24:14 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osqgG-00GaLM-7D
	for linux-mediatek@lists.infradead.org; Wed, 09 Nov 2022 19:24:13 +0000
Received: by mail-wr1-x42f.google.com with SMTP id h9so27468587wrt.0
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Nov 2022 11:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XRA7BydosCdosjY1YO5sYEuynxlsLpkwh6SYG10sx5o=;
        b=OE9Dw/3uiBKy1HlagUkB3k11IsK3YuB16znKDC00qGcN4Thq8oUD76xIdMeQ6tWcz4
         c+DotAF3gSO9W751xIXQ4Nph318YrSwEBjdY4AVhR6IORpzGhqqU1RGjWKCUSlzP177E
         ioXA4g1LKb6xVnlWNlwVxQe8IfdKP4g3eortYsoJlkko62EqF8ls45MsiwL3aECV2bgq
         j2JKpXwlMgpp0co+RX4yiRdHZsLDbzPWimFm4sTg6qRsEIdVPC9kvWvn87hBV/m4KumN
         6LOOgP37Po7fHF6r6TaP0wLiPJrJufSRdQc5t+vGEjBo5XAu/q012xBMNwlMnf0BlGZy
         cLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XRA7BydosCdosjY1YO5sYEuynxlsLpkwh6SYG10sx5o=;
        b=1BnjG1Z+PdQjpwjdnOKqk7tiZx5wF3peMyBf3xS8+1y5F8hirrSY5AAlqbdOSsLpIJ
         ur1ciiM29R3c6bthrMJr6XvxSI0dM8tnimFKaCfItvnjIGCLD44clLv2h5s7kNleBigd
         qT1/8ghkCmes81tEeo0SMUx+SxJsuRRESkTAaJOLQdmjQEOwfI1JRZ7x5ORsApiTCqEN
         FiSShjaV4JdFJJGDNo+xqb12nLEd3l6/+YTRQyzP6D3dOkXCBY88aACD0tPe/h6FSJh3
         yPYEivQHX82djOqxabSO8xFzXRUF0gBa2XtTorS7WAvk6AAm0uz+3w3EUy5Qw/fWEuQ5
         Z+WQ==
X-Gm-Message-State: ANoB5pnPJHXOFpt4zDOHQOQk4LqGmmIEHR6+2Q16Z4JkJ6GcwBr65uIv
	U8yx1sWSzNvHshOySVHD0N0=
X-Google-Smtp-Source: AA0mqf5G8yBaQyvCa9MqPd7AmO+prUuzB07VMpWvCjTLuwDl1dNiCeYebL+Vfoc9dsk+87FAhw7GNA==
X-Received: by 2002:a5d:48d2:0:b0:23d:b167:4547 with SMTP id p18-20020a5d48d2000000b0023db1674547mr14894693wrs.659.1668021849003;
        Wed, 09 Nov 2022 11:24:09 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id bk28-20020a0560001d9c00b002365b759b65sm14174395wrb.86.2022.11.09.11.24.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 11:24:07 -0800 (PST)
Message-ID: <f1a5c144-1d16-a65e-f629-c9d13946377a@gmail.com>
Date: Wed, 9 Nov 2022 20:24:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v4 net-next 0/8] introduce WED RX support to MT7986 SoC
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org,
 nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, linux-mediatek@lists.infradead.org, Bo.Jiao@mediatek.com,
 sujuan.chen@mediatek.com, ryder.Lee@mediatek.com, evelyn.tsai@mediatek.com,
 devicetree@vger.kernel.org, robh+dt@kernel.org, daniel@makrotopia.org,
 krzysztof.kozlowski+dt@linaro.org, angelogioacchino.delregno@collabora.com,
 kvalo@kernel.org
References: <cover.1667687249.git.lorenzo@kernel.org>
 <Y2vBTBUw47sshA+E@localhost.localdomain> <20221109110538.431355ba@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221109110538.431355ba@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_112412_308199_6DC12B7D 
X-CRM114-Status: GOOD (  12.37  )
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



On 09/11/2022 20:05, Jakub Kicinski wrote:
> On Wed, 9 Nov 2022 16:03:40 +0100 Lorenzo Bianconi wrote:
>> I noticed today the series state is 'Awaiting Upstream'. I am wondering if
>> this series is expected to go through a different tree, e.g. wireless one
>> (adding Kalle in cc). In this particular case the series changes only
>> the mtk ethernet driver and mt76 is built since we modify a common include (but
>> there are no changes in mt76). My personal opinion is this series is suited to
>> go through net-next tree but I would be fine even if it goes through Kalle's
>> one. Any opinions?
> 
> Works either way, we'll see what Kalle says.
> Let me bring it back to Under review in the meantime.
> 
> While I have you - no acks for the bindings yet? On previous versions?

Please beware that the first patch should go through my tree. Let me know when 
things got merged and I'll take it.

Regards,
Matthias

