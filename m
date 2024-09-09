Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464CCECE579
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 13:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=763rg3ZUl+6DZJOJy5DwsZvQOJ60xrN183DDZfMyDrU=; b=gnVV8r5BBmKOwf3o5t0NmKH5M1
	KkJ8agBeaD44ypR0odGT6gHMAYMbfGdSCEABFRMVA3UTivuVRkEYyRTv9VcVeF19o6ucp1FS3dSUo
	bs3yJog0ayU71q7N16zDQval+G+BtnSyn4d3lOOuehnYq1Nuy/tx6wEilemA2cpCbce4jH4JGHSLs
	ZM1Lib/fDTw7TbuTIdHHjWsw/Ua5yDvIsR2uJ8mkCSXFxoCNKCkt6jCp+C8sXY5LkfZeUjkbt20Ph
	/m2506q3ugbJzBThP+HeXbWoRKNw9SC9N6yO05JKIzlqbosOWokEZmazSOdOzcszbSjZ5Uz12YkZn
	h/4a7aYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sne0N-00000001yKr-47GJ;
	Mon, 09 Sep 2024 13:00:31 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sndt6-00000001wZE-1MUB
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 12:53:01 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-42bbdf7f860so39271315e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 05:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725886379; x=1726491179; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=763rg3ZUl+6DZJOJy5DwsZvQOJ60xrN183DDZfMyDrU=;
        b=rZoOhnutAr1/LP0swmZGb0GVRZF2T+D1Spz4crOyfVLHKYadCHCe13b5domqVTsLlc
         nxg36e1hKTAOt1LGnpsKIq2+MSajPZSsEykkr1ECvlUWmFihejTQMJbDqW9tUN7XTkdi
         5AxMVmOjpsHl/fdfigVL4oGoUyOXMbVMJ1WqTBI+oNsUveseOaV3waGR9xcgVBhts06a
         P3A//Tjue6BUQHaoOdJUskTViieXbkMSnwrZszlhNYX3H8/v3AuYApPfKoZE43D8y848
         4loABQZBFEs208pGTz757L+Mbx+gA7QnR215ebsW6aowndmC589nHKROZCyha8xb6uZt
         fwjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725886379; x=1726491179;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=763rg3ZUl+6DZJOJy5DwsZvQOJ60xrN183DDZfMyDrU=;
        b=d2gy56AdFm/HPaRKLD2RdOF4e7kv6xyn/6ChxHgxL7WxEg37xIZwSrx8qu+JgcDt/4
         Dcsu8ZeKGhIr+3NgWNgvzyOPQAX5q6oRl5gNCYL5Y/17kzChG0xRg92YT0NuFKRXoGrG
         xymJpCl8Ro0DdHppPTbctLZfba+SnhafklWa6ZHdGq6yWNqKSYkWtTqI7S+c4cY1XjoY
         Srlw8kLFlcooWau2/Yhyp9blbvR2TfHnPqh8KV6VSlCXMJdsvIhLch+IzJcizGhE8pId
         Ak9LBomC0FOqc6nrAoL5oD+K89ViAd+wcclRX+EjQ1XKsx5ClKNm3QbALk+oQcMGBLLp
         JgaA==
X-Forwarded-Encrypted: i=1; AJvYcCXPjJjoLDLa8r8OFGaERNWS6Ip2pb2wDdONs7Jc9ZvuQ0gBEHcd7gNh4Qo3v40BdxaI0tpwm+6xkjFopvTuiA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2JoaiNOvJLTud8AaECbp6jnhyZLb7gfnSK73/XFe258b46OOc
	L6jhtDUyyoOsRrUZdUuF5waVfr9G4oCNVLtRtVULjfSMAM8gYOQsdBvSEC5CBRc=
X-Google-Smtp-Source: AGHT+IHpDUAYZ6M9I2utE7B65i3OcZBvlzvw4You9gctJaalUrdtM/PYSMSxk8LHlM5pPU+PhOzRpw==
X-Received: by 2002:a05:600c:1ca6:b0:42b:a7c7:5667 with SMTP id 5b1f17b1804b1-42cae76cf3bmr53395615e9.25.1725886378512;
        Mon, 09 Sep 2024 05:52:58 -0700 (PDT)
Received: from [192.168.0.172] (88-127-185-239.subs.proxad.net. [88.127.185.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956e8700sm5957292f8f.116.2024.09.09.05.52.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 05:52:58 -0700 (PDT)
Message-ID: <e461d366-ddeb-4d87-813d-9d8cb7e30238@baylibre.com>
Date: Mon, 9 Sep 2024 14:52:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] ASoC: mt8365: Remove unused variables
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240907-asoc-fix-mt8365-build-v1-0-7ad0bac20161@kernel.org>
 <20240907-asoc-fix-mt8365-build-v1-5-7ad0bac20161@kernel.org>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240907-asoc-fix-mt8365-build-v1-5-7ad0bac20161@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_055300_421159_78AA0D7B 
X-CRM114-Status: UNSURE (   5.44  )
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

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 07/09/2024 02:53, Mark Brown wrote:
> Silence compiler warnings by removing unused variables.

-- 
Regards,
Alexandre

