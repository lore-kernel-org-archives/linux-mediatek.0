Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A0DEC05027
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 11:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K0tK8b6mQQeMxLM0HPC9yVJwlrK4JU80immO6e4TSKM=; b=b7U5vRbqRe6IRWEV86i/uka7sr
	kPpo9fo2rn/6OhrK2Hblliqnplh40EimT5BS5zNvPTvEztZ4lfXF108E//c7CaN7hCm/NGnVlUqkl
	RuP93F/F7YUE9w84OXl3rJEI+AIpA0WPE4MarwV0Sx00lAYjprwVpYZCvN7r6EdTfQKO+c+6UXcOs
	mCloWOb9IlDNFSLo35ojK8FhoEXSbg5qak+qUirEJvEpAhuYL4fyx4MRXC878vJNRUCcWIXmM1fsy
	kPvh1bamKUuU+2TXK/AlAdKO3eaX753vpNY2mHpSCxyNBheg+fTCplhnrR/IbaSXqhdca9WEfbVFj
	sbjXDguw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRtLi-001KvZ-D9; Tue, 14 Feb 2023 11:19:50 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRtC2-001H7G-DY
	for linux-mediatek@lists.infradead.org; Tue, 14 Feb 2023 11:09:51 +0000
Received: by mail-wm1-x32c.google.com with SMTP id bg5-20020a05600c3c8500b003e00c739ce4so11249739wmb.5
        for <linux-mediatek@lists.infradead.org>; Tue, 14 Feb 2023 03:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K0tK8b6mQQeMxLM0HPC9yVJwlrK4JU80immO6e4TSKM=;
        b=cOj7tHcDZ073S4fkddbNrOUQt95Wvqh6a2SUtjxlPua+Bo/UaDxdpLoU1hqht+Rdql
         hAWsQ3W9AZM6mB0xYxBvQ9dcPD2W6Tr/zh7Lod3c3e5nA7iNJBv2qvov7SJL9gZgBp/g
         GTn94Lk4hUbjlG1HhjPHTByjrAnNDsi3juQQwp/aRP8SN+tXN91DjcbLWcnphDcxNlXN
         Sil8BM2riLQD0GettR3WWtFT5uaX8FGHd9HNdRrT91L+VE9exeOk5ZHUeDIO1tmhgMqq
         b+2qVfrzyUh0G/xwcWYApKuafCTQxquInKZwVVU5t829IzBRFGiiZqAeUnflWgB9vR8h
         SFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K0tK8b6mQQeMxLM0HPC9yVJwlrK4JU80immO6e4TSKM=;
        b=hTxAUSIxTQPqsA8NMgZd3J49qqwlA7gnlQtWGNxNYS+xZwXfMVsVS5YLDeprB4oyUq
         rrfE2xpx/id4ehn+rnOzd5W/bUsQ3AeL6oucRrJ2tP4a18fGzD8KPX5CqGzqWv4nKIvN
         dLav6vTN2w6qDHCYbeTHPGnMg2opmFroDMMevjD9heQ/TZ7tD8pRB0q1qMG/ta5eECEv
         L9I1MuWvUbjFLG1yJtSvIa13H5uUPTNzRlBbRbVHHIMPasDbUwI0c7iqv1N63sMhHTSK
         3TzkAFPj0boo7SqA04f+M/PJBcSAwZb7mCQtdOX5R52HhOU6GIMMF7PPD8k69skztxuk
         QS3g==
X-Gm-Message-State: AO0yUKWZO1fmX02I1SuyoPggSPgTMhPqnf1bmbfCZdYAusxRNjgJXpDD
	eWzgCXSYSPZGlpWYsnMkV8RlSQ==
X-Google-Smtp-Source: AK7set9fE4uMwJAMdUW9xC/kaDOhmn8FFi+Toa/sVKWO7UfzQUJEQeLcrh/mEWJXu9QG1lH2xfXCnw==
X-Received: by 2002:a05:600c:a295:b0:3db:15b1:fb28 with SMTP id hu21-20020a05600ca29500b003db15b1fb28mr2237483wmb.19.1676372988915;
        Tue, 14 Feb 2023 03:09:48 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id s21-20020a1cf215000000b003e001119927sm19434237wmc.24.2023.02.14.03.09.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 03:09:48 -0800 (PST)
Message-ID: <1726f1d2-7411-2b49-79cd-f5aecff2d19e@linaro.org>
Date: Tue, 14 Feb 2023 12:09:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 4/4] clocksource/drivers/timer-mediatek: Make
 timer-mediatek become loadable module
Content-Language: en-US
To: walter.chang@mediatek.com, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Maciej W . Rozycki" <macro@orcam.me.uk>, John Stultz <jstultz@google.com>
Cc: wsd_upstream@mediatek.com, stanley.chu@mediatek.com,
 Chun-hung.Wu@mediatek.com, Freddy.Hsin@mediatek.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230214105412.5856-1-walter.chang@mediatek.com>
 <20230214105412.5856-5-walter.chang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230214105412.5856-5-walter.chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_030950_504199_E782F680 
X-CRM114-Status: UNSURE (   8.43  )
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

On 14/02/2023 11:53, walter.chang@mediatek.com wrote:
> From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> 
> Make the timer-mediatek driver which can register
> an always-on timer as tick_broadcast_device on
> MediaTek SoCs become loadable module in GKI.

Other questions are unanswered. Please do not ignore feedback and
respond to it.

Best regards,
Krzysztof


