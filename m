Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A5FC05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 11:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UAdLTSx9aZVPgU2yXpW13ESsr057NA3ZhA2Ul60b64I=; b=yiDmluMPEtUxtL8BII2t+weQfY
	x/Gs6To6gxPm82HXH6s2ikVBAASixk8kH0hBi46/G7NkWL9Vjc8tXveaJqhq5Vio6W1fXw9sqVGl+
	VFzHls9SaNxaafohCeM7pHjNu5mzJLMFp09RBKXZMlA5bzaDs1G9apbtGfj5BPTaG3+pgJwltPnkX
	t11ZVTy9ceK7qWj7b8xdK7LWG6K3i6yr6zJ9t3QcFzoAt8Ieo+UEJf92PHqFyuHLCwuCQCVzioKJE
	s/47ufnXVwZPF0E8m0pdLmvRqcYm2M7wzJERx1R+n6avGy7MqzNUEPC+guUhKN7CwTgjvlBbhqn5A
	wNZ3Hjfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNB1N-00BPwg-PC; Wed, 01 Feb 2023 11:11:21 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNB1E-00BPsy-3f; Wed, 01 Feb 2023 11:11:13 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 1AD52165B;
	Wed,  1 Feb 2023 12:11:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1675249870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UAdLTSx9aZVPgU2yXpW13ESsr057NA3ZhA2Ul60b64I=;
	b=2HqGAuAzLYYlhRsUU3EiKYIn/RqES/gaEF/Smvw1qlXTRS4rWCeA49iESbGNoMmJJw3vwb
	fp0lq+m0UqYUxi6L6kIwZ/GY3u2vZa5QqiWj9zzJbMLnwYnN+gUePW3U9dnfTmHZsYuU4T
	Bx18zZ+50cyykmEz3Unpt6uFTmTchoN3AqczpFcULJvWTn4CqusZyfqymhvTibbuV9DACI
	lhMN57a8qJWGmxu4Udh+xuhlfDkJXFTJdPsiERjlFaE63jK/83RjQuXjd0jtcJQbr6yHlM
	1Vfn9NUYmaoV3069OvHsKN3TN+dBLPDY10DJxgIh7TCyFGzz6YBEXA8bB4p+5w==
MIME-Version: 1.0
Date: Wed, 01 Feb 2023 12:11:09 +0100
From: Michael Walle <michael@walle.cc>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: devicetree@vger.kernel.org, hayashi.kunihiko@socionext.com,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, mhiramat@kernel.org, rafal@milecki.pl,
 robh+dt@kernel.org, srinivas.kandagatla@linaro.org
Subject: Re: [PATCH 3/4] nvmem: mtk-efuse: replace driver with a generic MMIO
 one
In-Reply-To: <618392ed-7d20-a49f-1ec5-b27850d71dec@gmail.com>
References: <20230201064717.18410-4-zajec5@gmail.com>
 <20230201084821.1719839-1-michael@walle.cc>
 <8452b341-8695-05d8-9d03-47c9aeca0ec7@gmail.com>
 <017a17eb99ac2b2c858d27b65c5dd372@walle.cc>
 <618392ed-7d20-a49f-1ec5-b27850d71dec@gmail.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <9c17f253542610da58f843b920e63f4a@walle.cc>
X-Sender: michael@walle.cc
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_031112_352539_DA7F02E5 
X-CRM114-Status: UNSURE (   6.95  )
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

>> nitpick btw: why not "nvmem-mmio"?
> 
> Because I read from left to right ;)

if you have more compatibles do you prefer

  a-grp
  bcdef-grp
  gh-grp

or

  grp-a
  grp-bcdef
  grp-gh

To my eyes the latter looks nicer, but it's just a matter of taste ;)

-michael

