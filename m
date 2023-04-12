Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA0EC77B6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 11:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Z58+wPfvD+p5o+S8VNFwtMScQl8aprQpHWJgZ+U3OU=; b=1vQkFxTctjcvvRHmvngtzjZADJ
	bwLrT5pimivug6jvlakhp8aQDY+CKBWg0wW2r1vDdPpCcUCvkWDeh7aR0UCfk0+s4ZKh/EGqkvern
	PeXnrM9oiiinlo8fK8//1kYSigiOc/XWK0ugyCUtv6Yf6HJaZpxme9uKU9UlMhH2j3RrAl9dSXZPf
	qsmqtqL+S4137fUKJrckx9pteyk/m2FfShJRHV2iTa86pwEUUEWTR68uB82CwgY8yjFeUt2p6AsC/
	wpr3oblIL+gpfWxUBPyhIS6Tzxute6meH+ZZilzPgolzwDUu1d14bkFOsZoM4/Csj3EUsiAUKWTFi
	Wc01MVsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYi5-002s20-2d;
	Wed, 12 Apr 2023 11:32:21 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYgx-002qle-1h
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Apr 2023 11:31:13 +0000
Received: by mail-wr1-x42f.google.com with SMTP id e7so459378wrc.12
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Apr 2023 04:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1681299067; x=1683891067;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Z58+wPfvD+p5o+S8VNFwtMScQl8aprQpHWJgZ+U3OU=;
        b=eZkhcF/dOhz0Ckpw8NVz22GvTv1jD58LCeC9mw+5xVc0C/55+80j6Lse/9B0XfQCh1
         ZAz5SyRPfGXPLI2DGYaDdu08TzUKJridhzZ6Siwg5jyiFlWk6zbA4DWSxjAVR/Kqlb8c
         p7lDnz08aHx4hHPqetaMGWEyv12sR9fx/vdagFvXcbQfHaaMPEIYc4/PAOdhJHOaonZ+
         J79ANEk2ue6AmIv7XtfrHpWyuiYuGyf4hLJutlcvDBMA6ofE+1oI+Mrk9jyErOcH8Pk6
         yl0vckOq7JlZlT3g8rtc2u1iQqE49HGcEYwK7L36+3CHB90f0rOi1PU99LFYsR6crJd0
         VABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681299067; x=1683891067;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Z58+wPfvD+p5o+S8VNFwtMScQl8aprQpHWJgZ+U3OU=;
        b=8LoSyPbeFeAWeDC3AzRI5cYXDxcu5aRodQSbuOQzoi9cbZWBxX2Cxaobg2xoo+OXG9
         p0p+7aoKyIS2Fw0ObOw9q4O085RNJUJpeP34MyjfcpIsOOFhWsJesZ8zajKPxA2AF0hF
         3fQBGteNxTrErzuOvjdtCu+XZKddMsXIh19D8VWXmmRpILQXixS1Uq1sIALEak9vI7/o
         xTHE1r0QfrYMySH3/UoAn92rv9PqV9iAKrDrU5NYN/6HcvfFk3KjI5CQAnct6gQhGcba
         CnLXiZvbQO9adlx1KBPOvL6x8Y5snvzl4e9Mwe8NQoMBFJsUwDYI6j7B5/A0YXjExBYg
         XE4w==
X-Gm-Message-State: AAQBX9fARCludfBBbalHZGSf+lfxMAJVbyBARgBNJboxHUDVNJN2xbkI
	tPICvDoPfgsX8Kf0c0iOvEmL6w==
X-Google-Smtp-Source: AKy350bIGqULzJb+NuqzNZkYn8IMQuLSq75kr/CLxhxUaQyoTp0R9xpzeez3e/fZqs0Dak6+rMNNDg==
X-Received: by 2002:a05:6000:181:b0:2f0:2de5:c56d with SMTP id p1-20020a056000018100b002f02de5c56dmr9229374wrx.42.1681299067521;
        Wed, 12 Apr 2023 04:31:07 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id z14-20020adfd0ce000000b002c55306f6edsm16935813wrh.54.2023.04.12.04.31.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 04:31:07 -0700 (PDT)
Message-ID: <d2667a9d-20bf-bda2-9d69-4f5000db1633@baylibre.com>
Date: Wed, 12 Apr 2023 13:31:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3] iio: adc: mt6370: Fix ibus and ibat scaling value of
 some specific vendor ID chips
Content-Language: en-US
To: ChiaEn Wu <chiaen_wu@richtek.com>, jic23@kernel.org, lars@metafoo.de,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 peterwu.pub@gmail.com, cy_huang@richtek.com
References: <1681122862-1994-1-git-send-email-chiaen_wu@richtek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <1681122862-1994-1-git-send-email-chiaen_wu@richtek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_043111_582105_41F980BE 
X-CRM114-Status: UNSURE (   7.98  )
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

On 10/04/2023 12:34, ChiaEn Wu wrote:
> The scale value of ibus and ibat on the datasheet is incorrect due to the
> customer report after the experimentation with some specific vendor ID
> chips.
> 
> Fixes: c1404d1b659f ("iio: adc: mt6370: Add MediaTek MT6370 support")
> Signed-off-by: ChiaEn Wu<chiaen_wu@richtek.com>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre


