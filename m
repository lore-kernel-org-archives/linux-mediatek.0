Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1844FEB107E
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2026 21:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KrG0m0+wGAmylYP6HW5DIMPVkIxjVDO5lBH833IMH8c=; b=FJyZdUmAg7jzbfXegzVDlhJUv/
	RB/WSF3e/1NFljKJK58SWVNEkY3Jb8Ji6qOfIXeRjE1j6pKuo7KJcwwkS7MEbwwok6QEIRALrPSxT
	9NpkmTHZB+V0Kg81WHE0kIEmfp8irJjTbDuZZjwvsExC5yQ4tQlGXJcMTqh0EJshJNskU5HfYiLL3
	b+h+XVpKSMZLBtfX8eHp+fFoahuoFZon0dMtPvNP90z9K969zmQIcUDWUNZTP3NNIxK0NFZEpJ/7W
	C9v4M/1k2sflCTE0v8W2TqhpIM+kkGrwWUfpffLTw5Q7+bU4Xt0kFSprPMRy464yPdyNhZsyh689O
	niC+t0Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w050G-0000000AJeJ-42IO;
	Tue, 10 Mar 2026 21:52:36 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w050D-0000000AJdV-2O8t
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Mar 2026 21:52:35 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-467161c4a1cso828303b6e.3
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 14:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773179551; x=1773784351; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KrG0m0+wGAmylYP6HW5DIMPVkIxjVDO5lBH833IMH8c=;
        b=TZ7tytfpEtAJMknliErVuDPziI1EeCiaDnD49RGkn1KZTb4PvRO0LVXJBrUFCOFrKD
         jaIE0zRkVrsxZkvjpLtMZ5SVAAo3YYW3sIBlCW/RVMskoLaUxbfudT1dFTvpTywwnPH9
         cLRSCGKQCZv01NucFEtM3pPmVa5wvVzlwZLGmalnkgJusf5fuoDI5FETtDAlW7SZFu8Z
         knpHvKWyn2h/KjN+CDx17DT4+zKlZQ0heVrkR0Vu8TiVicMTJ6R1I9BpC+WcyWO0jMyn
         FuUbAh4v9RQPZveD77uRzWRv9QAH4QmQB7CPBGUVSAVhkIMbwuWED+qtBJuWZS4Rg38l
         H7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773179551; x=1773784351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KrG0m0+wGAmylYP6HW5DIMPVkIxjVDO5lBH833IMH8c=;
        b=cLMsU4LURdU6AQGMikpCqxaalwuaERyqakAfWSkNbGB+hRDlYEGsa14DvdJuo+Je+r
         2JicxkJjpzwB9GauuSFqUbGHThTovjcmKQrWR9/ybOVVORTKybyAJsI5rpBVhb32Flbv
         +vCeERJfdV13azGULkrPEWV4K4H8sAD3RVSPNZa1znzjQdd8Rw5QM9IMsgM6HJ3J1VfF
         rPMLQNITdj4897aE6gLeBcRzGafHww9QuZwz5evNqtQTgiVHoPE9B3ThjtwuTUkOdysQ
         g0r99VMujO4HCikMDyVZHVP4+lHHeUY+WT1mmvXdbGMlvqSSpojegaAcGvypabaSJKhi
         i5tw==
X-Forwarded-Encrypted: i=1; AJvYcCWGcK8PAHDNyjbhJv/4C0yMSfbC65ZL9efV3/i0K5veSefH/OdWqwTrWZ1ww+5o9uDX+zosDajW5T8se/8HKg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwX7ovq741SkGzt5Z+zipwsbzmySjhl69hzeY4Ap7SBGyWG9IxJ
	tBU3yMr2ZlKtFj//zbrmWA/syyd+KeRX49SrMItvUszj+hdXkMOijzEx499n5JLwwJ8=
X-Gm-Gg: ATEYQzwwdei0ORNB38FZMtRK6syj1TAM60WFV77IEsdoCA1dcj/9kpOmuqXljLElhF6
	gZRCE8l1EGghK0eiOVhj6P8M9B2LRJZzJ3xsfbDkuSkz/1tu2anzMjI/id/BsUSdzY1dblBEArK
	9WXkdLIDzJqFvzzc5Ii7DJFwTGrkIfFgParoczhz4n4r9Y1J++GPOBq8qRnuQAu/PbjdAvlrbqG
	Mdx34xBEZmzpvVUZFnMvN0KI59OTW3JD0VmirvXBJakjCqi1XTcPk9pp6bG6jGJtkootV8XpHRD
	lV1NvDQyCh8I34oNdN/xz3UT+rC+fKP/wKqEYOLtzJUrTrcDRpHfQ//hN41g3Owr+oLLiF0iAxm
	faSNhIDHMt92fX/QT2pGlwLvKRYxnNQb4tyrnxFnvfDdF57f1PNsCooPv448mJMyi+rBDOtaTEd
	BWKkLKyNmtWze7WkgTisyoI8F/OdkHeh0kI3m8CGo2HgDjQFQkyfZAPTgz+lrN5Q9DutY2JYNwI
	Q==
X-Received: by 2002:a05:6808:1929:b0:466:ecc2:6f47 with SMTP id 5614622812f47-4673354b18amr144459b6e.31.1773179551449;
        Tue, 10 Mar 2026 14:52:31 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:78e2:51e2:14b8:2e10? ([2600:8803:e7e4:500:78e2:51e2:14b8:2e10])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46734160cebsm48179b6e.7.2026.03.10.14.52.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 14:52:30 -0700 (PDT)
Message-ID: <79bfac24-dcb4-4fb9-90d8-3ef2393f51e3@baylibre.com>
Date: Tue, 10 Mar 2026 16:52:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] drivers: Simplify cleanup paths using __free
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>, jic23@kernel.org,
 m.tretter@pengutronix.de, mchehab@kernel.org, p.zabel@pengutronix.de,
 tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
 yunfei.dong@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org, pure.logic@nexus-software.ie
Cc: nuno.sa@analog.com, andy@kernel.org, kernel@pengutronix.de,
 kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz,
 marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com,
 hverkuil+cisco@kernel.org, ribalda@chromium.org, straube.linux@gmail.com,
 dan.carpenter@linaro.org, lukagejak5@gmail.com, ethantidmore06@gmail.com,
 samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
 s9430939@naver.com, tglx@kernel.org, mingo@kernel.org,
 sun.jian.kdev@gmail.com, weibu@redadmin.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 skhan@linuxfoundation.org
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260310200513.2162018-1-sanjayembedded@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_145233_763572_15EDAFBC 
X-CRM114-Status: GOOD (  12.14  )
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

On 3/10/26 3:05 PM, Sanjay Chitroda wrote:
> From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
> 
> Hi all,
> 
> This patch series replaces manual cleanup and explicit kfree() calls with
> the __free attribute from <linux/cleanup.h>. This modernizes the memory
> management style and simplifies common error paths without altering any
> functional behavior.
> 
> The __free attribute provides automatic scope-based cleanup, making
> resource management clearer and reducing the chances of missing cleanup
> on early returns.
> 
> No functional changes are intended in this series.
> 
> Testing:
>   - Compiled with W=1
>   - Build-tested on i86_64
> 
> Based on:
>   <linux-v7.0-rc2>
> 
> Feel free to share your valuable input in context of the cleanup API.
> 
> Thanks,
> Sanjay Chitroda
> 
> Sanjay Chitroda (7):
>   staging: greybus: simplify cleanup using __free
>   iio: ssp_sensors: simplify cleanup using __free
>   iio: st_sensors: simplify cleanup using __free
>   media: mediatek: vcodec: simplify cleanup using __free
>   media: chips-media: coda: simplify cleanup using __free
>   media: allegro: simplify cleanup using __free
>   staging: rtl8723bs: simplify cleanup using __free

There is no reason to put patches from different subsystems
in the same series when there is no dependency between them.
It just make for more noise for everyone.


