Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9C2C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 22:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/N/aXZg/ugRiTyHLDtv8QsJaetFQFjEErGPMFO4www4=; b=MJMBjZ6WORWO79HzpS9leRitcI
	Ows0ioM94F5Ia4x9cRFx+lZHWfow4K7MehgcDKowDeogt23jy7Jwvp5rCZrVlg7pz2lL7coAwLh6c
	R+gwuqf2c8PfFsHHcbDKHxbjYkRI50qt6fAwTqlN3ll1uhp+EmRpVWiIDU6ZlfH/08ZyZncMKgR5a
	wasvjOeWnxifpBuVuXuny6xGaR6aS3Sgd7ZBEk8rxVpbNOeuK6ih6hJGNeUB+7JDwktpZKvvzOovm
	S7KFSgB4JFIPdpBTiHIade/Lk8KMDrOHnnhij0GoRmA/gvle9TRW6hYMsDA03H+QKOqf4ZUpEPyCK
	mOkwe3lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8T7k-009Re2-2Y;
	Wed, 29 Nov 2023 22:33:40 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8T7Z-009RaF-0h;
	Wed, 29 Nov 2023 22:33:30 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so251519a12.1;
        Wed, 29 Nov 2023 14:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701297207; x=1701902007; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/N/aXZg/ugRiTyHLDtv8QsJaetFQFjEErGPMFO4www4=;
        b=V+1Gs+YdbDWJNIFkDMTP2WHOOdKbaEJJrevz4j8r5S1umCuJgdlKEBFB+fU2oSCRRG
         1aoUxs8QjwC1jJx3zmvP9rcIZYnsLkQHb21mKYV2RWH3C70CAi4tnT9kq5N2HIyQJvGb
         30735F+qf1l3Y7CfsSEslhuiow8CJVHL+SeNLnlQDYPjmB5PuL7WjLj1PJUSOs5wSMos
         TjgkcYJJC85K+hvv5JUxq7rSe/gaAnu00RWwoTLV4UVl+FMu4uPmFRRBLItVs0tVEGLS
         kY9wcSwlKbN1HEFifpEIShVQbLgKMr+3wXBHKinwoTdDYWaDRqpGaKPxrrp3ew1azwZn
         CinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701297207; x=1701902007;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/N/aXZg/ugRiTyHLDtv8QsJaetFQFjEErGPMFO4www4=;
        b=MoZCdJRqJ3q3bPSNXm8092LyUQcBFs/UTy+nAiwjRA9LoHFh7Wx1RS+t2A1Rwj6hUA
         ut1kxHqGElVq0l4pwNCdpcfKhtUkNOS2fbM2ANIaaqtNCiNruJksR60yDmZ6nC3XEMy3
         mOlAgX7qQv26wHgdbZMdD6VltO+JqJK+z8LirGA+8lkj7QuBG+dPISHC2Yt1of/w67vM
         DYcuvO0MUX0GvkUp6VEUsjIr0BF8F6YYeVr2JB3ECeuMQ/1a8nn15nRrxMXy0d2tVDr8
         mYFv+2ss96HoqMoa23QIOW84yelePNOU2ZDDGwvQxW9U4MYxJNLncRrWTQK6xPO2bV0X
         KS/g==
X-Gm-Message-State: AOJu0Yy5XP87ed7Urj4c9jS0Ij92URbAPUCzZpUOugDQtwFYaAmtO0jN
	vHNkBa4QcAFtnWeFgDdoHc8=
X-Google-Smtp-Source: AGHT+IEHc3ggTtxA9JABbFLXY4x/k4xGK5j5x+tk5+GDx17wDW/cmC88uLz4XvocPsOO1DyltF+x/A==
X-Received: by 2002:a05:6a20:54a7:b0:18b:92b3:7c80 with SMTP id i39-20020a056a2054a700b0018b92b37c80mr27399341pzk.22.1701297207064;
        Wed, 29 Nov 2023 14:33:27 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id g4-20020a17090ace8400b00277560ecd5dsm1879096pju.46.2023.11.29.14.33.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 14:33:26 -0800 (PST)
Message-ID: <e8e7d4d8-524b-49d1-92c9-bf01fc4cea4c@gmail.com>
Date: Wed, 29 Nov 2023 14:33:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] scripts/gdb/stackdepot: Rename pool_index to
 pools_num
Content-Language: en-US
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: casper.li@mediatek.com, chinwen.chang@mediatek.com,
 qun-wei.lin@mediatek.com, linux-mm@kvack.org, akpm@linux-foundation.org,
 Andrey Konovalov <andreyknvl@google.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231129065142.13375-1-Kuan-Ying.Lee@mediatek.com>
 <20231129065142.13375-3-Kuan-Ying.Lee@mediatek.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20231129065142.13375-3-Kuan-Ying.Lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_143329_252377_61E65302 
X-CRM114-Status: UNSURE (   7.63  )
X-CRM114-Notice: Please train this message.
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

On 11/28/23 22:51, Kuan-Ying Lee wrote:
> After stackdepot evicting support patchset[1], we rename
> pool_index to pools_num.
> 
> To avoid from the below issue, we rename consistently in
> gdb scripts.
> 
> Python Exception <class 'gdb.error'>: No symbol "pool_index" in current
> context.
> Error occurred in Python: No symbol "pool_index" in current context.
> 
> [1] https://lore.kernel.org/linux-mm/cover.1700502145.git.andreyknvl@google.com/
> Cc: Andrey Konovalov <andreyknvl@google.com>
> Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


