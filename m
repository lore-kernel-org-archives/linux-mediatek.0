Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84C2EE57DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 11:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2r1pG42saIT1hQx+TELlhxvqJ0mmluvD/XCTWLDnio4=; b=jY+KqKK+KftFz0XhRFMDoS915y
	22tubhiwVF0NTmzzeiiuIdX9vOJtf6odsknEDZuEFRWsEaRSqN/BJphZyHBKfbgy2cs9tx51+p/XT
	BNakYu3Nx5MFmGKB4vwpVZh5aDwEBw3xKsIZT4Z93zzYhPdEbJtYjo8Sn72sagF/ONNkpjHzp469Q
	4gr5IxVXw5ShQbl6Xy70cbde44QSj1U1KFXJs3Te+39vdEHIYJ62pG1sIaYS5FRiS2ZbNK3poyvSw
	aMr6DkAWlPY9oLV49eVM/KeusXAGZKLHixHpDad+n2Zf/1XjdvF4FcUJBxBX34Y97vONzbgDki0pc
	vMyU0QmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfemq-000MCo-1H;
	Mon, 11 Sep 2023 11:09:00 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfemn-000MBT-2W
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Sep 2023 11:08:58 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2bcb0b973a5so69270511fa.3
        for <linux-mediatek@lists.infradead.org>; Mon, 11 Sep 2023 04:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694430532; x=1695035332; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2r1pG42saIT1hQx+TELlhxvqJ0mmluvD/XCTWLDnio4=;
        b=FMaVg8WC2L6tyLeuFed3m64jRaYip9ApwPr9Ee5DsV74CgYTqTngHQTrAYf7/4p0jk
         FNusFyUlybrTvU9pXcaM33jy/NUtZqI5lEv5dEpXlsnQhe7y7cKBBBTrNk9hy8TiocQz
         lNMZkEwUGZBe5DydN6m3lIyVdLxIaZw1PWBvAfkUiNX96jjcAYWSFneQ/ODbUi5tbwRA
         oD3Oyf2HjqQGjG2Clt5hW+CSdr3/fDUxPMxSpL084bqXRQQ1rWsSHmmh7Jo8EAEVDteb
         dWVqgVDlrd6rO9BbJNO8fXh8mupAcPh5AXZbX4CFIAbfXDz06ot+jer6pDBuCsZU66SB
         NRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694430533; x=1695035333;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2r1pG42saIT1hQx+TELlhxvqJ0mmluvD/XCTWLDnio4=;
        b=IdhlF/qj3KLjbkBFTjOjy6TcO8Je3h5rc2m2LU+BjPbHV8T1LX+/HN72m74mzjdvRs
         3CmdtSXPk4/i2e0XvkV7wycGvc4sxhb8KoI8oa1TvcXYQjCThhhxTI5OiRZ4vC/BaNu5
         62XBu4DJdhLxfEUTBNvxhvToq1pUXnrvJXPDwuUiJ+XiZ33i5xgCBrr+befWDWPg1YfV
         e+KVdi1fCGGgSzQWUssJrZwxmeiJd/n0bntX1uTg24YcFIqIJL7KoHOlSQST9y6h5gzb
         5Eow5Ns6kc4feZgF8BSv8pD7T++EB1NhhaLGCu8ACQrHvbg4fAz+Rlk+NX03Yz0tKMfc
         GFQA==
X-Gm-Message-State: AOJu0YyTNd73p0tJ1imfaNfkynsfJj511Mqt0t+JHbMQ4faCRQ6xpi6j
	Rf8TpypLFJe/hZDEvhAALbFkvg==
X-Google-Smtp-Source: AGHT+IFhJr6aCH0nOA8CkPBUhMy540nMaAY+Mvm7js3Wpv0+d0W8u8lZbEJt3lbAgLcQPiDqKMNL3g==
X-Received: by 2002:a05:651c:1994:b0:2bf:789e:b5dd with SMTP id bx20-20020a05651c199400b002bf789eb5ddmr5800990ljb.53.1694430532675;
        Mon, 11 Sep 2023 04:08:52 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id si28-20020a170906cedc00b009786c8249d6sm5244877ejb.175.2023.09.11.04.08.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 04:08:52 -0700 (PDT)
Message-ID: <75466db4-3d19-33f6-b2de-db714186a96b@linaro.org>
Date: Mon, 11 Sep 2023 13:08:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 07/17] soc: qcom: minidump: Add pending region
 registration
Content-Language: en-US
To: Mukesh Ojha <quic_mojha@quicinc.com>, corbet@lwn.net, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 keescook@chromium.org, tony.luck@intel.com, gpiccoli@igalia.com,
 mathieu.poirier@linaro.org, catalin.marinas@arm.com, will@kernel.org,
 linus.walleij@linaro.org, andy.shevchenko@gmail.com, vigneshr@ti.com,
 nm@ti.com, matthias.bgg@gmail.com, kgene@kernel.org,
 alim.akhtar@samsung.com, bmasney@redhat.com, quic_tsoni@quicinc.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, kernel@quicinc.com
References: <1694290578-17733-1-git-send-email-quic_mojha@quicinc.com>
 <1694290578-17733-8-git-send-email-quic_mojha@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1694290578-17733-8-git-send-email-quic_mojha@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_040857_820709_0B8D150B 
X-CRM114-Status: UNSURE (   9.82  )
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

On 09/09/2023 22:16, Mukesh Ojha wrote:
>  static int qcom_apss_minidump_probe(struct platform_device *pdev)
>  {
>  	struct minidump_global_toc *mdgtoc;
> @@ -571,7 +688,10 @@ static int qcom_apss_minidump_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	mutex_lock(&md_plist.plock);
>  	platform_set_drvdata(pdev, md);

Why this is locked?

> +	qcom_apss_register_pending_regions(md);

Why this one is locked? It seems ordering of your operations is not
correct if you need to lock the providers probe().

> +	mutex_unlock(&md_plist.plock);


Best regards,
Krzysztof


