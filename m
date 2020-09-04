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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E940C43461
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 03:50:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E56720578
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 03:50:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qiRGyBd2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mbjN+uEu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E56720578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oboL1wK+CxKxdjjIbCp3JW3pTQiuVdGpVc7TYnVlAm8=; b=qiRGyBd2zDcwevdI+dlxueUFW
	+b9XPCGBXYh4lcyltUXu+apy57vmtLTVMwXy3khr/iWGzn6YHj7UY+A5yN7/WxqDPMZHvOkxq+xMC
	sdwxFAoeFCeMlJwS7rL/Y44xbDJkWtFjrIS8XMA23+y+Oy9vraraZ3/6drcmsVc6u29MnC6nKhLAV
	lS/gTW4PW08AT/XxA1cWUlR3AAc6rT9UtH4/WXtjWane7l8OnEuCjsbbh4GDTXSyfau5sUMGmgTSM
	5/BJh0vDJxsu44DQQf42OPD4MDRBDL1l481iv2gjBOjXdBvhRn9OpDCaso0GvSCY++tw1dueYF9Gn
	nqGZ5aeTw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE2kI-0003rp-NR; Fri, 04 Sep 2020 03:50:38 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE2kF-0003pm-RT; Fri, 04 Sep 2020 03:50:36 +0000
Received: by mail-pl1-x641.google.com with SMTP id c15so529962plq.4;
 Thu, 03 Sep 2020 20:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oGNQEfbxD8L5+SKSkkpDVif8jO0EN+U/H3irjTsQ9AQ=;
 b=mbjN+uEu++65CWBVV2hmlNl+LzuAG+m+6L+gb9C+kFoMGM4Mw6Wy5bcNxEokxIvjwD
 f/CQDACSSR3mXrh2guPvfjg0wDifTcQ7DJegok0SYGEQ//wjeBpJWWg/qqVLK2sW20ET
 t8F9DgpViSDWBdpi6gc1c8dQ3w4VA+IQPkCT5n2B/EELZj+Tr4K2tgE7OCyUpGKA98LL
 THH6UXD0G0uetveQRdASqZcU8dTFWGJK05B9F0Ki8mUAGBfNyy7ZoIbrSN/pAiOkkuEh
 F7WCrX1pb1y4H6ZSns47dL0tUlHqlAgZu3gWxK0N4mi131qJjIbPVA9iiTyLRgfIOmHy
 QNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oGNQEfbxD8L5+SKSkkpDVif8jO0EN+U/H3irjTsQ9AQ=;
 b=ggAMRnFQSja/S++ymRqzszGbHtMOs9J0ePsqVN/yavU7GHhi7VKwJup9Krfk128vkJ
 1VV4KIf6hu4E3qb2le2xNWB443t2t6npyAexbgh8la0OMYWgP+CJmeZoqXUdVAMk1Uav
 MBwLcvIZxERh9JBMTMYPSyZxmZByFSWFtWGeZtsaE+EIXyxLkvE7AWUbyHCUmW0OWmrT
 Rc2BLUiSL6e7ISutXopYg9+zv/PCjEeWVaUPwjmNXuP3MYK4M9qbhX/OIExtKLdZGyuD
 Fg4E7AV+rHycFSDmM8f1MqJnNewIQoipYBYzBESDLeb3n9LZVNVg6zNeB1s3mfOvtPZo
 0kAQ==
X-Gm-Message-State: AOAM530RcWWR/ojJMXXsZUq0ohhCK3MIvv+8sItXPsEVpkG7jgZBy1vF
 Wn5iGkf28lbXgzwSFR8TQHQ40gLSCeM=
X-Google-Smtp-Source: ABdhPJwRWIRQ4ZdJNLBEGGSskavPO2i9NUEJZrYx3XIkmS429bGh55xkL4u3gCEe5YKhQLGC0HGqzA==
X-Received: by 2002:a17:90a:5304:: with SMTP id
 x4mr5949896pjh.16.1599191433468; 
 Thu, 03 Sep 2020 20:50:33 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id z1sm3771483pjn.34.2020.09.03.20.50.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2020 20:50:32 -0700 (PDT)
Subject: Re: [PATCH v2 06/11] usb: gadget: bdc: add identifier name for
 function declaraion
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Felipe Balbi <balbi@kernel.org>
References: <1597923046-12535-1-git-send-email-chunfeng.yun@mediatek.com>
 <1597923046-12535-6-git-send-email-chunfeng.yun@mediatek.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <0c2122aa-9b77-559c-06e6-4caed58b2053@gmail.com>
Date: Thu, 3 Sep 2020 20:50:30 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <1597923046-12535-6-git-send-email-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200903_235035_905380_6A2848D8 
X-CRM114-Status: GOOD (  12.05  )
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
> This is used to avoid the warning of function arguments, e.g.
>    WARNING:FUNCTION_ARGUMENTS: function definition argument 'u32'
>    should also have an identifier name
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
