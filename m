Return-Path: <SRS0=nwzH=E4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA8AC388F9
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Nov 2020 00:38:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5715C2078B
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Nov 2020 00:38:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1KkBOuQb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5715C2078B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mlzGrsyfQ0W/l5DNGN8tnEfumbBXE8zs+6yKpotNCkA=; b=1KkBOuQbVRrsUtES2NGsbpL2l
	U+k5H5daMt0CPrcHfWerLE477TP6h33TWQv3QgEMfQnnwgRMn3o8FCV2kigSYp6fuebJU6YSDJcfS
	IfvXEPATA+JbqbU7WwXUIjIE9dYEa8AKic/sZCr51rNAAfApZXBNo4k4LRrSDa3CGMybL39DZFYjo
	CB4veKzkeVcromU9e3uqbDB/yOozaLABQjSLPpHgo4r3P4L2v/NNMmMulBytJoGo/VBuL9QjyhVP5
	qojmqP55RuYT3BRnXCzF3MFkDRQQheILbXsqOaiNgA1wrhedLU3acab3NK7Z3kBXASoCAnYiS4p9g
	zpPkUu7ow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgdP6-00030s-8H; Sun, 22 Nov 2020 00:38:56 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgdP3-00030U-Mq; Sun, 22 Nov 2020 00:38:54 +0000
Received: by mail-oi1-f194.google.com with SMTP id v202so12195782oia.9;
 Sat, 21 Nov 2020 16:38:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8+FwoGnhkNqC4D+I1tikeB1jkqsjc5JXnvVvcizyflo=;
 b=l5CnQXiHW5y8G4QT6t03LTiT/riKGk2/ieAGsscGkx1a9E+NiYYzlMEiOev/ZQpCD5
 oDov2vi8qKuY9TrfX56JLUKJvq4WtAteI3Zky5GKBfgtRbfNTBbjwaJ36OsLrpoPm5aX
 yy1VjtdiY4C4FiXHVRzeK1pBXdRdg0Ca6zN2Djmo/XOqsrXG13TKZB3phG7tQuY0m8YD
 YjHyh/hRmbePJ1w8C7DrR45OVNPHRRfrm32e5kC0SRPTrI/s+DkkcDQCxW4YbyCMUOfj
 qMJc97rzlYJiCZQPMEZA/bfmyxMge5Q4UZzTG7e9VC87lZbt31rm40cTDScDZ/hUBU+r
 IqSQ==
X-Gm-Message-State: AOAM533c7rAMBxOGCeAovls6L6/AfIYl63ewHi9BSr1ZYhac4JdSplrQ
 tqzY3NdldQ4c0iXjSzv5y4x51DW9zkM=
X-Google-Smtp-Source: ABdhPJyxy/H6u8Ho9oBYVJFC/Mik+O7+fdULAu0DjEGX6d/fYNIjNqNNQEXrSeYivEP2OFdi38NeaA==
X-Received: by 2002:a17:90b:11cf:: with SMTP id
 gv15mr16712251pjb.11.1605978006074; 
 Sat, 21 Nov 2020 09:00:06 -0800 (PST)
Received: from [192.168.3.218] (c-73-241-217-19.hsd1.ca.comcast.net.
 [73.241.217.19])
 by smtp.gmail.com with ESMTPSA id a8sm7263973pfa.132.2020.11.21.09.00.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Nov 2020 09:00:04 -0800 (PST)
Subject: Re: [PATCH RFC v2 1/1] scsi: pm: Leave runtime PM status alone during
 system resume/thaw/restore
To: Alan Stern <stern@rowland.harvard.edu>, Can Guo <cang@codeaurora.org>
References: <1605861443-11459-1-git-send-email-cang@codeaurora.org>
 <20201120163524.GB619708@rowland.harvard.edu>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <9df460a7-c7fc-4999-bfaa-076229b8a752@acm.org>
Date: Sat, 21 Nov 2020 09:00:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201120163524.GB619708@rowland.harvard.edu>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201121_193853_785527_4DCAE5D8 
X-CRM114-Status: GOOD (  18.33  )
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
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, rnayak@codeaurora.org,
 saravanak@google.com, linux-scsi@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, nguyenb@codeaurora.org,
 ziqichen@codeaurora.org,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 salyzyn@google.com, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>, kernel-team@android.com,
 hongwus@codeaurora.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 11/20/20 8:35 AM, Alan Stern wrote:
> On Fri, Nov 20, 2020 at 12:37:22AM -0800, Can Guo wrote:
>> Runtime resume is handled by runtime PM framework, no need to forcibly
>> set runtime PM status to RPM_ACTIVE during system resume/thaw/restore.
> 
> Sorry, I don't understand this explanation at all.
> 
> Sure, runtime resume is handled by the runtime PM framework.  But this 
> patch changes the code for system resume, which is completely different.
> 
> Following a system resume, the hardware will be at full power.  We don't 
> want the kernel to think that the device is still in runtime suspend; 
> otherwise is would never put the device back into low-power mode.

Hi Alan,

Does this mean that every driver needs similar code for handling runtime
suspended devices upon system resume? If so, would it be possible to
move that code into the power management core (drivers/base/power)?

Thanks,

Bart.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
