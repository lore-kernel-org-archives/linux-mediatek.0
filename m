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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D64C433E2
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 03:50:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE61E2073B
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 03:50:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jlmT3Eoc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SdpBnRg/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE61E2073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hEEv9WsgdqPHv0ZRAmzZSIXiqaF1zpTe2XvtD9mLtfc=; b=jlmT3EocRprsWCQDmHc1UtsJ+
	5ykxowCkU8ANjeJQ8o/agvsWYR0yshpKc2B921gsZAcjj7fE/fOfhRa4otYIkSpA3Rpcut+YRLqdz
	jb71yuCMpEEyflYz24BftUCnDmeIlqDLi3564ASlOnuLBN5jiR6F+OQprnuKjdHH1OMP+EmD6X23k
	luAAvdTx2Q6bAEnL2uLiBW6V8s0D8yBcIK20HTRZ4QyVg1I8dsjbG/UPem6U8xvAFw/bBGjQ7COh/
	DRTUdAUNia32Jvr0ReMAq9xDpi2xTwsruxqtrzpQFzjgSOfq07iMxZgx+ozeEpL2m0R8a+ZWxD6JV
	tT15zjMkw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE2jv-0003ft-VH; Fri, 04 Sep 2020 03:50:16 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE2jt-0003e4-Kk; Fri, 04 Sep 2020 03:50:14 +0000
Received: by mail-pl1-x634.google.com with SMTP id c15so529597plq.4;
 Thu, 03 Sep 2020 20:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QYGHSoSafVtyuMdTLqi7XHoNGOUoxbP6OoKTyB4RHfY=;
 b=SdpBnRg/CbI/ZFFB9meyVHXSbhZHH2jgT4bZCpk3/zSCWVyfQ+lGF2oUsAvbNK11xH
 sMaKDPnHcqiUn/aSrzOL0Dx6CYrIQHLxPa7ed1AkuiymCJbBdpBO5FgcH+fW2lbqac1J
 KlPq4HgLwFgutEZrRr0IzHpi1/gODSXxQDedOqpYKyVBcP9lpcT9ZZwBbqX+zxyu3NHV
 9E6oyLZ9eX1ub9lzVVic34QdPDB+FvtR3yn8wNtYbqVA1k9O7xei+Q7SnebI9Kxd/PUE
 b28k7lFGmCCYczdwAwxdP3hGty5UHphW5jvLeooPFARGbhTfKVODDeK8rR4PAyi3y5WC
 zrSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QYGHSoSafVtyuMdTLqi7XHoNGOUoxbP6OoKTyB4RHfY=;
 b=UBVUQX2Y8OJ9o0jzDmHWzmO0DofCRV709Wv/v3j2eL5hqydiFv76N5NsLwjW5WeRhg
 3UEg9rGwJYerJm7twfaCjgMsISpW7OUCwut6uYesKD4fkagQxkBMiNxrCireWaNM64I0
 gUafKhQnPKTJaRh/Z7rutGq/+GH/oYCQwDJdE5SsDRu6t3ubFEPPnterFulHLlTdnFsm
 ph+VgPD3oeY2qQfTh70mapWgOg+BYzY+vIyNYONd6StxUucMMDeB6lRoAH4wvaBb1qDv
 0goTWvCxn/lsye/nN8RTFdu+YQhSeA/4rwaIo4VGB+yvyy9epFCcEtnKplW4b2KVzfUc
 KKcA==
X-Gm-Message-State: AOAM530r4Efpi+EEZZCD0SG/At/m0cHxhV8ZvX0xPvze8vnllL5r8yvU
 AnNZb1pIXDwB+V6/lSgygmZigjgnyGY=
X-Google-Smtp-Source: ABdhPJyEu2t2cm7/oGcJv7wfAIGt3TQlttUJP59Lrch6Eiy2YYYXi/9kLmjyn26wli93WxE5scYHwQ==
X-Received: by 2002:a17:902:c408:: with SMTP id
 k8mr6889197plk.102.1599191411088; 
 Thu, 03 Sep 2020 20:50:11 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id d77sm4831886pfd.121.2020.09.03.20.50.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2020 20:50:10 -0700 (PDT)
Subject: Re: [PATCH v2 05/11] usb: gadget: bdc: fix check warning of block
 comments alignment
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Felipe Balbi <balbi@kernel.org>
References: <1597923046-12535-1-git-send-email-chunfeng.yun@mediatek.com>
 <1597923046-12535-5-git-send-email-chunfeng.yun@mediatek.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <92ab47ff-4aef-1bca-e21a-0f6bab3210cf@gmail.com>
Date: Thu, 3 Sep 2020 20:50:07 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <1597923046-12535-5-git-send-email-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200903_235013_718928_B63AB2F7 
X-CRM114-Status: GOOD (  12.51  )
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
> fix the warning:
>    WARNING:BLOCK_COMMENT_STYLE:
>    Block comments should align the * on each line
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
