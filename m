Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B91E606A32A
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2026 02:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FnEgiX2r;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XchuFUIG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zWLtW5HVloB72K34QD88vqK+tQzm7URWbYRu0Qwt2rw=; b=FnEgiX2rNUso/d
	qp2w4dWHKPJZ1AXMMnDszNlcOUN+jPFx7/3aWnzjBqaU3sqVyT6n2XJnkS2MQVY5MHV/rhoOiIR2Z
	zGVy8Vcnvc3kCG6MT8rPFnGwM9UC0e9dt2FDmRxeBHmGgJSaxd5gxw4CB2acm0niynUXnZF7y77ll
	gRptlzy7Z2y9ISUz0Mx+3nmHkuodvHZqvmaZ1Qk9prEiV2PplfFxQIH1f2Pcoz3UZFhG9MEms/TxA
	A6hStr7nXhlHVjUCVZgiIB3FgA3v2wcV6fK/xMrZe18EazRUzHevwZTNAGQDo4z3AhRuCAaAo1FU1
	7OscqvmAxU/ZVNXDTyXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQyHI-00000005TWR-36PM;
	Wed, 11 Nov 2026 02:41:36 +0000
Received: from mail-oi2-x08.google.com ([2607:f8b0:4864:32::8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQyHG-00000005TVo-0gHh
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Nov 2026 02:41:35 +0000
Received: by mail-oi2-x08.google.com with SMTP id 5614622812f47-56820670d00so1086730b6e.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Nov 2026 18:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364893; x=1794969693; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zWLtW5HVloB72K34QD88vqK+tQzm7URWbYRu0Qwt2rw=;
        b=XchuFUIGvw1kjvLB2zKD2vsYr0K3gIDdPJV38xLSOA6aakRG2CPtigEMWtzvVgLfaH
         i+Ss65PFpiGrHfbO9cyPa84Ttef5KwO56zbkLXhswz16qO83bcLtrCHrKqirbzpaxKQW
         cgoJ6f+9uvxTOQt6xuPdoB4N3uBwxhtGucelqosDBoSdBGka7tlSIgfmKWpXmGvUSryK
         h1Aak2NJYej02efIJOlBDXYa8aODFRfO4xz9Yl7Y+cywYcDTMtfdi9Exz96NLR074O3w
         1/AzmPdD59B/1P6Jt/cPx7gOBe2GoAhrPThucMiynewExaCWRrrkOG2WINC2iSskBtn4
         4Wcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364893; x=1794969693;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zWLtW5HVloB72K34QD88vqK+tQzm7URWbYRu0Qwt2rw=;
        b=AqYjasRDTa9m6VP/tntq/yuax9iiGwNlB2vI/jdqMjhM6go/0ih+dKqMaNEU+ojDVy
         HK4JB2bqIYL63vv3dzPeajEE2rzdBtnG5nNvEqcadRigfifi7ZfyUSstq34dRV3mGgTx
         d/Fx0zO9V+iZyOEH4gqpg/RxSQkKr3JHWa2pQ3MiRPhXQM1JDg1BZbbB/x9TXXiDXVnp
         9mpP8hhpdDY9ces0WUIZvZ7kJyzdfG+eh/mTkG06ecJzcCuFPnPozrEl5v1nJDh/bztW
         3LYen6/7UGo9LE3TrDuBtWOu4gMyEUE7BMn79Ap4H1IYPJUDV4BF6mWs9X8xK+uIaUcA
         qg5g==
X-Forwarded-Encrypted: i=1; AL+hErHUPV+i+pEX9EcNU3USPkPKL3TcRP6alsGC1uflR87vm7GIBq+LaGjR1wXad1VTZuJ8GzaDA0tGSZl+FJJOdw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8zvm07r1dXQ0gLkGTwhbUKu6lojiXaiBOrExDn3mPZBpxnxYf/
	2OxbCKV/ZZYthnhbeZwyFStMdr7HKSEzP36wn6ifl1tShfDrGeg/KjzU
X-Gm-Gg: AYBFou1e5lsr64Qe2mRGuzXw1gIqH8zYaZ7UoCnWgg2N19j7k0woIsmJUEg41ZqwMyP
	thk7hRaintct2knJ67nd23kjnEBWRUcYEzKa9EZ6u385M1wO16X+EX0NnTCmIfUL8TCpPgsJIY1
	x4Ty+4V6rGDhzTEGMLRsv5XHoma79u/+z4RR8hLizKdgCmG5Umnw/qOyBekuiumGZZaKvVXdpZW
	5pfLdWPn52rJ6Vtuj1atq+CNinbsmXsBkN4yEqE5HhjPQSg+hhpFg4UMo521wmEoKr0Aj80aDHp
	LPLhZ3OgHisNWvyFxSDS2Aty3SsauOe5nbfLHGvVHeHWm/6714pvvGH0QiRLhq/8rWaKLXkz4T8
	J67c3DswnWrskBnxhzUCjsZ0kEQQ1XE3miiYxIkdGZtAFy4iEsTYTjGQ255ehaHrPIdX1zbZDhk
	+5GP9nQhYTLPrcvQTZzvHUQaNgdYmw95fBsV2gM7WAR1DraBX4FCZ/EG1UD0NaXKrus8OWd4HJh
	S3yg9/iv86ieJKA8ZUb2FFErj7ZxyAQj8wrkiETgyl8PGPszjLNyGiidL4SvHYlHQd+VLlp0Y/L
	Lh1RoJ0vSjZ6UmT70kqsc9+doxZIyCvnBlXZ0FHx6qMCbg==
X-Received: by 2002:a05:6808:c123:b0:4d5:291b:b850 with SMTP id 5614622812f47-56b9770f25emr830098b6e.54.1794364892987;
        Tue, 10 Nov 2026 18:41:32 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm3857157b6e.8.2026.11.10.18.41.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 18:41:31 -0800 (PST)
Message-ID: <a5fe0bb0-547b-48a6-95d8-6132df7f4192@gmail.com>
Date: Tue, 10 Nov 2026 20:41:30 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/timer-mediatek: Enable the GPT irq
 before registering
To: Daniel Lezcano <daniel.lezcano@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20261103-timer-mediatek-gpt-irq-order-v1-1-6d1ddf977224@gmail.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20261103-timer-mediatek-gpt-irq-order-v1-1-6d1ddf977224@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_184134_244174_ADD2702E 
X-CRM114-Status: UNSURE (   8.19  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/3/26 5:17 PM, Ryan Brue wrote:
> [PATCH] clocksource/drivers/timer-mediatek: Enable the GPT irq before registering
> [...]
>   
>   	/* Configure clock event */
>   	mtk_gpt_setup(&to, TIMER_CLK_EVT, GPT_CTRL_OP_REPEAT);
> +	mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
>   	clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
>   					TIMER_SYNC_TICKS, 0xffffffff);
>   
> -	mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
>   	enable_irq(timer_of_irq(&to));
>   
>   	return 0;

Hi Daniel and Thomas,

Could this go in through timers/urgent for a 7.4-rc? The regression come 
in with 7.4-rc1 (7a097aba7255), and on MT8173 boards with PSCI CPU idle 
it hangs about half of all boots: 20 of 40 here, and Chen-Yu sees it on 
Hana as well. It now has Reviewed-by tags from Chen-Yu, Angelo, and 
Luca, and Tested-by tags from Chen-Yu (MT8173) and Luca (MT8167).

