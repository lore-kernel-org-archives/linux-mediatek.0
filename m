Return-Path: <SRS0=ikIt=NE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F25BC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 14:09:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC2E960F14
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 14:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC2E960F14
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:Cc:To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=SzW3Ar4PcttbPNSKC5qJP6+zhnd8grGCWdaGpKzVnvc=; b=0uvaCKTDfy879VB1SMcQLHDJmD
	hgRmMlflg4DweyjXtY/CBpSEJK/VcCl0Psf/XV8cYHhtt6JWdWo5O61wA+7etcZyFkOXoyAL+01Xh
	XNt/Uza/joSnjWuUNHnaLBsGluMJtt52Q3PqxnWWlME+h+PUA/++wUqBEYI0kgsmujlNuXTiaVgpT
	0bZY+BiW+ZzmSjcp7z+3lAxfTsPaMvdpy2B4Wi9k5W2e0SQQrcG/8rI9ICNyJ3exyAyh+A1KgwqYf
	kxQkDW25KGQ/58SiIW3I1KZcc0vt9Qc+GZ7FVifYC6x2tn3b7Qq3Y7mAT1g/7VyevVkbDg9ZFKX8a
	iueUyhEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEXrm-00Ckoy-Bg; Fri, 13 Aug 2021 14:08:58 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEXrg-00Cknz-6W
 for linux-mediatek@lists.infradead.org; Fri, 13 Aug 2021 14:08:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:Subject:From:References:Cc:To:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ehp8QVXrAvoNWo7feuIvdyhoR1bCsHv5aFy82Lmft0c=; b=d29drEZoc4LcAxSYYCvx/XZHqh
 jdGQ07ks9cUE/riKPBDARs6Y/b/uVgeALUbGyauuQxDLWk5Oo9RtP9SwMcEonScyPOBMqXd6hVAex
 0k0euZbTZxNH8iZMubkXnb35C71QSfs2ge1UIS1w/nwExADs1WUkT1I1hf5wgFDgyD5A=;
Received: from p4ff13206.dip0.t-ipconnect.de ([79.241.50.6] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1mEXrZ-0001CP-Sq; Fri, 13 Aug 2021 16:08:45 +0200
To: Ben Greear <greearb@candelatech.com>, Ryder Lee <ryder.lee@mediatek.com>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <9f5b0cf6c4296d3a9e78a95516cf26d1db4baba9.1627696765.git.ryder.lee@mediatek.com>
 <04c61f83-e4ce-536f-7030-9050d8edfe78@nbd.name>
 <44c91410-49db-b829-a69a-f9826c8ff3ee@candelatech.com>
From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH v4 1/2] mt76: mt7915: fix hwmon temp sensor mem
 use-after-free
Message-ID: <1c4ab69a-21ad-f3fb-12b9-e1664dcc735d@nbd.name>
Date: Fri, 13 Aug 2021 16:08:45 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <44c91410-49db-b829-a69a-f9826c8ff3ee@candelatech.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_070852_447519_D29EBB92 
X-CRM114-Status: GOOD (  13.38  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2021-08-13 15:54, Ben Greear wrote:
> On 8/13/21 3:15 AM, Felix Fietkau wrote:
>> 
>> On 2021-07-31 04:17, Ryder Lee wrote:
>>> From: Ben Greear <greearb@candelatech.com>
>>>
>>> Without this change, garbage is seen in the hwmon name
>>> and sensors output for mt7915 is garbled.
>> Where does the use-after-free bug come from? It's not obvious to me why
>> using KBUILD_MODNAME instead of wiphy_name() fixes it.
>> I still think the phy name should probably be part of the prefix.
> 
> We rename phy devices as part of our normal operation, I think maybe
> that helps trigger the bug.
> 
> It appears that the hwmon logic does not make a copy of the incoming string,
> but instead just copies a char* and expects it to never go away.  But,
> I did not actually verify that.
That makes sense. It seems that thermal copies the string internally,
but hwmon does not.
How about using devm_kstrdup on the wiphy name instead of using
KBUILD_MODNAME? If you really don't want to use the initial phy name,
there's also the option of using dev_name(dev->mt76.dev)

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
