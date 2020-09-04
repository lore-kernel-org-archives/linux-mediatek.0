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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 980FAC433E2
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 03:48:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E8E0206F2
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 03:48:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NkL6A9Hy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mb+Hl9XG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E8E0206F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zg4NhVW80RWjYdXabntnnG5YxfzyXBkhGn/CsF+h0jw=; b=NkL6A9Hy7eKPzu3VAz2uKlsWi
	8RpepauHOigDPesonfuPJzeKx9znIV35v00+hjNnHHNhLtRdAM/Ha283yGNe6a3iStWWi+B5B4I0+
	FXRLDhZTNrsPF2dtkbEwilKuoip7VVuG85YjcC/OuBEPHJ0FTvAhHtjG54/eQ7FFs4h8i4p8X0Xqa
	qQwd42NOOg1Mfvtvc6LqVWNzUnMtd9zEnKdfVnGXBLbQ+5/j4quglv7RF/ABq7uxZ09RjokYLdP1F
	mqAMSmcOXmtSe+pcXY2BIK01VB4ADeIDNKl2nzTED5AN1VR0ICNIps4USfOZI8w/xALkbWP2zJX9t
	g+BKfEYrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE2i9-0003Gi-Vt; Fri, 04 Sep 2020 03:48:26 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE2i7-0003Fu-N5; Fri, 04 Sep 2020 03:48:24 +0000
Received: by mail-pf1-x443.google.com with SMTP id o20so3857387pfp.11;
 Thu, 03 Sep 2020 20:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LLqMfP2X1w4/jx53zQazins9pmX04Mu60TQfw9itrD8=;
 b=mb+Hl9XGSjFDxPd2p1f2pWmrMALZyTgnOGltZSsAKY+ceyLlc25uoUfqCfv4SGdZ00
 2BzApt7dNMGm+qM2lH5spgflbHWPIL3hTYvYi7oTiHQEgy1gnoriuYH07qsaYIcDXcxe
 YqNwQkWYLjmcNDkwWgO1c8/O4/aOD19xb59o8nsrrFITpflaTq1Z9MOI1/aEMHLEo+2n
 4mP/M/E62GB5R5TVEOnbfSEtgoggO2tp/eNAXS+OECnOsToBoqM30yFjE27oXhgd7/2D
 36ReqsHdWTuMfW512oIc8gHkBGvfq0holRoO8LXq/p2yy5uTS7h9k+nBo7S5wAtodOht
 P3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LLqMfP2X1w4/jx53zQazins9pmX04Mu60TQfw9itrD8=;
 b=qtHFw+KYp6ahLr7vN9a9RaRUthizbSF6H8Mz0aXEakI/8q5G2hFz4ir30fejkFgoPG
 9pjxVqDxwauwldTGpsPbkCX9BtdO5Mzyy4mQ+SdrYvqY+cMW9Y7lWn2p8F1EzLbUTjk+
 veXbK4htvxJsAQSmaVVhKPlbM1hHwzEtBH053ztpPe7NhZxWxOusCZpJwLUvouNsAE5l
 ZG8HwQi1GkJAH8jy+zkrmR0w1S5Li+DIFGPPCpkXCWbE5pQglYkGta8O9lkxNMghTAJi
 fFyWYuDvfBOdFYIV/cV0yQT0Um9xP5wsGn7IRWFpEi//F6TsYPKYkUs6LFRNG8vSwI4+
 95Rg==
X-Gm-Message-State: AOAM5318o5wZTRIILsuXstHNrxOcBlROsIuB/mfIW5l761a+xtDNjIG+
 0iAsJY+LSsAWIe7McUHU+HOuCiJde6s=
X-Google-Smtp-Source: ABdhPJxZxpzdB4FVjwyhMcw6LmWXi5pm+av3ieAQSNIpqfV1v7ZJR5459FGAK0H8X2gf8VjSQVuWzg==
X-Received: by 2002:aa7:9582:: with SMTP id z2mr47814pfj.257.1599191298737;
 Thu, 03 Sep 2020 20:48:18 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id n11sm4224831pgd.2.2020.09.03.20.48.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2020 20:48:17 -0700 (PDT)
Subject: Re: [PATCH v2 01/11] usb: gadget: bdc: fix improper SPDX comment
 style for header file
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Felipe Balbi <balbi@kernel.org>
References: <1597923046-12535-1-git-send-email-chunfeng.yun@mediatek.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <4ef74f8d-bbb3-2503-ed3e-8b5ce385a7eb@gmail.com>
Date: Thu, 3 Sep 2020 20:48:15 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <1597923046-12535-1-git-send-email-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200903_234823_792335_9A42D5F4 
X-CRM114-Status: GOOD (  12.22  )
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
> For C header files Documentation/process/license-rules.rst
> mandates C-like comments (opposed to C source files where
> C++ style should be used).
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
