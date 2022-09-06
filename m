Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C461ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 20:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2kt6CEFAueWK0HKI9UIQ8H4IFzaooggSyLPO1T4AFfQ=; b=iucM2VQ04Rw0c4TShVaXFfszBm
	a2x7tiQGDU+lml4R3CzcvE3KbwKmrm9KLz0QOcNW+9SLM7Qfo9R2nox7a1uVyChJf+F9LiXyqrAJy
	ruMmo+URY8N1na0k8D+aRwdhEIcojWVU+VosCJzwoUqZTTecY31JWVPfq4AAhVBBDWO07Zrj102eZ
	tUkh4rChx0DHV7iU5qhEpDad4niRlv5DH3pN9PWq5yqF0gurornzYra3UgzthCz7lU6aNhqHIB9ts
	B+PKzNDOlCIihyg4jKPOwpPRBKt8oe6boWAK4s8vQhiSh4NwLIfd8B9g6FTClgSCmNFIpq7N6i+fC
	//OZXvNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVelJ-00Gx3B-0O; Tue, 06 Sep 2022 20:01:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVel1-00Gwwn-Cf
	for linux-mediatek@lists.infradead.org; Tue, 06 Sep 2022 20:01:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662494474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2kt6CEFAueWK0HKI9UIQ8H4IFzaooggSyLPO1T4AFfQ=;
	b=dVL8SxPSOVrDQ9dbXWZFibqo8ImcRIM/NzedLI2Bi78Gu9gYCm1llHYHmwlsbNbl89V697
	53vwwS3h7sGwXrFS+tajeFf9gcplvSq1W2kxL1Sk8MuD+OWi+R2IDjImgTpxYEpWEIBj90
	kmaZRBQmMlCSK+87AHhdGoZM1TzBxQQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-95P6QindO7OjDY5gAuEzBA-1; Tue, 06 Sep 2022 16:01:12 -0400
X-MC-Unique: 95P6QindO7OjDY5gAuEzBA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CA503C138A2;
	Tue,  6 Sep 2022 20:01:07 +0000 (UTC)
Received: from [10.18.17.215] (dhcp-17-215.bos.redhat.com [10.18.17.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8EA191121315;
	Tue,  6 Sep 2022 20:01:06 +0000 (UTC)
Message-ID: <02b8e7b3-941d-8bb9-cd0e-992738893ba3@redhat.com>
Date: Tue, 6 Sep 2022 16:01:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: BUG: HANG_DETECT waiting for migration_cpu_stop() complete
Content-Language: en-US
To: Tejun Heo <tj@kernel.org>, Jing-Ting Wu <jing-ting.wu@mediatek.com>
Cc: Mukesh Ojha <quic_mojha@quicinc.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Valentin Schneider <vschneid@redhat.com>, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Jonathan.JMChen@mediatek.com,
 "chris.redpath@arm.com" <chris.redpath@arm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Vincent Donnefort <vdonnefort@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Christian Brauner <brauner@kernel.org>,
 cgroups@vger.kernel.org, lixiong.liu@mediatek.com, wenju.xu@mediatek.com
References: <88b2910181bda955ac46011b695c53f7da39ac47.camel@mediatek.com>
 <b605c3ec-94ab-a55f-5825-9b370d77ecf3@quicinc.com>
 <203d4614c1b2a498a240ace287156e9f401d5395.camel@mediatek.com>
 <YxeR0RoiTdm8sWCJ@slm.duckdns.org>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <YxeR0RoiTdm8sWCJ@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_130115_567674_046F284A 
X-CRM114-Status: GOOD (  16.51  )
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

On 9/6/22 14:30, Tejun Heo wrote:
> Hello,
>
> (cc'ing Waiman in case he has a better idea)
>
> On Mon, Sep 05, 2022 at 04:22:29PM +0800, Jing-Ting Wu wrote:
>> https://lore.kernel.org/lkml/YvrWaml3F+x9Dk+T@slm.duckdns.org/ is for
>> fix cgroup_threadgroup_rwsem <-> cpus_read_lock() deadlock.
>> But this issue is cgroup_threadgroup_rwsem <-> cpuset_rwsem deadlock.
> If I'm understanding what you're writing correctly, this isn't a deadlock.
> The cpuset_hotplug_workfn simply isn't being woken up while holding
> cpuset_rwsem and others are just waiting for that lock to be released.

I believe it is probably a bug in the scheduler core code. 
__set_cpus_allowed_ptr_locked() calls affine_move_task() to move to a 
random cpu within the new set allowable CPUs. However, if migration is 
disabled, it shouldn't call affine_move_task() at all. Instead, I would 
suggest that if the current cpu is within the new allowable cpus, it 
should just skip doing affine_move_task(). Otherwise, it should fail 
__set_cpus_allowed_ptr_locked().

My 2 cents.

Cheers,
Longman


