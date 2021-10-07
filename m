Return-Path: <SRS0=EI02=O3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E967C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 21:33:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06350610C8
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 21:33:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 06350610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rCaUhm/kdauEMMEJ36Kph/sZ4klNl0elut+PBkWBnqk=; b=OandS72Ui6WK5ZQsYee1xpg6U1
	D/WcQ+Kg0Xt8fZW0uN7oTeBMw2UTexYSQ/1AiHWV9NKwmF06mvrB8SOTcaNDpyev+ehxKBR+Tv9HW
	NJ1v4/dIeWM+rwMTsLQjWyOpJnHFpt6+a6SLgA05edFHv16SmRjrhiJlV/ygwe6zYxovkl8y4annQ
	cGH/+5vFWo9ATqHlYQjrI5dmLwMblujf4+qkGPQUqVb0Y3mEk6ziptgS82jBzauHg2BltD7YbRrHb
	435q5yscDDq1ZQBRge0BSsJmH20i6wcvgP5NxKQuyaD84By/cp0oKT93x2+v1FvE3GqxTtExLBpWu
	zTlxXN5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYb1L-000oMo-6A; Thu, 07 Oct 2021 21:33:43 +0000
Received: from mail-pf1-f179.google.com ([209.85.210.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYb1J-000oLo-C3
 for linux-mediatek@lists.infradead.org; Thu, 07 Oct 2021 21:33:42 +0000
Received: by mail-pf1-f179.google.com with SMTP id q19so5954654pfl.4
 for <linux-mediatek@lists.infradead.org>; Thu, 07 Oct 2021 14:33:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5xcXKRwZ74WR4JglJVNYWwS1t0rAzIU9zzht+d5mX6E=;
 b=zI+V2h3AdRwdCVBR0iPq//2aYG9GLgph9rIeuHafg0H79wh8p2270/QRwtQ5rzGbvV
 gt7Enw6YBqQ+FabYlt1yDXoUyf+QJiXCwK9XQN3Nm344rIKWupm0YVNFuQ/OsLONSEQC
 KYt04sHnz3dOLuIa3BnzV4yOpL4I0s/Pyr0zwoTJk0ajDEJWRCtgL5XdljEcB12hoO77
 lA/v0wbgURZl0sszNZla1ZP1bIet7Rt6AHvwyrvWgEPpbLjhamF8D7Qa2FC6kx7YhK1g
 SQAXHtoV6dob1l3yOE9V+5AaODQNnwC2yqaPE4iLunlG0uTKbKoJxBdnFFp+9x8rtP2i
 RS7Q==
X-Gm-Message-State: AOAM5335EkjzbL2EZLVt8+XSeKiqnzLhyl3q4B72Sqzpw89oztZAaS9Q
 NWrhYisJfIoJfM5flvHrewA=
X-Google-Smtp-Source: ABdhPJznWN/gFns76NicobUTqxQRAqLnrjdXdqVZq43YfLWxFv2HWCAKC9SCQ68zvHrbN82NK1N1/w==
X-Received: by 2002:a63:4464:: with SMTP id t36mr1601545pgk.4.1633642419748;
 Thu, 07 Oct 2021 14:33:39 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com
 ([2620:15c:211:201:ae88:8f16:b90b:5f1d])
 by smtp.gmail.com with ESMTPSA id e7sm343158pfc.114.2021.10.07.14.33.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 14:33:38 -0700 (PDT)
Subject: Re: [PATCH v4] scsi: ufs: support vops pre suspend for mediatek to
 disable auto-hibern8
To: peter.wang@mediatek.com, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 jonathan.hsu@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
 mikebi@micron.com
References: <20211006054705.21885-1-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <0600b929-98cf-034d-a49e-c7d13e887422@acm.org>
Date: Thu, 7 Oct 2021 14:33:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211006054705.21885-1-peter.wang@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_143341_444315_9D913694 
X-CRM114-Status: UNSURE (   9.00  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 10/5/21 10:47 PM, peter.wang@mediatek.com wrote:
> Mediatek UFS design need disable auto-hibern8 before suspend.
> This patch introduce an solution to do pre suspned before SSU
> (sleep) command.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
