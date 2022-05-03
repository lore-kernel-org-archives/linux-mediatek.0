Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCCBC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 12:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5oZF2+Fgp3Og4YMohExJHPPcoydXY6hREeVtQLCDE9M=; b=CHRtzlUW+Vlxtw
	hXgrF9Vkq7O5Tmn/Nq1Ep35ObyXAAe0lK7noFcYV5eTXrqHwhKhoG11ib4B+8Id+jMNVXJu4ZEOHC
	nj/QMNFCh8Md82OZgnqaxKvOcistlQh+X7brv26RncE4BfOq/eDSC1tcYQ9D0Lu7wPJ87R/vVx4Cm
	NIQm7W6rczhqK2ZmDyAjd/PewMrQNzqWNHw1vZk9G+L/37W3wS1pzD6NJRRudA8tZGFqUDeDVdoGs
	ik1qtOWIgvfaW+n4qjlo1lO2TeqOP74pC8sDw6Rdm56IeIcX7QGkxZnagGftFLpZk3u0EB76+nIrq
	P4PCSHiAvME9ypLqYLbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlrce-005mDw-Ct; Tue, 03 May 2022 12:27:20 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlrcR-005m5i-4G
 for linux-mediatek@lists.infradead.org; Tue, 03 May 2022 12:27:08 +0000
Received: by mail-ej1-x62c.google.com with SMTP id g6so33156706ejw.1
 for <linux-mediatek@lists.infradead.org>; Tue, 03 May 2022 05:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3v4789HnPrfyXLlbi4TVrwsRga5l4AtBHsLanAodRHg=;
 b=tOyrcEqYRqwaatbWkdvtYKd4xy6bH1Z+GOzXIo+D5G+HJjDP+TfVdYblY3sEMayIy7
 xLZEGk7z2ekyGYFLKjX42MH2El3J73RzKd7iPBYfjrJcsRlkJImmwNwMqaXk4E3Fsj1L
 8XfvZeoQ65NL1Ju6JOlIxX2P2fF9BoG4iIo4sH1JSUzBAIUYjBXEGmzazDNhFXZu0fXr
 7+XNSdPIdkzyiklnKlm47RWsIJIyvSywc8+ojhDYRJY6ZuYOp36gbejaqYlAHRClXGgf
 4tLefzK5LxSerPrMwRN3PHqfwyymPdkVZdBJMDiLQ/hdabTPGF81c2gWHvYjapxlcbzg
 2iJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3v4789HnPrfyXLlbi4TVrwsRga5l4AtBHsLanAodRHg=;
 b=jNVMqnOZ+GCMy0mE+6raE7g0PJOaP1aCMvH5tlj2jbZ1TKZuEpd85etMq8YxuaGEst
 ZdOevnSEJuFas0fBDhYrYE01rWfys76q0QNVytAXub4HfbfpeW+6LevYGKZbcH/jRiaC
 xizy006xjERz7Onv5TOqFtsmyxzFY2N+OrVN207RFWWOpE+jEgzYMka8dpaEc0nQP0xg
 a/7EjceRE0x0AOwCbbFeM3rINo+fLmedpbyFIFwn2hD/Hqo1VqFB9Y+mtXg6mXr+Lbfz
 RbhPYce+IBSjt5qf2I7B3/awBH0FCdyYt6tu34F45aL3t+FDjVOL5+4WzYAWaW943ZpK
 DkWw==
X-Gm-Message-State: AOAM530XsET5YSBSpjTZ0F6r5i1UabK+A/zAtvHpLDa2lnDDwBnKxllI
 0XKSsK5SC8Og6XRYr7ZY6mMFSQ==
X-Google-Smtp-Source: ABdhPJz1R4QiNsUY3ftHoYu9rTkjTJu3dFEsS0UonNJRNjbK/2iYu1E8Jz/5btp8OLo7mKGT9jFoNg==
X-Received: by 2002:a17:907:9705:b0:6f0:2b25:784e with SMTP id
 jg5-20020a170907970500b006f02b25784emr15455246ejc.76.1651580823976; 
 Tue, 03 May 2022 05:27:03 -0700 (PDT)
Received: from [192.168.0.203] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 hx8-20020a170906846800b006f3ef214dd0sm4515214ejc.54.2022.05.03.05.27.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 05:27:02 -0700 (PDT)
Message-ID: <1699e161-ca41-3a01-6cf2-11e7d5dd2152@linaro.org>
Date: Tue, 3 May 2022 14:27:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v6 13/16] dt-bindings: reset: mediatek: Add infra_ao reset
 index for MT8192/MT8195
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
 sboyd@kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com,
 chun-jie.chen@mediatek.com, wenst@chromium.org, runyang.chen@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220503093856.22250-1-rex-bc.chen@mediatek.com>
 <20220503093856.22250-14-rex-bc.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220503093856.22250-14-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_052707_181992_6430C434 
X-CRM114-Status: UNSURE (   7.63  )
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

On 03/05/2022 11:38, Rex-BC Chen wrote:
> To support reset of infra_ao, add the index of infra_ao reset of
> thermal/svs/pcei for MT8192 and thermal/svs for MT8195.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
