Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F79BC54EBD
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 08:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fjaW0AKsz0XwH3czs0gOtSoZ9GFwMX3dHRXY6veioIM=; b=rerw7crDBCnWyaKp0rmwKeoRdm
	duCdAMGBzJshzE30//5UXD4o7dIh0zynoDsrbB1/CA2XWhzifX0r88SFU1iBPO31R9W+e0tHgLGE9
	jypMlJxaYbmEumVEmuRHuWvOsym5n+lmznZVXXA1V1Tp/Amwm3uWVfqL+gJURFe/E4sU6QIltMGYO
	soOiROFztGCB1xK0sdV85ZntopprzG7TZvWoLeZRd84UEb9KFzSRAD/4n5OcMV3yDkNz/WCcErEys
	5m9T4P+iHWi8N4XL7o0/0hsyXxBm9sIYsSi/5CI4gsFxYsjQh4nBzg6wbuF5pc3Qx0frdzvc1eerW
	8KqOZQHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFAG-0018PU-FW; Fri, 13 Jan 2023 08:11:52 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFA5-0018NU-9w; Fri, 13 Jan 2023 08:11:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 07DD4B820CB;
	Fri, 13 Jan 2023 08:11:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 398CCC433EF;
	Fri, 13 Jan 2023 08:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673597497;
	bh=DJouDT5lhPUbU7anaQI3h0jmuQGiHZvzy1TF8vdqLbU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cC4GXKs1uAhxo4jHFGJrBIVvOlBUpnn3TsYxxkupYC1jhNg5dBa4TCQSFxvBuuDyd
	 qNfVmqTolmY7h1mXpwyzFJtHLGXhYj5hpxJbJ46qvqRkuMqnDOGX2iq1Wl2OKQIl6k
	 W4ITasqcS8Q05Pmh779uygdHcz4ZipZb4SOq2zQQsjWgDR3IRG35SZjeFbfr3UmJ8g
	 vPwRF/wfDiMHG8gE2Ej6JNMIO3uVJIt9JBV78vp5P11JQAAY33MQ/Eudag6enremfY
	 0rjdN3wsJjJeRjxhgqP/OVeS4LnbRrdXDPRJFN4U4dYDHIThiHBBpYRuLKZxAbOnxM
	 BjueR1WOmL2rQ==
Message-ID: <13262366-49f3-2a34-6772-9500461512d4@kernel.org>
Date: Fri, 13 Jan 2023 09:11:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 2/6] dt-bindings/thermal/mediatek: Add dt-binding
 document for LVTS thermal controllers
To: bchihi@baylibre.com, daniel.lezcano@linaro.org, rafael@kernel.org,
 amitk@kernel.org, rui.zhang@intel.com
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com
References: <20230112152855.216072-1-bchihi@baylibre.com>
 <20230112152855.216072-3-bchihi@baylibre.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230112152855.216072-3-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_001141_542687_7D1FE258 
X-CRM114-Status: UNSURE (   8.90  )
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

On 12/01/2023 16:28, bchihi@baylibre.com wrote:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Add dt-binding document for mt8192 and mt8195 LVTS thermal controllers.

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

You skipped several lists and maintainers. Resend.

Best regards,
Krzysztof


