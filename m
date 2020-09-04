Return-Path: <SRS0=heX2=CN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82399C433E2
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 03:49:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 490F12073B
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 03:49:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dIA556FE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tyk6us76"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 490F12073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Dm0bFnBvaB3F4Tg2stosacfndxeChCB956E9ln1nzWc=; b=dIA556FEugVkdwX7UDgZqXv72
	5fwtSHVfumxJE2d78PVqyH+t7VMfyzNQgq5MXYJhXIxx0J4ssMkix4dfCLE0eP38JCEz9ugEeOS75
	hYjcY3r0QjAu/qee/xD0Jqk/lJRulgsoJtPMXHFn7Ewt+wF4rATiaudh/7Rkdhdk5l3xqddIZztN8
	xMydFHNFhE96aPvAl/+OriN6ZlMemF1WgkGQmwpaRbc5gOQPg+IAVGXF/8bF7q1KxE/RKgzccsK+Z
	ueawTK/QopOT+5fANkgBhRfqeU5T0WsxGa7nVNqx5ZElfqbNXL8qj9uN/3bOF17IJzshwyqT+YMxj
	WBPXVLhSg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE2j4-0003NL-58; Fri, 04 Sep 2020 03:49:22 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE2j2-0003Mi-6m; Fri, 04 Sep 2020 03:49:20 +0000
Received: by mail-pf1-x442.google.com with SMTP id f18so3861294pfa.10;
 Thu, 03 Sep 2020 20:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yUwNeEcHskKzWXeX8bUdAXXsdwwyVt0UyxCmSAJpfmw=;
 b=tyk6us76VRM4mNiW0Eg6ePdDKdKOGwiBjuyTBC7Z3460Na9zVaSTCOUrjpfiUqlx0U
 kplUyxRHHyR4whbnU5QO/T3CuIXW7sOSDRNgKjmZZNRS/X8B2ID9gb0xlvWUmaQLF/MM
 x77Zs4doxxCKG0YalXTsYEFr+Qm6d8CpLImz4sjf+rJyoO3//GDoVj7um1EkWmuT7N/J
 0XFB/5jphJEuKY3Pv27sScIGzwJY3VO043Sc8C7DoR9OjtstL+u4GAqIZKVi/KK5Fe9J
 MOPxj5sSp052Key0MB0ywJl6JOsqsMo91tyOPoN8Cu87dIb2TWfvsoyr1m/oIiNoszg+
 WLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yUwNeEcHskKzWXeX8bUdAXXsdwwyVt0UyxCmSAJpfmw=;
 b=fa1JKuYv7b4mUGjTqqzUaWyQ1rNhR8ZJ/xstX2yM41QLGPSlgZOqDNpLtJzdd+DOjn
 g9NExUq4WMRza4FOrNyjWWMAHp4R8QEdVOOhuIiiaz6WchsyYTM2BaroujdLS4WYcwee
 6+2mYFY2GVU2HKQeVopfPw2hNXEIrdmFWQ7Rp6LAY3H1en+lNJvJpVHtEStcgcYQXteU
 5S7u83xPg+DVRwLQtu9ziLzregG5uT7SprTOa1l4LNlgIetWQvoqTsdR2inA2gDjaMVX
 Kt5N2X+UJ4t/QaOInC7iKfTR5+/hhqkdbBRFeNQylSlTnScBpVh4BrmgHll311Pz1qZz
 tY6A==
X-Gm-Message-State: AOAM533IESfRnWKFMLID8iRZ4TY3UIZ9x3UuzsaRGd82LCjfinmTSs6L
 Np6OJ0WqjmyqDfh4BCmjHluTFRIH0TU=
X-Google-Smtp-Source: ABdhPJw/eSFC88ac0saM3t/fXQyFfUeCxGYnQbVZj3Us6hTMEURv3VFykxvAb+PJBLvFU9K6D56eKQ==
X-Received: by 2002:a62:14ca:: with SMTP id 193mr6553252pfu.13.1599191357764; 
 Thu, 03 Sep 2020 20:49:17 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id l9sm4481197pgg.29.2020.09.03.20.49.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2020 20:49:17 -0700 (PDT)
Subject: Re: [PATCH v2 02/11] usb: gadget: bdc: remove bdc_ep_set_halt()
 declaration
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Felipe Balbi <balbi@kernel.org>
References: <1597923046-12535-1-git-send-email-chunfeng.yun@mediatek.com>
 <1597923046-12535-2-git-send-email-chunfeng.yun@mediatek.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <0e482eba-7f5d-ce25-8237-ab4c4278e0cc@gmail.com>
Date: Thu, 3 Sep 2020 20:49:14 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <1597923046-12535-2-git-send-email-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200903_234920_261163_0F0A3921 
X-CRM114-Status: GOOD (  11.17  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Peter Chen <peter.chen@nxp.com>, Sasi Kumar <sasi.kumar@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Al Cooper <alcooperx@gmail.com>, linux-kernel@vger.kernel.org,
 Minas Harutyunyan <hminas@synopsys.com>, linux-usb@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Colin Ian King <colin.king@canonical.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 8/20/2020 4:30 AM, Chunfeng Yun wrote:
> No definition for bdc_ep_set_halt(), so remove it.
> 
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
