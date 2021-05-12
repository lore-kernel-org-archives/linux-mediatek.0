Return-Path: <SRS0=1nN3=KH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E90C7C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 15:55:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 376B161DFF
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 15:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 376B161DFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yiMEGrbVgeGKAAc6QTjzb+vy2/44E0WJeAc3juDZtr0=; b=QJVALgXuGjqFMvhB5jTKbBoOG
	qhV+3ikBTLtBpeD4P90v+gzXpXR1YoC6xcR0QDq+y3A1x0qsIbVPljxg7uEg0D6r0CDq7IKbd1Cqg
	1lCBNcgb7ku0nAkySld2EFJylfwhIcodShMFFbfR2IM7LT4AwULVbBeU6vLSFJrB5J91iGoNrs40O
	MKw5euTuSp7PVHDyXFoEpK4SrJBYFuncia24KV2Q+YT+Ed8p+ftAcDypmCjLACD8ONCb5wLi7OGhk
	wyaIQX6Iuj+3P9tlg3IMyQzEMkMIde8Z/oAoQX8mCk9x6Lo2jJvG3ZX6HF4Yd8/0vb57NddyOwGVS
	nqv3ljDSQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgrCs-003GaT-1P; Wed, 12 May 2021 15:55:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgrCp-003Ga7-Gm; Wed, 12 May 2021 15:55:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=VWsd8P+/clpyE0bHHUTPwD2kU5tZcJeb3jH59tmqXLI=; b=W6A96Pz4GnVCKI9a+q8vvbHgbI
 rdTCxmVOvN0Hl2J5VQHnbu+eH9k5ew9YSCchWk8l+YnQfWDo5hBkIaA3Hi6DvTfhEWYczpFB0zTa3
 r3InesCyVCIJ9dZ+IRFJp2rdjTSCPCurICp/gYZN0nhc/+Qph/1YLHllrb6Tu5BGLWCSIbJUdGktj
 HKWsSMWjAFjzBcZn2tgzO8o69+MKYE7HBgrze5jn81FlM+RHmBsdusxzeGKRWDPtpnZYLkvhj9x6l
 Zl4whhp5I0bwCw+pnl6Ubxy8/nnwDiTxy9EO11bW+oYaWcWKLq3VMuJkkPiV2wJ+4J20t4c03RrKO
 z7xL85cw==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgrCn-00AYK6-2C; Wed, 12 May 2021 15:55:26 +0000
Received: by mail-wr1-x42b.google.com with SMTP id d11so24128750wrw.8;
 Wed, 12 May 2021 08:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VWsd8P+/clpyE0bHHUTPwD2kU5tZcJeb3jH59tmqXLI=;
 b=teO0yxmgWsLewvAzd7+q2EYj2Iq/RFxCoukA2Mu0QntKo39hWLFwYV85k9ADjkyU0p
 1mZKT/d72aOAiLMnmA4875PFINxbRexIs5Id0TM7+9v1ZwS7R/2c2fZOQAixvP+QJ0Lc
 6RDqNQSEN4a5luBFi3NAS40m8uTkxKtSsoL4+P7tMsKvF0nvIX0i8f/zfQc9+MAklF1z
 2Yhp/31DNBrwxS3Zs7zb7EJXNmhuH/zffM0OKe4xAh+Zmcfn6Sdb3/6LWMc/hW9NNJUu
 6mjzDzGQMVU91s3PVvBVafF+uZKPGds1tmhmWIcYf68FyeGDwPCEYuNc0uokWW+gvxcY
 UGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VWsd8P+/clpyE0bHHUTPwD2kU5tZcJeb3jH59tmqXLI=;
 b=VC3niN197cei6PDBzT0Rqpxy+B4T4aCjGhvktCGr1nvNqHiWw2ycgirm6baCX23muT
 +j0ELfOnnX678xgQqpDFKGj5SZOMX6+oSbEmskaM50haUvVyG3eMBj7U19gNhK+4+zQE
 06O0ok2Jk/QtoNBvpFFYYp1JdbInCOD9qi4EZuF5/AYH+iH6MYPrzQvLhs4WRW9lfCuO
 SllliOsSuqW4v0ZdAxsFnrX5P6D9ubjiEqVQ816fgQoGQKwePrViA7AFqoe2LkPEYoGe
 ujMFW+lm+uOfiT7uVbboSeut/Y6pIcuiQ5HUHZp77PwQp3jkNKX1KvV+PT4DEULulYyU
 L0Cg==
X-Gm-Message-State: AOAM532pYEL3k7iNpOgj6OcjCXcnz8jhqH5jz4c+DxBM/V0kNCirrsct
 KMTJkVqHijlis2zFWLO2UVE=
X-Google-Smtp-Source: ABdhPJz1MaDA4gtjBPt57L7+5y/dDi6iluOMqHAbzWspXUgRbOub+cvoog0I72CcKc8Ep5AymBJhRQ==
X-Received: by 2002:adf:ed43:: with SMTP id u3mr46322177wro.334.1620834923250; 
 Wed, 12 May 2021 08:55:23 -0700 (PDT)
Received: from ziggy.stardust ([37.223.140.37])
 by smtp.gmail.com with ESMTPSA id a21sm6613105wmj.34.2021.05.12.08.55.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 08:55:22 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] dt-bindings: mediatek: Add optional mediatek,
 gce-events property
To: Rob Herring <robh@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Jassi Brar <jaswinder.singh@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, linux-mediatek@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
References: <20210504054612.3585017-1-hsinyi@chromium.org>
 <20210504054612.3585017-2-hsinyi@chromium.org>
 <20210506203124.GA753747@robh.at.kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <a573e490-44bd-d6a1-d0c0-075b6541f720@gmail.com>
Date: Wed, 12 May 2021 17:55:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210506203124.GA753747@robh.at.kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_085525_140733_C0F5C1B8 
X-CRM114-Status: GOOD (  13.86  )
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

Hi Jassi,

On 06/05/2021 22:31, Rob Herring wrote:
> On Tue, 04 May 2021 13:46:12 +0800, Hsin-Yi Wang wrote:
>> This property is used by gce clients.
>>
>> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>> ---
>> v2->v3: move definition to Documentation/devicetree/bindings/mailbox/mtk-gce.txt
>> ---
>>  .../devicetree/bindings/mailbox/mtk-gce.txt       | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
> 
> Acked-by: Rob Herring <robh@kernel.org>
> 

Will you take this through your branch, or do you prefer me taking it through mine?

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
