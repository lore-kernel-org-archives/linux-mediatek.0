Return-Path: <SRS0=fhAu=QD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 317B9C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 17:28:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3E5561A3A
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 17:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E3E5561A3A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EfjNzUM/Ddd2wKFG/2qz3ttc2+g4doiOmBx8GNFblvY=; b=O9ZE79puzzS9vC
	3ijbUTb7M5BdKEYR2j05UobFZRc5+j3AknBMrvpI3+DzGuVg2xeso4zLqmWfUpg8+qhefVGaBCEFW
	TOwSEcwX651DTBzoqUL/nEnWe4qchxRuAPq8qnvuCL9jGMEcnHyCY9MaWtmts8GsT52RyV+rMguBW
	SABl67JBWmNGw5OLsGE0i5eugA946UNmrL2CDNqwfNyUT4Ot/46JG0QKxa9JxSypY2ou0HdMcglE4
	gWo1xsf03wjeZH7VPUss6V65gTYLeNqz1rnyxFrRpmvIMXyAcNuPg2+2cq9zTX8HK0QVaYBJf6zmG
	QkpwGuRY9zgWmvFWCwAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mn2Fl-002SSu-Ec; Tue, 16 Nov 2021 17:28:17 +0000
Received: from mail-pg1-f169.google.com ([209.85.215.169])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mn2Fj-002SS3-09
 for linux-mediatek@lists.infradead.org; Tue, 16 Nov 2021 17:28:16 +0000
Received: by mail-pg1-f169.google.com with SMTP id p17so18249472pgj.2
 for <linux-mediatek@lists.infradead.org>; Tue, 16 Nov 2021 09:28:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NnBat/piQk+CrxO4bvowT9cpNN621Mj8K7d5Tfaa/N4=;
 b=BSik4UcmJVGOVsDeuifvJ+ywDYUnpte+t/zB+vNGq/fFoWWCpJ2wkL3M+gYrdJHJWb
 Bjk9/cwHOBnCFj9sZ9xugoUgJvIlC8u75cYbWeu9U6Qy/Zze11Jn/IcDf+pEOHhAqiQb
 FgkRjDMNKHKHteZw3X1GYGkJPQedLUjJQsfouzlHyq4J5JSQ2LSiQDhqWwU+aZs6/tE0
 aZnZpEX1wbJ06W6tl9FdDXP77KDOVKYr34/z0pFm6C0RWD/oE3MUu3Ba/cF4/1adDKec
 Zvot42mAlBnZZPPeZgydqMpTkZdtZYVNGy+GaumIKHKK68b46cBteGzpdWUZWlxN5kP/
 M6OQ==
X-Gm-Message-State: AOAM530g8zd+0BUFFDA0iyAWTJ1TFTxO2O9NDLJFKq8U7gOYt/e9lANR
 HrDjI1OyXKUtNTHJCBAx1FY=
X-Google-Smtp-Source: ABdhPJyGYen8t2lqhjhwyGs9XUkeL3jAqV0YqS082ul0kH2I4m3xoQFg+gL8pZfj6lyp8mx7rr/UkQ==
X-Received: by 2002:a63:d74a:: with SMTP id w10mr387586pgi.341.1637083693686; 
 Tue, 16 Nov 2021 09:28:13 -0800 (PST)
Received: from ?IPV6:2601:647:4000:d7:feaa:14ff:fe9d:6dbd?
 ([2601:647:4000:d7:feaa:14ff:fe9d:6dbd])
 by smtp.gmail.com with ESMTPSA id p43sm8988391pfw.4.2021.11.16.09.28.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 09:28:12 -0800 (PST)
Message-ID: <5c041d7f-dedb-f450-9ba8-683f36a55b30@acm.org>
Date: Tue, 16 Nov 2021 09:28:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v1] scsi: ufs: fix tm cmd timeout/ISR racing issue
Content-Language: en-US
To: Peter Wang <peter.wang@mediatek.com>, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 jonathan.hsu@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
 mikebi@micron.com
References: <20211111094939.14991-1-peter.wang@mediatek.com>
 <08cff383-d944-56f3-e61e-ad6fdf4bb885@acm.org>
 <f58d107c-df83-0293-dc26-cbaa30ee691f@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <f58d107c-df83-0293-dc26-cbaa30ee691f@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_092815_072412_2CD7B83E 
X-CRM114-Status: UNSURE (   7.95  )
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

On 11/15/21 22:57, Peter Wang wrote:
> By the way, we observe that 100ms TMC timeout value may not enough for
> some device, maybe we need enlarge this value?

Is that the TM_CMD_TIMEOUT constant? It surprises me that 100 ms is not 
enough. Will increasing that constant have a negative impact on the 
error handler in case it hits a task management timeout?

Thanks,

Bart.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
