Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3612C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Oct 2022 15:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3kVAKgrIeXS9Wej7D2KBZwNp3M71ZHkxgn2y0ZEuPfY=; b=mFh9gPfIL7bPFI
	O89yC0pzO+E98qEJggfo5ejpinQtlzoag0ShZoyIFFL+MLO7MgMldFzTzNRLVK2BT1jvV/QuLTyMN
	FTDrqPi8pMui7w+Y55PTIw3iXZ9cuGSstX5EeK6Oh2lkdIePJ459CzDDWNTAqx8Z4kbKBKR2jj6nv
	NxF3wq8HsjZN3DJiVZhRWPQLAbEd/fk858CvE7yWdqJHcehSMbGZOCIEKHTmY1FVA5x6PZsRz4Yb/
	lkjtBw7hbpC3syfwdytEOAkaMkNJrUjmI/hANOdpc8ZIlsFQMqKBY5/6WndQu1lCOS2xXLISXWpD/
	XdpP4GIgV9vDmltQr+GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okogc-007ntu-9j; Tue, 18 Oct 2022 15:39:22 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okocq-007kUZ-7F
	for linux-mediatek@lists.infradead.org; Tue, 18 Oct 2022 15:35:30 +0000
Received: by mail-qt1-x835.google.com with SMTP id a24so9850171qto.10
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Oct 2022 08:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3kVAKgrIeXS9Wej7D2KBZwNp3M71ZHkxgn2y0ZEuPfY=;
        b=Fbd3sjYaj1g/8OEg/isqYSeagzep3vlG1TvtyLqoFVk5wf0EWM6MsG63MtL5klhlzM
         kih9aPsj9e2xbEm0eYQT/vR/WcR2N5CHAmjEvOqFa4ndJro150g0CsXii4VawRPXqH9d
         WTHl6fUq3F8WUEzHqh/PcLm7vJsq8XrbPXbVX1zXoBFBcFBrj8DY9pST+ISKhLRCsWPr
         uoA/OLBqJt2Q1UsRCChuTU+SAibhpwKXcDH5SpJN6IDq4RmlmKVNjpBQuYrJvHUn2YFU
         bbgPPk69QTEDVU4ytpzY7p5drZej4Fhm+FzDL/imDrn0LHj3lAqFQ7QK11CoZbmCAeIG
         D5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3kVAKgrIeXS9Wej7D2KBZwNp3M71ZHkxgn2y0ZEuPfY=;
        b=GWpt7U5dyHS44BQiNCow0EXsWrexEh+gtttcXVg7eOZN0BPnCbXkIWvZyOiOSbyOu2
         gyJAYRIiC8oyuOQtPT47VVu33Nm2f/Ij2/+bS5uWquqKioGxKejG3fz5xxmlT3kUsSCf
         M7TP3VOaU5cYVF0RmipW/tjd+H36JsOKjFiU594ZowlLOTdeTHTtd2yqN/v2miUT4/52
         rW98NxbHVg4oMgM5AxTUf9pttFtJA/ins0kUFUqaB5xYezVrIVZMWjiGY6dtr73/bmlC
         yLXIrZ8KjoHAuqjGr65AbYN/V781kfjds6fEn4gNm/COgLMLwduzZRV6YZmAN4g5Yjrg
         mWRw==
X-Gm-Message-State: ACrzQf0fGOUP7JFV+RQAUxM0/pmmOdvr7QiKvQQYPs6lNcvaKCy4Ii0M
	Z5/pzPa86jhVTa3zxm99CirsnQ==
X-Google-Smtp-Source: AMsMyM7jfOah+Yg6ti2bMKe0TnCoKZfy1iuyVKUUWtDd96255TcNQCtjHGdkLNZIAN78128rvf7JLw==
X-Received: by 2002:a05:622a:420d:b0:38d:961c:a57c with SMTP id cp13-20020a05622a420d00b0038d961ca57cmr2581230qtb.678.1666107327809;
        Tue, 18 Oct 2022 08:35:27 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id u7-20020a05620a430700b006cf8fc6e922sm2540148qko.119.2022.10.18.08.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Oct 2022 08:35:27 -0700 (PDT)
Message-ID: <153a0fc8-29aa-c9a0-eb79-c7a478d664d1@linaro.org>
Date: Tue, 18 Oct 2022 11:35:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [RFC v1 04/12] dt-bindings: arm64: dts: mediatek: add compatible
 for bananapi r3
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20221017104141.7338-1-linux@fw-web.de>
 <20221017104141.7338-5-linux@fw-web.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221017104141.7338-5-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_083528_334748_3571D6A3 
X-CRM114-Status: UNSURE (   8.00  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 17/10/2022 06:41, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add compatible for mt7986 based BananaPi R3 SBC.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


