Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68045C433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 10:13:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D40D461864
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 10:13:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D40D461864
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mAqWw7gleka4NiQNBwNzUzeMwkjK121OVNe+bwB29KI=; b=g7lk9JqhMm9YB1/Dkof0+6Pd0
	bTxgbAdvJAHB1pkqlz95nd766hW3hbnYg1dXnJs57nCaWJzmFQbae3ArzpemgOaKuXn5d83/ruZQ6
	AbKXE6PyiNZ6D15BZA6a43OO5wLFqC/SL/ztvUr/djZUbWYNl2IVk/GVNT3Oa1KR7zPLu7d5NksnM
	KErLFP+FMdLs6VDM5of7U0DoMxAQwUcZNVen8Ptnk+nIO/mtwB0g+e9WesuL6QN9MHPOosYeb8hZN
	/kwFJbu7ldVUNShpFSiO/lD18geMvRT4unJpYZAHBOLsq7oPUhs7xgZS0ocDQqnONWVMzjyjEBo7/
	S7hoKuozQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRBNW-003Muk-Nc; Tue, 30 Mar 2021 10:13:42 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRBNG-003Mrm-AV
 for linux-mediatek@lists.infradead.org; Tue, 30 Mar 2021 10:13:28 +0000
Received: by mail-wr1-x42c.google.com with SMTP id x7so15650551wrw.10
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Mar 2021 03:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=N3QQZsZflFucV4DURyJuTTDXCytw9UwZ9R/7WDERQAY=;
 b=VAu7ljFJ5YxUQYXvK3YApCUAZPjRwxWtlRxoyTcN+yu/AYrSiHKCeymNEtac1uQM50
 VxTpZQrTFhDsK9W4mMOXnxwikjDQf/Z4DONt4xjN4jEuvOPZprzh4VwDPHIh2ShDqp1K
 8IfGb+B8aj6iB18HmuGX4nZ7C53WZyJRKsr4EHYC2my/lM9mprVACqCUlbOPiPsk0/OK
 GK0uvxh98oaOoNjvTZn1MhCdpfJSuWH7MMp0YQpvZwwzAZg/GhMOH0oE/OCG36UqkWUy
 soMwodUUj3I704VdadpB+MCurfApd6ovcMATGx/0p8jcE9LlF1w35UytgyfF5y5ZtSVN
 rp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N3QQZsZflFucV4DURyJuTTDXCytw9UwZ9R/7WDERQAY=;
 b=RJZkovkVxr+o86cQSYdOXSS0Hmzq3qSDwDzg2jD8i0qMJuJVL3erkJXbhGtYTc/LJg
 PCtJ483W6zTGLYgXyce3nd8XBqyrEZr13e6emevinJ9ET1uiBaOrVZGnRgosLSoPo84S
 3qpvn1S5lL1gaZjV+IlasEl8jpTbnqAzmWIa6NaLL6Z4m33xgxE0j8EaRX9M2zN1RHmp
 cv+NPHetuSqlFU+CqYeJP8blgUNVzXxsuvaktmCZFBdxWVCMI2+3A4evdtvocecxmztn
 XhnUMV319LJIf4Q7TMy4CeH6ZbCzbB9BOIAyQskSBwKX/47/lVdbgX0kTwuASk6TSseQ
 g6wQ==
X-Gm-Message-State: AOAM530COwX4ZQK+pwkmSUOwQ5hwfKVHwUhz6uJLlimi3j+qtgTx9TLm
 bpN150G9VQ3EIK/jJC3v4QGtb82N3Wp39OBV
X-Google-Smtp-Source: ABdhPJz+5cJuChn/BuaV/VBt2uygsuyZTcVXyKjCMuPLplgYeO+RF82T/UyEaK7IKhMZoBkM1DzLew==
X-Received: by 2002:adf:f2c3:: with SMTP id d3mr33354355wrp.380.1617099205219; 
 Tue, 30 Mar 2021 03:13:25 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id c11sm33777920wrm.67.2021.03.30.03.13.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 03:13:24 -0700 (PDT)
Subject: Re: [PATCH] arm: mediatek: dts: activate SMP for mt6589
To: Boris Lysov <arzamas-16@mail.ee>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20210314023735.052d2d35@pc>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <cbd0a352-a78d-3cbc-ca1d-489206439ef9@gmail.com>
Date: Tue, 30 Mar 2021 12:13:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210314023735.052d2d35@pc>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_111326_550741_4507007F 
X-CRM114-Status: GOOD (  18.42  )
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



On 14/03/2021 00:37, Boris Lysov wrote:
> This simple patch activates SMP for mt6589 by adding the missing
> "enable-method" property. After applying this patch kernel log
> indicates all cores are brought up:
> 
> [    0.070122] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
> [    0.071652] Setting up static identity map for 0x80100000 - 0x80100054
> [    0.072711] rcu: Hierarchical SRCU implementation.
> [    0.073853] smp: Bringing up secondary CPUs ...
> [    0.133675] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
> [    0.193675] CPU2: thread -1, cpu 2, socket 0, mpidr 80000002
> [    0.253675] CPU3: thread -1, cpu 3, socket 0, mpidr 80000003
> [    0.253818] smp: Brought up 1 node, 4 CPUs
> [    0.256930] SMP: Total of 4 processors activated (7982.28 BogoMIPS).
> [    0.257855] CPU: All CPU(s) started in SVC mode.
> 
> Before this change CPU cores 1-3 didn't start and the following lines
> were in kernel log:
> 
> [    0.070126] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
> [    0.071640] Setting up static identity map for 0x80100000 - 0x80100054
> [    0.072706] rcu: Hierarchical SRCU implementation.
> [    0.073850] smp: Bringing up secondary CPUs ...
> [    0.076052] smp: Brought up 1 node, 1 CPU
> [    0.076678] SMP: Total of 1 processors activated (2000.48 BogoMIPS).
> [    0.077603] CPU: All CPU(s) started in SVC mode.
> 
> Signed-off-by: Boris Lysov <arzamas-16@mail.ee>

Applied to v5.12-next/dts32

Thanks a lot, hope to see more contribution from you for this platform :)
Matthias

> ---
>  arch/arm/boot/dts/mt6589.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/mt6589.dtsi
> b/arch/arm/boot/dts/mt6589.dtsi index f3ccb70c0779..70df00a7bb26 100644
> --- a/arch/arm/boot/dts/mt6589.dtsi
> +++ b/arch/arm/boot/dts/mt6589.dtsi
> @@ -17,6 +17,7 @@
>  	cpus {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> +		enable-method = "mediatek,mt6589-smp";
>  
>  		cpu@0 {
>  			device_type = "cpu";
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
