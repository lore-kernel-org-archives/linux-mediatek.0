Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305FDC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 09:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jr+tovB3bIW/mbzBszOJnkjwDQUq4AZUykXrzUHDRSY=; b=cLAEr/YV40t/Ym
	fhmaMMRvI6x+8ReVPSj+dQIR84+2Nq/qDUbNZtk78DaUuPaXKpJik2NM7ilIdV197O272uGfXW+D6
	yGhRLmw+VCp/oKuqKgPgUVZyYGu2eyHAUu1MG5KOxDa9C7nLDAzg3DyUMV+vHXUJ2Y7kiT8i5KICB
	jtBCZbMCrbWHHore3jHr02Xy3YDvL03DHZrOMdaKbQ0leZw/seLL6t4C+wUNjTZqOW1HXuyfUS3EE
	Xah1ARdkvKc4muAS+MOCMD/8rA4N1MEjEBfQoOOa9+opn+T6iwHqjyG6jlLtG92fJ3kkx1JMuz6zZ
	rA5q18eH2LYE80J+LpMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt4pk-0032bA-H6; Mon, 23 May 2022 09:58:40 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt3ts-002dON-2O; Mon, 23 May 2022 08:58:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 450081F42575
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653296330;
 bh=7UgM4ruQTstnqIM046Xou/g3stt98V447+t6kKN3sCU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=N9rC/Ny9ej6qs7tbI98vVloYt0/LslMcDJWyfytwwtWbuJaejzOu6yd3Gt1b6ALRm
 QFS6d4Jbz3rk5xnH5/NqW/IyuFCota2t7OOysSaNShon1S5NyjSCD5AqE2Nm9Y++Ek
 vQBno/8lebbuo7ueDf8lq4Vy9XZ1KC9tBSazzSMqikgpS6mgRArJXFBL+Z3kJbzz79
 L+lfQtQVL8gKCzTvNPKR7fhiO4tTAt7zPGPWlgpuYmf2F6f0/z/2sMAm5WMFZps3GF
 +4tHF2/D5RHtc/3kAQ09K/zT8pb2C/32Au6Gf/4JzYh92mSr1Md4me9tMl8X6FHYb8
 7LGpECA+lXTiA==
Message-ID: <926ce818-4f42-898d-aca8-185b5c7434ba@collabora.com>
Date: Mon, 23 May 2022 10:58:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/5] Input: mtk-pmic-keys - Use regmap_{set,clear}_bits
 where possible
Content-Language: en-US
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: matthias.bgg@gmail.com, mkorpershoek@baylibre.com,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220520125132.229191-1-angelogioacchino.delregno@collabora.com>
 <20220520125132.229191-3-angelogioacchino.delregno@collabora.com>
 <YosS0ZvAovyl8cF5@google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <YosS0ZvAovyl8cF5@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_015852_405737_EC163D09 
X-CRM114-Status: GOOD (  16.16  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 23/05/22 06:51, Dmitry Torokhov ha scritto:
> On Fri, May 20, 2022 at 02:51:29PM +0200, AngeloGioacchino Del Regno wrote:
>> Instead of always using regmap_update_bits(), let's go for the shorter
>> regmap_set_bits() and regmap_clear_bits() where possible.
>>
>> No functional change.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/input/keyboard/mtk-pmic-keys.c | 24 ++++++------------------
>>   1 file changed, 6 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
>> index 8e4fa7cd16e6..83d0b90cc8cb 100644
>> --- a/drivers/input/keyboard/mtk-pmic-keys.c
>> +++ b/drivers/input/keyboard/mtk-pmic-keys.c
>> @@ -157,28 +157,16 @@ static void mtk_pmic_keys_lp_reset_setup(struct mtk_pmic_keys *keys,
>>   
>>   	switch (long_press_mode) {
>>   	case LP_ONEKEY:
>> -		regmap_update_bits(keys->regmap, pmic_rst_reg,
>> -				   MTK_PMIC_PWRKEY_RST,
>> -				   MTK_PMIC_PWRKEY_RST);
>> -		regmap_update_bits(keys->regmap, pmic_rst_reg,
>> -				   MTK_PMIC_HOMEKEY_RST,
>> -				   0);
>> +		regmap_set_bits(keys->regmap, pmic_rst_reg, MTK_PMIC_PWRKEY_RST);
>> +		regmap_clear_bits(keys->regmap, pmic_rst_reg, MTK_PMIC_HOMEKEY_RST);
> 
> Why not combine this into a single update instead? I.e. assuming
> 

All downstream kernels (at least, I checked 4 different kernel versions for 4
different SoCs) are doing these updates one-at-a-time, never combining them.

Even though I agree with you about one single update being simply more logical,
I am afraid that (on some SoCs) the IP will not like that so - since I don't have
any *clear* documentation saying that this is possible, or that this is not, I
would leave it like that.


> #define MTK_PMIC_KEY_RST_MASK GENMASK(6, 5)
> 
> 		regmap_update_bits(keys->regmap, pmic_rst_reg,
> 				   MTK_PMIC_KEY_RST_MASK,
> 				   MTK_PMIC_PWRKEY_RST);
> 
>>   		break;
>>   	case LP_TWOKEY:
>> -		regmap_update_bits(keys->regmap, pmic_rst_reg,
>> -				   MTK_PMIC_PWRKEY_RST,
>> -				   MTK_PMIC_PWRKEY_RST);
>> -		regmap_update_bits(keys->regmap, pmic_rst_reg,
>> -				   MTK_PMIC_HOMEKEY_RST,
>> -				   MTK_PMIC_HOMEKEY_RST);
>> +		regmap_set_bits(keys->regmap, pmic_rst_reg, MTK_PMIC_PWRKEY_RST);
>> +		regmap_set_bits(keys->regmap, pmic_rst_reg, MTK_PMIC_HOMEKEY_RST);
> 
> 		regmap_update_bits(keys->regmap, pmic_rst_reg,
> 				   MTK_PMIC_KEY_RST_MASK,
> 				   MTK_PMIC_PWRKEY_RST | MTK_PMIC_HOMEKEY_RST);
> 
>>   		break;
>>   	case LP_DISABLE:
>> -		regmap_update_bits(keys->regmap, pmic_rst_reg,
>> -				   MTK_PMIC_PWRKEY_RST,
>> -				   0);
>> -		regmap_update_bits(keys->regmap, pmic_rst_reg,
>> -				   MTK_PMIC_HOMEKEY_RST,
>> -				   0);
>> +		regmap_clear_bits(keys->regmap, pmic_rst_reg, MTK_PMIC_PWRKEY_RST);
>> +		regmap_clear_bits(keys->regmap, pmic_rst_reg, MTK_PMIC_HOMEKEY_RST);
> 
> 		regmap_update_bits(keys->regmap, pmic_rst_reg,
> 				   MTK_PMIC_KEY_RST_MASKi, 0);
> 
>>   		break;
>>   	default:
>>   		break;
>> -- 
>> 2.35.1
>>
> 
> Thanks.
> 




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
