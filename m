Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C52E77198
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Jan 2025 02:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0kD/Qav3CMKX3PRVMdqzDy2KLijr2u/AwaZGORrDsUc=; b=hHIpo5OrrOsERKEwTN2TnwIofm
	qmrF20lMVvgAlvIwVF6gVw2GPSDUmupSHdd+k7nJxWtQlUNQRQsEMEgfFM21xaHnLWf7f3l8EJFdq
	QtRPcoqjI6260v5pvTve8R3OunGV8unM9NtYN+3te9780WE/hKgUhhw1QlNrG1BTcAJ0oCiJkvvno
	FByDhizolf5w0TUa9CC5U92GqhctDTXQhCo6LuwdQNpqeps5Wely9TGvLddS2nJ4eWLg72IBxJ0rj
	XQcWNS1IlHhearqvV3pV1SWSE5sijh7OtrXYF8XjlawNL5nHNE7QkiUSsWvV8NbQUHUYgEY63eTlw
	6X3IXxRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTthr-0000000EMBS-0nfZ;
	Sat, 04 Jan 2025 02:16:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTtgS-0000000EM54-0Jad;
	Sat, 04 Jan 2025 02:14:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 322B25C479D;
	Sat,  4 Jan 2025 02:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 963EBC4CED6;
	Sat,  4 Jan 2025 02:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735956873;
	bh=0kD/Qav3CMKX3PRVMdqzDy2KLijr2u/AwaZGORrDsUc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=r5PP1d60bJO/ZUAmRTfHxP69gUefDKNGx8NTaHR2DeZ0hFRQ9QqFGB0VdUBU20DLG
	 uTT+S8vMxeWTdYWgDvN4Kc5cT25HRXgU9X0Wh6Mya2zVBu6UybjIqnp2HS29eeLmmT
	 lz0fRWXNt2t9kAon2idgnqNntJUpMrnrw/tEePKbK8wxahkKpsSaTW/XKzUs6D9qwr
	 LUaQcjFLWKMBOHaiRkN4TWoONqbd8BsJgrebtN4OA7WmCHETt54x0vzNPGn1At6Hho
	 pn3NY167XjiK19hiATM0dUedOS37mzScDblBtezreYHa3dPodzzF7XDu1v1GNRv80W
	 pM9qfqgIHKR7w==
Date: Fri, 3 Jan 2025 18:14:31 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Shiming Cheng <shiming.cheng@mediatek.com>
Cc: <willemdebruijn.kernel@gmail.com>, <davem@davemloft.net>,
 <dsahern@kernel.org>, <edumazet@google.com>, <pabeni@redhat.com>,
 <horms@kernel.org>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <netdev@vger.kernel.org>,
 <lena.wang@mediatek.com>
Subject: Re: [PATCH net v2] ipv6: socket SO_BINDTODEVICE lookup routing fail
 without IPv6 rule.
Message-ID: <20250103181431.536909ad@kernel.org>
In-Reply-To: <20250103054413.31581-1-shiming.cheng@mediatek.com>
References: <20250103054413.31581-1-shiming.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_181436_173765_1955C61A 
X-CRM114-Status: UNSURE (   8.41  )
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

On Fri, 3 Jan 2025 13:43:49 +0800 Shiming Cheng wrote:
> When using socket IPv6 with SO_BINDTODEVICE, if IPv6 rule is not
> matched, it will return ENETUNREACH. In fact, IPv4 does not behave
> this way. IPv4 prioritizes looking up IP rules for routing and
> forwarding, if not matched it will use socket-bound out interface
> to send packets. The modification here is to make IPv6 behave the
> same as IPv4. If IP rule is not found, it will also use socket-bound
> out interface to send packts.

CI shows failures in tools/testing/selftests/net/fcnal-test.sh
and tools/testing/selftests/net/fib_nexthops.sh with this patch
applied. Could be a flake but please double check before sending v3

