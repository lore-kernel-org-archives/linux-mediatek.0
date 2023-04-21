Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D5DC7618E
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 16:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B3xXYf8TTlU2/1ojoFhSjIL55VCuhyAcA1eyWc0djEo=; b=Gkk8WriXhck012InUs3oe+th8S
	8aHiyNziMbW8Qo8VQlPVUO1WPX/N3tHF+kqFwalZoSlbMyrq38zjnaRG6aYjvRn+zKgqbGJ9/HrEl
	S5y2JOrgR180zyKhW4qHq7zFunLOlweoHHnXrcPjC5Sjv2BZfYNgGOaL7DMkwtmOe0qKuSD7FfkI3
	uaZGESO1PAvVUsrCQJ78oKwB/0l/Ob4t/hd+R5ryDKKK2HMMKDvnQ37y/MIZJlygbeJIYhuVmEC+g
	+QF1/qrWXB4iWbmpfbmSAF++55CfmpUDDwE9ezQBvDbbcO1EQOA0M6Vh4PvpSTkiw8P/kAEmE5Ljr
	an6ecKIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pptju-00BOjl-0Q;
	Fri, 21 Apr 2023 16:36:02 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pptjq-00BOiM-34
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Apr 2023 16:36:00 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-506bfe81303so3113512a12.1
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Apr 2023 09:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682094957; x=1684686957;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B3xXYf8TTlU2/1ojoFhSjIL55VCuhyAcA1eyWc0djEo=;
        b=Sor67hOA1/JULAkvGJjP+cDue/xFOhnaoY7aiqCjAPBgbRT1GNh0cKKYbMhF5M4XyE
         LfSrbGuEhHHdBgzvuMdEMLvFuTyeDjT0YFf6JbkqnsN4a9oFjSnvOwvJwicU9Z0X+OJ1
         vwC4Fq0U1F+0T/okj1wlboZFVddCtNyk4Ch7LsgXx36Ap7ACQYN3jPQUBpE6z6GtFNiw
         u0JyXneZmaMcs5JROQiZw5EPfUMWgdTSJrfsv1k4hbBSSyJoZbqDQSwcy4K2yOC+K7MD
         k/ULY3OkHyXcE8d/64BAXNAA7dG6yTf5tvv5qeQnDE5lTHpPPHRWRwwnIvqzAGQle1gG
         K+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682094957; x=1684686957;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B3xXYf8TTlU2/1ojoFhSjIL55VCuhyAcA1eyWc0djEo=;
        b=dbY50xL/yVSaixesEKmOmuManHAzKeSuoFa7COMJoQ+gFSCKsK6BjKbaR7+NR26OMj
         iFhgDwDgD3FjqPnVVp3o6Scp3Nux5TxdvwgZh2LE7kevIBzQglBMjrpOXLWH/Yrxgl0T
         1H8AV7ZakOHx8vbmNQL3nP2aX8xRRn6rS1xNG0397Ep5FHqboErxZZKNrl6JWCvQVTyw
         xpjK9kV249poo+tUGokS2FLb363p2Gp0SxmGyv+2Apr5tLnZTPfhCQ1wKEWFqFiAqmWX
         urbVD9bvx5TQDnG+Jo7Y6415POTZfR8FL4Xt0a8M38jUcnHiQ0GW5RINZpOBDpBcKf4p
         7o1g==
X-Gm-Message-State: AAQBX9dN8IID+jI4niUjDk0/z8aVqeQNYF4XNvSQUKxM2FNDyrkeSqPG
	fZuQeTA9CSVDpl341R6hDiXxxA==
X-Google-Smtp-Source: AKy350boQF7CjGbGArouyeaz2RM7OfQUMW7bsH6kjiwVj9BdnlvnjW2wn3qWocJsMuzqFUF8Kjdsqg==
X-Received: by 2002:aa7:da41:0:b0:506:8660:77a3 with SMTP id w1-20020aa7da41000000b00506866077a3mr5948346eds.37.1682094956706;
        Fri, 21 Apr 2023 09:35:56 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:687d:8c5:41cb:9883? ([2a02:810d:15c0:828:687d:8c5:41cb:9883])
        by smtp.gmail.com with ESMTPSA id w22-20020aa7d296000000b004fa99a22c3bsm1957151edq.61.2023.04.21.09.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 09:35:56 -0700 (PDT)
Message-ID: <bc454390-3658-f16b-aa48-58bdeef52d22@linaro.org>
Date: Fri, 21 Apr 2023 18:35:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/2] dt-bindings: net: mediatek: add WED RX binding for
 MT7981 eth driver
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <cover.1681994362.git.daniel@makrotopia.org>
 <b355493ed3d56396af91492b86f77f613485272a.1681994362.git.daniel@makrotopia.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b355493ed3d56396af91492b86f77f613485272a.1681994362.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_093558_984916_6136FF4B 
X-CRM114-Status: UNSURE (   8.55  )
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

On 20/04/2023 18:04, Daniel Golle wrote:
> Add compatible string for mediatek,mt7981-wed as MT7981 also supports
> RX WED just like MT7986, but needs a different firmware file.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


