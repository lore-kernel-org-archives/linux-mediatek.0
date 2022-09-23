Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6149C04A95
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 18:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oCR6Bo3A4ofjsJSPRwu8W/6xTMTPUToxbtx6duza/9I=; b=kq2FiZXSAjAh8qTYVqYhAQGvAl
	GTDVRYjxparn3n3zRxR8CmdAAruJiBbgLwXe//27gdNTKF+2GeJ08vsHc8qdta+mlCf0ZDXPgkyKO
	Lkdsw7rak3BQ7ZDmfwXZhblfZ9egQn+U2FGi1kw0RSUioos7DMBNJKqnK052iJKa+Pme8hzvZbNHD
	IghwNzfxI4zrnaeVB6plWxWLC07X4hnOqXrMwgNAla0EnLK+NfssZG2sDoaGUxM1Ujsng5zPUL6fa
	Ep99w2PxbFA0xKPijxi6ZAq5hETMFJrVQjADTUyBwxLK1kvkQZs7wl/CRPgjawS5hq96WVVv9zaBY
	ds42kuQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnDp-005Jdv-Df; Fri, 23 Sep 2022 18:16:21 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnDX-005JW6-52
	for linux-mediatek@lists.infradead.org; Fri, 23 Sep 2022 18:16:05 +0000
Received: by mail-lf1-x134.google.com with SMTP id z25so1552113lfr.2
        for <linux-mediatek@lists.infradead.org>; Fri, 23 Sep 2022 11:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=oCR6Bo3A4ofjsJSPRwu8W/6xTMTPUToxbtx6duza/9I=;
        b=QTFH6A6ALvOnrxdBlLXWwrPn4QlREymvd6XMlcentLZ7h/3fide79fdoCHB5KTem71
         yp6pWhrM2z41mtYT5qLU1Bh2iz6CQHypAeyWgu+d26gmF+IBSGIswW9vQE8qWgJ374M4
         J/sKG8vfLGHmHmWMmL0qpwPd+e/Bj/iWmYCd/15aKADo++tGMLkwakMCAyWOepF0i+ri
         dgeTUxMR2PMwWHVfXToHcEn+O+6EOAZsDDngC6NZ/U5fhtxvtdPZuOdXrK0VhBLVtBA2
         3FBSeqMz0DB1naWCCiR7W8HX0k883wfgPGcd/oly/dmRrF0ooaifWb7Sstlh8ULCJj1C
         B7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=oCR6Bo3A4ofjsJSPRwu8W/6xTMTPUToxbtx6duza/9I=;
        b=0WnmtYkOQEl2+IruKXf06M1HX0wH3aQ9U6R/qewSXeYURLbSDYhzLMllbIBxvHMOP0
         RACCMgoRKiKQe6jxkddB6Blb7B7X7w11ALqzy2ahVY5Oh8szvVEoJtx0VP4z9Y52xzZI
         sCwSGCaORjSqCLj8mu0zoLtlaAKdQi9nS0cRxBGRFb7Qm6GIxdXXVyq1+enTh1GWCQ2c
         9CFSmVoOzMDICVwyw311gvgqSSLCkvtuOWQKZ5HsCbAL9VjXiwqQG+oCkkzNbH4qQ7nR
         d5dhEwXrE/osB5mcOFhzk8cV1K8rgOKiiIG4/ceduEVT0TCuA1k1T+ImSQjlVDF2Y/RJ
         P5zA==
X-Gm-Message-State: ACrzQf0pzbvE7whX4niZWvn+0pqq+s7uN7nq4bPKc8HTiPD6BzRyOYoc
	nVy/8/G2Z5HWfd2uEc/mkom/Jw==
X-Google-Smtp-Source: AMsMyM5VPQHR6EgWnlQIIyiIzzfK4PFaph4377Xhq50FxdoZgzoCfLawcTAmFyxngXUm5xjobVChzg==
X-Received: by 2002:a05:6512:3295:b0:497:a156:795a with SMTP id p21-20020a056512329500b00497a156795amr3537914lfe.345.1663956960760;
        Fri, 23 Sep 2022 11:16:00 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id j5-20020a2e6e05000000b0026c59d3f557sm1487798ljc.33.2022.09.23.11.15.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 11:16:00 -0700 (PDT)
Message-ID: <4f205f0d-420d-8f51-ad26-0c2475c0decd@linaro.org>
Date: Fri, 23 Sep 2022 20:15:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v5 4/4] net: stmmac: Update the name of property 'clk_csr'
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jianguo Zhang <jianguo.zhang@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Biao Huang <biao.huang@mediatek.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220923052828.16581-1-jianguo.zhang@mediatek.com>
 <20220923052828.16581-5-jianguo.zhang@mediatek.com>
 <e0fa3ddf-575d-9e25-73d8-e0858782b73f@collabora.com>
 <ac24dc0f-0038-5068-3ce6-bbace55c7027@linaro.org>
In-Reply-To: <ac24dc0f-0038-5068-3ce6-bbace55c7027@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_111603_198678_82042ACB 
X-CRM114-Status: GOOD (  11.43  )
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

On 23/09/2022 20:14, Krzysztof Kozlowski wrote:
>> This is going to break MT2712e on old devicetrees.
>>
>> The right way of doing that is to check the return value of of_property_read_u32()
>> for "snps,clk-csr": if the property is not found, fall back to the old "clk_csr".
> 
> I must admit - I don't care. That's the effect when submitter bypasses
> DT bindings review (81311c03ab4d ("net: ethernet: stmmac: add management
> of clk_csr property")).
> 
> If anyone wants ABI, please document the properties.
> 
> If out-of-tree users complain, please upstream your DTS or do not use
> undocumented features...
> 

OTOH, as Angelo pointed out, handling old and new properties is quite
easy to achieve, so... :)

Best regards,
Krzysztof


