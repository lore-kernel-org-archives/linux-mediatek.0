Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D971FECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 14:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UtbBjtOCDmxG1fiAjntsLrhrfFgg1H/OVy+mHU9Tdic=; b=vGESmJdrzM4EAUvHH9GQoRuCOe
	dTEKdzwm0J03cWDG9dYFJ07+xnaP+0mSf5TMoit1g3ScO3I3mHX4FzYx2BxFDkfou7xF1H6HPoK4u
	pKe8cs6Ok2gsWvA8/TWue60E24VeQ9gzVBwoJvuLPW3EjqZHL5O1XQtq31aRxHOSvepoL6b0jA27T
	R521AeeOC2O6ah67eV0LifFLuijk4SXqBPQkpO4LS+H5El1dRFPydITb+dnVfaoDRA5kmNg/vaI3f
	mKBWWQkHhjemtcLu1ZUi82Mg+liDK/7RIGqtUUP1/eyHwujk5NS39af59CI1x0R+ncsfabrh8XMMs
	f+ULn13Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooQj6-000HUi-0z; Fri, 28 Oct 2022 14:52:52 +0000
Received: from ms.lwn.net ([2600:3c01:e000:3a1::42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooQe1-000FH9-3z; Fri, 28 Oct 2022 14:47:38 +0000
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0623260C;
	Fri, 28 Oct 2022 14:47:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0623260C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1666968454; bh=UtbBjtOCDmxG1fiAjntsLrhrfFgg1H/OVy+mHU9Tdic=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YPUMK7NbZEWiVJxDd81wBZav9MFex8t217mE4PTTWDl1Wycu8GM6Ea9a1vRzQ6K4s
	 LB7lTKlSS1ZmpG7NdF0hatynkN3t1WCNrag2zPTpYp8Msw6DjzzGxXOLTagWQfStM5
	 OpzNr69zoX0ZplnOKZjT7c3Gdpe26YiCH/GCuvVKjggGKnoYVlW8q52BozogUqaHaf
	 lqbfUUsSLqzTySycQ7oJUAd39iZ6MnYN5bJxYZfwTw6xy6OrG5GkA6RIbXH+7RLbyz
	 i9pvY3yXqHCvRhxsT6z+QxdZ90sNaW8G8ij9tPpOZYwQ1kmZ7kWl3ddSJDgLnmf13s
	 uYKklGhEZ+f3w==
From: Jonathan Corbet <corbet@lwn.net>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>, bagasdotme@gmail.com
Cc: Brian.Starkey@arm.com, benjamin.gaignard@collabora.com,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 jstultz@google.com, labbott@redhat.com, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 lmark@codeaurora.org, mark-pk.tsai@mediatek.com, matthias.bgg@gmail.com,
 sumit.semwal@linaro.org, yj.chiang@mediatek.com
Subject: Re: [PATCH v2] dma-buf: cma_heap: Fix typo in comment
In-Reply-To: <20221028065907.23954-1-mark-pk.tsai@mediatek.com>
References: <Y1tSWo+eRvkVofbv@debian.me>
 <20221028065907.23954-1-mark-pk.tsai@mediatek.com>
Date: Fri, 28 Oct 2022 08:47:33 -0600
Message-ID: <87k04k6m4a.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_074737_197655_0ED4830D 
X-CRM114-Status: GOOD (  10.85  )
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

Mark-PK Tsai <mark-pk.tsai@mediatek.com> writes:

>> [-- Attachment #1: Type: text/plain, Size: 349 bytes --]
>> 
>> On Fri, Oct 28, 2022 at 09:44:17AM +0800, Mark-PK Tsai wrote:
>> > Remove duplicated "by" from comment in cma_heap_allocate().
>> > 
>> 
>> This patch isn't typofix but duplicate word stripping, right? If so, the
>> patch subject should be "dma-buf: cma_heap: Remove duplicated 'by'".
>
> Okay, I've update the title in v3.
> Sorry for the horrible commit description.
> Thanks.

Your original commit description was just fine, you just had the bad
luck to draw the attention of somebody who likes telling other
contributors what to do.

Thanks,

jon

