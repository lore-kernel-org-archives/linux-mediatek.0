Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC3BC7619A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 08:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BjT5693LkmeOVHrHrg9OFl3pKDlfUwb2i6dlVyPe8Wg=; b=a8gwIxm28j80Sacc+erSu5rMst
	y/xTDIp8prTafJV5dMw0d/VNVGfO9vCgYwZnf5BbcpQYjXwkKY6SzvapCW+9iRf/apacoRcvDkPlS
	oLqtX2BXAjewk6RuzKyAIIwBQQxqB+M35wlimkH4sZF0pTT8N/zG98TxGNlNI6pxmQiQAmCMGfoUm
	uPiwRz2YtQTt2H4h7sCAdSvfGvDxA4XBns0SI4CRGQQ6E04F2GFLBbDW5IaPZVmLa7Pq7u6SKVyqN
	CGoz2Sk65Rb1Y1SRZXuVLxMCyiV2W8+2ezKvKRFAYfBo4+PuKdHePVCAic3GlPSPmeVJCzc9ZfqUt
	6HpVDstQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmVYH-002CpV-2y;
	Wed, 12 Apr 2023 08:10:01 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmVYE-002Co4-14
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Apr 2023 08:10:00 +0000
Received: by mail-wm1-x32c.google.com with SMTP id j1-20020a05600c1c0100b003f04da00d07so1812071wms.1
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Apr 2023 01:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1681286996; x=1683878996;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BjT5693LkmeOVHrHrg9OFl3pKDlfUwb2i6dlVyPe8Wg=;
        b=tdBKKcdmp01gaZYDXIvgXSnxV9II/DFAawQdfYxVyl+az5hVPd3bDMP4gH5ui4Cvzq
         RV+mnkp+k3xhs3gQ15gDDa0WHcAnpVT+ta0PlpD3b2UKyPM+1OKUZlqOEA6twpBZ/2+8
         YdkbIDZkpjG84QEIVrFRllMy9ix/1cVrxqKF0OO22uQOi8NAwUXozAvqqBKPvHFJKXlZ
         IFHoqwI4wQsowCpZ5AQvD+jFvj8C3w8CKlfI758pyAXfre5bP0KWDai8Fb65tZxIXmhZ
         KocDZfxMd2s/lu3gBY0yPcdBQmeW3jLJfe5BeOtHcq76LRyKCjj8Qnq3B+yVTZbswffu
         Vecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681286996; x=1683878996;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BjT5693LkmeOVHrHrg9OFl3pKDlfUwb2i6dlVyPe8Wg=;
        b=fD+WCMC1MwewJUTFwEA804f8zdQ5/SyRvjHdFGQiXBGcEZU8iu3FvcBv9EPvn/LLdu
         /paKHKr5HwVb1IkpAynXPCU+uMRvAP34p4YRworVtISVhq0bqHiNIpssnS9xmDQyIGWa
         shAygpW0bNG2eRgAFalu1AU4X3hJ90qEGYoys35dRtTAJJ6y6boBzQwCT9LANNN0FRvq
         jDSDtzDaQoOIJV1hqkxSRTlEtDPMjEC5iDDiTM9G1q5pyaUfhT7ch8fuP/zO2Ry32ZxB
         cTz8oCgS9GqDBWqNiYrd0yblKsn3LRSWsexRTMjMx5m7Lco2B8tXvPMjO2/W+Hnn3tUU
         X4Ow==
X-Gm-Message-State: AAQBX9ffLbIpz8yH7plllOBF/P5IY/4c0rSGFAmM1vTWYLyjMedyx/Bx
	+h1FXNohIu1/PC+5OeTdwUsweg==
X-Google-Smtp-Source: AKy350YEJwPZniE8//TC7gfkFSg8rDT7jZzdpa2nzZHcJQswQl9dL4pvfJVhWbm2r87wR7iuz84LgA==
X-Received: by 2002:a7b:c413:0:b0:3f0:44d1:3ba7 with SMTP id k19-20020a7bc413000000b003f044d13ba7mr1192399wmi.17.1681286995926;
        Wed, 12 Apr 2023 01:09:55 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id h13-20020a05600c2cad00b003ede2c4701dsm1480286wmc.14.2023.04.12.01.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 01:09:55 -0700 (PDT)
Message-ID: <eb0aab42-961e-a5c1-1898-dac2f8d89e50@baylibre.com>
Date: Wed, 12 Apr 2023 10:09:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] mt76: mt7921: fix kernel panic by accessing unallocated
 eeprom.data
Content-Language: en-US
To: sean.wang@mediatek.com, nbd@nbd.name, lorenzo.bianconi@redhat.com
Cc: Soul.Huang@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, km.lin@mediatek.com,
 jenhao.yang@mediatek.com, robin.chiu@mediatek.com, Eddie.Chen@mediatek.com,
 ch.yeh@mediatek.com, ted.huang@mediatek.com, Stella.Chang@mediatek.com,
 Tom.Chou@mediatek.com, steve.lee@mediatek.com, jsiuda@google.com,
 arowa@google.org, frankgor@google.com, kuabhs@google.com, druth@google.com,
 abhishekpandit@google.com, shawnku@google.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <c9e2a44da4daa00166c802a8c10527359358219d.1681158440.git.objelf@gmail.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <c9e2a44da4daa00166c802a8c10527359358219d.1681158440.git.objelf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_010958_581047_0DD7DDC8 
X-CRM114-Status: UNSURE (   9.40  )
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

On 10/04/2023 22:35, sean.wang@mediatek.com wrote:
> From: Sean Wang<sean.wang@mediatek.com>
> 
> The MT7921 driver no longer uses eeprom.data, but the relevant code has not
> been removed completely since
> commit 16d98b548365 ("mt76: mt7921: rely on mcu_get_nic_capability").
> This could result in potential invalid memory access.
> 
> To fix the kernel panic issue in mt7921, it is necessary to avoid accessing
> unallocated eeprom.data which can lead to invalid memory access.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre


