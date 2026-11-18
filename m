Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA1A606A335
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2026 16:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DAaIyTKn;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Z0Hp5GIm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TghilNVkwbKH2zAVmKDZkVzO+5fujCP4ET+Mg8Ax8Os=; b=DAaIyTKnLqn6Ec
	Z8RMNMEPmQ1TKmywxLQM14sptxbQaGrPTVvisSl3QjNZvh7T4U1eCOWO0YEe0kOuKQpKLP/sqVJo1
	AqH77ytlAzP0w8gv97kGfOHjzKySTBPWfO5wlraugnSoV9ztKlGTwjGNqzSH69gotS9MceugBA4j3
	hamMElNMBHRQbW0hxf0ECYqOnbZCdZPyKx/PdSGUiaA3pAt7KU3lFp95MoLpibI0Qm75SePSAsYVk
	Mw5iIGw7j0JeES4EvUgmi/bdMyRrK7YDcOFZbUbMPBHqyHp+bechb8MePvWNGEXIQFCf+HW8fIRCb
	yaJ/JX5c6aMeOXp4xZGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiRZ-00000009SEJ-0dPL;
	Wed, 18 Nov 2026 16:23:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiRU-00000009SAo-1mCw;
	Wed, 18 Nov 2026 16:23:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795019005;
	bh=SpKKAxZ7e8O13VXr++rojMKx6yhQT3thaJt3o0CVOPs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z0Hp5GImTdw3KSMbcw6Tmhrurp4PDt+FjyfQuyUDlCgmQE0GwNNBF4bst8VbAdkzU
	 SV1q3F3VBPryVLo0rH9svtYt6gIYzyUr5CuMjo+4kDLs7tbJgYOX15KUd8sIGHFd2S
	 E85qbpPmDHbu2md9nr3aFcUmfFxDBGlLbJ8iWvUYv/GSlOZ+i00BSpCJjr/qlsyqth
	 v63LMD6X7SN3HshiMU4c9vGj3df/YedeD6EAb/TIjn+lTlu8QCz431hukr+QpUKGPs
	 YldYY2MRAZHvi1dF5wXquUasXaaLiidm/Wi/zoo0LRJilk0fQQB0RxJOzdoyqfO4jP
	 Jd1G+ZQ6txMcw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 17C2317E07EC;
	Wed, 18 Nov 2026 17:23:25 +0100 (CET)
Message-ID: <23e20395-2b5f-44b7-a081-f57cca18b08b@collabora.com>
Date: Wed, 18 Nov 2026 17:23:24 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] power: supply: mt6360_charger: Set the input voltage
 limit in CHG_CTRL6
To: i@udp0.com, Sebastian Reichel <sre@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org
References: <20261107-mt6360-charger-mivr-v1-1-ae6fcfb21bb9@udp0.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261107-mt6360-charger-mivr-v1-1-ae6fcfb21bb9@udp0.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_082329_721473_E414AB2F 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/7/26 12:09, Rui Cao via B4 Relay wrote:
> From: Rui Cao <i@udp0.com>
> 
> mt6360_charger_set_mivr() updates the MIVR field (bits 7:1) of
> CHG_CTRL3, but MIVR lives in CHG_CTRL6, where mt6360_charger_get_mivr()
> reads it and MediaTek's own MT6360 charger driver writes it. CHG_CTRL3
> holds the input current limit (AICR, bits 7:2) instead.
> 
> Writing input_voltage_limit therefore never changed the voltage limit
> and replaced the input current limit with the MIVR selector: 4.5 V, for
> example, set AICR to 250 mA.
> 
> Write the MIVR field of CHG_CTRL6.
> 
> Tested on a Redmi Note 13 5G (MT6833 with an MT6360): with this change,
> writing 4.6 V to input_voltage_limit only moves CHG_CTRL6 from 0x0d to
> 0x0f and reads back as 4.6 V, while CHG_CTRL3 stays at 0x72 and
> input_current_limit at 1.5 A.
> 
> Fixes: 0402e8ebb8b8 ("power: supply: mt6360_charger: add MT6360 charger support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Rui Cao <i@udp0.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

