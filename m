Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66E70C43461
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 16:25:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18A0B206DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 16:25:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kbrezdJ0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SfUAQosC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18A0B206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gaDDzAuhdJTTUrjjXFef1hcZLVe1asoXZhWYApFijys=; b=kbrezdJ0LzWE8plxZady8UXBd
	ArrSjEyKkr1NtHtFi0qxVZfiWw1vDSS9snLSTuB3DJGTSHAN/X4KiAgogHCo0vFZyKLyQdTFXQ+a4
	zekmdvXwZBuhmVmbuUYxxcIVC1VCKsXSp9UxoqxGIDHJy7eJGPnUTuC00INja/QrADN5MWVF11Tql
	iU/98oJ4s+a+XJpwlgpgV5/1AStayyrXK+uoJdZRmheWaHTXzKpwCAYh+nQvq7dUX6+f9TurojbRy
	H5UXOq9RRGXDGg8vc7zIGVlB6sn1idKFJbFlAWzTRc3HHAaFaDu0sqtU/I/iVAk0QeTLw5mN60TY1
	5M8Ujkf0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGlrn-0007DX-ME; Fri, 11 Sep 2020 16:25:39 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGlrl-0007CX-DM; Fri, 11 Sep 2020 16:25:38 +0000
Received: by mail-pj1-x1042.google.com with SMTP id n3so2830660pjq.1;
 Fri, 11 Sep 2020 09:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EwU8Y8jyLbqhzR3bhbXCQ0ACvEAzu6m47XXNJBX9Eu0=;
 b=SfUAQosCbK7F+CBl7zdFfyy7Qjkzlzjvypp3h40Ri2q0NEVl/DGWoYvfZdf7dNwYZ0
 6B6xVOlk0gV3XYyrHba0XfY7kjOOkUoAEIMopB+FQn8ygUDiQoev3Y9k/nJXlDFz9QRj
 uUimSWYErzEK5C2/KjfjzPBo8zduEKwxDoSiNOYOlpHE/+mCU+CLzFh365uJFlh35ygd
 Gg9F1m55l8xUGHghbggvs/Ns7iKx0lvdHfcXz/3woZSlvyd+1/BxfLeMV29IeiKqCTFO
 SQcfnjeIZhGJSIj/fK6dBl4QeB/0+pkf3cfF7kh0OxsfMn4g5FtTJJnrQWSAY1i64dtI
 Wqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EwU8Y8jyLbqhzR3bhbXCQ0ACvEAzu6m47XXNJBX9Eu0=;
 b=nGiExeq1Oev6PyimYxHxsYf+O6apRWNhn7Lve3jDXpcEfsQwjLf/JwsfXDBTX/NcgZ
 /kVUxUf7vfI+dXi1XSvfVH6ZtFEqPtdiADMM3T4HpZA3iKXW7GiDC54yqws/VhMHvInw
 JV8JGiIsvg2AYhBkmaMWGl4glnUVgp/hCrOU0A6vRUCyMAUzjE1YUK31cTvFn7T/iKkv
 HJJp9zEXrV/15VU+tqsfd7vxH6lqfIsU9nKR3kX4RaZfL1sxB9t5lZS2kKM+b+jniBg2
 vxNMca8GuWucxdHwT2j8yJpuIEHzlJiDitQNJ0yGZxXOYATMKHFbrWIxMrHK7q/ZuDHh
 MtZQ==
X-Gm-Message-State: AOAM533ZwICzODd3s9csV1GcT4FhOFHznltCJnHJ4k30bQzFzl9VHk8k
 mfdcVHZCLEIn3/v/iaUn700=
X-Google-Smtp-Source: ABdhPJwu1Tz3IzRQa+geTq4CMgMqps0FWRGe/wBTmbiN0XYcI0riziAr3xJ7SwNNK4/ShfIMqy2F1w==
X-Received: by 2002:a17:90b:1642:: with SMTP id
 il2mr2828500pjb.93.1599841534976; 
 Fri, 11 Sep 2020 09:25:34 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id c4sm645829pjq.7.2020.09.11.09.25.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 09:25:34 -0700 (PDT)
Subject: Re: [PATCH net-next v5 3/6] dt-bindings: net: dsa: add new MT7531
 binding to support MT7531
To: Landen Chao <landen.chao@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>
References: <cover.1599829696.git.landen.chao@mediatek.com>
 <b5d44dc310a45dc139639d968350f5888dc7e1ac.1599829696.git.landen.chao@mediatek.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <0b414c02-8860-cb0d-2131-de4e04cbf49c@gmail.com>
Date: Fri, 11 Sep 2020 09:25:31 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <b5d44dc310a45dc139639d968350f5888dc7e1ac.1599829696.git.landen.chao@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_122537_457363_1CB267D0 
X-CRM114-Status: GOOD (  12.13  )
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
Cc: devicetree@vger.kernel.org, dqfext@gmail.com, frank-w@public-files.de,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, opensource@vdorst.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 9/11/2020 6:48 AM, Landen Chao wrote:
> Add devicetree binding to support the compatible mt7531 switch as used
> in the MediaTek MT7531 switch.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Landen Chao <landen.chao@mediatek.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
