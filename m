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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6680C433E2
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 03:52:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79F1820578
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 03:52:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sl1jtP9a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gmA3kU4T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79F1820578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BoHI0LHniRe5WYtyroW3s3BPZk+L3CbzjNpsU6/4Eyo=; b=Sl1jtP9a8N4PndXNXxuwbY6Tl
	6/pDDzhwr/mQgmr7/7K/GXnfstm+05QNz7LURz29fqoSgjnIzqetZbtWE5B8aTinmlzb4jkTGGogG
	Fyl6TSOVH4E8lzNSRD8Bv+dmB/tIAzvG6BWH8dgDakiAh+vCd8ZJBH+/Q7MrUBKxqcD1cGRIBufWe
	BfPI0VsuMfoV1EkD/EKH0Pf08sl7nf15qp7RPTYv0kqX4/BoY+JmLqcu1SbL5ukEG258LFXv2eSzZ
	DY8/A8gPvuoJ6x6XQSmQAfTfSofpV+N153BHwQpwQtENCvTylr1lMCyzntH7TAVXHsS58pskHx/bV
	tbxQwYFBQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE2m8-0004ek-Tu; Fri, 04 Sep 2020 03:52:33 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE2m6-0004d1-TC; Fri, 04 Sep 2020 03:52:31 +0000
Received: by mail-pl1-x62a.google.com with SMTP id k13so505887plk.13;
 Thu, 03 Sep 2020 20:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D8+dXqlq7CKk0oGRc6xGzRKcimFBOeMe8F+MCDfQRRo=;
 b=gmA3kU4TWCQikM00zN05xdt8pvCTIlIo2eld9t6I53hbZbjeWZs540D5QwYw9RUzd/
 mXDOQLNzaohNpG6Mk+3a07L+6YTpYtytDQrV1Mz1WJ80FTCMDKyEUw+918NpYGdzspLY
 o5Ke6zNLbMS+UDgf6oeJRGsNADSDCBmUV9M/OlQoRiRNRpz2e5P+h1OjZpY+B7dmOJbD
 R/oEIOO+zleg6647KpFBOwMYDveuLtcLiTsUf1C1o9JMEcsnSNBJ+SdaH3bkEFyBaO74
 3nsRhlv5jvhDGzfLYXMOYEBoaO3+vqdXr0BQWziELCA5t73e9/ERFPyJ46syOG0ziHJM
 wTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D8+dXqlq7CKk0oGRc6xGzRKcimFBOeMe8F+MCDfQRRo=;
 b=MxKlZxy2spR6ccEvVy2BJiN2JIGFGABdsvzSNz5d5sjsReUUgJff0hB4Mcp9TFJFvJ
 fMEXXV6FsqcoyQvsBh6b5ebvIUXg2U5qUSp4nAG8gNsg9ekuINzwf/AoMbgOLNIZjTXe
 r30sTOEm/be3zeYnM0qH3iweR/MQYxvNeacuHFiHtHNiynq9I8sOXVd9xY74QBC8stX7
 U3Z4iCr0WEInBe9wMpAGLrrIHxKV4FutBd3cV8vNQyYj8CvXCW9l9kyP22X/9mHvJtuC
 Es9my9G1AUOArk+X1FJx3WFbsWz4RRTXoSrwOOFZoP1MX1w9E7KBTsg/2+zvVbFCvq1g
 Glug==
X-Gm-Message-State: AOAM532CnV8fXTPgh/0pL75SxD+TGDTqOEnYxrgBEsSjD+EGY1ysiy3A
 cakYUh0V8daP9fbJgsxf00/gqzy0p20=
X-Google-Smtp-Source: ABdhPJwOSSrfcreYOMbh7Tq5PAzkMTqnCDtvKkRUYfeT541l5BaHSPFTYA0FvUIbahv+r9MBpurdYg==
X-Received: by 2002:a17:90a:c917:: with SMTP id
 v23mr6100864pjt.97.1599191548405; 
 Thu, 03 Sep 2020 20:52:28 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id a27sm4686215pfk.52.2020.09.03.20.52.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2020 20:52:27 -0700 (PDT)
Subject: Re: [PATCH v2 10/11] usb: gadget: bdc: fix checkpatch.pl spacing error
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Felipe Balbi <balbi@kernel.org>
References: <1597923046-12535-1-git-send-email-chunfeng.yun@mediatek.com>
 <1597923046-12535-10-git-send-email-chunfeng.yun@mediatek.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <18a38804-e68b-389e-02b6-2769e74d3f9a@gmail.com>
Date: Thu, 3 Sep 2020 20:52:25 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <1597923046-12535-10-git-send-email-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200903_235230_939096_23FA1626 
X-CRM114-Status: GOOD (  10.89  )
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
> fix checkpatch.pl error:
> ERROR:SPACING: space prohibited before that ','
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
