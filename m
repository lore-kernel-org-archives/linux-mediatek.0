Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E64C64ED8
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 22:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lG6vB3dP9H3e//Mg7ICB0IjrePifa0YDIvFrmLOhqlQ=; b=SEIgZtl8L6usre7wPzZ+xjzwwb
	pekaKRuTAMMJD7NLxGsgfLzeG9CgTVvjN/+h2jCXD8obpRMedG3541MUnWWIJqvcRoADoPxfY1TPA
	PItWNjYYZfMaZ7QX1Jut8eXLdvRKWZtHU/73a0ufPkcLIb9FwE/iS5lJbuGO80F85Ycv1UfZI0XoO
	uTY/iKiPsxXfWep2r0/DpZCqlYsK5pcltqhmuLi+RsAaDl8fvUW0CSEN6FlTwB5LvaBW8lM18XE92
	IDY1eJ/s4RKk9RsY5WHFw3QowQtooYoJQkISt/O9MXn/P/iq0T1fxdqAflYfKUNiPiNqAGq5S7h6N
	GA39TlXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWmHq-00BWNX-3J; Mon, 27 Feb 2023 22:48:02 +0000
Received: from mail-pl1-f176.google.com ([209.85.214.176])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWmHf-00BWKl-Vh; Mon, 27 Feb 2023 22:47:53 +0000
Received: by mail-pl1-f176.google.com with SMTP id c1so8479857plg.4;
        Mon, 27 Feb 2023 14:47:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lG6vB3dP9H3e//Mg7ICB0IjrePifa0YDIvFrmLOhqlQ=;
        b=p6W01FTH5DKcq3Wg1Ha28GKLRPECTAdKB21fnMlAp/UhlhNxoKsH5UqEDPFgLR6bqQ
         riVkXw2a20L13TtKeH6+aPtBOAFJyQ954whhPRE8nLtFU2eLEWl/QauIzQ2elVn/7fIz
         Pkxd1B58mt+d5P9oS9JIYWoj1i45q3MYFHezKDKKgA79wt5zZg3AQ/C0L407XX/qyXgV
         n8I3n2wbNBtJzxAp2UBzFPJmri5w7apUkqy0xbvjmxurxgAO4svcEmHpAcChur4T9UlA
         VFt6M5wlh4DnrwGJMiMqxLm7Qd0XuV4gCA8pDK+R/OTs9BwVdMu6MnT1Lm4BMxhjJezf
         vsxw==
X-Gm-Message-State: AO0yUKWSBy3Ul7sLWOmxuWfY+DA/ODqeKT8Bvcm7j0hT922Rj/6aw6gB
	DaXB3xlYA3o5Bbhv7Kk/tZc=
X-Google-Smtp-Source: AK7set9vcQ/F8WhIG+6XsqcHSIU5HVBhAJ1lVW44QSnhAm+ORXEIjQ6fFA1tdKOn1Sl1SStdekryLg==
X-Received: by 2002:a17:902:db04:b0:19d:90f:6c50 with SMTP id m4-20020a170902db0400b0019d090f6c50mr583309plx.58.1677538070772;
        Mon, 27 Feb 2023 14:47:50 -0800 (PST)
Received: from ?IPV6:2620:15c:211:201:6cf3:f584:1162:e48a? ([2620:15c:211:201:6cf3:f584:1162:e48a])
        by smtp.gmail.com with ESMTPSA id 3-20020a170902c10300b00186b69157ecsm5088744pli.202.2023.02.27.14.47.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 14:47:49 -0800 (PST)
Message-ID: <99993a45-acc6-176f-d846-e278f173171c@acm.org>
Date: Mon, 27 Feb 2023 14:47:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 4/7] scsi: ufs: core: Add hwq print for debug
Content-Language: en-US
To: Ziqi Chen <quic_ziqichen@quicinc.com>, Po-Wen Kao
 <powen.kao@mediatek.com>, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>, "James E.J. Bottomley"
 <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: wsd_upstream@mediatek.com, peter.wang@mediatek.com,
 stanley.chu@mediatek.com, alice.chao@mediatek.com, naomi.chu@mediatek.com,
 chun-hung.wu@mediatek.com, cc.chou@mediatek.com, eddie.huang@mediatek.com,
 mason.zhang@mediatek.com, chaotian.jing@mediatek.com, jiajie.hao@mediatek.com
References: <20230222030427.957-1-powen.kao@mediatek.com>
 <20230222030427.957-5-powen.kao@mediatek.com>
 <1b9c2bc9-a349-062a-597c-336804c05394@quicinc.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <1b9c2bc9-a349-062a-597c-336804c05394@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_144752_084153_FA24AA1A 
X-CRM114-Status: UNSURE (   8.22  )
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

On 2/23/23 02:14, Ziqi Chen wrote:
> Calling registers dump function in ufshcd_print_trs() is not reasonable, 
> eg.. for each aborted request, it would print out all hwq registers, 
> it's not make sense.
> 
> I think we should move it out of ufshcd_print_trs().

+1



