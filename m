Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC273C54EBC
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jan 2023 09:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6gs7ncFQfkYI2fHig91qe7q1AclJ2kNZKwU5d4VfqOo=; b=JgRj/HGncY8etdDN/YNw4aFwZ+
	4DrbF/DrBTOE26MHAqlnW9g5UgcoGnerfmHrFk/WIosvh9Zk7U4fWJZ5YvoNVHItyQDTN/mRkRqGh
	l2CoLepmDO/uSHvUXmGuHw6NJbEAr7yp9UNe+RvPVLA4iSdN/NSNuVpQtxEFwwnoPeioOE+zGKQAo
	Q4TM0pD5vwrGgz1w3f4l9FVMQLgIquY9KniBxQqeEcDb/5fK3nqXQ463MZKMrVyR6ecumWQRLQP8V
	QTa5pMLrMgKY4LAYq258yBcyFXhLY6zrp4OdsaHsgYsJupntMByTUKvFI75P2DFBvZcXAeJu+N5sd
	0+ghGRJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFtTO-00EErG-GT; Thu, 12 Jan 2023 09:02:10 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFtTL-00EEpm-NI
	for linux-mediatek@lists.infradead.org; Thu, 12 Jan 2023 09:02:08 +0000
Received: by mail-ej1-x62f.google.com with SMTP id u19so43046844ejm.8
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Jan 2023 01:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6gs7ncFQfkYI2fHig91qe7q1AclJ2kNZKwU5d4VfqOo=;
        b=r9RscOYJgQkrS+a9PCGCimrjNTd1GiKH4RoURn+HjNbFpXQ/txdyB11jHMX4rnaa+/
         odSn4Ny63ApFLXnwoC90ArUG5CYuMUA6RkkbjWnMjgzJctEhdHi80DXTRGH3eCVd3Au3
         ATh+A4lIOpbjEGK3lD6wr5clGIpu6tlGkc3ucETdPp9q26owU9g/ccwauKxjy33qX9g8
         ADK2Vbey429rreGqLmkw3WsSs1ri5andl392EZUorKroCg5K2XEUE81EaRCaTr5m5pr/
         Vsm0w8V/fwfl2CACn8VtrVsgVrNAYIFvNccCDChgnXWS4bdz60aJnwMITq9FAtCLVCnK
         Pbig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6gs7ncFQfkYI2fHig91qe7q1AclJ2kNZKwU5d4VfqOo=;
        b=hUuRfKOPvDQDwfH+j9jlnLl91pvlIJjWT7mROn/Y54tX5uWc5txaMgQeCbyqLFmPb7
         oYkYuckCJMR9/bm9JijuhOC0UrlQSP0hqOD/ACt7X+bUg2utuAlhIkSTDPxlccgwNBOM
         VER4uSJFmALjsYqjYJe3FGUnPOecd0GjUIgFmDEliAlF2lzsvoe9Vjn7xI5aZeBt1b64
         /VDl5ufLSHB08YeZIPkG6QiaHYlcf7/l2CYdnNZ0mNiriPpVDiEHjcAHTx6aLBD9SCag
         6VuH0DoE/mqa1PKB9HCWmfm1Q6EThHFSI1lAB1YxnUYCRItuJY+fc3yu96AnARenG2lW
         RJqA==
X-Gm-Message-State: AFqh2kqghSuJN+fpuay+TSrufG1zmEkO6caJwr1onlC4qLeAaycgqMnZ
	D2uYpyUHwttn/f35Ues/V74MRQ==
X-Google-Smtp-Source: AMrXdXuaa0nMPMSZmtKh+p0I0syiVT4ni3wfYqNeRZhL3G76s3abDWvbBQHSjUEXbuOkmp9A85YgwQ==
X-Received: by 2002:a17:907:a510:b0:866:d374:7b7e with SMTP id vr16-20020a170907a51000b00866d3747b7emr1171457ejc.15.1673514126348;
        Thu, 12 Jan 2023 01:02:06 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id 5-20020a170906318500b00782ee6b34f2sm7144238ejy.183.2023.01.12.01.02.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 01:02:05 -0800 (PST)
Message-ID: <f7771bb2-59bd-a704-2dc8-82d050600d56@linaro.org>
Date: Thu, 12 Jan 2023 10:02:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 4/6] dt-bindings: pinctrl: rt2880: add proper function
 muxing binding
Content-Language: en-US
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 erkin.bozoglu@xeront.com
References: <20221231160849.40544-1-arinc.unal@arinc9.com>
 <20221231160849.40544-5-arinc.unal@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221231160849.40544-5-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_010207_782808_A545CB7E 
X-CRM114-Status: UNSURE (   9.54  )
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

On 31/12/2022 17:08, Arınç ÜNAL wrote:
> Not every function can be muxed to a group. Add proper binding which
> documents which function can be muxed to a group or set of groups.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../pinctrl/ralink,rt2880-pinctrl.yaml        | 86 +++++++++++++++++--
>  1 file changed, 80 insertions(+), 6 deletions(-)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


