Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541A1C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Oct 2022 06:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WaHAry86QnAz1/I5lkj4bQEPiHAsQ1/Tr/3O9Wh1G78=; b=DjLQN2uDOepT3pzxXiBTWvXHtn
	O2bZ5gJo7D6XEqDCTRH4tr6tdfYBSTIaoPLrWqLMFV3gTs3VKbk9tRqd4w+S4vLeBm3Pm5a6pU4P8
	go3U6VEnPcZaWOh3vGEHrlrFZnH9Sc9gh7/0Zk6RBB0v1NI1JPHPiNwAH3tfoTMe91nEI2GXztDdR
	foUVDoopgk9oG2sIRDAztNPDhndRMy7g/BgIjxykFcXLcVpvM1wzMpfpz+svq4rjaDqsVhhDKzG39
	GsUh+2H3ZEVA5o0e7f/ba+F9YdqhalezYM05yY2tculzVxNWzpFFemA8oCeK64ZJeuHKReJgyWhM1
	zoJV+OPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oirXL-00ApU1-Os; Thu, 13 Oct 2022 06:17:43 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oirXJ-00ApTW-4a
	for linux-mediatek@lists.infradead.org; Thu, 13 Oct 2022 06:17:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9F12BB81CC2;
	Thu, 13 Oct 2022 06:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B70EC433D6;
	Thu, 13 Oct 2022 06:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665641857;
	bh=fCqRqjwspf5o8J5mYashSzNulw/nujWeIOJ5fKOgJCU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=V+QfS0wHd+41GVD/ypWzSFW0Gqd8CvK1iETSVyIRJBcktM4kanvCquU0GmVy+ib1b
	 m/tKQcox4PphIwpl+qXHs/gbQxOOjWuFNOQc9imqvBO9OcIN5kCaBk1des04cjonSE
	 n4k7BgxXJGNnhzZ6xtRrj8sgPQe6G15VuajashvZGz/AOWOlf8DQcvqMaUpoBs1jF4
	 KavhLVrH5oETa0+BJHzDw5PE7Wn5lI4m2Yxwwf6cZee/zEkD2uLt/4x9s+X5fyA/vW
	 W8faWQZ1q/Gt/e1K46V8UijRIoiAwnBD8LbAznLwL7AQ/U4COLq8LlDAC+Dg6qwzHv
	 Y4zvAcCGOw+lw==
From: Kalle Valo <kvalo@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: nbd@nbd.name,  lorenzo.bianconi@redhat.com,  Bo.Jiao@mediatek.com,  sujuan.chen@mediatek.com,  ryder.Lee@mediatek.com,  evelyn.tsai@mediatek.com,  daniel@makrotopia.org,  linux-wireless@vger.kernel.org,  linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/3] wifi: mt76: introduce WED TX support for mt7986 SoC
References: <cover.1664356281.git.lorenzo@kernel.org>
	<87r0zd4mxw.fsf@kernel.org> <Y0aH8T8pTARNWcPE@lore-desk>
Date: Thu, 13 Oct 2022 09:17:31 +0300
In-Reply-To: <Y0aH8T8pTARNWcPE@lore-desk> (Lorenzo Bianconi's message of "Wed,
	12 Oct 2022 11:25:05 +0200")
Message-ID: <87zge0memc.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_231741_344234_35CF2D0E 
X-CRM114-Status: GOOD (  13.69  )
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

Lorenzo Bianconi <lorenzo@kernel.org> writes:

>> Lorenzo Bianconi <lorenzo@kernel.org> writes:
>> 
>> > Enable WED TX support for mt7915 and mt7986-wmac drivers running on MT7986 SoC.
>> 
>> What's WED TX?
>
> It is the same as we did for MT7622. It is the capability to offload traffic
> from lan/wan to wlan. I specified "TX" since MT7986 supports even RX
> offloading (I am working on it at the moment).

It would be nice to mention in the commit log that the feature is about
offloading traffic from lan/wan to wlan. That way it's stored to to git
history and people like me have some clue what the patch is about,
otherwise we are totally in dark.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

