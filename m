Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 195DAEEB59A
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 06:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Ui5s5Cw3xC0m/jtp0PhZyzY/A5ADu0VxxFvthfKrY8=; b=yZbs2/1opC/XasAWxZ1MmL77U4
	n8kUp4Ta0mhhA/bpjJq4jGNlQBJJJJB8ufqFj/gOeXvh4r0X7WQTXuGEgfVhzqOKhaawS7KwOpJkT
	7IzU75coWK1A7uRY6E8P+m3PRqDJ3E2gVHqeZOkH1y5hmz9tyG8MrQahtHW/JAdLFdOypSyoRatJb
	dOAjeyEePY4wczKV4lpjwZaTk1L3AQYgU9nw0fj2doLwq4X88RiFUmGKFGDPYdXjU4/Bg8XhJ+F9D
	nQPQ0GRU2Jvk+qio1mkHZCiQWJdmbrxpgB4OEviqCaLy+OCqJVbmARFPxAz5paK5GY16JYM6KCW0U
	rENMuBRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgJXU-004pHw-2w;
	Wed, 13 Sep 2023 06:39:52 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgJXR-004pGC-2m
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Sep 2023 06:39:51 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-401da71b7faso75050725e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Sep 2023 23:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694587187; x=1695191987; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Ui5s5Cw3xC0m/jtp0PhZyzY/A5ADu0VxxFvthfKrY8=;
        b=B0hftlZ3kTLyN+sys+w0I1Hk50AGQ5qTi0A7dxIMJeTYAct3cwdhNQ8hAJjc7H3GCc
         PiV886wsz2ajLK8pyEgbK5ZyKkAaMgpAKuGRXR2XnQnhVhPjpfMkJvhO4AYCJt/U4AWq
         zQpD6uMGQcZcvUEWueReRJ7JK6LyZG9EHxP7YC8jyhGFF1qf4HwwOAuwPxT/E+mWqIRv
         UVk4XNvLxjQ2DRoPMTgx2cGP9mDLAzyqZxK83WoiWuDtlscBcG4IXRDuVBwGOTUARBfJ
         AQw9eTy8cuU1//fbskBFos17CfuuKlduN7grvbz4bizdN0YV/vI8QFiG+8LBwlySSXNN
         Ectw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694587187; x=1695191987;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Ui5s5Cw3xC0m/jtp0PhZyzY/A5ADu0VxxFvthfKrY8=;
        b=k67KjLo6vDttI8SIZzXODoFzLsdz0UrIPkrj4nOmjtyh6Dwfr8ic7PUzFKdA1Dbdt1
         HyO7+3ceGADL04H2lmkOtyYpMa/yBgTE1M6ZmLStOQ+x4iLgZTs0kPe3vrlZG+WR7hc6
         qrlGhG4KZDMySlvb9GpeM/NGpaRHnCzpZA/14dvSEw7a0DiaL0eZkTW1vifuabCTLAiA
         swArV8XM6ez6BB/OA0+bMPdQSFmoCHbtJoR1saKO57TOxyv2DLz9FWqEoX4aZSseck4R
         U8LnmdQ+z3Th8ZXro2SD4XbQs6ts55sxiW2Sx5dmOxW8y+qk58zfejOofJs/4Wvgg2X7
         VkUw==
X-Gm-Message-State: AOJu0YyaWW0/GbZOIPBMS4msJLo2AZS1GowCgsb14Qqo6Bn+2eVv5K2p
	8lyxJvP6vT66x7cHtDYPezQFLA==
X-Google-Smtp-Source: AGHT+IHpyTen6GH7mcHEV/WC6XNcsNT7DRMaLYEEzm02K25SO6aZuYQOgCFKRJV53h8rKbJzYw1Rxg==
X-Received: by 2002:adf:d08d:0:b0:313:f94f:3b15 with SMTP id y13-20020adfd08d000000b00313f94f3b15mr1260361wrh.2.1694587187637;
        Tue, 12 Sep 2023 23:39:47 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id n15-20020a5d598f000000b0031fba0a746bsm3589496wri.9.2023.09.12.23.39.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 23:39:46 -0700 (PDT)
Message-ID: <85a43c63-9e79-09c3-ac3e-6974547655e0@linaro.org>
Date: Wed, 13 Sep 2023 08:39:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 11/14] media: platform: mtk-mdp3: add mt8195 platform
 configuration
Content-Language: en-US
To: =?UTF-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20230912075805.11432-1-moudy.ho@mediatek.com>
 <20230912075805.11432-12-moudy.ho@mediatek.com>
 <6b7a229d-54c9-2450-4b37-9acc659cbd12@linaro.org>
 <c8f12e96e49f471f287db82cee51b3104e2bc0de.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c8f12e96e49f471f287db82cee51b3104e2bc0de.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_233949_903097_D9178CA1 
X-CRM114-Status: UNSURE (   9.49  )
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

On 13/09/2023 04:08, Moudy Ho (何宗原) wrote:

>> This does not make any sense and such mess at v5 is confusing.
>>
>> Best regards,
>> Krzysztof
>>
> 
> Hi Krzysztof,
> 
> 
> Apologize for the confusion caused by the improper separation of
> patches.
> This occurred because I misunderstood the new warning message
> "DT_SPLIT_BINDING_PATCH: DT binding docs and includes shoulde be a
> separate patch" that I received after running 'checkpatch.pl'.

Yes, separate patch. Patch.

Best regards,
Krzysztof


