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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C48B7C43461
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 03:52:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A0EB20578
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 03:52:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HgozO45f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D//pq24z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A0EB20578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=34J+Ql6CZMSIuvKNlaA9pLWx0ShoGCUP7obZOzJq0JU=; b=HgozO45fdIsBxzspD1Fs5w1TH
	emjVb5g5JCGd5BCejcndcS5P0cFQaE5wRHT+oaSzeFQJlrjIuhyqvL1sZ1FlSUEdo2JGpyFUahAQg
	TRbXgT5zLR9hbVxO9Aq5kye4nUsEteS825CyUwlXSJbPi9JmOdvNLy5Fxzj2GsJln0FGjsvZZl0O1
	N9sGeC+s/ZkYaoFWp5jtFLB2KR+Boep6TJ0KB47f9Nc1/F3Yq74ebCa43dyXKVuUBLyekU3SvAOeq
	NcRscpw8ZWzVsHkgH++ISwyXE5m9sn5At4FPquqDZppRI2mbXgLyAbmQ5whbv694AfeKz0JUTdWwx
	SWIqAmAuQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE2mO-0004oc-G3; Fri, 04 Sep 2020 03:52:48 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE2mL-0004lq-Su; Fri, 04 Sep 2020 03:52:46 +0000
Received: by mail-pl1-x644.google.com with SMTP id j11so516158plk.9;
 Thu, 03 Sep 2020 20:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VvSpWCtLeTgX2Zx+CTqO44Oc9ZtJWYEJgi7S5Gg+F+Q=;
 b=D//pq24zw/pLfyx4maLjLfQ2lDUCmLfZIrixpT98Wu8GASO9f9vuVwrx0f1N1qlX1w
 YqVenwj86pFYV/M/r3ukmeXThynu19mRVAysI8G/vM1jijsn1Izw80UFcaDclrNdW/PI
 bM3ThpKHqrMK/ncstGB9iOUnR3UrmxFHVIVdixqAi1fOU/6vFMbNI+Tusesi7dfM6rWY
 JkuqXSy5+Hx29rYCFAciwVsccWgabdIffrcsSrZrhvTTPw5Vd3jjw9ETdso048+ADvsA
 uugPwym1ZNzWPNxXL6lr1EDMLSoVKL2Y9PIu/yezuk8iC2zTxi+MxIzod9KEdiDcHtRn
 KX4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VvSpWCtLeTgX2Zx+CTqO44Oc9ZtJWYEJgi7S5Gg+F+Q=;
 b=kHcBBILalooCaqER2d7wL/h9yPJ0icmpfSFPy6usMesxDq0LGFJ/Oc6gulgkLLSVjh
 zKem/yzNweMcN+okrtSuoeneGagtdX3ZqTc0jcIsHyq7ckFQy+09/2B4JOsEsOmlPUSY
 Uj7CL2sC1e/VJOa3K3EgaYevwuz1PmJXvPD+CMgYA0w5bvbxRfXUtA678RKX3maiv2SH
 9MkN53DwsYxWdoxDm7J+uWJ3ncL9nwgCbv7BK3+AsDgmTUcywsLFet2V38tCcvV11Jox
 S/xJKFgAuz5apKlLKd0shMAhVPnO+QlPUuNH0L9GpUU8xlcD+TvM9oFLSrUVFviVSacs
 pGTw==
X-Gm-Message-State: AOAM531EHAMBr9/7i3WhCE+tV54CWXP7tB1M17CCFfAXKe1jjYWu0nIm
 mmHhpP7qRaIi+DKw7hjsCzLd5/twShQ=
X-Google-Smtp-Source: ABdhPJyPpWgFNMgaWgZ1pBVMj3Sq4TQT/soa1h/DJjgZy4i7vCeAoxj/zISjbwyzKuU1XQou06cPJw==
X-Received: by 2002:a17:902:7808:: with SMTP id
 p8mr6858602pll.122.1599191563632; 
 Thu, 03 Sep 2020 20:52:43 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id k20sm4799735pfu.197.2020.09.03.20.52.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2020 20:52:42 -0700 (PDT)
Subject: Re: [PATCH v2 11/11] usb: gadget: bdc: fix checkpatch.pl repeated
 word warning
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Felipe Balbi <balbi@kernel.org>
References: <1597923046-12535-1-git-send-email-chunfeng.yun@mediatek.com>
 <1597923046-12535-11-git-send-email-chunfeng.yun@mediatek.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <c3fc8267-b4f4-21af-8319-fa5b17216c52@gmail.com>
Date: Thu, 3 Sep 2020 20:52:40 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <1597923046-12535-11-git-send-email-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200903_235245_983800_C520BA9F 
X-CRM114-Status: GOOD (  10.91  )
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
> WARNING:REPEATED_WORD: Possible repeated word: 'and'
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
