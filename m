Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC6EEB64D9
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 15:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1G7HjU+lrWAwmK/lX4LNtP5CQp1m/MEkMnqgPPj4QQc=; b=fF/kNNB2g8E1USvFmMXqDwLNLe
	YI603yz1OGvqdoqUY6HTSozu7rEygtEn5R4yZ44itzcQtRdAqBa3Ky0PQF5eZ8w/qL6RzhQa4iCsO
	OyaY8m138HHK0hXdFOkr3OPyD9T+1D4MlfWwpxgAiNlOd0k5SfXnkbQ92a0qe6LJvcsNOEQmtAfPn
	eyIHh6ziLsoSBXbT/LpB0kVVYAzi8UnWQNRR+i5ajE0kGqJJs6AbmVjL6hc3aXw3L/mFnPbv9EVex
	4GbLNSSwE2SYGOyKOQzCtAj33Uzmoxya7d3bU02D8Ilc2z4+CIHRPo6HtkWwwx++lCjD0HyqURpM6
	XvAcxYJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qItDL-00C73T-1p;
	Mon, 10 Jul 2023 15:54:15 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qItDI-00C71p-1w
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Jul 2023 15:54:13 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fbab0d0b88so43939835e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Jul 2023 08:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689004451; x=1691596451;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1G7HjU+lrWAwmK/lX4LNtP5CQp1m/MEkMnqgPPj4QQc=;
        b=T185Dmwh4vQcOBaRbBLzbYJVlHn6DG0BLbbcS2oxg1BDAoT1Oa+C449mwXpsUOVnQK
         AJevQbCvGHLW3MycxGXQBrYVnXB9iehL/2OyZ+8q5CIEi0/yxll65CmOYFZguPuZVAZ1
         vAP9ZRcpHb1Kt+hdUQfwHjp0fSaURdUrmIPljVMbkSMPb2PhZCRBhBhJ4ffEiyaCO2S8
         yy4+e1RgmphvPSs97LlFIL0OgYowofBr5yN9MsatoG0MSuyZiWNmqufJKdJ4Yki10PgH
         1+qOjMLyqNZyV9d1kaNqQ5ltq5yHuLo45tSC96wpOqYo3edw8wBvsRPjdCFc/kSvNZD5
         JdUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689004451; x=1691596451;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1G7HjU+lrWAwmK/lX4LNtP5CQp1m/MEkMnqgPPj4QQc=;
        b=NOk6lllUZdA1EHyeqtYcJi/KpufV3h5e6vIr6SPAGOqo8i0GIFg7Bi0ZgzW5alX863
         7h8W9VjQO3HSnYb668kCAMYmrgwwVyGbR16G6igtkGV/wBlXjY9LDu+n9WTQoccJxozy
         DlJ4XEVzvyiS0ilapKUA2QFrOVv4MRsrtGwNN4u20x7FXwtHEtgMwmsC9vErH0vAslAN
         9xb3nH1i4XaLFIiWZQMTFBVth0xras7A6pLJaX6ybybz963jkCsECL7w5SZbYYdkleuz
         oI26d1b5pMgpxvPw0sH2nBSbhqzJpuZtbSx+fDcAw8AyGyJP145x5eSd3vUsQLiplGZR
         rNlw==
X-Gm-Message-State: ABy/qLbTgG6jLqKyUfDu57xa8yeDIAV/HR8jU/Sy3mKNaamPCapS4Shy
	j+aqMEI6gJ8/zEIpsSIFUw9iJA==
X-Google-Smtp-Source: APBJJlHpCAuzBB3fDufs1Z6+UbPoWtjzxfy/5Xb3qfIyBewRVkfzXoEny9pL9FRSwUd9JB6H5VQafQ==
X-Received: by 2002:a05:600c:2113:b0:3fc:180:6463 with SMTP id u19-20020a05600c211300b003fc01806463mr7513573wml.7.1689004451470;
        Mon, 10 Jul 2023 08:54:11 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id v6-20020a05600c444600b003fbb1ce274fsm20141588wmn.0.2023.07.10.08.54.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 08:54:10 -0700 (PDT)
Message-ID: <663c607d-4c68-a3c4-0bc5-e7f53a7b7b53@baylibre.com>
Date: Mon, 10 Jul 2023 17:54:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 5/8] soc: mediatek: pm-domains: Unify configuration for
 infracfg and smi
Content-Language: en-US
To: Markus Schneider-Pargmann <msp@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>, Fabien Parent
 <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230627131040.3418538-1-msp@baylibre.com>
 <20230627131040.3418538-6-msp@baylibre.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230627131040.3418538-6-msp@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_085412_640727_3C9AF839 
X-CRM114-Status: UNSURE (   8.18  )
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
Tested-by: Alexandre Mergnat <amergnat@baylibre.com>


On 27/06/2023 15:10, Markus Schneider-Pargmann wrote:
> Use flags to distinguish between infracfg and smi subsystem for a bus
> protection configuration. It simplifies enabling/disabling and prepares
> the driver for the use of another regmap for mt8365.

-- 
Regards,
Alexandre

