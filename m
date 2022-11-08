Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95730C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 12:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vA/6w/TAg60jnQ3hhyPXCj6N+JmaescOH0FqC1VC2/E=; b=FWsrAxBmnY95kcm55NodAOBqdO
	yZcYyScTICIjSZ5f5oGil0IRZCIycMg0lV3ZZSjI0HX5SWdn4HIqZhmBzVbb6YTxXruEevXvLPIcV
	NKbw1hPP6bapWh1gqPAvmWqPzQ2HMsaQmHobFJ4nyNLMVmUN0V7+vN2GB82VcFK6rYAvZv/UI6fpu
	6NtemKLngUzkdWUv1ixR85anQIPFWjiNwJK7Vo80Xj/kMpdRmXI8tjCk7uJN02sFNhWLccYPzCEob
	oCDJDSu7yvqF1Ys2eBR/Ts2XUw9eGdSJN5agouQ0Q3SFPdsia6VUg9codsNm8GeJG2O1NEEUS9RvC
	8e6/cwrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osNhc-005DZt-Nk; Tue, 08 Nov 2022 12:27:40 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osNhY-005DWq-7U
	for linux-mediatek@lists.infradead.org; Tue, 08 Nov 2022 12:27:37 +0000
Received: by mail-wr1-x432.google.com with SMTP id k8so20765129wrh.1
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Nov 2022 04:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vA/6w/TAg60jnQ3hhyPXCj6N+JmaescOH0FqC1VC2/E=;
        b=ncbEcc0hwW//oao7WG9oisKKHt9RWotUEhJjBQqthqy2YtejUMeJqETlB0gY11KDdj
         RpkK+iDQArtaeEbPI7UWS/cQJPEwrM8LxDbfA4ItcOd0O6kitWIOiiGTvwWrpGcUbftO
         TvsyBAucBFikX3eUphNXJCgv7PJHx6DndxVa9ir6A3N2m3RRs7kYXz0Ibc+/xpSnfSqa
         8465gE5kQT31kPMUvFILlysNfYbFdf81yRtRr6eN/fh4JRa5Wna8m0JyGNM0GsyPMwNK
         er/NDN/CWWN93SedDgsuoeOUVJ7G9PmemLtjoxTk6TX8y+sOFQE+fPopoFwlWl9473wT
         qRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vA/6w/TAg60jnQ3hhyPXCj6N+JmaescOH0FqC1VC2/E=;
        b=fMhAo63s1V0W7xAiaFgLGGjOcRSV6BggSULMPC9/wWyteLZUYOMzbu9YD4aZVzEeg1
         9gzBlRlv7yagG9V3LYL+SFtH5TQKyQXChv/0CI3RiUZb33EmCw4bVsPM8UqAcW0Ma0ea
         EgeqtRekH3VNN8agKcS0SBdDSMVs4ibbzzXv+V5E0kpMhieKKrq6yUIGkjn9QGhOtp/G
         WMuJMyBbeGY9Z/ap4pvNhwWu04oM3wpVmgk2rP1MrCqo6lIcqsNrryzBUXtzihCOjoDx
         Dx+Azis9GJTZDsEaGbNcigJloVo3sN78T0QfXL4ZPb64mOICKsU64BGExAL+XMUYpfDU
         YwPw==
X-Gm-Message-State: ACrzQf2gpLI/swcis1h7N5BkKI1qBBxryapGVM80OgojtnYHmSzneSUf
	toCtN5W+9w9CAudalC2KmvY=
X-Google-Smtp-Source: AMsMyM5YScKNzFGwxOrJ0kHinbp68XeCGVB0PYgH77/yLwXlasvihvDOIhnjfnldCdDbxkXE/OLDVQ==
X-Received: by 2002:a5d:6ac7:0:b0:236:b281:150 with SMTP id u7-20020a5d6ac7000000b00236b2810150mr34684381wrw.29.1667910453596;
        Tue, 08 Nov 2022 04:27:33 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id t1-20020a1c7701000000b003b3307fb98fsm10798650wmi.24.2022.11.08.04.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 04:27:32 -0800 (PST)
Message-ID: <999a6b2f-4f40-3862-1988-d290890249a6@gmail.com>
Date: Tue, 8 Nov 2022 13:27:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: Driver of MT7915 for Raspberry Pi Compute Module 4
Content-Language: en-US
To: LinChinting@itri.org.tw, ryder.lee@mediatek.com
Cc: linux-mediatek@lists.infradead.org
References: <0708ffbb3b404cf8b08e852e8083eb91@EXMB11.ITRI.DS>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <0708ffbb3b404cf8b08e852e8083eb91@EXMB11.ITRI.DS>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_042736_303325_2A7766A0 
X-CRM114-Status: GOOD (  14.12  )
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

Hi Lin,

On 05/10/2022 05:46, LinChinting@itri.org.tw wrote:
> Dear Lee,
> 
> As the title, I want to use the Wi-Fi 6 chip (Asia RF AW7915-NP1 MT7915AN) on my raspberry pi cm4.
> 
> I used the
> System: Ubuntu 22.04.1 LTS
> Kernel: Linux ubuntu 5.19.0-1002-raspi #6-Ubuntu SMP PREEMPT Wed Sep 28 09:20:32 UTC 2022 aarch64 aarch64 aarch64 GNU/Linux
> 

You would need to test with an upstream kernel and report any bug with that. For 
Ubuntu provided kernel you would need to report that to Ubuntu as a bug.

Sorry for the late reply.

Regards,
Matthias

> and I have enabled the mt7915e module with "modprobe mt7915e", and "lscpi" shows below:
> https://filedn.com/lv23Kcszmo74qetwMgmdPw8/shared/001.png
> 
> "dmsg" shows below:
> https://filedn.com/lv23Kcszmo74qetwMgmdPw8/shared/002.png
> 
> I want to ask that are there have any solution for my situation,
> just like intel's driver (https://www.intel.com.tw/content/www/tw/zh/support/articles/000005511/wireless.html) or any else?
> 
> 
> Many thanks.
> 
> Sincerely,
> Lin, Chin-ting 2022.10.5
> 
> 
> --
> 本信件可能包含工研院機密資訊，非指定之收件者，請勿使用或揭露本信件內容，並請銷毀此信件。 This email may contain confidential information. Please do not use or disclose it in any way and delete it if you are not the intended recipient.

