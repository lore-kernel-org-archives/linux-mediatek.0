Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397A8C6379F
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 13:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sVI9K8PTnFNIA9pBOwdmxa5ImYWaocXFHnfUICArsyc=; b=Bc5r1xhOycvh4v
	QNWC48BYva4AY0SZRHPdpu+LqRQkn6Uor1t2QFrwGkvQQsRI6M50vHl1YexfZR99Gpi44kS6OP85l
	zW4FrHVXo3MFiqqqY9HPa5QgxxvLssWAdz8WiC/XyWQvY+3tBsERvEf0KvQfyswU9FrlYAifoQuBC
	ltlGT9S5Kp/QznrdQEzviNtLghHROy9YAK0OlU1uqg3yYYOlJr0l3wF6BAj/CltCGxk0ijZSEobRv
	pRV3IM+ehVbNqll50emAj0Xam2NYReKtAUDsEX2jQbqaxUXUMU5Ekd0CevjAFZ8TLp8sAX1U7a36k
	2AGqE0SjvWenELkH2/WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPO8m-00CJpU-J0; Tue, 07 Feb 2023 13:36:08 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPO8k-00CJcz-4O
	for linux-mediatek@lists.infradead.org; Tue, 07 Feb 2023 13:36:07 +0000
Received: by mail-wm1-x332.google.com with SMTP id f23-20020a05600c491700b003dff4480a17so884646wmp.1
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Feb 2023 05:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sVI9K8PTnFNIA9pBOwdmxa5ImYWaocXFHnfUICArsyc=;
        b=o//KoGPZUfzC+aaVmqoPmdDF3gEsLKbwWosUMg6bek/AA4Yrd8KHkISWUiJkXmwKNW
         sHMRYnI8ksoYk2iP9kg41StksvoqVcEdy8IV3qeONv9hdlfr3RJYvNb/SRM+NHqWWv9L
         SchKchF+G4Ag4QRlh7ttPW6/5XILWWW3a+S7wRKOKgZKoiAnt7/4gOEct+FIGtkaq6CZ
         5loXQWPNCn+UnHry0EXjVRT8hjV2sey78lctBneVVrW/k2a3bReMNMs2s9QndbQaaaMl
         iJ+H2EjJGe0EclobqFIe/3ynpomFtuRhNF3FsJ2kToT1Yg3Npu9FQwFOXgiaUhAhJdHf
         0z1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sVI9K8PTnFNIA9pBOwdmxa5ImYWaocXFHnfUICArsyc=;
        b=EIg+3vdwqHlgZwEsPlgoFEG+ls5TvpFl4UJWN4rY/Ps/ZDCpuEPjoo/BVTUU2LJCPk
         2jlS5nS/X108Mvs2fbdOBDVzRJYNLGUOz7BuKcrNpNA4p0MBNvcV9AbVpPqPpDD/LPto
         sr0BwD9pdmrvANZ2jslyUWkM+SNLCHb065MjDOmFr5zRQF/m/mu2/srR5dlNxLHDsd8F
         M33fCwlp2/ts/QWEAucRqOi88kaI+Momm6rldLb9IQeaSdY8js4Ulqmh+qnRkUoX9edD
         qmDyp42R1XvBGtYbrbIN7CWbkr8ZQ1xIni8nT5n3dUdNWPkCyXDehxW1dhmxT2ki6fqo
         n/3w==
X-Gm-Message-State: AO0yUKWzQqFuWIep4Nofx4RJmKOEyUHO/Ou59bgjLxSN0qeJVZdjdtWF
	tzbfrtyLW04LxV5/TyEOs9Oc1w==
X-Google-Smtp-Source: AK7set+XnY7pfbNfFjLHPCUL8D1u9EwDQ3lhz21ktvYLT+GXdOmtMNVGdaRInzpMwcC+w81j3R+1wQ==
X-Received: by 2002:a05:600c:330a:b0:3df:de27:4191 with SMTP id q10-20020a05600c330a00b003dfde274191mr3115551wmp.16.1675776965685;
        Tue, 07 Feb 2023 05:36:05 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h27-20020a05600c2cbb00b003db12112fcfsm15385748wmc.4.2023.02.07.05.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 05:36:05 -0800 (PST)
Message-ID: <7aa132aa-d2fe-e2a1-a2a7-97321a74165c@linaro.org>
Date: Tue, 7 Feb 2023 14:36:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] dt-bindings: mt76: add active-low property for led
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20230207133504.21826-1-linux@fw-web.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230207133504.21826-1-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_053606_211364_985A6F7F 
X-CRM114-Status: UNSURE (   9.97  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, netdev@vger.kernel.org, Kalle Valo <kvalo@kernel.org>, Sean Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Shayne Chen <shayne.chen@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 07/02/2023 14:35, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> LEDs can be in low-active mode, driver already supports it, but
> documentation is missing. Add documentation for the dt property.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>\


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


