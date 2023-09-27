Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DB7E82CBE
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Sep 2023 18:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sdtpFZ1EvsiUgYGIQxr1KkBCv19dYm4xAAovByDGV0Y=; b=v37GdKZXrq5k5EpD1J5F6xv7Dr
	gDDYCEOVeBRhZfFbATJUNlxOhjnYeyJ8JAv2jbl5Bv+AKebZ3jJ2HmEIg69jIBjyCz3giCaqi8D5W
	RUjwhAYJA5dPyfn2ZwqLdyJEZ8RiMSwSOlof4FAgub83sR6unYkv2AlH81xG4MVA5J/UugodAkoNN
	Rd9T7VrG/rKi6+Mh5g/grdsPPBefL29Du+uelFEHYOEWD35qvjwSHynQtzaV1Ko7A73z9MQFGp3oM
	YGa7NGFM6s9MrsweL/y05r0nWKzzHR9/3AYtuwHSmgbeFm0l/0yGTdgRYlAq3hnHHC8p+UQ3tIdAF
	LG0ro/lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlZKN-001aKJ-28;
	Wed, 27 Sep 2023 18:32:03 +0000
Received: from mail-pl1-f180.google.com ([209.85.214.180])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlZKL-001aJF-2Y
	for linux-mediatek@lists.infradead.org;
	Wed, 27 Sep 2023 18:32:02 +0000
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1bf6ea270b2so90625955ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Sep 2023 11:32:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695839520; x=1696444320;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sdtpFZ1EvsiUgYGIQxr1KkBCv19dYm4xAAovByDGV0Y=;
        b=J/8SRF2WYCg4nQBc9Hn2IXvZbB8eRgGJoGx4U78TKFQks8PLftTwipg3KE+fKYWN73
         rCV9hg5TZAYSsGsXkIuLxU/VxsKqEvzKS2Eujlk3ihkK/yLxltsfmK5gaJVwHgyULcrr
         e2HAfOWVApo7beQrKn9Se/36BIxlmxWBRQ3xoM3Q/Z6Zl2rugdxsG8OZZJme8Fark0jn
         ECvZrA2z8mjSchGv9AxGS1J+623kzaeFmAm3xJQ5BO6LyM9A25h98Wz5H4fM8SzjW0sX
         C2kXzfX7A6VM9vcwOn1btF8gyCn/0sE6cPujArkrIM0Jk3GaTYwln5V13EciBn+g0nSV
         Zy1Q==
X-Gm-Message-State: AOJu0YzzmTHH8NCaTgB/RGAY4P2QzruzXS0A4muvZp4mRW0ksPWJznCx
	PYFdptSefI7we16lj2ZLXwA=
X-Google-Smtp-Source: AGHT+IHJ5CKwAWtTVnOVEymAXvVCUl/CUoSq+qoF0UzEwQdaOpiEsG9Ud7negXgsuHdMyOEypDzOZw==
X-Received: by 2002:a17:902:6806:b0:1c5:8401:356c with SMTP id h6-20020a170902680600b001c58401356cmr2421503plk.62.1695839519747;
        Wed, 27 Sep 2023 11:31:59 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:8f39:a76e:2f15:c958? ([2620:15c:211:201:8f39:a76e:2f15:c958])
        by smtp.gmail.com with ESMTPSA id az4-20020a170902a58400b001b8baa83639sm909908plb.200.2023.09.27.11.31.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 11:31:59 -0700 (PDT)
Message-ID: <2c428d68-5fee-4db7-8349-eee245c62ff8@acm.org>
Date: Wed, 27 Sep 2023 11:31:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] ufs: core: wlun send SSU timeout recovery
Content-Language: en-US
To: peter.wang@mediatek.com, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com
References: <20230927033557.13801-1-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20230927033557.13801-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_113201_826104_1178A513 
X-CRM114-Status: UNSURE (   8.49  )
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

On 9/26/23 20:35, peter.wang@mediatek.com wrote:
> +	if (hba->pm_op_in_progress) {
> +		if (ufshcd_link_recovery(hba))
> +			err = FAILED;
> +
> +		return err;
> +	}

This patch looks good to me but I wish the above code would have been
written using the style that is preferred in the Linux kernel:

	if (hba->pm_op_in_progress && ufshcd_link_recovery(hba) < 0)
		return FAILED;

Thanks,

Bart.


