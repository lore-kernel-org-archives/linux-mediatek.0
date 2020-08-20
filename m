Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D10DC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 10:14:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D72B2067C
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 10:14:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RObLe0vc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mQKGf1p7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D72B2067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JDk23EzWMvbyLJQIps+uvW5DJTJ+YljHtvrhS4WPnQY=; b=RObLe0vc/D0ee0PnJwO2eO7JG
	v1o5Yjk3QvHdW7fk0fHJK6HOtOKGM2qkRR2s5ifdcL7r1Mdp0T9UwtX9CB1k7YLQC7E+HmUpimkZu
	2zc/60X/f/IiaB57BGF4Vnr5NLmbkhyU745RMXYjyL9E0Oatob1c0XB1+cvh90oTW7JLGPP/yNYSw
	xEmSb7TCZP4itFCC5acGraopRpalcD1l+FNh/gQjOZXIKhuEaProvWb/JT8GEwIzuq2VsIs4eiOWZ
	sQ5eEIXFeflyLJ6pfa0Re4UGNjXT1mrjCOv6LIv+c9izlmNA/GSf954XzkUPC7GwSwenl6r0+COct
	hFUlS58fA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8haq-00071v-1G; Thu, 20 Aug 2020 10:14:48 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8han-000717-Qc; Thu, 20 Aug 2020 10:14:46 +0000
Received: by mail-lf1-x141.google.com with SMTP id j15so644591lfg.7;
 Thu, 20 Aug 2020 03:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vIqpTmovFa8dVc4Ln43GhodOHY6DYWmxTNMxOIaUSmk=;
 b=mQKGf1p7s26/YEZUJCDJw1Tu7tKxQjJkJbGshc8hEqWQ0aPATF1nLsD1c05MqNppYj
 F7jcqy60M6TktK4f2Wp3LLFT1sdbnUNe/NNDlql4uUI1NzKxREGwwFn14IbP8avMucma
 r9jei4zpVrMjL61VyCyH6hwunwyHB68u3Ls8drUYwxNlUC1ZYwt0nNupTO+1jIVjCjVe
 BD9MynVK7jENWyxu3sjHrYYu1efw/Zbd4cm+0zg7DEX2+v4oU33KwNy5HSJcfoWUuTsw
 wp5JP6ddhwrgggtUAiArIdP2nV6uH9hU/1rYqQh881fcMBGyenh6aClx2abnWiMyMlR6
 LVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=vIqpTmovFa8dVc4Ln43GhodOHY6DYWmxTNMxOIaUSmk=;
 b=kvW50KhSJkV4Fd6NoQWhmKhd0uBUp0YafKjoX8Bhn2iZjhbZ+CUxbdx+c0Y2LGMj9E
 fQu1UByt5dQgMvKzomp8Psyw2zqKKxTcRjb3HkqufrvfofFLb/fWHkQg+cEIjamBaRnD
 48b9CA6M4nXEttRL/TrjRTMVIEbua+roH4BkG7w36fuaobG2OFfNtpQCnWc0L6zyj1Dk
 XoRG1gAVam5mtJ6Xeun4Bqrbh/5OwdaphKqrWZqz2/ba92pz15S+xkIej2g3ldCm6KzG
 ubWa/WajCUHKdu5Ue8kI3OKcy5hij2iaYcXiQA2BCQObQf4amGbkVPtXOWXkM4R6ah25
 DZTA==
X-Gm-Message-State: AOAM530IjatkBUKpGID/6XBsABfzCjBZc1rrVZ2ozdzpF8YIYEofCWFf
 hvIFF8tbFTTiWt7hxhKAZDQ=
X-Google-Smtp-Source: ABdhPJwkqxUCR2HlVxBFdk4S2ON7cs2z7amFEy/eH3RHaxNifp9RAtkK3fIzcr28JtSp2B8dyQlCSw==
X-Received: by 2002:a19:c894:: with SMTP id y142mr1226308lff.74.1597918482964; 
 Thu, 20 Aug 2020 03:14:42 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:42ab:a165:4cb2:5f04:a1e8:63b?
 ([2a00:1fa0:42ab:a165:4cb2:5f04:a1e8:63b])
 by smtp.gmail.com with ESMTPSA id a12sm400511lfi.83.2020.08.20.03.14.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2020 03:14:42 -0700 (PDT)
Subject: Re: [PATCH v2 11/11] iopoll: update kerneldoc of
 read_poll_timeout_atomic()
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <1597902349-8998-1-git-send-email-chunfeng.yun@mediatek.com>
 <1597902349-8998-11-git-send-email-chunfeng.yun@mediatek.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <49de5eaf-9870-522c-b1f2-037ecb122237@gmail.com>
Date: Thu, 20 Aug 2020 13:14:32 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1597902349-8998-11-git-send-email-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_061445_909415_E14E5DA9 
X-CRM114-Status: GOOD (  11.38  )
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
Cc: Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Alan Stern <stern@rowland.harvard.edu>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello!

On 20.08.2020 8:45, Chunfeng Yun wrote:

> Arguments description of read_poll_timeout_atomic() if out of date,

    s/if/is/?

> update it.
> 
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
[...]

MBR, Sergei

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
