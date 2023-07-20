Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DF8EB64DC
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 15:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZUaGgshK7tSiuDfJWDqXManELi0SbVivYa4vNiVvwLk=; b=bIG7GOuhmzT3fasILn/gfRjfKx
	AkCZPwnOvfhDnCXh9ZDfEqGpOqyP+qm6q0V/D9zD5dn73ktXXRTz5c1JVfSOTIcsadacb9M21ur6v
	xKAybpIuoUSYLRFXtKhZrrqtd4r1TM7SVWaaHNFnVgWJUdpk8BeN8i9Qq3yEGg4CbHJHBggPLKwnP
	AIMxni4Uy2YbSwgf8BIfDP4aK8zDakkXRWF0Pbv/FXomwsusURgdTgZNL1y1mGmyalbQSoZIDd1CN
	EIroJjJB3WEV+O1ZTwWePjZFx6kzo/GnptkPm411XcTe4F8ubRhW6dkrT0t6Gs5WlKP5ZOZuI2NzD
	myIANFXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMW1P-00BcAS-2K;
	Thu, 20 Jul 2023 15:56:55 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMW1N-00Bc79-0S
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jul 2023 15:56:54 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3141fa31c2bso728072f8f.2
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jul 2023 08:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689868609; x=1690473409;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZUaGgshK7tSiuDfJWDqXManELi0SbVivYa4vNiVvwLk=;
        b=2kcjbWMtu5jkuZoM1057ogV1hCQNF9qQlFv7o7laX7Ec0UwJLiOXiXvPAMcnw+Ooua
         f1cgN0aaXzZuZKlDjK9nH3dFJ3nsMOFHTGZdG+xtxCm/jVu+mHExxhO0vwlg8KwMNGA5
         rga8y6hyrnV66S+kdowSnLuBDzYK+sKIDNk+1AOgyluurTwkrK8ensBP3eO5b+Xkd7dO
         qskxwpKBNT+tyQuUjcRZxwXAgH8KOb3gWINGJZ3731hAPTPWJmsZfcJRqp0edDdL++Kz
         o8ArBZDyuXu64wFuQnJ4hbgsRUJu5y//L7oO99mpWNrPgBxKcfBVPX4u9BcsZHfFHR/x
         Ss5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689868609; x=1690473409;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUaGgshK7tSiuDfJWDqXManELi0SbVivYa4vNiVvwLk=;
        b=AHZeWQ7RKnf4XyW064Del6wFM3sUhU7+zY6T8Uj0r3ob5/4cT5ENjUw/lEROsagqCd
         4qLw9oQ7bqOpQfvUOS0gbbaOGKh3o+Rth3WfZrStzVVwUqiGlc8Gt2yzPgt5qYfG98eG
         DL0KZDZrGMU9ohURYsAME2Fxmx2OLmDTq6lristvtNtEXBJVIU9pEA1bO6F//FX9LkSt
         8RsA2c+Gv38He7F5DsWTcUUymP8cVXQeGV/TpHw7qT2/qhQoDf7uERNlZQHpq5TpQXYN
         UtBvlP/Aw50ZqIvhaDwymkPanturJKeUHPeij+MT92sVSmRocxhdmSqfiqCg2itcRay0
         yY+g==
X-Gm-Message-State: ABy/qLbfFRy4oPEbVEFX6nzvj08QrbrpZ2ouFfWgsEMoQNW/XoLBo/k5
	PbY2iZ5rzKpoi+AV+QcplEH1Ug==
X-Google-Smtp-Source: APBJJlGA2DkEn0lhUqKt4dNDb8D6rF5QRcat3WvydSedezoT3YXG+1Wl3ACqrb3xpAk1dprZGpXTQQ==
X-Received: by 2002:a5d:420f:0:b0:313:f61c:42b2 with SMTP id n15-20020a5d420f000000b00313f61c42b2mr2628545wrq.69.1689868609309;
        Thu, 20 Jul 2023 08:56:49 -0700 (PDT)
Received: from [10.1.3.131] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id q7-20020a5d5747000000b0031434936f0dsm1698149wrw.68.2023.07.20.08.56.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 08:56:48 -0700 (PDT)
Message-ID: <ef08ffa7-436a-5da2-ff46-5697cab6d299@baylibre.com>
Date: Thu, 20 Jul 2023 17:56:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 02/11] drm/mediatek: dp: Move AUX and panel poweron/off
 sequence to function
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 wenst@chromium.org, nfraprado@collabora.com
References: <20230717141438.274419-1-angelogioacchino.delregno@collabora.com>
 <20230717141438.274419-3-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230717141438.274419-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_085653_177233_38B2DA64 
X-CRM114-Status: GOOD (  12.81  )
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

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 17/07/2023 16:14, AngeloGioacchino Del Regno wrote:
> Everytime we run bridge detection and/or EDID read we run a poweron
> and poweroff sequence for both the AUX and the panel; moreover, this
> is also done when enabling the bridge in the .atomic_enable() callback.
> 
> Move this power on/off sequence to a new mtk_dp_aux_panel_poweron()
> function as to commonize it.
> Note that, before this commit, in mtk_dp_bridge_atomic_enable() only
> the AUX was getting powered on but the panel was left powered off if
> the DP cable wasn't plugged in while now we unconditionally send a D0
> request and this is done for two reasons:
>   - First, whether this request fails or not, it takes the same time
>     and anyway the DP hardware won't produce any error (or, if it
>     does, it's ignorable because it won't block further commands)
>   - Second, training the link between a sleeping/standby/unpowered
>     display makes little sense.

-- 
Regards,
Alexandre

