Return-Path: <SRS0=2J9p=O2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42413C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Oct 2021 04:02:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3F8261248
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Oct 2021 04:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F3F8261248
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xd1jyl9JRn6XAEk5eIlSWV0vv4RQlWU6rm+BPh2EXPw=; b=vHViWvpRgeMXHA
	1T+/E1WtaY4iNKjwTR0ygyT3ckoBLRZQg5u6H5Mw+XeVOkveIzqB1LA+qVui/B9DhUhMeg8hfSDzZ
	9TrHIcAXj1vbBCzmmjrEh/nkGUHXl4hMUCB0Rwpbm7Owp9GGJRFJEo+BYgVa4hLsKICopY67B69vc
	OSYJPMxwnv6SJezylvFGQ8T+CFp6GEbo/oNV/Px0naK4NXCHpEyaI72UC7F3Xq+tQY510HJfBGltJ
	5JlK9VAlZbWbKloA2TAmof/s+JjwrXqWPZQPPQQMT5TQn8NC68nAb45hIowCYxoGfv9VvcMXjqtuy
	KVWNG7lerwchQahL1BAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXy8Y-00CkOd-0z; Wed, 06 Oct 2021 04:02:34 +0000
Received: from mail-pj1-f48.google.com ([209.85.216.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXy8V-00CkO8-FM
 for linux-mediatek@lists.infradead.org; Wed, 06 Oct 2021 04:02:32 +0000
Received: by mail-pj1-f48.google.com with SMTP id
 pi19-20020a17090b1e5300b0019fdd3557d3so1255135pjb.5
 for <linux-mediatek@lists.infradead.org>; Tue, 05 Oct 2021 21:02:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3NfoG0nr7eSD+yHE0ezo9tSXYQJCxUvQ/OrkDl2bbRk=;
 b=hDooNZxL6UFLQndihP4eX7J7Cxkxff10b6xnlJk4Av1pB3urBYanQkRFVjIYB+1kZQ
 OUBXDzx2pu3Vo7HKziBvQnYF2PE8s0yrS0dKWew9CDXF82gKKpfP8DqenPhk6fIq3QL1
 46Sje7L+A+ffeERYUxk+1H+fJ3SCh3TyC7EzIHfbXZ14vabbSAozqhP2ChHH/028kHtS
 gzB0T+mRkhvA2f+I9z40QCftDR2SmM9nALI4pQp4JnBgTHqSwwBeRhucdHxUdoAYXtEJ
 /m2/7dxgxjMYPnQNEJDaDAbVhlGjSIY4dBSSTF6lI14APSCKQfhJDpGHbVD/xatkii/B
 /ivQ==
X-Gm-Message-State: AOAM530Bd+b2JRa+yJ4bd+ihgKHTWPAJRyT6XCBwBTYirxB4joblCulR
 ACTushXKWwJovdh6gc+Qh2TCO9Wh9nI=
X-Google-Smtp-Source: ABdhPJzyRpXeaLEkfzzWcQs7Lcw2V0Vjjs09M6WjoMo9OaBPP1q/IvZEI06q+C0CR3zMT69a9lgwAw==
X-Received: by 2002:a17:903:208b:b0:13e:d2b9:f2e8 with SMTP id
 d11-20020a170903208b00b0013ed2b9f2e8mr8780482plc.66.1633492950494; 
 Tue, 05 Oct 2021 21:02:30 -0700 (PDT)
Received: from ?IPV6:2601:647:4000:d7:4a11:5a1c:6c65:8b55?
 ([2601:647:4000:d7:4a11:5a1c:6c65:8b55])
 by smtp.gmail.com with ESMTPSA id i125sm18993666pfc.36.2021.10.05.21.02.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 21:02:29 -0700 (PDT)
Message-ID: <fda69919-44d3-1150-7141-a71e5900bb20@acm.org>
Date: Tue, 5 Oct 2021 21:02:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v3 0/2] scsi: ufs: support vops pre suspend for mediatek
 to disable auto-hibern8
Content-Language: en-US
To: peter.wang@mediatek.com, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 jonathan.hsu@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
 mikebi@micron.com
References: <20211006030959.20533-1-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20211006030959.20533-1-peter.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_210231_553080_17187784 
X-CRM114-Status: GOOD (  10.76  )
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

On 10/5/21 20:09, peter.wang@mediatek.com wrote:
> Mediatek UFS design need disable auto-hibern8 before suspend.
> This patch introduce an solution to do pre suspned before SSU
> (sleep) command.
> 
> Peter Wang (2):
>    scsi: ufs: support vops pre suspend
>    scsi: ufs: ufs-mediatek: disable auto-hibern8 before suspend

Please always include a changelog when posting a new version of a patch
series.

I have the same comment about v3 as for v2: I don't think that this
series is bisectable so please combine the two patches into one patch
or add "if (status == PRE_CHANGE) return" in ufshcd_vops_suspend() in
patch 1/2 and remove this again in patch 2/2.

Thanks,

Bart.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
