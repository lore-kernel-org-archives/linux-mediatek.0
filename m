Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D28C54E68
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Mar 2024 09:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y+rBfIRgdxEs51rdHUYVQ/1yd5TKf+EWpb7ciHqkYBQ=; b=kdEiYrOyO1RLtN
	jQ6kkJ1iJYXSLuWir+1Ev8itZu8QLr4Dt0gfSpuUBdkIZ1xZ6oxR1NdSuv7q94IYC1wfyjfyFXues
	Xvgkp/dLLh77GrGqOn4fGs+toPaApFIzC4UgfUl6wz++oFcCl1381nOWCXOhcYpxIoUeWF00RgdIs
	591Z60NDtB3VhOWIjhAjX0iRPAlnHIcn0HYIjyQqHRYOwRBPsFTQR5jdzx1m/uslNAAwIdYC+Rh2n
	6vwe6bNmi/ZGtpAfzyZHqSoFJ/SyA354p1A7GZlmt7YzxSyvdISJMtQeNp2+o6L9dJLEHP6DpwhwD
	7hi3nppgE3z9iyiXhKRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnEpw-00000002VOu-2BXl;
	Thu, 21 Mar 2024 09:35:48 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnEpq-00000002VNS-2czf;
	Thu, 21 Mar 2024 09:35:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 52CC7FF803;
	Thu, 21 Mar 2024 09:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1711013739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y+rBfIRgdxEs51rdHUYVQ/1yd5TKf+EWpb7ciHqkYBQ=;
	b=kbh53oNIAEdV5keF04s/uI5E0To0uvj8OoQ68AdJvnq0A+7IKcBHmCFDbi8kr75Craa13D
	T9iT6zbTzks/LC1LT950Y5LFXg10GlbSbi1M0LNWxR4dQI6nzxKXSN2wsvPZ+pRMJx+bHX
	i3wP/ii9tp8ZA5FKFur5sZ5eKPNzDXbOr7+KS8lTHPE5qWervRh7rlp2G5YVLPhUFGZUy6
	WpdmYLhITI7h3V+L5cB9/vBeams9gkdqEQnI8Mm6OZea3mAnuWVZgcu+7K5leO583caOA6
	d0jXU5sVLwRS6k4CDn+iHidyJfFeh/x2WcK5UFDCW4pcK2RFs1bbo3xFS52Hqg==
Message-ID: <68b7908d-1756-4a0f-b0fc-7c0fb806ff9f@arinc9.com>
Date: Thu, 21 Mar 2024 12:35:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 0/2] MT7530 DSA subdriver fix VLAN egress and
 handling of all link-local frames
To: Paolo Abeni <pabeni@redhat.com>, Daniel Golle <daniel@makrotopia.org>,
 DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20240314-b4-for-net-mt7530-fix-link-local-vlan-v2-0-7dbcf6429ba0@arinc9.com>
 <f6f064b8-efb2-4ab0-94f1-468d5d273d6e@arinc9.com>
 <9762d71f1b3858c6b362696277702409e885fa1d.camel@redhat.com>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <9762d71f1b3858c6b362696277702409e885fa1d.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_023542_844779_D5F231FD 
X-CRM114-Status: GOOD (  11.69  )
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
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, erkin.bozoglu@xeront.com, mithat.guner@xeront.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 21.03.2024 12:29, Paolo Abeni wrote:
> On Wed, 2024-03-20 at 19:41 +0300, Arınç ÜNAL wrote:
>> On 14.03.2024 12:33, Arınç ÜNAL via B4 Relay wrote:
>>> Hi.
>>>
>>> This patch series fixes the VLAN tag egress procedure for link-local
>>> frames, and fixes handling of all link-local frames.
>>>
>>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>>> ---
>>> Changes in v2:
>>> - Add Fixes: tag to both patches.
>>> - Link to v1: https://lore.kernel.org/r/20240311-b4-for-net-mt7530-fix-link-local-vlan-v1-0-d67e6cc31af2@arinc9.com
>>>
>>> ---
>>> Arınç ÜNAL (2):
>>>         net: dsa: mt7530: fix link-local frames that ingress vlan filtering ports
>>>         net: dsa: mt7530: fix handling of all link-local frames
>>>
>>>    drivers/net/dsa/mt7530.c | 52 ++++++++++++++++++++++++++++++++++++++++--------
>>>    drivers/net/dsa/mt7530.h | 22 +++++++++++++++++++-
>>>    2 files changed, 65 insertions(+), 9 deletions(-)
>>> ---
>>> base-commit: d7d75124965aee23e5e4421d78376545cf070b0a
>>> change-id: 20240208-b4-for-net-mt7530-fix-link-local-vlan-af6e9928ad8d
>>>
>>> Best regards,
>>
>> Reminder this patch series is waiting to be applied.
> 
> I hoped to get some feedback from the DSA crew, so it waited a bit in
> patchwork. Anyway it looks like it staged long enough and I'll go
> through it soon.

Vladimir used to help me a lot. I hope everything's okay on their end.

Arınç

