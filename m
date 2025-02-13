Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A83C021A0
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Feb 2025 09:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nPPXp+DqYBNPtUl0nhKlU9ascHyp2ZkvND5NvkqHXIk=; b=Il8uFbgk6DPMQLe7eL1RYRkXh0
	4WKZvGckKX/pPo9om4Rk5azIaG+lq1SxcJL+lR2bKO6mDbGBKTEQIWhaZ6yMgGxvCg6cqCyyWBLEt
	Tj37aQU1z0NpNU2T+zJBwxqOob30Zb0dV2/oBBevCq/9IxFkPQfsavR2bRFeTTOVQ9AuTqtzq3Ej5
	gkb/SRScvm/NQH/TsX7W9HknVkgOs3BpZw7/RgGdRd9WuWjg0xyZpLgawE6FDzzpvTCkMvGh9B8d9
	tIncUaDjfzH4V18LFMDhYE+sx2gMeQrdI7EDcdB/PFvoKXv9IIusQC9mELfuVVc2dJ1cMnFGdBSiB
	QXmXa2Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiVJp-0000000APo6-0a1T;
	Thu, 13 Feb 2025 09:15:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiV9U-0000000ANZt-2zan
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Feb 2025 09:04:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739437494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nPPXp+DqYBNPtUl0nhKlU9ascHyp2ZkvND5NvkqHXIk=;
	b=RnXx21L0V4gHwfZXI7bYaP6+YVyFnm5g7SLgIXglD5n/UIfqZSlcu6NqkxOP8iBlUCnwjt
	Hn/QJiEhcgwni/IwusvJV6ygcvY5urANJ5Q3ChLqVt+UI8GfYcY/uZQVGYgIzFwAfDuXka
	sAW87nRWsn2aHsZLLFAxBH2tlgPPako=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-q8-Jc-BaMqKx9vU1duWy7Q-1; Thu, 13 Feb 2025 04:04:53 -0500
X-MC-Unique: q8-Jc-BaMqKx9vU1duWy7Q-1
X-Mimecast-MFC-AGG-ID: q8-Jc-BaMqKx9vU1duWy7Q
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43935bcec74so3236985e9.3
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Feb 2025 01:04:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739437492; x=1740042292;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nPPXp+DqYBNPtUl0nhKlU9ascHyp2ZkvND5NvkqHXIk=;
        b=A3suIQFZM8lYIAoRkPslYdbKZRf45Aj9FL9c3g4rwa8G1UhLM8qLyG+lbaMWNZAMCW
         pHPVTycgb5i+u3yaRzmCJyuPF7bzUUFQ3rJQNhqAhujCO7BWgVoPqoSTQD10P13HNBhh
         D25BhzPn7t3oBQlQJ2GW1Rng6GXRJgH7pTf5KH40rpdrarVyVklsDEbR3Lyy3PJw9Lk2
         PG7rQCGh8Zwqq56UCYzk6y8MMYVZnQkGETXuLt52WPugq3LdA0wZzBGr489GBWtiin23
         npY95REZDwaJEwYel87pa0jYHV7k9v2m2i8u6gEJQ8+cT2freM/9lkzqFNTSfaWLi8c/
         FPeg==
X-Gm-Message-State: AOJu0YyUtYwJWl80L7AXsdFkChMFwdxKTohZsJiKRHrdnRbL6CcVpnQR
	x0a+MfwlWn4ZorzQ8btopLxJOHDVRzrCMol4l/Vaq3w+xrwjbAJ21fIRYBGosatPGRTuWW0NV2L
	q7axaZgiDrKHuL7TJn6j4gYRTcaZNK6RPyv7gdr7TKGQJdEHJc4j3UzM748EBCAapSzr9Jg==
X-Gm-Gg: ASbGncvY6u5F64Is3fVWSTsxhRpz2BqgiBC8UNwyujh5haAmLClopHG3yMRs9uBhsEN
	YteD4/MOXVd4s28ZNm/xds1ub+v17WNyiorWf7tdRTdjvimxkgr1AsCeH4e+BttFRuE4CA1Vr92
	6/ycoE3FEeOE7LUZl+y2abzi+kWy7ohL3eR3hG2MzjQpyoubxQ9PVnwExF7FMq3unDFG3ng9o7G
	eAvv5sg/ov2kQbZBbUlaT+v1IjZYA8m1C1jv4zrXk0BOedEdfUtyTouCDG/9WWpzWFZe2Hf6JWg
	QaOgw367av4VaaqQF9KMtTX+K3rshfudCUY=
X-Received: by 2002:a05:600c:46ce:b0:434:f609:1af7 with SMTP id 5b1f17b1804b1-439599258b1mr56603565e9.4.1739437492140;
        Thu, 13 Feb 2025 01:04:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWnvSDslS9x9V9t5sSHRI9c0hrSBXGtqBD2no/zOmtqcPI5lcyK+O8Y6XHZHX2Wk85H1SIZw==
X-Received: by 2002:a05:600c:46ce:b0:434:f609:1af7 with SMTP id 5b1f17b1804b1-439599258b1mr56603075e9.4.1739437491770;
        Thu, 13 Feb 2025 01:04:51 -0800 (PST)
Received: from [192.168.88.253] (146-241-31-160.dyn.eolo.it. [146.241.31.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d58f3sm1253334f8f.73.2025.02.13.01.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 01:04:51 -0800 (PST)
Message-ID: <a42ec2d4-2e4f-4d1d-b204-b637c1106690@redhat.com>
Date: Thu, 13 Feb 2025 10:04:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] net: ethernet: mediatek: add EEE support
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>
References: <20250210125246.1950142-1-dqfext@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Qingfang Deng <dqfext@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250210125246.1950142-1-dqfext@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VRkpa0z2accZu3rNCWDOGp0hpjwxZC2AF_yBunTiI4k_1739437492
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_010456_823714_0FE3E883 
X-CRM114-Status: UNSURE (   7.40  )
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

On 2/10/25 1:52 PM, Qingfang Deng wrote:
> Add EEE support to MediaTek SoC Ethernet. The register fields are
> similar to the ones in MT7531, except that the LPI threshold is in
> milliseconds.
> 
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>

@Felix, @Sean, @Lorenzo: could you please have a look?

Thanks!

Paolo


