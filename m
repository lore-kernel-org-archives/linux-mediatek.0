Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88372C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Nov 2023 12:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mrTtYWOVWxJ8xmSVQu6CJexZ9AJuRGmtLpQYzOlwFok=; b=a3/2YpoRrgZ+kLaBUxfHA5Xmrb
	jATarVBxIMntMrsDtQU1gaK8gjqFXq0gmjmdeb1LIUcoaBbth6cAznpSec3dQhvLj9PIaJu0ZjtOl
	gwxRQ5fwN6EH56KImJdTNZvMICeT+KfBNQv1HtNpyAzt/J3XUgCpCtTz2eNR2uW7/M73NyJYj8JWN
	9QhHoK1rZuh2amoAPEXe+Nb4kxJJ+KiKr5PEC54fZield+uYbokS3My89uUBZve9AEqzRdmj4nFdD
	Y0mXe6VbFziGz6nIcZVblZyRQfApbCkzraIbwISF7pSbYPK3JGVDAkAzv+SMO4PuPAMfIZwJEHTfD
	paDAkkYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7bAk-002UzU-2K;
	Mon, 27 Nov 2023 12:57:10 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7bAg-002Uxu-26;
	Mon, 27 Nov 2023 12:57:08 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D6FA166057B6;
	Mon, 27 Nov 2023 12:57:02 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701089823;
	bh=FySumCrnHCkLNmJr8XJVzT+Zu5nrGGp8D2JVx0dI6Zo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=czRxqj4tLuvWQ5UN0mnq/93x90RSVWFH35tTAHbAW0OSwJVBHmH1X2MrmkWHwaICV
	 bUtG8Jf5AIoa0pmZJV6J5FP9ep6l46xRsB3zFdZFGxdtEwzu2jQS4Yp8iAn4Z5aj6/
	 VWMv9pOz+yCjc6nfvFOZKzvXSoCcahu85stn8cr2qUv0Up8YMLdY7e0Zi8gDOgA5CU
	 LLEMq8VotLORUfZY8pYGpaAAeeqpVnJMu4dCTAZeJUIMBHHNgsr/hFlzkJAvykPIIq
	 kP3IX81JYE/rpiTQOe1PIvKjuz7ki4C4z1cNvMm+R7q5YAUayolMzQVbwHddH5F7B1
	 7oMhPCh6e1kOQ==
Message-ID: <12601252-5a90-40cf-b634-493219cebf38@collabora.com>
Date: Mon, 27 Nov 2023 13:57:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: mediatek: mt6358: Merge ldo_vcn33_*
 regulators
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230913084457.1638690-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230913084457.1638690-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_045707_215401_88369D99 
X-CRM114-Status: UNSURE (   7.07  )
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

On Wed, 13 Sep 2023 16:44:56 +0800, Chen-Yu Tsai wrote:
 > The ldo_vcn33_bt and ldo_vcn33_wifi regulators are actually the same
 > regulator, having the same voltage setting and output pin. There are
 > simply two enable bits that are ORed together to enable the regulator.
 >
 > Having two regulators representing the same output pin is misleading
 > from a design matching standpoint, and also error-prone in driver
 > implementations.
 >
 > [...]

Applied, thanks!

[1/1] arm64: dts: mediatek: mt6358: Merge ldo_vcn33_* regulators
       commit: 2a19d6609722b40d0f44337d56ee75a69a69aeab

Regards,
Angelo

