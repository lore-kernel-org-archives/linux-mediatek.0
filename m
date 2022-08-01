Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46885C00144
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Aug 2022 18:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PNXNA8TxxbGuK12us0UQ2S31lXjK2ZTUZr1Y2KB6Xww=; b=NtR8S8H64jKSHpEfWk4ph5pEfQ
	NAu51CUEBLfBXeSZwneCv2TBHMroc9kELHiX3QvWsGqq2hLtx/t/6wNpfnMvy0SInUkytG8BZLOlZ
	wLHt7FA7318t/2NoEZIP9KjDG4caxly0VQiIL71Qd9NtnYqaMj4ukv0waYIE+7OjbdDc+1obAoUxz
	rEF12Iq95Fc0r8jJoecJTRW+f8pgDuRYm0g0MEJ1u5QnmgzKz3kV7PBEhVTKAXj2VEKSVpzfnNPPr
	POB+XmA5JRWSgQKLvuWKSlj5ywvW1VuIT3HeF0t2vOxhMvsj6xJm940fSgBNXfe8o0OdQU/CQ7RMT
	1TXSJZMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIZtz-008jTk-RH; Mon, 01 Aug 2022 18:12:27 +0000
Received: from mail-pj1-f47.google.com ([209.85.216.47])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIZtw-008jPl-AC
	for linux-mediatek@lists.infradead.org; Mon, 01 Aug 2022 18:12:25 +0000
Received: by mail-pj1-f47.google.com with SMTP id t22so3519431pjy.1
        for <linux-mediatek@lists.infradead.org>; Mon, 01 Aug 2022 11:12:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=PNXNA8TxxbGuK12us0UQ2S31lXjK2ZTUZr1Y2KB6Xww=;
        b=f7sm4dqKlhqqVJC3x7tgKhGxtuh3nNjl8RJM2yH0+p9/3Ut7+XFvRwsWA93pdLh0lz
         xOLMtEYK/95NpF1G8oOIYE9QwqHxuAq48AACSCZHmn/s9SrKFDib6xHF1ds7kMpyZmc5
         iC5EPOPpU5A/rUM5XnqeGPBPalNfVDrcWdLbqQHSOcY/KSaeN/qtf0JTm+GeIoRko3ek
         isZwabrcbnflHNFiUqRaO/DQx0ccy2X0MHS5bdE9NKGmzx4VLlNKXT+f8V6muU1sXMaO
         4AOTddvcw8p+HAZl+PIzRieBhi34N753kXyhru5YFsilmxwcaiIwBivrlHoPnUb1GbZe
         icdA==
X-Gm-Message-State: ACgBeo3VNbXpcXdiKHFd2ZYr3K2i1qTexerpgFdLgerxjaNi1POB7yIQ
	4nPUTXSoNaJDHA1Ef0YI/rU=
X-Google-Smtp-Source: AA6agR6+KsrcstHZgvImeNkG4tJ+Z8XtfWVYeTX1KBNhtGQ6ivTNzKQ5l6LgcpIQYh4osBHZEKycAw==
X-Received: by 2002:a17:90a:d3cb:b0:1f1:82ca:3ba0 with SMTP id d11-20020a17090ad3cb00b001f182ca3ba0mr21009005pjw.236.1659377540953;
        Mon, 01 Aug 2022 11:12:20 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:6496:b2a7:616f:954d? ([2620:15c:211:201:6496:b2a7:616f:954d])
        by smtp.gmail.com with ESMTPSA id z5-20020a1709027e8500b0016d9b101413sm9846668pla.200.2022.08.01.11.12.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Aug 2022 11:12:20 -0700 (PDT)
Message-ID: <ffa00837-5e3f-24fa-ac2c-7d4a505c848b@acm.org>
Date: Mon, 1 Aug 2022 11:12:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 0/2] ufs: allow vendor disable wb toggle in clock
 scaling
Content-Language: en-US
To: Christoph Hellwig <hch@infradead.org>, peter.wang@mediatek.com
Cc: stanley.chu@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com, wsd_upstream@mediatek.com,
 linux-mediatek@lists.infradead.org, chun-hung.wu@mediatek.com,
 alice.chao@mediatek.com, cc.chou@mediatek.com, chaotian.jing@mediatek.com,
 jiajie.hao@mediatek.com, powen.kao@mediatek.com, qilin.tan@mediatek.com,
 lin.gui@mediatek.com
References: <20220728071637.22364-1-peter.wang@mediatek.com>
 <YugT7jfkMGGvH7hO@infradead.org>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <YugT7jfkMGGvH7hO@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220801_111224_392297_5D0E8B79 
X-CRM114-Status: UNSURE (   9.49  )
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

On 8/1/22 10:57, Christoph Hellwig wrote:
> Please fix up your wording.  A vendor can't do anything at all in Linux.
> A driver might be able to disable things for a specific device, though.

Agreed that the description should become more clear. I think Peter 
wanted to refer to the "vendor driver" where he wrote "vendor".

Bart.

