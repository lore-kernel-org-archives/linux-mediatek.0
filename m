Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4AEC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 12:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ryVcxR4qRSf3BPVo1drGeRkorQdzdkz9XMiFdoI8xxE=; b=j2SzyzUXQRm4eB
	ksv69ElgDRYXXbHhRlgbTtKc62iHKxwnZjMHbhLiVZIvA/RUkFiDv3mwwuG/LDEI85HHtyzKL+Ksu
	wz1SKayOfanNISkLPlGxy+cT6E1p3mkO5cC7po8VyIVeo6GhWa/lSCnat2esYUBWU9/tCShYojvLy
	Z5uwMkcGtjXDDGIY1tHyx+TgmxguvOQN4FolL40epN057ue/xEYIYvySWQMjV+uTGhnWlMWcbAoKb
	iSk6i+hqlintYA8CZ/aHH1QcVX1ZZXw6z8gL4AHlKmlRFzaQtUUtcufWT7SaHmfslS9JQbd+fXJKJ
	NYAa2Trz/U+gQcPEkgmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlrnU-005peP-F2; Tue, 03 May 2022 12:38:32 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlrmz-005pKc-VN
 for linux-mediatek@lists.infradead.org; Tue, 03 May 2022 12:38:03 +0000
Received: by mail-ej1-x62c.google.com with SMTP id l18so33137851ejc.7
 for <linux-mediatek@lists.infradead.org>; Tue, 03 May 2022 05:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=kcYyb33G4bTvlaxMALn1Ho4qits29no+2fDqO2JUvAw=;
 b=g8FlJj3K8F9qNqb9jdO0UJ9BwCvUYsjSNFUG+LZ4P2QrmBsGAvL6tm/JQgyo+t2wwJ
 dsxB0JrTDfK1upwB2PePTSp3qi10Zd5Bd7J0wQEXciAUt57FaYXLYXxmxUaAbF5V5zF0
 geoi1mCN8Eq7i6MTYDSGiO0CSo1jRr6Ax9aYGFNrSGAOQNazJcV7By0ogFqXYpDygygc
 3qJ7pFfmdqbpaxPcIvyhdRKw0LFRveQV9GOeXDI4+99BSzWSWEzeDakFZBg7MPruz146
 r+EKo6KtT6Qp+GboCtb8zTHXk7302mEu8RlTyrAfmif9RQP05IEglXwUWqgJp1j5EuDG
 QkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kcYyb33G4bTvlaxMALn1Ho4qits29no+2fDqO2JUvAw=;
 b=serdJfCqUGZ+x1voN73p/ZPaEDBJYPWvy+9WUXK0BvgPBKOLabMy7zI8oJZ/jcX3m8
 r9puNcj/gBfDlLp/tc/+44yiUXxnQQv48f7bh8J2zFjgKDZGU2EG75DpDlJo+JGoDr2j
 YnEg8GoNg36sFEHy5rwszFrle3pg4MBh13DuWPNqNESMTRDqq/OpUptQK054sOiAm6UM
 eiq3bK+tQpPyaY2Wc0dHPqbJ6taEPSkY0G36evsGCCIDtUznl/AwZif9Z/dSVBr7pCMF
 zwGO+kVGF83BEPeoUbyZ2mh9Xb99c0oT7XPRZGaLmdx9tHQifxpHHCp1mLRTUSgbxf8I
 deew==
X-Gm-Message-State: AOAM532yFmU1eB1ZwB1YJyymjNT8E7ckBAaWfb1LrzulUwA5bJ6xsXUy
 77747MxnG83go6kGzsVY58PAhQ==
X-Google-Smtp-Source: ABdhPJyYlWRKspdwM4OJukbNSv2LuGUD7TozjvJnFBcQnrINY5FjIDMDHwOPke7LgxKKRQqOXOZbcQ==
X-Received: by 2002:a17:906:9c82:b0:6e1:1d6c:914c with SMTP id
 fj2-20020a1709069c8200b006e11d6c914cmr15241412ejc.769.1651581480223; 
 Tue, 03 May 2022 05:38:00 -0700 (PDT)
Received: from [192.168.0.203] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 jx8-20020a170907760800b006f3ef214e21sm4580816ejc.135.2022.05.03.05.37.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 05:37:59 -0700 (PDT)
Message-ID: <da9610ce-a534-fb8a-6677-dad320acc4d4@linaro.org>
Date: Tue, 3 May 2022 14:37:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] dt-bindings: pwm: pwm-mediatek: Add documentation for
 MT6795 SoC
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 thierry.reding@gmail.com
Cc: u.kleine-koenig@pengutronix.de, lee.jones@linaro.org, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 nfraprado@collabora.com
References: <20220503105405.54832-1-angelogioacchino.delregno@collabora.com>
 <20220503105405.54832-3-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220503105405.54832-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_053802_075900_4A192454 
X-CRM114-Status: UNSURE (   7.06  )
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

On 03/05/2022 12:54, AngeloGioacchino Del Regno wrote:
> Add binding documentation for the MT6795 Helio X10 SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
