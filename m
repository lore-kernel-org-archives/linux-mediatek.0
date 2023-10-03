Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CDE4E748FA
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 17:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6EtorarqtxI211Ng2Jchw7++TNi7Tlo0GlfOYxmY1cA=; b=YnKofIo+iE+8ZLKZ1MgigWPJJh
	zcagUj4nSIT4hwuVJ5B7jl+YtJwG6KhP4abBGuKnQ7a5xYRTwJuyD25GkNLWOV5Vxiks88TD9Y0/w
	OHu17hSKzks3xddAVE8GBtB6hMMlDjRxx/LAXlCTLMzqlosbQ0+e6xV8HT4iliU8l5KhIN8qwrQlF
	pyI/Mxrd4tDd1zkvQQu0z373yb+kwoFrfzVfZ0eW8OCWMtL1yySYUopjmnLJQ2nJTw2kOQB0NI72K
	zetb3wybhX0K8kJZMKwrni/K99QhGuMiYnEHZWHXPs7EBRo7PPAhZHzFuKqR1IoUlZU7bcVgonwYT
	1ialbjnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnjC8-00F2p0-0Y;
	Tue, 03 Oct 2023 17:28:28 +0000
Received: from mail-pg1-f178.google.com ([209.85.215.178])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnjC4-00F2oC-3B
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Oct 2023 17:28:26 +0000
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-577fb90bb76so667731a12.2
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Oct 2023 10:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696354103; x=1696958903;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6EtorarqtxI211Ng2Jchw7++TNi7Tlo0GlfOYxmY1cA=;
        b=M2Nu6/CnJd3f0Unn+Tg3yT37YMMNpLBZUIQilFRpR+X61RFARFyd28XialOFgYfedT
         SSrUZCGOSwv++ohtx6+n9SYdgUgs6HrJRFTk67/GybFl98vx6awYfZZybv3sqPUtpd9z
         Y13LYK/eZQ1I44FdG2XVozteWm1CSAZgCD3PgyD7ZwarONbKx3y4aGOUHxUuFTwea5c1
         MopifSbvpgSkDcQnYpQkIc1s9dprR5w50gR8QHF53qBFsse7OO5srisSBHvrr/ogsbJl
         TLVTf+mayttVwPHMTf7DHvK5d3Afs0zWrth0si4lVFoa6YEXa1znnheStIG9joloWvST
         ydXA==
X-Gm-Message-State: AOJu0YzqRQPF7MwOprKdndjLlOCoNXYwRZN5MjKasdTfKlCrI/FsaAn3
	CyDSZQRPIBt4TL1ylYaROys=
X-Google-Smtp-Source: AGHT+IEeOcVw2i+JnEKc+ZIkWIXbxdCY0PNLUyUbxOLkEBsKFA4qDJU7cIQ30POxY1ISbphOhxNJKQ==
X-Received: by 2002:a05:6a21:9986:b0:160:cf09:8019 with SMTP id ve6-20020a056a21998600b00160cf098019mr150416pzb.32.1696354102895;
        Tue, 03 Oct 2023 10:28:22 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:fc96:5ba7:a6f5:b187? ([2620:15c:211:201:fc96:5ba7:a6f5:b187])
        by smtp.gmail.com with ESMTPSA id p22-20020a637416000000b0056c2de1f32esm1641630pgc.78.2023.10.03.10.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Oct 2023 10:28:21 -0700 (PDT)
Message-ID: <11c80afe-ad85-4676-bce1-e7bf1feeb458@acm.org>
Date: Tue, 3 Oct 2023 10:28:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ufs: core: correct clear tm error log
Content-Language: en-US
To: peter.wang@mediatek.com, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com
References: <20231003022002.25578-1-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20231003022002.25578-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_102825_022475_06C260D3 
X-CRM114-Status: UNSURE (   5.19  )
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

On 10/2/23 19:20, peter.wang@mediatek.com wrote:
> The clear tm function error log is inverted.
Reviewed-by: Bart Van Assche <bvanassche@acm.org>

