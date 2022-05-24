Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32C8C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 May 2022 20:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y4w1r72WdlISq0krtfhU2z0/GZjE321XshHHnypdY5I=; b=vthA+QUA56fclE
	KYcpyjkKK6dHpKUXonwLushfomvE6Y5j44Q42Ps67pJva39z0dz9y5M/hF/2B1wLWcvV2ovv5ct0m
	eAZvoU3FZ9Um00MtKfBmfhVuFGw94CPSJNNy22EIZU1BOxAG25Q+LVFXtdQNkP3Ty4qNW0tD8IbQb
	yI4WSOzXJiTW5qgcnmqWx4fbx6ti2JDEnf12L+KBpMPAxU+CRwl4B8yxeOuWuXbUtcf0YFEgRR3Gf
	5uuQKJCJPqZ13RPMEJFYcNmQEb1f9//cjUdjQTS/QIDVm9Wnc0UlJGbPldAcqjCT/ND6qKY1Z2yu9
	fSMQzvkCmDyQojwi4OHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntav4-00968H-TD; Tue, 24 May 2022 20:14:18 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntauu-00966y-SP
 for linux-mediatek@lists.infradead.org; Tue, 24 May 2022 20:14:10 +0000
Received: by mail-ed1-x52c.google.com with SMTP id fd25so24472676edb.3
 for <linux-mediatek@lists.infradead.org>; Tue, 24 May 2022 13:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Fm1tpFca2YWIuBpxTTGZclIqJvsNWlMgZzoZ+c6L03Y=;
 b=b2xojrV+9PHgmFBI5/KZgSAhUS6qJGPSbk0j023/DmgkixIJ82kiPaixoGsAceFnPU
 tmLhJG5uFbhpEQFyCoCqxi+ONAQtwawp3km4d+FSGp0XNsH2t3JltLDqkxzgxegOCVSQ
 HAIMqwagKJMLCuEMJTTrTyYdY1duBRichZylDdPbAl/4zor/WB1YEAidS22+JxNs28tU
 BryV29mbgMbFif0NNdDe6R5mLgsY0HBdGdeKreX4/f10bQyKlN6qAjTVFJxKWRY/UJMk
 7W519LPilUuaMQknyi4G0+O8RKAkVzph87M90NU7bmPhtwra+wGAubTv+ezsSoOaf4MR
 OY+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Fm1tpFca2YWIuBpxTTGZclIqJvsNWlMgZzoZ+c6L03Y=;
 b=TffN0Flgtc8RYlSRkBCAbJjebiAEwf/L0EEDM6pJVZos7evEC478Hp/CJdutbQO6Mj
 JTIMqAbAA2BufppbJjK/a1lkl1xQhPn/BF+MX/U441cH+BeN53EvQR1Hc6Rse/eI9seD
 r3gsliprBiVUEagMBvysNPVx3Trqg9YKNbxsBwsGJ6uFeMrC0rdiDNiarF8mMpxdXX7w
 XS9XNY9svyj+SUTm45HQJfBaH8WhZghSiFPwBsd88RJp+B8Ik7Tk1M7/WFpTuAd9WdY4
 N0F78TFdFzh+/RQTBtXLsgWrhZjlU16QOq2QLyt+FDVBXS/PteYX3SMAwERNUbxkZMU6
 KFEA==
X-Gm-Message-State: AOAM5317FDA9ADdPnQ7WIRF5+qe/UTYImqvZrvRtzznzvjS9k2dkIQOG
 JScJ02iEJW1KE1I3FryLmkGz1w==
X-Google-Smtp-Source: ABdhPJxYconPOKdPTtXM3P9lkUnV1bFUE4Pa1l2up9yo4tsa/rU7pkuKObtyf6INae21cJZAZHhOKA==
X-Received: by 2002:a05:6402:388d:b0:42a:ba9f:f85c with SMTP id
 fd13-20020a056402388d00b0042aba9ff85cmr31318770edb.292.1653423245180; 
 Tue, 24 May 2022 13:14:05 -0700 (PDT)
Received: from [192.168.0.177] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 16-20020a17090601d000b006f3ef214db3sm7555530ejj.25.2022.05.24.13.14.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 13:14:03 -0700 (PDT)
Message-ID: <b70a58ef-af3a-f4d9-37fe-688c600523a2@linaro.org>
Date: Tue, 24 May 2022 22:14:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3] dt-bindings: serial: mtk-uart: Convert txt to
 json-schema
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 gregkh@linuxfoundation.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220524115019.97246-1-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220524115019.97246-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_131408_942176_8F7339B2 
X-CRM114-Status: UNSURE (   7.19  )
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

On 24/05/2022 13:50, AngeloGioacchino Del Regno wrote:
> Convert the mtk-uart documentation from freeform text to a json-schema.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
