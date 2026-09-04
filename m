Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334FBC624DE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 16:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJoCXo3XrVvezqaavbkHVvE2LNwhQgm9nXYlfp/quW8=; b=yPa9sOkVkSbXCCnZR7elejbNLT
	w4UqqUHnvCvSvuAW+55+hwGRsmXrp6TM0DXsYCdKwQALZrs19CdsXx+Fm+UQZAOOWXN7WyvNCjOkv
	lFXWF/rJ9sYgeGtuCxhUbiECVew2RyOOZlkQt5kNZB6zJmsQ+6ga4JPsyoULe8iiCaXqtKQ5WW0pH
	347YLZHxce77jnKPhBGOI2G7KUILGS7jogGIGdT76mmLtUHZPLma7rBJR+Miyorz5ZIDHGb2nhPAH
	ispPIKRz1fgbwIe0jvu3vHexf+hoWETVrdsGd4SiafxgqzIvCLPeISi5PA5R4Aa+/zwRxEqthXnwh
	Nt6giI6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Wf3-00000002iZD-0G8k;
	Fri, 04 Sep 2026 16:21:05 +0000
Received: from dispatch1-us1.ppe-hosted.com ([67.231.154.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Wex-00000002iXe-1FS0
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Sep 2026 16:21:03 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id 0DDB634006E;
	Fri,  4 Sep 2026 16:20:56 +0000 (UTC)
Received: from [192.168.100.159] (firewall.candelatech.com [50.251.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id 09E7313C2B0;
	Fri,  4 Sep 2026 09:20:56 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 09E7313C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1788538856;
	bh=CZ4bX4F6PSEhTLlZpD0mtDFxKqPvIwiS/pvOwbtl71Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZbDLmJ+omTBJC9EX1VXfLQB5O+L1AkFUCyKevIW6t7d9BrvjpZcQih0pQSaTwqbrv
	 06ymwTEmMIRJr4FrAsrZ3k1AlmZ3FjcfM7NaOJqGKeu180Nr928wupIck06/64MQ39
	 McBN4oYK37AXz1t9zWSm8VhR6zi1G6HZ5+wpib1A=
Message-ID: <3acf531c-bcc7-412b-b3bb-665069260e46@candelatech.com>
Date: Fri, 4 Sep 2026 09:20:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [bug] Triple whammy of mt7996e bugs on 7.2+
Content-Language: en-US
To: Ilya K <me@0upti.me>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <1767631788532094@64c4e675-cd08-4a74-816f-886742f9bfcd>
 <529a79bc-dab7-aa41-00bd-c47ecbefaa00@candelatech.com>
 <471221788538289@323ca970-5bd2-4c6b-b52d-2b863a718615>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
In-Reply-To: <471221788538289@323ca970-5bd2-4c6b-b52d-2b863a718615>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MDID: 1788538858-B9LB1mY0FrGP
X-PPE-STACK: {"stack":"us5"}
X-MDID-O: us5;at1;1788538858;B9LB1mY0FrGP;<greearb@candelatech.com>;6f76c88c2c731de9ad886e575864f8cc
X-PPE-TRUSTED: V=1;DIR=OUT;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_092059_395868_90E57918 
X-CRM114-Status: GOOD (  13.91  )
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

On 9/4/26 09:11, Ilya K wrote:
>> https://github.com/greearb/linux-ct-7.2
> Hoo boy that's a lot of patches. Anything specific in there, or do you want me to just rebase my changes on that entire branch? I can try, I guess, but probably not today...
> 

I don't have a good answer for you...it *is* a lot of patches, and I'm not sure if any of it
would actually help your system.  We do have this kernel working for an ARM based AP that uses
mtk7996 radio, and at one time it compiled for bpi4, but I'm not sure bpi4 still
works as we do not test it.

If you can get it to compile for your system by adding any needed patches on top, that is likely best
approach, and if that actually solves the problem, we'd be happy to consider adding any bpi4 patches
to our tree.

./build_bpi4.bash may be of some interest...that is how we built it back when we did try to support bpi4.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com



