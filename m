Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E7AECE579
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 12:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jFdSn29D2vbF5C5b2ylmb59wYWeic4q4prRLAv5rTI4=; b=OgfKEiL1GzVntGp2RB171gNFd/
	Wkpl7KvnQWsnOxmfg8qLNjevWtRVp/jbFTYTuju9v6ARBcnogQbSmuZgvIOiN9V3y2GRZJSlk81sC
	Qaimuyz3TLDB4RR1sMArjmgt6vLC0J/3JAaPZHT4Z0nEoJrt+9kVmbIqmTU9/O070/SJZGBzrfFLE
	uf1eGuP5WeGSBhevyPAGzZzVVjJnBNmhS2TgSx+HvBKJuoJz8iBqq53O/TtBXxBsnmgwFpHJeHvGx
	TLmjPg1p4CWVQE8E4/S9CEUbYaxO4cRp8Qm1p9HydXZIOayA6/AXbrvTMcsEkPbaXFwEoVtZe9359
	bmPt1q5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sndpT-00000001vTM-08xg;
	Mon, 09 Sep 2024 12:49:15 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sndnc-00000001uJM-1Gxp
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 12:47:24 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-42ca4e0299eso20229495e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 05:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725886037; x=1726490837; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jFdSn29D2vbF5C5b2ylmb59wYWeic4q4prRLAv5rTI4=;
        b=HOkQ2BNVSlYnwiGfUD7uRKjdMK2a3vUqkeRr7ZyXahr89Bns0FDlpk50JCxBo1EAWb
         c2tp6l2EAWbe6WqI9KUMFda1ZpPZ+72cQA9GuSyeTZflGJE8GNA0ysxnWr6oQSQEsJcR
         iRYnZ2faF/kGHOaw3AtcW59G7m39xffUQcNfvKbz+oN/2q7R2fs28IrNgb2CNUjp4yM9
         8FGLKz3nD6/vUCGEgnp5v5wNo+nHJLQl9x5YlrIf2pALhahbuBZ85O53C6tBnEqyIUy8
         UaRHhNNzwiHegoomYYODdTvegbHhTYyqSw0mwk4PCvTHLdyDCHwRJxakhhs2nzQSEjNb
         vy/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725886037; x=1726490837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jFdSn29D2vbF5C5b2ylmb59wYWeic4q4prRLAv5rTI4=;
        b=DTUcyIyLJrfUfP80IaBy0PLglJsl9nEdWZOZ+djmLK8KNUFaPpU0qpTYTIYvsppSSY
         H+mRqEW1ucIWZQYGw9ZD5PgGcn0U2vXiPG0Cxgd9fBY4MBGEYjGM+cgRafGdmX0aP2Nz
         UIyML55wM9W3USRungdy3QL3Ch7C9gnVcv5rpl5LjlLnHSO9Huxp9YCjVCeuynST7jo5
         RJ+oVM4CYzmBy5ki3PScWigJD6/7Wv2w3j+zMoqj1pHlGcWGLoaAG8LWEtXIBpE4sZ7k
         5f2iGQTAUDKFme8weQDbYjiW6Dk0D9UUZc8L44G7sdHQBQ6FucG465WpE1GgEvYnQ1Xi
         hkLA==
X-Forwarded-Encrypted: i=1; AJvYcCX4eyZ9W3H9xX9N0nbN/ZGfngLYa7ErU/kjvhaqFieAkGwVbzlrW02q8LoelIXV2omhZS+nPYd5JTw/tYszEg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNs+vM8q+76K57G9grw27rCmNhFqVLdu/huw1BUZa0kybSoiVz
	sIB576fgsrNl9W6vR5io6ClUcn9AC17sbeUk1mWWF49zs9tnylltZSX6A85YJUo=
X-Google-Smtp-Source: AGHT+IGNVpmNYEMCrZnUHl6rM1WqQqMqFiNR+myLEWeiswQRFxR8AFfvou1NnDq7soxmYBAG5Uzmug==
X-Received: by 2002:adf:e64a:0:b0:374:c1de:7e5e with SMTP id ffacd0b85a97d-37892727dc7mr3791168f8f.54.1725886037310;
        Mon, 09 Sep 2024 05:47:17 -0700 (PDT)
Received: from [192.168.0.172] (88-127-185-239.subs.proxad.net. [88.127.185.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cb226ef2fsm58370845e9.13.2024.09.09.05.47.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 05:47:17 -0700 (PDT)
Message-ID: <b2b8b181-1bbd-4925-9d6c-40c4b9e29743@baylibre.com>
Date: Mon, 9 Sep 2024 14:47:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] ASoC: mt8365: Fix -Werror builds
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240907-asoc-fix-mt8365-build-v1-0-7ad0bac20161@kernel.org>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240907-asoc-fix-mt8365-build-v1-0-7ad0bac20161@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_054720_620563_A09AED3C 
X-CRM114-Status: UNSURE (   5.91  )
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

I'm embarrassed, my apologies for this oversight...
Thank you for the fixes.

-- 
Regards,
Alexandre

