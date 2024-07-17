Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70B7C3DA60
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jul 2024 18:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=42DJEZQ1MdHTtg7QJxt70aly4kDVOHsjcs6e6lW7JWQ=; b=jtgFHZplsradtnz7z+Y025538N
	HDi1GH6VCrWj32Jsa+T4f0DzWSchnDvjFOPq3NLRObwTr7D/XZF3bhSkGW7uB/jvNg1f2HCc+Xm8Y
	3uZTfbKf3St9zxPj4A1SfchmGFa2LgMI46muo8A2K9THFCUlAXfyRx5JDVEk8Psh2SmgQINgnXLXK
	86AXeQNYzuIeGrOx8/7zp+5wPl83TZTaGkuptLa2FIBb81AYeoH6J7j1eJxutiUkE+xBTE3Mqz5mR
	+Lz2S20+cGlT6TQqzLZ3iRKGVB4BUXlVYM2nSJZSO4H+k5BmuMvFPX/wZOxUKI9uwADLRCwtv0ueu
	FZR5xn8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU9p2-0000000EfGw-3f04;
	Wed, 17 Jul 2024 18:56:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU9oi-0000000EfAj-1vzl
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jul 2024 18:55:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721242555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=42DJEZQ1MdHTtg7QJxt70aly4kDVOHsjcs6e6lW7JWQ=;
	b=AfqRwq9qtQwe5Wttu+GOAio7iV/1zpIc5PQBqfAh0Cb1+tlwtM/D/SOW6ykU3cb4eAtbmC
	8gbfcAtqVNDTf9XDq8pG5o3U+h3Bi6yYf39eB5CI5aLJpylM1SN9blrTzJ8xh1Lsqw/RnX
	DpEiUl7D4ZXGJwKxNkWPcxGhheWKGQI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-510-GJ8a38dFOd6eX2lsh8TOXQ-1; Wed,
 17 Jul 2024 14:55:48 -0400
X-MC-Unique: GJ8a38dFOd6eX2lsh8TOXQ-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 899E01979058;
	Wed, 17 Jul 2024 18:55:41 +0000 (UTC)
Received: from [10.22.16.209] (unknown [10.22.16.209])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 696931955F21;
	Wed, 17 Jul 2024 18:55:38 +0000 (UTC)
Message-ID: <48fa8bc9-9f8d-4406-9137-88a555883ea2@redhat.com>
Date: Wed, 17 Jul 2024 14:55:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] blk-cgroup: Replace u64 sync with spinlock for iostat
 update
To: "tj@kernel.org" <tj@kernel.org>
Cc: =?UTF-8?B?Qm95IFd1ICjlkLPli4Poqrwp?= <Boy.Wu@mediatek.com>,
 "boris@bur.io" <boris@bur.io>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "axboe@kernel.dk" <axboe@kernel.dk>,
 =?UTF-8?B?SXZlcmxpbiBXYW5nICjnjovoi7PpnJYp?= <Iverlin.Wang@mediatek.com>,
 "josef@toxicpanda.com" <josef@toxicpanda.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
References: <20240716075206.23121-1-boy.wu@mediatek.com>
 <Zpbify32lel9J-5I@slm.duckdns.org>
 <c5bcbcbaeacdb805adc75c26f92ec69f26ad7706.camel@mediatek.com>
 <5560c690cc6de67139a9b2e45c7a11938b70fc58.camel@mediatek.com>
 <1b19b68adb34410bf6dc8fd3f50e4b82c1a014e4.camel@mediatek.com>
 <Zpf3ks2drDZ7ULTa@slm.duckdns.org>
 <f448f66b-7a91-4281-8f77-159541cbacff@redhat.com>
 <ZpgB9kCAxAAXAtSi@slm.duckdns.org>
 <134fc34c-10b8-4d00-aaca-8285efce9899@redhat.com>
 <ZpgMajKn2O521H2s@slm.duckdns.org>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <ZpgMajKn2O521H2s@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_115556_574734_0C83C057 
X-CRM114-Status: UNSURE (   9.70  )
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


On 7/17/24 14:24, tj@kernel.org wrote:
> Hello,
>
> On Wed, Jul 17, 2024 at 02:18:39PM -0400, Waiman Long wrote:
>> Well, it can be confusing whether we are dealing with blkg->iostat or
>> blkg->iostat_cpu. In many cases, we are dealing with iostat_cpu instead of
>> iostat like __blkcg_rstat_flush() and blkg_clear_stat(). So we can't
>> eliminate the use of u64_stats_update_begin_irqsave() in those cases.
> I mean, we need to distinguish them. For 32bits, blkg->iostat has multiple
> updaters, so we can't use u64_sync; however, blkg->iostat_cpu has only one
> updater (except blkg_clear_stat() which I don't think we need to worry too
> much about), so u64_sync is fine.

I was wrong about __blkcg_rstat_flush(). Right, the main updater of 
iostat_cpu is  blk_cgroup_bio_start(). We do need to drop down some 
comment on what is protected by u64_sync and what is by blkg_stat_lock 
though. It can be confusing.

Cheers,
Longman


